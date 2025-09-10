Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1356B5191F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928D510E2E4;
	Wed, 10 Sep 2025 14:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k7luECL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ACF10E2E4;
 Wed, 10 Sep 2025 14:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW0Urw4u8bX7YM1msxaw0W/I420GOnkEbkX1a67UNmCWSXJTADXsn9NZXJixgUFH4Xhq0F+pB1GUJf87Q4b7k4Cenan2l6P09/qkA8Gq4bK4CTlu971S0Dw95fqF9J8bk584YfHG+AadfevDpc7BlBEHcKqBYIKj9UkjJFo5AaNbTBdtXzDimq26OGnLVQ1oFHyMRH+23k96ywczlwg4te3JPd4RLUcF77QHj72wD8pQnrMc6EvlptsufiWzsZrCeURfbBP983hN989UES+9w3K4ivmE/19rO8GjfEBia6nyYgh79osMLi/eKABQN8fORT+BHMLqDZiphkYUOXPf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bhoXA2v1k4iWx0tejBpkMKVIB1w1ijU5L4ijtSNOq4=;
 b=tbqzXupPsWOMJVfe++P9TUaZWEVF+dhSlIdsLoOqbQoqkJb4HzqbqROOZBKsYbyzicgu5mAEUL1/Ltw+vVc0PJH/8nvGmC7lEgZPPllh7bcfGZX4Q4USa3tjuLq+N81lKwM1ELFqFWzcu09LoMdeT+yrlcRByNaK2PWqJIuU3Ea08ZZfhz1wEBrUbcgUbU7RA4P1t4DKDWmjkuc0wYMhCBOCmDdmPx0hI9ReO/syL7nOFfvRDP+FnIAQRE4pEvld8o5/XPEZ0M+ArlUEPoGDLaLTuiZVrsaQlss3jjXMDBKFbLGT4q9bmFIz99DTOrr64YBxAd5sEh7Zre/Uqd34cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bhoXA2v1k4iWx0tejBpkMKVIB1w1ijU5L4ijtSNOq4=;
 b=k7luECL5L66O1VcdTRR4a8cVOWH3HmEMeMpLEzUduczmlP19pRyeqS+MktjDJ9ua0kOXsO39XLvSIZ803F1MxfSEtzPoQJ1IccPcLw1DxajDc0ioWJDvXCb087CrIPu6WL68SPNKnMg3e7E7RLAyDfJCkEZHnjwQw5+9wt0EPKU5sNIy+cCZroH7AolO6aV/zGR1jy4jJliJslUsI4kJzy5CBOOFZY2iKta4iN5Z9T2NDZbBPy8xU1SjSpRiMqm39w/72tATndcp8nZlNHsG+wh4Mt6dcO2UzWLSfRkdqjkCu7bypsFBUbX4Ao0NQ6dR8B7aMYqVJm+5B2N+2CwmvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPFD91879A44.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:19:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:19:37 +0000
Message-ID: <3814d6b7-7551-4e8c-b78a-4ac6236eb406@nvidia.com>
Date: Wed, 10 Sep 2025 10:19:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific code
 from register! into new macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
 <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
 <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
 <DCNX57PKVO6C.2MYEGBZ26OQ59@nvidia.com> <20250909185532.GA4167211@joelbox2>
 <DCP5K0R9YB31.2VFUFEFOHV8LR@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DCP5K0R9YB31.2VFUFEFOHV8LR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: 37361a36-1ae5-44c0-c6a3-08ddf07512ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFVTk9jOWhNb2Fsd2lQY3djQUdjVEw1M3B1cDlGRndMblh5d3FyMDVVLzZN?=
 =?utf-8?B?cnpIeWRqU0p2Mi8rOWM1SXVLd3JoUWZBTXVieExHU0pycVpWaUduOEVyMmk0?=
 =?utf-8?B?b3hLSEc5L29DVENScmlKUlc0SXJaMFFSWXBIbXo3Z0k0c0tqWnVWSW54c29h?=
 =?utf-8?B?Y3puZ1E2RkM0VFYvR25lVTZSSndYMGVIVGJ6TWJTMzZ4RDZ1ZUFIUEYvbUJq?=
 =?utf-8?B?RG5JQk9TYUorcStISkJGaEEzNWUwR0VPYytGZXFnQ0ZIT0h3cWk0M3RkZUVQ?=
 =?utf-8?B?RFJpUGM0TW9ya3FCOU5JWGM2Mi9mREROcjJBOXNaSUlSSXRtcllFREd2SWNw?=
 =?utf-8?B?SDFGQ3BTanpWVUJXUkk3YkZaOExnNVJaVytvR1hPa0l2dFNGWFFJMEdpTU4r?=
 =?utf-8?B?T2dtVTRsamxMNzAyaERuVHpNY3hvUlNlTmNrVkRkWkNXck93Y0lHZkN3YTVM?=
 =?utf-8?B?WmgwMksrNkFCaVJ3d3dwVGJuUzN5ZHJEa2x1V2gyNmNMdHhtYVFad1hieXY2?=
 =?utf-8?B?N0R2VzM3eSszOG51ZzBBci9wZXA2aytkZjZDMWlWOTd1L09ReFkycmpESnR3?=
 =?utf-8?B?MkNLS1RrSjJzQU1ibk81OURvbWFPcUZmS0FOR29ud0pxUVpPbHpJT3laRy9q?=
 =?utf-8?B?T0tzc3JMZlgyVWZBV3VkTnRGeGhBWkRuZnFFWS9jUjh2bnVibXBLWGFpekFk?=
 =?utf-8?B?QjlFY2YxdTJIekJvVEcrWC9NYnVvalM3T3FLazBmLzdxbFJWQVpwRTUvUHhX?=
 =?utf-8?B?eXVmV1FJTWZkWGRZbmdFRU1VcDlSUndMNFdhTXdPalNZK080QTFaNHdMeXJS?=
 =?utf-8?B?WFFlOXE1UHo3TkVrWTg1QjJUcC9iRWxiU1h6Y2MrdUgwVUdFL1lObUI3a0Nm?=
 =?utf-8?B?Z3h0NWNTMkcyVnJRb0F1K3pXOVV0S0FXbGdJWjNONnZESlZoRE1ObEI5WVNM?=
 =?utf-8?B?T2d2MjY1dzMwN1UwNHZhVVdmSXVkWW9nd3owbHA2V0RGaGlESjdVQWExQm1a?=
 =?utf-8?B?SWs3bEtGTlQ3VmMxbUgwQmtwWmJFL1JFOG44TlNKcnBLdndkbGRhOUNXVXV1?=
 =?utf-8?B?N0JQSmQxUlIrQmJyWEFVRkhhT0hja0czdW9hN0Z3RHFwTnFnRnI1dE56Tzl6?=
 =?utf-8?B?cWNjNW4vL0p2ZTVMVjFIY1ZydytLYVRwdXpYU1VPYjYwcVVnNHBrUkZDVDhC?=
 =?utf-8?B?KyszTEZzWFZ5N052RDBUMVlRemJLZWtEazZtWmRCeVhmYkRvbHBSWUFKZzJp?=
 =?utf-8?B?aWYwZHZZQjRodElmcUNMWU1kZnlBYnVidWpuU0tlMjJCNGszTllFbktsOU5U?=
 =?utf-8?B?elNhUjNrSWpYdGFvQllZaXNTK3ZCUytaRWZKeEUxYzFZYjhxTTVybXBqVnpx?=
 =?utf-8?B?RDVlam1mQ3J0WUNhQWZGN3NiK2RBMll0bk50OGE0SFZveDhmaFp6VTdOVktn?=
 =?utf-8?B?WTIxVzF3TzdhaGI3YTNiZ1BxQnZqKzRzT09RcUNqMWJzVFBIdXB2cmpIOG1s?=
 =?utf-8?B?YjNVdFdmRGxieWVHdjBWR0lLUDRVdHNqc1BpTWdOWFA0VUdDRGJvRkpHSXR3?=
 =?utf-8?B?Z2czUzdWNmFMTXNlR01oN0M4UHNtV2xIRjVMdGN4SUI5RGxFMHBZVFdvTVBZ?=
 =?utf-8?B?bWdMeWUxQkVCVFBTcnJucEhQM3V6VTZVMys4bWczSXRtcXhQUVRsK013dTlk?=
 =?utf-8?B?UzNHN3pIamNtK3FSMmJ0WUJwTEcvUEQ4bWpaeXVPS1VFb2ZEY3JlWkJBL1ZP?=
 =?utf-8?B?U0Q3Z1hnaWdlQm1MZWh0UUZIVVlpQlpPZmo5MGNGQ2RpbmNNMCtrWTVGRHJS?=
 =?utf-8?B?VmJya3VvTW1zUFdWZW1NL3Uyd0FHMThnV1dnSE1IRXZNZFRBdS90ZDdYcFdi?=
 =?utf-8?B?SUljZFYyNmIxT2g3dEc2ZkJuRytNSEV2MWdRN2xvNGY2V1gxNUk1VnVWbFht?=
 =?utf-8?Q?klX2VjQ/BNg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEsvQVJwWVJLemZpNG5OVnE5UDdybFhkYzJOaElNSmNkTUhTWXlZQ010ZXZF?=
 =?utf-8?B?a1p4Wk5vdzc2NU56WFd4WHlBMXM1Vmt3WGVtMFR0dkYzNWw1OW9KWWRIelBk?=
 =?utf-8?B?QlRSR1J6VnhtamR2cDRBMERBdWNHQVE5ellJbzI0bUlyNW4yS3JtNGk2Z2Fk?=
 =?utf-8?B?VCtHRDZsWFdscTZZR0ZkZE93Um1uS25OOVJOSTU4Z3ZCMTV1Tm5HTTNyQkVO?=
 =?utf-8?B?ZFprMjUwMjBrb0NzaWpSWVZla1E2V3pJc2dwK0s2czUwRlcybnV2L3ZEZUVa?=
 =?utf-8?B?Rmk3MHllTmNDbU96QkRMN3BZN2NDQ2Y2MWVwdW5TeGRhcVpxNDVMSHM1aTEr?=
 =?utf-8?B?RmdZVnBLREhiTys0RHpHZCtFcjE5bHFnQVU1MHpjd3RJRmYzZjQyZHRwWE5H?=
 =?utf-8?B?aWxJdldLRGYyaTdnaWxHejU5d2kwc3BjQkZSRlU1UVV4a2t4VkJOb05FT2Jy?=
 =?utf-8?B?b210YUNkL1ZsYzYxaXBRaEhnbDBiaG91ejQ2ZW1CUGVwNktDMzQxdDJKTU4y?=
 =?utf-8?B?amxUKy9uMEhVcHViaURVQ2VnZ3JxZ25TejIrZHB1anlQcU12cEJMZ3ROVTdo?=
 =?utf-8?B?K2FxdEJmSHZ4azhFUVhWR2c5UkJYelVpWTVaVXRZMEVTcmt1ZDQzZWNyNVFu?=
 =?utf-8?B?STJyYUxRMmQ2clVSV2tXTlRNYkxVWGNLcit6MWtQZllQVStXdy9XOVB2LzZw?=
 =?utf-8?B?S08rNkpjbjRqQjNFZUpqZFQ1amZncmxzT0dZQ1Yvd0dSUEtiaUtGWnlTV3N5?=
 =?utf-8?B?R1B1dWdLdjhubVBpSDJNUmQ1aEx3eGNHL2xzZ2ZmaFlqN3hvNmlXbm1xUk9m?=
 =?utf-8?B?RVBsS2c3ZjFBUnJTdlBCYkkvZmdxdmRsbm84R2liSXA0d1RSZnFlMjVDOFFV?=
 =?utf-8?B?TWREeGJYOXB5TERuRjZmQzZ5M0RJNnpEcU93Z05vamk4MWJMS0VKb1lBRE1x?=
 =?utf-8?B?aEZ4NmZsQWl0S0NrRjFjZ0ZJUGtCanhqb2NiNzY5ZkM2ZDR3Rk5EMDhsRXI3?=
 =?utf-8?B?UUhxdFVpWnQ1UERpM2N2ejUyc2NCWSt1RlY3Ri9zcGdQSHFNZEt4RGprVWh6?=
 =?utf-8?B?eVJtRFBoNVluUlVJN1V3WTVBS2xHTyttckVOQk1ERlF1K3p1QWZBR21ZaTFC?=
 =?utf-8?B?dHJLSXpaVnFFZGZoME9tWDJ6dlBRZnpYd2MwNFVjSTI1YlpoZSt0MFlISWhl?=
 =?utf-8?B?OHRENEtTMFBZSmxiemNlZ0h1MjFlZ2VsTzIrUkRIc1gyaDQyaHcrNUVjMHVk?=
 =?utf-8?B?cFBPNnJYS2Y5TU51WFdySjllYUQ4MXJuTFZlQVJOQ1Vqa3BpN0hRTDMyNlZ0?=
 =?utf-8?B?RCtSVnUrMm5NQ20vdzVRNWlJWTlCTnJ2TTJmRFQyTlRTY2lqRUY0cVpiYUFh?=
 =?utf-8?B?ZjNBY1ZZMWYweUdIT0JlMTh3a2cwc1c0SHMxYU14WlR3Qm1GeEJnWEFtQjJr?=
 =?utf-8?B?dlFQRitXanJ4NFY4UlMvN1VZbk5UU2xNckJteVlPVXpEV25NOHpoVUlQaW41?=
 =?utf-8?B?SDkyRnlyMnY3c2t3QkdoQlVhQm50V1pBRjZkcnFmaW54NXh0bDVqNi9ob2Vi?=
 =?utf-8?B?T1JjT2lZZHVxSmx2Q1Nabk55NWYxN3EvY3ljSUs1eGZhVklFcFAxU3NSR1dk?=
 =?utf-8?B?Z2pTZUpsNEJ6SlhId3hWYWxYSHZwYXI1c1ZFdHhydTNDVVRGUkhLZWh3YkJz?=
 =?utf-8?B?aW9UTVBTY2t0VFgzTEVNZUNvbFI1QnVldmlqd0NxMmhiVkdMeURQcklBNE9l?=
 =?utf-8?B?UFJCMzVvV21kUC9yTHRzUnBqcDNKK1BibGFxVFB0dkMxZW1xSStVQnYrRVV1?=
 =?utf-8?B?djNWdmtRbmFqVC81VFZiK1d5Ri80Z1p2T3VXdzRhZHM4ZGtPb3E3bHhjNytD?=
 =?utf-8?B?am1lTjAwQnB3U0xMTWpkWE0zV0gvN1FILzVoWld2MEdnckUvMys5UG14T1Z3?=
 =?utf-8?B?ZnpNS0s3OWpVUVJBQ3M0R25KS2dqRnFqMHRaQmRtWlF5dHorS2lQR0hoSlJl?=
 =?utf-8?B?N0NpdTd4RjgvcVY4empydzBsNEN2MnE5b2M5NDBqNkwya3pTRllZRUF2czNH?=
 =?utf-8?B?NDBHaElYU1FKRlNEcERnU2Y5bkJwS0FGa3BxWmozT2dOdHE4SFByRGdpWWRQ?=
 =?utf-8?Q?QHKyz93wBfmRs0lvgp/nHDLQw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37361a36-1ae5-44c0-c6a3-08ddf07512ca
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:19:37.6496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSA/VGavYn4h4mTQw6LZXhX0guCbCvsJPQ2Q1lid1vStjNIHfiEURdR3oD+dwb/OyjMno3QYplnfLm66TimoaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44
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



On 9/10/2025 9:25 AM, Alexandre Courbot wrote:
>>> I agree the `: u32` can be introduced later, the original `register!`
>>> macro did not specify any type information so there is indeed no reason
>>> to add it in this patch.
>>>> Yep.
>> When you introduce the types, can you change the syntax from `: u32` to
> `(u32)`? That way the declaration becomes
> 
>     bitfield! {
>         struct ControlReg(u32) {
>             ...
>         }
>     }
> 
> ... which at least looks like a valid declaration for a Rust struct
> that wraps a primitive type. Same for registers, if possible.

Sure, I agree with your suggestion and will make the changes.

thanks,

 - Joel

