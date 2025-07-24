Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA6B104E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017D310E1E2;
	Thu, 24 Jul 2025 08:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ssl/aZ28";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ssl/aZ28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394310E1E2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:54:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SIoNNjtSY4iWGQlOGPWWQfBX0MWj5/rqT2/+xKduDvK59AaaeD60D7HVhtBfeXmAob9t6G8FaUJe6l7pvV4w1AGlEiPvGxukckjw65vHSsrhHbzRJsAr305T5JNQPmMLZoec5qEuPCdpJrqf16+s3EiPlItTh0mcVMmBD0kSva6xIgNi06FOiueauC6RElU7gcD6DmCBWb1xoU+7Ykcc96DEfF95vqztAScpKXrS2vAGIpuxkvVFSAOjY/9dbolizo226xvZxDKqWgTGq0Ogl8pWFxvkd2TK9P+S3kYBfI5gRa9fAjNwBrH4pWxGT2XH8e03qg9DVu68I7e3qbHykA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOGvz84rSfcTabIQonmJZgQ2IGaCfjsco40d69nkMUo=;
 b=ON8g2cu4/U+g0dA8pVSJHHvDKFWPL704x6E2liNFOWzNClQhnzOeYKKpHKVk2ZbgJ10h7slX0gHM92Qx/pqVXRkL89mGBKWI3BExUQphlGPYEqo2NxJnElPHgjy6qIwvo7XY0dKCpodN1RuFf+gd85ccdrIlyZw1P1VGStf9V5HRMCZ8IASe5wmB14aw1NHf8xrf7FbQlfRtKCFUPHKpjPKgupxHK4WH507TutBfVs536e3IGWcmTr4ToJY2SnSDwhkwmqHntev22QOvSlrjpqTCW419hPDJ+d1XEQVcLfbUnbcXmLMOn6OrqcQ6XVFDt5xIfqvYPlLcSxNocz5o2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOGvz84rSfcTabIQonmJZgQ2IGaCfjsco40d69nkMUo=;
 b=Ssl/aZ28/X9XG4o/8FaTQ2so/tzmQNqq9A5ZcjpeCyvZL3Q8T6fwOoClWbLZxnzRu3yKURGbfoxCfJRYRXP+QAAYUu28pESo6rvn+XBexLcnR29vTwjA7d/iMu/XXCVN9AeAxuLM2ojFtCiN29gHJumdU02jTlYSODzjP5zX8do=
Received: from AM0PR02CA0181.eurprd02.prod.outlook.com (2603:10a6:20b:28e::18)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 08:54:03 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::d7) by AM0PR02CA0181.outlook.office365.com
 (2603:10a6:20b:28e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 08:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 08:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb78oVPreMxM0Jbl4aFHIVW2S/7qBYd4b7CxFQ6qFxZq2Fg6DXJcUnV7yEzLm4YGwN8p1qJ2ut7DNcVy6fdtSwphlm8fA6k0pfdIs8+O07E2/KiTJHvx49TLGYnFVjcNB+oxJd8sam/iZte2KGTIN06F6cQBDfExlGlo+8pT9nNhPwofo946rgQqRg5KrzEMOFCxvdON4CXvUQv95Nv6VxVPdjoxDUCSggdutkP8icYms1PXOcYiT+UTVPOXeSseLzxRpqbCZ+Cqg3RRrqV+4w4083CIJe99TKYDr9V/80PsU9U1dSLkWJyrn33Gt/25ldrm0yCHXTJ1WD5ucedI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOGvz84rSfcTabIQonmJZgQ2IGaCfjsco40d69nkMUo=;
 b=tMPb9EwOGOeCBID16isqONrzoUmo2tofyD6NWdDC/bRdUUzr6LqM/8EHU8SbFnRyPtZxYRJlYoQg7ZmGDv9lMgJ9vAnotfeEpjx24Jvub9FMyTizG7wh3pcmDFrHgtQwwi9Nplslu8+Ob9ORofjQl6E+A2QAr4pcg6LOHLq909d9xUM4hXWFtJ8BS96n7a7EoZcN97iYgX0qHWOrTPnEikkd0DSukeEe2FzuE9XvNW0SSsH8oTGiQdL90m1IZVSlfSH2+XY/XLSEsrxU3ycp8U8tcGvf7tYJ612AuqLYZAsxXCiiNxRzJjDaF4xH6uj2tPaPUfAhfZTBLfryES9ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOGvz84rSfcTabIQonmJZgQ2IGaCfjsco40d69nkMUo=;
 b=Ssl/aZ28/X9XG4o/8FaTQ2so/tzmQNqq9A5ZcjpeCyvZL3Q8T6fwOoClWbLZxnzRu3yKURGbfoxCfJRYRXP+QAAYUu28pESo6rvn+XBexLcnR29vTwjA7d/iMu/XXCVN9AeAxuLM2ojFtCiN29gHJumdU02jTlYSODzjP5zX8do=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB5796.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 08:53:31 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 08:53:30 +0000
Message-ID: <1674fa29-db08-4241-929e-4c0354669022@arm.com>
Date: Thu, 24 Jul 2025 09:53:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/panthor: Add support for Mali-Gx15 family of
 GPUs
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250721213528.2885035-1-karunika.choo@arm.com>
 <20250721213528.2885035-5-karunika.choo@arm.com>
 <CAPaKu7S3=8UASg70E9LQcGiqKq319asOwv7pAhBEMAQgwh608Q@mail.gmail.com>
Content-Language: en-GB
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <CAPaKu7S3=8UASg70E9LQcGiqKq319asOwv7pAhBEMAQgwh608Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0127.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM8PR08MB5796:EE_|AMS0EPF000001AC:EE_|VE1PR08MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 43edd881-3f0d-4ce3-a8a0-08ddca8fa3b1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Z1ZoY2gxcCtZNCtDMjlQUk9BYXhuNExDL3BvUjNadDJPVlF5bWhZL3JpMnFm?=
 =?utf-8?B?eWRFdlVia2NXcU5yVzlKTFFhM1Z4emxiSXZoWDVjWGdoa2RtcG5FR1pIN0tu?=
 =?utf-8?B?eWpvNzcxZ1A1djd2cmc4aWJUVDROSGpHdjBmVTFiU2tRYVY3Q2N3VTBWTElY?=
 =?utf-8?B?UWVoSmpTWElyRC9TR2hzRERXYmFyZ21XY25aZkp6bDNPVnozTXVyL3U1MXBM?=
 =?utf-8?B?T3BrS2lQSVFXVUZyb0hBQ043MXpuSEQ3aWRpbGdRZEhXQzVJWWg4WjZzd2Rm?=
 =?utf-8?B?K0w2VW5RSXZtTTJ2b3lWS1pSSXVISVFWN1dnOUJPTEtDeHNxZXlrVFdPQnk1?=
 =?utf-8?B?ZkZpRytCS0pFL2h5RE54OHl1K1BraG1RdmczVm4xL2RaSk15bEhFYVRhSncz?=
 =?utf-8?B?REJkbDRoclh1Z2EzZzFEeHZ6Yjhhc1A2WjdWNFd5czlJdW5sK3Vub2sweVJn?=
 =?utf-8?B?ZTl3cFNTMFZsWFVTTE1hYTJTRUVKa3llUTI5V290VFdaNFVrQjY4VWIyT05p?=
 =?utf-8?B?anYrbXh2WHphSjFYZzhyeTk3SVYrMmVacHBaN0VFMUd6aW5vREJ2dEo0dytu?=
 =?utf-8?B?U1ZQcHI3cFpNUncwL3lFVjNPQTFNU2hLQXBmZkc3cXdyaVNhZW5zd0xzQUJm?=
 =?utf-8?B?S0NuL0I4SjZhRUVDOE81NXptV0xFb2dpN3dkSmo2Y0lnZTdETmh1YklZYWhF?=
 =?utf-8?B?S0VPRCs4VjZXRzJnL1hvS1hidmxWN1ZCWW85MHUyWERNTUtrdXZKQTRHanAv?=
 =?utf-8?B?VjMxL1czT214MzhCMUxzYW5ybm5sQnFnQ0pqNzV5aE5RYXl0MGVkVFpBWlVX?=
 =?utf-8?B?Wkt4V3R4aHd2cWhjR0FYYnZLQzVwSjAyZXJxZnJEaUJ0RHJPeGMzV2lFMWZm?=
 =?utf-8?B?emliZElWa01hSVZyVDUxNHA5UTk3Yjh2eERNOEdoQmFDTStad0lLQ1JreGU0?=
 =?utf-8?B?SnY5YmRtZ01IVXNtZXRRc2licVZucVFLUjBIR1c0RDhhOWxrZG9ISlFvY3Iw?=
 =?utf-8?B?NEt6Vlk1aDIwdGIwYU9BS0FDL0ZQVVZUVlBKWmhVcEp0UXJZNTZzQ2pxeVBY?=
 =?utf-8?B?K0dTSGkwZFNhbDRwR0JyQnorWjZySG8wNmRrbnRsZEZ4c0c1QlZtWG5Kcmxh?=
 =?utf-8?B?dDVpVENucUdiOEtpTUlwR0tNV2swekE0aCtXZ2gzeDEyRmVWMWt3bHErVkNQ?=
 =?utf-8?B?SWo2Z2phWGVrb3dRYlJGREVaTEJabDVaa0Z0OGFWckNleCtNbUdORmJlcnhs?=
 =?utf-8?B?T1djclVrM1RMODd0bEpKOEU4NzlIaWpaTDd3TXhsNnFPTXRpVVhYdUpFMjk3?=
 =?utf-8?B?S2Uva0c4SEFPZkplQ2FwdW9aM2pDWm9aRlZjMDhJakcvSVdKNGc5K3ByTS83?=
 =?utf-8?B?c3QvUDlvbVBIb2crd2ZOM1BnUXFjRlMvM3cxcnNTOEVDM2lHNE1aVi8zUktz?=
 =?utf-8?B?bEdFMlRLS3c1QmJhbHFyOUt1UzREd1NEZERNak4yTGN6OW44bTI0NmlVbVR4?=
 =?utf-8?B?OXlzMnljMHlGT0tzd0Q1VE0rcVE0SVZFM2craW15UCtSSkgrczhqVjNjT0JJ?=
 =?utf-8?B?SXZuWnlVVlpNd3N5OSs2VGswanJFbTZXYlhSa1YxYWxOWHN6Z2dPTThJR3Bn?=
 =?utf-8?B?dzRYTWw5K1dQcGxUQ09QYlRCWWtMWUtCK0Y0K1l1SGl6ZFlmdHlwVHJYQ3pX?=
 =?utf-8?B?Ukt2ODBRMWJlK0liV2I0ZlkzUDZ2QUM2TFhlWE1WcGlIbXk3MlVXeHRHK2dE?=
 =?utf-8?B?aEpZOWhvVmIzL0JQdkF4WnBneEZDWE81QWNjaHVQWUxMZ1NEMGNsL3NKZ1Qz?=
 =?utf-8?B?cE00R2ZlUndjM1FtdkZET0NJQXIwd1VUbHp0bmdPVlo0UG8wZklZZlVKOWNR?=
 =?utf-8?B?MUQxWWlEWWphZEZQU1l4YlBnZUZZRk9zQTNjZXZOc0V2emc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8961a76d-a542-4ef4-ffc8-08ddca8f8ffa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUcwKzlCZkRCTXhWRVUrYXJwNU9CcmVoYlJnYjIxR0kzRzduajNoOHRqVFJU?=
 =?utf-8?B?ZmFjc3BJTkZ4cENidWxGelhWcUZmYjlUVTNteHNYYWtaTlR5eGZuTE9PcUll?=
 =?utf-8?B?N24zZklFZStFNWlWdU50d1M0cVNkWU1YYmY2VFM1MUxwOWpaZEc1RjQxSThV?=
 =?utf-8?B?YTdVbUhBSkpHMUEwTFJkcWRCWS9XMTE1ZzRpSGZQZHFmcjJRT0Q1ekdYODNH?=
 =?utf-8?B?ZmlIODMxeE1DTHJYVWdPSktHSXBhN2ZVaDFLb2FkV3d4ZXFPZnY5S043c1E4?=
 =?utf-8?B?cTJXUlRlTFhYWDBZQ3hOem45R2hlK2RXOW5PU3FENzJPV0RSN3Z6azA2d2dL?=
 =?utf-8?B?WE16UWlzQTZqN1dFSU9oWlVHQUplUm5wY203ejltQjVZR3g4Um9GVm5qVndo?=
 =?utf-8?B?QXhsdTRFYzZibzVveEJMWndPZnlWa1FIRlozM3J0RkRDUnVTRVZsb0ZOblEv?=
 =?utf-8?B?alFpZXdHSDhQMFhCVE5lQU9hNE5ad0l2WjBydGRSR2IvdUtmSDFBSVQ5bVJD?=
 =?utf-8?B?dlFvZFhRMW1uVkk5b0svcHQvZU1PcVVjVjJ1RW1OWjhMZXhHY1ZUOUIwOHRo?=
 =?utf-8?B?QXdGakVMbkhtSEtMdElwTlQzajhsNGI5V3J4eERSZjhqL2UvU0dSUWpoejl4?=
 =?utf-8?B?ZkNNQTdFKy9tVmdhUEVOMFpiK3VXMHBiM2dPTzJaY2pQYm9mWkhWSm84b0lP?=
 =?utf-8?B?NnRGNTc4bHRETGRLMDhsdmpkMVp0c0dybCsxbHdicDdQaHZGMm9HM0pjRkRs?=
 =?utf-8?B?SElZUFpDSnlQNHMzbzZQL2N3ZVcwVlhsYVV2aGlyQUtRRTRGSTJQN25vdmFi?=
 =?utf-8?B?VXA4eTZFYUdYOEtlK2hFNk82QS84dXdkdTRrSll2V0pveURIcy9qWEdXMG12?=
 =?utf-8?B?STdzZVRkVGpuaU0rVEFTZHArOFY2Wm82TG1TY3JvdGErK25jYjJtbHBqZmhH?=
 =?utf-8?B?MjEzdzVDMDg5ei9pRVpyZzg2NnZHSmRkRW5NR29BUnhOUGV4RElMS1RXSjdI?=
 =?utf-8?B?SkpCbWRtVHZEMFNRMlFDb2xlWFN5Ykt4ZzFGRFZlRmpOQjVoWGQ2alY3MmNv?=
 =?utf-8?B?THBLL2ROc3haM1kzeC8rSUk5d2dLOXVmZnlaVG00bHpSSHRvTWNhTmg0akR3?=
 =?utf-8?B?eWx3aFpkeTYxSjZXTTNERUlnMEM4N0hEN2YrVHFwOVcvcWFtYU0vNnRlYXFv?=
 =?utf-8?B?SGFSdk5QZDFkaEtSV202TFdnbUJMREpCYk45Z2xad2dNaVFhaGUzN1FkVmsv?=
 =?utf-8?B?YWxiQUpHS3cya3krVDF4ZWE5NzVoVU5XTHpRc29oUXVhMnAyeFRvQ0krcG02?=
 =?utf-8?B?bmlXZUxqdllYb05DdGtKcUN2VWxjTkllVmYvNUtCTzJwdnNPdTNmbGNKUEdl?=
 =?utf-8?B?dXRlTHQ0a0V6V1pvaXFzbU1nbUFmc1FzUktYV29UTGdrYUllR2htQlI4ZFha?=
 =?utf-8?B?bDVkeEROTnphaUhzbksyZ2pwS2ljWWlmazBTQU9yOW5NQTd5czRidUpQSHRm?=
 =?utf-8?B?dWNaOGl4L1VucmQvSnkrYnRDMnUyTUJ5ZGh6Q0Q5WWc5c1YvTE5NcVRuV3Fm?=
 =?utf-8?B?aVdKQzRvZWpUTHNrM3pXRU9aMjJmdE1Ca0gwbWxqbmF4T095TWNTdC8yR1Na?=
 =?utf-8?B?TERiaTNBQWNXUFErRGVOcXQxMXAyY3g4SU8wZUtsWGxtSHllSFE1ODJGZUdw?=
 =?utf-8?B?OHEzcnhtc1Z0WmtkemxZTHJnSnQ5QlY4TGpudEJ0eTRBOXFoNjRYZDZvaU1Q?=
 =?utf-8?B?Nm54QUZDWGViNERSVzNPTklpUGhmaTI0TVF0U21Ray9CdTV5OEhjODlUUVBh?=
 =?utf-8?B?cXZxYUdDUXNVbTcrWmZxV3dUWDVVYjB5SkMzZ1JXVGFDWWpFYkFZZkFlRzA1?=
 =?utf-8?B?eGhEMCtrbHlvWmhFL0ZwcXRzSGEzZEpnbTFoZ2pkdm1JM2c0cVBialdiNWty?=
 =?utf-8?B?UHJuZGo5MnFTMER6MkY3MXE3d0JyOG9YckZXUDFiKzQvaWpId1lYM1dyTk5E?=
 =?utf-8?B?dXRsa0pYczZ1bDlvUUU2N2xET2sreFNiejdUbjg2QklrczdEdVZPS0NCeUpm?=
 =?utf-8?Q?btAZkD?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(36860700013)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 08:54:03.0971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43edd881-3f0d-4ce3-a8a0-08ddca8fa3b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
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

On 24/07/2025 06:40, Chia-I Wu wrote:
> On Mon, Jul 21, 2025 at 3:13 PM Karunika Choo <karunika.choo@arm.com> wrote:
>>
>> Mali-Gx15 introduces a new GPU_FEATURES register that provides
>> information about GPU-wide supported features. The register value will
>> be passed on to userspace via gpu_info.
>>
>> Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
>> depending on the shader core count and presence of Ray Intersection
>> feature support.
>>
>> This patch adds:
>> - support for correctly identifying the model names for Mali-Gx15 GPUs.
>> - arch 11.8 FW binary support
>>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
>>  drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
>>  drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
>>  include/uapi/drm/panthor_drm.h         |  3 +++
>>  4 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index b7b454d16f12..fa6e0b48a0b2 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
>>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
>>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>> +MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index 7f138974d43b..a7583342d797 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>>         const u32 gpu_id = ptdev->gpu_info.gpu_id;
>>         const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>>                                                 GPU_PROD_MAJOR(gpu_id));
>> +       const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
>> +                                        GPU_FEATURES_RAY_INTERSECTION);
>> +       const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
>>
>>         switch (product_id) {
>>         case GPU_PROD_ID_MAKE(10, 2):
>> @@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>>                 return "Mali-G510";
>>         case GPU_PROD_ID_MAKE(10, 4):
>>                 return "Mali-G310";
>> +       case GPU_PROD_ID_MAKE(11, 2):
>> +               if (shader_core_count > 10 && ray_intersection)
>> +                       return "Mali-G715-Immortalis";
>> +               else if (shader_core_count >= 7)
>> +                       return "Mali-G715";
>> +
>> +               fallthrough;
>> +       case GPU_PROD_ID_MAKE(11, 3):
>> +               return "Mali-G615";
>>         }
>>
>>         return "(Unknown Mali GPU)";
>> @@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>>         ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
>>         ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
>>         ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
>> +
>> +       /* Introduced in arch 11.x */
>> +       ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
> Is this guaranteed to be 0 prior to v11?
> 
Hi, This is guaranteed to be zero as it was a reserved register prior to v11.

Kind regards,
Karunika>>  }
>>
>>  static void panthor_hw_info_init(struct panthor_device *ptdev)
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index 48bbfd40138c..8bee76d01bf8 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -70,6 +70,9 @@
>>  #define GPU_PWR_OVERRIDE0                              0x54
>>  #define GPU_PWR_OVERRIDE1                              0x58
>>
>> +#define GPU_FEATURES                                   0x60
>> +#define   GPU_FEATURES_RAY_INTERSECTION                        BIT(2)
>> +
>>  #define GPU_TIMESTAMP_OFFSET                           0x88
>>  #define GPU_CYCLE_COUNT                                        0x90
>>  #define GPU_TIMESTAMP                                  0x98
>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>> index e1f43deb7eca..467d365ed7ba 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
>>
>>         /** @pad: MBZ. */
>>         __u32 pad;
>> +
>> +       /** @gpu_features: Bitmask describing supported GPU-wide features */
>> +       __u64 gpu_features;
>>  };
>>
>>  /**
>> --
>> 2.49.0
>>

