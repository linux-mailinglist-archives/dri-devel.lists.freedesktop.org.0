Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB3B0C392
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF6E10E51F;
	Mon, 21 Jul 2025 11:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bIgbtwzn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bIgbtwzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011035.outbound.protection.outlook.com
 [40.107.130.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148C910E51F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:45:29 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k1wpg3hsL2nXDpuNqwjeFlmOhUtBWkWOLLKdS6i5p79Gu/A1NipclBtzTjs9YvFdMJt7dcs8f5F6zqp6180HhVntZO7LjqUl2DJ7pDGAAFQmr7NFseWugHWC1JjFW9KebKBYIsS9PS/SWcUUxF9ODGkaDFS04sfnJXLEk7ALZXMogayd/NtIfvWGG5KP7pbN8roN29MLBhbaRyFQhLV4+wgK+9TpoR0CjdGR9yN0CqLSSWCtAejzFoO/oETFIZB3nYSxwRFNQFYcSUtI2F86KKRF3CGeQyzJ+rZN02ntDkghVqvXk4PyfOCEQP0ImJrU+vXGYJMZJR1iJFoWdlAUIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtA94fztnwEKF04WBZNS3Zzns+5ckvqWHHaljqlaV4E=;
 b=g4FbkwigAFR2/BNKITnNb96ZXBPxAmhdgsq9cQQTUOY6y/b3pNGLBsAJJf4C6NQOvlFiOHlLl3rWmhh0p0MG4bN5iESBf4dIbaGCyy/CMS0xyKhV4kmy6RWibnFruhsphWEgSCpTrwPp7TbDBeXe+DGM3LjcP/DN7zVy6gNuAr6eTiLEYk5KYKOGK+1c5dVFQAteIYsNzFMYVffHP04JoqyT5V7Tyd53kTjsepfDfXvlXz6cS5XJbTN/1GsckoOpoikSfCNREQO+lyntlnfpgrGs7KPh8xJJADByZfu/AoUXJzMu7/Od3HWr6EKd4sMyvpeiLS1vDToFlPozvVk9xQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtA94fztnwEKF04WBZNS3Zzns+5ckvqWHHaljqlaV4E=;
 b=bIgbtwzn5cQk9L7XxMd7iO1LpHJgCsm5Ygrmi8obDUSBARAH9qiyIhOR8d5iUqfxUIg+8AaHrbq9H5gk+7Ge6ZZDQiwDFNN5ixax9zN3r/76kuLC9YT7t8V3wiKQjqBXqCFaGljLzjU4qwBTY1jvgeQf6meh+HGmcI3X5bJ10+8=
Received: from DB9PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:10:1d9::19)
 by AM8PR08MB6579.eurprd08.prod.outlook.com (2603:10a6:20b:356::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 11:45:25 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::f0) by DB9PR02CA0014.outlook.office365.com
 (2603:10a6:10:1d9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlhzol8px4V2m2/yuprtRZV/Vi74ocKwKZjD3+Mt1qycNT/30rtJswrgQnx3V/FDBIguKeJ1Iv8Skbi+/M4j65eApYGXSe0P7nFJVAK78L6TrNZ824+m96O100z4gmWtRlqz424pGx+eULU4SVzWPprxvg70gNEPPiY4XRsfDOdoEI7/Mj/7nZIgqRuI5JqAV+Ha93hs4wLanrL+FFF8By0nIHpDWQKhHGGHEVZL2KkFsaDVciXnXMRh/GMp2CsIZas/sgt00YIUHPAs3NLj2XCsepS2q7axJdPqUzWlVmQdbs4kRxOYXa8RtDnG/e62P430dHDPrdYy9RfQ3hSPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtA94fztnwEKF04WBZNS3Zzns+5ckvqWHHaljqlaV4E=;
 b=rcow1oLzFOpO9KmTTxM1AZ6F9nOMl9L88SsypOaVXigLUM0KcUbL91agGfCQoK4qEfhy7MkRjrBd4hqKB3c4hNCxx0zMKiuTQWWfw6ABcUgeCb823wSy+8fgz0UuKnKG8fqoewJbcMb1JdfAUZts/G/FejkWILGiXz8t2ymsQK/gwsxbjMLu7uVnmJZM9wQdE6IGqecX2KYZxI2d8e/jOxDeykxeyhCusmFrfCSbPHJaUkHdsXmUxYD5VtR4aF+M2hGFgKmdURVJWojtQk0g4Jxa95jUp5qMUxrHe6ENwcx9YXHjMgVwq9zcqrOun5h7xPDrPgTVhN9+KZ2uAxkshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtA94fztnwEKF04WBZNS3Zzns+5ckvqWHHaljqlaV4E=;
 b=bIgbtwzn5cQk9L7XxMd7iO1LpHJgCsm5Ygrmi8obDUSBARAH9qiyIhOR8d5iUqfxUIg+8AaHrbq9H5gk+7Ge6ZZDQiwDFNN5ixax9zN3r/76kuLC9YT7t8V3wiKQjqBXqCFaGljLzjU4qwBTY1jvgeQf6meh+HGmcI3X5bJ10+8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB7905.eurprd08.prod.outlook.com
 (2603:10a6:10:3b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:44:51 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:44:51 +0000
Message-ID: <9f30764e-14fe-4674-bdf7-eb53097bc51e@arm.com>
Date: Mon, 21 Jul 2025 12:44:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
Content-Language: en-GB
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-8-karunika.choo@arm.com>
 <CAPaKu7TFYuDNns1wwkb9RdZqgurQhAGMMOrOOUsg35umqLNL8w@mail.gmail.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <CAPaKu7TFYuDNns1wwkb9RdZqgurQhAGMMOrOOUsg35umqLNL8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB7905:EE_|DB1PEPF000509FE:EE_|AM8PR08MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: 484bb3a6-bf4c-44bc-082f-08ddc84c142c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VEc0Q3lyWmlIOXEvSHEwMC9wYi9lQ05saEYrdStpbWpydTkwVTVaMEh1SjQ2?=
 =?utf-8?B?bjYwTkdva0hIMVdNMmVxZnJuTzl5amdzNHEzN0lzQ3hRTXZyWlFQMjgyVU9U?=
 =?utf-8?B?MlJlZFVaL0ZOc1h3c0VPYXBHSDFvdWU0RFF5VG01M0taMk1WeUNuMk5kRDgy?=
 =?utf-8?B?L0lzYXZIS2dwMlJFZWJHNWZ0R21FL0wydUFvZkJsT1FwRjhHNmtKVWZOR0NC?=
 =?utf-8?B?Z2VCdmNYVUN2TWRQQXltbll6dTZDc3J3eHh6V29lOGhsbUc5UXJySGRDN0s1?=
 =?utf-8?B?RytIV2Nxa21Ra0kwUEVHTlZMeHlKclJiNXdnaUdXTndBRkYram5mdllnR1E4?=
 =?utf-8?B?OS9mMkJaSkFZK1BJWkNZcGl3T3J0bnlFWHV1K1FTeTRMSmlPZ2FKd1B4cC9L?=
 =?utf-8?B?WEd1NHRBMkwzSlRDUHpyYWZLd2ZxYkZ4bVkrOVp0VngrTENDOVJScmxJajE0?=
 =?utf-8?B?a00zbTczc1grNWViV1ZBdGJIdUFqNHB5azNHY3doeEJ3ZnoyQ2NqS25CMi9Q?=
 =?utf-8?B?ZDRubXU4SWtmVmZJSUU3SER5TFVmOTY3aVZNNGZ2azR6dDJ3MDZVOUcvOFpI?=
 =?utf-8?B?NXBDSG9lVkdKNnFqeEFjeDVvWHhHKzBKK0w5NWNiMUsyckF5WnJ6WGNEQ1lV?=
 =?utf-8?B?c2k4aG9Ia2VNNjhMZm5uUGVVM0tLZWtwMnJ1QW9nWUNBMUpoYkpuOUlLbkR0?=
 =?utf-8?B?SWNoVXpyMm11NjRlYjVjTGxJS1lnRDZzWjA2eWFJMFd0NENpYUxEdmdBY00z?=
 =?utf-8?B?Q0t5aU1iQWdwYlYwTFN6VGh1NUdKbkRLRVk4VzFRTnJLMzNkOE1sYWZWQ0t5?=
 =?utf-8?B?ek5UcnlDbnU1OFJLS3BhSVFqK3dWd1RvMHZnMlpjTVZTZVRJVnFYWlNTSTVM?=
 =?utf-8?B?b1dHZ2w4eUp6UHpKSER6YVBOWVhzZldSRElPZ1lKWWpNM1JFREpRcjFhRXpN?=
 =?utf-8?B?SzZmd0YrNDN5NVlpZUV6VStXbGNKVlgvRmc3bHEvNW52UllhTlNHVVFNNWNK?=
 =?utf-8?B?TTlkQzQ1TWc0ZGdGNlF4cGlaV2NYWkFwVldxaHR2L0RxV1BYYkhteGhKVXVN?=
 =?utf-8?B?c1lGbzV2c2xGTTZaZGdpWVNrUDlRcmdwaGhDRExESFFOMURtOHkwMUJjOGky?=
 =?utf-8?B?SWlPWWRvbWJhczArZTRlTThmVDExSm91Skp1dnJ2clhOVXk3NHZ1bGhHV3Bv?=
 =?utf-8?B?bWl0N0ZaZWJqRTlGTXp0cEVtMTA3Um9mRXRaM3hjT3RqRjEvRTdDVnJ2eVJq?=
 =?utf-8?B?M2lGUWp2UjJNUVVTQmgybmVON2ZaZnRwdVVPTEUzZHJHRHFPMGpHWHkyMlho?=
 =?utf-8?B?RVFuYWJJV1k3dUYwNytOSUpaOXRTRVR2OVNlY3hpVlVnNEN3U0trbzVFTkh5?=
 =?utf-8?B?M2lHSXhVZ1RvL2hBckdTeURuOVBoM3R4cFVRaWVhbFhwdGVQOEZKV25kdXZO?=
 =?utf-8?B?NkQvK0ozWnJTd0NPMnVsM2ZtQnVXQ2E2cWtYa2VxWWJyNnVFSzNDM0JKVEw2?=
 =?utf-8?B?RXlhOElOaEtKUS9jM291SitNdFYwTEZyRWtFeDRvTFN0aTF1enF1OXJGNVNL?=
 =?utf-8?B?ajVqSlFIM29uendHSE9MaHRTZzdCZlRkOEJvcE5PcWc2N1ErRWZ3Qnk2aWZI?=
 =?utf-8?B?bS9BNGZ6ZFdHMlByTmdFNnRlbGM3eXdKcklUL3JGRnB0YXU1aktwNWRUOGgy?=
 =?utf-8?B?dDg2aHkrVkhIWFVLOTdQSjhZTi9WZUxvN1Q0MkhMblRGRjNOTkloMndhOWRN?=
 =?utf-8?B?anlacGpDbFF3aU1zMzlPUEdOVlBiUFdPcEdQOUNYQU9WR25FVk5YUDBQTkln?=
 =?utf-8?B?d3FXRTEvNXRSV3JXNFdTdWV4VGxiemEyRGxkZlhUbHk4ajdhSGRTalZpUU5o?=
 =?utf-8?B?dHNBSjgvL3V5K3ZRRHdBZWJHNnc3NUVMeHBWcGp0OEUvK3JSdHIvMi9qNFZm?=
 =?utf-8?Q?ozKU1yxARAI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7905
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 34107ae0-af51-49bf-3767-08ddc84c00a5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXM1SCtuWTRsRVBITWZaNWZ5V3ZGZGRMVkZnMWFHSkxDOUpOUjMrdGpxOXJO?=
 =?utf-8?B?T0g5NWVqbVg5V2xEMHlITFpVUjNlNUZsc0VOU0VrVVN1V2VmK3EzVWpPZVJq?=
 =?utf-8?B?VmZqNFZvaE1CQlFIUGNRZ3lBQm1ZYm9BcURTN1c4T0ZMdnBTdmpzZVlocjI3?=
 =?utf-8?B?VE5XelRPV0RpNGhJUEpPSGpZckc3aXR5clVEb1lEMnluYmp1RlZKY1ZuaWhK?=
 =?utf-8?B?eFlpSkROSmdHRjVLdXFmUi84WlNpckthQWtMbXM3dVRSRWJtaUsvL04rVHds?=
 =?utf-8?B?aGllNHY0UFduMVRpVW41ZjB0STcrdUxmaTI4bGNzdmVEckxrUTU1aHZGY0t3?=
 =?utf-8?B?MUZ0aHFkU1NLUEpBWDVJOTRIN2FSenNySEdFUUY1aG1yTzhXUE1JY3hmU0Vo?=
 =?utf-8?B?QnlFemN4K2VwNFd0V0IwZzhsWUFHUWdLN0c2MS85QVVEcHdJWU5rYUpxY1Vl?=
 =?utf-8?B?VHdVcFdWSHRZakx6WEVPY3pNYk11endIcDJXZjVPN04rOHBMaGFlcTFXeThK?=
 =?utf-8?B?NFZESHBteVVXUnEyWXl6UWQyZGlhS1ljRUtCdndVUlo5Wk1IdklCYVhhYzZn?=
 =?utf-8?B?RFFzWGdvK0liOHN2MzRKQTJkdlQrTEI3TW9mZnV1SVVKTlU3Vm9CeDVuc1Q0?=
 =?utf-8?B?Z3pOTXRMSlFxZERnWFhkL0JUVEphNklFemxrQzhMMlh1OU0ycTJoWE1BSGd2?=
 =?utf-8?B?eTJURDJyTWRmazZUTXVXUXRsVVZhYmUxd0xVamNUcmZycXhQOS83UUJva2ZU?=
 =?utf-8?B?UllQM1loZzlvWjBDU2tpQ1RQaGQrSDc3Q2RMWmJlYTBFTlBCeXNIWUZGSzlh?=
 =?utf-8?B?UXNhY3NWa3B0N1Job0czMHpqbTVuRXdzd0h6cWtucFZaNnRoSkFNclB6dzJU?=
 =?utf-8?B?VTZtTGdQWWVMVWF2ZEVKaUsvT1MwU3I5N3MxbDhuSXBReUpDRjdnU0hITXJH?=
 =?utf-8?B?UW1DU1pyNHRmOGtXOW9pUzgxbHpkUXBWaUxZMnpUN3hEUmkyaEZJZnBqYTNr?=
 =?utf-8?B?NjFpMDVWY2V4NXNqRmNWUmFkM3hmTGw2eDA0MmZnOWpQTXM2dzZydzNNeVZE?=
 =?utf-8?B?MGZiZnpSNGRVS0VtUmxGZ1RZSmNEdVphTzlNaFRzU0tNbHI2QWNYamM4Wkl6?=
 =?utf-8?B?L3hFWll1SDFLZ0ZFWitUUENGc3dyRnBTWWtib1Byb2tuaDVwTVFITE1URCtt?=
 =?utf-8?B?dWdoT2g5MWpsSi9CWFdkck1XNzBXOHB2b1g4T1NCclNjaFA2YUdNZURzVEhQ?=
 =?utf-8?B?RFRPd21yYWVxeld3aUEvbW40am1Zdm1NUTV5ZUZleEhQSzdJK05ZVEdSeVNY?=
 =?utf-8?B?dnlHeWdsYTZnYjZRVG1MRlZqbWIwZCtpdHE1a2ExTTl5djEzMzBUNXRUVWRP?=
 =?utf-8?B?WU1UZkFCQjZCKzlRdVZiQUlFL1Rlbk1zOGkxUm5wSE03YWFvYmhBRFVyRjVn?=
 =?utf-8?B?dTRlY0hpbVZkZkh2akhMTnFBcXVQVHRhaDMxSFBvWnI4RVBSVzc4R1E1dFMy?=
 =?utf-8?B?QytaNExZaHJPeGhRS2lsbm5PTFFVWWVHeWtuQXJwR0ZQZmlvNmI4RTUvSmNC?=
 =?utf-8?B?M2szTXJXeUg0TXBuNE1hSEZ3bHBlVEkzWlBYSDRNckhldnRUNVMyUzNJR2ZU?=
 =?utf-8?B?QWVOdDBuZ3pNYUFTSnlPQ29nMGJKaDZUV1piVmNaMUZOcWRZR3ZwV0JQZity?=
 =?utf-8?B?T2orU2tIZ0pWenB1R0piZmJ3YTAzWDRUMW1wZlZFK09tMW52M1hRMnVXYXFO?=
 =?utf-8?B?Vk50bVVMbFBYVUU2MHVaR3dFcEJ3YWY0LzFuWVk0aGZWNmQvY3hBZmJ5NTFS?=
 =?utf-8?B?VHFTT0I4OTBxWGEzbFBxUVdrbHpZSldRS1BDbVJ3aktmOEVvblZ0VGdGR2Vw?=
 =?utf-8?B?UXVOZmdJcnNMUVRvbDd4c3lOR0hjOWlSSlJHSmdBTE1zbENuNG4zQ2RSZ0Iz?=
 =?utf-8?B?Snk5YkZNNlJGejk3Y1MwQ2cvZDQxNEVMOU5aSGFZY3FFR0gvNTBEVUtHMDFr?=
 =?utf-8?B?Qy8vTjF0QnQrVzJGbk5hZ0pmeGVtZnp3UjFJbjBjR1NpZ0Q0SUZWT0RpcDQ4?=
 =?utf-8?Q?ymE5/z?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:45:23.7013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484bb3a6-bf4c-44bc-082f-08ddc84c142c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6579
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

On 11/06/2025 00:45, Chia-I Wu wrote:
> On Mon, Jun 2, 2025 at 7:34 AM Karunika Choo <karunika.choo@arm.com> wrote:
>>
>> Mali-Gx20 and Mali-Gx25 deprecates the use of FLUSH_MEM and FLUSH_PT
>> MMU_AS commands in favour of cache maintenance via
>> GPU_COMMAND's FLUSH_CACHES and FLUSH_PA_RANGE.
>>
>> They also introduce the following registers:
>> - GPU_COMMAND_ARG0~1
>> - SHADER_PWRFEATURES
>> - AMBA_FEATURES
>> - AMBA_ENABLE
>>
>> This patch enables FLUSH_CACHES for both families of GPUs via the
>> PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH bit until FLUSH_PA_RANGE support
>> is added. It also adds the aforementioned register definitions and
>> firmware binary support for arch 12.8 and 13.8.
> <snipped>
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index 4eaa2b612756..8e01440f8743 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -89,6 +89,8 @@
>>
>>  #define GPU_DOORBELL_FEATURES                          0xC0
>>
>> +#define GPU_COMMAND_ARG(n)                             (0xD0 + ((n) * 8))
>> +
>>  #define GPU_SHADER_PRESENT                             0x100
>>  #define GPU_TILER_PRESENT                              0x110
>>  #define GPU_L2_PRESENT                                 0x120
>> @@ -98,6 +100,8 @@
>>  #define L2_READY                                       0x160
>>
>>  #define SHADER_PWRON                                   0x180
>> +#define SHADER_PWRFEATURES                             0x188
>> +#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT          BIT(0)
>>  #define TILER_PWRON                                    0x190
>>  #define L2_PWRON                                       0x1A0
>>
>> @@ -125,6 +129,13 @@
>>  #define   GPU_COHERENCY_ACE                            1
>>  #define   GPU_COHERENCY_NONE                           31
>>
>> +#define AMBA_FEATURES                                  0x300
>> +#define   AMBA_FEATURES_ACE_LITE                       BIT(0)
>> +#define   AMBA_FEATURES_ACE                            BIT(1)
>> +#define   AMBA_FEATURES_SHAREABLE_CACHE_SUPPORT                BIT(5)
>> +
>> +#define AMBA_ENABLE                                    0x304
> We still use GPU_COHERENCY_FEATURES / GPU_COHERENCY_PROTOCOL even on
> v12 and v13.  I suppose they are compatible with AMBA_FEATURES /
> AMBA_ENABLE to some degree?  We should unify them.
Hello,

Due to some changes in the fields between AMBA_ENABLE and
GPU_COHERENCY_PROTOCOL, namely SHAREABLE_CACHE_SUPPORT, which has a
value of BIT(5), the previous assumption that FEATURE = BIT(PROTOCOL)
for GPU_COHERENCY_FEATURES is no longer valid.

As such, I have updated the field Macros for GPU_COHERENCY_FEATURES to
enable merging of the two register fields. Hopefully this addresses your
comments.

Kind regards,
Karunika
