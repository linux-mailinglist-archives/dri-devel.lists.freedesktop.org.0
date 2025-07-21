Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92DB0BF9E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BFB10E496;
	Mon, 21 Jul 2025 09:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Z/z5ZPtE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z/z5ZPtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1810E496
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:05:29 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U/cwsoZgMULSuBCHbwBLOwT/cVVBZ0gDK9m7IJN834YerCh5ht2kX/vykDfiLV+kavdq50L2jFkWW7DatajEDMrYJzw1nx+QsTxLuoIu/lW8sTWqf2PNGkUHUmNA/8rm4WR/kYZDK3NeAl/QPp6DUsVH92qtIS+aEMOjHs2fJHHf+1ZrHpvOXOy8J4DXJnwINXSa9NJkoEuQCTolqkMg8KL775z531AS8kAXDcfU6qJR4mWUVsJOG46dHz1050IyGk4PbukosAbjfOePSywxFe/64JlLRTse+pob4iDz/XGx34WWxs5PLl1wwKUCkVewXZpuE+o8TaQ3q8rndKQ0vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS/ACHE6w47KFFNhWUrrspb5Latjmyt+SRKiEZgJAGU=;
 b=WIN/yyovmClcnhu4XT24z11FKatDOxAfH3wb7kbsQfWOmEHrhhHBO3pQGlBvg8IeYTq4oa9JmrOqCR50L2X3e0sLu+2zNjdXa4VXhhyUGb+4iz/YFE6ZzlQWdTN1RY2fGzjuxTC1pqThOjFNekFALN0vBG+6ARk6BGw+AvPor0gTeSlnQj6kYHj/ERA2ROAl+TtGfxinbrKiyf5QWK/a066WkGO0D8zUgL3JuIDxiC94kRx0zAGY3n6FizpqDkuVW4qKfEefzbYBwotq9vTZUYFoEdOfox3q6HxFQ65O2DH6X9jOvD+XOEgtsUxNPsiPN9Fr+hwA9DGP4cCMGkxvRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/ACHE6w47KFFNhWUrrspb5Latjmyt+SRKiEZgJAGU=;
 b=Z/z5ZPtE5get2a7b8DKIPWApaMX5THkiXV8/c/ssy9sJ/QzHJE+U+cGmzJZgBsMFqgCkMZGNlwz1iH97tRt9JOQlT9FuwPu3lv4b9FE8AbCXLZlT3h2k/fV4500+yOfb9l3xb4iE9ScRvp5UeO3Yrn/AqWNnTeVZge3PrtrFxhk=
Received: from DB9PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:10:1d9::15)
 by PAXPR08MB6719.eurprd08.prod.outlook.com (2603:10a6:102:137::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:05:22 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::a9) by DB9PR02CA0010.outlook.office365.com
 (2603:10a6:10:1d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 09:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 09:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr8B3XT43n+N1Oi5hRxWN5tQV4EZo+cU8WvnRvZ5RzdDtHo4yxVnX7TLDwaFcMXM2LwLWGtgpZxwttYNdxbCGvvbrpAhn4mF6WuRtoaX32zCgTFEN/Opy69pln5emtvV3RaAFPaxpCtGmCnbw6AHFIAGSNJcipsZAgOH+h7a5d+Yv5vbDgYk1F7jspPS54JnQ87wqcdfrXcHu+2rhjNoIBs/h8n3kzCkL/k8yvbfE0WybDESpJDdpctwt2GlXFkDKp9/K7QZSudBAHaMvmT1XnTp7ACnSN0f+8wWnRLMgNA/hZ1dH20bPQXGS5sD7JfZXFIWdaspyzwJq0us5lHUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS/ACHE6w47KFFNhWUrrspb5Latjmyt+SRKiEZgJAGU=;
 b=qs3fK7lFHNLVwkvDKXA7MgxDBdMJKCkLZzqOw+4TV9HujRfjpUOojo3Z25BaPLh1GOTYxi36lsExlTBRQ6oSmUe/qK2CxZH6a5ZdvGMpfD+WRTGIUMroZh5w/atdq8mHJyNiVQkBB34hmuM1EQwNw/I39DL00MclmYt8DnfVPKgc1Y72mtOrTDgjJ00UlKWpZzpAfW7tSlRzHO6MQF75Z42X/bvZhN6LQJ0XmwCiwGNgVtPvLcQWY5/w+nRBDBwrujXHrOaB7WuoGFmgOSRyeX3fjPvawiXqIiz62S9cbZ4IlP/485BhzGS7XL5DfRXx+RJ6Jq1XHgR3Z8nlEh0E4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/ACHE6w47KFFNhWUrrspb5Latjmyt+SRKiEZgJAGU=;
 b=Z/z5ZPtE5get2a7b8DKIPWApaMX5THkiXV8/c/ssy9sJ/QzHJE+U+cGmzJZgBsMFqgCkMZGNlwz1iH97tRt9JOQlT9FuwPu3lv4b9FE8AbCXLZlT3h2k/fV4500+yOfb9l3xb4iE9ScRvp5UeO3Yrn/AqWNnTeVZge3PrtrFxhk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS4PR08MB7408.eurprd08.prod.outlook.com (2603:10a6:20b:4e3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:04:47 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 09:04:47 +0000
Message-ID: <3a9d8d2d-535b-475e-9ebd-9f9f772d7fa5@arm.com>
Date: Mon, 21 Jul 2025 10:04:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for
 Gx10
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <90e9521ad4deb13fd098f30ab3edae55cde8b5f5.1747148172.git.lukas.zapolskas@arm.com>
 <tg24k25nbli6avakjx4nbjkminpkkw65jiqtwmnc5ozwsrghh6@52fvrd2t6hqh>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <tg24k25nbli6avakjx4nbjkminpkkw65jiqtwmnc5ozwsrghh6@52fvrd2t6hqh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS4PR08MB7408:EE_|DB1PEPF000509F8:EE_|PAXPR08MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b4760e-5a2e-45c4-ddec-08ddc835b901
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?T08vdXJQZkNoV0R0MXpENjVsYlY1bzdIUTYrTHh3RWRqelU4bGoyc0RaNkVv?=
 =?utf-8?B?QnplMU1vNDV0TEl3MUYxWkphVjNzb2RCblBEaHhSQ0RmRTVwdHozUXd2TWtx?=
 =?utf-8?B?OXR6SFM4TGlSMEV1bERjNEhNRUlPQjdodHNHcWtYUi9xWnNjc2UyWVozUEhu?=
 =?utf-8?B?dXFDaU5MM0I0dnJHUzFZSFc3d3AzeUEyN1hTVGRXbC9RVmJFbXZtWHd2c0Vw?=
 =?utf-8?B?RExza05SYjR4dlJvVzMxZHJZaCtzWVBFcTZSVTFKSEtWdGY1MEk5Ui81b2RW?=
 =?utf-8?B?Q2EwSGR1cTZVQnJadnJlUElGNGFrcEhQWVVzYVl2OTBtOCtPcGJtNGZDVk9n?=
 =?utf-8?B?OWFrVXNRdTdFejdPcmNIQkFVT25UTWlTUVNCRGczcmVhcmRMd251TTVUUHRG?=
 =?utf-8?B?UXU3UkNFUnVJcjhjTnU0aVFwQXBNakNQRUxvV0VNZVBQbDFoeTVlaDVqZCt1?=
 =?utf-8?B?R0JNdmY2WGlxZGw3WG9iMjY4TXV5eE13RFc3MFZENHF0ajN4VGxteUhSUWRt?=
 =?utf-8?B?VGdyYlhaYldIdHdYZzZrV0NWUlZRQjZOWmwvVzRnQVVSb3lVMk92RHE3bXUx?=
 =?utf-8?B?UFhOemRVanRMNCtXSGZVeG5aNXlIa3A4dmlTaTA2dzZSaitEcjI3ekpiL0hZ?=
 =?utf-8?B?MUFWVmlKN204d0FQTHJPK1p6UXN3akloQWVIalZYOXpPbXVFZnlhZjV5Skpt?=
 =?utf-8?B?c3NVd0RscjU3eWZxdEZhMzFZdlNadzY3RUZFQTlFTzk0dy8vUm5kdHVPWXhK?=
 =?utf-8?B?VDNBYVkxUjZ0R2N4SGF1cFBDNDZmUlRZdUJaOEt1MFpORFdGcWlZYllLWDkz?=
 =?utf-8?B?RUlHOVBwc0VQQUZzbUlZbS9qN0o2cnhtSVBUd1dYbGpXTnVFSE01RCtxaGd0?=
 =?utf-8?B?V1EzaHBIV05Yci93R3dLYTJkZXkwMkIzTXlXVEdSeXBEemRtYWhpY2NEZ0F6?=
 =?utf-8?B?dmwrb25IbXF2dXhqNnJQVUJCaklObUNOdHNrRUU0bEM1b2VTOHFtMUdnYXcv?=
 =?utf-8?B?RGduL2o0QnFiVWNTTlpVWVF2TU5WNUxhUStqMlZkdlpuMi83bm04OGZmRnhY?=
 =?utf-8?B?WE45cHgwS3ZrM1JGYWlhZ0FSUlVhZjdZRzhTR1NTd29xOXRuRjcrR3NYbWd0?=
 =?utf-8?B?WHU3OUlZTnJvMjhhUXR0Qk5CYllqbjdMMXRUbTNacnhFN3MzeDR5YTdLak1u?=
 =?utf-8?B?Sm5DV283dlNzUi9DeVpwMjlKMDhTMTJhVUc4T3ZteXA0cFZ6R2E1Q1E1aWZR?=
 =?utf-8?B?MGc0R21hTTErSXZ6dVZGVjJNS2dpS3dEQ00yUXdTb2FJNWd6enMrbFJ4TFVt?=
 =?utf-8?B?QkZjSmI4VUhCVGFsQkVTWk45M21aZHJBSEI1aVJGSU4ySEcrSzE5OHR0aWps?=
 =?utf-8?B?OGIvUWdQMHlvd1lJRHBZV2Jub3hoTkJqWnc3Y2dUVDRPUDBud1pPeGI3ZW1m?=
 =?utf-8?B?ZThyTzhuQjdaNFlkWUtJUHBwVEVQcThyVnZDdElKdGpUMHdkaWhkbUJoYUIv?=
 =?utf-8?B?RFNhdTBVSGVPbHBET3ExZlFXMnhMOW4vRWJxNUFvYWRaUXVRR3ZlSk1vNS80?=
 =?utf-8?B?cjYwZ1lQd2ZGQXBZRXA4UTh1MEJRNVU5aE42Vy9CSzFlOHRvdFZVaWp5Sjhy?=
 =?utf-8?B?WWQrZEZLeW5HV0wrYkp5dlhQVHdDUW93MmkxZ2Z6aEg1RWtkZi91NkpMczkv?=
 =?utf-8?B?RlQwRjR3a3RlS2dJQ1JFWlV2VlNNSW1yeGhJdmdjRmFKN1pvM0tvZ3lMc3RO?=
 =?utf-8?B?a2VWT1ZaMld3ZG1KcWtPWlgwUTdld0lMVHZuVXpxQzZNWHpxZHU3dU5nNzd2?=
 =?utf-8?B?OFpFU2hoSHZYenNueUJsZzF0TVIvUzRuWkttN3dTWkw2Tm1MNFNnNGdOV0s5?=
 =?utf-8?B?V0NxN2M3NDFsQUNvck90Y0RKbUVBY1gxZUJGUVdnaVkwT3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7408
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 50666f43-35e2-4e20-6a87-08ddc835a44c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmV2bVVaWW9Vb0lWTmo2Kzl0TnI4dmpzVnlDUE4ySS9mcWtZY1BmTlc2RHB4?=
 =?utf-8?B?cWMvU2JHUGo2V1lZajRnbEJUOXhVLzEwU1lkRldwUEFFV2gvMHNKdzNjdUlG?=
 =?utf-8?B?OU9uRUhENUV4MHpWUnd4VnF5bk5HWTdOQmk2N05wa2FnR2hNSVYvWXRUblc0?=
 =?utf-8?B?WmpNekNWMHpHeWExQzhZRmk5ckcycFYrSGxHdDhCTDNDMUNVM1lreWlxTlFP?=
 =?utf-8?B?MW5yUWt3ODg0L3U4L3YrRVZCaldjL1I2Z2VWM2NjN2UwRXNVeDlZNjk4L294?=
 =?utf-8?B?MHFGd0NYM2pEd1FoYVdSMllFN0FRSkdKL2JRY0xhVnJmZmFiN0ZPTFZaUjJz?=
 =?utf-8?B?MU1qMFhkbG90M0MzckRWRE1wZ2dFQTFOVXYzZ29yRWJxNEtqRFZmekFETHNJ?=
 =?utf-8?B?OVFWZHJZbUZxNEpDL2haTXlzU05PQzBZYkQzOXVVMDgyNlUzVjZWby9GdHJq?=
 =?utf-8?B?TzNWL2d4QWZSeHFxLy9iN21wNzhoV29EVWJTNjFRWVo4b21vWmFsMVF4bGxa?=
 =?utf-8?B?Rk5TS3BCbFZLdzRvY3lqT0RpOS9ucGFFeWgwTVdMeThXQ3M4MFhaL1ljcmNu?=
 =?utf-8?B?TEpTdlhockNZTTBrNEcyclpqa2x3ZVdGRVNkWENNMmt6RWNiOVdsb0RxREF5?=
 =?utf-8?B?N1FHajNrdUJyWjBpR0lJS3pTKzQwNUxRUjZPMUwzREZ0ZXVoRHhNVkdadW95?=
 =?utf-8?B?VW5OVzc2M1hMak0zNmxVU1YzeFNyemwyd3JqQ2IvczdXRlNua2syelRpU1JV?=
 =?utf-8?B?V3RrTEovSWNlVk5QYlNxaEs1SEZOY2JaVEExVW9PTU1jZGc1VFB0SzBxZ2hZ?=
 =?utf-8?B?SUs5M2lyU2wrb2toWFBvMTk5WkJ6RXRiNXp6bXI3eVVMNXpnVmk0UUtCMG4x?=
 =?utf-8?B?UHEySUFON3VCVlRGK3lFRXBPdFRXdmUyQjFyei9HSVMzZHhsOG5STGZIb1JI?=
 =?utf-8?B?TXNQekc0NFVPL1RXbURML2V4YTNQNHh0OGcyNWRCQUZScTd2VHhVemZ2UXJS?=
 =?utf-8?B?dmtpMUVvRnlSOXU2S3FpL1FSdXdNR0lSYU1WK09NUjF1ZndXc0ZBMlJIRWFX?=
 =?utf-8?B?Uk1KWDliM0FvanRvWkRab3hVc1oycVJuNjNPNmV1KzN3Y1p1M3lSMzMxSTY5?=
 =?utf-8?B?SWloRTFTZHQzb3RuYUZZMllJQ0NDTnIwYXduekhFM28vQ1d3ZmE4YWh6NGM2?=
 =?utf-8?B?MEI5WDU2dktqT1VLd04xT0RFL29mUXU1Qjg3cGcrbmptZXUrTFJVdVArdi9G?=
 =?utf-8?B?NmkydVlOWTJoTTg2QmJYdnJqcmJqY3ZvWktMR3FlT3VJWDNTblg0ZTZhU0d3?=
 =?utf-8?B?azVuMzlYeEFmdElCclRYbU8rN0ZMZDNRTE1ZU2pzV1B0cWZla2hIaStHYW5Q?=
 =?utf-8?B?R3h2R2ZoT3Z5Y0FBWEdCc0ZLZU1KTjJ2dHVFejhIUlhPdnA0dHJ0ZHNONmZ4?=
 =?utf-8?B?K0JPZTRxaXRobmhOQnNTcGU2a0o5VDNHTWdyTU9ENS9YRGpodDd6TEphcXRS?=
 =?utf-8?B?S2RMMCtZUlRSR085NjZnMk5MK05NSTZPaHdVSXhhZXBjbStsV1h5UlZ5Vkkw?=
 =?utf-8?B?dmRvbFdEM3lsbjA1R2hPMlBHak1mVzlGOFcyUXhSbkZGeEZPZUZtOUMzNEcw?=
 =?utf-8?B?SDdmL3VvSm1xa3dWOUhRZjlDWktZY2k5NGdld0NYQUVpL1pLbjJSblZvakZR?=
 =?utf-8?B?dURyNW1KS2RyRTN3M3lXOXF6MDA4T04zU3lBa0JTQ240UktUQzV1ZldRZHZu?=
 =?utf-8?B?SUVyN0cwL1N3Ynl4VWY4VWRWTWVic2JtYWZXbW04OGNpa21FV2kxM0RPZy9I?=
 =?utf-8?B?eFFMN0tuY0xiSlYyN3N1QThYTGNUc1JsSWlYYTg5NVVoK2VwKzhPNW5aQldS?=
 =?utf-8?B?RzFveldJaUpBaHVkSkxxY0hmMmc5LzA0Z1dJKzNyVkU4Um84Y01tR2E0QVRi?=
 =?utf-8?B?UkxOeUdjSllqRVVLVVg2QVNRbXgyQ0ZZTGU0RGdCaS9ySnZuangzZHlZU1Zt?=
 =?utf-8?B?SzR1OWhyeFcrRGhtMTMxTmN6cFhnakhjdGd2NFoxTzByTm1BNXdaQUlseENQ?=
 =?utf-8?Q?0sK3qN?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(14060799003)(35042699022)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:05:21.8103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b4760e-5a2e-45c4-ddec-08ddc835b901
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6719
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



On 18/07/2025 03:52, Adrián Larumbe wrote:
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> This change adds the IOCTL to query data about the performance counter
>> setup. Some of this data was available via previous DEV_QUERY calls,
>> for instance for GPU info, but exposing it via PERF_INFO
>> minimizes the overhead of creating a single session to just the one
>> aggregate IOCTL.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panthor/Makefile         |  1 +
>>  drivers/gpu/drm/panthor/panthor_device.c |  5 ++
>>  drivers/gpu/drm/panthor/panthor_device.h |  3 +
>>  drivers/gpu/drm/panthor/panthor_drv.c    | 10 +++-
>>  drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
>>  drivers/gpu/drm/panthor/panthor_perf.c   | 76 ++++++++++++++++++++++++
>>  drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++
>>  drivers/gpu/drm/panthor/panthor_regs.h   |  1 +
>>  8 files changed, 113 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h
>>
>> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
>> index 15294719b09c..0df9947f3575 100644
>> --- a/drivers/gpu/drm/panthor/Makefile
>> +++ b/drivers/gpu/drm/panthor/Makefile
>> @@ -9,6 +9,7 @@ panthor-y := \
>>  	panthor_gpu.o \
>>  	panthor_heap.o \
>>  	panthor_mmu.o \
>> +	panthor_perf.o \
>>  	panthor_sched.o
>>
>>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index a9da1d1eeb70..76b4cf3dc391 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -19,6 +19,7 @@
>>  #include "panthor_fw.h"
>>  #include "panthor_gpu.h"
>>  #include "panthor_mmu.h"
>> +#include "panthor_perf.h"
>>  #include "panthor_regs.h"
>>  #include "panthor_sched.h"
>>
>> @@ -259,6 +260,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>>  	if (ret)
>>  		goto err_unplug_fw;
>>
>> +	ret = panthor_perf_init(ptdev);
>> +	if (ret)
>> +		goto err_unplug_fw;
>                 goto err_unplug_sched;
> 
>                 [...]
> 
> err_disable_autosuspend:
> 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> 
> err_unplug_sched:
> 	panthor_sched_unplug(ptdev);
> 
>         [...]
> 
>> +
>>  	/* ~3 frames */
>>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>>  	pm_runtime_use_autosuspend(ptdev->base.dev);
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index da6574021664..657ccc39568c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -120,6 +120,9 @@ struct panthor_device {
>>  	/** @csif_info: Command stream interface information. */
>>  	struct drm_panthor_csif_info csif_info;
>>
>> +	/** @perf_info: Performance counter interface information. */
>> +	struct drm_panthor_perf_info perf_info;
>> +
>>  	/** @gpu: GPU management data. */
>>  	struct panthor_gpu *gpu;
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 06fe46e32073..9d2b716cca45 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
>> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
>>
>>  /**
>>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
>> @@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>>  			args->size = sizeof(priorities_info);
>>  			return 0;
>>
>> +		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
>> +			args->size = sizeof(ptdev->perf_info);
>> +			return 0;
>> +
>>  		default:
>>  			return -EINVAL;
>>  		}
>> @@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>>  		panthor_query_group_priorities_info(file, &priorities_info);
>>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>>
>> +	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
>> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
>> +
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
>> index 6598d96c6d2a..8bcb933fa790 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
>> @@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
>>  	u32 output_va;
>>  	u32 group_num;
>>  	u32 group_stride;
>> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>>  	u32 perfcnt_size;
>>  	u32 instr_features;
>> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> 
> What does MD stand for here?
> 

Metadata. I will spell this out fully in the next patch set, since shortening it is not 
too helpful.

>> +	u32 perfcnt_features;
>>  };
>>
>>  struct panthor_fw_global_input_iface {
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> new file mode 100644
>> index 000000000000..66e9a197ac1f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -0,0 +1,76 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +/* Copyright 2023 Collabora Ltd */
>> +/* Copyright 2025 Arm ltd. */
>> +
>> +#include <linux/bitops.h>
>> +#include <drm/panthor_drm.h>
>> +
>> +#include "panthor_device.h"
>> +#include "panthor_fw.h"
>> +#include "panthor_perf.h"
>> +
>> +struct panthor_perf_counter_block {
>> +	struct drm_panthor_perf_block_header header;
>> +	u64 counters[];
>> +};
>> +
> 
>> +{
>> +	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
>> +}
>> +
>> +static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
>> +{
>> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
>> +	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
>> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
>> +
>> +	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
>> +}
> 
> You're assining perf_info->counters_per_block the same sizeof() slightly further below
> so maybe you can use that value here straight away.
> 

Will do, thanks.

>> +
>> +/**
>> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
>> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
>> + * which indicates the same information.
>> + */
> 
> I guess you're waiting for the commit in ML message <20250320111741.1937892-7-karunika.choo@arm.com>
> ("drm/panthor: Add support for Mali-G715 family of GPUs) to check whether GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id)
> returns anything equal or above 11 to add support for reading the number of counters from PRFCNT_FEATURES?
> 
> I don't remember whether that series is already merged, but it'd be nice to have it in this one too.
> 

That's right. For the moment, I was only targetting the Gx10, but can add that when the mentioned patch is merged
(I don't think it is yet).

>> +#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
>> +
>> +static void panthor_perf_info_init(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
>> +
>> +	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
>> +		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
>> +
>> +	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
>> +
>> +	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
>> +	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
>> +
>> +	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
>> +		perf_info->fw_blocks = 1;
>> +
>> +	perf_info->cshw_blocks = 1;
>> +	perf_info->tiler_blocks = 1;
>> +	perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
>> +	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>> +
>> +	perf_info->sample_size = session_get_user_sample_size(perf_info);
>> +}
>> +
>> +/**
>> + * panthor_perf_init - Initialize the performance counter subsystem.
>> + * @ptdev: Panthor device
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_init(struct panthor_device *ptdev)
>> +{
>> +	if (!ptdev)
>> +		return -EINVAL;
>> +
>> +	panthor_perf_info_init(ptdev);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> new file mode 100644
>> index 000000000000..3c32c24c164c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>> +/* Copyright 2025 Collabora Ltd */
>> +/* Copyright 2025 Arm ltd. */
>> +
>> +#ifndef __PANTHOR_PERF_H__
>> +#define __PANTHOR_PERF_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct panthor_device;
>> +
>> +int panthor_perf_init(struct panthor_device *ptdev);
>> +
>> +#endif /* __PANTHOR_PERF_H__ */
>> +
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index b7b3b3add166..d9e9379d1a20 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -27,6 +27,7 @@
>>  #define GPU_TILER_FEATURES				0xC
>>  #define GPU_MEM_FEATURES				0x10
>>  #define   GROUPS_L2_COHERENT				BIT(0)
>> +#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
>>
>>  #define GPU_MMU_FEATURES				0x14
>>  #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
>> --
>> 2.33.0.dirty
> 
> Adrian Larumbe

