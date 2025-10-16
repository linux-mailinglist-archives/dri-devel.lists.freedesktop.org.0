Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93EBBE2334
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E5110E2EE;
	Thu, 16 Oct 2025 08:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Cww88woe";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cww88woe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42D510E2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:43:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IGdALvIQkX5b0JwPp7+8VhkUXTCxhGO76LqLoG6eGlevmBPh5ARtldFRBe2dcuOX8E7d/CqBm0ahSt/ZvGyK1cnqipKtprH8bhWlckji3jn323DSw0qXAsM2WfiQq/RjInHXrqh7FqmDv2oO0AMw+gSbuUJxfM+dCxmIEG0XfemfTS7AD/v7+MSwTmga/UHwLJzKQJ0okAIJHJdZ/zJqbOt7Mxl/YIzVPFRxJM3HNdhTkCsGEa7Rgp+MZM5Gg9hYXIxOl98/QJ8EbEezU8aTSwjeBIYdZqD8OmAScmTb4inbMLRqrJS6XGpqAtqRFmLX9rF9sRDuPYz2iSpaIsndkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zae3TlITMk2YFJrgnH4VA+q1cQivb9TzDH4SJooIyEU=;
 b=SDtatgJf9DPVAiUu9hK/CpFSzIYhUmoz9jiX9Fm6MJw2gb84qlxVa54LxZ9hlFpwiENlaNFgy39mvqSufsK7m8IMCpg79Md/SUgeo6dulyezAIRZidt2UcOjq7rpreTHITAihLMs72Y33MpAwxKjVp487w8IBHZlAfW+MjF2Cym7XqqcDNiC1R/oJ+KjM3tQPWE18jSyHpqy8Ta/z73IkQ9xQatd+jGPgFvaaACUN2zJZfBpLtKRw1nx+8h/ViwQNfHm3zJLTCul7z2H5EYhrHjEWk5/4rYYg3Tg+XbV9rEqcT4aidApfHodx3eDX8IQ+SeyBoKCfC97fenG8Bsgzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zae3TlITMk2YFJrgnH4VA+q1cQivb9TzDH4SJooIyEU=;
 b=Cww88woeiLS66RhhJ8dfMY679vhAfRfqvII5rtzWTL8wvsNPY2EacCkoaQJRO2TMeU+x6luFtroKpKTwQlfcBOzPuh8aRMgWq3sTnYGVUiiiIRhD/T1IfpXks4lI0bkCMlYEnGwg9nqdTAgDaoTSeR6p4ZZLS6YFsxjlwVJZ1xA=
Received: from DU6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::22)
 by PA4PR08MB5966.eurprd08.prod.outlook.com (2603:10a6:102:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 08:43:04 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::53) by DU6P191CA0069.outlook.office365.com
 (2603:10a6:10:53e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Thu,
 16 Oct 2025 08:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Thu, 16 Oct 2025 08:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSnNWJzZt7wr1x3UzM7XIeDKv+4KJiLj2h5+VflXe6weEgUoeumQNc4+ItHrWVEQA5vNSwdQZVxd8of0cAHeoZIjWEeXQ3Wcnss6q5WaR0QZe7gGLXkkB7VnQx4hMBgqhIwYmTb/Tu7j6X8/kmTNvyAYVn+4WL+g1hnql4E5BmNRoTr4iyYTjWG1katbjvIxhL2tqZGLjkslkUdkbEbP3SLJQF/ZdhzXtfQCJl8t7weq5feq7SyVEveRG1CeRf51xOt4Dx4Z4fEA5F4c+l4CPxv8aI0daI8mjUO/oBj2cI16K/cKdf/hmZZQC+i9nnox+O9RiEbTQh6dnyCd34Hn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zae3TlITMk2YFJrgnH4VA+q1cQivb9TzDH4SJooIyEU=;
 b=MyxJbabAZvAtfcrw0jczBDSWzGE8JIBGBxY1QiqreBmHUR0kJGFuMHYe8ymTocYEKP9t+0L/a43TsSDXSCdZWfDj/PAuUvTcVLnv12gDy/FMGk+ESYb1fRMDynU2oKu9aVzNCEJ4BovuewtitFqWEMF9JbBqAWYvkIarIafFnfrINv9i+Wjn/fs9xWvC9U9DqW275sktShSw0qxs8sGAlgP4cMZmFDw/az6SVm+a6Dqe0sh5y2Tj/ajDAzfjY44QPtPvBMwWcnm4FKIA7W8J+/XU/u4NTEGAFRq7C/hU50lXpy4ppzqnBwV6BN1LLIOg/C3B4mavF03bLuZSQ3O7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zae3TlITMk2YFJrgnH4VA+q1cQivb9TzDH4SJooIyEU=;
 b=Cww88woeiLS66RhhJ8dfMY679vhAfRfqvII5rtzWTL8wvsNPY2EacCkoaQJRO2TMeU+x6luFtroKpKTwQlfcBOzPuh8aRMgWq3sTnYGVUiiiIRhD/T1IfpXks4lI0bkCMlYEnGwg9nqdTAgDaoTSeR6p4ZZLS6YFsxjlwVJZ1xA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com (2603:10a6:10:416::17)
 by DU0PR08MB9323.eurprd08.prod.outlook.com (2603:10a6:10:41e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 08:42:30 +0000
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1]) by DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1%6]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 08:42:29 +0000
Date: Thu, 16 Oct 2025 10:42:21 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 nd@arm.com
Subject: Re: [PATCH v4 11/14] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <aPCv7ZZ3t2fJvG4W@e129842.arm.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-12-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015160326.3657287-12-boris.brezillon@collabora.com>
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To DU0PR08MB10359.eurprd08.prod.outlook.com
 (2603:10a6:10:416::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB10359:EE_|DU0PR08MB9323:EE_|DU6PEPF0000A7E1:EE_|PA4PR08MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e01d663-71e6-422d-de2c-08de0c90057a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9mCxHL5fsSBQb01utN6AkWMMtYdIIxswzYX/JB0KkMi8C9T23CjgPJgPbMe2?=
 =?us-ascii?Q?QjZE+wOJMpzkdr3FByLDZxVlLFFWNiLosG/x6GPXneHDm2PeHhAd9sxXam9B?=
 =?us-ascii?Q?SdbN/DW/sWqxwZjlV67JFVWw+YdwpULOzbTlqDE0ojD0L8AJvwIRm+14stTk?=
 =?us-ascii?Q?9xbz6H+SxjVU9sb3mv5y77qssW9ECby5U8dVgd4AWjtU0t5yf/jJRLK7FDiZ?=
 =?us-ascii?Q?i8waHm8t/rlHQ2Vv5xP+jkmnqOWsqxuGGePgvx7GjomoIyWgxQVX19CgskF8?=
 =?us-ascii?Q?8jWy3VEa19lufZ6YhDk4qwwfEfScwhfzoMoRYAcGbBiNoTShtkCdRX5gKG/a?=
 =?us-ascii?Q?TVW7hkwqJ6lBAjmQdleJDTp9mB2Bgto+863FOA9/q6QwM+Sjgj9sHtL4YVn2?=
 =?us-ascii?Q?/2notEHaLIdX6D73IRWWKwhD8lb5QSQKQD2ALrEqjtss83FVtC3hxCw9fomN?=
 =?us-ascii?Q?DIHATvLoWZyCfU+can6bvDA9RVFEkcZUBGrhkSb7ry295I1czV7OaODyjSZC?=
 =?us-ascii?Q?KQUTZ7SRl/Fp5og/OI4WUwNvASKhUuSJlmLMgDcG5zCGMnlJl5cKxjueExRf?=
 =?us-ascii?Q?XDDMTAK+w/yc74t1I7inbUewWkgOA0XmnWR9nb8a51AMEN/QimbKay58dLQu?=
 =?us-ascii?Q?oysMtHA+64o7nuQQWxuy55xTQ1JXTltme9plovSbeZrrOvHbxjn0UGkaFG8g?=
 =?us-ascii?Q?XArbGv2Vx1oGM3nbu3FNB47uZ0+UIFr0upoJO7s0aFZSLYEbMilCFY6n9gwg?=
 =?us-ascii?Q?xA7qpzeCkCBWRlrw7yOXulFekw5A/RkQTHvmXD2yuBgZHbdl0YAv5uVmyuGA?=
 =?us-ascii?Q?RouqXrxPLO5uJODA0+L/WgIIOJwkPlbCELNy5DzHnMmbZLLQ51wO6b9T4MYO?=
 =?us-ascii?Q?3AJN+NbMdt+36fXodVqwGKePGUny79oiVFLh02CFiDroOLDt92lKCJjULyFC?=
 =?us-ascii?Q?LLMR1Mkyn4TQp90/tjWyf6j1SAphd0H7y2ilsmG0xB1e8inFqTVAyGeFrBev?=
 =?us-ascii?Q?VE/5xMn5eW5u49JQ0FMeSAxhlIzpL67pJulJoeHJcl8WcszaK5Fhwqhyd/U0?=
 =?us-ascii?Q?VENLex5ZY/y2nAMIsI1dIRTky+vPLvrepNgxfFqAIJX1pC78/FYw1AWGvds1?=
 =?us-ascii?Q?VtPzMEvTdVLXNHqYUKeP3CL+BxGkXvtuqXOnLAxf2ZryEzyrAhzAz3SjfaG3?=
 =?us-ascii?Q?fRFon7CiTcxJIvuAmgK7p93KeYR/YthRQRDJLiHLg6SQrnICePlKOKVwHwYw?=
 =?us-ascii?Q?HjuxpJ987MsGJYhGwUrGdRPWpU5dvXwnylbaoG19/Aomc2QFd1/0sbCYqGDv?=
 =?us-ascii?Q?ENP2GMTatm851AogF/tWrjqW8qvJ8jQ9YIQ6s200n+3/vz/4MZNqwHzMh3Ub?=
 =?us-ascii?Q?C0C38dy20jhw3RGNu7i9hyn/kPeckBVhVj+ghcrTGwfd7zAP6uR17AzcmH34?=
 =?us-ascii?Q?+a7WayBN77RAt1t2TN+pcVQb9j2TTqcj?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB10359.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9323
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12d8a17c-7de3-4222-c346-08de0c8ff0ff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u88gjEf3kTOHPbtxe3mSrDjR0+3SG9wYb7tLP73tzkCVu675qghFwIOHV/9u?=
 =?us-ascii?Q?SzkOnCGOfbNkGOEhHct9KfltyMnqkX0DHcSzknFv9nd8bcHKdEuDMLO6abl1?=
 =?us-ascii?Q?c5eUEbpFrESry11KrSrhm1wRn1+kxaEha7oWLKoLCTWsvUBE6ydQqEZpUSFk?=
 =?us-ascii?Q?Tvo0IeBs5bTsDY2Q9U6WbcQMQxHWXmvTnOgT7So61pGzYcgZQdcBbF3gyi/e?=
 =?us-ascii?Q?P+TQgMC6Rcru8JfT49MVN8Qbt9xoU6GIAU3gpeV1AIO/YgIRky7h+4RzrweW?=
 =?us-ascii?Q?JD3uGUlm7qfM/lkIxYajs+Qjz8IHGKrex/Mr/MgQxm2LKpPxyAURIZsUq/hp?=
 =?us-ascii?Q?1u+sXbvTpZMPEkdjEAihFegL0IuOhujg1rZRz1xzA3LWAKeht7ULzaLY78mL?=
 =?us-ascii?Q?5A+Fc0UkXIhcwo7QyeAcCcTzsAFl7orVYOXlhFH6SYMuun5kJb7dQzz4n4Z3?=
 =?us-ascii?Q?C8D/7oNImkiEO+QQmkRYbcJfROsGLW/FnE0bU4TMJfcLWpIgG1qAq469Qjay?=
 =?us-ascii?Q?Ayo1n+5nC5ap4Dno72+HibnvKAqvDq5Zt1NsRk43TBwPW3duPbboV3eCga+B?=
 =?us-ascii?Q?nFjQB+7V0skYaYPRB83/QrBYKyukc3NLEn56GvBZl3iCdDPKKGily6e5bztL?=
 =?us-ascii?Q?54zbCtWMcgDDZC0+DNjT/2HNNAh1Ug6IDIVTJ1OgbGLmdCVv6MCL67h8t598?=
 =?us-ascii?Q?A0svNh0wKZyH1SK0Z5IIt+VqvkeRHvmfYUaT1mpU5P3YAO67mTD/6EkfYsy2?=
 =?us-ascii?Q?vBx61BFlD82IBsdAe7qDXme9nJb8e+6kjJg2s587pR1I+jXMKKg8GjCy6Pg0?=
 =?us-ascii?Q?s0e17RSdF+yGWGNW9WumB6okSPc+ylpggPTakd7v29jHxM1mauOi6hVXP/5h?=
 =?us-ascii?Q?UAtcI1/8iXhmcDiKvHEoFo5ehxlLgYFTYBsI86OVVZlx1DxfvBgdQbMNldP0?=
 =?us-ascii?Q?P9Jt4Ra/9AjnaoZiMjeDaDbSh630zWpVvIqvuHiT9aL1soG6JxAaOfdKI1dN?=
 =?us-ascii?Q?a3SMZ5Tj54lu45HrGhaoxZolHPqzbrDF7lHbTAm/HB4e9mxUZOR96Hb8BFAV?=
 =?us-ascii?Q?cb1bb1gLCSZ01Qj8g9LjFN2ui1HUI7Rw0R7+reLarHHZJK9EKdeosklh+Shv?=
 =?us-ascii?Q?UjPhiQiYlxb9NT4d59GjFVD3bJDpjAA81irgpxeiuAvaWd7019knpyADjzDC?=
 =?us-ascii?Q?6q4tbXavE6UnCMPNQKraZGY6pir8KTATEuEB8/yeiErHTy7HQjybv/rVT2vG?=
 =?us-ascii?Q?nbc64K+afnQjPPvtdoxcOSyp1f9PBv6yPgtM+6saD4ZqbEAY1tJrNUMjameQ?=
 =?us-ascii?Q?L0e7E7lyqp02zZnHXdL9uIZyvrjqg/kvdUnmCCr8zY0FH1DCtz1hHhl+/TOm?=
 =?us-ascii?Q?WPjqvEvrNr2ShlxwP3pbgr/Ez3GZHCevlNfgZYyPhiFaQllraMEj2y4+yFBt?=
 =?us-ascii?Q?6KCCNXjW6VJpHaW2f5uZlNwCNfDe4+SkGbiq90k0rv7N6DI/sW+ezxDXm4XR?=
 =?us-ascii?Q?cUfUDrDpTrtLRoTacDk+eGO7znNdwIUgKpkALqc0P6axn10Gk69biy+5A5Hn?=
 =?us-ascii?Q?2OeIdfRaCdDs1KIdGJE=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:43:03.8938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e01d663-71e6-422d-de2c-08de0c90057a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5966
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

On Wed, Oct 15, 2025 at 06:03:23PM +0200, Boris Brezillon wrote:
> +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct drm_panfrost_sync_bo *args = data;
> +	struct drm_panfrost_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret;
> +	u32 i;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> +	if (!ops) {
> +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> +			   args->op_count * sizeof(*ops))) {
> +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> +		ret = -EFAULT;
> +		goto err_ops;
> +	}
> +
> +	for (i = 0; i < args->op_count; i++) {

If args->op_count is 0, if I'm not mistaken, kvmalloc_array and
copy_to_user will succeed, but then this function will return
unitialized value. Maybe add an explicit check for op_count == 0
at the beginning and avoid going through all that code?

> +		if (ops[i].flags & ~PANFROST_BO_SYNC_OP_FLAGS) {
> +			ret = -EINVAL;
> +			goto err_ops;
> +		}
> +
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panfrost_gem_sync(obj, ops[i].flags,
> +					ops[i].offset, ops[i].size);
> +
> +		drm_gem_object_put(obj);
> +
> +		if (ret)
> +			goto err_ops;
> +	}
> +
> +err_ops:
> +	kvfree(ops);
> +
> +	return ret;
> +}
