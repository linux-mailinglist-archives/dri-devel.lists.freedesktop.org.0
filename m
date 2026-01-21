Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FsQIKW9cGkRZgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:51:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4B56470
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD12610E76E;
	Wed, 21 Jan 2026 11:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="A+8wbuHX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="A+8wbuHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330E510E75F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:50:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aLo+SQQ4RZK0w9FU9JiJu6fIGo9sJxe9oBp/syCuOIi8SlOBlecJSs8UOimxHhx/QSh8qqPbBfNc3xfm2kh26UDfW10mJ0Qh13N+4errL20TWCe0uSMMcEa7cUToi4VCjMHOF31CgbRO51iAlT1/oo+2YWSZgJtEKoGocpiScy7g+bwOUe7c1Bxx9CsMVg8VptKTgA+mEyrfR9AZZrMhS0vxDHOUVGmTIjhSlsj5h1SkxUUHOWnxOWg6gXIo/CEa8yKSMvgd0sDNGxOiocTL/ymGxR4NNTjshmv+NkmsAGjBx5eAvJqTXGje5Q4VTRaTZjNxpPVyIKIHo2lCr/N3SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5asaocUb3YaLFmrS5LWH+eQ/sCuZWUl1xyBQfbB3aM=;
 b=y21GW6afq6iXSjS6NHKNAZdYya1YoMx8of2P0FNOheL8GGW43av5EU9sco2RZKOkP/U9SUeCbEW/uJMD53GJLgGE8RGD2RFfmy6APA6k86pApN4Zy/Tn1k/MRe7rHC6FZ2Sc7JSeXUk9hoo8ldLN74VPizahA5qhTzajT4bICUW362cpuodipw0i/Fvi4owRfGYeHh37z33ZsET0Vt9wfdIV71jHSUZn1mVPkSSrZKAPtKfQA3CkLrct5ozQkAgZDxpb+azR+RURxnDyQez8F4qWz9bC2M8S/5aHQZCyzzqYfrJk5DkGRlCaaAXw7uqz0A+o157ne2KbMPMk2liWZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5asaocUb3YaLFmrS5LWH+eQ/sCuZWUl1xyBQfbB3aM=;
 b=A+8wbuHXxaAB0Ta8SbbZDYqBfFf3LKbQrG94xQwmStc3xzZHFw8j0vDleLqcF+7Eb33qxdueZxDtcjQrSIoeKXfgrFqBi+hHpSZVrIiQip7xfQ0mYN30HZY7EdBMN2Wf0pA3HEHMwwtFIXFtF6SG7+T+BRShLqSC5zmwd0fvaj4=
Received: from DB9PR02CA0030.eurprd02.prod.outlook.com (2603:10a6:10:1d9::35)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:50:46 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::2f) by DB9PR02CA0030.outlook.office365.com
 (2603:10a6:10:1d9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 11:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 21 Jan 2026 11:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0+ap6SA9YfOWop/TYVflFec/D+nk4T4+IEvB5q62lu4yZa4tpP8Un7xlzBJbJVUiq2sP+6r96XsGLrsGCB/YgO2+x3/lJ9QsOgpJhEilIJRZ3xLNuJHPDtmtR9Ic+nDKEJF1mqx8R+Lqw272UzNqJBWIq4aggCSLz/SJuwRy0vWDUDoy0JY1D5QSOhyNnRbDMxXid2jhxlU5GOOuHCILNxLzE2PNf4x5emsdLyOlh1VMomEyARh1Ozwt9bRBrhDrqQg3ImkGJBCEqW2v+pePexjnz2I2V/uAaNFm3PfQEHEkkpQVgm9g1rzpvR+njrO6PQvGq4wN41hpUDu5ww95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5asaocUb3YaLFmrS5LWH+eQ/sCuZWUl1xyBQfbB3aM=;
 b=uDQQbT349Dq5iAEnrPi9vOEBLqANuR8cpfA6s9jteULu4eZHk6yz6nY8whK9vhItEhRRamIPzo9qWzL1F7alv1IHavcb2Je2ckuUWs5la+oaGtTnCy9C+rormCtX5CbVoeyHFLqtvj7eL2gzFe1x6NzkRi7fHmA7L1PNm7O7vMSuhCNG8G/P93WQqwpot0CrS7N/IlqnWMyGvUBJ3W+lGrZpQlCWBV09L+AbYtREyFc350rpd3SaVC8SF9I+5gRVpnld/wD1+cZgsxruvsPsw3fKZbFort2J73er5k4e8alfB9ILPa4vUfcHl2/6NFQWCY9hsIaoThEQyVK7L66nyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5asaocUb3YaLFmrS5LWH+eQ/sCuZWUl1xyBQfbB3aM=;
 b=A+8wbuHXxaAB0Ta8SbbZDYqBfFf3LKbQrG94xQwmStc3xzZHFw8j0vDleLqcF+7Eb33qxdueZxDtcjQrSIoeKXfgrFqBi+hHpSZVrIiQip7xfQ0mYN30HZY7EdBMN2Wf0pA3HEHMwwtFIXFtF6SG7+T+BRShLqSC5zmwd0fvaj4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PA6PR08MB10696.eurprd08.prod.outlook.com (2603:10a6:102:3d8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:49:42 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9499.005; Wed, 21 Jan 2026
 11:49:41 +0000
Message-ID: <714d2b72-67df-4590-9943-6289886c0a89@arm.com>
Date: Wed, 21 Jan 2026 11:49:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20260109130801.1239558-10-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PA6PR08MB10696:EE_|DB1PEPF00039230:EE_|DB8PR08MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b9b36f-8698-4cd9-1af2-08de58e35054
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OU0rSEE4Tk5VaVYvSEtYb2dCSWNXYTNqRjZ2VFQ0ZGF4SHhLU0Q5cUNKN2kz?=
 =?utf-8?B?eU5WNWpuUUNhR3VnZ1BvTUNQeWZsTjVUMHkxNHI0OC9uTVVKWjlUblhKRWFO?=
 =?utf-8?B?dDVwY0pONFdTTEg0MExMbHg3TlpCYzJCME85WGQvUDBMQUlMK0xLOExGY2Yz?=
 =?utf-8?B?THVmMFhrUTJxM2d5UFhFcm5MVm9OM1BLNXIrV3JOWTdDNXNvN3F2dEYxNWh5?=
 =?utf-8?B?cWtNS29zcWNGejlPc2MvUVFLQWM0ZU9KeGNKaHkzZFQ5N3dBMC9lYWl5MkFu?=
 =?utf-8?B?R2hmVEYycGZFd2NUOHM5Z2ZlMUp2UGF4S0UxR1djK0NnOU80QXJITlNmUkk5?=
 =?utf-8?B?THI0Nnd2S3VueTkyN1BBeGhSejRjWE9HOGZMYzAyZ1ZLV2QxYnJMd1pPTzQw?=
 =?utf-8?B?SFQ5QkJVUldTeDBmSnk1QmlDODMxZU5HK0p2QzVuUHdxM21sbGZGeFBJUGVP?=
 =?utf-8?B?UENHb2VMWE5sM1BzUVdpY0ZNaXY5WWV3dDZFeXk4ak1sNnhYcldORFJWWnRh?=
 =?utf-8?B?QW12bnhuekFXWmtYQWlDbnJuRklpa1dVeUVTTjdPekVsY3RvZjM4RlZxVm9C?=
 =?utf-8?B?QVh0ajQ4SHROamc4TzdTQmFIQjM0QzJrT2s5YWx4T1R6bktVbDlkQkJFQmp3?=
 =?utf-8?B?QkFZTG8vUjJYZ1ZFeUl3bkRzNC9qZnZlQ2JDQnhWT3Y1MUd5NFhTY2VNRTNN?=
 =?utf-8?B?SnVPMzgrNnFHcitmR04wQTNpK3ZROVVNem1GWG1mWE9XUG0wbUladmxYSHQ0?=
 =?utf-8?B?d0xsajhLaXRnWWtWU3RGSEUybDJhQnNUKzdDbDF1MUEvc0wrczRZekpDQzln?=
 =?utf-8?B?V2pmRG1wN2ZxNDJPckpzbmdJYlFjdGxCUDhHUWRuSGN2d0VIb1IxRXJCbkJk?=
 =?utf-8?B?VGFsVngzaGsyMVNHK3RGTHFvNmFGQTlyVFFiNko3eXg1RkRlMml5K1lmYkc3?=
 =?utf-8?B?TWZVVVpvZWxQWUUwTmpFRnlqZ1hiMkw1MmxLOUV2Z3p1K2JKOFFkb2IwdnRC?=
 =?utf-8?B?WXlzZWJySlo5SVZLZG94Tm00YWlHTlFrZWVyM3FuRFh2MDNTdlU4OTQ0NGwv?=
 =?utf-8?B?TEwzY1V3a2J3NmJJbVRrTHZMRVY0ZnRtZTJGbVR0V21Dc3A3VUVtRzFwRUYx?=
 =?utf-8?B?eDJ1c09DQWIzdndZSlhnTnJmVEUwMDhpT3R6em5Hdkl3ak1wUVUyRFJ0elgw?=
 =?utf-8?B?RWRyM0YzRjB2Q0lIdU5rRFJGK0djS3BmYkdyOWNNeEM3YXo4ZUI0OWV3QjVY?=
 =?utf-8?B?RUcxNk54Q2VjZ3FnUWU0ZHYvTnR5QTV1S1dCTFR0UWUxbFlRanRZOHlrS1RJ?=
 =?utf-8?B?S0duTFc4YjZZTms5VE1CYStiWXBqSXlYSmNFMHVyZXZHSE9vZ2k2STh5Mk9n?=
 =?utf-8?B?Z0c5Y1NZSVo1djFUMzBXQzlTL1BldlpwNVVYL2MzaSsrWkJVRFhjRzhGYVN0?=
 =?utf-8?B?SnFpMytEamFPYmNoSFZETkZvOFBOclRLSkdVdHJ5ejJ4RXJLUERXQzI5NDNv?=
 =?utf-8?B?UnpnOVV6QmFLRXVMVFB2eDVoTElMckExOXRLRzhFMWpJTjZUSHhSMkZoNjZU?=
 =?utf-8?B?S1N5S09GZFUrSWxSNnRBL3ltTkdFSEdkRnc1WXNtMGJ3Tkc2Zm9tclF3ZFk3?=
 =?utf-8?B?anRySjhuSk4xMDc5Vk84QjN6b0o4SHNrcXNxb0lCSTl4OUdiem5lN2QvVE9o?=
 =?utf-8?B?NVpwNGVGQVJPeURDR2V5NmNCTGtIYXpJOUxwcXY5UHRsSHY3NEI4b2plS294?=
 =?utf-8?B?cFVvMGF3TWhWcmhzSjYvTjkxVENGczlMMTlrUG5Pc3pkMUZrdjdUZmNhdjI2?=
 =?utf-8?B?V04vQWR0TExXUHp3ZGttS1RhTkI3M0pWWTJxWE5VajllSytQZkdQN21ocXlx?=
 =?utf-8?B?MWxjSlJ6OEQ5NXFMRHNYSVFLanErNzNBdzdkTjkzWWxWdDZnR3M1U1FSWFFP?=
 =?utf-8?B?WTZ2aVdFamZOWFNwd0FGSkcxeStoNUZlN1JBMjdBd1d1WUF3VG92UkFjL1l1?=
 =?utf-8?B?YUpsMHdVWDluQzcrTjFVZFZmREZBMkRqdzNOZGYwUHM3VHBvc2s2TEZsRzFw?=
 =?utf-8?B?U3NEdlcvcUpUeVl4QXJJTDIrK3hFdUYzQVZrMTdBdGc0OEVodDc1ZG9XdnNi?=
 =?utf-8?Q?wZiCB2qzl8NpUDDdM2AdUv5NS?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10696
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f9b206fd-5d12-4b8f-ce3a-08de58e326ba
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHlPbnB0UXFSbnJCZDU1cnQxK3VJejBTWHdSZFdMV0h3MVZxN056WE02ZWJi?=
 =?utf-8?B?NjNMTGsyUkJmRzRGNGMra0E0OXpiSFpVbjV1bnBmd1d3S1hab3RpcUZYTW5Z?=
 =?utf-8?B?Yng3NW1vekVzVFdWSkhZR3d6cWFvN2M0NkdzY0NMaU5sZDF1WmkzOG9semFq?=
 =?utf-8?B?YzM1MDkrZ1ZuQUEzSjdJalorbXlRTFdXME5LODhQYUJLa0s1eWRqZXVxY08w?=
 =?utf-8?B?UitQOHFmalE1N1N2a080bjlwYkEwU3htSnNvalovTldHdTQwZy9CMC9hVEpz?=
 =?utf-8?B?SUl0bXgwb2RNbmNqbTlUdlFhcXBtRzRQb2xwVHRIaFZOcXIzSzRIQXBVNUhL?=
 =?utf-8?B?VzVnODZvck44M1VWclRZYVQ5ZndReUxKK09sNkJ0dUkraXl1dW0wbnNaUytK?=
 =?utf-8?B?Sk9Gb2JVZFUxcGROMnZGS0dSUFdpVE0reVRzWERaUXU0Ull5ZXVad3ZZSDA5?=
 =?utf-8?B?MHBVOHArS2laUGpBelNzSUo5c3FpeGNRQVlpc3U2NUE3Y2ZoZkR5Uk5TcTdy?=
 =?utf-8?B?TE56MUEvbWNVVjFKQ0F4cGVHM1VmOXdkUTFseFU5b3RHZHdNc3Z0QjkvNURQ?=
 =?utf-8?B?QUMyQ2RaYncyWXhpVXBFd0pUOUNCODRpbldCYW5MSWpIV1JrSmQyTXJWWEY1?=
 =?utf-8?B?cFlFUWgwM0h1anNkZlhlNlVtVjRsM21mdC9CU09MZlV2Z3NTSlpEQzk4dlk1?=
 =?utf-8?B?RU5NSlpnam5wRkd2OTloc0RLT256dkhoTlZWQ3JOYUY2cUdHZkdFV2dhaUN6?=
 =?utf-8?B?M3VhUXdLTGNGTHhDNUk4eXY0SU8wN3JWODBSMS9sditROEhBb1VybG1PWEdV?=
 =?utf-8?B?Y2xsTHpyalR4L3pjYS8zVXpzZjR4ZnZWcmpCa1hqeENvM2dsZjJlT1F1REVZ?=
 =?utf-8?B?bVVZZGZ6WVdJQm1JYWgrZnhDa3BGRHNvd3lRWUQzdzZOaTZFc1J1cVdBT1Iz?=
 =?utf-8?B?c3VBMXFMMWpMNGNyNGpEdnBmemtiR2ZnaDF0ZWhHdWZaYzBkaEJyTVVWMWZk?=
 =?utf-8?B?VFFvS1NJYmlYWThYL09zTDlwUjJRemI2T0xWb0ZTVDBNS3N5V1UvTXpzNWlz?=
 =?utf-8?B?bGZhakdMVEEybHlDcGQ1SFpsQmErVUlrc1FiRnBTRDQzQmErVHdEeE5ta3VJ?=
 =?utf-8?B?VmJzTnd6YmFKbEVoMkUyYjFrOTNGVU9aemRUZjRmb29SaEdPZGt3YjdOaGtk?=
 =?utf-8?B?TUlBZ21kRXhuWkhSVzk1ZTJzeTBYVkwyNE5SQjVaSTB4SmtUbzhrc2xielY4?=
 =?utf-8?B?UkxNdjVxNHZNK3RDYXdWRlZNTWRacTdvdS9ZVXhhZmpOeWFrcDNpZUp4MkEv?=
 =?utf-8?B?U3hxVmVEYm9EK3A5VjN3K1RDQnRwWXBxcmh2TGcwcTNlTkhaU3VMQVJNaTBJ?=
 =?utf-8?B?L3V5c1N1UDZHZnNRa0lscEdZaUptSG9YSEdiWit6MWZvSHhyNlVxNkdndlVy?=
 =?utf-8?B?WWVkUEthMm9BOHBEQm5PRlp3NCtIQzRTNnRnYzlGazA5MTFpVDV1SXd4bzMz?=
 =?utf-8?B?cHFyQUY2bEt4eW8rMTNnckhYNlNMS1NGQ2xQc2RtTFlkdU5uc0ZDMUtFMlB0?=
 =?utf-8?B?ZGY0dVN5T2ZOT0MvZk5mQ3RDdk5zcTVOakczZ0kyU05FMDZoRzRGNTNTRUJ3?=
 =?utf-8?B?dlMvVGwxd2lsaFl1dllCYVRsRWE5dTNSTkN4UnBzOXpNM045ZWUzMmF2L2Ux?=
 =?utf-8?B?ZzlTcENQS1REMWsxLzZaaFVzQ1pNOXdtdTNwSUUrdGowdTIzdDYwNXljR1d1?=
 =?utf-8?B?aGRRd3ZhZWgzRkJzdlF5Q0Y0Ujl2SzF5ZUxMcHN6RUNKMVA5K0V4d21WSytD?=
 =?utf-8?B?OEl5VTZYL3lxWnk3YStsWGVwcEZIVjJnVTRtTU01eUhVVVR4blh3KzlJZkZS?=
 =?utf-8?B?YVFjL1NxRmN6Z2RNb0hEMXFYbS9jcE5MTERNK2Jqalo3Z0NuVVRabW9nUDd2?=
 =?utf-8?B?aWUwdGZtTmJFOGM0TG5ReG1sOFBJem1BNlZIVjFzM0grRmhTWlYvMjJ2M0Vy?=
 =?utf-8?B?Ky9URWNMZVhOSVM5bnFTVGRnL3RReU9sclZzV0FEZk8vQUx5OFZaK2lMbUF3?=
 =?utf-8?B?STFLdzlUcUo5L1VQVVR0aW13S2ZSVzVhcXdNVmpUQ1dCckR4MWFmV2xxd3NT?=
 =?utf-8?B?VnpTcS9LR2gxZzZwSmpiSG1wRE0zOE5CQ0YxaEJqb2tpOWcva2tCYmw2eFdQ?=
 =?utf-8?B?Tk8vcU50RDlIbUt3R2JNNEtuQTlsV3JJSEVhWGZZOUp3V0FzSERmMGprS1RG?=
 =?utf-8?Q?xEf6GmChKT8yDs6H7IjnW1vXtA/x4HaYy2TAqzjIUc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:50:46.0530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b9b36f-8698-4cd9-1af2-08de58e35054
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,arm.com,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email,arm.com:dkim,arm.com:mid,collabora.com:email,bootlin.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14D4B56470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Boris,

On 1/9/26 13:08, Boris Brezillon wrote:
> From: Akash Goel <akash.goel@arm.com>
> 
> This implementation is losely based on the MSM shrinker, and it's
> relying on the drm_gpuvm eviction/validation infrastructure.
> 
> Right now we only support swapout/eviction, but we could add an extra
> flag to specify when buffer content doesn't need to be preserved to
> avoid the swapout/swapin dance.
> 
> Locking is a bit of a nightmare, but using _trylock() all the way in
> the reclaim path seems to make lockdep happy. And yes, we might be
> missing opportunities to reclaim when the system is under heavy GPU
> load/heavy memory pressure/heavy GPU VM activity, but that's better
> than no reclaim at all.
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_device.c |  11 +-
>   drivers/gpu/drm/panthor/panthor_device.h |  73 ++++
>   drivers/gpu/drm/panthor/panthor_gem.c    | 427 ++++++++++++++++++++++-
>   drivers/gpu/drm/panthor/panthor_gem.h    |  67 ++++
>   drivers/gpu/drm/panthor/panthor_mmu.c    | 338 +++++++++++++++++-
>   drivers/gpu/drm/panthor/panthor_mmu.h    |   8 +
>   6 files changed, 901 insertions(+), 23 deletions(-)
> 

> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index f35e52b9546a..bc348aa9634e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -14,6 +14,7 @@
>   #include <linux/spinlock.h>
>   
>   #include <drm/drm_device.h>
> +#include <drm/drm_gem.h>
>   #include <drm/drm_mm.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/panthor_drm.h>
> @@ -157,6 +158,78 @@ struct panthor_device {
>   	/** @devfreq: Device frequency scaling management data. */
>   	struct panthor_devfreq *devfreq;
>   
>   
> +static bool is_gpu_mapped(struct panthor_gem_object *bo,
> +			  enum panthor_gem_reclaim_state *state)
> +{
> +	struct drm_gpuvm *vm = NULL;
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +		if (!vm) {
> +			*state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> +			vm = vm_bo->vm;
> +		} else if (vm != vm_bo->vm) {
> +			*state = PANTHOR_GEM_GPU_MAPPED_SHARED;
> +			break;
> +		}
> +	}
> +
> +	return !!vm;
> +}
> +
> +static enum panthor_gem_reclaim_state
> +panthor_gem_evaluate_reclaim_state_locked(struct panthor_gem_object *bo)
> +{
> +	enum panthor_gem_reclaim_state gpu_mapped_state;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +	lockdep_assert_held(&bo->base.gpuva.lock);
> +
> +	/* If pages have not been allocated, there's nothing to reclaim. */
> +	if (!bo->backing.pages)
> +		return PANTHOR_GEM_UNRECLAIMABLE;
> +
> +	/* If memory is pinned, we prevent reclaim. */
> +	if (refcount_read(&bo->backing.pin_count))
> +		return PANTHOR_GEM_UNRECLAIMABLE;
> +
> +	if (is_gpu_mapped(bo, &gpu_mapped_state))
> +		return gpu_mapped_state;
> +
> +	if (refcount_read(&bo->cmap.mmap_count) && bo->backing.pages)
> +		return PANTHOR_GEM_MMAPPED;
> +
> +	return PANTHOR_GEM_UNUSED;
> +}
> +
> +void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
> +					     enum panthor_gem_reclaim_state *old_statep)
> +{
> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> +	enum panthor_gem_reclaim_state old_state = bo->reclaim_state;
> +	enum panthor_gem_reclaim_state new_state;
> +	bool was_gpu_mapped, is_gpu_mapped;
> +
> +	if (old_statep)
> +		*old_statep = old_state;
> +
> +	new_state = panthor_gem_evaluate_reclaim_state_locked(bo);
> +	if (new_state == old_state)
> +		return;
> +
> +	was_gpu_mapped = old_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
> +			 old_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> +	is_gpu_mapped = new_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
> +			new_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> +
> +	if (is_gpu_mapped && !was_gpu_mapped)
> +		ptdev->reclaim.gpu_mapped_count += bo->base.size >> PAGE_SHIFT;
> +	else if (!is_gpu_mapped && was_gpu_mapped)
> +		ptdev->reclaim.gpu_mapped_count -= bo->base.size >> PAGE_SHIFT;
> +
> +	switch (new_state) {
> +	case PANTHOR_GEM_UNUSED:
> +		drm_gem_lru_move_tail(&ptdev->reclaim.unused, &bo->base);
> +		break;
> +	case PANTHOR_GEM_MMAPPED:
> +		drm_gem_lru_move_tail(&ptdev->reclaim.mmapped, &bo->base);
> +		break;
> +	case PANTHOR_GEM_GPU_MAPPED_PRIVATE:
> +		panthor_vm_update_bo_reclaim_lru_locked(bo);
> +		break;
> +	case PANTHOR_GEM_GPU_MAPPED_SHARED:
> +		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
> +		break;
> +	case PANTHOR_GEM_UNRECLAIMABLE:
> +		drm_gem_lru_remove(&bo->base);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	bo->reclaim_state = new_state;
> +}
> +
>   static void
>   panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
>   {
> @@ -153,8 +249,12 @@ static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
>   		return 0;
>   
>   	ret = panthor_gem_backing_get_pages_locked(bo);
> -	if (!ret)
> +	if (!ret) {
>   		refcount_set(&bo->backing.pin_count, 1);
> +		mutex_lock(&bo->base.gpuva.lock);
> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
> +		mutex_unlock(&bo->base.gpuva.lock);
> +	}
>   
>   	return ret;
>   }
> @@ -167,8 +267,12 @@ static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
>   	/* We don't release anything when pin_count drops to zero.
>   	 * Pages stay there until an explicit cleanup is requested.
>   	 */
> -	if (!refcount_dec_not_one(&bo->backing.pin_count))
> +	if (!refcount_dec_not_one(&bo->backing.pin_count)) {
>   		refcount_set(&bo->backing.pin_count, 0);
> +		mutex_lock(&bo->base.gpuva.lock);
> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
> +		mutex_unlock(&bo->base.gpuva.lock);
> +	}
>   }
>   
>   static void
> @@ -531,6 +635,49 @@ void panthor_gem_unpin(struct panthor_gem_object *bo)
>   	dma_resv_unlock(bo->base.resv);
>   }
>   
> +
> +static void panthor_gem_evict_locked(struct panthor_gem_object *bo)
> +{
> +	dma_resv_assert_held(bo->base.resv);
> +	lockdep_assert_held(&bo->base.gpuva.lock);
> +
> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
> +		return;
> +
> +	if (drm_WARN_ON_ONCE(bo->base.dev, refcount_read(&bo->backing.pin_count)))
> +		return;
> +
> +	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
> +		return;
> +
> +	panthor_gem_dev_map_cleanup(bo);
> +	panthor_gem_backing_cleanup(bo);
> +	panthor_gem_update_reclaim_state_locked(bo, NULL);
> +}
> +

> +
> +static bool should_wait(enum panthor_gem_reclaim_state reclaim_state)
> +{
> +	return reclaim_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE ||
> +	       reclaim_state == PANTHOR_GEM_GPU_MAPPED_SHARED;
> +}
> +
> +bool panthor_gem_try_evict(struct drm_gem_object *obj,
> +			   struct ww_acquire_ctx *ticket)
> +{
> +	/*
> +	 * Track last locked entry for unwinding locks in error and
> +	 * success paths
> +	 */
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
> +	enum panthor_gem_reclaim_state old_state;
> +	int ret = 0;
> +
> +	/* To avoid potential lock ordering issue between bo_gpuva and
> +	 * mapping->i_mmap_rwsem, unmap the pages from CPU side before
> +	 * acquring the bo_gpuva lock. As the bo_resv lock is held, CPU
> +	 * page fault handler won't be able to map in the pages whilst
> +	 * eviction is in progress.
> +	 */
> +	drm_vma_node_unmap(&bo->base.vma_node, bo->base.dev->anon_inode->i_mapping);
> +
> +	/* We take this lock when walking the list to prevent
> +	 * insertion/deletion.
> +	 */
> +	/* We can only trylock in that path, because
> +	 * - allocation might happen while some of these locks are held
> +	 * - lock ordering is different in other paths
> +	 *     vm_resv -> bo_resv -> bo_gpuva
> +	 *     vs
> +	 *     bo_resv -> bo_gpuva -> vm_resv
> +	 *
> +	 * If we fail to lock that's fine, we back off and will get
> +	 * back to it later.
> +	 */
> +	if (!mutex_trylock(&bo->base.gpuva.lock))
> +		return false;
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
> +
> +		if (resv == obj->resv)
> +			continue;
> +
> +		if (!dma_resv_trylock(resv)) {
> +			ret = -EDEADLK;
> +			goto out_unlock;
> +		}
> +
> +		last_locked = vm_bo;
> +	}
> +
> +	/* Update the state before trying to evict the buffer, if the state was
> +	 * updated to something that's harder to reclaim (higher value in the
> +	 * enum), skip it (will be processed when the relevant LRU is).
> +	 */
> +	panthor_gem_update_reclaim_state_locked(bo, &old_state);
> +	if (old_state < bo->reclaim_state) {
> +		ret = -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	/* Wait was too long, skip. */
> +	if (should_wait(bo->reclaim_state) &&
> +	    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false, 10) <= 0) {
> +		ret = -ETIMEDOUT;
> +		goto out_unlock;
> +	}
> +
> +	/* Couldn't teardown the GPU mappings? Skip. */
> +	ret = panthor_vm_evict_bo_mappings_locked(bo);
> +	if (ret)
> +		goto out_unlock;
> +
> +	/* If everything went fine, evict the object. */
> +	panthor_gem_evict_locked(bo);
> +
> +out_unlock:
> +	if (last_locked) {
> +		drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +			struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
> +
> +			if (resv == obj->resv)
> +				continue;
> +
> +			dma_resv_unlock(resv);
> +
> +			if (last_locked == vm_bo)
> +				break;
> +		}
> +	}
> +	mutex_unlock(&bo->base.gpuva.lock);
> +
> +	return ret == 0;
> +}


> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3290e0b5facb..ffd821b3be46 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 or MIT
>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>   /* Copyright 2023 Collabora ltd. */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
>   
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_drv.h>
> @@ -131,6 +132,9 @@ struct panthor_vma {
>   	 * Only map related flags are accepted.
>   	 */
>   	u32 flags;
> +
> +	/** @evicted: True if the VMA has been evicted. */
> +	bool evicted;
>   };
>   
>   /**
>   
> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> +	struct panthor_vm *vm = NULL;
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +	lockdep_assert_held(&bo->base.gpuva.lock);
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +		/* We're only supposed to have one vm_bo in the list if we get there. */
> +		drm_WARN_ON(&ptdev->base, vm);
> +		vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +
> +		mutex_lock(&ptdev->reclaim.lock);
> +		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
> +		if (list_empty(&vm->reclaim.lru_node))
> +			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
> +		mutex_unlock(&ptdev->reclaim.lock);
> +	}
> +}
> +
> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +		struct drm_gpuva *va;
> +
> +		if (!mutex_trylock(&vm->op_lock))
> +			return -EDEADLK;
> +
> +		drm_gpuvm_bo_evict(vm_bo, true);
> +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> +
> +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);
> +			panthor_vm_unmap_pages(vm, va->va.addr, va->va.range);

On further testing, I ran into a kernel warning issue.

https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/iommu/io-pgtable-arm.c#L641

https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/gpu/drm/panthor/panthor_mmu.c#L930

Call trace:
  __arm_lpae_unmap+0x570/0x5c8 (P)
  __arm_lpae_unmap+0x144/0x5c8
  __arm_lpae_unmap+0x144/0x5c8
  arm_lpae_unmap_pages+0xe8/0x120
  panthor_vm_unmap_pages+0x1f0/0x3f8 [panthor]
  panthor_vm_evict_bo_mappings_locked+0xf4/0x1d8 [panthor]
  panthor_gem_try_evict+0x190/0x7c8 [panthor]
  drm_gem_lru_scan+0x388/0x698

Following sequence leads to the kernel warnings.

- BO is mapped to GPU and is in GPU_MAPPED_PRIVATE state.

- Shrinker callback gets invoked and that BO is evicted. As a result BO 
is moved to UNRECLAIMABLE state.

- Userspace accesses the evicted BO and panthor_gem_fault() gets the 
backing pages again. BO is moved back to GPU_MAPPED_PRIVATE state (even 
though technically the BO is still in evicted state, both vm_bo->evicted 
and vma->evicted are TRUE.

- Shrinker callback is invoked again and tries to evict the same BO.

- panthor_vm_evict_bo_mappings_locked() calls panthor_vm_unmap_pages() 
and the kernel warnings are emiited as PTEs are already invalid.


Made the following change locally to avoid the warning.

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c 
b/drivers/gpu/drm/panthor/panthor_mmu.c
index ffd821b3be46..e0a1dda1675f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2344,6 +2344,8 @@ int panthor_vm_evict_bo_mappings_locked(struct 
panthor_gem_object *bo)
                 drm_gpuvm_bo_for_each_va(va, vm_bo) {
                         struct panthor_vma *vma = container_of(va, 
struct panthor_vma, base);

+                       if (vma->evicted)
+                               continue;
                         panthor_vm_lock_region(vm, va->va.addr, 
va->va.range);
                         panthor_vm_unmap_pages(vm, va->va.addr, 
va->va.range);
                         panthor_vm_unlock_region(vm);



Do you think we can also update is_gpu_mapped() so that an evicted BO 
moves to MMAPPED state, instead of GPU_MAPPED_PRIVATE state, on CPU 
access ?.

Not sure if the following change makes sense.

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c 
b/drivers/gpu/drm/panthor/panthor_gem.c
index 6e91c5022d0d..8a8411fed195 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -125,6 +125,8 @@ static bool is_gpu_mapped(struct panthor_gem_object *bo,
         struct drm_gpuvm_bo *vm_bo;

         drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
+               if (vm_bo->evicted)
+                       continue;
                 if (!vm) {
                         *state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
                         vm = vm_bo->vm;


Please let me know.


Best regards
Akash




> +			panthor_vm_unlock_region(vm);
> +			vma->evicted = true;
> +		}
> +
> +		mutex_unlock(&vm->op_lock);
> +	}
> +
> +	return 0;
> +}
> +

>   static const struct drm_gpuvm_ops panthor_gpuvm_ops = {
>   	.vm_free = panthor_vm_free,
>   	.vm_bo_free = panthor_vm_bo_free,
>   	.sm_step_map = panthor_gpuva_sm_step_map,
>   	.sm_step_remap = panthor_gpuva_sm_step_remap,
>   	.sm_step_unmap = panthor_gpuva_sm_step_unmap,
> +	.vm_bo_validate = panthor_vm_bo_validate,
>   };
>   
>   /**
> @@ -2473,6 +2702,8 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>   	vm->kernel_auto_va.start = auto_kernel_va_start;
>   	vm->kernel_auto_va.end = vm->kernel_auto_va.start + auto_kernel_va_size - 1;
>   
> +	drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
> +	INIT_LIST_HEAD(&vm->reclaim.lru_node);
>   	INIT_LIST_HEAD(&vm->node);
>   	INIT_LIST_HEAD(&vm->as.lru_node);
>   	vm->as.id = -1;
> @@ -2820,7 +3051,78 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>   	if (ret)
>   		return ret;
>   
> -	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
> +	ret = drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gpuvm_validate(&vm->base, exec);
> +}
> +
> +unsigned long
> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> +			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     bool (*shrink)(struct drm_gem_object *,
> +					    struct ww_acquire_ctx *))
> +{
> +	unsigned long freed = 0;
> +	LIST_HEAD(remaining_vms);
> +	LIST_HEAD(vms);
> +
> +	mutex_lock(&ptdev->reclaim.lock);
> +	list_splice_init(&ptdev->reclaim.vms, &vms);
> +
> +	while (freed < nr_to_scan) {
> +		struct panthor_vm *vm;
> +
> +		vm = list_first_entry_or_null(&vms, typeof(*vm),
> +					      reclaim.lru_node);
> +		if (!vm)
> +			break;
> +
> +		if (!kref_get_unless_zero(&vm->base.kref)) {
> +			list_del_init(&vm->reclaim.lru_node);
> +			continue;
> +		}
> +
> +		mutex_unlock(&ptdev->reclaim.lock);
> +
> +		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
> +					  remaining, shrink, NULL);
> +
> +		mutex_lock(&ptdev->reclaim.lock);
> +
> +		/* If the VM is still in the temporary list, remove it so we
> +		 * can proceed with the next VM.
> +		 */
> +		if (vm->reclaim.lru_node.prev == &vms) {
> +			list_del_init(&vm->reclaim.lru_node);
> +
> +			/* Keep the VM around if there are still things to
> +			 * reclaim, so we can preserve the LRU order when
> +			 * re-inserting in ptdev->reclaim.vms at the end.
> +			 */
> +			if (vm->reclaim.lru.count > 0)
> +				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
> +		}
> +
> +		mutex_unlock(&ptdev->reclaim.lock);
> +
> +		panthor_vm_put(vm);
> +
> +		mutex_lock(&ptdev->reclaim.lock);
> +	}
> +
> +	/* Re-insert VMs with remaining data to reclaim at the beginning of
> +	 * the LRU. Note that any activeness change on the VM that happened
> +	 * while we were reclaiming would have moved the VM out of our
> +	 * temporary [remaining_]vms list, meaning anything we re-insert here
> +	 * preserves the LRU order.
> +	 */
> +	list_splice_tail(&vms, &remaining_vms);
> +	list_splice(&remaining_vms, &ptdev->reclaim.vms);
> +	mutex_unlock(&ptdev->reclaim.lock);
> +
> +	return freed;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 0e268fdfdb2f..3522fbbce369 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 or MIT */
>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>   /* Copyright 2023 Collabora ltd. */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
>   
>   #ifndef __PANTHOR_MMU_H__
>   #define __PANTHOR_MMU_H__
> @@ -46,6 +47,13 @@ struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>   				     u64 kernel_auto_va_start,
>   				     u64 kernel_auto_va_size);
>   
> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo);
> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
> +unsigned long
> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> +			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     bool (*shrink)(struct drm_gem_object *,
> +					    struct ww_acquire_ctx *));
>   int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
>   					struct panthor_vm *vm,
>   					u32 slot_count);
