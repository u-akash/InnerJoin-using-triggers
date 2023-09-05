/* Using a database and inserting three tables to join them via inner join, 
and to demonstrate other functions in these tables*/
-- Database creation 
create database student_info;
use student_info;
-- Creating a table and inserting values for "course_information"
create table course_information (course_id int, course_name varchar(5), primary key(course_id));
insert into course_information values
(1,	'CMA'),
(2,	'CA');
delete from course_information where course_id = 1; 
insert into course_information values
(1,	'CMA'),
(3,	'CS');
select * from course_information;
select * from course_information 
where course_id like 2;
select * from course_information 
where course_id in (1,3);
select course_name from course_information
where course_id = 2 or course_id like 4;
select * from course_information
where course_id between 1 and 3;
select * from course_information
where course_name = 'cs';
select * from course_information
where course_name like 'c%';
select * from course_information
where course_name like '%s';
select * from course_information
where course_name like 'c%a';
-- Creating a table and inserting values for "Student_information"
create table Student_information (student_id int primary key, student_name varchar(30), city varchar(30), 
age int not null, roll_no int not null,mode_of_study varchar(30), course_id int, 
foreign key(course_id) references course_information(course_id));
describe student_information;
insert into student_information values
(1,	'Vincent ',	'Edinburgh',	21,	13001,	'Full Time',	1),
(2,	'Gary ',	'Liverpool',	20,	13002,	'Part Time',	1),
(3,	'George ',	'Manchester',	18,	13003,	'Online',	1),
(4,	'Manny ',	'Bristol',	24,	13004,	'Full Time',	1),
(5,	'Martin ',	'Cardiff',	18,	13005,	'Part Time',	2),
(6,	'Amanda ',	'London',	17,	13006,	'Online',	2),
(7,	'Jack ',	'Glasgow',	24,	13007,	'Full Time',	2),
(8,	'Patricia ',	'Edinburgh',	23,	13008,	'Part Time',	2),
(9,	'Arthur ',	'Liverpool',	17,	13009,	'Online',	3),
(10,	'Kevin ',	'Manchester',	24,	13010,	'Full Time',	3),
(11,	'Monica ',	'Bristol',	17,	13011,	'Part Time',	3),
(12,	'Susan ',	'Cardiff',	23,	13012,	'Online',	3),
(13,	'Aaron ',	'London',	22,	13013,	'Full Time',	3),
(14,	'Debra ',	'Glasgow',	20,	13014,	'Part Time',	1),
(15,	'Cindy ',	'Edinburgh',	22,	13015,	'Online',	1),
(16,	'Madison ',	'Liverpool',	20,	13016,	'Full Time',	1),
(17,	'Sarah ',	'Manchester',	17,	13017,	'Part Time',	1),
(18,	'Selena ',	'Bristol',	22,	13018,	'Online',	3),
(19,	'Paula ',	'Cardiff',	19,	13019,	'Full Time',	1),
(20,	'Lucy ',	'London',	17,	13020,	'Part Time',	2),
(21,	'Vernon ',	'Glasgow',	21,	13021,	'Online',	1),
(22,	'Paul ',	'Edinburgh',	21,	13022,	'Part Time',	1),
(23,	'Vance',	'Liverpool',	20,	13023,	'Online',	2),
(24,	'Debbie ',	'Manchester',	20,	13024,	'Full Time',	3),
(25,	'Devin ',	'Bristol',	21,	13025,	'Part Time',	1),
(26,	'Keith ',	'Cardiff',	17,	13026,	'Online',	2),
(27,	'Vincent ',	'London',	24,	13027,	'Full Time',	1),
(28,	'Roger',	'Glasgow',	24,	13028,	'Full Time',	3);
select * from student_information;
drop table course_information;
select distinct(city) from student_information;
select * from student_information
where char_length(student_name) = 5;
select distinct city from student_information
where length(city) like 10;
select count(student_name) from student_information;
select * from student_information order by student_id desc
limit 10,20;
select * from student_information
where city = 'london' and age <= 26;
select *  from student_information
where city like 'l%l' and age != 26;
select * from student_information
where city like '%h' and age <> 20;
select * from student_information
where city like 'b%' and age >= 17; 
-- Creating a table and inserting values for "Marks_info"
create table Marks_info (marks_id int primary key, student_id int, foreign key(student_id) references 
Student_information(student_id), finance int not null, operations int not null, marketing int not null); 
insert into Marks_info values
(14001,	1,	75,	76,	65),
(14002,	2,	92,	90,	19),
(14003,	3,	38,	37,	46),
(14004,	4,	39,	90,	58),
(14005,	5,	34,	89,	20),
(14006,	6,	44,	38,	60),
(14007,	7,	50,	26,	98),
(14008,	8,	59,	78,	82),
(14009,	9,	89,	47,	88),
(14010,	10,	20,	25,	100),
(14011,	11,	74,	50,	100),
(14012,	12,	81,	62,	31),
(14013,	13,	60,	19,	33),
(14014,	14,	77,	22,	23),
(14015,	15,	68,	38,	35),
(14016,	16,	31,	60,	83),
(14017,	17,	83,	53,	79),
(14018,	18,	37,	79,	88),
(14019,	19,	55,	76,	76),
(14020,	20,	25,	40,	81),
(14021,	21,	38,	87,	48),
(14022,	22,	84,	63,	72),
(14023,	23,	80,	44,	64),
(14024,	24,	53,	46,	59),
(14025,	25,	79,	48,	94),
(14026,	26,	48,	66,	70),
(14027,	27,	61,	45,	74),
(14028,	28,	24,	95,	58);
select * from marks_info;
select min(operations) from marks_info;
select max(operations) from marks_info;
drop table student_information;
-- Creating and calling a Procedure "Get_Student_Grades()"
Delimiter //
create procedure Get_Student_Grades()
Begin
select Student_information.student_id as Serial_no, Student_information.student_name as Student, Student_information.City, 
Student_information.Age, Student_information.Roll_no, Student_information.Mode_of_study,
Marks_info.Marks_ID, Marks_info.Finance, Marks_info.Marketing, Marks_info.Operations, 
course_information.course_id as Course_ID, course_information.course_name as Course,
(Marks_info.finance + Marks_info.marketing + Marks_info.operations) as Total,
round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,2) as Average,
concat(round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0), "%") as Percent,
case
when Marks_info.finance >= 40 and Marks_info.marketing >= 40 and Marks_info.operations >= 40 then "Pass"
else "Fail"
end as Result,
case
when Marks_info.finance >= 40 and Marks_info.marketing >= 40 and Marks_info.operations >= 40 then
case
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 80
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 100 then "Distinction"
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 60
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 79 then "Merit"
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 40
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 59 then "Pass"
end
else "No Grade"
end as Grade
from student_information
inner join Marks_info
on student_information.student_id = Marks_info.student_id
inner join course_information
on student_information.course_id = course_information.course_id
order by Serial_no;
END //
delimiter ;
call Get_Student_Grades;
-- Trigger function using HAVING
Create table Graduates 
select Student_information.student_id as Serial_no, Student_information.student_name as Student, Student_information.City, 
Student_information.Age, Student_information.Roll_no, Student_information.Mode_of_study,
Marks_info.Marks_ID, Marks_info.Finance, Marks_info.Marketing, Marks_info.Operations, 
course_information.course_id as Course_ID, course_information.course_name as Course,
(Marks_info.finance + Marks_info.marketing + Marks_info.operations) as Total,
round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,2) as Average,
concat(round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0), "%") as Percent,
case
when Marks_info.finance >= 40 and Marks_info.marketing >= 40 and Marks_info.operations >= 40 then "Pass"
else "Fail"
end as Result,
case
when Marks_info.finance >= 40 and Marks_info.marketing >= 40 and Marks_info.operations >= 40 then
case
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 80
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 100 then "Distinction"
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 60
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 79 then "Merit"
when round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) >= 40
and round((Marks_info.finance + Marks_info.marketing + Marks_info.operations)/3,0) <= 59 then "Pass"
end
else "No Grade"
end as Grade
from student_information
inner join Marks_info
on student_information.student_id = Marks_info.student_id
inner join course_information
on student_information.course_id = course_information.course_id
having Grade != "No Grade"
order by Serial_no;
select * from Graduates;






