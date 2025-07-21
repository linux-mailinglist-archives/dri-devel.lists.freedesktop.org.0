Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B9B0C30E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABEF10E038;
	Mon, 21 Jul 2025 11:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OjN5pUL3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OjN5pUL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FFD10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:34:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JB4tfKfzrQlKWqN9roHTUkHVZLJ4dfWrzyETyi5vDWbdtTKczwgexz5UdD2fcIQOzmPYZzt3NB5c4rT3IfsWtu0BENkLz73+woTbll9NEwytUEh0OXd4tolo6j5G3bekjyQENz9mMyw34xSi1U88WDajHLkjWDJS/WiJw+DMNKcxFG+VtAqj0YYF7l63hK7jy7nbzZ79cHk+CmcTAQW0Qj9dUwy/NW6p2RZJ8fxWdn1wbZwRRJpYIWoEXXy0PpYB2AYNSCuQjsabV2jNNMosEZky01EbBGp88bN+eQNNX7hnGtQxOuc1Ie3l084BN5iFINiI4+mo4FJT41bAbTxzVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sw43JVIWKeV4e1YAUC+E06rfZiXYGNEAZ5EoDXLr4zs=;
 b=MChsXnY51qRu6P028tjYfOJF0f9Pfl3Aq06GpxMi1bwlAORBW2e6c13rTfuFbq9ru4G1UNOzDc6r9+AtT3PHuqtYLw7ZskngTmEzG4pzqMO/rq4uOdG6Xnr5OU6eTXTc3IKORR2+xwhM87dVTs78ibsaI39eXjb3Uh2UP6teQrrGFqXSYV8zvR7MpgunSThunQbs5OE/XJv++vRLs5zMwnPPNyzcmgJQmwg/50FQ8poVLaBSPV0gjCpnqxL25MeHw8jcQ5J82EKIzOfq+pgvDVq3MFSnulDHwf2XpnsWyZU3ryCIHPEXSoFlXTiSmH9svQTUN3UuFwOIORK4QrLfTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw43JVIWKeV4e1YAUC+E06rfZiXYGNEAZ5EoDXLr4zs=;
 b=OjN5pUL3ZP6SXsAFOZfTdrvGUF2A+nLGv1056MJS9WUrx7OqDG7wmjpqcmhOcYM136NCHsLZefcnhfBCsMtlmtInsGvArz7dOTdTEqYapz1iNXgfydJBqaHe8lhsleoHl993K2Y+Ssl/dnbIEqwoBQ+osTS1iuhD8oi1TWxMUQc=
Received: from AM0PR06CA0081.eurprd06.prod.outlook.com (2603:10a6:208:fa::22)
 by VI1PR08MB10104.eurprd08.prod.outlook.com (2603:10a6:800:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 11:34:01 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::ce) by AM0PR06CA0081.outlook.office365.com
 (2603:10a6:208:fa::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIGRvl0KpXcNOgJ8thZBEZJJj8goN8WpI8qJvLMS0lG8UzbySGTaDEQLO5MnUBi4ZUaibZ8eKfH5Ovf+U/fq0aSbPjiReRRLwxB07jBWTYuYSIXAsiIMpdr4US2duywD53oj7iHZQhpmogDinpKjpM0i72FuOBQnxi9xf8yx9W/NOgy1uAVb7d0Kx61ZESMNkgY0Cw8vQSyrPJNC92pGSsrVayLLDjwALQ1vQZOcXxLO4JQ3ny/2tZdGO7huEecD5c7S/1HFdfIStdfY8mczfxFLQ2eQlqZObYJ0HmO5YWK/MZBMoMEaMorcNsNnrjMkrk1OdoB0/rb74uC8X7gDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sw43JVIWKeV4e1YAUC+E06rfZiXYGNEAZ5EoDXLr4zs=;
 b=S/9wjs1CLOr07e2uMlbPB8Pgq5HyzzCg11iZLyamsN+PEyH5TMmeWQqkoBsOyVJKwV5KLxoSwmBy+n9bw2Q/9dTx3D0HNU3FThYe8MU3/4SgGBgnv5OdupXR4TuieCTHgutSo19psJS/tKVk9hbVT4715azi1hzbDk1I4q2io4zniqofTDDlimb1Uw5lRRNxiblLHgcavFaQniHQSmIbRPMLY4n34CXHVTpj9IKc2rEdIm83PzephVfHTiOlFvq+NoWgL/ePCh52fxmT4obRiKAxEgkh78p2OLw0lOvHcf5qOmwhO4dskj1yoelwXCVVhR/tWwTxKjQPiYhIoY8opA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw43JVIWKeV4e1YAUC+E06rfZiXYGNEAZ5EoDXLr4zs=;
 b=OjN5pUL3ZP6SXsAFOZfTdrvGUF2A+nLGv1056MJS9WUrx7OqDG7wmjpqcmhOcYM136NCHsLZefcnhfBCsMtlmtInsGvArz7dOTdTEqYapz1iNXgfydJBqaHe8lhsleoHl993K2Y+Ssl/dnbIEqwoBQ+osTS1iuhD8oi1TWxMUQc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBBPR08MB10700.eurprd08.prod.outlook.com
 (2603:10a6:10:537::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:33:26 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:33:26 +0000
Message-ID: <db1f5919-6d94-4563-9158-922cfd9c636b@arm.com>
Date: Mon, 21 Jul 2025 12:33:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/panthor: Simplify getting the GPU model name
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
 <20250602143216.2621881-4-karunika.choo@arm.com>
 <CAPaKu7T5Rf+N-T7f-Vh0tB72AdDWx+nipqGjfWDnvDk=sOosGA@mail.gmail.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <CAPaKu7T5Rf+N-T7f-Vh0tB72AdDWx+nipqGjfWDnvDk=sOosGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBBPR08MB10700:EE_|AM3PEPF0000A78E:EE_|VI1PR08MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: ae690422-e53d-45ea-9fcc-08ddc84a7c72
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aXJ4cHM1dzhkdEl6U3NnZy9nZFd3WW00UlpOWTc2aFN0V3NDSGdFeVh4VVBG?=
 =?utf-8?B?NEhzd20zWnovSHZzTzVsQ0oyWjR6UTN1MHN0L0prd216bXhnTkxRR2U3Wktw?=
 =?utf-8?B?cWNlaUpacis5aUVKREtaeFk1THdoTjcwVlVjVVJMNXlWYUFUakc4U3ZJeHJL?=
 =?utf-8?B?b3lJaDlnNDkwZDllMEI2d2ticVdxalJIRzBDSU9mYkdqZzNCbitYTHFNbnBM?=
 =?utf-8?B?K1I2dlIzVE9yV1czTXZiYWVVdy82elBSZVNuU2Qyc0JXcEgwWnRmRkZZTDRY?=
 =?utf-8?B?QkNFUi9WeEZaV0ZpTTVKczV2WmxXcGgyU2RrWnlOdE5SR1VBbGsvSlgzREFJ?=
 =?utf-8?B?dFlvemN4UktDOTNnMFp2ZkxlMkNCZmVaUmhmVUNscTJTTlA2UVl0TUxVWVho?=
 =?utf-8?B?NDREckpTekRXako4SnF6N1hPdU9LR0tadUJUOHAveHdaMkEwMmVuTXBjRVNC?=
 =?utf-8?B?N05NejFlNExtM3Q1Snp3UzRQUTUvMUpDUDdXbHdoTUc1UlJDeGZVRkV5UVBp?=
 =?utf-8?B?bkdvQmc2bVQxR3ptb3UwOTIwMmZvanpCS2VSbkxybFI4TDBuMVVHWG9FblF4?=
 =?utf-8?B?VGZQbFM0a3YwdWMwYTJUOHoraFFtM1JPMlo0VlVvZ29xQXdXalNiMWhZem5w?=
 =?utf-8?B?UTVaSmcxSis1U3BqMmcvTytlMUdRejBjNkVIbHBoM1dKYmZDL0pQVEpuRFpM?=
 =?utf-8?B?aUd4SndXR3hJdVhvT3hKK1lheUZBTDl2Yzd0akpYVWlSTXBnTTJLeWhqZTd0?=
 =?utf-8?B?MVRuRlZENTA2SGVJcVBDNVQwRjNpQ2RVbGtwU2NjZFAzaHIzakEvd2pnNi9a?=
 =?utf-8?B?Rk1Ta20yVHFXekd2aWgxMmtLNmhkSXZkUmtJM3V4RzF4Y3U4TVZHNDF2eFBu?=
 =?utf-8?B?aDNoeVFHUWRRaGpMS2wvdE1xZWRRcVU1N0ZmMVZyclBleVUveUZEWDZwQkVX?=
 =?utf-8?B?Q01xRjhjUk96TXZOVllETFhyVUo1VHVOTmdNZnBZTWZ2NzVWaTRYSVZJZEpv?=
 =?utf-8?B?cUZ2ZmlObGIrWFQramx3WnFVL0xXUGNBWk1pWHZocjJNN2JNc2t4TDJpTkxG?=
 =?utf-8?B?dkoxa2hsaFgwMlFRcUNrV0pDUGlQa1d1R2FsR2pXOUtBM2FBOURKZWhYTTVX?=
 =?utf-8?B?QzZFVVZSWFBhTi9BWkdkaGxhTTVVOSsvZnRIY29oMFFnT3lNeHFkbWR3QXVC?=
 =?utf-8?B?ZEUvRjU1TFUvTlBpSlNaMkJIUkY5R1NyNnNYQ3Rtd3pNdFMvV1BDK3FRQlI1?=
 =?utf-8?B?dkRWNTRnR08vUTN4Y1dOZ0lxT2FGdjRSS0FqMCtkMklwWTNKZnlRSFR1WGtR?=
 =?utf-8?B?NkgraTdsUkwvVDJxczNOdDgrT1Ivb011NTI2SHd6Y0gwL1l3NUlzVW5RSUhq?=
 =?utf-8?B?MlpkUnRsc1VXb0xIb3BPREh1cTk5YjhadXFnN0gzalRPY0tWcFhYOWZmc0tM?=
 =?utf-8?B?NnN4NytZTDdIbUZuS1JoT1dBU1FXcFdmU01CbWVGWjhTdlFMUFdzbXRKb0ZM?=
 =?utf-8?B?eExIdHFrS3o0bzV3SUljQklWcnlBeXU4Ly9oaEcrRlZhRjFLNkhRZjRIU3ZS?=
 =?utf-8?B?Y0hSUENOeFZQMXZFMGhxTUl3K3o0U3hISm9FNjBjTGFXUy9ObU1YcUVTbjE1?=
 =?utf-8?B?RHN3TllGZEkrTDNKMXdIUERhYUdOcEQzZXVsNXZjVjBDVVlwbUh6TCtKUkJJ?=
 =?utf-8?B?QkJkQ1p5TCtvR1ByYzVjd2k4TzRxMDBaSytyc3JtTU1ienUyd2l1QWVUMGtp?=
 =?utf-8?B?d3NxVWNCWVZvamhGdXp1VTI1dGFlcGdiZEdHUkNpeXpqSXJmZ1YzVTg3bEQ5?=
 =?utf-8?B?eEVPaGxDZzkzcHg5TmxienJXTFArSUxTL1gyNlJ3YVZUamJjNXJOY0tqekhH?=
 =?utf-8?B?R0xTODhMYkRBN25MZndsZTcxYjg4ZExKY1JlcGo1MEQwaktGNm4rbTYvRXVQ?=
 =?utf-8?Q?kSazI3+gTUM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4046a8f6-2e5f-4b95-5ad4-08ddc84a6887
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|1800799024|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0ZPS1BoQUNqaWVhdXFMaFVJTytQaTgzTmZtNGF5dFB2Mi9NYXdpd1BOdEY0?=
 =?utf-8?B?SkxPUmM4Y3ZpZEM4ZTRGL0V4bTBsV29tSFJxS3JURS8vR2JXZUMyZUtlbS94?=
 =?utf-8?B?RzFuZDYrMmJGS0NhNDFWY0wxemFacGY4SEVHQ29BR29FK0QrOWpLbitCelNm?=
 =?utf-8?B?enBHK2FKV1JuQzZjY0hHNlRKYzdZVm10QkpPQXpEYUlLVDN5bXc3UEFlVFp2?=
 =?utf-8?B?L21YdzBUYzlONzZCZDl0dU9Oc3FSOURUeHBoM01FNFFzNTYzWE14VTlVUzBr?=
 =?utf-8?B?ZXYxekhabmVkOWhkdXo2Q3ZDUHc2VFhDNTZuNG1tVEUzUnRKSEV0WlZ3eTY5?=
 =?utf-8?B?ZlgzMHhZS0Q1Q1BHakVFMEZDTG5WRDBialBhalkxZDVXSmI5TTRTWkIvUzRt?=
 =?utf-8?B?a1Z4d3R2Z3FnUWp2aE1nV0VPVGRSMCtzNHRwUVl2SGU4TU5CQk53RlpHcjFC?=
 =?utf-8?B?SW5SNk1KNTZGZU0wVy84R215WnkrSzE5M0phcjUyNitjQXBaYmhxVkRMcU91?=
 =?utf-8?B?RWZIdWsxbkFPV2ZwUThVU2toUEhXUkRkcThySnhzUUp3ZGlaUzluU1cwUjh1?=
 =?utf-8?B?bW0yK2U0OGZEa1EvMXptTDlBVkNzK0IveWdiZE5QUUdNeTJKTmMvd2pGdTFu?=
 =?utf-8?B?SmE3OXZvOEFVcW4rQ0d6M1F2OWQrcE0waG5tRzBCVk9wLzN5ZnBVRVczZ3Nr?=
 =?utf-8?B?OTdzTEV0dEtMaGZTcm04NnRvOVRvcUJzQ2w5MGhrTXVjSklpZFkyTGU4eWha?=
 =?utf-8?B?UUs2aXEyWnd3SnhzcmVJck9qQktYdDNqOEhHSytySk00clpqNU1XOVUrQ2ZH?=
 =?utf-8?B?UGZOQlZwTEZaSDlCUnF0WXRKYVR0SnRPQlRyOWVSb0U2ZlNtdnVUZy9uT0Ez?=
 =?utf-8?B?ZEpwZ2xSYThNbXlQcHEvdGF6ZjdBeHZLdmROVlpiYnNlalZaS1RpVWpMMGtr?=
 =?utf-8?B?N0NrVXUzV2c1Yk5zUlFHWktLZGlxNVA4M2d2QTRPSktCbnNxMzVnRnBEWWpo?=
 =?utf-8?B?SHRXRFFpZmxEZFI0Yko5amplZVB1ZEhJdW5GdUQxWlg4b2dVdnI4TXBNT0wy?=
 =?utf-8?B?d3pzeE5neUMveFplUklwV2VJVGdVUHpLYjVNc1VYMGl0dkhKQmxocHJhcmwz?=
 =?utf-8?B?UGRZUUZZcXRMcDlwaCtFYUlkVnBjZ01Oa2RqN0gvT0Y5NWRtV29reVBCNGVK?=
 =?utf-8?B?MUtJaHFDWE9yekF3S0RyOXpGQU1MZ2VTUk0xMDBXTTgyUkw5cllFSXNpUHg4?=
 =?utf-8?B?Y0ZHYmlXeHNIcDNJSHZFQWtOUGlYUE1HdFgzMSsyTFpQTWFIa1NFQVdUZnkx?=
 =?utf-8?B?eXI0M0RjYVpBMEN1b2NQc2lzVXhCWmhpdFY0SUl3ZzI3NHFFb09hSkh0NWNL?=
 =?utf-8?B?cWJqY1pPMnJGbUI3SlpLQllxeVlwR1V5Z3B3WC9nSDNQRE9lcFhtNGkyWnhy?=
 =?utf-8?B?blZnejB5SnorTWJ0enVOZlB1NGdSeTBjWm9lbXlnb2ltWXVUN0kvTit1ekRE?=
 =?utf-8?B?K0s1MjU0R1ZXY2tRdTV3TW9iK0RlK0xvM3p3Y0hLNHR3WnBxQlRHMmtrYldT?=
 =?utf-8?B?UHJVVlpGOFJzTGIvdFgycWJHV3pBdkVGQ1ZZZE1Nalc0TzVtc0ZSWmwyV215?=
 =?utf-8?B?Rm9zZEg1Z09pMm5nWUlZM2dHejNvcDBhRmtzS1I4WmNReUR6dm96L2tmdURu?=
 =?utf-8?B?eCtFeHc4TmZWQ1FSZmx2eCtONEJ4cldlWUh3ZS82R2pLSWkxdTZHQThTOWVS?=
 =?utf-8?B?RFlLZGZzMy90TFozeloxc2kyMEM3clJ2K2ZkSllldkZ4TDVmOFB3dDJBTzdF?=
 =?utf-8?B?ZmllcEEvMFJlbkgrTW1FRGtZMFlEdkJlTkNra2FmMGhaWU1TeDFEQmNob2hw?=
 =?utf-8?B?V3dzL2l1cWJvUUFQWFFzcHNOV2dYZVNxVGI3VEV5dVJISURSci9BekUrYVFr?=
 =?utf-8?B?OE9Qa1grTHIxakFFR1hoWlRzSURHSTVuWWE3S2NHOG00S0I1TDBjNU5tL043?=
 =?utf-8?B?NHFJUXJmMWNnajYvbExoVnBVNnpBMnZZTUtsOUhQTk5McU53ZGw5UkhiSzZW?=
 =?utf-8?Q?7ySkQ0?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:33:59.6570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae690422-e53d-45ea-9fcc-08ddc84a7c72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10104
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

On 11/06/2025 00:32, Chia-I Wu wrote:
> On Mon, Jun 2, 2025 at 8:16 AM Karunika Choo <karunika.choo@arm.com> wrote:
>>
>> This patch replaces the panthor_model structure with a simple switch
>> case based on the product_id which is in the format of:
>>         ((arch_major << 24) | product_major)
>>
>> This simplifies comparison and allows extending of the function to
>> accommodate naming differences based on supported GPU features.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>>  drivers/gpu/drm/panthor/panthor_regs.h |  2 +
>>  2 files changed, 19 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index 576cda231c1c..421f84fde7d0 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> <snipped>
>>  static void panthor_hw_info_init(struct panthor_device *ptdev)
>>  {
>> -       const struct panthor_model *model;
>> -       u32 arch_major, product_major;
>> +       const char *gpu_model_name = get_gpu_model_name(ptdev);
> Move this to after panthor_gpu_info_init below.
> 
> We want to init gpu info before dumping it in general.  And in fact,
> get_gpu_model_name will depend on gpu_features/shader_present in a
> later patch so this is a real bug.
>>         u32 major, minor, status;
>>
>>         panthor_gpu_info_init(ptdev);
>>
>> -       arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>> -       product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>>         major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>>         minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>>         status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>>
>> -       for (model = gpu_models; model->name; model++) {
>> -               if (model->arch_major == arch_major &&
>> -                   model->product_major == product_major)
>> -                       break;
>> -       }
>> -
>>         drm_info(&ptdev->base,
>> -                "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> -                model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
>> +                "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> +                gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>>                  major, minor, status);
>>
>>         drm_info(&ptdev->base,
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index 48bbfd40138c..e7a81686afdb 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -19,6 +19,8 @@
>>  #define   GPU_VER_MINOR(x)                             (((x) & GENMASK(11, 4)) >> 4)
>>  #define   GPU_VER_STATUS(x)                            ((x) & GENMASK(3, 0))
>>
>> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)       (((arch_major) << 24) | (prod_major))
> This macro has no hw significance and is only used to decide the model
> conveniently.  It should be moved to panthor_hw.c.
>
>
I have addressed both points in PATCH 2/6 of v5
- https://lore.kernel.org/all/20250721111344.1610250-3-karunika.choo@arm.com/
 >>  #define GPU_L2_FEATURES                                        0x4
>>  #define  GPU_L2_FEATURES_LINE_SIZE(x)                  (1 << ((x) & GENMASK(7, 0)))
>>
>> --
>> 2.49.0
>>

