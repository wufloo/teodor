-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Okt 30, 2014 kell 05:11 PL
-- Serveri versioon: 5.6.20
-- PHP versioon: 5.5.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Andmebaas: `teodor`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(10) unsigned NOT NULL,
  `group_name` varchar(25) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `group`
--

INSERT INTO `group` (`group_id`, `group_name`) VALUES
  (1, 'gr-1');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(10) unsigned NOT NULL,
  `person_name` varchar(70) NOT NULL,
  `username` varchar(25) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Andmete tõmmistamine tabelile `person`
--

INSERT INTO `person` (`person_id`, `person_name`, `username`, `is_admin`, `password`, `active`, `email`, `deleted`) VALUES
  (1, 'Sammal Habe', 'sammal.habe', 1, 'sammal', 0, '', 0),
  (2, 'King Pool', 'king.pool', 1, 'king', 0, '', 0),
  (3, 'Muh V', 'muh.v', 0, 'muh', 0, '', 0);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `person_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `student`
--

INSERT INTO `student` (`person_id`, `group_id`) VALUES
  (2, 1),
  (3, 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_id` int(10) unsigned NOT NULL,
  `subject_name` varchar(70) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Andmete tõmmistamine tabelile `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`) VALUES
  (1, 'Metsateadused'),
  (2, 'Ornitoloogia');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `person_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `teacher`
--

INSERT INTO `teacher` (`person_id`) VALUES
  (1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
CREATE TABLE IF NOT EXISTS `teacher_subjects` (
  `person_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `teacher_subjects`
--

INSERT INTO `teacher_subjects` (`person_id`, `subject_id`) VALUES
  (1, 1),
  (3, 1),
  (1, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `test_id` int(10) unsigned NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `test_max_allowed_time` timestamp NULL DEFAULT NULL,
  `test_max_allowed_attempts` int(10) unsigned DEFAULT NULL,
  `test_min_score` int(10) DEFAULT NULL,
  `person_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `lecture_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Andmete tõmmistamine tabelile `test`
--

INSERT INTO `test` (`test_id`, `test_name`, `test_max_allowed_time`, `test_max_allowed_attempts`, `test_min_score`, `person_id`, `subject_id`, `lecture_id`) VALUES
  (1, 'Metsateaduste töö', '2014-10-12 21:15:00', 3, NULL, 1, 1, NULL),
  (9, 'zooloogia', NULL, NULL, NULL, 1, NULL, NULL),
  (10, 'botaanika', NULL, NULL, NULL, 1, NULL, NULL),
  (11, 'geoloogia', NULL, NULL, NULL, 1, NULL, NULL),
  (12, 'bioloogia', NULL, NULL, NULL, 1, NULL, NULL),
  (13, 'matemaatika', NULL, NULL, NULL, 1, NULL, NULL),
  (14, 'keemia', NULL, NULL, NULL, 1, NULL, NULL),
  (15, 'füüsika', NULL, NULL, NULL, 1, NULL, NULL),
  (16, 'klaabu', NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `test_participants`
--

DROP TABLE IF EXISTS `test_participants`;
CREATE TABLE IF NOT EXISTS `test_participants` (
  `person_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `test_started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_ended_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `test_participants`
--

INSERT INTO `test_participants` (`person_id`, `test_id`, `test_started_at`, `test_ended_at`) VALUES
  (2, 1, '2014-10-13 13:20:38', '2014-10-13 13:20:38');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `test_question`
--

DROP TABLE IF EXISTS `test_question`;
CREATE TABLE IF NOT EXISTS `test_question` (
  `test_question_id` int(10) unsigned NOT NULL,
  `test_question_text` text NOT NULL,
  `test_question_score` float NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `test_question_type_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Andmete tõmmistamine tabelile `test_question`
--

INSERT INTO `test_question` (`test_question_id`, `test_question_text`, `test_question_score`, `test_id`, `test_question_type_id`) VALUES
  (1, 'Kas mets mühiseb?', 2, 1, 1),
  (2, 'Mitu puud moodustavad metsa?', 1, 1, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `test_question_answer`
--

DROP TABLE IF EXISTS `test_question_answer`;
CREATE TABLE IF NOT EXISTS `test_question_answer` (
  `test_question_answer_id` int(10) unsigned NOT NULL,
  `test_question_answer_text` text NOT NULL,
  `test_question_correct` tinyint(3) unsigned NOT NULL,
  `test_question_type_id` int(10) unsigned NOT NULL,
  `test_question_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Andmete tõmmistamine tabelile `test_question_answer`
--

INSERT INTO `test_question_answer` (`test_question_answer_id`, `test_question_answer_text`, `test_question_correct`, `test_question_type_id`, `test_question_id`) VALUES
  (1, 'jah', 1, 1, 1),
  (2, 'ei', 0, 1, 1),
  (3, 'üks', 0, 2, 2),
  (4, 'kaks', 0, 2, 2),
  (5, 'palju', 1, 2, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `test_question_type`
--

DROP TABLE IF EXISTS `test_question_type`;
CREATE TABLE IF NOT EXISTS `test_question_type` (
  `test_question_type_id` int(10) unsigned NOT NULL,
  `test_question_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Andmete tõmmistamine tabelile `test_question_type`
--

INSERT INTO `test_question_type` (`test_question_type_id`, `test_question_type_name`) VALUES
  (1, 'true/false'),
  (2, 'multiple choice'),
  (3, 'multiple response'),
  (4, 'fill in the blank');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `thesis`
--

DROP TABLE IF EXISTS `thesis`;
CREATE TABLE IF NOT EXISTS `thesis` (
  `thesis_id` int(10) unsigned NOT NULL,
  `thesis_title` varchar(255) NOT NULL,
  `person_id_author` int(10) unsigned NOT NULL,
  `person_id_instructor` int(10) unsigned DEFAULT NULL,
  `thesis_instructor_confirmed_at` timestamp NULL DEFAULT NULL,
  `thesis_title_confirmed_at` timestamp NULL DEFAULT NULL,
  `thesis_defended_at` timestamp NULL DEFAULT NULL,
  `thesis_file_id_draft` int(10) unsigned DEFAULT NULL,
  `thesis_file_id_final` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `thesis`
--

INSERT INTO `thesis` (`thesis_id`, `thesis_title`, `person_id_author`, `person_id_instructor`, `thesis_instructor_confirmed_at`, `thesis_title_confirmed_at`, `thesis_defended_at`, `thesis_file_id_draft`, `thesis_file_id_final`) VALUES
  (1, 'Mingi lõputöö', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `thesis_file`
--

DROP TABLE IF EXISTS `thesis_file`;
CREATE TABLE IF NOT EXISTS `thesis_file` (
  `thesis_file_id` int(10) unsigned NOT NULL,
  `thesis_id` int(10) unsigned NOT NULL,
  `thesis_file_name` varchar(255) NOT NULL,
  `thesis_file_content` longblob,
  `thesis_file_uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `group`
--
ALTER TABLE `group`
ADD PRIMARY KEY (`group_id`);

--
-- Indeksid tabelile `person`
--
ALTER TABLE `person`
ADD PRIMARY KEY (`person_id`), ADD UNIQUE KEY `UNIQUE` (`username`);

--
-- Indeksid tabelile `student`
--
ALTER TABLE `student`
ADD PRIMARY KEY (`person_id`,`group_id`), ADD KEY `group_id` (`group_id`);

--
-- Indeksid tabelile `subject`
--
ALTER TABLE `subject`
ADD PRIMARY KEY (`subject_id`);

--
-- Indeksid tabelile `teacher`
--
ALTER TABLE `teacher`
ADD PRIMARY KEY (`person_id`);

--
-- Indeksid tabelile `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
ADD PRIMARY KEY (`person_id`,`subject_id`), ADD KEY `subject_id` (`subject_id`);

--
-- Indeksid tabelile `test`
--
ALTER TABLE `test`
ADD PRIMARY KEY (`test_id`), ADD KEY `person_id_author` (`person_id`), ADD KEY `subject_id` (`subject_id`);

--
-- Indeksid tabelile `test_participants`
--
ALTER TABLE `test_participants`
ADD PRIMARY KEY (`person_id`,`test_id`), ADD KEY `test_id` (`test_id`);

--
-- Indeksid tabelile `test_question`
--
ALTER TABLE `test_question`
ADD PRIMARY KEY (`test_question_id`), ADD KEY `test_id` (`test_id`), ADD KEY `test_question_type_id` (`test_question_type_id`);

--
-- Indeksid tabelile `test_question_answer`
--
ALTER TABLE `test_question_answer`
ADD PRIMARY KEY (`test_question_answer_id`), ADD KEY `test_question_type_id` (`test_question_type_id`), ADD KEY `test_question_id` (`test_question_id`);

--
-- Indeksid tabelile `test_question_type`
--
ALTER TABLE `test_question_type`
ADD PRIMARY KEY (`test_question_type_id`);

--
-- Indeksid tabelile `thesis`
--
ALTER TABLE `thesis`
ADD PRIMARY KEY (`thesis_id`), ADD KEY `person_id_author` (`person_id_author`,`person_id_instructor`), ADD KEY `thesis_file_id_draft` (`thesis_file_id_draft`), ADD KEY `thesis_file_id_final` (`thesis_file_id_final`), ADD KEY `person_id_instructor` (`person_id_instructor`);

--
-- Indeksid tabelile `thesis_file`
--
ALTER TABLE `thesis_file`
ADD PRIMARY KEY (`thesis_file_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `group`
--
ALTER TABLE `group`
MODIFY `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT tabelile `person`
--
ALTER TABLE `person`
MODIFY `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT tabelile `subject`
--
ALTER TABLE `subject`
MODIFY `subject_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabelile `test`
--
ALTER TABLE `test`
MODIFY `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT tabelile `test_question`
--
ALTER TABLE `test_question`
MODIFY `test_question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabelile `test_question_answer`
--
ALTER TABLE `test_question_answer`
MODIFY `test_question_answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT tabelile `test_question_type`
--
ALTER TABLE `test_question_type`
MODIFY `test_question_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT tabelile `thesis_file`
--
ALTER TABLE `thesis_file`
MODIFY `thesis_file_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `student`
--
ALTER TABLE `student`
ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`);

--
-- Piirangud tabelile `teacher`
--
ALTER TABLE `teacher`
ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Piirangud tabelile `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Piirangud tabelile `test`
--
ALTER TABLE `test`
ADD CONSTRAINT `test_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
ADD CONSTRAINT `test_ibfk_3` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Piirangud tabelile `test_participants`
--
ALTER TABLE `test_participants`
ADD CONSTRAINT `test_participants_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
ADD CONSTRAINT `test_participants_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`);

--
-- Piirangud tabelile `test_question`
--
ALTER TABLE `test_question`
ADD CONSTRAINT `test_question_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`),
ADD CONSTRAINT `test_question_ibfk_2` FOREIGN KEY (`test_question_type_id`) REFERENCES `test_question_type` (`test_question_type_id`);

--
-- Piirangud tabelile `test_question_answer`
--
ALTER TABLE `test_question_answer`
ADD CONSTRAINT `test_question_answer_ibfk_1` FOREIGN KEY (`test_question_type_id`) REFERENCES `test_question_type` (`test_question_type_id`),
ADD CONSTRAINT `test_question_answer_ibfk_2` FOREIGN KEY (`test_question_id`) REFERENCES `test_question` (`test_question_id`);

--
-- Piirangud tabelile `thesis`
--
ALTER TABLE `thesis`
ADD CONSTRAINT `thesis_ibfk_1` FOREIGN KEY (`person_id_author`) REFERENCES `person` (`person_id`),
ADD CONSTRAINT `thesis_ibfk_2` FOREIGN KEY (`person_id_instructor`) REFERENCES `person` (`person_id`);
SET FOREIGN_KEY_CHECKS=1;
