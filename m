Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1487BAD72EB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC410E843;
	Thu, 12 Jun 2025 14:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MarPtXVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48910E4B2;
 Thu, 12 Jun 2025 14:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keQAVo/cjR0epRzqI8ryd94FQHcalvDljgToEPqpUwOBA5HevnTCiJjM2wUNHiMwN6ZpGLNgP9Kr6VPehU0SfTAg6kkciED8X9WqQMqJ9/qI50fWyNAYt4c3MJ6/noSCWeN0sfknvyTfoo8poLn2WemT6bJ8vw8yDQulPKB8i/TJUfSklh9+U2t6+U/QTMrtGdEIE4JtigjvVXe6WEpUQN6TgH7SDCina2U0daJLYHwr0DDZxwA1oH/aE4+ofEgmyhXwioPTywVai79XFQ4mEo0KnMGm9zZZBO2ua7ISw90/Bicsme2jO3Fm/Tpernn7sP6Zv+yn1DqYHtTSt5TOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYXnhfm1bTAAMuQvKzuE4galbVbVZYJjQ8/euoWbGmA=;
 b=VpSKzQwpC7ZQbPle/TKUquDEak+2P79/V6atK/T0D65VCh0bWxOiXLucnL7KYOQrQoSWxYu/G5vzLJPf8U2EGwmJMC0iRURqQ2jjF0uhSH8F3Lm9Zj80H0PoPLl+/h+PJBTtZt8uPjHad+yrar5+H+4Rt9bYODq2h8uPWcRLk1m0qqEv5CQgqCFt2OcogRxCbEEOX/pSoUmau+YUsf1IoUNo6zYd7XHDV8tlZHIXXnr0hFYrnshcHC+qUE5omkSmrB6vJaCjb/AD7OCkaRW777v/gvOcoF0wKKJLeFnTvHnlQSRUr5wrTgsHrBlYz97pq/nXLl/0SBB6Tp+NtaOHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYXnhfm1bTAAMuQvKzuE4galbVbVZYJjQ8/euoWbGmA=;
 b=MarPtXVRNO7R1/2I5LMreIWXckvlyAtENqojVipuz4ZXz5GAPtSGzlxwNURgRZZC0L59hnH8NubECsG6ARYSOf1LE8yekzT6/UmXtW+KeWhTDCAMGPYlakmApF1BU2J1O3T2z2DIyv8fszIp6hhJ4G/f+pj8+VR60UiE93jtXnLmkis0Ak5nFwojqSVQKNMo3hNv2UD1A0QxpJHMMy8uPrKs0v2kOtZMf2dJCU6J3NXPBvvOQ32ca2dH0u6ydPhI6ysxSrS/nnQ9uatyfQ1DC6/qj2zBrkFvoxowvk5pSqkmIHvbJIrazqNPqErCvDaSG3BkHnAp1OLc07cDKw1zCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 00/23] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Date: Thu, 12 Jun 2025 23:01:28 +0900
Message-Id: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjdSmgC/2XPTQ4CIQwF4KsY1mKggARX3sO4YKAoC2cURqKZz
 N3Fn0SMy9f0e00nkjFFzGSzmEjCEnMc+hrUckHc0fYHpNHXTICBYpJr2g/F0pDGTM0aAxhjOwR
 H6v45YYi3V9du/84JL9daOX6Hx5jHId1f9wp/Tj/VwJrqwimj6Dx3zoIwa7HtS/TRrtxwIs+aA
 l+qGG8pVNpJy4XmWgmh/6hoaftQEZUG1zHQ0mgl/R+VDYWfq7JSpnzwMggjtfmh8zw/AOzgku9
 pAQAA
X-Change-ID: 20250417-nova-frts-96ef299abe2c
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Benno Lossin <lossin@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:2::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ee3ff5-750d-467c-e990-08dda9b9c425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dit6WmczOVNxcU1GZWo2WEs3U1hiV0JBekVGUlhGUEFNWU1Yc1RYUFUza3FJ?=
 =?utf-8?B?T2w0eHRmNGkwZmFieWpKeXk5U1dObnQydndYUTdWM3pWMVorY0lrS3p0SC9Y?=
 =?utf-8?B?YVB1ZXJOdyt0LzB5ektyNkFtYW8wK0xVZ3VtRFZkczBuZ0VyRHhmR28wZFlH?=
 =?utf-8?B?ODZNUW9XUmpyLy9LTDRSNnY0SXREQ3NRSW4yeityNk1yWjZVYk5uYnM4NjZp?=
 =?utf-8?B?VlpGVGI4bkFTTS9oK2ZuWTFhV09BR0JLQk9PSFFJT2dzcjdZTC9qdFNxL3Jh?=
 =?utf-8?B?SWhTYzNRVFl3czJyc1dPQktoM1czM2JuOWNpeUFTYVNFOFU0QitkbnEzRkow?=
 =?utf-8?B?akk0aHRzMkl2czNILzJocTluK0lLL1owSnBDMEY0SDRSWG5OTlpzR3o0VU42?=
 =?utf-8?B?K1FKZWQ2SktvYkxYRUVlWm9OUWNCaGwrcUF3Q09wUHBoamlzVzBqanA3UnpL?=
 =?utf-8?B?STMxWFI0UHE1NVFnNmdsK2lZTW9HUm1NSngrM2VDakVBRlV6YmVlV2dRQXhT?=
 =?utf-8?B?bnN0dDZKakpkT2o2eTAwS2ZtQzlnaFhHYjVTVUJHOFVDNGdSOHVPZXZ6dFcv?=
 =?utf-8?B?VWgvWjg5RSs4RFFNdkZLaEg1WWVoS2ZGTlBEakc0WHpjWXRxSjRpeU82eGtH?=
 =?utf-8?B?YVBRa2lIOVJqK3lEMllBdmdXWWpnNGxyNzJKa2hBY2hTY2g5aXBYVStmYXg3?=
 =?utf-8?B?NzFkbitsOTYzSHZ1UUJNT0lyNFVLS2t0UldHeGh6NGw3SGtBcWJReXF3R3RB?=
 =?utf-8?B?ajducm1aZEFaOVFJY01WdlRTVHZWTUZwTHZIY0JtTG5PYXNzQ2d5ZGhlNjE1?=
 =?utf-8?B?RXlNaWVZUElmYXpjZ3dSQkZRVGhwcmY0NUlpbGFWRUx2Zm50ZXVwMVRGNzdp?=
 =?utf-8?B?NlIxZzVPMFpid0hHUDYxeDkyUXpTWUNkRjhBSjB1RWVSVzBXTUVKbll0cUth?=
 =?utf-8?B?Z25WZFhWOXNSc0Y5dW0wVFg1VWlKdWd3M2JRRFA0cjF4ZjhDcVVKcGVkNXQ5?=
 =?utf-8?B?d0E4NUU1S0lReWFTc3ZCeDIyMHR5bVk3RHJMaXRzS2VDdjRpblQrU3dQOGIv?=
 =?utf-8?B?R3RMSG1SMThLOU55VGl4aHRpKzYvSzJJS2k5UERFWlNxc2JKSjFTSkRWMlBF?=
 =?utf-8?B?dEwvdW1oRXZKcVpQVjN0VGk4dWdsTEFLUGxQYTRnNTdCZFF4WEtEREtUbzZt?=
 =?utf-8?B?SjhnOS96cmFZUGxtUGgrVE5NTjh0SkhNd0Z2b21UWVdUSnAzUjZ0MHlWOVYr?=
 =?utf-8?B?cTM1RFFYakgvUmRRekJscnFnRDZIdTVNTmdaMmlONnVWRXlaOXRaM0V1cDc4?=
 =?utf-8?B?cWNWKy85ZGdhKzN3VHprYWUyYXRyR2dYMnhET3pGY0d3MTEybkxhZXVZUWhZ?=
 =?utf-8?B?TUE0czZIMEJFTDFUVUNURGQ1OGcyb2NwUU0rOWtWV0dJUXMrVUZxZHdHcDdo?=
 =?utf-8?B?MzNsSGs4TU1IcGxhbkNFZHpFWUdoTW45MHJKdzYwb2JobUdaZUJsRWRDRVZH?=
 =?utf-8?B?bGNtTHdxcStzeVhLWGMzc3hKcU9Sd0d4cVJHN0lnNEhnc3ZUR3JTTFlBV2lZ?=
 =?utf-8?B?RHFHSUJseDNFTVpHdVpTSXo4MTNGWm9qM2FEVWszVkZCSzlkUlpDU1AzTnNs?=
 =?utf-8?B?cEw0N0VqMkJDWU8wTUwxcGxWMmZrOU9mZ0g4MGtHNlVDd3Eva1BIYkk1dEda?=
 =?utf-8?B?bU1qWEVpcVRQOTU3a2FzUW5zbEJMa0FiUlE5VHA4cEpFSE5RdER1MlcxVWFn?=
 =?utf-8?B?OEpXb3JsLzErYnhKR2RTTGpLaXlDTXVFU1hQcndDWDdzNHhKWURxUFVIaUk3?=
 =?utf-8?B?QjZPaTUvR2VGMzcwQi9aN0tUZi9GRGR5VDl0bzVOSWMzNHYyL1JDS0svajV4?=
 =?utf-8?B?aCtMY0F4RlA3VlZjeGpNdjhqWC9vajQ2REFDcEhGeWNIR2hHajRDVmROU0tI?=
 =?utf-8?B?R09GZVcwUVJzSTMxN0tGMVlvNGNkSE45Q2tZQ1BiaERjR2lsVnZQTlY0a01y?=
 =?utf-8?B?aEJkQXNNeWFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFEWXRRa254UzB6K0RzUCttVWU3Q2NhQ3UxY1ZKQ1NmbDZzTC91NVROemdN?=
 =?utf-8?B?ZGt0NURqNW9kWElYYjhPZ3N6MWlNRkFzSnNtbTBZelJ1ak03Y0dhSUt3emQ5?=
 =?utf-8?B?OHNhK1ZNRzl1SDJxaDhLRk1GS2Q5aExVMmxOR21DRDhOMGxZYndnWVVZcjNI?=
 =?utf-8?B?ZWxUWXh3TG9xOWViY2dXMGtXTTBZeUM4bjFqdGU4V0QyZWF3MS9MTGwraVls?=
 =?utf-8?B?N1RYNWp4dHl4UWpiUGRKanFodXUvcDQwQVdxdzVMUHZFNGNENTlEQ21Bby9w?=
 =?utf-8?B?WGNobmlrdXg5U0JIWnV6NmpuV09UQjRNOTdQeTJ4cFNTLzZBd3hHTEZuOWRt?=
 =?utf-8?B?SkVMWmR6bkRIRW4rbU9kajNzTXRMTGlNWDQ0ZGhWSDlENFBHM0JCYmFvZGVU?=
 =?utf-8?B?K2hzZDZpOWxFNWRuZThQV1BNREIrSWUzWStLZVNtSUdFL2ZXb3JqbS9CZjVt?=
 =?utf-8?B?WnhSK0tGWElSSSsyNkxBMjJydUlHOGV3QjZzRlpFWlhJcHBIck1VMTJjblZn?=
 =?utf-8?B?QTBZTy83Q2UvSkwrMFVBT3BTSmd2dGlZVjZNalkxendDeVBQTXdaNkRWT1hn?=
 =?utf-8?B?S3dadDBQdjV5TU4xSjlxZEo0elkzSVRlNkRxbWM3ZytjekRyV3pZdnEwS0Ez?=
 =?utf-8?B?eWxnd3RoUUZBa0o2Q0Z2VWQwQ1RTNS93R1BROHlpejBNZkk4SWx1NjBXRWhC?=
 =?utf-8?B?NjJ4bjFpNXFxanFLSnhnL3QxRzBrWU1WejhkOHhzUUVUWSt3TDF1d0w3RnJa?=
 =?utf-8?B?M1B4YzlkcTdQL0lTSk1ENVllWUN2Q2N2MCtuTEhyNUZBVW5URkZLMWFNeWY3?=
 =?utf-8?B?WTJCb2EzZmJEV3Y0ZG93N1lYQzlLUEtmQ0Z0NTh6ZmhSaEd6REpQYkFBZit6?=
 =?utf-8?B?ZU0rcDV3cWRPb2s2djQ3NDV5MzV5c0o3SmpHdDJWK2xCbmlHY1RxVzBpc1Ja?=
 =?utf-8?B?QmNjbG1xU21CR3NIWllkRDVTVm1XekxGclNxVHN4bG5ncHhyMEsvNEQ4TmxY?=
 =?utf-8?B?bTVHOC80RDljc1JFY3RoT1UxL2VIWStTS2RVV1kzdlBWWEFDVThlTW8yRXJ6?=
 =?utf-8?B?QisxTTJhdUMvUXROSFdkM0hhNjZRNUZsWUpsVVJZeEQ1MktOdm5uSGh6ZjVS?=
 =?utf-8?B?NUFSRXd4aUI5TGRvZDQ2UlBwd0hZTzU0QzluWVU2alVYaTFQanZybTZGcklQ?=
 =?utf-8?B?LzV0ZUVqM0RKWkU0QS8ralRGd2xXM3Nmam9mK3k0RmFaUWdEYm5KSUJsR3dl?=
 =?utf-8?B?dUVoSVREbUs2bmZVZEh1RWdPbWVyK282MUwycE5YZlA2bWExaGJoc1B3YlpG?=
 =?utf-8?B?dFBMTmMxWEJKRDA5Z1g0Z2VZbmhjZVBWcGlqS281c2xHTUhGbXVuZXEwdUZ2?=
 =?utf-8?B?VzlhUnlSYm5JQlp5YTAxWXdIdDdraWNnZWlDTXBCVlVyT1RacXUwT0tzUFRz?=
 =?utf-8?B?S0g1RnU0OTQ2ZVlRYkNkTmk3RDRBTHBIeGJ6RklEc2xvT2VXbDhEQzFEdE4x?=
 =?utf-8?B?eWl0MjdQZzY5eFhlZ1piUlpndllmRmxjYThub3FZM3ZrQlUxeTUzRC85OFBK?=
 =?utf-8?B?UEdQQS80bDRJYjBjZCtkc3g0MXI4TUo3ZFYzVzdraktJdDFxcUNGSE9HUUxF?=
 =?utf-8?B?TXZ5eGlGb21zRnFnNS9KVTJmclM1M2tPTFVRclQ0SFBSZEdMTnZGYitaazJn?=
 =?utf-8?B?WnBQYlA1UFhnUnVXY1hxam12NzZxZEo2RjlhSkpGck9BOVEvRGNXQlc4MGJE?=
 =?utf-8?B?dWZKUTVWajJzOSsxQWY1Y1RhME1KSUtMd0FqMTdKS1A0cWp1RVBVZElUdlJG?=
 =?utf-8?B?QkhGVjk5bnlPSnJibUJsVlRhTEJxdTlxdjA3R1lXdU5BRjkvQldjZ0ZQcGQv?=
 =?utf-8?B?U1FzdUVJQk1XZDI4WWcxOGxzeW5ZTTZYL1JTOXhHU1Nsak1CT3pRVFhBREgx?=
 =?utf-8?B?cW9XNkFvTnNQSEpUakRZQWhGeE1jRlNaSlNPb05FWGZybElwM01YVHlpSTlZ?=
 =?utf-8?B?OFBlVGREY2dHZDloVXlUSzZpZDRKL3kzOWEzUnB0WHFBS1FjSHc1TGtOUU94?=
 =?utf-8?B?N0Z1TzlkdjQwMU5kaDBPTVBhODhtblRXdUZoVjVVKzVYQzRXSDBudE1KdDBU?=
 =?utf-8?B?dHc5eVhCdlJPV2svdytkZGp1MWx0VjZVTFZsNXV3MlZxUG5sRE4vN3JHYmNz?=
 =?utf-8?Q?Mlt2eS+pJVqmM6HFL8hy8RqE7Wt/3wS5G6vT6l/uoDNG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ee3ff5-750d-467c-e990-08dda9b9c425
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:28.2967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM/e8e7d7jyBJTsrh+ZUpN2ptfUE//Rd3D7NwE+3WKb1h2TuxN3F4ruc3yaSaAb2VgTDo0QMUh8YZnQn7xItqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Hi everyone,

The feedback on v4 has been (hopefully) addressed. I guess the main
remaining unknown is the direction of the `num` module ; for this
iteration, following the received feedback I have eschewed the extension
trait and implemented the alignment functions as methods of the new
`PowerOfTwo` type. This has the benefit of making it impossible to call
them with undesirable (i.e. non-power of two) values. The `fls` function
is now provided as a series of const functions for each supported type,
generated by a macro.

It feels like the `num` module could be its own series though, so if
there is still discussion about it, I can also extract it and implement
the functionality we need in nova-core as local helper functions until
it gets merged at its own pace.

As previously, this series only successfully probes Ampere GPUs, but
support for other generations is on the way.

Upon successful probe, the driver will display the range of the WPR2
region constructed by FWSEC-FRTS with debug priority:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This series is based on v6.16-rc1 with no other dependencies.

There are bits of documentation still missing, these are addressed by
Joel in his own documentation patch series [1]. I'll also double-check
and send follow-up patches if anything is still missing after that.

[1] https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v5:
- Rebased on top of 6.16-rc1.
- Improve invariants of CoherentAllocation related to the new `size`
  method.
- Use SZ_* consts when redefining BAR0 size.
- Split VBIOS patch into 3 patches (Joel)
- Convert all `Result<()>` into `Result`.
- Use `::cast<T>()` instead of ` as ` to convert pointer types.
- Use `KBox` instead of `Arc` for falcon HALs.
- Do not use `get_` prefix on methods that do not increase reference
  count.
- Replace arbitrary immediate values with proper constants.
- Use EIO to indicate firmware errors.
- Use inspect_err to be more verbose on which step of the FWSEC setup
  failed.
- Move sysmem flush page into its own type and add its registration to
  the FB HAL.
- Turn HAL getters into standalone functions.
- Patch FWSEC command at construction time.
- Force the signing stage (or an explicit non-signing state transition)
  on the firmware DMA objects.
- Link to v4: https://lore.kernel.org/r/20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com

Changes in v4:
- Improve documentation of falcon security modes (thanks Joel!)
- Add the definition of the size of CoherentAllocation as one of its
  invariants.
- Better document GFW boot progress, registers and use wait_on() helper,
  and move it to `gfw` module instead of `devinit`.
- Add missing TODOs for workarounds waiting to be replaced by in-flight
  R4L features.
- Register macro: add the offset of the register as a type constant, and
  allow register aliases for registers which can be interpreted
  differently depending on context.
- Rework the `num` module using only macros (to allow use of overflowing
  ops), and add the `PowerOfTwo` type.
- Add a proper HAL to the `fb` module.
- Move HAL builders to impl blocks of Chipset.
- Add proper types and traits for signatures.
- Proactively split FalconFirmware into distinct traits to ease
  management of v2 vs v3 FWSEC headers that will be needed for Turing
  support.
- Link to v3:
  https://lore.kernel.org/r/20250507-nova-frts-v3-0-fcb02749754d@nvidia.com

Changes in v3:
- Rebased on top of latest nova-next.
- Use the new Devres::access() and remove the now unneeded with_bar!()
  macro.
- Dropped `rust: devres: allow to borrow a reference to the resource's
  Device` as it is not needed anymore.
- Fixed more erroneous uses of `ERANGE` error.
- Optimized alignment computations of the FB layout a bit.
- Link to v2: https://lore.kernel.org/r/20250501-nova-frts-v2-0-b4a137175337@nvidia.com

Changes in v2:
- Rebased on latest nova-next.
- Fixed all clippy warnings.
- Added `count` and `size` methods to `CoherentAllocation`.
- Added method to obtain a reference to the `Device` from a `Devres`
  (this is super convenient).
- Split `DmaObject` into its own patch and added `Deref` implementation.
- Squashed field names from [3] into "extract FWSEC from BIOS".
- Fixed erroneous use of `ERANGE` error.
- Reworked `register!()` macro towards a more intuitive syntax, moved
  its helper macros into internal rules to avoid polluting the macro
  namespace.
- Renamed all registers to capital snake case to better match OpenRM.
- Removed declarations for registers that are not used yet.
- Added more documentation for items not covered by Joel's documentation
  patches.
- Removed timer device and replaced it with a helper function using
  `Ktime`. This also made [4] unneeded so it is dropped.
- Unregister the sysmem flush page upon device destruction.
- ... probably more that I forgot. >_<
- Link to v1: https://lore.kernel.org/r/20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com

[3] https://lore.kernel.org/all/20250423225405.139613-6-joelagnelf@nvidia.com/
[4] https://lore.kernel.org/lkml/20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com/

---
Alexandre Courbot (20):
      rust: dma: expose the count and size of CoherentAllocation
      rust: make ETIMEDOUT error available
      rust: sizes: add constants up to SZ_2G
      rust: add new `num` module with `PowerOfTwo` type
      rust: num: add the `fls` operation
      gpu: nova-core: use absolute paths in register!() macro
      gpu: nova-core: add delimiter for helper rules in register!() macro
      gpu: nova-core: expose the offset of each register as a type constant
      gpu: nova-core: allow register aliases
      gpu: nova-core: increase BAR0 size to 16MB
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: add types for patching firmware binaries
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
      gpu: nova-core: load and run FWSEC-FRTS

Joel Fernandes (3):
      gpu: nova-core: vbios: Add base support for VBIOS construction and iteration
      gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
      gpu: nova-core: vbios: Add support for FWSEC ucode extraction

 drivers/gpu/nova-core/dma.rs              |   58 ++
 drivers/gpu/nova-core/driver.rs           |    4 +-
 drivers/gpu/nova-core/falcon.rs           |  557 ++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   24 +
 drivers/gpu/nova-core/falcon/hal.rs       |   54 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  117 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |   10 +
 drivers/gpu/nova-core/fb.rs               |  136 ++++
 drivers/gpu/nova-core/fb/hal.rs           |   39 +
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   57 ++
 drivers/gpu/nova-core/fb/hal/ga102.rs     |   36 +
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   58 ++
 drivers/gpu/nova-core/firmware.rs         |  108 +++
 drivers/gpu/nova-core/firmware/fwsec.rs   |  395 ++++++++++
 drivers/gpu/nova-core/gfw.rs              |   39 +
 drivers/gpu/nova-core/gpu.rs              |  121 ++-
 drivers/gpu/nova-core/nova_core.rs        |    5 +
 drivers/gpu/nova-core/regs.rs             |  265 +++++++
 drivers/gpu/nova-core/regs/macros.rs      |   63 +-
 drivers/gpu/nova-core/util.rs             |   28 +
 drivers/gpu/nova-core/vbios.rs            | 1157 +++++++++++++++++++++++++++++
 rust/kernel/dma.rs                        |   32 +-
 rust/kernel/error.rs                      |    1 +
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/num.rs                        |  204 +++++
 rust/kernel/sizes.rs                      |   24 +
 26 files changed, 3573 insertions(+), 20 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250417-nova-frts-96ef299abe2c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

