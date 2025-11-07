Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264BC41FEF
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E33D10E12A;
	Fri,  7 Nov 2025 23:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bwAN8iUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A6910E12E;
 Fri,  7 Nov 2025 23:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWSmANO2pQhVTZp5td8YvBOXOK/MSakO2BjflS6ST2BMmsKajSHEXbfbxQC2XDkc/4NHdpbsHOUr3px0yLpFXYUfuKS3R1ApjSxeeYbMMmoBD2KNgGpzM0vUrQg5L9bvgx24/Mw4eXquL5GgGUEWoNXWSHGFJ6APssXamlyflJgndzPv/M7/Wc+sYHdzBPIz0HezhopP8a+AuFuL7U6obvkkQqYuUUBX4BS+iyPJQ99NoRtBm0CzoPJuNmAqO87Dq5VynWyEi3Fs21GvuFd32KrbdSNM/Q5r859zRUHwQ0Il+uG+6btWj1QFRIAQvZjB20NOueOfTcXTDFkT4RDWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEYxAyWeZY1qqItUhZseYaW445Rp0NagWVYug8NToRI=;
 b=esQoCPgUI06Kqch5PDskFH/aK3sgk0nTD3BIyFqT7EZtUikj6RCdCLBJrWh9wp7QJbNnYFWLiXnxbynpL2SLPG3zsENnb5ZHbXnwf+exazHBm1Myz+4wNt4xx+E6KrKL3GjTJHy1MsgHSO7voEfMCMU2f8aoftP+KHWwlxzGQequKt9BK1hhu6QcQuBgk7KY52qcLHB1358DnGz1L+rGvWng4tD2dAcnTjn5nPuI3q6Z7XkivF4kCXDkqv4VfVptPHZC1rHKEhyOoLJwqCSNhtG3CopmQ7jnwHQOf2RaxjkxZ7zLYO8mExpv6BV5tX5QACRT/wnORKouKFnNWjVOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEYxAyWeZY1qqItUhZseYaW445Rp0NagWVYug8NToRI=;
 b=bwAN8iUX1+5Lu2sKLs+LTnO8lNLflX3HesXOF7l8NkBkHWTTkLKgjAP6Eq6nI3PNvg4MCR8F2wpzfGWp4U58L4iRiy5Ls8C4s+R/naTf1E3xCzcM42B1jph0HRRgY6sBon33/kIJ/uL7NYZgIZbUhZJ8ZlPokWWrV1pFbDjPzxcwJ6ebRx3+WE7c1f++TFLEDEOsFeMCxrCOznm0hmdaeMGkqc+AiV6Nnp2WRUQSpFPVLAMhPQeNfzxnbkT1RqF18WmDR1gmqGkdWifTAMoobd+DO0chMd6NnU0hOFPUQw+xaYXQzFxmxZyK54UBahG6jhw+Kc/LswQOiTGx22RuPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:03 +0900
Subject: [PATCH v8 02/16] gpu: nova-core: Set correct DMA mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-2-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9dfcb0-b7b0-4d50-43d5-08de1e5771dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkxtRkhTNnJHMUpEdHo1T1JKdm9OMytESEsrRGExTCtvclZ4MXVFOXZDRGEz?=
 =?utf-8?B?Ykd5SG9PWkU4NGVwUGorWnZDUDYxMnJTUHB2K1M4SDBzcTVtY3RWTzdENXZk?=
 =?utf-8?B?amk0VlUrZUFpWXc2cmJpV1FHTnAvbkl3Y28zclNraE50K25vTUIvdklCZkxH?=
 =?utf-8?B?VE96Mld2RHg5bkwybWJrSEpxcGtOTlljZUNuZW5VUTZ3VEE4RHJMc2xJQ0Nj?=
 =?utf-8?B?bWNBZjRTSW9GdExLeSsxbk5kZWFxMWp5WkZCSzVMRmxhSlBIWFNUczFZWDRS?=
 =?utf-8?B?eDh1VmJJR2hlM2hITmdvbklmcEFyME5FWUdnQ1dBSzRsR1AzaDU4Z0dlZFJ0?=
 =?utf-8?B?REdCM1FWNHQ2R01WVkM3Sk5Pb1U2cUIvUThGdnI3U2ZUSklEM0tOS0h1UE92?=
 =?utf-8?B?MGJKOTdOUEVQYW5BQW5tRTlHZllPOTBXWnAxWDk0a1hHYlBZd3pGUGwrUXVn?=
 =?utf-8?B?ZnRpQVAvWmZycTRvYmpLTDVDbjNhb2FFcEpFb2FXanFNcW9ScE1jU3AxT1R3?=
 =?utf-8?B?bDMweUUwWEJEZFBITEJzWGkyaFZwWVFHZ01kWFhJa0RlSlBJSmRZaDd4RWVM?=
 =?utf-8?B?UE5ZNERJWW56UCsraSt0TjFNRkUxeTJQL3pPU0N5Z0NwYkJ1KzZBSVYzTUZj?=
 =?utf-8?B?MW1GQWZLdWJUWld0dEJMRS84TVRPaG5ScUZLN3RJWlhianBTMm5xeVJKYi8v?=
 =?utf-8?B?dVpsaW1BTE5zMVYvdHFuYVlpMDNyMS9EQmNMWm4xdXJkamNTRXhqQVI2S3Ix?=
 =?utf-8?B?bGZJTmZDR0lnb2puOG1uc1RCVjlLbTM2L2d6ZGxRbnJWOXlGT0tXTno1L2Ra?=
 =?utf-8?B?RGJsd2xENWZNamVBbXhHWXZxKzNaM3VuSGN6dFlaTWlmRXZHc05uVlp2Smk0?=
 =?utf-8?B?ZmZTa1dYOVppc3pRWThTUzAxWjVma0gwQ3N4WkVaSHV4Z3BIYjkvOFh1d0pC?=
 =?utf-8?B?akdIV01FQ1U2VVhXaGxkWUJDQWRpV0k0Zm9iVVZwUURFdmRUTWFJbFM5MjZF?=
 =?utf-8?B?WEFjdXVaWVlHaXZCbUE2S0tzRmZxZGhJSkFnWHoweXIzZGtJZDRzU2RENnI2?=
 =?utf-8?B?NkF2YUVGNnpweGpORFZoa0pEbCsxMit1Z3EyRTZQNTh1MW10SU5lREFtMjBS?=
 =?utf-8?B?QmpNVFBnVUIraitLWUM1TGV2bnhmNGRlL0ZQNTU0TC9nTUFLS3k2VjNaOTlu?=
 =?utf-8?B?OWdnQ1NFTFBnTzNnZHlWd0hrN0pmU3hST0xlR1l0UUsvdkZqY0JCaE9jMkwx?=
 =?utf-8?B?bGtXUkpocm4wK1FNbE81RlJpZ3VvMG8xQ0dBMFVMa203ZDRMY0FWcjl2b2xi?=
 =?utf-8?B?aEljM3N6NS9Ob2luNlppUTZjY1pSdndZZys1QnZVNVYwQldZY3lzQzlHaWNm?=
 =?utf-8?B?bVpVcVJaZ1pIME5lVG1QYWdPdEF0SFVPUnVtbUp2SEM2cmFtY0FuQXZiR3Fr?=
 =?utf-8?B?NWkzSnlua0lWL3FPVVVwSGJDdzdXZ1pmN2wwOEh6TUV3dUZKTVBWUjZpSVVa?=
 =?utf-8?B?NGsrZ1BWY250R2JzOUxvRjd6Sy92UTU2WWxhbWNxN21Gdkp2K3B1NHRKSlI1?=
 =?utf-8?B?aWJPT1BVK3p0MlA0YUZSMUhQYnUwNG42Tms4cTNuRXZuRThxYjFyNjdWbXVR?=
 =?utf-8?B?ZFVQQVV6ZGJUK1loNG42Y1NyOVJndkl2Vk1BYkY3T3VOdUF0UUR4K3M3dC82?=
 =?utf-8?B?UFRueXFrcitSQjlWOUdOUXd2VkJsMXlpWERsOHRmcjRqaS9mcVcyd3hYZGZF?=
 =?utf-8?B?UW9IZDh1SWd4QWNjTGJsa20wM3EwNXlBaVdJck8vVVRJb0l4dVdNVWNhNG80?=
 =?utf-8?B?STUrd3ltcXZsdVppc1VRV1crd3VNaWZ1eEQ1SVVaUzZBME10eklCUmRHSWJ1?=
 =?utf-8?B?bDFzWEZ1bXdCT1EvMUt1ZmZMM0tLNjdCM1FZeU01VkFnUC84RGcwdWJjUTlI?=
 =?utf-8?B?b0ZOSzk4eFJDVDNzUEEwRG1QaHFtTHBOU1c0UG0xc0V4Q0ZwRnMrb3J5NUM0?=
 =?utf-8?Q?O1gDuqmqabflW0RicS2BCDMRhBSxjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRvQjRqNXNxSWVNR1VYZHd4NFk2R3lPVTZXQXBQUkxjVVhFSmVIVlYwTURG?=
 =?utf-8?B?aTB3c1pjSk5BWURQS2pBZ2REUTVkUFllZ0tlaGp3NDBxT1dUdngrQ3VaMEtF?=
 =?utf-8?B?ZXB6d3hHMEZQMm1WRnE0cWxPUmw3eDJOSjY5SmZkYUFXY1FIelBndWtDNkRk?=
 =?utf-8?B?aFVPell1NmM4cEJ1RWk2STNQWVM0WlRYTW8rMm9CY3NaWlhBTDRyMkUrNCs5?=
 =?utf-8?B?WUVaeFR0NlpUT290VFdlRTgxRkFBWkkvR1JyeE84RUt0NzR4em9nL2pzM3B1?=
 =?utf-8?B?VFZXeWNBY0I3U3J3VlQ1eGhlYjEwdlVWVm8wVjdlbys0RmRYZ1hqNWZRTFNV?=
 =?utf-8?B?UUxwVHVDRUJqVGlBQzJtRWY3dVRJM0h5OWhNWmhlemZmZmh2UXRUYWw1K3dz?=
 =?utf-8?B?YjZWRkpOL1ZaK204bDBkaDdvOUlUN25CQW5EQUdZakVtSCtsK0dlT25iUTdj?=
 =?utf-8?B?anVhYWNyZlkyK0M5b2RtS3JYREQwK2U3N3VwdkpENUU0K0trOU5QMU1QeWRv?=
 =?utf-8?B?bGorbFoxU3NqcDVmWmFscTFlVFFYTWJ4dlBSak0yTUQ1RmcxM21hMnpCT2FZ?=
 =?utf-8?B?TGlZTU1ORkdnUGFUZllOMENJbS9XRFRQbWJVcnVreWhRYU5VMkJwUnZWSnJy?=
 =?utf-8?B?ajlwQ2NhbVdzbU01aVdBUmlnZm5hdGpDOCtBZ3lHTUR5LzdKVGdHTkMxV2Nu?=
 =?utf-8?B?ZjFpMDFQNUM1a09wRVlzUktoWHlrM201VjJOYWlzMklmMG90ZjMxeFVtUi96?=
 =?utf-8?B?bVdXUlQ4d1dNZURMRVJSUFlWZEs4a0hqak43c09xcWltcWIyR1ZlK2o3ZXRI?=
 =?utf-8?B?NUxJUnBZY0hzMlM2YUxhcE8yaHBPaURydU1LRHA1c3FsT1pGb0VmSDhVbGRv?=
 =?utf-8?B?ektJOER1Yk9jeGJmdkgybHNoWmVrSXRUcUo5YW16dFE5SVFLSElWRlkyTGNY?=
 =?utf-8?B?aG41SnB0eFB3dFdJQW1Eay9iMEhNMzg0NkhtWmFEbXcrMjlnYzBHekljR2Vt?=
 =?utf-8?B?dGJsMSs4WFJzYlBXMTY4SzU2bzYrU2xKYzc0YVdMQytXQWJOZVlQYWlOcVJY?=
 =?utf-8?B?VnkrQVE3cWt3aUEycEFyNE5uU1o3SEkzWmQ0dXM2cEJ0RzdJS3pvSERkNXJk?=
 =?utf-8?B?cW5XVzhtTXdMYTVUa1BlYVlEbHRWd2w2VXcxYTlDQzZnS1ZxYXdoNHcvQ21q?=
 =?utf-8?B?SndJdVRTWWJrRStOejZjRGF4TVlBMDcyendqV2RiNUVnYWQrTkZmZndSSTgz?=
 =?utf-8?B?azExMzFCd3BKRjEwUGxscHFQWnZmWlBtajdpVy9oZEFwMHFvcUdOVkdYOVZW?=
 =?utf-8?B?RXRKenBHaXUxWDV3aEhXMzJacG05aE9hRHNiNnhycXh4Q0tZRTdkOHJId3Ni?=
 =?utf-8?B?a0dnN3hJL0MwNnNocWQwbERKUE1JWm96VEw3U3NpSHBJbys2bXVaZHdPWGVD?=
 =?utf-8?B?RDA3RStDZEZ0ak42WGdHY1oraTNyeXJWaHhzOFlSY3d4bXo5VEZ4MS9ybUpS?=
 =?utf-8?B?dGdDVW1adlpPQjdIdmlUQi9Zay82bGprODVtaWdRcTQxT1FRbE45M1ZNWlht?=
 =?utf-8?B?ZFlIZVVhNXhON2FBSWZucEFydlJBRWtwYzQ3NERDZ1NYdkkrMzl5a3B3VFFR?=
 =?utf-8?B?bkVRdnRwMmZqWUlVOWJNQzg2RXA3UmRRcDhndnl2Y1JYN1ZJdllHb1prbDIr?=
 =?utf-8?B?WEtUbDJMcHRnSnB0RDJGdG1YQWp3Uk4vM3dDVDRZc1ptN1VVYm11aUs3Slo4?=
 =?utf-8?B?V2lvU1ZsN3hHc0IxbGhxVjdLanNISlRkOWt0bGdWcHlGUHRrZTNlU09HWGdO?=
 =?utf-8?B?Q04vWnZjMnFRNlBRbnBBZW0zT3ByandFWHplSVR0d1R0d2J4Qm9yUXV4K3Nv?=
 =?utf-8?B?TVZZOWJXUDBQeHQraTB4MnhmdzhNb0ZKY0Riak1MUUcrSTJPOTNRUFFhRDc3?=
 =?utf-8?B?SzVNWnQybnk3a3dUOG5hRmEzLy96bEdjN1pJUGUwVTdJQmkrNDh4MTEyZHpW?=
 =?utf-8?B?TE45Umc1NzN3NmNLZUlRQWkrSHRnMXVPODBSeExtdHlHem5YckFYVW1WZWs4?=
 =?utf-8?B?dFN6VkJhOTc3REtVMERTQk1PTDdzOVZZbUMxNEVWR0tTQjBCbnRyVUw3YnFh?=
 =?utf-8?B?bWg4c25UNWUxQkFQRGRyQklTdW4wTWxTenM4RXRCSFBmZ1NDQnJzSlZpblBB?=
 =?utf-8?Q?9iUKR3/90F/aFlfMGYhgHz2J1HBr+GfL37FpbikwPUb3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9dfcb0-b7b0-4d50-43d5-08de1e5771dd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:25.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBO0QBRYeciLmWunbIo5SNv4lhmEMpWfDezf+he5SE5QWtumB4JDDoNvaHRdoGjUFP+NuMYCyO9hxpan8SoYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Alistair Popple <apopple@nvidia.com>

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 2509f75eccb9..d91bbc50cde7 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -4,6 +4,8 @@
     auxiliary,
     c_str,
     device::Core,
+    dma::Device,
+    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -25,6 +27,15 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+
+// For now we only support Ampere which can use up to 47-bit DMA addresses.
+//
+// TODO: Add an abstraction for this to support newer GPUs which may support
+// larger DMA addresses. Limiting these GPUs to smaller address widths won't
+// have any adverse affects, unless installed on systems which require larger
+// DMA addresses. These systems should be quite rare.
+const GPU_DMA_BITS: u32 = 47;
+
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -62,6 +73,11 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,

-- 
2.51.2

