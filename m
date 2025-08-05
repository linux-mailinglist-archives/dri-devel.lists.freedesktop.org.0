Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F6B1B1C8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E532D10E636;
	Tue,  5 Aug 2025 10:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bVS3lkS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CAA10E00D;
 Tue,  5 Aug 2025 10:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw8AwhsQuuSjgXW/88RigwsW1mGY+q3d8HW1guR4KllrO0J3goGNAHvVKMGG467tLRt5e+AE3wRHNNDOqv+nZISCSXBZM2NttYSn0VkWDPXOD51RrUFUmZt3d7zsfTORSbhmJzDyNrRAjzJdhVyYmeyZ6yrhrAFkQbpGuDRmw17bUZptl/2lT+YAWjN6jQp4w8quxf7pwnWPlbIsIPgyP0tN+ZIL0mXvApF6pRKLIhSO10Xo+J5sWmsHoKJLDeZcjOV95zrUdqFZrpMA4vIEZh9MKNKCEh64hGP+5QM2JlNIAyQvcN9f/E+kImcHl+VjOE2P1wPaM6ABatog1ykw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coAcsydaM6XL1EevNgJrQFXlAi8rNtANfsU+MuhazDM=;
 b=gaI1bUaXx80s/9mMlvzsw8DS+vwfqjpoZaDTjZkfQ0uNAJGd29Chjlc8/IEi6ceZ7B+HS+t9NKO33xZ5T222jxJFGWMV1hk7dF21kDAOZD3QVVq5DNCZAbkpWHD5xjYE/FefuULVp1aXKNekaJEpL7lsIxPkAdbPXouOaLLKchfLw0ZqzJAa9QoQG//S2QuuT/V3v9D8cJ5d6/TBYYRqa++sf21BHmrUaojQUegy00kltRBaDbFW7FlOZsK1C0JDjf0osxlc8dmWnPT9gZlxNRiX/COlb9+KtoupU4Yu62teuF2KW7WG6VY48jckowU6h1EU747mAxGFFiI+RL2QJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coAcsydaM6XL1EevNgJrQFXlAi8rNtANfsU+MuhazDM=;
 b=bVS3lkS0DmjCSApoxW1KuUqzgb6MuacEP1JZ0tv9VPB/2vr7rbPB5zD1wyoC4cRO4rWfV2c1owvcN/MFkr3vmBl/xjxEOS56P9aA5EZMqTdt1MXgYe+U7wOXULPD/WHGvvSq6x/SCuIZbsFB+5beEDVyYBmld/GYEIMI84gHqMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF5C5D42165.namprd12.prod.outlook.com (2603:10b6:f:fc00::64f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Tue, 5 Aug
 2025 10:16:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 10:16:20 +0000
Message-ID: <4c7ab068-ec38-432f-81c7-860792408e62@amd.com>
Date: Tue, 5 Aug 2025 12:16:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>, Leo Li <sunpeng.li@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Brian Geffon <bgeffon@google.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Garrick Evans <garrick@google.com>,
 stable@vger.kernel.org
References: <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
 <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
 <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
 <eff0ef03-d054-487e-b3bf-96bf394a3bf5@amd.com>
 <CADnq5_NvPsxmm8j0URD_B8a5gg9NQNX8VY0d93AqUDis46cdXA@mail.gmail.com>
 <aH90O93xJhD8PXWL@quatroqueijos.cascardo.eti.br>
 <c4f9dbe8-d224-478f-a91f-03a420333fde@amd.com>
 <CADnq5_PFLuoe2fqn1YL984YPy2FU8SdJ0yWS5nmKFfsNwc324Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PFLuoe2fqn1YL984YPy2FU8SdJ0yWS5nmKFfsNwc324Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0450.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF5C5D42165:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fbe19d-5c36-4383-88fd-08ddd4091f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkFVTXR5RnBCcWtuRHUrMTlsdk13OGxadmlIdXJpTElvWm1YYUhBNGs5Smth?=
 =?utf-8?B?cytmNExQSXFIUE5GRndGSTZ5Mjg4N0IrYWVIWVhPQlBwc1N2YW50UnEvQzk4?=
 =?utf-8?B?bnRnQ2tXczUyR050RWpIajU3Vmt5YjRVNFlFK3IxNkRPOURudUZpb21sSjZ0?=
 =?utf-8?B?dnRtL0JBWWptK3NvMm5meDZueUxQQ0F0cElqaVlZYUtUVUNqNThUa3FTUUtn?=
 =?utf-8?B?cEVCUVhvOStITjhlZExuUWxwYnphN0hSdnZ3QU0wSUNuVjNoN1A2WkkxVGRR?=
 =?utf-8?B?WCtEOUVhbFJUNVZTei9IMURxNEVYbkY0Ukl6c1paaUZzYkVNRzJpOStUcy9F?=
 =?utf-8?B?K0JvZTJsb1VDU1Y3WlpvWjY0VkY4azIyQ3ZRNU1NQzhjSDhvcU5zeWVMaGQ5?=
 =?utf-8?B?ODZTcU8rT1QyaWRoQ0JSZWFNenZQMndRbDJkejNrUzhDc3pDN21CbHBDY0NR?=
 =?utf-8?B?ZHRlK1dnZ1RPRG10eGd1dnhCcnBQU3ROV1BCWlNwN1pMQlFKWTBZK0tGWVVx?=
 =?utf-8?B?OG9mTHlFSy9uODBVWkRVRkdaL2l5bFJ5Y0NrRFVMQzRkMjh1TUJWN2FHakxT?=
 =?utf-8?B?OUNvSmFlSWNNL0JTdnZ2MVpGWkNTc0J0T0c0NFd6RjQza0RHcDdsak1rNHZM?=
 =?utf-8?B?NFdPWnhxdUxxZmZiank5QkI0QldkZmF6ZkQwQmRoUDZ3c0ZPVDQ5UHo0a2U4?=
 =?utf-8?B?bkNPbi9xS2QrUWxhU2RpRTJKcnJhUGNvMThkR3NHZXRPaitJTkl1a1QwMzU5?=
 =?utf-8?B?ajlZQkNsUTcwb2tLMkxPSWI1VWpOMWxJUkdiRTB2T1BIcjhON3JmdVhTT001?=
 =?utf-8?B?Y29YenhZRlNHVDRXcFZvOHN6YlljcnNQc04zcEN2dTVQRWIybDR3N0YvcU5x?=
 =?utf-8?B?YnhjVnpIS3VFZEFaSXBMWVJ0aFU2NnBPYVJWaU5JTTVWdUxJRWJHeVI0dXR4?=
 =?utf-8?B?Rm4xVlFkVUVNWnJNcE91bHJQdGQ2L3hNZVIzeVJJTEQ0akRjY0NpVll1V1RS?=
 =?utf-8?B?YTVXaHU3eGo2VFRyWmJMS2JSY21uNEx2NFZVdFpCRDhHTDg4ZkJIRUxKZzZm?=
 =?utf-8?B?c29ZTEEzSU9qbjdYU2kycGpnL3Z3ZDFYdE8va0crczBxYllVcEVtVXVaZk5W?=
 =?utf-8?B?RzVjZnEzTWpQL3dVZlRZaDRFTXJIbzBpdEFVMENrREprMDZFQjNzZmVzS0I5?=
 =?utf-8?B?cm5qaVBnU3lMZ3BuRkdQbStkc09wd0JqTUIwZjFVc1N3RjJiMUJ6YjYyWC83?=
 =?utf-8?B?NVRtZ2dtMjYxQUViODVhZjNnbGd4dmFWZTVlb21jTmY4eld6d29wc0VmRnBV?=
 =?utf-8?B?N1J6Wi9DRFIyNVRaeGtVeFp4VUZNbjhNR0VLd21YZXZibjVVZDBjWGlEMmM1?=
 =?utf-8?B?dmRCdDVIZGp2SkxBRnNVUjNYTE0vcWJadXIyenQxTkY5Z1pDK2hHZ200ZFFq?=
 =?utf-8?B?T2NLQnJlNG40VWFVWTBXQ1dJMDNKSmRaUFZINm1LTHJJN2REazVvRkQyWW1o?=
 =?utf-8?B?VmhPV2pTeFo1ejcrVytKQndGQkZxbGpHVUJ1dlc5WDVCYWdUSzVxQndialI2?=
 =?utf-8?B?bUo4azU5Lzd6UkZRVnYwelVsa3VUN3BYOHphU1NKTTlyaWgzclBLQ2dkWTNl?=
 =?utf-8?B?dWNIUENZbEF3cW1pYkVFY2lTb09IeTcxQU9xTE9WbWVmaWorbWE5Q3B0MldU?=
 =?utf-8?B?V2ZISWtYQUNLWG1tdlF2bXVIUkJ2dDVoaGlvVmtjRXlMdDE3aWt0MlFzcHBN?=
 =?utf-8?B?eDRySWpUd0IrQ0FLZG9oanpiK0ZFRW1yUzlHWk4wdnlkQlc2ZkRINm1aNXI3?=
 =?utf-8?B?Ukk4NXJRN1ZQQWJoWlNrNXZSQUc0UnpjZVpndElyb0ljN1lGRzhkbm5URWNI?=
 =?utf-8?B?MzBTNkhjbm1ObFF2WWEvdUIxQ0prcGJzRlBRRys1N296c2Q5SEsvMGdLZk5K?=
 =?utf-8?Q?LvK/MQE8wUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJuL0ZmV2xrRGhEZDV4WGFxQW52Z2ZOSi8yRmZJRTdrUGJlMWhLNFpuZ0I1?=
 =?utf-8?B?eG5uRWpab3ZsbGxraVpCTjhnbDduYUxKbDFxUWI4UHFlbXpOY0J1QnFldEJ5?=
 =?utf-8?B?Y2dxYklCR1NKNGZoZk9rOUNJVTZMOGZuemlraGVwQUNoVFQvSW1jRTFGdjNS?=
 =?utf-8?B?OTNnU0gzSWR2cWxnNkRGdHo4YW52STh0TXBKeWh5dDNlQXRtYllGZXZBTWda?=
 =?utf-8?B?WXdOekNsYVMwRHNyYkMyaHlLbktpSzVVeitHN3g4ZnNnV2Y1N1A3RnIzaXN3?=
 =?utf-8?B?dlR6akR1dmNMRVMrd2hjTDVDWTkzM2d6cXNRckd3NklUYjZ6QVRoU240TE9S?=
 =?utf-8?B?bXlaaUd5NTVrdFJ0UHdxTnI1WURucTVFU0tsRHptQkJiU2NwVEVPdEw2TWlC?=
 =?utf-8?B?YVJqb3NZRVE1YW5lczJZMFF1cGQvUjlmSmYwTDUwOGpIcXBaY3NpNnlOc3VU?=
 =?utf-8?B?aHdHQlFkelNKSEFCcFNDNXd3NlFDWThub3RrQmpQRW1uYVBFVEVITG91OUN3?=
 =?utf-8?B?YlRvUVZxK1hkM3BMcWdrTHdjbDFhTFhORFVMUHY4bnAvcVVzYTRwSzU3cVZk?=
 =?utf-8?B?N0tMRGZUTmY5Z3p4WXh0MTNFeDJtWHJyZkFURkdBbXQvQXN0ODJPQ0JudU41?=
 =?utf-8?B?Vm56UU9zaTA0ZUtNYktGRHd3MkJGN04rT1FDVjIvak5xcGU2alNhK1dISTBQ?=
 =?utf-8?B?UkRyeFhLTWlkbHJYOXNhTVRSTm10VkxqYXdKZVdEcmc3UmQ4WEtmYWxTMUlv?=
 =?utf-8?B?VG9UMURaYTAzNS9EV202Zlk5WFhtZ3FUWWFsVHUwT1g2UWlHZnRRSkVCakk0?=
 =?utf-8?B?M3Bod3JHVk9KaDZITEs4RDMzZm1GZEcwTUdyem1DaUtIbmdKd0g2TklmbXcx?=
 =?utf-8?B?R1pMZDl3bVdSSkFKMko5MG9aVVpwTWVmOW1ZMU8yZEhadUlyQ0RiNmJuWjVj?=
 =?utf-8?B?VllWTGs1U3NOeDQ3Z1JGajhXek1UUmRzTFp0RmIwNGV6NnBPVDdPMUlBbWtx?=
 =?utf-8?B?VVJtSEt6M2VvK0pRR2l5WDBrYllHYUlQdDF5emhFS1FTL2ZLZldtOW9jRVhE?=
 =?utf-8?B?aTlLZUhPVGd0aWwva3UvZ0h1T1pmeFVkbGwwbDIvY1o5LzJxY3J2N0ZHSDc2?=
 =?utf-8?B?UWNhK1luR0pHVDR0czRETGRTaGpiTlROOVBJZURXSUltVTJrR09SRng1enpC?=
 =?utf-8?B?ZWJ6dXNrRWRHc1VvbDNrUzJsRXZ0TzZFcEFnQ0p2SnUzWjl2aVlYRXd3NTFD?=
 =?utf-8?B?YnJtN2svaDFjOGk5YUJJWXc5MEZEb1F4ZFhrM0c0WUk1OGVpY1JMb0thUWJI?=
 =?utf-8?B?NnpoNk01bkJGeGU4MjVpRzJneDhDUFh4UGtTdjV1UkhFYzRiSlpVSWdvSG01?=
 =?utf-8?B?OXNIN1R5VnVlMnRTei9qZS9pRFlvdlJ1ZE5QTEhSNWsybC9IVFBac1hHOTNl?=
 =?utf-8?B?S3RuZmh4OFQ4dW4zWkZrUUU1MUlGV1RTVkVmc0VZSWFCclNDQ3JXMlA5WVhQ?=
 =?utf-8?B?blFDeGNxNWdJNkdoVEJ6cVE0cGF2eTNtV1dueGF6Y3RNQUwxSEJZMlowVnpl?=
 =?utf-8?B?cmxBSnpDMDlZcGdxUEFtbzVkK2psTTBJcjVodTZWOXNUUDNReWxXZ2JRUVZa?=
 =?utf-8?B?Z1RUSythQjkxNGpQUUZTZFZ6TWcwVW5tc3E3SWZnUzVsTldSR3Q2WEpFeFo3?=
 =?utf-8?B?eVorY0VtNmFwTllOalpsblhGSjJNSE1UckpGRm5adEdFNU5rd25WWitsSE1D?=
 =?utf-8?B?UlFsVnhOcTZoRElLVWlIanBsN2ZYWDN2cG85c3JrOTEvcWkxM2Fla1lIWlNI?=
 =?utf-8?B?T2ZsNGRJMG96eVhXN3cyei8wOXhzMVZ3amZ4ZVQvS0VaSWM3WkM3M2pjelpV?=
 =?utf-8?B?UE9jNlhEYnExTFQwRmFQN3pGODNtRU1yWWszMWR1UEkzSW1qZU1GY1FHdnM4?=
 =?utf-8?B?eEtiakNpQzUzb0RXRGdjV3BjenBiZlJsUnBCS1JJYU1uODlyWFBnN0RVSEtP?=
 =?utf-8?B?RXM1eGFvbWJ5VnhuZXMwRTRFUnVsTk5lbUIzWFZ0YWdXaGNPU29rTW5mYngy?=
 =?utf-8?B?cUl5VStCWk1SV29ZbmRQN0p3eVdETnE1UHR6ZFBqTnRTNGVQdkdUTVpoUzNj?=
 =?utf-8?Q?k95zpTuLssqmXeoarRGaNHKkp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fbe19d-5c36-4383-88fd-08ddd4091f1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 10:16:20.0452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd/xSKmL4o043b772bdEcTTEw3QPBLZVfteqGj6sqZnUbMGZunSQ9HhpdlzoHWsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5C5D42165
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

On 28.07.25 18:38, Alex Deucher wrote:
>>>> Anyway, back to your suggestion, I think we can probably drop the
>>>> checks as you should always get a compatible memory buffer due to
>>>> amdgpu_bo_get_preferred_domain(). Pinning should fail if we can't pin
>>>> in the required domain.  amdgpu_display_supported_domains() will
>>>> ensure you always get VRAM or GTT or VRAM | GTT depending on what the
>>>> chip supports.  Then amdgpu_bo_get_preferred_domain() will either
>>>> leave that as is, or force VRAM or GTT for the STONEY/CARRIZO case.
>>>> On the off chance we do get incompatible memory, something like the
>>>> attached patch should do the trick.
>>
>> Thanks for the patch, this makes sense to me.
>>
>> Somewhat unrelated: I wonder if setting AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS is necessary before
>> bo_pin(). FWIU from chatting with our DCN experts, DCN doesn't really care if the fb is
>> contiguous or not.
> 
> Is this a APU statement or dGPU statement?  At least on older dGPUs,
> they required contiguous VRAM.  This may not be an issue on newer
> chips with DCHUB. At the moment, we use the FB aperture to access VRAM
> directly in the kernel driver, so we do not set up page tables for
> VRAM.  We'd need to do that to support linear mappings of
> non-contiguous VRAM buffers in the kernel driver.  We do support it on
> some MI chips, so it's doable, but it adds overhead.
> 
>>
>> Which begs the question -- what exactly does AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS mean? From git
>> history, it seems setting this flag doesn't necessarily move the bo to be congiguous. But
>> rather:
>>
>>     When we set AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS
>>     - This means contiguous is not mandatory.
>>     - we will try to allocate the contiguous buffer. Say if the
>>       allocation fails, we fallback to allocate the individual pages.
>>
>> https://github.com/torvalds/linux/commit/e362b7c8f8c7af00d06f0ab609629101aebae993
>>
>> Does that mean -- if the buffer is already in the required domain -- that bo_pin() will also
>> attempt to make it contiguous? Or will it just pin it from being moved and leave it at that?
>>
> 
> It means that the VRAM backing for the buffer will be physically contiguous.
> 
>> I guess in any case, it sounds like VRAM_CONTIGUOUS is not necessary for DCN scanout.
>> I can give dropping it a spin and see if IGT complains.
> 
> That won't work unless we change how we manage VRAM in vmid0.  Right
> now we use the FB aperture to directly access it, if we wanted to use
> non-contiguous pages, we'd need to use page tables for VRAM as well.

Yeah, that isn't easily doable. We looked into that when on first HW generation with DCHUB.

In the end it was more trouble managing the page tables for VRAM than allocating VRAM contiguously.

Regards,
Christian.

> 
> Alex
