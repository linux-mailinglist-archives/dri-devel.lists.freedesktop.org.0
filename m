Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81128B12071
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA8C10E215;
	Fri, 25 Jul 2025 14:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bW/S2RMd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bW/S2RMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F110E20A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:59:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NqwgB7xCKXPDzv2/nrrEwhJHy6FVI3sWHOkUi4Hvb95f++YkoQhXSyqZDo/I76kKGGArQqZDvLcnBtpGIeX8rEc5O15S64tM99WNQc/65yFifurMgfux2YyhqbkbfUCcJ7Wk+DzcWDE8VY8rIwJoEd2VO2j7GWetWDKg0hGefm4vAv5giMT0DdDlUBm9TCq4a/gyyGnqxCX8v9h7+nbNGO6JwrdJjo/zbl/aUxJURyEVe3GUnRpDMe+gyEBk3dEwkJLg+nTIhrAW+uBXU9MHJQeidT7hqfPdr529hjQ1qaiFD3ljf6VLppECDn/mq7ogF1OX1UwW4/NV9ubZ9SK43A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4UHniNHMAMtdddiAEixDUfNHUWfrir84lKxiNadga4=;
 b=CujQM5SBSQB17FDdMNz1IGfXTSSas0Kyhgg1OZQdH6xCHE/p452y+asbHGq3Kz8VzjX5sTtGo4dMYUjNFD5CTrRNB8+aE0BBKz+I6eXBliyyzEocZ+CExyoI05YcL/yhHm40IVa/60if4TZ6Kp/KHbMcgvqCm7181gUM8wjn3qvTwiQnek5fkqcbX48RLUgvgSISixMpjOn7PUN71myGXcEixx0rruV/bN7Snqn5tiaMUpavGqBzgF/0hkFimRHqIKJBHegcXbJmPnu13SPK6B3aEoDvv/HxcglW03UUIJJ45WUgObMoWycVbaLWBwVXtgbXKGXhq6UFRxNNlhz8Ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4UHniNHMAMtdddiAEixDUfNHUWfrir84lKxiNadga4=;
 b=bW/S2RMd8clj9oGJ3fGV4tHBBf6L2Bn+WnTOjlXTwgSXorSXyvSnPZ8PJLnX3URbe9SJnAfFXS+hbrw2sC7xF85FQiiPzFn5Q3/QKWHqW73FjOL3pE8VqsoosJu7qj8of9tVZJu32Iqyr/J3YV8g0v0nqin8I321cZ0xSlo+sec=
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by PA4PR08MB7618.eurprd08.prod.outlook.com
 (2603:10a6:102:273::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Fri, 25 Jul
 2025 14:59:21 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::4c) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 14:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 14:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxZlv7Ur3Tr4OPfMB1o2XMAqNnaUvRewfTJ0xQoLYVOExFajkrsWulkKPytSgc6byrFD1e53ZePUH1kG0q4DEn+r3RA+v3hCtyCHwTSEGhpWcx5IlXm4L8KFt2a0T774cGuOVayb39Mqz6WWSHv3NK5ccmjO1NaEPNrUDEe2RRfEZ5YDRsj6dkIT6mS8o/abcDwPUU1KPkkl1m3OqmsD6tgKCeAT936vY0CqC+fiaOuUizb3JBymeCAHSMZIuI+dqOM2bzCBSPawF8vf9RFGpCUJYKiqw1T+O3h3R5k904KtfjGi+iGCGPYDQr4qD0MwIZboirlo0Mtz2c+wFF0H2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4UHniNHMAMtdddiAEixDUfNHUWfrir84lKxiNadga4=;
 b=zJQMSfGUDeJ3StOFxY9VUP4QeYUYwV7M0JIu6ARknTYaBWCwtF+hADINfOeLMMYV+boCaTepG+xC6V9LOcHtlUqPbySn50K9FfDC838rY13j5+QFLos6M1fDenn2wDut0/7pDdiKK5pBc66hgCrd7UA/Obk/5bGNWRPXLBDkIJwq0OXGV5T2WlK0/rKGcjvbFKUFEb48aeb8lfIbWJfcXBQqwtP7pvKJRr9zWxpu6jEmp1m09rHwauVuBZuATbcJNUz75+NuqgLkkstoYWYYcmudY6aGHJkCR3tYApcxce46HGgeELi5MSR/wIdzJ45BdA7mI1IMzE0zmIe04LCiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4UHniNHMAMtdddiAEixDUfNHUWfrir84lKxiNadga4=;
 b=bW/S2RMd8clj9oGJ3fGV4tHBBf6L2Bn+WnTOjlXTwgSXorSXyvSnPZ8PJLnX3URbe9SJnAfFXS+hbrw2sC7xF85FQiiPzFn5Q3/QKWHqW73FjOL3pE8VqsoosJu7qj8of9tVZJu32Iqyr/J3YV8g0v0nqin8I321cZ0xSlo+sec=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:58:47 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:58:46 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 0/7] Performance counter implementation with single manual
 client support
Date: Fri, 25 Jul 2025 15:57:51 +0100
Message-Id: <cover.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::22) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|DB1PEPF000509E3:EE_|PA4PR08MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f91ab27-2446-441a-086b-08ddcb8bd58d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MDZxSDBaN0plVS93cnZZdXpZaUNuREtWS2xYTFE3dDJZcTgvR2p5TDNKdnJO?=
 =?utf-8?B?L1MyYTRSclZ1Rm9zN0RzK1B3VUk2TU1taDRtMGdDTFBCS0pJRnBaVjZCQmts?=
 =?utf-8?B?MzhFSE1rVU5MR0s5S2FXNHBESzZBL09IeXM0K1FXR1VtalNDOG1EQUtFRHlG?=
 =?utf-8?B?V0g5Qi93ZmRpQ2hjVkZSbFE3NHVKZjZUZ2EwbUhsdVlqRkhVSWoxdXcxU29j?=
 =?utf-8?B?b3lMdkVZY1phKzBVZ3NwdXEvYlhwTzg3dFJxVXVtRE4xVDRoaElIQjhVZEdC?=
 =?utf-8?B?aEMvbUs1SnlCTk1XYUwxZGJlRlNPOWlmYXVIV2dka0sreW5iUXlKNWVtWEQ5?=
 =?utf-8?B?dW43c2srWXhEVi8vMXhVMXAzdnU4em95SEdrQ2psVHNzUjQ0dGs2UkhydVlD?=
 =?utf-8?B?SDYvcEZLMmRLdUVwbUlqSGVaY1N0VWhMbXMrNGRPQWFnRXdEVEsxQWNnZGJo?=
 =?utf-8?B?U3RSRW1jSS9NQVM0clhXRUkxdXRGNFFheGFtS3BpTzQ3S1Zjblpvb2FJTXAw?=
 =?utf-8?B?M0N0TDlMMTQ3Uk1MamFIa0ZjQmUrQStwLzFMWmZNRmExbnFxZGp2ellld2pJ?=
 =?utf-8?B?Y3BxNWN0WDBObXlvYi9LNTBCeC9LMm9vdDVRcUVLOUlNc2hjbXNCbSsyQmE4?=
 =?utf-8?B?eHJHdmdoVW1KRGw5M0s5eEpyZUJxQ1dlMjV6T2UzSjFwQ1RHWm4zVnYvdVh5?=
 =?utf-8?B?Q003QUt4Rk9wVVZtNkZzbXFmazZWT3AvQ1FrRGtXQWt0aDVlYlJCY3lBR2lC?=
 =?utf-8?B?b2hmdm1FblV4Kzg0a3pJM2MzUlFiYi9obU51SllrUFdxdEFaOGEzd0pBUGU1?=
 =?utf-8?B?SWJuOFZMN1hNenlQUnJaeHUwakd4Y0hYWDdlR2c3YjJubzBBMU45SXQ1VGJJ?=
 =?utf-8?B?VkxxL0Z3cGlFY0Naa2U3Qjhrd2w3Q25nZ0FROUVhak42M1NiUmY0ZFNiSXVP?=
 =?utf-8?B?ZSsxUEJJaUZ6dXowaGtrS1FIeUhrYTFwM2RtR1hPSkhJbTM1RENyeUtzbklX?=
 =?utf-8?B?eGZmdHNSS1F1c1VFQ3ZZdm5VTkpGTjl0VWJubTdBaFBPTmNEUkFlayt2Y2JW?=
 =?utf-8?B?VFlHSlEvQkJ5RVlyckM2ZXcrVTlPUkkvV1QwNlZVMUxaQTgwUEYrdHFUMmpX?=
 =?utf-8?B?NFlPUnZWYXNJQUFVRmkxOVpMTjc3QmFPYUZWOHB4RXl1cjFLVnQrampPNDJJ?=
 =?utf-8?B?VWJjeGFxemp2b0xKcVIrQmRQcFNtNjZvT2ZDc2F6TmRZeGErN2Y1S3ByNlZE?=
 =?utf-8?B?d2JIRWNBVE1KbmZxM2NpRER3eWY0alNzQlZyajltVDFSZWYwczR0aUl2QjV6?=
 =?utf-8?B?UlUxUXlWRzcybnNNajVzelJMYTlxaTd6bjN3dUtVV1FvMTlrMzNKRlJkUXU0?=
 =?utf-8?B?SHdGdk1mVTk0c25IZTE1S1ppSnFRbCtxMDVvQ2ZHeWJPQlQzZGs1OEd5a2Zp?=
 =?utf-8?B?cmJveGN3cG1SbnFxcVNlY2hpVEcvUkRRekpuQUZRVXJGWm9aVmFXSWI0YkN6?=
 =?utf-8?B?clBXNHVqc01DaGkxZTd0dzE4WFNSUHhacGRPMElZYnJYbnVyYjNuTnZnSWw2?=
 =?utf-8?B?aW5DRTYxMHF4U09BQ3ZZZkRjZ0tSYmNiRk1WVnJONmpwUEE0R1YyU2p5VjJy?=
 =?utf-8?B?M3dQVDFoUkQrc2ZKaHZYZzFURy93ZVZmb2djNHQrRnA2OEZMd0FSbHRlZzY0?=
 =?utf-8?B?OTB2ODlSY2RrL1V1NEx6WUFrL0lJSkc4ckR6Sk5xQ3Nha3lZVnJIMEdtTDl5?=
 =?utf-8?B?L3FTZUl0aGZKKzJQUWJqYXREVWpySWZzZy8yaENZTlIyQVJFdUxzMEgrMFhL?=
 =?utf-8?B?c3NXSzhQS241ZGRqbjcvVDhQbWszV3dFbjMvR3paMUNWQXVYdG0rKzhEUWlW?=
 =?utf-8?Q?mqfxknu27aRJK?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d12051d3-d662-4976-1b9d-08ddcb8bc1b9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|14060799003|35042699022|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFBJbjRtQm81ZGwrS0lZVEdvbCs0YkZzRzlndUJ0ay9ZUTFVOHdEdFVWMEN6?=
 =?utf-8?B?VzE1TlNhTmsxNVY2dGQ3aGdZYzFYVityUUFtT2ZPcCszdStpakVTTEpiYTJD?=
 =?utf-8?B?WjBDVlR4R1NGTUhoMVFJTXJrOW0wNENrdU5IM2p1Qkh4QXk1d0FTL0VHNkVI?=
 =?utf-8?B?ZVNYRGp6ZUdQVklTRTAwQlQwd1hncXBRcTBpS2R1TWkrbDY2dE0wK1RRVVRR?=
 =?utf-8?B?MkJpVWUyUjBoMDBhVDJ3UXNSNTU2VUhlUmYrUUZEUGpYbkhwZncvSFJucGlz?=
 =?utf-8?B?am0xK2dWTC8rRENZWGxjaG5wRk5HakVUMGtKQ1JYKy9WYStheE9vT0RRNUIv?=
 =?utf-8?B?bm9jb1ZMMVlheWZ5RUt5Rzhldy90bkh3VFZZVHNBSWlRUWFENnJpTHlSM3ZN?=
 =?utf-8?B?U3NCeUNkMlJpZXR5N2Y3OHBaa2JrTmhsV0lzNjVObGpFT3RJZW9JNGl1MGZK?=
 =?utf-8?B?UEZjQ0Zzem5MWWV6YlQ5cG5tSnFzcGh1Y0JFSTJKYzVZWi9jYkNIa2s1OFNB?=
 =?utf-8?B?NnREQ1NxMjRHQlI3bWRHTXJQTy8yTVF5UXlQdnlYQngzNDNpTkNWTjJzdXdQ?=
 =?utf-8?B?enI5eTBpbXlaM3MwYk9HdHNtMTlzNFJGNGJDY0NTZHQ1K1BtNGljb3luZldx?=
 =?utf-8?B?SjJWUVVPMGR2UWMvMFJudTYxbVVkUk5mYjlTVUVlT2NZYUF1YkRpc3lEUExD?=
 =?utf-8?B?R21HR2JhTmZIMU5UbmtHTkFFN3dsS3gwWlBUTy9BSXM2aGNlQ2Q4RXBvOGdJ?=
 =?utf-8?B?dVNaSmoyYmtqcmQ0SmVTWnk2WmRUTmh3UXlxUEI2UzVCTUM3NzNLTVRTU2kv?=
 =?utf-8?B?UzQxbTlVOFFEZUpEdERpQ040dnp4VGxvUjJDbHF6bnMzejllSjhaUk5LbGt6?=
 =?utf-8?B?QWY5WERFMzhIRjhFZXVjYWwzTHRta2ZGeGJxWTFvQUIvUFExZW5wSEwySjB3?=
 =?utf-8?B?dC9QTXlNaWoySnJwcGFFWm54UmZtQ094RndkN3JGWGdUS1BtcUVGYUF2Qjh2?=
 =?utf-8?B?VzlFQkc5U1ExMjR6dHVpbGxlMEMweUFkbEVEV2ptdVhXMTBNYkVhOUI3Y2lT?=
 =?utf-8?B?UzEwT25JWjRDRDlMZ0llTVNjWUk2cTQ4VE1vNXptbW1kRUhyLy9wN3hVbzZa?=
 =?utf-8?B?cWFsWUFjN0FDT2ZiZkgrU1pScUJmaFZLcWp5REZHUEZnMldyWEFpZTJWUXM4?=
 =?utf-8?B?cmg0UFd1WERaVEo4Sk0wTzVDYUw0cnQwV0JZSHR3ZWF3cEFpbjFjcDE5UHgy?=
 =?utf-8?B?YWlZMGdvRFVSS3lXQ2RINVUxUDEzZ3o5SmNPR2ZTZXpNa1pYckRYNlVFOGVF?=
 =?utf-8?B?Mm1JdDBrcEh6RXZhQTY2d3VLWWphSGVyc0NVUFdqU2YydjBPQ0IveE9tazZr?=
 =?utf-8?B?WlZ5czl5bFNIWUJEMkFIOUliOEl0dlZtbFZyUWtNUEcwdlA3NDVxTVlKY3dY?=
 =?utf-8?B?ZmJZL2wwc0lmdkNScGlzU0k4NjhEbm0rQU5KUUhGNmpLa0RGcHZhTkFYUmlL?=
 =?utf-8?B?OEtiM0tiOWNWejcvYTdEVHlwK3NvckVCNXBLdzI1RnQxY2E0MXR0VWQ4NFRy?=
 =?utf-8?B?dXdVWk1Xa3picW9EaDdDNXpHaklJdG1DVDVoaS8xdk1FeUIxSmJic3dEZ0I1?=
 =?utf-8?B?cGNnTFM0TjVRdjFlanQ0MXI3aUNxdENKUFZNRWhxNlVieUFaZG5UZmFmUDdz?=
 =?utf-8?B?aFhtWTRxdmNmUk1rRDJ3Qm5nL1NIY29ySjU1a1A0elFMd3RNMnRRR2RUUy9r?=
 =?utf-8?B?SkV5aDdDaVNMMmlsVkF3QmxtZUtDOUNQSE9NZWR6bUpmNXpvc1dzOEFYRG5V?=
 =?utf-8?B?SjFibUxVZTNzeE4xNmhVTE95dENUWmwvNVlkTSt1KzVIcVAzVE04VlI3NkxI?=
 =?utf-8?B?T08vSjVXSkp1OGRVV2M2ZExlVlgrUTMzeWduZ1B5NnFhdWIwczdScnlCQnVT?=
 =?utf-8?B?M0I3eHZVdzRVSmVreTg5c2NkVE52SEpJWEFyUTBJTXRWd0U1RDhXWVlDNXBy?=
 =?utf-8?B?RzhzMDZLRVNBPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(14060799003)(35042699022)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:59:19.9028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f91ab27-2446-441a-086b-08ddcb8bd58d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7618
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

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1]. This version of the patch series fixes a number of issues,
including FW ring buffer wrapping and IRQ handling for the
performance counter IRQs. The size of the sample is also added
to the uAPI, allowing for the PERF_INFO DEV_QUERY to be sufficient
to handle backwards and forwards compatibility of the interface.
The Mesa implementation is also now available [2].

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or exiting a non-counting region, or when a
  shader core has powered down.
- clock cycles elapsed over the sampling period and
  clocks associated with a particular block. This is
  because the clock assignments depend on the system
  integration, and are needed to normalize counters
  representing clock values.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

v5:
- Started re-using perf info size fields instead of
  recomputing the size where needed
- Removed panthor_file pointer to the drm_file
- Fixed ordering of subsystem unplug on init failure
- Using the kernel struct size to allocate memory for user-passed
  uAPI struct.
- Inlined panthor_perf_sampler_{suspend,resume} into
  panthor_perf_{suspend,resume}
- Inlined
- Updated all callers of CIRC_SPACE_TO_END to use CIRC_SPACE
  for correct ring buffer wraparound.
- Free the session and sampler enable maps on termination
- Drop the return values from panthor_perf_{suspend,resume}
- Update userdata and end timestamp on accumulation
- Removed the ptdev checks on suspend and resume paths
- Link to v4: https://lore.kernel.org/dri-devel/cover.1747148172.git.lukas.zapolskas@arm.com/

v4:
- Added sample size to the uAPI.
- Clarified the bit-to-counter mapping for enable masks.
- Fixed IRQ handling: the PERFCNT_THRESHOLD and PERFCNT_OVERFLOW
  interrupts can be handled by checking the difference between the
  REQ and ACK bits, whereas PERFCNT_SAMPLE needs external data to
  validate.
- FW ring buffer indices are now only wrapped when reading the buffer
  and are otherwise left in their pre-wrapped form.
- Accumulation index is now bumped after the first copy.
- All insert and extract index reads now use the proper, full-width
  type.
- L2 slices are now computed via a macro to extract the relevant
  bits from the MEM_FEATURES register. This macro was moved from
  the uAPI due to changes in the register making it unstable.
- Consistently take the sampler lock to check if a sample has been
  requested.
- Link to v3: https://lore.kernel.org/dri-devel/cover.1743517880.git.lukas.zapolskas@arm.com/

v3:
- Fixed offset issues into FW ring buffer
- Fixed sparse shader core handling
- Added pre- and post- reset handlers
- Added module param to control size of FW ring buffer
- Clarified naming on sampler functions
- Added error logging for PERF_SETUP
- Link to v2: https://lore.kernel.org/dri-devel/20241211165024.490748-1-lukas.zapolskas@arm.com/

RFC v2:
- Link to v1: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35024

base commit: e48123c607a0


Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   16 +-
 drivers/gpu/drm/panthor/panthor_device.h |    8 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  150 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 1969 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
 drivers/gpu/drm/panthor/panthor_regs.h   |    1 +
 include/uapi/drm/panthor_drm.h           |  565 +++++++
 10 files changed, 2760 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h


base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
--
2.33.0.dirty

