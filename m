Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC29BE5436
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070B210EA7F;
	Thu, 16 Oct 2025 19:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CfuNolid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864A610EA7C;
 Thu, 16 Oct 2025 19:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UweNuMN3a6VBjIPAo1fXL8mtcmvpzjJXVQlU1rpkgUXw4ik/7eHhOCDKe0OTrNdVeh9DoXnUHVxvSVoQ34p8ICFKsSAD7Y6L2iRPAo0DeQMfffHDLcNgnEpjUNZoLzLNf5sE9fpxbcxaueJjq5c8vBXKONnF403ii7ltE0ww6PBv5SKXq0T0/t8cvtXunWBvdpRSz3RGk4aHnY5lY2Nx9sin/W1b6nF55WE9pOsz4ioyHHQeG9HH3X9XD9nYIRvZiPC+E7DgS9WjgV6sLbF7B8pGA/0wbLM9oLALoPvrRNTxE+WylKjqvntCA3ie5PYuG0vO1IJymEVho1jaosbXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGdzxu99edu0E6KiLRH4Xdx+giQu5fkkrqB/9+Zz9Hw=;
 b=xfETkQavYUbVsheakgkvWJvg69ycxY7CFFZxv4PNAMQ5WYAn5lWssyi2E5osnH4DMfofDldi9RVZPRJH7EUOmD6zsXpRv5fKGAqZBoy3OfrQd/VkjBPT+ux5XsWB2Vt9e0DAoPGtqdfNEaIc7NVxJiBr0w7kV5HxYcLFjQ2peipxzQLbYrttuxgBT2HYPVJmVZt713RLPU/qWWVqwJHUkYtCvEouCK+b9pwc2/7cVgZeECsOTT5yi3hH0QXqYuSQEja+MWVEQ600D4eDBY0KSuyBvkxKLblkHXYSoWBRclX0Jov+3z1KxUhuKSCoZOpb6+2x1eIrCZvZD0u5Fz9RfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGdzxu99edu0E6KiLRH4Xdx+giQu5fkkrqB/9+Zz9Hw=;
 b=CfuNolidQLadQ7/bRUCBgh1ArEekZ5k0ZTTW0CsnMeRykOvK6CJiNrLiK4oODA8bj80J/NGrVoeJBV3Fqqq1OitMPEiqAqznfqIFuQj6szR0wdAYXrmAqbKAQauar8lwq6H72Iqf5sqNOMDrUrn/jfkx3M5nieu65Vz7HZxtu1SqYWJjmBn0JzmCMybxfZ+8vTBwglTl4MUsWy00uAV3zrphG9zGcToSweEa2lJ74e+CEWpq8Ky4MlMlajgPTXMZHig6OWOaGfCmt+cvVmpDWsX3m3fpD2eUX5YTJH8MgV7Uvd2yDMb/uYGXs3PL1OBI2x87fs8NbRESaEGPTPZ2Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 19:42:08 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 19:42:08 +0000
Message-ID: <a693a561-f0f6-479f-a878-6726c7ca5d88@nvidia.com>
Date: Thu, 16 Oct 2025 12:42:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
To: Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Edwin Peer <epeer@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b8a033-9347-4617-c540-08de0cec1797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlhEWFcxMDFYOW1tbnFpS01oWm9icDlSZDhUSndwTXo1NWRPNVcyMW5ObXB0?=
 =?utf-8?B?dmdVUEV3NXArdWdWaUtiR1VHQkg2L2p4dmt2eFlXNUNtdkMzVVB1VEQ0Y2RF?=
 =?utf-8?B?RVFjRUZ3VzRORlh5SHQxZ3pHQkNYMTBXUG1XVkxYM0tXK1BvTjB0SWg2QWFo?=
 =?utf-8?B?cHpTTXdzZXJaOHJCYklOVFI1a3hvektSbTJKL09mcmplQXp3OGMvbGNEYWRa?=
 =?utf-8?B?M3pjVzZEWm1rOEhZWklsSUgxUDJwZW44SFRndFNuWnBkemhMbGxVSGlFaGNk?=
 =?utf-8?B?Z0h0S3FaSWMyMlc4TEVtREUyelJGL3RqZ0hRRVVWclc2eDhJbm9GWGFrQ0pD?=
 =?utf-8?B?ZnoxWVRWbmZNcE5QRzAvMTVHU1g5c0UyandBcjZOUkQwOUF0djdPTmNGczd2?=
 =?utf-8?B?NFBTdWdpQ2pseENWT2RqUnU2QlZpV1l6bHR6Z3NMUE5wRkcxZ1dGU3lyMDVY?=
 =?utf-8?B?aVRHRk4vcnQzTFpvN25ybDFaWjhTME04dUFHdmVNTUkrbzdrWXZ0c05KMiti?=
 =?utf-8?B?d005M21TSUV4d0FjY0pLZzVtbFQyV04vTjZoQVFmSUdhVVBPWFRzZkh4QWlm?=
 =?utf-8?B?TjIxOXhEV1IxMkY3M2E4Sm9ZcjBmQ1RoUjYxRHJocUIzMm05WlpRNkV0MWhT?=
 =?utf-8?B?V1RiU052dlh6am9zQ2QrTUc3ZjFRa0p1TEZtOU13S29ldjQyVE9laUF3dmx5?=
 =?utf-8?B?WUZqSzN2Rm4wRWlmRkxlOXk3T0ZaVWJIcGw4RzhxODhyUWgzYnhJZnZsOElh?=
 =?utf-8?B?ZEJhYzVUZERqRlZ2NmpzVVRZLzRDMHVLeDFNazdBS2ExZ3dtaGxZYUk2KzA4?=
 =?utf-8?B?RzltREdHWmdYdnhQTEh2eC9WbEhiMHJNMXIyTFlJRGI3N1FKcjNaa0NSaG96?=
 =?utf-8?B?ZGxFT1NKaDg1QXNxejNCYyt2VmZuaGUvTDNrSWZURzY1YVlxOFRpUXBkRHRi?=
 =?utf-8?B?RTh5R2FXQW8wbHFQeHJNMWhHSkZ1ZzBMWWd3RWtsdy9MNGtoWGpsZnZnTUw5?=
 =?utf-8?B?VXZFTytWbzdEeWlJMlBlU0lOZ2pqbFh6VkRFbjdrVnIzRm1BQ0MwTEtTdjRQ?=
 =?utf-8?B?YXRyaU8zbnZETmZHeEE3NUVWMDhzYXdqVFFSU0FqNTg5cmVaVkZNZnBibjd6?=
 =?utf-8?B?K0hoVjArUnFiNnBmZ2JzTlN4TXdWbndRdTNSRENrSFpQN2VhN1U2ZHp5dGgy?=
 =?utf-8?B?VU9hN2dnRkY2RE1HNW9PRDFlUTM3cWJ0MTQza0VXSllNdzNWVk1WL01FY3VO?=
 =?utf-8?B?dUU3eStVbXUxVHNObWM0YjVXRmtKWnQ5bVkwV3p0RmZZT0gwZUl0NkJkTUpV?=
 =?utf-8?B?RGxKRm5nUXM2c2wweDRXUHBpaXBScS9SeGVrN0FjcXRMelA5N1pxZHRTaGdl?=
 =?utf-8?B?emVpYUw5dVR4VlZZbmplQXFMZ29Pbnh2MWJ2WkNTcE5uUmRxUm1uYXdZS3Fa?=
 =?utf-8?B?TnI3RnVPSHB2S3lvYzJvZTVIMnd4SmYrcStNcit2T0tTU3NUWDVmdVhMQjJ2?=
 =?utf-8?B?ODdCYmFLWXJPUkNTNXRiM3BlUmMvbTFKTTl0TUF2ekw4WDhtS0tMWFkyU1Mw?=
 =?utf-8?B?QmZzY1A3bGp6NmZiZEp5WExBNEREc3FFSDIzWFVFcXltTEZOUWRjQ1Y0MHpp?=
 =?utf-8?B?U2QyRTZpakVQY05XUCs3bmRmTjNuNFplQlFpazc0OE5tZzFSRVpIWkxXZXN6?=
 =?utf-8?B?akcrL1U3WWF6SHpoU254aDRJUGtabkcxQVhiUi9xbWxUMll5TEt5TEFaU2hj?=
 =?utf-8?B?UDRRcFFoeERhdExncEVlcFEzNWlEVEMwZE9mNW5CZ0hQVmpHcjRKZXlSNmVk?=
 =?utf-8?B?WkRFVlgxdFpZMStSdThDN0FCSVV4SXQxUVNEaHFKQkhTTTJBRGdRQVBRcDdu?=
 =?utf-8?B?UC9YTTNqcUlidEFEN3BuekRKQnVhQUVycmlUUEd3cWxJT0hGS3BjV1NRaWNS?=
 =?utf-8?Q?422Oz5Fx+N9q8cBaLmRIpRwnmQ1oe/0y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNzTEoySkphNzBRak9La1h1cERuT0hIMzVZdGlwdUFrc0xFVzI0MnFNOGZD?=
 =?utf-8?B?clRwZm9NSllJay9uU0xIZk1tak1HN3E3RnpPdjRrVk9RWUhSeXl5dnNueTRZ?=
 =?utf-8?B?aWNrN3lmM1c0S1FPd1RielM3bGVZbTBtU1UxOGNhZjJObFg2RG9WOHVkUUhv?=
 =?utf-8?B?dVZua2QyT2cybEdYWFkxbFp0WHdSOEJsc25kZ2JRaGo4TUk3d04vaVVySHFv?=
 =?utf-8?B?RmV0ekU2ZFVOQVpWNFNQRkRpZE5rNG9IR280UzZlV2xsMVB5ZFQzWEMyLy9D?=
 =?utf-8?B?dTJiR2NvLzBjbUk1T3E4OFpwU2QrbnE4bzlJM282dFYxc0FTNjN3SVovZnZW?=
 =?utf-8?B?SU1hZW5EUHpMc1YxNm1wRDQzYmg3ZzMycDdpVjQzZ3UwUzJyUjlWQ1RleENw?=
 =?utf-8?B?MTM2bmxFWWtMSUowRHNCR0JmM2FodHNjOXBYZWJzU1k2LzNJeEdWVGxFNVBC?=
 =?utf-8?B?cVR0QlRGdzcvUnVweGs5OWtiay84VWNSdkljNCtvSGNiY0xIV3hXQXk4ZThm?=
 =?utf-8?B?ZXJ4amJXZ3JBTEQzMVNsMzJwRWpOb2EraXhyVHBPOEtteGZNT082Z20zTEJs?=
 =?utf-8?B?N3R2cFBsNmFqZFBPZDBSY2tWeGx0TmJaRVlMaUR1TC8zSWg3STFYWklUZ1p1?=
 =?utf-8?B?N1lpVnY0QnIydjlYdURzOUQvU0ltaDcrNmRJR3FVd2dSN25LcU5MVWRBR1RX?=
 =?utf-8?B?VEJYUFdWWE9xR0ErVTdGRk1hWWF4SWhBRy9OSFNla1V2YmtMTlE0U1l4VTk3?=
 =?utf-8?B?SUY0NENEdVpUSm43UkU4MDM2eXFoKzRFL01uQm0vZjNTVXpjZnFtUzV6WDJF?=
 =?utf-8?B?VE45cFVmTlFGTWJ6eFRPaGpNQjBJRjlFcnR4Ymt2dnlmbTVTMkNnZFREU2V2?=
 =?utf-8?B?aEZUalUxRC9ya0VsZ2JIajZoSUhlQ2FIMFFwVklLZ21uVFI4L2ZzMGx6MHVO?=
 =?utf-8?B?b29KeUFncGcrd0g0SjJ4b3RBSGdoUnZTQVMweUFJdDRmTzVGaVBLd0EyQlcx?=
 =?utf-8?B?Wm1lTWR5Sy9CZXVsN1JjVWNEN0x5Zm5SMWVweWNWcThwN3A0dEM4RmJ2UW0r?=
 =?utf-8?B?U3NPczdWTjJzWnBqMU5DOVhBWGdLU0pKVnpHV2JENXFJTFhzNlJ4aW1sSkdw?=
 =?utf-8?B?a3FTVnZ5dmxLVnhsK2srWndnc0pnckRQTW01L1lHNE9jQU4zdTZwQTlmSk9h?=
 =?utf-8?B?NWxnV0ZVL2p2QlMwMWpjY1ExSHR2TEZUdkJndWVVRUE1dWxMVGFmMWNlYVQy?=
 =?utf-8?B?eTZzNWY2T0YyMy8yMUZDa24wT25Ta0NycTB1K2ZITHBmLzdINE9yeUVBNEtE?=
 =?utf-8?B?WUROQkhEbGpYWm50WElPeXltR3l0cWMzVWlEUjRNTXdnMGhXVVlXY1lVTzdi?=
 =?utf-8?B?aU5ua1M4dkpjM1JPTDhvMXVMSlBPdmJrNHRlTHB6d1NtWlBzSTZKNGtFYUhO?=
 =?utf-8?B?bjM3WlZ6RS9MT29WcjdFc2c2R1NGeVk5TEc1eFVTRUsvazYyVEhERDZLSkRr?=
 =?utf-8?B?KzJDeTFZb0NXNURoNS90YyswRmdHSmlvVitkV2F3bDJEU0dYcVB5c1JmeGN4?=
 =?utf-8?B?ZCtmM0ZNdmJNMXQ4M1k1VXhqNm42OW4rNVkzV2pRWmc3MlBGMTVMT0NuMnN5?=
 =?utf-8?B?bGZ2cUFURCsxcU9SaW5ZSmpvcklwZm1nYUpEYUdyeVRiZHZ2NWhheHphSEth?=
 =?utf-8?B?K1VoUWxzaS80RUZRRTJPeUttRTU4Zkc0OGxtb05tWHhFZ2l1bGxlS3lGTGJI?=
 =?utf-8?B?bUw3cVdHM3FUWDVzMElEd0luelBldzhhbXNyVWkvMHoyL0lGZUhocUs3T3ZV?=
 =?utf-8?B?Zi8vbUlTZEtIdGxuUEtlYUFYTEV4cGlxQ0JzTFJ0UWN0cXF3S1hpZDgrSFlq?=
 =?utf-8?B?ckgzQjAwekVPeTVPQVh5cno1OXZvRzZSd2lBMlJlRFFUU2dRZExlcndhcTJ0?=
 =?utf-8?B?aFk4Uy80Q1ZXVWhOM2taRSsyMVJOdEJQVno3U2NueDN3QWQ5OGJ2TER3YnhE?=
 =?utf-8?B?U1hjV2VRdzVleVl2VGoyVGpmc0xaMnkyVUFRcXEvMTQ1UTFZVEg3N1NoOWZZ?=
 =?utf-8?B?REt6VVlVKzh2S01PRUJ0ZG9RWnJWc0pJMVBLV2s0UVRLZkNJeXpIaFhvdkw0?=
 =?utf-8?Q?Cm3C0HuoXcHqodWD8cxYBZha4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b8a033-9347-4617-c540-08de0cec1797
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:42:08.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /++ndCJCUywl5EHJVkp059zOL9YYW6VqVnjXcx5XsYdB+C3dJFLZzOCiMcj6JxLQSGA+dtUB1TEq8QneRLcxyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
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

On 10/16/25 12:28 PM, Joel Fernandes wrote:
>> On Oct 16, 2025, at 1:48 PM, Yury Norov <yury.norov@gmail.com> wrote:
>> ﻿On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
...
>> Can you please fix line length issues before v8?
>>
>> $ awk '{print length}' drivers/gpu/nova-core/bitfield.rs | sort -rn | uniq -c
>>      1 118
>>      1 116
>>      1 113
>>      1 109
>>      1 105
>>      1 103
> 
> That is intentional. I will look again but long lines can be a matter of style
> and if wrapping effects readability then we do not want to do that. That is

This is true, but let's be very mindful about pushing that *subjective*
readability thing--and strongly prefer Rust's 100 line length convention.

The larger Rust for Linux has been quite diligent about trying to stay
within that length.

In this case, most or even all of these can stay under 100 lines, I suspect.

> why it is a checkpatch warning not an error. We have to look it case by case.
> 


thanks,
-- 
John Hubbard

