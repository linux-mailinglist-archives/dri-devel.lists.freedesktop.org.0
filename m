Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CBB0BFA5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A610E4A6;
	Mon, 21 Jul 2025 09:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Y+ZW1mkk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y+ZW1mkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7AF10E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:07:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ngOcCf19r5yKZ0WckXbw8LNZ7K1TuUKjHXpIoT1cgacP6bGRaKsy4Q8ugq6uGCuEdGIR+kZkBiG3whDrl/sCpfrZeosNp4oncM0xpwZz5Wbt0OzKTWa3zGIDX5dUqZZ9VRHrrcT9fmhX980sP3jLTuRxGbY0rR8a7g86KCvo5ZNditpLibLXJBvDivLLHVfz/Bl77wNXGJS/hVosbO20848hbJ1ZwpRpegA/zJYFkxmmPH4C/5c74GGTQZrfMjjQvdsRgVi9g3hWtlvwzaSP+g1RxdvmaQ3qhZ89RcFyFtcfYaSQTpSUwxatUaGs8HWY13Onqoce/5vQra4B/N77zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFPx0su67vDXvhrvSK30kENpOkk5ASUDUaGinEo4jiY=;
 b=RMBaA7DZ6XidtH4lVYXdpf055wCv4XUoLr+eU7qJ50fiEpR5K7XQNi54nQFk3yIiYR2hCY5ozxGkCE+nbfiuopHMowMANG5I/zy4B+dCL2glehrGMybDRMrKgsJGoyV+AqQyMaCtxex5MnzubzKR9oN//D1r/lFvnsXSZfXrZnV9fBoOKkZNg/SQ6EnZHdaoxxu3EY7NLfoYvHv+WEifhqktqzUaaGt4n6SyLN9nfxuuLOi3EaEI8RimO+yQ12tbdFPk7xM0hM0jdYzCMOELReYiZNWpyaZYczT6Ofass4V/Vi3oM2u8rZOgUz03OIkdQoejSEt1lnXa3zlaWNk0OA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFPx0su67vDXvhrvSK30kENpOkk5ASUDUaGinEo4jiY=;
 b=Y+ZW1mkkbFjLIDq6vb1jDd8/M6jf/VASbf7xRY+cVFmc8w2sbj4DQhZqNdhq8Nuc+9Ic+pVxPsDg48HrKEILhVRezkF4WmXc1OHtDjZki1OTOgQV9LHzWDcnf7nnvDnq8SlOWAstCm/njLMRqbQssEOY5AxzaAd7x5b762Wv8Pw=
Received: from DU7P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::31)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 09:07:13 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::d0) by DU7P190CA0007.outlook.office365.com
 (2603:10a6:10:550::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 09:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 09:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV9qemz5AGvDccBT0qmDx1eeQSom7Ulr5vjH8AiGIfREfzObTBdx6dKYYYJYT7dWCjN2xsv7Sptl+VPmX+1YRyVP9yahBBVM6cO3Sz3RjPmXEcnt83FYbaao6qlyIlSRuQQNdqJ9mS+e4lVQc4GHdJmG3VYCEobFvjgxMIy7+1cClEu6+OAAul77f7i7SdUJzaC2ngflG+wZas+Ft7pd1a1mJgAEdKELFeFOfMd4WWMXQ/mzqVZ4+x7ETiWwdcqItXEj+bMlQGgyAQIHZ6oYJLbMeGVatj3SNqtqGmqVMICunBzVdSxilMfUdF4Cy+2opbLTGqFMDFGhyyywOtKxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFPx0su67vDXvhrvSK30kENpOkk5ASUDUaGinEo4jiY=;
 b=jugRja5LSwR0/0aVoMtRUcrH7o1addJTi6utrRkNG//1bGFOp56QHUo+AQp8M139ZQuF0ALgW12yeCbPlEWOAaSXgelcfKgcNk7A2kiP1/xhgLO8Vh2HuYhLhUJA82P4yQUyJ9dMaW/LvY2+aGMC1UOTyIvK+2Yrf9OSTYY02kYtjpuZSL2CFmA6Mvfw+njSN981dKrD0FBtBpzvlLQ2W1f/JCzTPywCl+Pow2Fcj853BkwiburnQUIOu+ev6Qxp07LbHBP3M0W/LoA3FrkVYp+Sar/8Yh3hhG+ophaWvgcSchN28qhLpSRRX3qTOfXqN6VE6/lVlMWk7AOrs+sGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFPx0su67vDXvhrvSK30kENpOkk5ASUDUaGinEo4jiY=;
 b=Y+ZW1mkkbFjLIDq6vb1jDd8/M6jf/VASbf7xRY+cVFmc8w2sbj4DQhZqNdhq8Nuc+9Ic+pVxPsDg48HrKEILhVRezkF4WmXc1OHtDjZki1OTOgQV9LHzWDcnf7nnvDnq8SlOWAstCm/njLMRqbQssEOY5AxzaAd7x5b762Wv8Pw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS8PR08MB6646.eurprd08.prod.outlook.com (2603:10a6:20b:350::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 09:06:40 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 09:06:40 +0000
Message-ID: <8ab3663c-c18c-4177-87e7-b7558210e1bc@arm.com>
Date: Mon, 21 Jul 2025 10:06:39 +0100
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
 <b5oqisjeevzkowyw6acwydlencmxeb6fuonesny3paas37we6f@bgh674s7wqya>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <b5oqisjeevzkowyw6acwydlencmxeb6fuonesny3paas37we6f@bgh674s7wqya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS8PR08MB6646:EE_|DB3PEPF00008860:EE_|AM8PR08MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d88600-4e58-4c4d-9ed9-08ddc835fadd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?a0Z1M3d5WFR3YkozUENtdStyRGlJY0xsWDZxbmRqMU5wTmszaThFcjV4bUdH?=
 =?utf-8?B?MFdmNVFJeU1jR0tYSXIydEdIVHZtcHZ6c3FBdDY1emsycHpwRFAwWStZaE1u?=
 =?utf-8?B?NEZFMHBJS0NnbFVZNjVrUkRXb0VlVVRwcndjRUw2TmR4QU15ZUpHSW9keXBa?=
 =?utf-8?B?dHN6RExZN2svMTNhWStObVFsYjNlYjJpOFlNMitQQjVxMkwrMitrd0R4S1RM?=
 =?utf-8?B?YnArakl6RlNpRUhhU0c1NE1pMTV5Nkx3RjJVKzB2SE5CNlRDQVpta1Uxb0xF?=
 =?utf-8?B?dC8zWGhLQWQwQndtYVlVeWJzY3NyZ1Vrcm5ha25ob2NaNzFDbVNRTW82eUgr?=
 =?utf-8?B?ckljc25rTmNzTE1GTTVQSG1CTld6d3pwTTh2VUgxR290R2VTemZha3pTTk9N?=
 =?utf-8?B?Y0J1MDM3YW5YcmxYNXNEbjNzNkk4R24vNi84S0JjTzQzd3BwcDRtQ0ZlWDVV?=
 =?utf-8?B?d1R5dW1IbDdyTHNDQ0FLR05jYnFZUXlxcjM2d01LVzF6K2Z6SllpNVBFM1Vn?=
 =?utf-8?B?QThNaHFPMGh1VTJQdUw5RkZwa1ZpcUNQK3VHVkJQTkdmOXZueHh6cEF3WlVV?=
 =?utf-8?B?WXhra2ptaU9RTEdZMTBUL0RTRDk4Qlg0ZnZkVUlCK05PaDBZWWFLOW1tMzZS?=
 =?utf-8?B?Q0FyVGQ2WFRvSzA0RC8xanh3V29ieTVmSVBwYXQwL1lDL3NlL0tJRTlTbjI5?=
 =?utf-8?B?WlJUMkdzdHFCeWhHcGtsd0U2SytZNXJNeS9xMm5zOU05UXhhOWpMK05Cck02?=
 =?utf-8?B?YUY4ZXhxUmZvdHNVVTlHM1ZDb2hBZndNVHdlRXY4YXU1S01xeXNtME1ZQm41?=
 =?utf-8?B?UEQ3NDVSN1Z1Vit5NEkvdWVrcXhwYkU0UldqUWg2TjBoQm1lQ0txOVQ2c3Vv?=
 =?utf-8?B?bmhFbkhad3dKQkhJRjdJbnlQbXlZMy9uSGRETjhqa1hJaVVHOUo5Q1pJZytQ?=
 =?utf-8?B?VjUvbittQVYvTmExV3JxRGN5MHQ2Q2dPYy9SNSt2ckJjdVExVDRMZlk0UTNt?=
 =?utf-8?B?d29UVmFuZXJ4SDhtWE1LMVJjMzRnNGVPQURMSm8xbm1neTBGa2FLRFFNSWd0?=
 =?utf-8?B?c21TY1JmeTVCSGs1UWg5ZFYzSUxVOGRDWllYUkpyV1dzL01BVlZTNnJHTXhr?=
 =?utf-8?B?cUwvbTQ4ZUp5eVR6L3lyWUJDZVhWaHJyZ21wWE1Fa3FpMm1JdjBiVUU1N2ow?=
 =?utf-8?B?UlRvdlljaHZCZFpwY24vS2NvTEdoRTY3MVMwTFBUTEtqVDFlbm5YeFRlenEw?=
 =?utf-8?B?OGZxbWJXNWtGODBvSU12d3dSN3g5WTQyUUVabWV6L2Nmdy9wcDZXNEgrMnlC?=
 =?utf-8?B?NWdlbmphZVJkdGNNYjlvdXcvL3ZxeWpsaFFBRjA0Q1lMTTNGbjZTZFY1UEFp?=
 =?utf-8?B?Mkw2UE4vRndOVU9UNjd5cllIKzRoRjNWSWswQ0lDUE5OQk9pZ3JzT0tOVjZU?=
 =?utf-8?B?cVVUeGQ5N3VXSXJuSEsrdW85aDJmR0ZTeExlY3I1UlMxNmJvZ29kV1JtZ1Jj?=
 =?utf-8?B?VFkyd05HUUp4YWRYV2JldlFpdnNEUTFZQ1c4a0p0SkxiL2RoSVM5VWExNS9Z?=
 =?utf-8?B?WFpSdmgvc290YlRqUy9xclZtQkFZaUQzMTNoSEVqMHMzTCt3SHZEOUQxWTYx?=
 =?utf-8?B?Y3lYMTBOQUVPY212SmkreGFXNGdvdkhPTWNmT1FnVVovOTV1OG5hUzJab0tH?=
 =?utf-8?B?S0Jtd1E0b2ZuNy94NEtHM2hJSTUzUTVhd0UzbmdLWS9KaHN5S1BqUURxUFE0?=
 =?utf-8?B?Q1NBcnZ2Vk9DYmNpSkpSVU84aC9RQlFFdDdMWTlrSVFLcSs3WjIwTVY3cjBp?=
 =?utf-8?B?aWJYQWF5U3BKRzI0QkdwMENZbE9sTjR4TXRzaklJRmNaWHc5ZzdoNWhYZlFO?=
 =?utf-8?B?TUhwUUxGb0RXOEVWMmFGYlY2TWkxV2kxc0c1cVlXdFlQUkE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6646
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e961242-14ae-45dd-3531-08ddc835e7ac
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXhvOFRWN2VPcTVXM2M0Njh5M3dxRFR5QkVmVStQbE1aMDNJZ2hJY3ZDL1hW?=
 =?utf-8?B?dnllVExSR2ptRURWVThhaCtWeU5JN1lSUzF0MEVDTGs2TTF4eXBUemQ3aGh5?=
 =?utf-8?B?MHlhYkZuajh0d2Z0UExJWHRhYVRXdjY4NmZ6OUkrbUVjeFB3dGFUTUEwWmw1?=
 =?utf-8?B?ZFZiSlk0NnY2Y2hJdEdVYUtXdERoR2I3SE4vbkgwTHNFdktXcHIrMGk5MFZ6?=
 =?utf-8?B?YjdUOHFWbFg3WUR5QUd0ekgyMjJtUmp5c0ljRU1mUFd1TVdwSVNwcS9lU3ZD?=
 =?utf-8?B?R0VsRE5DUlpUbmxpTCswUk5ZYy9BV25xMXFWM3ZOTnBpckdaV3dLeEZycm55?=
 =?utf-8?B?Zk53aWNVT3ZKamQyVDJoZXluNHl3VzhzdXNWa1BKSlFoVkN2NWFXYzJBQXli?=
 =?utf-8?B?azBvN20vWk5rUzFMZkgyM3ZLVURxWFIxVTFZdzFSV3JxMnFid1VDeHJBQUlY?=
 =?utf-8?B?THRsZkRuSlU5WjRDUldkSFBtRDg5RWRISlVNRjN5a1RmNnBqSWpacWpsMFRm?=
 =?utf-8?B?TDJJTldYYjBFK1JYbWw5NXhwQktGVWVOc2cyWjlFL1lZcitHbndteGhVM2V0?=
 =?utf-8?B?by9TcEZORDRUMVhSNENYZE01REhpbFQyWEU0M0F0d1p4V0xOQXdXaUFmcGdt?=
 =?utf-8?B?a1R3WXptYi8wMVpYVkNySTRDd3VnejJrNDN0bWphOGJVaExIS1Zob05lcFFZ?=
 =?utf-8?B?UUtpY0V5aVRXaXBpblNCdnRnMjc2VzBUUTVwWkhQVlJ5ejdwWlIyWW16b0U1?=
 =?utf-8?B?Q1ZJOTczZkdyNDU1V0NMRXZBMWNOVzFiU3Q5NzVUM1NjMGo1YnlqNEZnZE4y?=
 =?utf-8?B?aFJNeWtGcFpUQ21hcUViZkZvSWlYbjRnQ0lwd2NUY2VLTEptdzduWWFpcy9G?=
 =?utf-8?B?Vk8wR202VmNxZnd6QUc4ZkVVcDBTcnVNTGV0RXFLL1FEL0VhTHd6U1FvNWZj?=
 =?utf-8?B?bWg0QXBxaVZRYmNjVHp1dzFMdEEvSzVCWlBveDR0aVBvN1FUd2owUGRVaVpu?=
 =?utf-8?B?OWUxelQzMmVFZjh1UjBOZkdTS1dJZzFQeTZraEZVamd5K3c5eGRkelRuanRW?=
 =?utf-8?B?OXVQK0tQNjZhU1VjQVl1bXA2TG5ObTRVNEJPUXFHSTlreUlhUk9wVHVadmt3?=
 =?utf-8?B?aklFa0s0VkVKd3dFYW9FalZPa1IrR1ZtMjVlY1ZrZFNCSU9IUmEyc2poelht?=
 =?utf-8?B?UjBFUyszb3VlZVRscmNCOXd0dG5lSVRTaklaRDZmbkR5bDB1QjN3UEEvRUQw?=
 =?utf-8?B?L1F6Y05ySVhqd0YvY1MyL1J3c2gvOTd5VlNCV1cvTHZFSEpBMmlIb2VSSzUy?=
 =?utf-8?B?RWdKQ1Q5SjFKeElFS2pVbis2MjMrMmxVU0JtKzBqaXArY2xTNUxxOFNXbzRp?=
 =?utf-8?B?MGZUMk5YYmE1blJvdmdZNzdHaG5aeHZLdWkxQXpSSmdmbnhJdEdxeTZHUFdL?=
 =?utf-8?B?VE4wNHljdEllZElqNHM2V0NTUzZDZ1ZnYkNqdUNVeUhScEpCQ1Y3RVExa3VS?=
 =?utf-8?B?YklXLytxWW43UjRDNTU3OVBtZy9hK0ZUazZlZnIrOGdDenZOMjBSVk0yTWFq?=
 =?utf-8?B?NjYwNDc2MW1QQnh0a3JSSmFYc0dLMURBdDhmeXFvL1RQZ0dhYmJCeWowUjBP?=
 =?utf-8?B?UjR4T0FQNWpqQWx0WGdFOEVQdEdtd29pRWhTM09haEhjaHVwa09oYUFzRnhp?=
 =?utf-8?B?eVgzaFdOaTRIblpJTTlaVjdDS1IvOFBsOXMvSXdLaHF6dlFxWUExTm5sUkUy?=
 =?utf-8?B?NjVuWEZqWTBRWlBIUjM2YW41Rk5Ndm1oVmxhd21wb0xwT2Uxa24xa3RlTDU5?=
 =?utf-8?B?TkcwQ0xWZmN6blpadTJxcm5uNWhUTU94eGtaaitCb3lMU2dhZmtaTU5MNzVU?=
 =?utf-8?B?TlBRMVNxSE5DYnAxSjQxa0V6cHBpcEJiUWc3cUxyeEdlN0loZ2lYSFpVZlRJ?=
 =?utf-8?B?MVJkRTZmVHJMa2VlR3hUMDlDRlhoNjVuaThqL29BaGl1ZktLRWc1bzZyQllm?=
 =?utf-8?B?bjQ5MGs4dmJhZ1FObENYaWFDTDBiVitvMkxRM3ljMWIzTUtDcVhyZlVBdFpR?=
 =?utf-8?Q?cHFubQ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:07:12.3083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d88600-4e58-4c4d-9ed9-08ddc835fadd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
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



On 18/07/2025 16:11, Adrián Larumbe wrote:
> Hi Lucas, forgot to add one comment in the previous patch review,
> 
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
>> +static size_t get_annotated_block_size(size_t counters_per_block)
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
> 
> I think you could use 'perf_info->sample_header_size' because you assign it in the calling function.
> 

I think so. Will go over and see where I'm duplicating the sizeof() calls, since I may be doing so 
in several places.

>> +}
>> +
>> +/**
>> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
>> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
>> + * which indicates the same information.
>> + */
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
> 
> Adrian Larumbe

