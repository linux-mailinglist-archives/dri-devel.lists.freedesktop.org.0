Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E1CB703F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7A10E890;
	Thu, 11 Dec 2025 19:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="fRQiLjb3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fRQiLjb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013031.outbound.protection.outlook.com
 [40.107.162.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226210E880
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:38:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pLJ5cHnUBR8413eeRSy2AmIDgDfteUtN2ZxKrsYyB7JzFv707OAWvgp9SFKF00/DOVpb9yuNx8WCsa7QMurZnMV9zLWRgWu47YgipkTO86GmGp7toYbPA8qRDo/Ha/pxXYARm13yE+fqp37eFAgP5HlEpj6J+wLCYLDQ4nf5WeFC2qn3YFofEkZsID/bNTryg6COzSpDEAUcPAgnyJNW8YH7aP4Q5ZeosTfxUavUzv1k6Th08OhkrKoREaH9KY81sy9C2PzDDzmSQljiNL/sFwCRVwUaWqUCBoR9hAsDwKTNhczGL3KrgAmsb7toYM20YYwxTYZAJ3Lomipb4Xp4jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmV8ud5+m798UK7U6dAP/SlWW7YmMfW17qWlOGjgV7A=;
 b=CeqhXSsa+IDV35XioMUCU04BR456wRnjIATOBQMFqy9nRTU/MBNl+AZBj1dMQl47cdHWTJL/sDHcIlAF5p9WzWvt1Dx+M46rkPibBbmdArRKoEDidrArVCI5yAoVmMzuTTHDJdBoYc5YGNBZw+O/xAuglE24hGwMfrDz60zcll6faTjBSGzBUaLUMPYWwM65KOipH5GXYa3RUj722UWGTxIoAuzxxyJ3CPqnWo53oOLE4+FzGoPvONHngLROvR9VoFeDX8efnTLG4mIhg5uUl16xijuFAeW8A8NEnCF42108UNuuGkpyWbNWiKYAbOCMS0kZL9JVreKmFtSfaiYDKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmV8ud5+m798UK7U6dAP/SlWW7YmMfW17qWlOGjgV7A=;
 b=fRQiLjb3XQJRugd/8TMVsXxW2lVutPU1TICFl6FSosHDxHo4qWa55ycMuTGmjdmiotGZWxVChTYuKbOFbFaM0y9WEnVT8pQWogiK+wd++saLFLmIltXG6kDGhPdyF9ObCAKj6dVG543x3Zx5qUODUUm+OZQqvLU7eFjEsJ66jn0=
Received: from DB3PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:8:1::14) by
 DB9PR08MB8483.eurprd08.prod.outlook.com (2603:10a6:10:3d5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.10; Thu, 11 Dec 2025 19:38:15 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::31) by DB3PR06CA0001.outlook.office365.com
 (2603:10a6:8:1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Thu,
 11 Dec 2025 19:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 11 Dec 2025 19:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs7/wndkKDggVezuqT5X3Qv4AubBqZkq0PXnY6RrC7Ami27nGpzPxTM/ThdixDtN783zTj9Q+mUAYSpaC3xZl4J2sRKBxdzbCLyf+YwHHBKvEL8oDYB7Nu9h526NfRkmisXNuOpO/5P2a/KxwfJxvyneiOPb2kMn9wVgOHssCqAPKoXZKMF5HE+RW7oeG0pgbWE41ov5+1ELZ5DnbJ6+B5B8mX461IdHoYrJKHDv6yNqm/ZPaD0dXt9SqTGO4lgM1YLvqJpbQdaVNX+S70dI0WqX4/IfU8AcUiu8GyHjZxn8Yx1roQzU3h3Va5cBD9/WFGl2RdhUxCJSCK8pSv2FSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmV8ud5+m798UK7U6dAP/SlWW7YmMfW17qWlOGjgV7A=;
 b=GS/nkgbXNT2En2wzwYBt443t2a8cn7sbqWr7Vql8mJM6ZKax3zgAffM2Fd65QJgllcV4/0jvaHEcBoJd/6sM6wnwjFV8Kx++LWg6G04RDirA9gD2WUjbT3HXNh9gh0zHBVCDYBX0xQVE8jFNVGzVc9XCejrogoy0MZisBk+sdAkYl1fo58eDrPuLyNnBjjKu4Um1yWQIIwLqtOR0+tG1qAQxUsutHCp4/RXW510aRYRs7bACAWvV63BCZvFCi0r8I7r5lMzC6tZUbb0draMkOgpWUqmVUOz1zcgGon372kQgy/hLA+pbTRGlUSyrwf+vSKIIZSRAbHnCDhybR8/DeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmV8ud5+m798UK7U6dAP/SlWW7YmMfW17qWlOGjgV7A=;
 b=fRQiLjb3XQJRugd/8TMVsXxW2lVutPU1TICFl6FSosHDxHo4qWa55ycMuTGmjdmiotGZWxVChTYuKbOFbFaM0y9WEnVT8pQWogiK+wd++saLFLmIltXG6kDGhPdyF9ObCAKj6dVG543x3Zx5qUODUUm+OZQqvLU7eFjEsJ66jn0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBAPR08MB5766.eurprd08.prod.outlook.com
 (2603:10a6:10:1ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 19:37:12 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 19:37:11 +0000
Message-ID: <6e261518-6b91-4790-8f95-b36f0435fb81@arm.com>
Date: Thu, 11 Dec 2025 19:37:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/panthor: Add tracepoint for hardware
 utilisation changes
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
 <20251211-panthor-tracepoints-v3-2-924c9d356a5c@collabora.com>
In-Reply-To: <20251211-panthor-tracepoints-v3-2-924c9d356a5c@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBAPR08MB5766:EE_|DU2PEPF00028D0C:EE_|DB9PR08MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c9fb8c-92ac-46f2-1aa0-08de38ecd3ab
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WS9DV0F2R2l5ZjIzZWoxYTVTb1dTblpzSlU0UXhtUitYa1RpZG1RbE1mazVj?=
 =?utf-8?B?ZHBKMUxvMkFnaklvVlFKY1FPZVdKWnorUFdQaE5TM2QxZFNuSUpaMUcwMUNN?=
 =?utf-8?B?UTZGR3Vybmg2VWwzZDQ0SlZPWXRFWU42QlRuYjJpKzBaQ05EQ1VIVCtGbTVR?=
 =?utf-8?B?alVMd1RQbnNqSllWcTduSHljZTVsNWlWTi9CMnhxUTM5REFvSUFweHg2L1g4?=
 =?utf-8?B?RTRtRmo2MGRVWnplZUFYQloyZXZDZUxrdDcwbzRXNGZodE1FeVRqbnpJaFJr?=
 =?utf-8?B?cTJaTzdNaDRPRFpQaENKQ1k2d01pM1owblZoaVRJOG5SVFhSN1JEeHR6aUg0?=
 =?utf-8?B?bm1pbzNpR2VUNGpta2xoZmxZVzh2cDVJY1J5cWQ2R0MzQXNtWU9KRWx3Uk9h?=
 =?utf-8?B?NklKWlk1ZU5QblF5M1BzUVptMHJQVUdiSnVtWkFzNzEyUTRwMjBKSWg1Z3RG?=
 =?utf-8?B?R1ZtemZTTUJydXBKVVBIVURKaHpMOEl0Tm0vZ1V1QmpJdHRoQW9LRUFLUGIy?=
 =?utf-8?B?SWdSRElpZEkrYTNWY3lzME5KQXpNTmt2Y29ERHducE56eUFjNmVsY3lvTE02?=
 =?utf-8?B?U0l1bVo3SGxZNzdZMmJLZVhDZisrNUEwdGlWWVhSbzJvSFBHYW1ROE9lZWl4?=
 =?utf-8?B?S2hCWEZ1dXVScTFGM1ZUaGk2eDhOSkZsbVl5bDUwZTl4U0tjTE1iQ3pOUjlZ?=
 =?utf-8?B?MnBJTzBUb2ljN0pPK0tZZFMyb25IVXpGckJNYXNtVnFpeXY1dkNjUTZzL0pl?=
 =?utf-8?B?K0xmUCt1TUlES1Z0c3dxY0pESjg3cDRFZFRCZ25PTlBoMXh3cFV5a24xT0lt?=
 =?utf-8?B?azZ3UTdrQVNVRlJtT0MwRklPdkt3emVwbmhEOWZoNTRZd3NIMUtmN2VkZTFS?=
 =?utf-8?B?NHdIQWttbVZrK2x5Rm0wclFHUlpyc2RkclVCdmN4aWpIVmp5R1l0WE4rSUJN?=
 =?utf-8?B?bHJhN0hVV3krQ1oxdlZxYWJRYjJrRzUxZ0taTUtlMGxoR0xCWEVnS2I4NThY?=
 =?utf-8?B?aGtvQ3VrWVBrcEVtUFJnZmp4Z2U3QVdQWFNEUW82eDFNUGg1dkdqTjZRbUx6?=
 =?utf-8?B?cWk2K0VwbVk5MzBleVFQOFE3TTQ3Sm95MHcxeS9yaE1BYXhOd09RSHN1RkRS?=
 =?utf-8?B?MmpUNnM2RDM0UFM4WCtZVlZydnVrTFUxVFEwa1BEK0hPNlBaOVVxUG1kMkMz?=
 =?utf-8?B?WmNOZHZOUDFXY3JlTzRZaHJoeG9MN1ZrTGRuVWx5TUdqenZONmFWcTlrKytj?=
 =?utf-8?B?TnMvVHV0KzhhMnA0YWxqWHduNjk1dHdtaS9wTDU3OHhXRFk2N0NDQjhsNVFr?=
 =?utf-8?B?YlhETi8vQ1BUYWdoZ2RqTHJUeUVFU1Z3UGtONmNXWllkYXBjYlZuMHZVNzdk?=
 =?utf-8?B?T2I0NVJhMkJFdWFvazd4NVdydE9xSTBnK2VwTGZaN0gzeEtvUFZpV1U0VnI0?=
 =?utf-8?B?WERaVGhvbmJSUExLbm95T3ByQkluMXRQZGQ1a0M1WlRBQVNqK1Izck5GRnRz?=
 =?utf-8?B?ajJrZXVjVzlzM0lIUHFOVzFUWjI0aGMvWWh5K1pKZGRpZExkUEFPNUUvOEEz?=
 =?utf-8?B?TWo3eGVmS1grMExDVFZ6OHg0THNSWEdQMDFtWHVPdnNaNS9IajM4eVQ5WDJn?=
 =?utf-8?B?bktTQkpVZ1VVVFhOTlJiTERWYmdXOHo4bWo4MFMzRUxvNjkyaEFiR0JMSXM0?=
 =?utf-8?B?MnFHZ1VKSWtJR1pLMVNweWVxNkhGSGd0QWV3aFlBaWhoRXlmSEsrNE5TWi9s?=
 =?utf-8?B?R0VOOFlFU05ibHRXeFplQ3gwWmxIb21Gbm1uTUZ3dGhNSGNPYUdjMTAyMVhi?=
 =?utf-8?B?MmQ2Rm9meHBuNWM4MUY5WU1sMjZDSjJKTThtbktEWmlQcFNmQU13VkVMb0NR?=
 =?utf-8?B?ZURTR04vSW5pY3JFVWJuVmQ3Q1FZZzRESmJWYVI5STVRZlFpakw0cjlFQUFC?=
 =?utf-8?B?VXhPZnFlck1Ia1RSZG16Z3hLL3VNZnh4K1FXVk1mZTIwM1dRSDlZNnUzeEFW?=
 =?utf-8?B?cTFXUkJ3Znpvamxkd3JybjhRUDZYVnh6eWFMMlFXUDZPRG11TXJ1MHVXNEFQ?=
 =?utf-8?Q?Q2519u?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5766
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 80e95403-489b-4af9-3e0b-08de38ecadfd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|14060799003|36860700013|35042699022|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnpxbnovcm14VHYyOFFqbDBYNWQ2TWsxc3JVQjRmdElUV3pGeWdWcTZMemor?=
 =?utf-8?B?UTQwZ2R6bjVnNW1ZYXZHQ0gveTVScU9nd2o4dkpLbFMxRHJyUUdWRjNMbkFK?=
 =?utf-8?B?dEM4a3R6ZlhoWHhEVmVja1lSNXhpYWhPdzNXeHFROFMrdVI3M3dmT2Y1U3FW?=
 =?utf-8?B?eG5HVWFjOFhHZWNiK3RlRmJ6Ykx4QkFXYTNCRU9MM05RbHZGL3VYdS95WE5Y?=
 =?utf-8?B?NVBERUFMMDh5K05Cb2pnT2FpSGZFWE5TUnUvcS90UkNKTWpncGJnRmc4a3ZG?=
 =?utf-8?B?N29raFZaMWhmRmJSaHphemZuMHNyK2w3UGx0Zm1zN1hjSVkxQlV6aVU2RU4z?=
 =?utf-8?B?TmdMTjJsZjkwZmVDYjRzaW1tbW9zR2N6aXpHbmxSaDNIeEx6RUl2cko2Q25U?=
 =?utf-8?B?WjhRdHgvV0x5Tm0rcjgrRDhrWmlKS1NsOG9HR3dwMlVFWXJST3I0aGtXVVV6?=
 =?utf-8?B?ejFBeVBRK21lcy8vQXJiRUt0MVNnQkczQW43VndabXNQTzljUWNkQUwrYldP?=
 =?utf-8?B?YTlPZHI2MlRiVmFHV1dWMVNlTVMraWNPWHRXaFZCYlVubkNnbWx3L3VNeUs1?=
 =?utf-8?B?QjZiMkxXUUNSMkw4TjBTY1E5bllUaEY5Q1ZtdEdtVm8vRFFiNDRMRUVVa3Vu?=
 =?utf-8?B?enR5TXlKMnNib3BmT2pTdWxHaFNjUXlzUFowLy9BODJWM3hNd0V1WVBxRGFj?=
 =?utf-8?B?VnFvSUdHYThsREIwalhkd3FhU1NqaWRrNy9RTWxsVFJRRENXdzVtVUl2ZVQ2?=
 =?utf-8?B?NjRwelFxVWhVZHJFYzNkRzgvcFdMM3E2Nnp3d2hLeDBUcm5mdGhkYWFoWGdE?=
 =?utf-8?B?d1JpVTlQcEtZOVYrM0oxNms1K3BpSzFBVG50SWNnNWpxK1VqT3NNNDZKRTBi?=
 =?utf-8?B?cFNzNGN5OFhIbXBSeVJmNFpDVHJ2NnM2YlJXSDV3ejJ3a0tIdEpUZndqNUkr?=
 =?utf-8?B?Vk1LSjYreUt2STVncGhhejNSM1BJSTZBZWZZZnJscnhXZUlEd2ZqOE1LSy9C?=
 =?utf-8?B?VXVjYVRJWkZQcHJRVk9TVE83SXo2dlpJeDloYndGcll1VXRjMHdHRjBkVlNq?=
 =?utf-8?B?OGNITUxrcmVmLzQveW9MTXNvbHZTV1RkZUYyZkYwYWFua2dQT0c1UURhWXdV?=
 =?utf-8?B?TW9PTUdCTFlYa2pzUkRMUEI2RWU1M244by9hZ1UzY0N3WkZ3bTVuNy9yQXlM?=
 =?utf-8?B?bGV5Y3JzQStRM2dzRklDMjZMcUlOc3ZnTXVvMVNPTjhYcExrNWs5OUpEZ2xz?=
 =?utf-8?B?b3N2REZMYWpZREFhcnRlanJ2N0xzdGcvR2pNeFQ3ZzNOaFErbG9qcGdDSnY2?=
 =?utf-8?B?MmZhQkh6MHBVOEtaNzVjTkd4RkpObkd4MXNTUkkvdlBDU1ZtUGM3ZWZ3KzRD?=
 =?utf-8?B?MW5UeGZLY1A5Z1czLzFwUHZtMmpCZ2lUT3U2cWN2Uk04Um8yNXBXbDEvSmxE?=
 =?utf-8?B?Q1d0WVNOWHNsMUE0YkJrWkhFaEgxVUZrOHQwVGxjUk9sZThpRzlsYkhmeGI3?=
 =?utf-8?B?VkFnRVgzRTJVMU4zMFFraG9zOUkxckdhRU51NTQ2Q21DQnlZZzNYOUszNVdk?=
 =?utf-8?B?RFZpUGc3ZTlPM3JCcGhvZFZiQytJb0ZheGNBM1ovNHNwVUkyNGowbjd3d3Yx?=
 =?utf-8?B?S3RnNHlYQWcxTGU1dlNVQ2xUS2xMaXE3WW5UL1JkY000YW5ySldLSUZQblBB?=
 =?utf-8?B?NGhQT1ViSWNXcy91bFRRMW0vZnRjVkpSdS9TWEhKRDZ1eWVtakZUdE9YcVdn?=
 =?utf-8?B?Q3NDRmtTUXFOa01ESzFuUlV4MTZ5alJodTFQb2Rva2RxSEg1aEw5VE1SbzA4?=
 =?utf-8?B?SWFiUkF1a01XdGM0cWVEVHNPOEZsN0MrYXlucTgxK2FRYzZhQVExNnU3YnJW?=
 =?utf-8?B?clpSby9ncE5vRnNoeURLR0krOU1vKzJISjlaSXV5Z0UrNlNVUENVVlFyZnFC?=
 =?utf-8?B?ZkJtTVJKMzg2ekUrMTRQRzc2T29mb0NjVzI1VWpEdmZjQ2wwamhaZUYrQUtS?=
 =?utf-8?B?cjAzTXc1RmlsQUtOdVFDVlRqMlkwQmFRUnk5TXV5RGdWb3hBa2VxYytzbVAw?=
 =?utf-8?B?c0JnS3kxSElLZ3ArYTdQUkJHRmF6VS9tL0tUWVU2SnJSWDdIVHNBaFdkWFRs?=
 =?utf-8?Q?kQzXz6RkXiDcdD2JRAKYQO8kz?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:38:14.6704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c9fb8c-92ac-46f2-1aa0-08de38ecd3ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8483
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

On 11/12/2025 16:15, Nicolas Frattaroli wrote:
> Mali GPUs have three registers that indicate which parts of the hardware
> are powered at any moment. These take the form of bitmaps. In the case
> of SHADER_READY for example, a high bit indicates that the shader core
> corresponding to that bit index is powered on. These bitmaps aren't
> solely contiguous bits, as it's common to have holes in the sequence of
> shader core indices, and the actual set of which cores are present is
> defined by the "shader present" register.
> 
> When the GPU finishes a power state transition, it fires a
> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> received, the _READY registers will contain new interesting data. During
> power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> the registers will likewise contain potentially changed data.
> 
> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> which is something related to Mali v14+'s power control logic. The
> _READY registers and corresponding interrupts are already available in
> v9 and onwards.
> 
> Expose the data as a tracepoint to userspace. This allows users to debug
> various scenarios and gather interesting information, such as: knowing
> how much hardware is lit up at any given time, correlating graphics
> corruption with a specific powered shader core, measuring when hardware
> is allowed to go to a powered off state again, and so on.
> 
> The registration/unregistration functions for the tracepoint go through
> a wrapper in panthor_hw.c, so that v14+ can implement the same
> tracepoint by adding its hardware specific IRQ on/off callbacks to the
> panthor_hw.ops member.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c   | 38 ++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
>  drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
>  drivers/gpu/drm/panthor/panthor_trace.h | 59 +++++++++++++++++++++++++++++++
>  5 files changed, 167 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 057e167468d0..67572b607b55 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -22,6 +22,9 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "panthor_trace.h"
> +
>  /**
>   * struct panthor_gpu - GPU block management data.
>   */
> @@ -29,6 +32,9 @@ struct panthor_gpu {
>  	/** @irq: GPU irq. */
>  	struct panthor_irq irq;
>  
> +	/** @irq_mask: GPU irq mask. */
> +	u32 irq_mask;
> +
>  	/** @reqs_lock: Lock protecting access to pending_reqs. */
>  	spinlock_t reqs_lock;
>  
> @@ -48,6 +54,9 @@ struct panthor_gpu {
>  	 GPU_IRQ_RESET_COMPLETED | \
>  	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
>  
> +#define GPU_POWER_INTERRUPTS_MASK	\
> +	(GPU_IRQ_POWER_CHANGED | GPU_IRQ_POWER_CHANGED_ALL)
> +
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> @@ -80,6 +89,12 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	gpu_write(ptdev, GPU_INT_CLEAR, status);
>  
> +	if (tracepoint_enabled(gpu_power_status) && (status & GPU_POWER_INTERRUPTS_MASK))
> +		trace_gpu_power_status(ptdev->base.dev,
> +				       gpu_read64(ptdev, SHADER_READY),
> +				       gpu_read64(ptdev, TILER_READY),
> +				       gpu_read64(ptdev, L2_READY));
> +
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>  		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
> @@ -139,6 +154,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	init_waitqueue_head(&gpu->reqs_acked);
>  	mutex_init(&gpu->cache_flush_lock);
>  	ptdev->gpu = gpu;
> +	gpu->irq_mask = GPU_INTERRUPTS_MASK;
>  
>  	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
>  	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
> @@ -150,13 +166,31 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
> +	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, gpu->irq_mask);
>  	if (ret)
>  		return ret;
>  
>  	return 0;
>  }
>  
> +int panthor_gpu_power_changed_on(struct panthor_device *ptdev)
> +{
> +	guard(pm_runtime_active)(ptdev->base.dev);
> +
> +	ptdev->gpu->irq_mask |= GPU_POWER_INTERRUPTS_MASK;
> +	panthor_gpu_irq_mask_set(&ptdev->gpu->irq, ptdev->gpu->irq_mask);
> +
> +	return 0;
> +}
> +
> +void panthor_gpu_power_changed_off(struct panthor_device *ptdev)
> +{
> +	guard(pm_runtime_active)(ptdev->base.dev);
> +
> +	ptdev->gpu->irq_mask &= ~GPU_POWER_INTERRUPTS_MASK;
> +	panthor_gpu_irq_mask_set(&ptdev->gpu->irq, ptdev->gpu->irq_mask);
> +}
> +
>  /**
>   * panthor_gpu_block_power_off() - Power-off a specific block of the GPU
>   * @ptdev: Device.
> @@ -395,7 +429,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
>   */
>  void panthor_gpu_resume(struct panthor_device *ptdev)
>  {
> -	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
> +	panthor_gpu_irq_resume(&ptdev->gpu->irq, ptdev->gpu->irq_mask);
>  	panthor_hw_l2_power_on(ptdev);
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index 12e66f48ced1..12c263a39928 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -51,5 +51,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
>  int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  			     u32 l2, u32 lsc, u32 other);
>  int panthor_gpu_soft_reset(struct panthor_device *ptdev);
> +void panthor_gpu_power_changed_off(struct panthor_device *ptdev);
> +int panthor_gpu_power_changed_on(struct panthor_device *ptdev);
>  
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 87ebb7ae42c4..ae3320d0e251 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright 2025 ARM Limited. All rights reserved. */
>  
> +#include <linux/platform_device.h>
> +
>  #include <drm/drm_print.h>
>  
>  #include "panthor_device.h"
> @@ -29,6 +31,8 @@ static struct panthor_hw panthor_hw_arch_v10 = {
>  		.soft_reset = panthor_gpu_soft_reset,
>  		.l2_power_off = panthor_gpu_l2_power_off,
>  		.l2_power_on = panthor_gpu_l2_power_on,
> +		.power_changed_off = panthor_gpu_power_changed_off,
> +		.power_changed_on = panthor_gpu_power_changed_on,
>  	},
>  };
>  
> @@ -53,6 +57,64 @@ static struct panthor_hw_entry panthor_hw_match[] = {
>  	},
>  };
>  
> +static int panthor_hw_set_power_tracing(struct device *dev, void *data)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +
> +	if (!ptdev)
> +		return -ENODEV;
> +
> +	if (!ptdev->hw)
> +		return 0;
> +
> +	if (data) {
> +		if (ptdev->hw->ops.power_changed_on)
> +			return ptdev->hw->ops.power_changed_on(ptdev);
> +	} else {
> +		if (ptdev->hw->ops.power_changed_off)
> +			ptdev->hw->ops.power_changed_off(ptdev);
> +	}
> +
> +	return 0;
> +}
> +
> +int panthor_hw_power_status_register(void)
> +{
> +	struct device_driver *drv;
> +	int ret;
> +
> +	drv = driver_find("panthor", &platform_bus_type);
> +	if (!drv)
> +		return -ENODEV;
> +
> +	ret = driver_for_each_device(drv, NULL, (void *)true,
> +				     panthor_hw_set_power_tracing);
> +
> +	return ret;
> +}
> +
> +void panthor_hw_power_status_unregister(void)
> +{
> +	struct device_driver *drv;
> +	int ret;
> +
> +	drv = driver_find("panthor", &platform_bus_type);
> +	if (!drv)
> +		return;
> +
> +	ret = driver_for_each_device(drv, NULL, NULL, panthor_hw_set_power_tracing);
> +
> +	/*
> +	 * Ideally, it'd be possible to ask driver_for_each_device to hand us
> +	 * another "start" to keep going after the failing device, but it
> +	 * doesn't do that. Minor inconvenience in what is probably a bad day
> +	 * on the computer already though.
> +	 */
> +	if (ret)
> +		pr_warn("Couldn't mask power IRQ for at least one device: %pe\n",
> +			ERR_PTR(ret));
> +}
> +
>  static char *get_gpu_model_name(struct panthor_device *ptdev)
>  {
>  	const u32 gpu_id = ptdev->gpu_info.gpu_id;
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 56c68c1e9c26..2c28aea82841 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -19,6 +19,12 @@ struct panthor_hw_ops {
>  
>  	/** @l2_power_on: L2 power on function pointer */
>  	int (*l2_power_on)(struct panthor_device *ptdev);
> +
> +	/** @power_changed_on: Start listening to power change IRQs */
> +	int (*power_changed_on)(struct panthor_device *ptdev);
> +
> +	/** @power_changed_off: Stop listening to power change IRQs */
> +	void (*power_changed_off)(struct panthor_device *ptdev);
>  };
>  
>  /**
> @@ -32,6 +38,8 @@ struct panthor_hw {
>  };
>  
>  int panthor_hw_init(struct panthor_device *ptdev);
> +int panthor_hw_power_status_register(void);
> +void panthor_hw_power_status_unregister(void);
>  
>  static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
>  {
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> new file mode 100644
> index 000000000000..2b59d7f156b6
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora ltd. */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM panthor
> +
> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __PANTHOR_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +int panthor_hw_power_status_register(void);
> +void panthor_hw_power_status_unregister(void);

Hello, not sure if I'm missing something but, would doing

    #include "panthor_hw.h" 

address the need to redeclare panthor_hw_power_status_* in this file?
The change looks good otherwise.

Reviewed-by: Karunika Choo <karunika.choo@arm.com>

> +
> +/**
> + * gpu_power_status - called whenever parts of GPU hardware are turned on or off
> + * @dev: pointer to the &struct device, for printing the device name
> + * @shader_bitmap: bitmap where a high bit indicates the shader core at a given
> + *                 bit index is on, and a low bit indicates a shader core is
> + *                 either powered off or absent
> + * @tiler_bitmap: bitmap where a high bit indicates the tiler unit at a given
> + *                bit index is on, and a low bit indicates a tiler unit is
> + *                either powered off or absent
> + * @l2_bitmap: bitmap where a high bit indicates the L2 cache at a given bit
> + *             index is on, and a low bit indicates the L2 cache is either
> + *             powered off or absent
> + */
> +TRACE_EVENT_FN(gpu_power_status,
> +	TP_PROTO(const struct device *dev, u64 shader_bitmap, u64 tiler_bitmap,
> +		 u64 l2_bitmap),
> +	TP_ARGS(dev, shader_bitmap, tiler_bitmap, l2_bitmap),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__field(u64, shader_bitmap)
> +		__field(u64, tiler_bitmap)
> +		__field(u64, l2_bitmap)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__entry->shader_bitmap	= shader_bitmap;
> +		__entry->tiler_bitmap	= tiler_bitmap;
> +		__entry->l2_bitmap	= l2_bitmap;
> +	),
> +	TP_printk("%s: shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
> +		  __get_str(dev_name), __entry->shader_bitmap, __entry->tiler_bitmap,
> +		  __entry->l2_bitmap
> +	),
> +	panthor_hw_power_status_register, panthor_hw_power_status_unregister
> +);
> +
> +#endif /* __PANTHOR_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE panthor_trace
> +
> +#include <trace/define_trace.h>
> 

