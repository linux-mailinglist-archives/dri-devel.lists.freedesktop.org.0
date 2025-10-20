Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B06ABF3B52
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE17610E522;
	Mon, 20 Oct 2025 21:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k4yPmrdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011059.outbound.protection.outlook.com
 [40.93.194.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CE510E51B;
 Mon, 20 Oct 2025 21:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQtjmnye1z49EkyAkOZxjO8K1kOCAWhP+FhABBuPe9o9LhvrLICa3Z1fIeTkjBMN2Elki0K9itn2SL4m4ePyW0zTO1/ZTcp34cX8s7m3Asn1BiNWRR59jZ8HoswILTC9VyIitwqje0mjWWQICToOlBavdUNc78tA2Of2dVklOxsK2xjk7qyqlZMN0P+KHFfpp1V3vIBaHDYEfkxYTL8Khq2Y16OGZqnD5LrkndD5I0GjYczIxgsptlt5kOGSbzH3sw9yts0/BGMHMOh8Cw37NK0Y48oMj4Zg0kkdfp/DtOefj/k69pLT2zFPGQFWLP9FCftwRxmwIBUsEJ0o5GKOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWHfosIW35X1wUT9dXfqbL8zMmsHvZc3lo71XmpVSqg=;
 b=r24oa2At7TrBI83mOMbnDe322C9O75uNGUHGiBOsM00xAbfQLfy4pqwwlA20J94xiQcZAgA6q2xPj70a1zX/12UoU+Z1avknzZa2r6uWzbRXdk3SslPxmWndYnhShwavmWaYkRL4OE7CXiLmsW4X2u+r1seF4oamxg3RsTzZ4Csi6GTXaW8jS31hmEuSHt4dfy5SgLFu4FiX/0g4KNJIqrtl6nECZ3uMXtaXbe96STv5iXbmiYlF78ouKaFs3ZQ7G9IV543jPjkMvK152fbGcXq75m+BrZR6UhMxazP4TvqzPeFSoYBbqNOaT7Vu+PfIw9v6+5cYpk5OazPfhOQuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWHfosIW35X1wUT9dXfqbL8zMmsHvZc3lo71XmpVSqg=;
 b=k4yPmrdLaMyxQy137Zz9uEom+jhShhHCU23TwpLxdA1dM2GaYK5kLEoEMIXx3uyYzDEx4OPfOP6rwe5pWrgoiZFibXfbr7O3kSsE+mBoua7u2bXEUlF3POzbhXf/sXkVjmeDyO/eiQCc5SwBHugeBrt2NSL/Pl8GlotvYUHqWbx48b+Udwoxv0p/gqQRgiB5S+N4F/ZjJ0B0Y4F3sbzHtg1nMHDaMDosmrG8w+dtvP8i3vXHs5avErJmt0bIlCfrgkXaSD2rew7Lf7sHdMaICA0h9lxQSEX5QdMKlU2EJ/yJgxfHvmVnxjLbCMZbThtBR347a99jRAUuoxvqiAbecg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 21:21:29 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:21:29 +0000
Message-ID: <c6350b8d-fb41-46f9-806d-20b058f778d9@nvidia.com>
Date: Mon, 20 Oct 2025 14:20:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: db813a2b-1e7e-4a92-5a6c-08de101ea27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STB4bXBNZnBmb3dNb0FoWFJ3VmtHR1U0am8xb2xDeldwSi9JV3kzam1ieUZK?=
 =?utf-8?B?dVZmM0NkVEUyVXRsMkJsUE9YS2NUUDBHVGU0K3lHaDA5am9ydVBMc3BkNG5X?=
 =?utf-8?B?LzhjR1hBVm44OG5BUUNnRk05eklBS2FrMlFXWE1xRnBKMzRBQUFCN3hBNDdm?=
 =?utf-8?B?Y3JmeGZSVGUzY29ValQ2K1kvY3VlUkczVndjU0lWYVJuOFMxSHVDK0NaL0gw?=
 =?utf-8?B?SGpsUWNMb0FVcXdiWkdzWnMxR2VTR21iZUFCR2lJeXFrNmFWanRFY0wvQ3Nz?=
 =?utf-8?B?cEFQUFF3MkZNU3JNdVY4Q2EwV2ZjMXd5KzR3ZldqOWZTR2o1Ty9XeU41TGFw?=
 =?utf-8?B?SVRPdnhQQUEwTUZyeVcxNTA5RnA1bWlCeGtOcVY3L0JpY0c0WTBIRHhNMThv?=
 =?utf-8?B?SFhqOFdRYmdmcENzOWExZHB0M1g2a0w3MWRxWmtFZjlkak1KcU50c3plRld4?=
 =?utf-8?B?MVZTakwwVWduaFJNMkJ4dEdXbTQ0eEZvVHVLZHB0bXRGaVBjbkFwOXpLdTBD?=
 =?utf-8?B?N3pnQ3o5cTZhdmhpQ0puUEhySFFFN1dsU3U1ankvdUVWWWE5YWp0Nk1FZjBi?=
 =?utf-8?B?ai8yeitZNlpuUDJ2YTM0QzVWY203dFhKUzdiN0w3bm9wQStKVHJTVzVIWXNQ?=
 =?utf-8?B?cW8zMHZkKzQwNXgwM1hzemZRenlwaFQvano5OHRMcGczVXBUeHFFRlRLNWJG?=
 =?utf-8?B?VjAyaWtIV0xPcGtlaGF1WHRKTDdUcGQ1WExCVVlyUG94SGxNK015UEw4d3lJ?=
 =?utf-8?B?K3BVT2d2dW5XSWZBVUZXeUxjSHZjdVd4Ly9YeHM0ZW9LMzRNZkQxeGIwMU1p?=
 =?utf-8?B?RXdoTEVRMFJYcFB3Y1k2Q3hCMFJSQjhLbUNuRGhBVlN1OVVYS2ZWNWI1cmRl?=
 =?utf-8?B?MjZDc1JBMkFvUGYrU3U4YlQ5K1QwbHRRUDR2Z0dUNXpsb3UwZEltQmd2R2th?=
 =?utf-8?B?OFM0VE40WkRVaGphdXNKS0JOUG9pc1l1ekVZVjdnWDR0WXRPVDRkL0NadnlI?=
 =?utf-8?B?eUxWWER6KzFaTTVSUTFWYUk2bm9RMU5LbGhyMm40TnhFblZQbzNtWmZJT2k1?=
 =?utf-8?B?RmpNZ2l0dXNpcHZtZVl3eGdKUFRNakNidW9WS3FCTHVnZkZlY2tHM1pvRmtu?=
 =?utf-8?B?eURaN3pTQWs1ekMvbUdDRVZTcU1WOWlXNTlReGFtcFJpejJOc0xzem9lWjFv?=
 =?utf-8?B?WWZuK081NlcxT2dRWXU1ME44MmpZNXNWYkFMNTQrUk9OMDhvbEd1M1BRUHJN?=
 =?utf-8?B?d0FoaHFGaEhGVmVlNjhsMzVIeHBZM1BVN0p2UlMwYTloR1pjWE9QK3FaZnNq?=
 =?utf-8?B?QzArekp5bUx2RWlET2htd2M5SHJIMjByK2FTNWRLTWdDYlFBVGFoalE2TzVx?=
 =?utf-8?B?NVQ5Y3Z4YmhHOE43Y09WQ1duZno2YXY1OURuSytvQTJuS0F1Mmdvb1YvZnl0?=
 =?utf-8?B?bmp4djdEajQwdmYzTndBYThnT2ZVYmVBbkdiWWtPQk15ZCswR2pWanZTSVEx?=
 =?utf-8?B?NVlBNUtYQStGMW9nQnNLZlRMd3JRL0s4VmNLS3A3VmVLQVZ5VnFvdVhyVDQ1?=
 =?utf-8?B?aENwbGdROTB4aFAyUUtPbFhjQ3FMaTNTSFVzRHZ6eUtaeStpQXhJbkhZM1Zw?=
 =?utf-8?B?RmN2S0tzSFJIMWppOEJkdnpDZmEvNHhQSzN0V3hzL2JFWkRINjN0WmJZWnc5?=
 =?utf-8?B?bE1KejRUbzZWYk9sbDdhVk45ZlBKMVJiMkJ1V2praHdoM1ZIV2ZhVVdaUlhj?=
 =?utf-8?B?dE9Fbk13cHlLb2h4SlR0K3ZGQ0dxbFkwTERXaHJLNkdrNW5ERitRZUNpZEJu?=
 =?utf-8?B?bUlNaWZFUmFhVVErV2JCUEQ0SitoZGo2K2gzamZ5eU83VmVzWkI4ZjRxaVZB?=
 =?utf-8?B?ankyeUxBOUo2a1VrQlh1VDQvM05CN1E0aTNYV2UyVVVZQXZNc0xmdGZGdjFm?=
 =?utf-8?Q?PgyzpcHolTiTuHjaUdcClIpxiXMkh/WH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnc1Q2Urb0ViUUxsMmhESnJRdE4xbmVramFhWWpaZUY1T2JxYzloZjA0aWtW?=
 =?utf-8?B?clBJOWR1TmNBSm1nVlU3eFVONnBybTVjc3MvdDZZYXlCL3AvTVplUlN1ZWFh?=
 =?utf-8?B?QmhoRm9aTURzT2RDMEwxSzVoMk1YVHRqengzSy81NjFqV0pmeXI1amIva1Rz?=
 =?utf-8?B?QnZZeUgrVGpOVnAwYzl5QW5HYkNMcWxNa2phNXgrd3ZQQURYSGFXdUpWT3NF?=
 =?utf-8?B?QzhnVXRMVnRXcmwxQXdEclJKSHVPQ1J2ajlwb0JvUVBqNENqazNyeWNCQXFB?=
 =?utf-8?B?RTRHbUx6RWZjWHltTEJ3bWhxQmFzZXAyUEpFZlM3aXJlZVljcjhERmsxeGVH?=
 =?utf-8?B?OUp5WEYyYWU0bEtHVHI4WVFRTDhveEdveUdRQlV1N1VhN2VVeVRNQXBnS29H?=
 =?utf-8?B?SzJEcXM5SklyNVlEL29yRDgxWjBXekJHVG1GemVWSE9leldUdFMwVFlCNnVi?=
 =?utf-8?B?WGM1Y2pwSWN0TUlTNHEzc3ppeXV6N1ZLZWlKdGVDZ1Z5YWxkRzAzbXR3aUNN?=
 =?utf-8?B?RHlsbzhhRWV0M2ZEc1Z3d0RoOCtTTGlFRS9pVG9GR2tJczBQREpWcW1hVUQw?=
 =?utf-8?B?cURDYzR5NUZvcHF2TUx1Ri9uUUkydkdZTVNoSVM3Sndwdm9FWVR2Q0lwc095?=
 =?utf-8?B?T0M4ZmY1ckJiUTA5eVpDalhFbXBxMFRxU3VWTGtmNDI5OEFzeklPdzhsZUhp?=
 =?utf-8?B?YmcyeGlnZDhoZldVbXlDN0hxRVhBaWtSRmtneUUrcjhpbm1mbHJTZURDSnBI?=
 =?utf-8?B?QXZpS3J3Z1dqN3FkRDY2VVF5NVFnSEdBa0JVaXJvdGlzUUM3T2xQTjFzMHFG?=
 =?utf-8?B?Mlg3QmVxL0ZQSm1JN1g2VzIyRFJMOHZrWVA5cFdYTFpkNjZjU1B1SnUrSWdt?=
 =?utf-8?B?c0x4V1I5a2xzYmhaUW5VbTd4a2Y5WTR2NWV4L0ZmTEJrT1lnNUFaRC83TmZE?=
 =?utf-8?B?Q0xZc29kM3ZIR3VBTGs2c2dZMjlUaXRZWmpWWmNLcTdJOFRTOTQxc0JNdUlz?=
 =?utf-8?B?Nm1mdG1OSXFBTjltNVFCRWJ3Tjc5a3N4S3VqUVhucHVIeGQrOTZYczNkRDRX?=
 =?utf-8?B?TCtGSDV6VlI2cGNiZkkwa0djZXJBRVhmYlF6S3dTUm44Vm5jK3VHNVBKeS9o?=
 =?utf-8?B?ajluanZaLzlvVnFaU1ZWYTV1ZHRmVFhSWko3MlVhSkFXUmZ1Y01KcFpIcnBE?=
 =?utf-8?B?bXo0aVppV0laK0FQZ1RTd1JkdE9CZkxkSEFvNUNDaDlwOUo0MHVlV0RsSDZB?=
 =?utf-8?B?T2drVm5ZYW9PV3psaFhEWVBVSXFybGw5dXlWTUY2L0RtckpKN3Nlbmw1QW1N?=
 =?utf-8?B?K2tLMnBWOG9La3JKdTFxcGhtei83S3dBYklkUVVlbjk0TVd5SUZmUmJQMFRI?=
 =?utf-8?B?Q2xLck5WV0UyaWNrR0NxMmptdGR0VW5sSjVjVkg4clZ6dXRVQk5vNXBlWE5y?=
 =?utf-8?B?MlpSdk1oMHBEU1hkUnl0djAweFlwcE5uYlZvdUZKb3krZ3JDNGNBTnloaDN6?=
 =?utf-8?B?WG93MzYrQ3ZpM2htRGJCSEk2K1p4d2hNMWs1N0NjYzYrZkNPdTJJQzhZUkxE?=
 =?utf-8?B?bk5UeEprQXpNeDVNMmYvRFRIckdCWEovcTdkRnpyUzV4WEtna25WZXF4Ym81?=
 =?utf-8?B?UUxGSVMyM3k1MXdIZWx4c1J1Slo0bERYK2FKOUlNOUcyVEoxd3c1NEdvbmxz?=
 =?utf-8?B?bldjMDJ4RElFUzgyaExsaE9BSDdNQXptWHFhazJHdk5QVnFQazlSUmJGazVX?=
 =?utf-8?B?OW81Tmd3QVhrSUZqNi82TW9NK2ZHOXFhYkgxdW1oYUNvclZRSi96K1hTMEZB?=
 =?utf-8?B?bmJNYTdyQ3UyTmhIQzRKa0JkNjFjWE1CaGxRSVRYTmtmUUQ4ZytnZ0JTQ2ZD?=
 =?utf-8?B?Zy9TYllSQ1FzdEJZZWUyS0p6MUNBS2pHVjRJbU1Zc3Y2NlluVGhSeWdOamFV?=
 =?utf-8?B?SDgyYXZjbWdFU0lSeDl1OC8zWStkT0txWGNYUTJQV3BtNEdhMDNRUzErTHhu?=
 =?utf-8?B?NXBjVXZOamFXR2NMY0t0cUJ5NTBEMFJieGk2VkUzbFpkZzhEUk5oTnJoQ1R6?=
 =?utf-8?B?WEpKWUZ4M0hCd1h4QU1NUUI2M1pTOUxGSFNweXJ2aW5pblIvcFIwY0dBTm91?=
 =?utf-8?Q?qhnznc/OrjUbEJq83RW19g3UI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db813a2b-1e7e-4a92-5a6c-08de101ea27f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:21:29.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNwxzGUYcqdQ5Vxd7JsyVFUlV2fTiy5ozfM+4CZ5AtjM0DXXK1MyzRX53sKnOUOapeguZqwJT8qN6v8Fs/gCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> These patches have some prerequistes needed for nova-core as support is added
> for memory management and interrupt handling. I rebased them on drm-rust-next
> and would like them to be considered for the next merge window. I also included
> a simple rust documentation patch fixing some issues I noticed while reading it :).

Just to be clear, it appears to me that one must first apply
"[PATCH v7 0/4] bitfield initial refactor within nova-core" [1],
in order to apply this series, yes?


[1] https://lore.kernel.org/20251016150204.1189641-1-joelagnelf@nvidia.com


thanks,
-- 
John Hubbard

> 
> The series adds support for the PRAMIN aperture mechanism, which is a
> prerequisite for virtual memory as it is required to boot strap virtual memory
> (we cannot write to VRAM using virtual memory because we need to write page
> tables to VRAM in the first place).
> 
> I also add page table related structures (mm/types.rs) using the bitfield
> macro, which will be used for page table walking, memory mapping, etc. This is
> currently unused code, because without physical memory allocation (using the
> buddy allocator), we cannot use this code as page table pages need to be
> allocated in the first place. However, I have included several examples in the
> file about how these structures will be used. I have also simplified the code
> keeping future additions to it for later.
> 
> For interrupts, I only have added additional support for GSP's message queue
> interrupt. I am working on adding support to the interrupt controller module
> (VFN) which is the next thing for me to post after this series. I have it
> prototyped and working, however I am currently making several changes to it
> related to virtual functions. For now in this series, I just want to get the
> GSP-specific patch out of the way, hence I am including it here.
> 
> I also have added a patch for bitfield macro which constructs a bitfield struct
> given its storage type. This is used in a later GSP interrupt patch in the
> series to read from one register and write to another.
> 
> Joel Fernandes (7):
>   docs: rust: Fix a few grammatical errors
>   gpu: nova-core: Add support to convert bitfield to underlying type
>   docs: gpu: nova-core: Document GSP RPC message queue architecture
>   docs: gpu: nova-core: Document the PRAMIN aperture mechanism
>   gpu: nova-core: Add support for managing GSP falcon interrupts
>   nova-core: mm: Add support to use PRAMIN windows to write to VRAM
>   nova-core: mm: Add data structures for page table management
> 
>  Documentation/gpu/nova/core/msgq.rst     | 159 +++++++++
>  Documentation/gpu/nova/core/pramin.rst   | 113 +++++++
>  Documentation/gpu/nova/index.rst         |   2 +
>  Documentation/rust/coding-guidelines.rst |   4 +-
>  drivers/gpu/nova-core/bitfield.rs        |   7 +
>  drivers/gpu/nova-core/falcon/gsp.rs      |  26 +-
>  drivers/gpu/nova-core/gpu.rs             |   2 +-
>  drivers/gpu/nova-core/mm/mod.rs          |   4 +
>  drivers/gpu/nova-core/mm/pramin.rs       | 241 ++++++++++++++
>  drivers/gpu/nova-core/mm/types.rs        | 405 +++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs       |   1 +
>  drivers/gpu/nova-core/regs.rs            |  39 ++-
>  12 files changed, 996 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/gpu/nova/core/msgq.rst
>  create mode 100644 Documentation/gpu/nova/core/pramin.rst
>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
>  create mode 100644 drivers/gpu/nova-core/mm/types.rs
> 


