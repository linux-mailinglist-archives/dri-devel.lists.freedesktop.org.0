Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D9ADA786
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 07:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F369110E287;
	Mon, 16 Jun 2025 05:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y4oMYXCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DBE10E287;
 Mon, 16 Jun 2025 05:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snMaahRQrEsCoE2RwKKFnNTV0wwCSuhrxnRFvr/Ct6Bn6kDwnid5ZmXG4Ynwllge9P73/EfDo7Twy5eg9msrsfMpqCOblofYKp15vF5HTnVX0kGeMWtsHUw4VqrwhUGiaTy8JIx8fLNiIn0JequK2C4UKhyKplSIZaxeK/dLNeLxz8LHm+s7zMJ92GfMOog6/HH2LSzR9CchYbHGTzoIqD2mIY7IckYTuMl7KAKfhqQjPiLD+AGC3UyhBrlThfvvfez8Sqbg7PYo8u8Q6CJ8+Nv+kcOAeNrJD9MSDEmDOoHLsoYK2EqJ3BVkrZDRPMemFvOBYXAYw/HC6o4QD4ssEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne6bM0o0E5lAhvQhLZf1CGg+xwtBmBBEBVpz+Z+4hg0=;
 b=CTl5aH7DkHWCpVOVU0ub7saVDOaKTyfJodOMDUK8T0VLLMxl1DfaqqLG01L1/bW0TZHl0xVjZZiufFAhGK64keidnlBG73e7/oG2+wyeUv9RODQ6wmKSAFmJNLT6sHUHW8J7H97Zmnh//6LTGURZo1p0qAcmVo30tA41i9gT/cDB+7OsnvJgNkszDQZgel+NVyhZrCnsODu6sKNrOKLGVnqR2H98TdconAnZDB9ml/yFWYL+qWZuCMr6Y2J8zCZcxfRguTQ33NGNef8UkpdO7ggKkLMCoz7aRbREkbe8CTXRKHN8oe2cp0ul/GV0LFURt9xyEmFYf01bw/4Hde+Yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne6bM0o0E5lAhvQhLZf1CGg+xwtBmBBEBVpz+Z+4hg0=;
 b=Y4oMYXCGAeljcR9jK9zTF9lphOYrPvetFFennq5cSNuKcU+V63wS48fXkQZWzONFtLmLotGtVlYLL/y4etmsnrJ9pdfYjZeQzbCc2VjrqoYzzbS25WYhmCknovg/vwNVD9J/aTJfdc36DZGXcBP02KSQkXQHTvhFGoGlFZIPxjY9VzIgOmEFOAwVs4p06kBQfetAaaxfG7tYQRnLdKNXmvnGTk3htPCPtk7OZ/cTb/9ERUeIZb/P9mhU3/nhiycxnwUGtI0eb8Z5/3uXlEmIcjhksJph5YiAyK4kH8Lib3of0cF5PTPWwZYRNOXS4oabvPsB5CLAlVLHOXm9ANVq3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:19:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 05:19:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 14:19:04 +0900
Message-Id: <DANPCSU5A3AU.180DZZ9UXU4TY@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aE2xq_ikyUZ0JwCR@Mac.home>
In-Reply-To: <aE2xq_ikyUZ0JwCR@Mac.home>
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c50aba-34f7-4a62-3f2e-08ddac955166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3JKRDRuZXZ0VlA4Y0xvU0ZDUFltWTJMTlJSYmxVUzlYOThOMjJ6QmZjMHdN?=
 =?utf-8?B?aG1QRm9WRm00cmhXMFRiVEZFd0FQOWtVcytZcUtEdlYzUUc3bHV5Q0dnNG9w?=
 =?utf-8?B?WHVRTVpKZW1MZDNxTk9mR1djeS93ZkVhcVFmV1hsakRJV0ZvdWJ4d3BBRXFC?=
 =?utf-8?B?VzdmOXMrb3lEL2ZHdlJKbEhXa3AwaVYybDcrcFlYQks4N2svKytEdkFicWFT?=
 =?utf-8?B?OUw0YndHbjNoSUR3VS9NV1laRmltL2ZqVEsrSmR0eU5pdXdkZ3hvaUQrTndj?=
 =?utf-8?B?MzhEaXFwTWJqT0NGVkZyNVRlTVBCajI0cm44L3pnOU00aFIwNHpBdjVlYlE1?=
 =?utf-8?B?S2Fhd2MwTGtQeTJONkRGRHBrQ3hpeHNVU3UyRlVVbGpXM0wzR2oyREx2aWhG?=
 =?utf-8?B?eXhLclhDL050ZEgzdTVBU2ExcGJXRmVHU2c3R0VxZmJjU215WTFnMUZGa002?=
 =?utf-8?B?Y2ZDNk54b3ZGbEtHdUp1dHU3bTU5RzdndVF2d21lOUY4T0E1YnVidDJuU09z?=
 =?utf-8?B?YUpRaHE3YUxnK2ZZcHFYdzZZYm1RQzd3TCtjUVhsR1RsRW8yUFh5YlBac1N6?=
 =?utf-8?B?YkRidVlpVXlxRzR0cWE0bmcwdjB0Q1E5VlZWL2o4cXg5cEpHdkhKMjFYUFpz?=
 =?utf-8?B?R09COVNBbER2dTNSclU1dHQydktyQ0ptQjFieVd6Y0ZheHR0ZTdkRGhKQVl0?=
 =?utf-8?B?M1FvUDNyc2paeXpqVno2QUVmRmxteTM2OG01VVdEbHdnek9QV2VBTnFhS2ZO?=
 =?utf-8?B?Q0hTbDJJdk1YaUtyTEpQN3FYS0JGRFl6TnJLMUFOUVJaUG4wc3JKRmxRRUZ3?=
 =?utf-8?B?UlhlMlc5bU15ZlV0TXRZa3pVT2JnWVZMbGlqc29SNEJVVks4WE96TkpxVS9a?=
 =?utf-8?B?NzVNc0tDVVNkNW02NXdYclRKUUszK29JQU1MRGpFeWQ1T3RTZUpvRjVtbTdt?=
 =?utf-8?B?cnk4WUttS3RGREtkb2FMaWQvV3FORWFqZ3dYOGp3WjFBbWF5c2JnR1B0ZjQ0?=
 =?utf-8?B?bUJCM3VHSDdXbjJpcTJKNEFHTHcvSDYxeE5PcUIvdE9Vd1hhNDEwMUlSenlB?=
 =?utf-8?B?SU9IRGRJTDN1RWFXaG5YWCtVV0FCTG5PVG8yS0xTZXhOV3VOVXIvTHNtb1lP?=
 =?utf-8?B?VnRGbGZMSURvdmVCekJ3Q0J4aTJIVWVBUTkydW52RGdWQ3dDeXVtVzlIdjMv?=
 =?utf-8?B?ZGVRUGNxcnZobFRPbjc1U1ErTEZtTEpvMzd3dHZBR1pOMTArUGJSWVEzeDMr?=
 =?utf-8?B?bG5samp3Y0tzWmFRMUpLTjIzYm8rREl4ODNRb083b05WZWprN3N6WWl6RUZK?=
 =?utf-8?B?UUNxU1duNFN6NUthN0ZLZnd6aHVDeUdHZDZ5YTdPd29tU25uckE5MEplNUF2?=
 =?utf-8?B?NHF4VE5Bbk9aVTNvRWZXK3U4QUdzUFpQK09zUjduQmxQU2ZPRGNaZGpFQ0dZ?=
 =?utf-8?B?NGVHRDY5M01sUlRCeHo1eUl4RHFkcExYdFhQakZwMnZ0WVh1Q092clh5dng2?=
 =?utf-8?B?TmJRc3EvWUUwOXAyRStRbVE0RFhhZjdjS2hXTGtCUE9ITmdOTlpic201TG1U?=
 =?utf-8?B?T2l6aU5oYTFITUxqSWpJRVdodjJuUXdUdlZmakhMb2NGQlJzSndremJVTlBv?=
 =?utf-8?B?andtK2hiWlF6bXhZME04ZjJzbkUrNTJwbGhoeEtOdWE4cURFTVZLb2k0NkhF?=
 =?utf-8?B?cS9JNDB4UkJ3SEhuZ0RMZm5lLzBBREVvQTdTeFIrdGI2S1AzMkNwN1dIWHpD?=
 =?utf-8?B?M2hHT2hUSTJJaU9sNXFTU3FnZ0VPbTVNbTFQRWF6eE9rOVVldTFMRW1ER0VN?=
 =?utf-8?B?MW9CeHluTzNGRG9jd2JEUnZ6WEhsSFFZQVM0SVNkdmNDQThQSCtEVmpQVzEy?=
 =?utf-8?B?WFNTM0RiYk1GZXR3azNVbFdHUFJhWlgvcEhzUkpzT2s0SUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTJxdDJYZ3U5VFRXVmtXZEV5N1BEa2duanpUdWNJTXg5S0RqZFIvVUkrUlM2?=
 =?utf-8?B?R3F6MnFSUkdneVBVSmx5NVk2UzVlM3FRS3dhajlWVFpZcmRQUHU1ejhmbGta?=
 =?utf-8?B?OVFwWkdoMnZPWmV4L1lkSWk3QWdkWkhHSi9RUG1zN2hBZTEvd3RQUnJQYW1M?=
 =?utf-8?B?dUZnZ3EwZmVWWDFvYXpQa3ErWHNTZDBXc2MzcnNvNHY3L2I1VXlTbHJST0pT?=
 =?utf-8?B?ZzNrRER0bTY2d2dJQWFqaytBQ3d5UUxPbFpDcVF3bUs0dUNkUncvM2pBSVNW?=
 =?utf-8?B?NGorazNiK0xxS0JDUkgvSFVzWnJ2RGw3bGFPa0huNTBLeWxyVGoxV2ozUURY?=
 =?utf-8?B?Z2YxRkFodFJzaytYWkt6cERjVEtJeXN6RWJBNmdiWDVhYThtSzd3ZXJnL1ps?=
 =?utf-8?B?bTFOd2puVDVGZTVBV1BheXkvb3Y0Y0tuVTFteHpsd2hwT1I4WGdjd0ZQQThV?=
 =?utf-8?B?UGJ5N1VkTnpVNW1KcFl5S0ZIVHk5UStvRCs5ZC8zOVo1ZmtGS1BmblN6QklB?=
 =?utf-8?B?eFFtbmIzOHNQY1dKVDg1dExJVXNuVGhpblNSNTRBUzRDZE1TWUVKZk0wQjFn?=
 =?utf-8?B?MHVzTkZPenB5dXJ0MTZOL0FZYUNMMFJDQnpoQW1PZC8yalNNck5FQUdzcGI5?=
 =?utf-8?B?QzdsVFh3SnhiNDR0d2ZvMGFxS1lUZDBubUwrMUs2WWxKWGNSL3hZU1dLR0pi?=
 =?utf-8?B?aGwxSWpvaDUzY0FqcVlSajh4VVArSmZHalRWczQzV3ZvQTAvcGgzNWhNMktB?=
 =?utf-8?B?ZE03bmI0dmU2b1BMb1dOM0ZVVEVxcWFyMTFRODVSRXFyWTh6cGpBUzBIYTM3?=
 =?utf-8?B?azZpMUtSNDE1QlpFRDhqNEFMaUdFNXpTdlJWZTNLMjBSOHRLYnBka3dhdXBp?=
 =?utf-8?B?c0lYVEJocXZrMU1PYWgwQTVsOTlNcVJUOWluVE9wTllya2R1WW5OTUxuTVdv?=
 =?utf-8?B?ejVGbkFVckp6V04wTHB2VnhBdHdyL3huYml6NkIyR0VxMGRGVDNmSUd6TlZm?=
 =?utf-8?B?SXFzZUxRS01mZ2psY25uUjdMVGt0RTR1MmFGUTNsWkUyZVZtWlI1Nmlzck5o?=
 =?utf-8?B?dWNDdkcvWUdvajFpUCtjbUp0b1JjamVlajVTTUhrUFdmSWVJa0Z6SDNyTWwv?=
 =?utf-8?B?OUtRZm5iUGxIRU5tYzBDa0RMR3NHUDBOM0NGcTNKQkR3RkZrOFp2WmFqb3A5?=
 =?utf-8?B?UmZsZjd4NWZaYkdjZlJOd2N0K2VySXluajlWbVpzVXNBUE5PM2hoNFQ1ZS90?=
 =?utf-8?B?STFPS1ZCZCtaeXRxaVY5Y2UvdFhhUmtnTGJ1RU5wZlR0QXFROFN3WHY0N3hj?=
 =?utf-8?B?WXIrekY4WVAvbENLTWJZUGN5cHF1YXhKRUVrSSsvQnlIaGF6clFYdi9ZZ0NM?=
 =?utf-8?B?alQyRTY2YlFuNFhSdElYVEZmaTlud1ZzQmJUQ0NkWkZtcW9TWXZKRytBWi9N?=
 =?utf-8?B?TzNOb2JGNUl1Z2NLc0tYcGkrOXNlNWQ4NWo5OXE1M1E4M2lic00zMEVzVDJF?=
 =?utf-8?B?WHI4T2tQcUdteUxEcUVJZ291MFc4MGt1RUtmS01aWE5jSGNYL1ZSanJrM0VJ?=
 =?utf-8?B?bEIybzVaU1lrdHB6TkdRMTNQa3Zpdm9jdUZyOG8yVXh1eStQS3VBUm4yVmd3?=
 =?utf-8?B?U2hueklvK3RkTjBZckNkdjBTV2RHY2NjOE1XYVdDWUxtWnp0a0cydS91MzdU?=
 =?utf-8?B?STQreVBLd2ZPVUplS2ljYzl2RXNNYVBUcURtSWR6ZmtwZm5kQVRTOVZzYVBi?=
 =?utf-8?B?N3dYdFpFYlk1enMrVjFCalZSVkZRTEp5M25HRmVZaTBxQmZ2MWFiajl1UXJp?=
 =?utf-8?B?RXBKeU1saXpkcFhNbmp1UUpyVWtTMURtQm1IMExWVXRzUlllNjV5SmNsZEY5?=
 =?utf-8?B?ZVhtcHVXbE1OMnlrTnF0UndmYjFHcjhqSXozQ2g3RlNjSXp0K2hQYVVqdHA5?=
 =?utf-8?B?aCtmbjFFcHBGaFZtcVZlZzlubFg3Wm9SbElidW9tTC9FRGlTYklkZUE2V3lu?=
 =?utf-8?B?bG1aM0hoK01QajRYWDlEd3FDaGRSdlpDYks4Q0VpVCttb2ZtcTBCQmhsa2kw?=
 =?utf-8?B?UjB5TjN5blc3ZC84amZCVzN4b0kwdGlJaXpMK3V3aFhBMGw5UmNlZ2x5WlRo?=
 =?utf-8?B?bFpzL2loUXJ0TzdzUDF6TFpKZmpOazVLbEt1czg3UXNLWGd2ZXhHbGhRMWdE?=
 =?utf-8?Q?4tbT8wQfUFUUMlIeoaLbaeD99kmplTeqmWO76pAu9oSV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c50aba-34f7-4a62-3f2e-08ddac955166
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:19:07.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhJQo9+d5Ooz1iIgmcgXs82mxCcAibsUvQV23kJRMWHk7Iz9LpigIZ6xoLdJ5ryzYjP08Ac/iNg1B/yn/Dno/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
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

On Sun Jun 15, 2025 at 2:31 AM JST, Boqun Feng wrote:
> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> [...]
>> +/// An unsigned integer which is guaranteed to be a power of 2.
>> +#[derive(Debug, Clone, Copy)]
>> +#[repr(transparent)]
>> +pub struct PowerOfTwo<T>(T);
>> +
> [...]
>> +impl<T> Deref for PowerOfTwo<T> {
>
> Why do we need `impl Deref` (and the `impl Borrow` below)? A similar
> concept `NonZero` in std doesn't impl them as well.

I wanted to be exhaustive but you're right, we don't really need these
implementations (especially if `NonZero` doesn't provide them either).

>
>> +    type Target =3D T;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        &self.0
>> +    }
>> +}
>> +
>> +impl<T> PartialEq for PowerOfTwo<T>
>
> Any reason you want to impl these manually instead of deriving? For
> `NonZero`, the std wants to impl these traits only for
> `ZeroablePrimitive` types, but we don't have a similar trait here.

Deriving works perfectly well! :) Thanks for pointing this out.
