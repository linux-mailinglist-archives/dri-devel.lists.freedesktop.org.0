Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D953CB10604
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8E010E8FE;
	Thu, 24 Jul 2025 09:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Dd+5hlW2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Dd+5hlW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B6610E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HiQ0ZMc4U1WpNcI8RAvdM2+fW2jF0AOKeOFTiZNAdVGHIZQmhMXdBlkkwZmdEGML2d30lfh1mcxzc4y+1NJmeIARCv8uXs+2wLtlfAClMPpmHNLZTlLYG+6nEdi9YjWi82swJrX3/ye2s1Zm7xCw9/h13f2hqSnElyGpJKwBWAsc63raMt3cKUtp/5pofApmDeRJZ/2HthUO97MvVBmAr2qdBECHd+udsDWg0qpR71WBTUI6qJYl9bGN1XRp9d3UJyMUtzf3nquiZbDOX2WsPU0hwhPXgXyEwEVyX4v4BZ79KtSxaSxQfMMIdjESK/OlPjbIIs+pjDbfySVL89CFDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zGkU7u+kkxBDhC2MB5WVm8/okfaBVYFo3ojlSsu0bc=;
 b=sMhf+Osu7y8Nm163lC6CEpaLvKTFfwJJWWKMOwy7p+UyoIyeqUSh4spdg2p4YnwPOz87gydnoOXXtORevpSZDf2VJe/kFtxaeoGSloFWTpPBFeF/S0+KN0r4eA77ieDrrdgAdJ4L8EITcR6kWy6UrsR74PFaF7jxb30DzzQHST7vBKE1o+uhJOjT5oJFMDYfzq8wEDHidxDT7Zk0l9Xq9f0whLtj/MKxUVUf4IPPkW122TtCpdx+GtPTuhFv2uzROmY9KJsnRI0WaR/CO5ACgOUA3/QT/vDdd+Uwz9MF7mrkMUrQbZ0/RFjMfS6YPq26tuxINpFc9B8Z7/hQrb7MYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zGkU7u+kkxBDhC2MB5WVm8/okfaBVYFo3ojlSsu0bc=;
 b=Dd+5hlW2zOLh1cfiiEkd3jtGkdW+kyFl9zIo92m1dpQFuobT5xIwRjQZJT78tNhoobumOWyYZgHqoZmSX5FOYijdYsZpa+KydqElI/VvMEwEsS8CWgUa9Zj1Zksj7dvIaZwWz0VPeZd/aeF1KnqvnEsLFPa7hZe02fkQ3ebbqbI=
Received: from DU2PR04CA0349.eurprd04.prod.outlook.com (2603:10a6:10:2b4::6)
 by AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:27:23 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::4a) by DU2PR04CA0349.outlook.office365.com
 (2603:10a6:10:2b4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfHlUb9zRy3OOoYsNDuFCzUR7Jo1Sh/ikQlBAroCE3xcuSa+co3fA9tJgCfHzSk6/VlVzR6Pb93ruZ+wIInojCjQomJTDvrpZH+U7XW3dgwUYaThyGFwi/Y3NNzErO/PRsaM4CrwT0YuvUiDnMSa/sx4/WDXbNGGLFf5vGbI0iOSKsMN2JFYqrh9EyvRUkS0/MjLfZR85R5I8E59r11D2GxpDrylXPFmVYaqwNUPetDZSWSR6DGN+vsmPblXhaS7S+HXGKMGpzDgb68UUUHDf9ySA6+oMdnExMfE/DKz1F/5ylLc3L6yNs7K9hv0GiiUN8MHNEXI0DxBTizWKrOk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zGkU7u+kkxBDhC2MB5WVm8/okfaBVYFo3ojlSsu0bc=;
 b=CqFZQ+QtIe1aL5PsO5ZwBNoR6CDqBMNGiRHin2YpFKL1LrHrvEUfLfy08NcoFMlGimQOXEB3iLzF5ZEWII11spFgTFv5DNhSdny/+OMdwWaDgcLzwM/nYnWqt/cSDPaDjQnjnOX62wXi7R/iUec4614v8ygYZV6kPRCkEGj+Z4av9gEdzDNEiKonPrzJJ7P2c5MsG3C9SA6hOfz+G3whb/Mi1eFfMDB++35f6FYoMx9ftXNz1gNZadii3eZNMt7BrQGJyk7OQvlBcXOy+XngDFOAAnP6OjGrGEJEoiJKZDhLbOA8jk4DxsTq9u6IcixWA3831IO8UWmYkqbHDXz7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zGkU7u+kkxBDhC2MB5WVm8/okfaBVYFo3ojlSsu0bc=;
 b=Dd+5hlW2zOLh1cfiiEkd3jtGkdW+kyFl9zIo92m1dpQFuobT5xIwRjQZJT78tNhoobumOWyYZgHqoZmSX5FOYijdYsZpa+KydqElI/VvMEwEsS8CWgUa9Zj1Zksj7dvIaZwWz0VPeZd/aeF1KnqvnEsLFPa7hZe02fkQ3ebbqbI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7951.eurprd08.prod.outlook.com
 (2603:10a6:20b:577::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:26:48 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:48 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 5/6] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
Date: Thu, 24 Jul 2025 10:25:59 +0100
Message-ID: <20250724092600.3225493-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7951:EE_|DU2PEPF00028D04:EE_|AS2PR08MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cc2a56-a40b-4287-4cc4-08ddca944a83
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?yGBmzXRLKLrphM6cyJW/zSpvX4UoaC4+1pmacJbLgSH30AbgG62kiKPMn5Xh?=
 =?us-ascii?Q?CpRjxRwjhDwohKAhb++h+7tgAQKBccvpwVljqKEmM5Ckq5T6SieR9W1/S5ak?=
 =?us-ascii?Q?EMMondVz2rFs4R1RFczW8TvylaAGDJzeDjTfro1g9nGzv0y4VzMxruJmmDvn?=
 =?us-ascii?Q?bbW2WRTaFxEEQeav1WJ/bfK4Vbu8SfCT3m168YSDqrsi6qmfWgA5aZgwNtjx?=
 =?us-ascii?Q?fhijCb2hcBCU1k8CkGSqhj4fHBT5I+/Y0YuMxiwVPZUaXDr1KKcNrIOhqIiG?=
 =?us-ascii?Q?ryJOlEACgQS/gSIAauiOHvovbj8jsBoss5+/b41SXcy3+3DHrJsVN2ZJb05J?=
 =?us-ascii?Q?UjM2/BjvmuiMJTU8fshqkShKZdE4JpRzVeAtJPrgIiu5yit7Y8ovhZ4wGP90?=
 =?us-ascii?Q?YAWglFYc+oKVlTk3d9j3tMCpDl8m2j65vUBqag0GrVcXvPMs9QDn6SnLlC1w?=
 =?us-ascii?Q?dB14ojYhhu7CZbymJNhDI6V/wvxNpfFeVUPOuLQz10ggVUuCvXTsn0yiLUVx?=
 =?us-ascii?Q?HCn5W7Hzaux9QmxnIN8VEk7DpPk5fYoDpLTxUbYmq2CQMalZo4l9p/V4pEDg?=
 =?us-ascii?Q?cI3wrW6NAksDm97y76ecjjH5IQ1vZod2yXaLhky3eYH2YSz7W8YAgIaPSKW1?=
 =?us-ascii?Q?DDxThapREjcplrXGwHxL81ghiZxQmp+H8wMEQiuPpGX3JI9VM/b1na4sHcga?=
 =?us-ascii?Q?zsLcChaUlwjqr+nWvm4hv8u6NDK+qVGmXS3VRyU/haihT3cFxR57zDZofOuh?=
 =?us-ascii?Q?rCvgmyqnkHtONSUE7ll/1aflF5loYKQAEhHUqEqLLZKbu93Rw8yOa18Gvx0J?=
 =?us-ascii?Q?2SSjNHz57HgRPO8+Lv9DF9HZxewGjZdFHKx/7mHW4jqubJK++IYyerAoCjEv?=
 =?us-ascii?Q?PkEY9MrzaHCT3wg7g/v2V1ayyyWWZss/hkr1mZIMHu+dFrDyC5Ni1KjUSQuv?=
 =?us-ascii?Q?Ml7SbTBEPgcg8nqMhTRWqj5VcQDOCVQ4CjV5x3F38IZfZbIJQ7wfs9I9VQiM?=
 =?us-ascii?Q?7zn2hyGEzKP9ncUGKXMuxkPW5jTzZyZjBzNFWq2hxEZFzoTyXdJ7q7zoo9c1?=
 =?us-ascii?Q?C+tyxfFqsBtkiS+VBWI37XLvJwI013e1hOMYjZlxYdxOOVFHyoInReat0wMx?=
 =?us-ascii?Q?HMwkzT3ZuNQqtODwc2uI7GK1AKPj6VDR7hMkroPaMAt+ygCkX1MRbYtPT/ZH?=
 =?us-ascii?Q?Mb0dAG8bhR/fUsuXOUE9OuVo2CoCry/Lz8mXvoxXO6PizD1RlxcxGtA93LFN?=
 =?us-ascii?Q?Q9yuP1bHXf9CiALr36x199A60UfrQPDr6Hzfg4PDYVRR3IT0YE+3D/OhwC+R?=
 =?us-ascii?Q?T/N/t60IW+q9KtjsqW7/rwgkPGssYWXLXZNp5+sXvu9RcQMjoN67GLmrfR43?=
 =?us-ascii?Q?tjoinnIBrIe9H99TWLLVCq7JiUoJo86He9lq8X188Gf2Fd/aDg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b239179d-7b31-46e3-5e3b-08ddca943727
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DbYhvprSZUGT9IVrWKOYGVK1vh1JfRVza/LfQGehvXiJR3+hJEsgRL3NpTuG?=
 =?us-ascii?Q?VdR5h+UvnSORTZ0rWvXvspi6x89olWLnYDptcWS7KJPmwhbqd+FauAX7Jall?=
 =?us-ascii?Q?jT3++88rinsUaqFq4zendK7AMt1Zmvx0i3Ras1BB3IJJ7wYOr0qQS54GBwBs?=
 =?us-ascii?Q?+FllUGROL404QTnVF+3mYMzEc4H8m9ohOnQ5upiAhVlmRnWpxF+lMi3JklUB?=
 =?us-ascii?Q?wsVzJnCJXC9zRZ/zBZVMgycMrGGW9wja/6r1F3oJ/32+uEctfudchw0eif07?=
 =?us-ascii?Q?cGJt03Cieu77oosWMXikd2bDQt052J8hom2yX8e+KAQ5Yw75+KHk4Qi097ay?=
 =?us-ascii?Q?U0ppeBUNAwYapLrqqeC814Kj4cQYQmWzpJ2FQOoMV5rziZ2asfZtej5gBGG2?=
 =?us-ascii?Q?W7r7yMm06sAXNfihVWM6L4MHmZNA5WxBdznWjj5PQmKFtSgJ7dkgInwEjpSU?=
 =?us-ascii?Q?t++Es87VOB/sPsGibMIYmQHpfckVyQ3pLdUxiWXzYiYKV6p02dZamZaDhfK/?=
 =?us-ascii?Q?G20Xu9kteEGs9MMMW0XnN8DDNman2SFAPXDOLsvB8j9sssJ+mthA2KOC29Kn?=
 =?us-ascii?Q?m194Mw4sAGq3O01IzARGn1BQyi7ef/js7tM2gkUD76bRUKAdIj6c7JjAVwC8?=
 =?us-ascii?Q?eM1lYaFxAF9pet26rd4JHoFfvoh69Kb8HEhPY9FSSsl4+y4jF/9qLbXJc1m9?=
 =?us-ascii?Q?n6lzZ/x27CPhniwW0rMUJLCBLw+ELW6yDXUWKPviChci5c7rUQQkOWmauy5f?=
 =?us-ascii?Q?RLXFq00f4T6/v4vjIjHoDAr6chqk/WnLOme2+YC6f+CUObWS4GznARqTR6Nz?=
 =?us-ascii?Q?waesnxrRj1oaHIAGKt7zxHrz10DP8jBI9dOVoE0lmuGAD92OKvanlzXTmH6a?=
 =?us-ascii?Q?RUhFOAM3aKhEPyp0jldlp2BEYXED5q18ZSss5QJ5yc6c7y89PKFLbfeh+JjP?=
 =?us-ascii?Q?wmee48hDcBagTC0wbCnkfNCuvJ+zjWTm3uq871mQDhQuFqnka/i0iGvF0ayi?=
 =?us-ascii?Q?1d4hz/bNhRgb4QMVSca6t8Ch8jqdPtJo7boyxlp6g9Pjp2kuJVew2dJm+0Tl?=
 =?us-ascii?Q?tNEtVpzTerQcKDicq/SVFTMh62iZjpAVeTvXYIRppWCMm52P+NBO/Ah49SRb?=
 =?us-ascii?Q?XIIUPvnxb6OTZbf40LjsD4CoDzTKLBAXxvInwerCpRpg21hWMwx715A3bPCK?=
 =?us-ascii?Q?tkiI5bVs3DOMow/BlHKhxiArnd5quic1awKbzU45ckC1QNgE2w2Tq5vFgAVY?=
 =?us-ascii?Q?p6jR6eOCd19ACYusutEiaHckyAMEugJuNmKGsDPIhNt+gwF1zNlNWRfyUpvB?=
 =?us-ascii?Q?+p0LAjh+KrWZx9EKhkjJba3WHjg8p5d1TPJsCLthlDXgJ6zo2RMkR6e+INXM?=
 =?us-ascii?Q?OEYQF3OHUfGF6sHC2yLDIlQe2/Um14ekz1CDbdzv3vNnNWhDr4UOeYCtQSkV?=
 =?us-ascii?Q?4/0XXchZ8HXToQmH07M89R5aOG3CzC5pkJw5B3fX3ZcIl3KRiZIhZIcvvRGL?=
 =?us-ascii?Q?IbQ9eF1BiJb/csJbaPuj6Ji2eVc9+o4m/1TF?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:20.9562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cc2a56-a40b-4287-4cc4-08ddca944a83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8431
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

As the FLUSH_MEM and FLUSH_PT MMU_AS commands are deprecated in GPUs
from Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_COMMAND in place of
FLUSH_MEM and FLUSH_PT commands.

Mali-Gx10 and Mali-Gx15 GPUs also has support for the FLUSH_CACHES
command and will also use this by default going forward.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..367c89aca558 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
@@ -568,6 +569,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

