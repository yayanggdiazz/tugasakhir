-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2021 at 04:34 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'kamera-analog', 'Kamera Analog'),
(2, 'roll-film', 'Roll Film'),
(3, 'strap-kamera', 'Strap Kamera');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(4, 5, '2021-12-13', '520211213120639', 1000000, 'Axel', 'Jl.Los Angeles 23A', '081227663296', 'delivered'),
(5, 5, '2021-12-14', '520211214082435', 60000, 'Mano', 'Jl.Las Vegas 12E', '081227663298', ''),
(6, 5, '2021-12-14', '520211214101246', 900000, 'Lauren', 'Jl.New York 22A', '081227663502', 'waiting'),
(7, 5, '2021-12-15', '520211215072919', 100000, 'Skyler', 'Jl.Daegu 23A', '081236798820', 'cancel'),
(8, 6, '2021-12-15', '620211215094129', 60000, 'Yayang Diaz', 'Jl. Seoul 12A', '081236798665', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(3, 4, 'axel', '221106788358', 1000000, '-', '520211213120639-20211213120736.jpg'),
(4, 5, 'mano', '221106788322', 60000, '-', '520211214082435-20211214082519.jpg'),
(5, 8, 'yayangdiaz', '221106788377', 60000, '-', '620211215094129-20211215094230.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000),
(5, 4, 5, 1, 1000000),
(6, 5, 8, 1, 60000),
(7, 6, 6, 1, 900000),
(8, 7, 9, 1, 100000),
(9, 8, 8, 1, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(5, 1, 'yashica-gsn-35', 'Yashica GSN 35', 'Kamera analog Yashica Electro GSN 35', 1000000, 0, 'yashica-gsn-35-20211213115449.jpg'),
(6, 1, 'canon-prima-zoom-80u', 'Canon Prima Zoom 80u', 'Kamera analog Canon Prima Zoom 80u', 900000, 1, 'canon-prima-zoom-80u-20211213120332.jpg'),
(7, 2, 'boen-jakarta-asa250', 'Boen Jakarta asa250', 'Roll Film Boen Jakarta', 60000, 1, 'boen-jakarta-asa250-20211214072925.jpg'),
(8, 2, 'boen-jogjakarta', 'Boen Jogjakarta', 'Roll Film Boen Jogjakarta', 60000, 1, 'boen-jogjakarta-20211214073059.jpg'),
(10, 1, 'fujica-m1', 'Fujica M1', 'Kamera analog Fujica M1', 225000, 1, 'fujica-m1-20211215100717.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$ghbQkKwENFZnOxWAwtgSaeDV2gcI63ZorQEQkSxqlaUlrFUMNnLpy', 'member', 1, 'member-20200315232137.png'),
(6, 'Yayang Diaz', 'diaz@gmail.com', '$2y$10$uBiaN9eP9l0R9GDUsU05du9/XI/hA0S.JugwlMvYodEuRVlrwaCvG', 'member', 1, NULL),
(7, 'Admin1', 'admin1@gmail.com', '$2y$10$sijs2zxBHqwpxGjPKVIzuencQnPfdQiqggb2UUWnpUqCHOo7oGEam', 'member', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
