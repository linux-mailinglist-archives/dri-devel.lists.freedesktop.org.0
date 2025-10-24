Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AAC0807B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499910EB32;
	Fri, 24 Oct 2025 20:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="m2jVA9pl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m2jVA9pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9378B10E225
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Cw/bvsLKZ+lDWYW6ZhagmMP/fBYEd4SySgtwli2jWyB0r5f9Txo2tGwXURMqXlDl0Tddtph1F7fwJXfPQJ7zr6LgZlgYEoW86rIQcv6Jr9qAwImUzYQMl9ebFBo5b6VcX0u1nOilsug18gNLL7uYOuQ/BdcGI6L/zn9+p7THWS+ILgmK9W7vH/ExP30L/IgE34RnAAmbEbI3Ij0vscmdQBw8DoMXuYMhPMqoggpTkdKIGpIvi8REYcGyrhnaER/ZqEB70jNOdL6h3NWBKuHMTPvzz/ipYOHprhOupZIZO0hCUyBqxKtbN7/BUlNEuLCJZFWjP8QpQ0GyDtD++EdPzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=BZzJGepU3Aia/FXjrOJ1gibjWlBxceioxDJad8ZJSNVfId75uV83SDXbLuGrq4Lz0AwJc/TpY+LsUYjyqMrBe7791UPTVqU+U69+/LwV8gy1qCTznuDACMvOmyESJBGlraN7eWIQFtF4cqWrIsJQOGnk7vS8DvZPjXpWPrIJElTEKX8kV1wBbA0kzN+7POx7lIdy0vxmRVjzT4D0nUwC9I6s9dUvvlvc98lmoUQCY4DCPoDu4gYF8ptsb1VKSuLRyMNr8L4LUgtq+JJJ4iESdRyY6G9vdowfIGE0ok0vVieMBrwXbDt9E3BkekSpUNv/H6B0NiDE6eJyEkh2GGxcfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=m2jVA9plRQzvzdNbHA5drtg5eC8dQ44FxsKGxAvOVJ0u1MsAETDMNoNQlKSkq7v9ZDatOFMbuCO5y4HI+XIN2wcqrIQDAhu5VZoq20vNCt7TFMlGzITjkkBlWHZZ5iHls33YlWzNNJfWlZ2RxVcY+P0Y0L1n02SEzv6OTPmltVk=
Received: from AM9P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::16)
 by AM8PR08MB5668.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:03 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::fb) by AM9P195CA0011.outlook.office365.com
 (2603:10a6:20b:21f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Fri,
 24 Oct 2025 20:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiLhF5jhNX37qw/BugfvDsMz7vkjqNvdV+jP+wSDiYnY7A0k1djHlq7hAAhpRZ6qe4RbOfVWKsI9uBHHR0HDGXU0Evg0el02l0A/unalez05vD+/g3UaYTBa7r8IaU7iAwqB32qDD4a2lck8lpHzeyaraQGT70typcgldzgj2EoNV9+5jbiJzH1XCBQttvm02tH0ImcIwnS6gFHsK4zJ3bgroeTsVTxzxxIh9TI7AxlH+eRp9zgsjUbR3CSHcrIhM6EvddIBY1HeOyZ5lKvNi0OPgscQCoXPIVAjUlOsfvDc1XJCIf/Gh+jbgfSHF0TWo2JxeY/+Ru9531BMBcPjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=vV80Jrru2dVh9LuQw/aORBWhlwtKToIFRol2Vvm4RxZTucGaNqtPy4YY1GqYwLBltRoKD7D0Md1CwyRmD6/rLDURbVEqzDlprQQKbrjeYSGqKV3HRu+pBtC+6+ORFb1fi9f/3aFcLjHhjwpCmJKfoHiPU/lk1Vs0uQFRIBfXMK72zr31N1v9X42moq3yw+IYEqo7It5fRxISqVl+AMET2ztr39HCCo8iGD9M6+f5p5NbH1EM0/J+eAbkP1eEYkRMzbOduDN5TthdL2wyMrtGEmuzyhvJISWDPv0w/uIkAbgXk/pLmu6zAzGWD6mSX/Kdphkkd6UoVrqIzsjAqU+s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=m2jVA9plRQzvzdNbHA5drtg5eC8dQ44FxsKGxAvOVJ0u1MsAETDMNoNQlKSkq7v9ZDatOFMbuCO5y4HI+XIN2wcqrIQDAhu5VZoq20vNCt7TFMlGzITjkkBlWHZZ5iHls33YlWzNNJfWlZ2RxVcY+P0Y0L1n02SEzv6OTPmltVk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:26 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:26 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] drm/panthor: Add arch-specific panthor_hw binding
Date: Fri, 24 Oct 2025 21:21:10 +0100
Message-ID: <20251024202117.3241292-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|AM4PEPF00027A60:EE_|AM8PR08MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 444b045f-38a4-49a8-2e0b-08de133afe20
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NyEKApwqQ3TRCyC63l91AI49Igom6rkaNmd+2amylim6h36o4Xfa/B0XM1Nn?=
 =?us-ascii?Q?TRuIEZOqXpuxHm3CjcBkNE0tW8i8rcw6LCRe2B41e3InIIn9RqRLSstb/627?=
 =?us-ascii?Q?TjEwPmGrR2b8k/0XOM3Yvmp3QKEZSM81xc+rqslLqtaNZXw5NCQiabP8yBZL?=
 =?us-ascii?Q?Me3z0hsTM1kX8zc4F7vRyyPTpN6L4aSy8viOdSzQ67xNGwPAYmqD+AlQJP5w?=
 =?us-ascii?Q?ZFMhja+SUdmNsqy4WQX81L/dJfLI2Ob9CR0dXdH+gkAynCVM9YagZGYBZeCW?=
 =?us-ascii?Q?Gnf5BwTNFqttZE/4Zq/QQm8iL6X03Qg0ReZ5VznuqjxPXzEFJ43iBt0hrEK7?=
 =?us-ascii?Q?Q+XAbxkai0+TUaNzTYxtiIvCXq/XSCc/7bsMLA0I0DkDzPy2JGNkDIXguk8w?=
 =?us-ascii?Q?pNYIIHrT1hLyk4HX3Ymm+1qF2jKrtRjplv2BAptJIuvZlXIE02yNh2/eO3CW?=
 =?us-ascii?Q?9D5FmPhxQtsqmpQvFjRTrghzv77CTiEtrs0EmOdYj8UjZBx4QNgbSDGrJ/vu?=
 =?us-ascii?Q?t6yiMBJU3dl2/z5YKy3LiTaLP0pHXOHZ5vZkJMQILgjKo15G9LxfeCuVl/ML?=
 =?us-ascii?Q?zLlMFTAI65FgO4veH7sp7hDLWg1szR9cIPr0+i9McSbYRB43bKoEeE8M6leY?=
 =?us-ascii?Q?pl+dBFhb4uDtcqzVyeMUq949n/tdalQbJ48rI+qkYg1hig2XGT30cyhmEFDH?=
 =?us-ascii?Q?IpPWGtPhSZpD8URPw9gvS3k2Xaw2ttcHZIY1MJmePfM2G/zqmHThBTqhpVmE?=
 =?us-ascii?Q?qRfoUNI3DbPlldhH+JxKCBWPPIw5PgZXHNsEdYhl+PB9HP/MaRW7E752+Ji6?=
 =?us-ascii?Q?1pLN3Ti9G2poyhEfVLU9hbYULBUd6V8ldnYonXZW2dr6W76/sWIgUduyxDnu?=
 =?us-ascii?Q?YVTthKX1lkb2lWGW6/9qq6VF/tf2KY6U3V8m/FYau/g7AsW4mWVVRs8k8b6o?=
 =?us-ascii?Q?HE8+HUIQgh9JXdIPTTTjocLlBntshYz1xUzA3CHRjzgqs+rI8btFQDJkhPro?=
 =?us-ascii?Q?p4qsMw6OaT4uN7DLtcSehCnEeuwtQs0iyYI3pqaDp6OpUdObEopznNthW7FF?=
 =?us-ascii?Q?YFvJgrFnEXa7llrWOYNL+/t+zF092K64H+x2EyP7C1sFWWC6gQp3ZkAF+GLE?=
 =?us-ascii?Q?hTAjYUbNglYewXdTQlcJnqCupNh5nNAEWYzK62feEZSjGL9Jt9ajXwRFjg0M?=
 =?us-ascii?Q?NRDMAc5CU5CogNk2V5rSasfErR88bNTjFWbC5/L4A6KNI9kX1gM1elc349yt?=
 =?us-ascii?Q?7bHlqHyICs6g5hT+79Kuq2W8MgoLRLAjLKA1UT3Id9xIduKT2/uFiHKTdIY+?=
 =?us-ascii?Q?pmbPRbQ84YNfaG5YzQN5Q8HQHMmFh+MCD0T9DwmevkYLyQ2Uo0Epb+alm4UB?=
 =?us-ascii?Q?x1NsqLjpiwJ8d0yoFNw9t7ANXaU/xkdN2dvliuQh3PeSQNYz3jcAsZ2d7ple?=
 =?us-ascii?Q?422WOlfXU53q4TNlXqd3yjD1fnjCLdYK?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 74599367-9b3b-4a7b-f459-08de133ae850
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ttw/ScdTP4Nas0HboqEDJj9F58CeJ3aF8OONQESS58DWfiARh2hKIQOWIdv?=
 =?us-ascii?Q?/5V2KCPCYDJVwMiztCGOKp1Ug5fg3VrUjo0o3AfUaPy8e3BDEzo6WUt8B85v?=
 =?us-ascii?Q?UczNQ64RDucylSJBZ2AvYvHwU8fOunttLQ9I2SUjqJd77w1O15Vtv8V36pcM?=
 =?us-ascii?Q?ciZAtRuesTerHyv9iEuZ/WtsBbwBvDMlrgCayV8hWMcxY/OpeIeEzbc9qA3H?=
 =?us-ascii?Q?KvRo7zwyUzgH5eq1/U9sCQ82SaDXlMHu1Hde3mrK4UqY7wrH1he0TLK9mrPr?=
 =?us-ascii?Q?d6EBD4u6Q5y2uHBDinZot891Ej89UPGladMhmR9BRBOnlz3MzuyDu5aF66I3?=
 =?us-ascii?Q?DiPsVmWEZ7aC8mE089LrlH+sdVxuYgCmJ0xUQC7dvuxD71CPdo8RfVCr2r/z?=
 =?us-ascii?Q?5tZ9SHcsLX+p7Kpm59w5URq5WvA36DvDk7j9VIFinQs9QjdVzUOJvsSUGP3U?=
 =?us-ascii?Q?SbGUALhy/o4dCjxAAGrC3PATQ/LwIQjqfDRWWsw+2MeUCka1py8vdh1lPaeX?=
 =?us-ascii?Q?cLBlzGYs6Iji9PgdJVSiVzGuv5cqLlVwy6m6dFCf9I1R50yheM+uMUcORh71?=
 =?us-ascii?Q?wtGxx+xGkf84hRHWTdIaokR730mZTvIwxN28PC2rYMMuOjZKY95i9aH++G6A?=
 =?us-ascii?Q?sDo8aV3a0/kn4q2ZUgiPik/KM/S2JOghME1Jitmlm9QZe7MGnWO943i1xz3c?=
 =?us-ascii?Q?Nm6vTU4gerbSPdSYf1Gez6LBhmaMlwO1osEdgyXOI8+ANDsIS9rizLkH52QO?=
 =?us-ascii?Q?kdGBbokPWTPDwCZPCpfw8uTIS1LM54yOaq38GCpCrTwEWyaBG3LR5zh5F/N6?=
 =?us-ascii?Q?ncYcLXYHtaYzFTaSzQQtqIVli0iuRFkJADwkHvRCpOwBXxCwkh2+J9SPXmqt?=
 =?us-ascii?Q?Ome8dCY84KNUNIzHdGEntwF43PMSiDzpSkdfno/zSJqHHcn9cLSgaTZkur7U?=
 =?us-ascii?Q?RZL6LR2HXZHHktzxaTy6PSzDm4tFMtTsw8nyRAa3egGImm1lKn2YnPsE3Owy?=
 =?us-ascii?Q?7dnQtWmpocqFWOSKXe6OpwrQcoh/HUr0Lx99UdcnTGOUt90o+rc2r3CzgT98?=
 =?us-ascii?Q?+rwJUVL7ah7+O+pc21lGwQ9XdWfVxI7XmdP9+4XvItd06mZCB0FVqNiVJ+tw?=
 =?us-ascii?Q?4UnkR0AKVVG9blyyYBISW4779hAeRR1lT+oRyEuUQ9s/LhWN+/qWoa4ZaF3D?=
 =?us-ascii?Q?/T/q50I7IQqaLsEG+wwDlq8vF//wGGoQvfw6vL0CQ40ua+vFSTAK14rg0cto?=
 =?us-ascii?Q?ssyI/hzwl7YqT4TMvkGOfC6KJHjl4arMA2CTQi6O00ZUrAglZJkFKv1sDU4L?=
 =?us-ascii?Q?j7PMjG/ESO9yhRUKVZS6skDj4vNkdw1woKKxGyE1OwzFLOPdZ2kbHYpE4JJo?=
 =?us-ascii?Q?nu37VhMuY00qkSDC9nGr1wKPxa2Wkf8Js43Uz//pdd/Kly+ey03H6xs9OPHH?=
 =?us-ascii?Q?9XT4jCP1B1fnnqhMD2bCN70rW9gWuQHd53QzgNI8XCWpT07HukghhZTSjxgF?=
 =?us-ascii?Q?BWtnPj8JRn9Ku9sMfRy6fhRxx6Spttakn06QHqcQsXxScC2YVgkiJ1pit9D1?=
 =?us-ascii?Q?+2+x4uOX46hqj7sEXK4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:02.4864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444b045f-38a4-49a8-2e0b-08de133afe20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5668
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

This patch adds the framework for binding to a specific panthor_hw
structure based on the architecture major value parsed from the GPU_ID
register. This is in preparation of enabling architecture-specific
behaviours based on GPU_ID. As such, it also splits the GPU_ID register
read operation into its own helper function.

This framework allows a single panthor_hw structure to be shared across
multiple architectures should there be minimal changes between them via
the arch_min and arch_max field of the panthor_hw_entry structure,
instead of duplicating the structure across multiple architectures.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (PATCH 01/10 and PATCH 02/10 in v1).
---
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a764111359d2..1457c1255f1f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;

+	/** @hw: GPU-specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4f2858114e5e..b6e7401327c3 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -8,6 +8,28 @@
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))

+/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
+struct panthor_hw_entry {
+	/** @arch_min: Minimum supported architecture major value (inclusive) */
+	u8 arch_min;
+
+	/** @arch_max: Maximum supported architecture major value (inclusive) */
+	u8 arch_max;
+
+	/** @hwdev: Pointer to panthor_hw structure */
+	struct panthor_hw *hwdev;
+};
+
+static struct panthor_hw panthor_hw_arch_v10 = {};
+
+static struct panthor_hw_entry panthor_hw_match[] = {
+	{
+		.arch_min = 10,
+		.arch_max = 13,
+		.hwdev = &panthor_hw_arch_v10,
+	},
+};
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
@@ -62,7 +84,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;

-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
 	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
 	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
@@ -117,8 +138,50 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }

+static int panthor_hw_bind_device(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
+		struct panthor_hw_entry *entry = &panthor_hw_match[i];
+
+		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
+			hdev = entry->hwdev;
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -EOPNOTSUPP;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!ptdev->gpu_info.gpu_id)
+		return -ENXIO;
+
+	return 0;
+}
+
 int panthor_hw_init(struct panthor_device *ptdev)
 {
+	int ret = 0;
+
+	ret = panthor_hw_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
+	ret = panthor_hw_bind_device(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);

 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 0af6acc6aa6a..39752de3e7ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,6 +6,12 @@

 struct panthor_device;

+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+};
+
 int panthor_hw_init(struct panthor_device *ptdev);

 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

