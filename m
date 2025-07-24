Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBDB105FD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C51310E908;
	Thu, 24 Jul 2025 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kM/gIZ2B";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kM/gIZ2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011023.outbound.protection.outlook.com
 [40.107.130.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFE410E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OkcrWJiPVwlbqK8kgPXcjih7y00tBZ3N30lh2PvyKSpOKNgtk8SgswKIxxcisX6mFLAyU0B5NxcnkENdZY6ZPJ9LnPobAJf3TcxdD/2JV9+oac0wDJhekPBeFbyUI1TMaUx5TyxATzbxP74VjI/8B4iajmfKuU6PQHxxxUBatqGxy8Y4/YwGZWIYcoe5EjejxptMTXrEovMSv18eZ+RQVXq7pned95j0h3ami3ouNu+AdEAo9bVf+nNNXvuy5sOhGKyu3GbkSW6VGhfWjwm+4RCgwyH9iDq8p8+PPoKbgLD4J0QsemancYr+56XANPgGjH4G5V3ywKbAGDyCl31ITA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNsaLfUertpiuRKq6Ri1YYQlaXG94OeRZ3nNvUhCHJA=;
 b=cztHf0Y44ffNMhzle8APer1D//41OsRCSpWTZohiOkoLHvXHWNMDtG3RwDRy9WkaKODt1siEMAA6E0CcMngm4EQpZX5i+B49VmCbZQO37fThYY+cEDdYUOv8xlLxBEe2vRQVZzvZpj/NBdhDvTBmAYxQCMPVYLIsDzVZ4XJFKb+wtK/BThbrH14doMQDnU8li71VxZl3F0xf1mkQogXcA6sENUPSHZ2jWJ9K+ope5HbDXN4sw1hmR5gPF8PSiK4PszEe1t6umZuEVwgRPsSGym9YnRQsihcVIi6M8CuzH5GRRijicLhroSyqNDaDAwKhylKAxg+yihY8gwjvZdeeFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNsaLfUertpiuRKq6Ri1YYQlaXG94OeRZ3nNvUhCHJA=;
 b=kM/gIZ2BH+EaRwfZNyn7kaazN8JG1A6B6te1SfF0GyQw6cCObgBId7urMcBEyqvV+Vm1aX6e6BsaeBsHHeJlhtX3ymFjXu3VWsli/51LQsnSzKeTPXZ4ffVvdARqeYhmH00fpFY8uNlbj6xPx+HbtaDgcoBa6KRvjI/zQPUCRx4=
Received: from DB9PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::25) by AS8PR08MB9598.eurprd08.prod.outlook.com
 (2603:10a6:20b:61a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:27:03 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::73) by DB9PR01CA0020.outlook.office365.com
 (2603:10a6:10:1d8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcqvfY+F+L2Ym7ldJGbZ/4IS5RMFNCZQUdgB/cGrUE4+nCIt4n4ChQXnWBeNpl4ZY2YwD58YBI6DrX0HfsrctRQKDGX+1sFv5W7FEw3L5mnV7luKE8iB7AwdBWEMzOe7qnDLDGs4ELSs2ij1266Qv3WQdU5LHiJa4X49pDPJetEqsAcczIwWC7jng3R/yfIxplkTTIiffGipbxysflePC8r6CpJA1eUwPeH/AnpH7Kx7yPazVEZh3jsVaHsZB9hoAR0hTD22yvUo4a+nM9j0K0ccxr2mjz+4SVuAFkjfhTqDlJuVdURayJE40EOkyRz3IZ7opmkjpb33u1PjWouJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNsaLfUertpiuRKq6Ri1YYQlaXG94OeRZ3nNvUhCHJA=;
 b=H+bwz9VFW+q2+i+DzBYb8KTilr7LejEhu0WVFv/nroSEdLhHKv5qJVCpsRDgPCp9tBMQfp29Im6bI7e2nCaiovSJoS0yzlA1NH0pKnbSw04OGCJFJd6tDgUQpAXUKOn6c3uslekFB8OmYEDzMNTCoeD+c7NwDtjJ5mI1g4ecCJ1jbV7k4qupAeKgWxJaZ3ZQFPHtrKRtQJgwKCIii6i/51e60LHkUHlr7bCWYjfzZH0LVCYoKiPODrh+W7y5Yq7TTGXPKW7X6TndwB1Q/H1Tzx8SyJKkyJKcQqbkeFlt40dzwAsX6+jad44N3b1L0b0ZY8K0+ClJCsmlJbrU8SNUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNsaLfUertpiuRKq6Ri1YYQlaXG94OeRZ3nNvUhCHJA=;
 b=kM/gIZ2BH+EaRwfZNyn7kaazN8JG1A6B6te1SfF0GyQw6cCObgBId7urMcBEyqvV+Vm1aX6e6BsaeBsHHeJlhtX3ymFjXu3VWsli/51LQsnSzKeTPXZ4ffVvdARqeYhmH00fpFY8uNlbj6xPx+HbtaDgcoBa6KRvjI/zQPUCRx4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAXPR08MB7368.eurprd08.prod.outlook.com
 (2603:10a6:102:22a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 09:26:29 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] Add support for new Mali GPUs
Date: Thu, 24 Jul 2025 10:25:54 +0100
Message-ID: <20250724092600.3225493-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAXPR08MB7368:EE_|DB5PEPF00014B9B:EE_|AS8PR08MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: aa584354-9c9f-4625-f968-08ddca943ee2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?K5B2e6dZW3UJUdCOERT/ujLkDNOz8/TLworXhr+z62zl0kKGsK8HvTRV0jHH?=
 =?us-ascii?Q?b2BEUEDfe6wOqLJlsbjOlQ2+9RDOu4cxI5I2/ximsLcPWVhEhbqVaZEOzEjL?=
 =?us-ascii?Q?3W9GG4L+5nttZDB1YPA+sXoEJqMAB06/ZXrHs2NE4ed8IoqtVII8PSRRUHRU?=
 =?us-ascii?Q?GUD5aQ/dB0KvjsyLWgMtCJWSEwMo7XL/XcHx9DURTkW4cEgHTHryvUlRZdb1?=
 =?us-ascii?Q?UMow3cq/mRRp0+pfFVqbnOUWahWwbIJCmXVvM4fq3XR8jQq6TvMihGz54ZKF?=
 =?us-ascii?Q?cWb0q3tjvT7aOTSd5c3/v/Mb0QkmN/DIg/ZC43PkDxjhWHQ4LYi7KPYLCIv4?=
 =?us-ascii?Q?SzJythqTYfHrw0f859+OhCq2C8tPtWdJwPW++ovUWTpNbf6zHQWItF/Mr/Oy?=
 =?us-ascii?Q?rRmPxPMqTe2MXhVfnOhVA8e8zOSYFzkuAiQovGVZng+tHVwsrVe3G0FmBIxx?=
 =?us-ascii?Q?5upsQtNqpiJ1pEkdPnQnJk6SXoQRgrvq5xsW+yKXuAh415BZxpqtfZt5OQZ2?=
 =?us-ascii?Q?0D6WqoTiolAiFHCvXwKfUvvp2ZqTGF/clG9RlKwTsXA9gfHkjSEncUe20r/D?=
 =?us-ascii?Q?gfIQGSSCejDrhqgiDCfEmsdRzdMGhpwhcfLTPAPfi9xdTYoDcztnWPkG00xU?=
 =?us-ascii?Q?TO3IzlyB+kv6NFIGJKjstQKH8WUjesKTs0asF3+quvlZsLJVN4Ni23YpIwvZ?=
 =?us-ascii?Q?newWRJkLAHeNrAYW84FWgT5xiWg8sIwX1m9upD1jbiYJYPqQnZZMojUN2ucK?=
 =?us-ascii?Q?mcnjoxUzZMqagci6eq0IUknb2S8Qhf9NM/mhGb2UA3NgC7OxaBFCnpIjJAio?=
 =?us-ascii?Q?KJBLYl8q8D7cML3nOR0dSPZaNMI4qDe+EENeY+0SVVIjN5rAXz3EcToi2tMD?=
 =?us-ascii?Q?DAE+5wOMVC9B5o5Eb31/bQLPZEoon6IBtESBZj+26koUAH+kx6b0rLxfQQh3?=
 =?us-ascii?Q?fJuHfXzrSnP9AnwP6I3/HZQ/Yc/7C5qggVAGzhkM0qSs5O4B6yVXsQXkMY1T?=
 =?us-ascii?Q?i1Pi1TpQsPc/vdKXpmTTgSrSNKUVHjtNtp+X31u1OHIq+YwmKR9YKIzZWRCf?=
 =?us-ascii?Q?0h1spvA9sKSLoZwQRgy4CSZzjXlYIxWDulgeHR+0lvI63MSkRp9FbCbSsdwk?=
 =?us-ascii?Q?o2lf2NEUXmKgKhbYTJMkqqLB//LIyjn4pr2+KmcrLLHvj+2pI7phsqFRRfh+?=
 =?us-ascii?Q?8GUzMIb6a4WbZhVvBztxGz3iree7Yb0zeBDDA+gxnxQ5Qwi3u07PZsGmeWKw?=
 =?us-ascii?Q?AdGH1Qp/ci5+v6LZS4H5rgXssw2OdL0B9GxdXZ3HIeFeiE822mWmj29Ei5q0?=
 =?us-ascii?Q?goKk09bq111W/5EEh3K91kNz0TyIKe3rHslwCB/+cT4evIWRIF7mO3AZK6nd?=
 =?us-ascii?Q?KT9SLh0X8+yN/HEqavLhJio83idhgEkyHNH+sVy6TQ2HbCfDZJXBql5wLxGj?=
 =?us-ascii?Q?kK8EOtMlKVY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66460005-5285-4157-30cb-08ddca942b4d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|36860700013|82310400026|1800799024|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y7+/UeJywMFCjuCHv4tiZkEihwBoxo9GBcDluJGk3kgIECJHdpj7Q5A/NYox?=
 =?us-ascii?Q?4W44yGWJ1HLZAIkaoDUsfthUz0DrGRPadFhJ2drYTUkl95Po4B7nzBh6YRxg?=
 =?us-ascii?Q?tll2uRKB/NRh6F4n6I+c1fGPiPa9hB7ghpEVIXQ4X9hI1gghhv/CoU6hWXMS?=
 =?us-ascii?Q?CAmPuZWTUTnu83Bqcjw0iPvjCxHWuHWoexstRMglnm2Ds8WRJ4ioVS+5yva7?=
 =?us-ascii?Q?jjYIP+0cziyw27zgyK14uhPOMYokMQDMl4L4fx7qMauOD9sP+snqaovywy5o?=
 =?us-ascii?Q?RLRZJ1/uOE15Sfs471DzRXGVvPlrxL62PVZeEV6vwpKrU7ZwtCyP6Pr7/OKS?=
 =?us-ascii?Q?AqqqdRoA/tdfOIn+LjNw6D8+bfufJu9P1xWXoVdWraKiwxjblc90iZnsQ2zh?=
 =?us-ascii?Q?GDEg3gk1eRhXnBbeIf0X06gl7uL+bhDzzOT/hPupuVVCBzyWaVkWwQxaBxfm?=
 =?us-ascii?Q?P+WuRm4WpQP3XxBSB/IM7/W6XtgaY3k7+l7yrUgLteU+IJ8nXhgkt97qZyBP?=
 =?us-ascii?Q?gGUEME6DXKxKvC0nlVOmZSK0poVgn/1Wxztbqm5zyvzujKvzak7WXlhmCUCZ?=
 =?us-ascii?Q?C8dj2duycRSmFKR2rZrMp96i2FGMLAHklP0d9MBx2e7ell2fcnSO/fRzzvlw?=
 =?us-ascii?Q?gow5JdgcbVi8kamcbAckeWY2qZ9TOLbhm1ZAVZ8B77HXFlFw+aeB4sSksjj+?=
 =?us-ascii?Q?jZ8BwJOzrLPTOcWNNfKdy97aa94565OaRt26IaeCdVePovhUZ/42Ag8jvemr?=
 =?us-ascii?Q?DMXe4C4pwfWikbpKmYEjnKGJNHRt22ZFwalG8OzZpEKUBgYZ0/hYGMcLIEAi?=
 =?us-ascii?Q?vQ8rWxMMKw9GS/kF6X+Rm3wBbnPyZ9rHHV1UfS6bDH2x+0BClh8+c9x8MDw4?=
 =?us-ascii?Q?L5C8MWCpJZAmCjViHQ2yyW3l6f6cBFG81YkzEzuzGHrQDyS5qLzqzJDb838B?=
 =?us-ascii?Q?Lc53XwPQQ7HzgYahqhe3twg2oe7xcZiF+nLwF2ZMYoTxZaBlK1pLSLyTX+0+?=
 =?us-ascii?Q?nzbM2dgjLQ0Kv85wMiWyjtS56sUAaRDQv0fxfSTB4vGCbK4kGoGy5s08ayj6?=
 =?us-ascii?Q?3slHubSdNQhJugx88XGSu+Ep/zdH1W0lkIQ6tDbNQymRnleTTNe1ykkKhVbp?=
 =?us-ascii?Q?oxa5YVfOsaNyZcrkOioU5HYc/oPMmv+ibRjmyJ8qHSJYb/sJaGM6hsNyAwnA?=
 =?us-ascii?Q?phtCrcYDrpF3E6Y8dSGDEx6cSH0ZiLZFqar4dE973ugxoglwmZHAAsavCQHS?=
 =?us-ascii?Q?OE9m0++1F0nYzmwpibH9isZzJyrnl10/kOfcCIP+xWWqOUkNG6Oh84WDm9pZ?=
 =?us-ascii?Q?kk6C13hjuZbsA8aTJ2P5eoUfyNHxN+GIxpxlr+/l9HmETUXRLOMuX8wzIRDV?=
 =?us-ascii?Q?eETHwoT4+/DRlakoqRVtO5NB/6GRghsLMHP74GifK2DHmENcCVSDN/5x3iTt?=
 =?us-ascii?Q?XFygnHr4zFBD57H/Ym6Rdjtx1Y0yDws8DZ0cpO3Lx6utN1NYlt0se3PC3OtO?=
 =?us-ascii?Q?IsFfKdsD0iu84jU9FAaYfRW70CWrMrzIc/7usy2m71sjmDsOQlOa6pKSGA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:01.4517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa584354-9c9f-4625-f968-08ddca943ee2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.
- Added SHAREABLE_CACHE support for GPUs from Mali-Gx20 onwards if
  coherency is enabled.
- Fixed minor issue with the setting of the coherency protocol.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 6]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs. This also
             adds SHAREABLE_CACHE support, in addition to fixing a minor
             issue with setting the coherency protocol.

v7:
- Picked up R-bs from Chia-I Wu.
- Replaced GPU_COHERENCY_FEATURES register read with the value from
  gpu_info->coherency_features in PATCH 6.
- Link to v6: https://lore.kernel.org/all/20250721213528.2885035-1-karunika.choo@arm.com/
v6:
- Picked up R-bs from Liviu.
- Removed unused register definitions for PATCH 4 and 6.
- Link to v5: https://lore.kernel.org/all/20250721111344.1610250-1-karunika.choo@arm.com/
v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (6):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   8 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    | 103 ++-----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |   8 +-
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 200 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

