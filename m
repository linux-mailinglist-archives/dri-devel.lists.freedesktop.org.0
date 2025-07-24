Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D461CB10602
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A252710E8FF;
	Thu, 24 Jul 2025 09:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="BgCpm9rm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BgCpm9rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012052.outbound.protection.outlook.com [52.101.71.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357F10E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:14 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=trO6yFDFmi8nZ8YLVdIuTUD01zMLg3qlgfeNIwkVdFf2It4VnY1JHsMhzx5m5I7w2pWqDYR/FBtHf1C7mvKxNLLlpzW71spUHM2VlG8Gjgt+z4DvEAmkcRlfk3f6Xct4oD3XM/DVg/ZeCld0cqtOw0jPlkvEbiFkd63VNiB+xryrHkDboB5mwl9M2j1u01MdYB/yv/ivnjlQfYUMcuQNNYzhWkB3BgQjRwBhG/OEevihfJPamtE+T+ngDI1MzrfRIyNA1b6vp44a47D8UZwkbf+Ukpbs/FtVH4I6wMEiIiVKFXSeAfAy08ifmoFFZywhJBs1SwDACtGslgvr4mcjlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8BK2zgx57pSROC8NA3H/d/RlbTVFTJZ0bTPR2QdmtU=;
 b=dU4PGiNV0l3jRS5+o7flKVLl1mx34jOW7BKQrAfc1NiXv1pmV1EnEVok596DW9yf8iHQ33r+OyEDUHLd3+g5zjhiP4rqHCbCUaEWzJwQV1W4knhp3rZjfAWCNK+uoK8nxAXMnbdgEbXmGGEAhK5LG9TY5FpX+t2s/VsLSBKzAlm+XOo6SVfJOulBioRqJCQ9AA54dfN3PVfHo8kgr85kJHU2a/mT6wY2pqkZKrSUTzMYlZQ0E4299qbIg/SdRg7NrdW28bBGoMrDGjgqnAzu3UtqPgkKJLA2smGVYRCiMdUQ1oZtHiUfZFosLwW/7N4+vW+K9mtTT1pvjayW4WAQ+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8BK2zgx57pSROC8NA3H/d/RlbTVFTJZ0bTPR2QdmtU=;
 b=BgCpm9rmvZ+ei3NGyFZ6r5RGfuK/jVKJ7k/UjyI/doYTyaD8lv8PJtbrmOmnK2KjXDQHSwMKPE6ozkDVJhUxyhjSYrKTlckwhcGq0+DFxHQ9d+q79dVCQBsAwyJ/wXYjDj0vVHMoCPDZ/6VhPi6PoI95QK74Mi2tKm/hFR5exg4=
Received: from PAZP264CA0148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::7)
 by DBBPR08MB6012.eurprd08.prod.outlook.com (2603:10a6:10:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 09:27:10 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:102:1f9:cafe::b7) by PAZP264CA0148.outlook.office365.com
 (2603:10a6:102:1f9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPXCSNKf+JMJbHKMgKcNInjXVzAs/buTWqyxfhIFzHb6ZUOQS3S1SqNsu8V2hRzV6rl9vBfEOAI840i8LEb/GBo8gAMu32BqhuX5j4BN8xznW/va0ejCQ17jLb0kAmVTXyCN2bam/qSxdQzSTUXmi5MdvoGPWCYZxFlEcF/Fyb14WvIs57++FDI2fNQF8EOoiCz1T5P2xxnbjf2Tr59LC5SqQpRRIcKtmZMCPeDIkGjEi4KlRFl2iabWBBNUDdIafMb4my8KTjcBLj1eyj2HWMQn+l7Ku5Glv0VJaBpWf5H6hVMMva17loh3v277jL0ADX9y6nc1RJ8J1t/QabnQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8BK2zgx57pSROC8NA3H/d/RlbTVFTJZ0bTPR2QdmtU=;
 b=uQeKEctlBjqGDZzJ4OLWhOTJmSGkO24a/V+542iwLYk4TAefJ1lStaDhw9C9fG6e31KaVdCM1v2THqAhyGX1oeZ1nJq/e9JBX7ok/4mzezXVpRSX1g6v2JH2T7efM+D+akk+4EPUt1gQOmX9kED27jrTORreHdu6fLOEQLnl4Ofmjr4ihP7WwdFUE5qbDZXA3U4nqwqgNqcC0MVHxqj3U3My54wVrfTTqcX0ssXKxY8JZaIu7AzfXW00tIXfaR9OpoJErW8GdTY5kgzuXu7DXTqQvitdlqFvsmIEfVxd1amPcB5LTnQb0Eo0pVjZZpcqr+tSSgwOupCB4CR/GJPblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8BK2zgx57pSROC8NA3H/d/RlbTVFTJZ0bTPR2QdmtU=;
 b=BgCpm9rmvZ+ei3NGyFZ6r5RGfuK/jVKJ7k/UjyI/doYTyaD8lv8PJtbrmOmnK2KjXDQHSwMKPE6ozkDVJhUxyhjSYrKTlckwhcGq0+DFxHQ9d+q79dVCQBsAwyJ/wXYjDj0vVHMoCPDZ/6VhPi6PoI95QK74Mi2tKm/hFR5exg4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7951.eurprd08.prod.outlook.com
 (2603:10a6:20b:577::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:26:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:35 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Thu, 24 Jul 2025 10:25:55 +0100
Message-ID: <20250724092600.3225493-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7951:EE_|AMS0EPF000001B7:EE_|DBBPR08MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 414c4880-4658-432c-4681-08ddca94436b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JSgPIPYWNgmsZY0xAB0x2oheyPWEZ1A5LAxN9FFEZYxck4gHO20eaXzjL1rv?=
 =?us-ascii?Q?4xHODc4Pkbg6o4BnDz3nJqUFwJaeeGT6Q4i4TE5bcCGRbXvxzW1T/a3YIHcw?=
 =?us-ascii?Q?g92Yai0KNL7lSzi5cIE3yaJuTNljYEAlaqYoKoOeqzNS5Uk03ROlZha8U1sP?=
 =?us-ascii?Q?dYdA0fztJpqm4VnRXS94airCEnUPkRWCFmxyK2ElLyoEZPXuHu5lSwj5X52k?=
 =?us-ascii?Q?aeEKkUuH+tt71J4MWont6wXQj66B4EnYvATMem7D9OQONlq8K2/nSvXtW7cV?=
 =?us-ascii?Q?rK7nje2m2ZF++4V61VhPP2AgTnBD7BZJJV4sjtSZc/P13m2j2ZSDsxR5XTZW?=
 =?us-ascii?Q?IkkNYq/VhZ/amumCT/16AOCFaJ733Dmej1iNIPApStPNXU/dQFF1ccElJ4dC?=
 =?us-ascii?Q?W2k+i+577eaz89F36IHPVjJaCEGDop++ShAp8FQ3lhjIVU5e9qFFUuX04a1r?=
 =?us-ascii?Q?z2nF5aceDYynTtNt1dB5Q2SlvbbjSADcTCt+Br1UxClMKVmx8mOlzMc9/866?=
 =?us-ascii?Q?U0FQmGg8vgUbHws7x++zV0xcjjdIRo0ne8v5QHnE6VCWnsLj9861WP5E/Vcm?=
 =?us-ascii?Q?5Pi4dgmgc7j6+2omO17VwtdMvKz5+GljpdlNwYqWoTOr7BYAZDd6LLqE14Nw?=
 =?us-ascii?Q?ynschVNQ262dMpggCZr07kvAes6PWfALlKgs/mSlDyUNwPXil6doXL16SQfK?=
 =?us-ascii?Q?5qgm9TVWS/zuxLWJSlflTb/llHuE76dvu5faUK2IVP7nTk+Vb+qtyaehhZSR?=
 =?us-ascii?Q?Cj/euLlcJL+wu3q4qA78Xlae9E1MP4yR9GfzbLLRAUFwtbrQsSYa1yJshyRl?=
 =?us-ascii?Q?Wenc+2KUE4hoE7r9H3M5CXha9XX7k0jXdxkV3rm0QugvN02twnGV8qda1HaB?=
 =?us-ascii?Q?rlcIvs5LrlRpotbGpdWvGxiGnPgxSmsTx9lEVuThB1JsDyI6vec1l2107acc?=
 =?us-ascii?Q?BZVvvkYTNdIR7twcbYJKiIX4O0J4YFmfhzgPRcL3nwDZ4kBIZT8GEolOJDN9?=
 =?us-ascii?Q?Ef2tH+MbeEx+HjoDjw9oR1XeiUlR849i8Hucd0yjsWq5jqQVgQEnFZvNuVnZ?=
 =?us-ascii?Q?RzrbEgLo9zyGHt3XHzpa8MtMkZGhqudqhgjwf6ypiU/zBiVR7DUT3ySrgTMV?=
 =?us-ascii?Q?8ZvhTyqbBdZI8lhAo4k+fXk675DLuN0MvuS4pqaxC7NQofTTdSll7v54rmfX?=
 =?us-ascii?Q?m+Y2tyKNz88oFbvwQ6yI+V5qHTc7LEPVy7Juk+eQkEDMJ7mI79tlZiqwGp3O?=
 =?us-ascii?Q?qJdpCgwJNPHrQQchZ0Nlgd8z6zvXOH/Z1LtbjBYB12bihgT46sFeObCn+eCU?=
 =?us-ascii?Q?LX5P0yCj4RZbOsyr4Fzhz3pe7qgDDy4X+JhUj9tE6NC/ze1alRyw2DSspagt?=
 =?us-ascii?Q?gxMDyq1+ujpsxAXM1pe0FR+mmtw5A6G5VqwTMcDAqrVR+FsWHvFIUtsCTt7P?=
 =?us-ascii?Q?c6q/we8p59k=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 57c1a882-3646-45e5-618f-08ddca942f4c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dpYCKEkS3Cjl9JjnhF7vTlwTVkBDu3fT6JceLh5E6Vf3ci+RBlBfrB3/d1S2?=
 =?us-ascii?Q?QY6HrED1aJVVfjQAHUlUUYE3hIpSd/7jjrTGJzWaVSUejjLUV7G0ovBOSXHP?=
 =?us-ascii?Q?rWfCZ3B3MzGiCxNFV7tMzWusyYinKX0qxpCIDV/BukXZz59ihd6K0DJ5tShg?=
 =?us-ascii?Q?Ra9VIhHaQjRiWLGQZOR1WGHtRjsBa3zlHJo3GOShZrks4teAg9ji2onDV7ik?=
 =?us-ascii?Q?LP2FuDM92WL6DQC+DxRfr4uTITczz2ZMqqd/G4QC1av0yl4YzO/zkXT47oSD?=
 =?us-ascii?Q?AtAWlDu8Nj+6+LL2JnFh7f0OhqWlOihD0x5UfY8IB+uu0DPYN87FIN3JAkNb?=
 =?us-ascii?Q?zhKfpTNI9HyDLyDWtksjXf6YNcTI8NjaxHy2rn0tXKC3Yu8rMSqqxtEO9aTj?=
 =?us-ascii?Q?VonvTMTn/fngnxOeWOhlwX9W3sHuJR4Wwqp1h9AbLzPQck5X1KC+TvghR8jv?=
 =?us-ascii?Q?RKgNDaqyNp/IBq2jxCCghVVbjNbner3o8K6AAhHkUifQNYxqu3pXOGIkxvDC?=
 =?us-ascii?Q?qqSHTuVHoqAEQJfiy174z1MZ0+AphfZlu35wNOa/UtYRRS4enUnfxUVJ1XT+?=
 =?us-ascii?Q?0pTo5Mlr7RMeZBdnASj8NGC4+18HXSn69nhBE927nh/H5/QKWwUldr6rNyV9?=
 =?us-ascii?Q?cDEUOs8X9Zj1z7j3s9uyjvqxoqDnoNXMVlvOlP+FijK6HvyXaq+9hFQqB8kD?=
 =?us-ascii?Q?YDgq8DIzmR0YHrsuZif9sHCgwmNzcK941NMku8HVfw+bhbEVj/og9WEo6mVc?=
 =?us-ascii?Q?tgqyO8HwX+ESSq0QlZnuhvKOlAg26p+zWPF7cx9iatG6ViJLNgC/yCYZIyjp?=
 =?us-ascii?Q?LRWVft+e0yLO7YOHwO360jsomzLfQfH+x7TC47fojx1Xq5xGW/8q/j2VrLpM?=
 =?us-ascii?Q?0PithHNRroez9BSnzLJibaVFsBRIxjMgL6L3/dd3WMnUWOpuYiOfpDFnXQ1V?=
 =?us-ascii?Q?v9FJLThBqCzsx/R1i+QtZ/JqalMbj+qdru28s/pluD+dPxi6L2I1UB3NriUY?=
 =?us-ascii?Q?9kVfDsxbUu0ZWVtBCh2hqiG7gU2A8zPrITNl9yplKtyySVZgWWcpu9aMAkT6?=
 =?us-ascii?Q?0xEo2Gvhw1WrVnjZ8W4saOuJ0liXwkZ9LQ5EvNRvSAF3fQAMgd6JJsHaLvEn?=
 =?us-ascii?Q?YjXd2SEWLGv9lb132yFjTJgtPsuuCdhIoClg72N6kd9W5OcZineqOa+F7mei?=
 =?us-ascii?Q?vDQElJGipQqkLSQ+4Fefxn9Z51UItM4Ec72upVRiHa0TG4WCOtTZ68aNbQE7?=
 =?us-ascii?Q?cCafbYxbzANI8BRtjuBGkWxsQ1nVJIpEfNIg1XZD1nX4n5YWPoZaw4PHWr4X?=
 =?us-ascii?Q?U/K0xM35ooPRVt+DGiDCuZ4YTh0TEgfeEHAyVr/jnFAaR5mOiol9C7wsxdaX?=
 =?us-ascii?Q?vyR6LAawBygJaZpmu6qQYC/cHAV3L/WbK6NZO9J0ivsMREvitsS/XBT1PufI?=
 =?us-ascii?Q?bALPx3p681EeKS3MwaJNYjtVDf/JzFShinfwgUuYHUVEqP2s6I6uQEiz18WE?=
 =?us-ascii?Q?3SOpFiqm9UUBFPkFSu1c2cevJXMwkZd739QP?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(35042699022)(376014)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:09.0478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 414c4880-4658-432c-4681-08ddca94436b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6012
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..3f7175cb0ab4
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

