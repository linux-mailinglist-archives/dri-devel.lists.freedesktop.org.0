Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B9B28126
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C542C10E961;
	Fri, 15 Aug 2025 14:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="amudGUM5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="amudGUM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013066.outbound.protection.outlook.com
 [52.101.83.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3310E961
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:02:36 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JE2Jgi4Dw2GENqUXUp0chUMvms+7qhgX7U0u61WS1lKyYJ1L4p3Qk57oNS2JcHkoH/uxJRdEtr30kz2fjjyJZs3Jzj6mQ1BYYfdOHIDERsGcWHJl8fOh4Yvh45I8dpsnzUC0F4pjWusDTPN/Gnf5AuUYvP8/QZXrAtlormYcOaZNYo+tIz0yLeLHjpYqUGMuRb8abPbLDjRfyOII/Kn560xxHwNgj4dZlvcKg7C+q+gnqzm+yV4fFSwUdsYufXEW8Wfgr78d7cws5vqMuaP0d1/73ATfJu2+YMpmqoWg3I1cDFzZGwsYv25QMy+cdeHhDTETL8Xqh0QL5zmkepDBnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/urGEhStU6Dq/xUvP6jWaJcShPOS1eH+caGBcqfr5c=;
 b=AFB08j7lLq6tOj//Smhp9wdoMKSejHuHun6yAU6VlLF5sA2GyQ4u9hUHxiuW4QVK5lGXb4k/q/xMRc+3TIfvbkmsnzJfmQ42GATtYyruQAMCnILEOic3Z7j2ldM24J3DMRMAKTXtOta1saaJFSlkUCFaR2HDstKDxOePWcc3IGE5KNTynvB0h4RwWXrQV+wk5jAp0x3mKk7Ev9OwzR1mY2XaTu0ICsNBDYmdWsfp/Dh6+pn/v3WQ01nY4UQTOCBXRfI9v6XP0ZHMN2SrCLxMCr4eQ+2PE2LYeYa+d9S3+MrFmGTZwAFXsOIzelbuD2MUSRNzY62kxVT/2j2jyBVULQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/urGEhStU6Dq/xUvP6jWaJcShPOS1eH+caGBcqfr5c=;
 b=amudGUM5tfq1nBdw9arzfZjUusAUuoVVJ5zXEnC2N5Njbv2pwC54IZlfzXhIaaTDckaviiOzU9R21U3At7KnUqD4DfOrAlONiC/B0QaMovo73nJNb2V8I1MgmFy/CBUf1VxLCivNGtURcAGpCnvbrJvbjNlgG9GcrYywAEd4ol0=
Received: from AS4P192CA0037.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::28)
 by GV1PR08MB10718.eurprd08.prod.outlook.com (2603:10a6:150:15d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 14:02:32 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::82) by AS4P192CA0037.outlook.office365.com
 (2603:10a6:20b:658::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 14:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Fri, 15 Aug 2025 14:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbO3CBaerImQ+89r6ibcKCGNSO5qeFAA/CrOwS7JvFYnLc8fyGBDd6/1e2SU9e27pGurNxlNAODX8Y8BD5Xl3KT6rECa19rON0qjV1hqU2M2WGMpqekdq9stKzS4NFWjargGRA5p9IC1khg9hmyE73VCBrk4FvSYpeQTaewgXX4AFFof3JPY7u1mxmxD2VL2odrOtd6tAL1NrZA8Z78VG88794UXEiJtrSaZLlPYdnaCLxiHbZO8acGAmVLW5AZJBo2UdWr0soMTtS5KfOnp0A8qwdGX4eXUgVrEIZ6iUhA7fzAra5mN/utuUdSpdnotH67E5VswLRIzML2Tj0LZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/urGEhStU6Dq/xUvP6jWaJcShPOS1eH+caGBcqfr5c=;
 b=TiFcbFoMmMcLfDaW7Tc7YHcg930LQK6QKAdwMmmBQTkNiikBFZ/fD31/amukrKV0B1KqDjjUoQIpZd3yuKC7Dr9Mf15jU5+l1Ub3BSVilB9zW78Hkf9J+6p4fQuqJnufAB/So4UblB4D3WteBpcSe6Pv1pyIVo1Rsmmv/NX82sIIxJZZKDtAnHKQZbYCgToym7DZ7VIQ1Kx3HxXKbw3urYaLsqFj42uBLgZAsOeQHorg9tM+3t8E17WUARLg4hQaxTcP0rlTbhqqGyBiGAPkdSO8eSuQToB50cKXsChDk9sTJ3QRfwMfmRZmuyQ3d0s9+Ek0EcwsGhfzkcZGoryooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/urGEhStU6Dq/xUvP6jWaJcShPOS1eH+caGBcqfr5c=;
 b=amudGUM5tfq1nBdw9arzfZjUusAUuoVVJ5zXEnC2N5Njbv2pwC54IZlfzXhIaaTDckaviiOzU9R21U3At7KnUqD4DfOrAlONiC/B0QaMovo73nJNb2V8I1MgmFy/CBUf1VxLCivNGtURcAGpCnvbrJvbjNlgG9GcrYywAEd4ol0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM0PR08MB5442.eurprd08.prod.outlook.com
 (2603:10a6:208:182::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 14:02:00 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 14:01:57 +0000
Message-ID: <ee996a62-bcbf-4702-837e-85f93feb7240@arm.com>
Date: Fri, 15 Aug 2025 15:01:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Simplify mmu_hw_do_operation_locked
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, nd@arm.com
References: <20250815134226.57703-1-steven.price@arm.com>
Content-Language: en-GB
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20250815134226.57703-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM0PR08MB5442:EE_|AMS0EPF000001A1:EE_|GV1PR08MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d50886-166d-4669-7ab5-08dddc04612f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?c0E4K3d6cFE5TFpXTm1iRVlsUStWOWduM1lzemZyZzlheURES0oxZnJyeDh2?=
 =?utf-8?B?RW1CU2JhdDF6UnFyMDltY0xqZkxadGZQVjA1QUpFSVhqbFZJcy9nK3hkak5C?=
 =?utf-8?B?MlhtMVh1dGJEZkRsUW5jZ3V4d2JwVW1aQ2xjekNIeXA2ZGg3Mm9DWWk2b2p1?=
 =?utf-8?B?dXBRU0tUaTF6a0hPaXNPcEVXRStxMWJIRUFHaThucVNoVjVJd0lWRGhHTk5O?=
 =?utf-8?B?SWNmS2EwVE42OGcxNDB4c0s2ZWwvVTFlSE5mYzV3RklSS1Y4NUpZdVFhdzRj?=
 =?utf-8?B?WkswQVpzQ0UxYUZsbFNRejRaRmNpSlliSVpnRWZSNmpqMFh3K011dTZZY25X?=
 =?utf-8?B?N290WFVqM1VPQzVaMVM4Y2JWK3JtL1Q2R2J1MFhJRFd6WG1WdUlhdmkzVVBO?=
 =?utf-8?B?eU11aXp1akl4QjFwR3dTQUZ2VnZzQkQxYTgvOFZYRlU4dnRlNjVOalhmQTZh?=
 =?utf-8?B?dGtFTWo2b2w2VXpydDI3YnhqUVVxMXBTUmR5NW5ySllzN3BWYUdFNUw1Szd2?=
 =?utf-8?B?M0Y2eWQwbHBPMW9sUHJROVd0Ty9NclNjM1A2b05lS0Z2UjhmZTZWNGRldzlU?=
 =?utf-8?B?a3J5a3hLTnpKSmNXSWhjL1RubGxtVCtlSlQ5WEVMRGk0bUZEc054QVRjU3d2?=
 =?utf-8?B?YlhyL0ozNllodHdjcEREU2hXVktJVExiN0ZNMFlxb0RjMWM0ZWhBWlRSV05Z?=
 =?utf-8?B?dTVQWkV0MGhqMEZ5RHJaSFQ5VWpyOE9YME51cUIzUjZMOEFYa0tndWwrdXJ1?=
 =?utf-8?B?UmloYlhXWTlVR2JLZGxhMktKaVNQZ2NubWJyYkE5a3BvZDF3bnQwZjM5YlJx?=
 =?utf-8?B?SFhidnRJb1phU0JSNU9wYTRNM3dVOVRXWHB1Uk9xQzlnN05aeFJhVThTUzJp?=
 =?utf-8?B?aGpYWUNSTFQyMFdLOUN4UWxoZ2E0aXR5bktDdXJkWmdNWUM3R2tSMnlGekhv?=
 =?utf-8?B?ako3a245RFJ6Q0Vsb2FpT2h6bEVFS05FZUpxdm1wU1NhZ2RLenVrK0Y2Qmpv?=
 =?utf-8?B?d3dSVVBVdmhLMG9vdHFiWTRkR2RBZzNLNUYrOEEyU3BsRmNPdHNHN2RPUUxG?=
 =?utf-8?B?SVd2cmRoTm4vV0MwN3A2bnB5MHNmTmlGQWxnVGp4dGx2Um84YzlwZXR0RUdy?=
 =?utf-8?B?SWRPbTBqYm1IUW5lVkdQWXhoZHptNW1uakNEZTV0OG1RV3pyMUc4NFdUM0I5?=
 =?utf-8?B?NDdLcHdpWkZ3TEpRZ2piME5hQzZSVmUrV21SSU8xN2tsUWNLaG9vc0ZzclJ4?=
 =?utf-8?B?Z1YvY0ZIZ1NYbDJWQWxQc1NrSnFJY3JyZmtZdlhTWG9NckRYelMyOXhYQkha?=
 =?utf-8?B?Ujg0bFJ6VnREd2RSMXI1bVY5ZzFMYVFGTTV2UjhXMy9OM210Rm9Pd3BmUnRy?=
 =?utf-8?B?OWlxWGdMVTVFTFJDdkdHcDBrSVo3NUxzSDBoUURwTlRxSDV5QU9hT3FZN2dW?=
 =?utf-8?B?UjRFYTM1Sy9EZWlKZ20wV2ZtQ290QXVWZTA4TzVhcGQxYVRoYlJRVTlpVmFs?=
 =?utf-8?B?Q2VkVTVXUXlYeWM4bzA2VVZYRE9DZ2NKS0haQ3hWZjVMM0pycnBNMWJycjYw?=
 =?utf-8?B?L0JVNlBkVVNsUDVVMlJyOGN5SDdUUjExakZaZ0NCbGdhRStNSUFNcEtKVFNB?=
 =?utf-8?B?OHVFaVErdGVnUVMrNE1qN056SnpEWkxNa2QvYXF1Nnd6MnJMazhEOGJJUDZD?=
 =?utf-8?B?Z2NQRkZHVDFBaXBqSmQ3MkJTa0JpQnhkQmw2TDV6UHpoODhXRDFGMlFQNmhT?=
 =?utf-8?B?SUlrbVQ4QmF3MEpDVDJTenpTY3REc3N3Qk1lT1VudnlOcFZCSDlTNFlzVldu?=
 =?utf-8?B?cGdrWEFISnUxdTRVUUdnb0o3VTA3RFpWdDA1MTNBU3RZYkpVNlo3UGlXY29U?=
 =?utf-8?B?VVA3YkI2cU0rQXFHcHFhV055czRVcjJ5dXIwZkZPc1ZMUE5sSVg5T2Nhb1BU?=
 =?utf-8?Q?U4WNlw2u4uc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5442
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 059d33c5-ac0e-4df4-7451-08dddc044c68
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWtIeUIrRUZ3REk3RGZjbC9DMHZ4bWNEQVdNRVIwU1U3VVNRc29hSnkyaWF3?=
 =?utf-8?B?eXRqZ3hjYW1seEpmMTd5cEt1cGUrbitxMUVFcC91OERTNzdTV2VQYzBWWjV0?=
 =?utf-8?B?dkQ2R1hWamswWFZseVVwREZUR2RCRm9RNG5yUFpvZk5UcmkxdEpKM29ESkdv?=
 =?utf-8?B?Nnh3Yk1aU1VrRHkzb2l0MjlEc1NoZW0vUnFvWDlUVFlZWE5xQ3UxQkEyNEJK?=
 =?utf-8?B?cExxd1ptbEhXeVU2MVZLL1podElvQThESFE4VEZoZ2Rmc2VZSnh6ZEY2SWZV?=
 =?utf-8?B?UXYwc1FEcHhHMm9yRWFHOG5NQUpDVXlXaWwydkVEV3lWY0dnYW1uQkpJYUsz?=
 =?utf-8?B?bXZDR1ZlVStsL0pVMkpCM2I0UFBjL3QvMXZBV0pjSjd5UlF2UStlNG9DUHNO?=
 =?utf-8?B?OG9wVSt3M0NGY3JBZTBuV2ZFdVdBVXpPQ0JOeGZ2c3g0SXFjVDNQeGpLSVF0?=
 =?utf-8?B?TE01Q1lxSTR6dmlUQlczWTROR3d2OWZrWnNFSmxINmpDMVIzcDhlL2VzOG84?=
 =?utf-8?B?Y0ZUbnkxM1h1NnVxS2NOZDhZTkRSOU1vdmk4L2pjYm1IdktVRUdsaHpnUVFi?=
 =?utf-8?B?d1UxRWdqUlpLSjRBc003UTVrV1lud1dLdWdQTkR0aGMzd0k5ZTdGVlBPOVZq?=
 =?utf-8?B?eDhldDdhN2lZRWMySXpiVGZrVWRSU3JjMUZwSWN4Z3lTRTNrSzNENDRYY2VD?=
 =?utf-8?B?b3JyY3hORU92MHRyOVNPRnNsbEJjUFoyY0NmUmxTYVRhSVZYY250U1VPbUl4?=
 =?utf-8?B?VHpic1o0Sm1lUFVROU5lZW9jdjVnZS8vUEthZVFUbjVPKzZGbjFIYnF5anAr?=
 =?utf-8?B?VkgxMEs0eXdYM0ZTaTNRNTBBN3pjd2Fyc25IUUovWmQvd3M2Q1ExdkxGMW51?=
 =?utf-8?B?TzBZakgwOHRmdWlzUUUxRHU2SzVhQ0FZYU1GNHhRMmVSNXRCeklsWEVQcEE5?=
 =?utf-8?B?dGt3NlY0Q3ZHS1hTNTdPRjVjaHdqWkY5ZGoxd1BDOERlWDhwUi8vUGlIczFP?=
 =?utf-8?B?eVl1MWNjMlQvQ0RraXkvMzI1QkFkRkVjdTRxWTBXMnI2WTdXdkt3TWpSeWdx?=
 =?utf-8?B?bkJ6aWhJY2JkampJUnFlQ0xEaFVoMnVYMDdFSDMxZEZYOW02Qkh5amgzWThX?=
 =?utf-8?B?TXhxc3RFUldlM0RGWFdLUHJObkcwQ01oY2hjWjBneDhoNThFckZicmxuVFo0?=
 =?utf-8?B?eWVGaXBCekdBTUR2NmxFQnVyRXo5OCtFWVdROEZXNmYrUVEwYk94dGV6SUZp?=
 =?utf-8?B?c296ZHl2ek1aVm90MUpDc210Z094dU4yRjJYMGlKTnFZQ2k5UmZlRFFiN0U1?=
 =?utf-8?B?TDlrbG9sSURZZ2hXa3BRVDFpNWhGZXF2cEU2bVk5MEVtTnBLWkgySGZwK1Jp?=
 =?utf-8?B?akQ4RUQ2RU9VMUZrOGdncXdYc0hRdDZ6QUFDWndvR0J3YWRxTFFIVFlVM3ds?=
 =?utf-8?B?Q1dPUlZsMXdsRk1uMFpUdlFYendyamVjNzBWRm85cU90SmFSYWtyODVuOVBO?=
 =?utf-8?B?L1ZWME9Iajh3dzd3cUpRTkJsNFYrWll0R0pmeWEwWWZOZ0RmanVaSW5qSFB5?=
 =?utf-8?B?Y0R5WXhnWHNsQ2hoSStTUmFmUCtZTXcyVmdCRmgzMmFrVnU2UnNUZ3N6cXl2?=
 =?utf-8?B?aXJBNWZldlJHdzg2bm5RL3g4MXRDYWRXdTY4N2Q0NFd5OFpzeCtjeDVDUGZw?=
 =?utf-8?B?WllmaWZXeHlXQ1pyVmVPVzBEZmNDYTNtR3Q2NnJhaTZMcjR0bDRMUitVb2Zr?=
 =?utf-8?B?UG9CWTV4bGtTaFlOSVQra29kRTN5V3pYVWlJVTFLQm1ueU1xeWgxeVRwN2Zu?=
 =?utf-8?B?anMvNlBIaCtuTDZ5UEduczdxOUh2UU5KSm9SRXhDU0lXL0hmazdqTlNXUG9Y?=
 =?utf-8?B?WWhJbUZrNkxJdDY5LzkyN1kyUlJIZVJsQWFSR2xIQWI5NEs0QU9uU0lhdzJt?=
 =?utf-8?B?Y3FhTWxkY1kzUmtpU1hwTDd6dHlBQ2pVTmFEb1FROGh3dW93ckV4VjdkRUIy?=
 =?utf-8?B?Q0Z0aHRicHlwcURwVEwzWHV6WSs0U1dNNGVhWm5CR09XY3hSR0xNcnFEZHht?=
 =?utf-8?Q?Qd26zB?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 14:02:32.4047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d50886-166d-4669-7ab5-08dddc04612f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10718
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

On 15/08/2025 14:42, Steven Price wrote:
> The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
> AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. This means the code paths
> after that are dead. Removing those paths means the
> mmu_hw_do_flush_on_gpu_ctrl() function might has well be inlined.
> 
> Simplify everything by having a switch statement for the type of 'op'
> (warning if we get an unexpected value) and removing the dead cases.
> 
> Suggested-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v1:
>  * As well as removing dead code, inline mmu_hw_do_flush_on_gpu_ctrl
> 
>  drivers/gpu/drm/panthor/panthor_mmu.c | 57 ++++++++++++---------------
>  1 file changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 367c89aca558..9d77e7c16ed2 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -569,15 +569,37 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> -static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
> -				       u32 op)
> +static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
> +				      u64 iova, u64 size, u32 op)
>  {
>  	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
> -	u32 lsc_flush_op = 0;
> +	u32 lsc_flush_op;
>  	int ret;
>  
> -	if (op == AS_COMMAND_FLUSH_MEM)
> +	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
> +
> +	switch (op) {
> +	case AS_COMMAND_FLUSH_MEM:
>  		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
> +		break;
> +	case AS_COMMAND_FLUSH_PT:
> +		lsc_flush_op = 0;
> +		break;
> +	default:
> +		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
> +		return -EINVAL;
> +	}
> +
> +	if (as_nr < 0)
> +		return 0;
> +

Hi Steve,

Thanks for pushing this patch. I was planning to address Daniel's
comment next week.

One small nit, would it be better to move the (as_nr < 0) check just
after the lockdep_assert_held() (above the switch case)?

Looks good to me otherwise.

Kind regards,
Karunika

> +	/*
> +	 * If the AS number is greater than zero, then we can be sure
> +	 * the device is up and running, so we don't need to explicitly
> +	 * power it up
> +	 */
> +
> +	lock_region(ptdev, as_nr, iova, size);
>  
>  	ret = wait_ready(ptdev, as_nr);
>  	if (ret)
> @@ -598,33 +620,6 @@ static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>  	return wait_ready(ptdev, as_nr);
>  }
>  
> -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
> -				      u64 iova, u64 size, u32 op)
> -{
> -	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
> -
> -	if (as_nr < 0)
> -		return 0;
> -
> -	/*
> -	 * If the AS number is greater than zero, then we can be sure
> -	 * the device is up and running, so we don't need to explicitly
> -	 * power it up
> -	 */
> -
> -	if (op != AS_COMMAND_UNLOCK)
> -		lock_region(ptdev, as_nr, iova, size);
> -
> -	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
> -		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
> -
> -	/* Run the MMU operation */
> -	write_cmd(ptdev, as_nr, op);
> -
> -	/* Wait for the flush to complete */
> -	return wait_ready(ptdev, as_nr);
> -}
> -
>  static int mmu_hw_do_operation(struct panthor_vm *vm,
>  			       u64 iova, u64 size, u32 op)
>  {

