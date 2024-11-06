Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC49BF0D1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCEB10E2DB;
	Wed,  6 Nov 2024 14:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bf7bXhox";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bf7bXhox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05910E2DB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 14:54:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DgX0sorJ7meFlxmAgSY92PcwEtu4T7PI/ISLifRJS0JZeeDm2xFSetmd5v+FQdaVRRLkrBTZP+KUZDTulbLZNM9+3FuXnKXLJ19ljPsA3KseGJQqyjfLG/Bt5HLkwz998hq1Bt0o/5A+r455TigNDQEWHcfIcd+lFHr63P4+OOqZGsWTlqPvvj106mt9umzOXYnPs/gx932GDrdFIkq5a6tsvu/dT1r8eKgY2YR9jlwwLXTEIg02zzJoO68Pto9paG3OHkFnRjZJBhsdwSWOsBpowvhtEfMupfyGgBtixPwOPsh6tAu3mZgdbPG1v+0DDsm4uKNOBcBFNyc9f5h9JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNX0UwRv+qLsNsRZwiinlwfPfEA+K3X2Rc5FDmrwnfU=;
 b=y+qpnTD2S7Bghep6XZPgiyHyJtSZn+ITu++/ONJS6Q8BN8F9x48Krd5L57fok28xjxqoVGGJb5x8krmfaKYbeAHjXVHZNSIMPcIHcCMESEH6l3lZGQ+3m3rvFRZYpAYT+2HBcjFtbqYanIGk+SDNBey5S7C5nwM9nvoMsqIwiImYDaXojYRdwgcboApuMBHbiipdhF0F5vNIrGeDYZBtlI/00bQyGmLYwHSO0wCa55nUfEbWD/x2F5fQENr20D+/LD+UZO1m6Fqdh5yBuaQkuaRBXfa7mFAF+Y0WE40++t1DkPO4qer4EhNUMKPYAMxowTMDV3F87Cs4iGf+FmNAHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNX0UwRv+qLsNsRZwiinlwfPfEA+K3X2Rc5FDmrwnfU=;
 b=bf7bXhox5U5Y3GNj9ZZ1qkIDUyVb8dO+Xj2D0gGACgVWjOeNaI8/czvOZf0rUTpiz21uBTMbuS5nL1HxSEghj+PassNWGUQLqiiBIyzlodBdSUcnUrKhRgS12lTWMGHJP8Pxihe0OV9TmqHHJaikKmhALUPEAZElhhB4Jjp2Pzs=
Received: from AM6PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:6e::24)
 by AS8PR08MB10269.eurprd08.prod.outlook.com (2603:10a6:20b:63c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 14:54:49 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:6e:cafe::11) by AM6PR02CA0011.outlook.office365.com
 (2603:10a6:20b:6e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 14:54:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Wed, 6 Nov 2024 14:54:49 +0000
Received: ("Tessian outbound 4a86a9c66651:v490");
 Wed, 06 Nov 2024 14:54:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb93ed8f21fdd855
X-TessianGatewayMetadata: 9HrQ6pzOh83UnyzXQy9mILFIph6dYIpfSH0JtQnZuJQ/w2dxtsFwQYRvY4OoljkyBzE74sKlrx3B4uH94s7MjQRhMpaIBdLhr3pZpOMOna2LF2AG1MzYn+KpWYeUDbrkt8RVO4apYjV+oWhubnBFUQGAliguvh5YZeGHezfC8Go=
X-CR-MTA-TID: 64aa7808
Received: from L0df2076e97fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDDF1B90-5F8D-47DC-A1B8-EF702E13F8DE.1; 
 Wed, 06 Nov 2024 14:54:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0df2076e97fa.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Nov 2024 14:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLCrkckhU0Ihb/1ZwXdwa7h2qFIsUfE0aNw4C6lEKbFPRy3qaauh5m406xd453Z8QHh5cMtVU25FmM1EHNmN0hr9IyxGly4fR2RI5ETCVczA2e34BYahaCQ64Fa3PJJ16Rl9y41XGA8xWPID6Usz5ViS2aJ6RLPhOot+PskQnN1QRGZNsZoEjJXygJMNsFaawZW+5FNrNQ2TYTdYTc/VP1GKE8ns6m0GMtXkeBL2uLdcmuO/Ife3zsng5c4vpw3DFyfwWNeptT7NidGM/0j/PkV9FeHagciBj03jCpxsbETSHFO6/r5TrhtcgQcidVLtlo8MmQHx3FTr+JIA+DFlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNX0UwRv+qLsNsRZwiinlwfPfEA+K3X2Rc5FDmrwnfU=;
 b=uBB0Dcq129Q590hhCD6s72g852ywHsfzEkFlOn9Rsf0rjaIKOx4igdc+tN5JB+vKKNiA36jX2eNTl3dF7dtNPDGpT4DJOAfZ4qT+xwjxQcJiPxpXHQN78Z4LAlmudCWO1y3Yl9bK7Wz2mR3Z+Au6DX0hKIqsJgDb/6nkJUXO5DLrObYkiaggUt9LLrDdQYtQf8y+MYKFNJM+8DQN73HmrN5kew95G6C6lS8H4cPyEkcmj2WStGnJiCARTCDZAvK8WX63HiXIV7p1e3yBh6zf5E+b8jh2BoHFMmiuXOkwDPNDZVRKxUoxGsoCTKU6xeB3EWuGNEElr/Rt3ft15Qftzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNX0UwRv+qLsNsRZwiinlwfPfEA+K3X2Rc5FDmrwnfU=;
 b=bf7bXhox5U5Y3GNj9ZZ1qkIDUyVb8dO+Xj2D0gGACgVWjOeNaI8/czvOZf0rUTpiz21uBTMbuS5nL1HxSEghj+PassNWGUQLqiiBIyzlodBdSUcnUrKhRgS12lTWMGHJP8Pxihe0OV9TmqHHJaikKmhALUPEAZElhhB4Jjp2Pzs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAVPR08MB8845.eurprd08.prod.outlook.com (2603:10a6:102:2ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Wed, 6 Nov
 2024 14:54:21 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%3]) with mapi id 15.20.8093.027; Wed, 6 Nov 2024
 14:54:21 +0000
Message-ID: <2f4a5d25-a804-4a3e-b4db-efce774b9692@arm.com>
Date: Wed, 6 Nov 2024 14:54:19 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
From: Mihail Atanassov <mihail.atanassov@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
 <4e7bc9e6-f3d8-4e21-94d9-414ff0857553@arm.com>
Content-Language: en-US
In-Reply-To: <4e7bc9e6-f3d8-4e21-94d9-414ff0857553@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0686.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::18) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAVPR08MB8845:EE_|AM1PEPF000252DA:EE_|AS8PR08MB10269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e56aec9-5273-4015-d4c9-08dcfe72f67f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M05nbGhzSEpvMXgxaGt6bEtkL041WExvQStOb0JLVElRQnBiNjgxY3hjNXdo?=
 =?utf-8?B?OTFzZmttd3A0a0RteUpkeXlqVkk0WU1ZbTJYZVUwQU11RTYvYTNNOFZpdTYy?=
 =?utf-8?B?L1pnMWEvb2dHWEdDZllVQVI3bjROeVZKOEUzMjd4dXJDdGJyMUYwMGVoQVJ3?=
 =?utf-8?B?NzI0RHpsU2xGbWw1NDRxLytJSk1OcmZsd1A5SDdJRXJaRDVBc0tYLzU4aXJm?=
 =?utf-8?B?Skl4UWJLTzkrSE5xTzRyMjE1NW5jNEJIaFVtcDQ0QzdpQ2R1NFMrL2hRYTdM?=
 =?utf-8?B?WSt4dnlkOG41U3IzSXNXR1NYbmovV3FqUHdPM0FUS25XSE9QWlIyWUdMT0ta?=
 =?utf-8?B?ZkhyQ043Qnl1NGgyMjAxbkVRNlRGckpVZWpLdm1zYk01YjFhU09abzEzblRx?=
 =?utf-8?B?RTFoMXdmWjY3SU0xMWNXdi8wYlh5RzhEd3Y0YnlaZHNxdjZzUm10WjlyTzhr?=
 =?utf-8?B?bmZNS01zK0dWNGVNNCtiT1Yxc3VkQkRjazRzVUZTV0cyU2FFVDVXOThZa0Yz?=
 =?utf-8?B?R2hhYUVHejNHTzFVVmlvSFhLcnBVaXVGTmNHbzFwSEVTWjNmb2FtSXdvbHZl?=
 =?utf-8?B?dkRFS0JlczAzRUlCdjJBUWlOeWM5Ny96UkRHTkNIRjNyQlFiNVgwd3V5NS8v?=
 =?utf-8?B?ZXlaRjJLZ1lkSnFEeUE0WmV0cFdEc0wrZ3hnSXUvUmlEWVJQZjY3c1JKcGVm?=
 =?utf-8?B?MXJuSnNJYW9zNTNTdU5NeFNpNlhmdnJKK0ZVdUpuNkkyM2E1WGk0cUJlUlBp?=
 =?utf-8?B?bnFYenJ1Q2NEYkJQSjlYMlQ3UG11MGN5dDBZc2ZOZ3IxRFo4WDhMU1FXaDlE?=
 =?utf-8?B?OUZnbGY4SWQzNEZXSXJFd0V2MUk3UUVybUt1MlcxWmtZTjF4S1l6Ulp5UmNB?=
 =?utf-8?B?RGdER1hTc2xEaXcyWkVXNEFjaDFvOGM5RmtIb1JoaEozNFdobFR1ZStOZDkx?=
 =?utf-8?B?Q2NxcmRGazk0WlJ5SGYrZm00djMwRTRYekRUV3Ixa2JOYllVaDU2bUtaUzRI?=
 =?utf-8?B?VFVhR3FVNFBXdmVOdGY0S1RlODV0a21zZEpmTFZIQ25maGZJTUxrdGNKWVFQ?=
 =?utf-8?B?SU9IMUJIOE9FVm93Q3hlZG90cVBwNFBVVDcwOXdiZGJia0pZUjVwQkpqZEFL?=
 =?utf-8?B?cVZyT2JxeWNSd3MvWEtuUEJOL241UUhIQzlXbUR4bERoTkhaSy9QSmZETTVn?=
 =?utf-8?B?UzNCaG9NditRNnM2NWxGQTN6NXFkc2lPVkZSTllJY0VtMHd4MWFSdW5idGR0?=
 =?utf-8?B?cE1reGVLbkxIckVoQWtPR3JtaUsrR1dWM3A4azJwdzY3UHNKaGZnVytiTUNF?=
 =?utf-8?B?VVd0TW8yb3B4ZndGZHNlUUZzZTdlL0FnMnZ2c0tsOFRFdlBnWHFYUzNYZDhu?=
 =?utf-8?B?NGxSVWR2U2sxeEUrUHVrMHhHRUh6VzhMVU9uRkFyMzkvRVV6U1pnUm8xUG0r?=
 =?utf-8?B?aXBxdzErZzZjdXdhaXAxT0ZWRXFLalNUWVV2dkFBdTFBaGNQSnUrV3JmbllJ?=
 =?utf-8?B?YmRKNEhNNVQ0ck9oL2VzZmZSdUprMG5JMVU4WG9CdDJPMXdMVGRpYjBzQlZy?=
 =?utf-8?B?TjRTenNmSlc5UmhycTZBei9LdWRGeEcrNitFV21aZlFNakJrWWZORXdPSWVm?=
 =?utf-8?B?ZkdLL2hnOHB3YW0wUTJuNmExZ2d6UEdkMDRYMVFRS0VuaHNINDRMS25tN1Q1?=
 =?utf-8?B?V25SOHpBRVJKOXZpdUgzdHE3MzFWa1QvV1Z6RTR4cUZxOHl1TkdDSG9UZVlv?=
 =?utf-8?Q?+p5MCLh6deQGivJNtZ4FZCz9X67zdywusgwSO2F?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8845
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6524eaf-2497-4404-aefc-08dcfe72e55c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVBXOWNUcXVPbkVDc0N0OG14bm8zLzczaFgwQ3Y0RElIUXd4bDNEQWxxenNk?=
 =?utf-8?B?NVQwQW5aNDZxSVBTQVZVdHhGMTVTYm1aWWQ1N0cxOUJDQjRpUzVwTm9EeEpy?=
 =?utf-8?B?Y2Z6dDJIMjZvbmphVEQwZE0wTVlBVk9hZDg4U3loUjdCMkhPczdmNTJyZ3JE?=
 =?utf-8?B?aEszTEJWaE1rMWdxRkowcnd6bkxuYzBkb2VORWduaVIzUEYxK3JjZlV3VjhU?=
 =?utf-8?B?bTVLYk5QYXJrSHNNeE1qeVk3YnVPZnl6bkRpVjBRYndIK3A2STRobHlMTUlW?=
 =?utf-8?B?N0NscHhiUGk1dXlKQm5RY2gxTEEzV3ZCOWZyV1FnQ3FoZjZSYWFsNER3Nk9h?=
 =?utf-8?B?UjdURUROamR5MTQvMWtwYUJVeGJKUDF0MmlvMjQrRGFsWFdhLzZGQWU1azVj?=
 =?utf-8?B?dXFFdUFqMUVCYzNFdEwxbnFXdTZ2dEZScFZsZFdneTFGQXBVMm5WZWNXRVNz?=
 =?utf-8?B?MFlnYWVqaStCY1pxWjR3aFZVZzBVc21XVC9yOW5XWEFMbkNXWlZYSmhaTjQy?=
 =?utf-8?B?YXdOUmdmVEhZTVEydmNsdWxGMVd0RTZ1S1BETnpIdFZqU2VxVktFK2I2c0ND?=
 =?utf-8?B?WU94MGh4dnVSUE1EWFFBTmk2ZEJLVXA1WEhQOVl0bFg1SHV1SkFiVFh1dCs4?=
 =?utf-8?B?cXF1dHZMbTJITmVick1IRFVTUGtHMWJDaE54Tyt6S2FPbk81a2wzSFhvZUdh?=
 =?utf-8?B?MmtoU2VZTTcyNkZScWVhaXJqWWxUcmJQVHAraWpTZTZmZFd0TmphdmN6YVF1?=
 =?utf-8?B?TWx3d0s4MHVPYlV0TlFKQWdoVFZIZEZIbFpobjFVSHJxbXlCRVdkLzR6Nmt3?=
 =?utf-8?B?bXhYSVVHbjJ2d25qaDNrSFhQUzlYZitkMWZsbkNmdDhFUXdOZ1BkdnJSQks5?=
 =?utf-8?B?MWNVTnI1QXFLR0wrbjNjRTJTWm43R2U2QlJpOHU0VlQ1SGhQMVVOYmhGMGYy?=
 =?utf-8?B?K0Q0bVpuOFhMVlYzN1IvNXJDZEt0L01nSTN0M1Vsb0gvaVQ0VlI3STlkZito?=
 =?utf-8?B?RW5CeDQ5eFM0dUVVWGlZbG4rRjI4RVh1NkZ6WXBINEpmRGk5SERvSFNaMVF2?=
 =?utf-8?B?eXpKNHRBSkhCb0JQQmN0VFJDTjRnWUU1T2ROcUFKRm00QnlFdjB6dEUwT3Ju?=
 =?utf-8?B?a3FzZmhQYytoUVQ0T0N6RU9XVzRQejVQQ2hQeDQwd3UxRDBCdWNycjIyMVJM?=
 =?utf-8?B?NWhWUFZ4MmJPSzd0eW5GeGJjVms4Y3VNQmlmcENuMHpRS3hXakVkNkgwTXJq?=
 =?utf-8?B?cmY5SXpYaWlTeERMMkhRaVZWY3phQThrVkV3R3RyTThrQ3ArWGdLc3dwMDN3?=
 =?utf-8?B?UDA1NHlCdHUwWTIrT1dNQkllNkZCd0JBTWpobkwvcitxYVcxc1NDNUNRSTNX?=
 =?utf-8?B?akx5ZmJkZHNmLzFzT1Q4UEQrWE1uL3I1UHJIUU9mOFhlUTVhakhaR1ZVRjg4?=
 =?utf-8?B?T2w3MENCKy90WmtnbzJ4Um0vMDBZc01qdmVlTjNXT1BDdFNrUHVKQXd0a0pI?=
 =?utf-8?B?ajdwbHJLUWxuclBoeUVuODhoYnZ4b21Wc2RTL3B3b3FTMzFHekNoTldzaDJa?=
 =?utf-8?B?aUNIVHRvNUc3eDhQU2NKTkdPVkczck02MnhNVmMxbW5Tc00xdjBpOXMyd0Jp?=
 =?utf-8?B?cm80VkhYWTNIcDBQTmw5T1AvOEh6RmZXbWhBaVRPeFZnRklvVyswcURTczhh?=
 =?utf-8?B?cEZKcC8vWWIxWEo5RE1NNTZyVlVtSWdQaXk0R0xUaGhHVks2bVpTS0lFUUhJ?=
 =?utf-8?B?MnJkS3JUZmRyQXRRNlRMYXZDc1h3UXFPR0RNdlBJQTdRcmNEcnF4a1YxUVdW?=
 =?utf-8?B?Z25aNkpmK3NUR3dndUc4UUlSQ3RMUXllN1o1anlJb2FpUCs2WDFMaFFOMHds?=
 =?utf-8?B?UDlHUU1CSlk3U3A4TitzREJNdUFUakZqMU9ONnJXQ1Y4U1E9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:54:49.4442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e56aec9-5273-4015-d4c9-08dcfe72f67f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10269
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

On 06/11/2024 12:14, Mihail Atanassov wrote:
> Hi Liviu,
> 
> On 06/11/2024 12:07, Liviu Dudau wrote:
>> Similar to cac075706f29 ("drm/panthor: Fix race when converting
>> group handle to group object") we need to use the XArray's internal
>> locking when retrieving a pointer from there for heap and vm.
>>
>> Reported-by: Jann Horn <jannh@google.com>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
>>   drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/ 
>> panthor/panthor_heap.c
>> index 3796a9eb22af2..fe0bcb6837f74 100644
>> --- a/drivers/gpu/drm/panthor/panthor_heap.c
>> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
>> @@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool 
>> *pool,
>>       return ret;
>>   }
>> +static struct panthor_heap *panthor_heap_from_id(struct 
>> pathor_heap_pool *pool, u32 id)

s/pathor/panthor/, but you already know that.

>> +{
>> +    struct panthor_heap *heap;
>> +
>> +    xa_lock(&pool->xa);
>> +    heap = xa_load(&pool->xa, id);
>> +    xa_unlock(&pool->va);

s/va/xa

>> +
>> +    return heap;
>> +}
>> +
>>   /**
>>    * panthor_heap_return_chunk() - Return an unused heap chunk
>>    * @pool: The pool this heap belongs to.
>> @@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct 
>> panthor_heap_pool *pool,
>>           return -EINVAL;
>>       down_read(&pool->lock);
>> -    heap = xa_load(&pool->xa, heap_id);
>> +    heap = panthor_heap_from_id(pool, heap_id);
>>       if (!heap) {
>>           ret = -EINVAL;
>>           goto out_unlock;
>> @@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>>           return -EINVAL;
>>       down_read(&pool->lock);
>> -    heap = xa_load(&pool->xa, heap_id);
>> +    heap = panthor_heap_from_id(pool, heap_id);
>>       if (!heap) {
>>           ret = -EINVAL;
>>           goto out_unlock;
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/ 
>> panthor/panthor_mmu.c
>> index 8ca85526491e6..8b5cda9d21768 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool 
>> *pool, u32 handle)
>>   {
>>       struct panthor_vm *vm;
>> +    xa_lock(&pool->xa);
>>       vm = panthor_vm_get(xa_load(&pool->xa, handle));
>> +    xa_unlock(&pool->va);

s/va/xa/

>>       return vm;
>>   }
> 
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

Lesson learned for me -- at least build-test what you review :).

With the typos fixed up so this patch builds, I can't observe the race 
in `panthor_vm_pool_get_vm` any more.

The other comments on this patch notwithstanding,

Tested-by: Mihail Atanassov <mihail.atanassov@arm.com>

> 

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

