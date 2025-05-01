Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C90AA5EC9
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E410E829;
	Thu,  1 May 2025 12:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UGXeqyVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A310E832;
 Thu,  1 May 2025 12:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+6EOqLtzUyrQrFGQlrWqmPWifp2SA2nwbPZMstBgbrL/yck252MC1OYxYDGT7BP9sPwgFNVefF5ILexXqtPlnIG7a7L5+uyfufwKXNywOk7X+e6vj/+2xVcZCQAEi28oqsbl5gbfIl2D9F+Fz4SY35ustnmUHYcpRKPPtPbUcVQhzENcDQ3DmUm65rc+WXxrQ8IFVy/r+z9KNaIQdXzOoHeZh/xJLD97RO2NE2gM8O/rxzUn+S+jO/+PvLgc+QydXa0oOYEcn5XfCLBkl2KtgylED671bzyQzEoseVTmU/zashIoG++pVtj1FAsWNUxuOG4b/JNcLZpiU03gxGdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTKQ3Tw/GvUp2njQoANzEl7piIv3ULv6Kyssd5HU2UA=;
 b=k4jcj7vGNijcUGPTfwVnWIV7OzPAj8ZOTFLbSmmhnNTm1UfJEESSaNuUGV6FCpwKx+P+hkentCsIPCQk1jdDj+3YG3wairHTwGHi5i0ftYf+jcF0u669a7/MPzLhN2PBegMV2xkNE2h3ylDIyfidUcTeO4mOkAU/YJ1/QGDdukktkVEiQSgDfqKGu9YgQZjyiSgteBR4/WvrdzudnE9ME8CI6SQiWMwAsvKcbxfwWnuDAbfMHCq2dzOHZAL5zQiaNn6+SDa6dU1qipp+YZwsKJ5FFGi3o0LxxCBhaXBWERKVdn/rbiSob5ESebZkRTHa0jtDp/Urk7sLMzGZIRqeoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTKQ3Tw/GvUp2njQoANzEl7piIv3ULv6Kyssd5HU2UA=;
 b=UGXeqyVz83VvrYJwceC6lTP5Z94Sf4s/LPC8vPeUvT87vCQfavHQW4hwkyAEVc20+Igwr0phSzOH5+W+FSyIEUXEC80wh8/V8pkXbMwKt6tIhwYwvLwX1pcD/YFnfRJyXXw0muCq0jFnl5YiJEISC/dbO4SZaq6hLpSdx6E/AUmRbE08qsEh2dznlfCR+miChhx0eS+qEZWJnwlkSD/faScu0XORNeegWJ2hnYV/lrH89sBPQlsSR85860vkVrppd9DHfKjun+8hBM4X8iHJYFnvn4BLhmRuVsbFNC30TqIxK3uAX0MslavvtY4e8kM2cDkBDq8NqIlfn3jo2w9JkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:30 +0900
Subject: [PATCH v2 12/21] gpu: nova-core: add DMA object struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-12-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 48af6b99-6ebc-4d9b-0b75-08dd88b001b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDdGSVluNHVZRS9lNXdMT1l4S3poREVXZW93ZWZnTm9UM0NQT1N4SXJHRHNy?=
 =?utf-8?B?NmZTYkJFZGNzMi9KbEtrS1hCTUsyYXMwNkZNbTZUdXVrTk1IMkxZYWhjRk1y?=
 =?utf-8?B?S2QySEw1ZXdCWm5QOTA0Ti90S1orQnV5R3REOHFtTXYzMUxFQmpjV0VEYXNy?=
 =?utf-8?B?VEl1d0ZCQ0lEMEpUdXpxanQ2NlVPTjhiQkR1NHBNNzB5MENuR24xZGJ3d1Bl?=
 =?utf-8?B?WnlCUzFNYStmRnM2dlZWczJ0RXF6SXluU0o0RTFHMmdUaG1nRE1JVUtkZXBW?=
 =?utf-8?B?WjhmRFEvaFkxU3hDRENDaVduT00zc1hZS3FSdk92SXRGalNaeFFPMlZvejhn?=
 =?utf-8?B?VHU0K3hWQ05BSEFmTXNiTUNBaVN6aTdENVpxOUdZYlhkcVVLRGRuaW54T3lK?=
 =?utf-8?B?bVVsWFowdUM0ZTVJYmcwS3AybTF1YnBiMWFZaUtPMzhheU9GRzVkSkJQVjR4?=
 =?utf-8?B?U3hTdVhteDdsSnJVdnQwRDVBTzUzWHVRZnZPZnpNLzZ2UnZhMnRMTHFaNmh6?=
 =?utf-8?B?dDJ5dkdNWkFUSk53SnByblIvQTlFSk1OTnQ4aUM1aU82Rk1pZThYMHEzamtj?=
 =?utf-8?B?dGtnaklQcjFQOHFucmk0bEZYb1lYbGJCbmR6TGxRWWFqWlBsRjhzb2lhd21R?=
 =?utf-8?B?UjVjb243VVpHM0p6TkQ5ai9NZ3VwcUN6cCsxbFphUGQ4T0ZaWkNDRnhiZmtS?=
 =?utf-8?B?YzZQWGZLK0YxcFBVbmJlcjhxZk90VTR3RHlva3ZibjNyRWpydXZkVEFpbGJI?=
 =?utf-8?B?cnV3ZnZBQ2pET1FBZnBqRC8wOGxMaE0rZE45ZGlxeTYyTXltOVBnNE9la2d3?=
 =?utf-8?B?UldiVWNENWRVNXRPN1V3SkJCUWpVMnhFdzd3QjhCc2NWeHdtRG15dmo2WXVh?=
 =?utf-8?B?ckVDZ2NkOEpRYmxVUi9MM2VSZGtvOGpXeTVLNm91dUo5YVlyYmNTL1Jvdmxo?=
 =?utf-8?B?L01kYVMxcnBIZE9BVDZsQWRkQmwvV2pDNzE1aVlVWnlVc3FkVmdiS2tZU1Ey?=
 =?utf-8?B?YmlLdWwrekhrVzAvbitCWTU3ZjE4S3RIQnVhLzlwZ2U5K1FES0Q2U0o3NjQx?=
 =?utf-8?B?cmFMVWhoMlE1dnlWdmVhUjVQdWpQZlhNUHk1ZFkveW5HMDlsMjl4OWt2N3NJ?=
 =?utf-8?B?dVZDL1ltdk1QYjEvU3VRSnB2Mkk1V1FIS3FVS3NjeklZRFNkbjh3bmRJMmlD?=
 =?utf-8?B?eDhJcjJYUHRpQVprWTRBMEF6UUVodHdFM0M4ZUFvNUU3OFhFRmRqNzF5aXFm?=
 =?utf-8?B?eE1oV3NrWHRNNUZFb1RndGFjU29oSGNJMklKbCtDMjJhUWpEMlY4TXptZXRR?=
 =?utf-8?B?Z1dsOTdMbzVtK1JPR1dTemR5aDVnTDBwRUJSZTc1VWtaendLdFlYL1BJS21D?=
 =?utf-8?B?dlFSeHlLZU0rRS95TnhFKzJISW5TRXlEc05CSkxDbE8ydUxJZ2xNU1VZQy9n?=
 =?utf-8?B?ZGQ5UDNraklsdGI3dFBQdnVNb2NUNmplKzBsbXk2aTA4a0FKWGErSFVMM3Q4?=
 =?utf-8?B?VXl4elN4bUxUSTkrUU54UTUyR1hiRzdSMmlZR2hPUGZBcjJMMUVrS0ZOZE1K?=
 =?utf-8?B?aDBvWjgxdTZ5Nm9ia1BCN2Nmc2xYbEJFb1JldUZhVFZzazdPdGlDbzlPQW9Y?=
 =?utf-8?B?ZStvQTRQd1BhWVROUy9ZUklLN09KQzJMdnAwUXRnQ2lVVlZrdmUvSFJ6M2sw?=
 =?utf-8?B?OU9Kai9JY3BwM3RNdXFLSnk2bU5xNGN4Z3FMRENDenBSdjVJdkpjcmJGcE82?=
 =?utf-8?B?NTV1bTZTUzZ4MFAwaVRQYWdYZDltYlRYMkFVSnFMc3U5VHhFbHRxRjI0SjZj?=
 =?utf-8?B?Q3orT09MNTUrN3M2ZFZBVTNnUHJkNzJDWEpzNmpvUjk4Y29TK1JLZ2ZnYmsw?=
 =?utf-8?B?NjZzZ3hHNlEzV05DVktvSGczNTVnYzBFK2FodlNDQndtTlMrSUt0RU5tSFVT?=
 =?utf-8?B?QWNxRnF1VitJWEtTampEc2ROZlpUV25SSEZ4ekJtcllTbE1xSk1zemZuQ2pK?=
 =?utf-8?B?amE1MHUwWTVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZ3YUJNSHJiZDFzWU5mUVUzNDArcFh1SXNsa3VDL05PYXpMRDR2WVRHM2ov?=
 =?utf-8?B?MVhHL0pub1NDcUJDZkl3T2ZraEhGQy93ek1wNUppV0lBQTdaaXRPejVyTDRq?=
 =?utf-8?B?QVlNRmZ3TkM0cXFFSmJPNGpET2xCSUJpL2kwa1grUnh4Zm9GbXBjVm9PQnFD?=
 =?utf-8?B?TWRxY2d4a0lqNE1DcG83OFRGS1o2NFJSOUNibVdWMzdiUE1jZnV1YVAvVitH?=
 =?utf-8?B?TXhxQUtheGNLMkw1bEw2aHJ1RHltZzlEOHJaR2hFbGVLZHV3VVp4VFFmRWw5?=
 =?utf-8?B?eTNQMUx5d25zdlNKTkFDV1NFbzNJQzlXNit0dUk1c1NUeWwvRi9STnNUdS9o?=
 =?utf-8?B?alZFK0c5RmJDbFFuMWswNWVtYWhGQjNCcm5pNGUzN3U3VnJGUHRrQXlwSnNH?=
 =?utf-8?B?ZGFjSCtyN3A0Y2VyVFNJYlQrMGJqblVrTXJwZHo5bXdDT2Frc3FKSXIwSkdQ?=
 =?utf-8?B?UWdPUnRzMXNpaWFEYW1ORmpjWWJXc3NGUUNWOWVwYTRxV2tSMVEzVlhKRk9a?=
 =?utf-8?B?WkdoQnV2UCt3VkJYVU1xd2YvZVBuNEIvUWJVWE9TWFVtY2pmUWE0MGZZVDgw?=
 =?utf-8?B?WThhWldLUXRrLzM0cTdIMk5YUzRPY2hHQk4rYnA0Nm9NdDd3S3dsWC9iaHJL?=
 =?utf-8?B?Q3JBVERqUnliRCtmd1lmRm5jMVk4eGhNQ3g0NDJ4ajhNYUVzYTRBQ3RHK1px?=
 =?utf-8?B?OHIzbE1NZExCaVRnZnZMaTNwcnZVRU43WTlPSDRYM3NLTXJuRHpQL0VBQk9t?=
 =?utf-8?B?RjNUUU5rVEpGNDV5dFF2amxhSjdjVUJ5RkFQNzdDbTcvUC9NbHl3NFVPOFBh?=
 =?utf-8?B?cUxiRVNkakpPNks5SlUvbTJkQzllY01hT2g0T1k2Rklsd3ZIVTBDRGwyV01u?=
 =?utf-8?B?NW5TVDh3V3FKY2M1UTYvU0YwelVsczhhVkp5NS9wVVJHSzBvZjBIQnh3V3pO?=
 =?utf-8?B?alk3SXJGTnFNUmJyVllwSnRvYXhabm5LOXozNTNyTElTeGdXc3FhdEZYNEVL?=
 =?utf-8?B?M3BsRWduNGtuNCs1SjhUVFNkT3VQOVdUMUZqeDZRbVZ0dXZRYUxMQkxESXZJ?=
 =?utf-8?B?UTh5TjZtbVNWU1MrUDR5YmRURzlxay9pY3pCWTJ3K2MyL2ZPMnQ1WEJMN3pz?=
 =?utf-8?B?dnViWnNZbVdxWXhrREtuMWZsR1VCTVZJNG4wZmxrUXJvcnRzMzJoOEVTYUtj?=
 =?utf-8?B?eDZPZmlpaHVMKzRlaGNRUGN0aVNFamVWVFkxTTRaWGNpSk1EZ2xjaktvTWtz?=
 =?utf-8?B?b3ZWYTZ1SmVlL2xwd2gzOW1BaFdoMjRveDRrNVhDQ1NOcjdJdlZETUlmSjc4?=
 =?utf-8?B?Smt0dkJldjVEZmFxdXhJMVF2VzZGL2s2TjlrVUEzUFZ6b1ZDSE5YQVRmSGsw?=
 =?utf-8?B?cG14cXBrRWp1bDc0R1VyV0ZRY0ZUTDR5alVxalByekw4YmFScytaSk9WMU1M?=
 =?utf-8?B?K0plTFZaV0hHTUhOSEs1M1prNlR2ckc5eVZCWDhESUlkRnJ3aXpCcDRHa2hl?=
 =?utf-8?B?Y0FSSFR5NmpLUTg3NzNkU1NXbUNRUE1BNWF6QlZON1p3cWtLZ2I3alVVMEhj?=
 =?utf-8?B?QmtValFMWEhXZG4wUVBCdGlaNi94RDBGMFp5ajRVT293TW01bVE2YXdVaGgz?=
 =?utf-8?B?aDViM29IcVAxVVdKcklQYWRudlRQdklOLy9CNzQ2NmNCN3hpa1hndlg0MXFP?=
 =?utf-8?B?NEhHcDhXRHA5VGhvSHN2VlhkcXBEbnU2amZRT3AybFlkbGVCWVVuTzg1dXVa?=
 =?utf-8?B?eGs4MC8wUndZbkk0OFpxUjh3MTRmVW1mSVVIM29RYWhXOWZ4UEpDK1JUZ3RR?=
 =?utf-8?B?UnJaZjczWnoxNkcrMzNpU0Z2cGNSR0FPaXZoT2R1MURMbGRCbnM1NjFZNkJL?=
 =?utf-8?B?NjQ4Tm1YM2MvajdWWTVZV29KVHJhY1czYXFuWGZST1JaL0gwVG9XT3V1TG9s?=
 =?utf-8?B?TjlIS3dINFhvSzlGYmpNV1hEWFdxZjdyVTNZNTJKWXhlWkh3QUFqejhhR2RN?=
 =?utf-8?B?OWhvekVoRzJhTVZPMHlLMFh0TURlZXNobFhYTnhmOU40Vjg0NEFHMXAzb2ln?=
 =?utf-8?B?dFNnNVVBeHNUSm9jRnRIajVmWnQ4cll2M3dZUWU4QXJ1YTVBa0M4U0kvMFlh?=
 =?utf-8?B?b1hCeUlaSWp6Z29tR1EwUHozUitHd1g4YXJBT29qMzYyRWFDeFZUVnNSb0to?=
 =?utf-8?Q?h/Rjf7CTSfl+9UOtR12ToU7S4D1bweYj/rM7EGKpIcCH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48af6b99-6ebc-4d9b-0b75-08dd88b001b3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:28.2019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIscfEcc2Lur52swXmG0kLbZMAZBu/BEgdzJe2D8JJBroPVy0dSFX33aml/FGHBq2C1FOTE24H6j0vyxXkzfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Since we will need to allocate lots of distinct memory chunks to be
shared between GPU and CPU, introduce a type dedicated to that. It is a
light wrapper around CoherentAllocation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 60 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9d90ae01d0044eaab4ddbc3eba216741d7a623ef
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::{Deref, DerefMut};
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    dma: CoherentAllocation<u8>,
+}
+
+impl DmaObject {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma })
+    }
+
+    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        Self::new(dev, data.len()).map(|mut dma_obj| {
+            // SAFETY:
+            // - The copied data fits within the size of the allocated object.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+
+            dma_obj
+        })
+    }
+}
+
+impl Deref for DmaObject {
+    type Target = CoherentAllocation<u8>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.dma
+    }
+}
+
+impl DerefMut for DmaObject {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.dma
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 878161e060f54da7738c656f6098936a62dcaa93..37c7eb0ea7a926bee4e3c661028847291bf07fa2 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -21,6 +21,7 @@ macro_rules! with_bar {
 }
 
 mod devinit;
+mod dma;
 mod driver;
 mod firmware;
 mod gpu;

-- 
2.49.0

