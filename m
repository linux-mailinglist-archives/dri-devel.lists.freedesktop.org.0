Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E845BA3855F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10910E470;
	Mon, 17 Feb 2025 14:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TUwW4EWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ABC10E4CC;
 Mon, 17 Feb 2025 14:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGcLoOkWoQ8fZjBEsTgaEiajgOhYkyi/T0+ee6z99+RJjtStZu7N+iCEqhs0+XnaQswpqzD8pWs0126UOdxsirIFNTDZ9xebgxSV28D1LaMjvJG4Q5gi9H8mlfyaRzFJt/4OwYUA065P5geRj3XZ+hMm0fPmNIu3YSsvthiyS/BJcpIlEUYeCYXEmRKhTdS17RNFhrVJPV1f8CxHyRTXRY8lrsw7qe/EsVBIlHbA4STiAgNxlhiq7m0VEl8/2U6mRSzI/4GYBAmNEc81G7cMB2dN7rh5hehh6Xd1bJxWkC2GNWqLXK7FP5/NYdCWtlbIa9JUiRWSTj4jOzu7N/lXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1wAGrVj8vWW/OvvMWGZlOw9PqiZi2ZxtUNkqEuVztk=;
 b=hasUBo+4qi05uQv6/FXKzynrt+4Tmr/Q4wEIbxgjW5shzeZeNiGJOpz97tjIf5WG85NveNh1QBDdqbpHYcY+Jyl/vXYhuk3SKtpNAcVF7Se32sg83eHQh85NKEtw+zAjGi1Nr8tMHEgDce7E8LRS3kDogwh/cVdLAb7ee8gllm4BfeAwhWlGVr1iCGzMvt4X0GFQBYINXWX9eTvofd5nmb9w9L21bOYSQzf/WDeucKFhMefRDySPb+4T/9LKdpZvvDMqm7W8Vdr5hzPtNhLJwk2Vh7EjgLaz46dbQMd5kmq0JtjlDP947Vl9kwb+otcXzEOI85nJukwJTn+RBS6KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1wAGrVj8vWW/OvvMWGZlOw9PqiZi2ZxtUNkqEuVztk=;
 b=TUwW4EWy1YqUte37LW6WrZIy22aZ+ab+Ln26Hg7pswtJffxDuGMZ53v+PgTpWzX9zN7Usnzcb/zN5UG9mBXVKPcmBC5kikPg6ieG9TRua8h0J2U7cCWPm0u1giIQ7SxOSWRdgCiQW/N9PPbf7UqfbS1aGp0mWw14eTtWbEg1XTh3duI78ph7cZNnO8NNFesvYjdq2u1hP2m/mtQJT212kBLzhGjz9xgjo8VZJH5KFZ6goWo+yRS8mubuW4qa1qnMNEhe6rO9Vq2Kv2QEoaQT6ShGK9y6NGO5wZmfvm2gjVb26Hry6bNOQ0T8G6j9mKuPTznJFQHTswR/qOSiL7SCXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:05:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 14:05:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 17 Feb 2025 23:04:48 +0900
Subject: [PATCH RFC 3/3] gpu: nova-core: add basic timer device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-nova_timer-v1-3-78c5ace2d987@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b42191-45a7-45f9-c0ba-08dd4f5c11d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2hJN2JVNnlYMmRLR2NYTFZUTVZYc1cvd01QNTBsaFNva0Z6QWRuaHhGbzE5?=
 =?utf-8?B?L0FMQWFXWitTZzRGaU1zalJtSTZXU2kvV2ZwaVI4TUFhdkJka1NzVjEzUU14?=
 =?utf-8?B?SHMzb000ODB0NFZ3bFhEYU54Nzg5Z0V3ZnJPUWZZUldKKzYvK0RONFJVRDE3?=
 =?utf-8?B?WEZPclM0SXdhRGVHanFBOG9GTHIxcVFoNW5xd0pEaDdocFJ2ZkJtdnRzKzFo?=
 =?utf-8?B?UXYvODVybHZSd0NELytGWCtXc0VyQmhFZk41MHgydlJFK1plL3NoQWh5cklx?=
 =?utf-8?B?Y3I3a0RoNXhFVkNaRGJQbGY4amU3TGxVK3hoYnc2dUNmd1FXY3VteVI4N3Z1?=
 =?utf-8?B?aEh5ckNZRm1vcWY2Vk9Ja01adDh5cmZaSHhwNWh1R3d3M2lPZS9zQ0VsaTA1?=
 =?utf-8?B?NDlRTU9iUmdocm15Z1VyWXNPaFdVKzZHV3JqWFd0R21XK0thUkQreGNHOHk4?=
 =?utf-8?B?ZmhpbXNhcC8zZ0JObFFpV2t3dGNkNmM3YWNEaWEvcWdkczNBZmo5TVBEZlVW?=
 =?utf-8?B?SkZSOW5NSENQb280TVF1eVJ2SWRPaE1XODFSTDh2eDU2MWg3SHJuRmZobjlZ?=
 =?utf-8?B?RmRsc0JqWTN3b0tOMitnenBIRE9XbnhWRUtKakc1WlV5aXdJeExSY0NSbXpK?=
 =?utf-8?B?WHhLYlc1SjdEYTd6Y3ViTG5mcURXUzhkc1JIanI4Um8ydDNkSVJGVW14L0VF?=
 =?utf-8?B?TDF4Y0t3VmQ0L24wYTVEajd4eXArZEJMWEVuaFIvcnJoQXg0U2pLak5na2h1?=
 =?utf-8?B?bm1JeWJkcWlDK0d5cFAzcUE4a3pYbUdra0owR0J2WjhQVnRjNklaVWlrQjRU?=
 =?utf-8?B?em1SbHMvd2p4TUR6OGFseTZrREhIRUFObFZqczA5bTU0TTlIczJzdmcvWTNp?=
 =?utf-8?B?aVlSMzM1dm9QTW03SWZMTzFlV0p2dFpYbU00UG9rUEF3dlhQVHV6N0xaWjJM?=
 =?utf-8?B?bGU1cEY0WFN4d0FEZktFb1FNQytBeEpDbEtyM1k5YXJ5eFRxcmFjQ3BwNXNh?=
 =?utf-8?B?RmFOSWh1a2tkVmNqMDZnT0pBMnpMc1N5WTJLeHc5WE5xR3A3OTFWRVNLMW8x?=
 =?utf-8?B?TWtHMmgrODE2L3dMSzd3WXJmckFQV0JWM3V4WWZjVkFxVm9qZGNKMDN4ZC9O?=
 =?utf-8?B?SHN6djRXWUlkRGVkeFpTbnZSdUp6S0lKUHRlOEhWWlFRWW01c1EzTktyTlNO?=
 =?utf-8?B?VGdESkM0NThYUnJ3Qit5ekJrOTBNVktwUVVpVzlERnk5ZXJVTkRKa0l5a2lJ?=
 =?utf-8?B?Zmtwd1FBSjNrQXRmMlh4aXNDb3FjQTlMMHN3Z05EcjlkSFhEQm95R3d5d1hV?=
 =?utf-8?B?M0ExQ3crSjNpM2xoWlkzQ2hHb2dQQ0gzRVNibjhGeWt1aGZqT3lNYVF2TWhi?=
 =?utf-8?B?eEZaSndDZzdjYWdvbDdPREJLRmpibENIZERyTm5QbzBseWR6RkdVOXYxdUdF?=
 =?utf-8?B?dFNjTy9jVkxWbWtYUThvT0lLVVdiUkhreDNJTnBPeCt5NWNNVXdxaUlUMFJN?=
 =?utf-8?B?cmFJUWRGbFd3bDFBNnJTdzV5alRWQyt0UVpIUkd0czl1SldIUXQ0bk52R3dp?=
 =?utf-8?B?eGthOFYxbFhzK2NNRXg1OGRYWVpXVkpsTTg5a0x2L0d4Q3FWeGp6TVMxaWlF?=
 =?utf-8?B?SHZsa0Zta3dwL2E2cWcyY2hva0M1enNnU3FJZnAxMFo1eFZUU2FHTmRnbHh3?=
 =?utf-8?B?aWlNc3psWmpVdGhXTXc2T1FMc0FPb0ZFT3BJeVRTT29BWEJQMUg5aERlbjJ2?=
 =?utf-8?B?UUVkSCtQQXRJOFRJVUVkQis3djRUMXdLTmkvVlBCZ0IzSFZmVHNiTDNYRFR1?=
 =?utf-8?B?UC9DNWVrdFVtd2tnd1NNTTJBek5OY2hkMHVJNWNnUFhQQWkyd1FHQXozZ0xN?=
 =?utf-8?Q?w1YVR99r+SYQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVl6VkZYL0pWME5JMkZkbkZqQkw0aVZ6Z3p1cGwxcmxURGdadFJia1FiVkJL?=
 =?utf-8?B?dFdRUitoZ29BWWg0bU1JaDJuMG9iakR1Ni93ZUtJdTRJNmtEb3RnZ0o2dnVW?=
 =?utf-8?B?YWdEMXBjcWdFVURzajlGVS9Oam5UZk5rRTlNSFVRamo0U2lCUG85a3NqUEhO?=
 =?utf-8?B?UG01bXdZUEt3eGM4SU1NZDFabWVFTWRuYXQ5aDJRakxybGxCQ21FdWhaaGp0?=
 =?utf-8?B?T0xGanYyNVRsc0pOWWlQSWoyc2JGNWljenNBMUJjNzE5aXRPMmozT09pa09E?=
 =?utf-8?B?RmU2Ly9uckUzYlBGT1RxWVBLck83WWdHblQ1eWZobjEwMUFjWFZaczNEeFRw?=
 =?utf-8?B?K1ZEbGx2VEh1Qm9QeERkaHJhMUluU2hmalgrSmRoMmxoWjkrbzhFcm0yMmZi?=
 =?utf-8?B?Z0JjWW5ISGVjb1A4WDdHL3hyOE45NWd4Lyt5bzhQUFRLN1lYMHMvY3FTSEF3?=
 =?utf-8?B?TzJyUThsMm95SW45ZDd1RXhNS2NkZXA0TnVEZWlKb3dBMUh5V2lZK3cxV054?=
 =?utf-8?B?bzAvcFJ2b1hZdm5zR0daVWtHNXVSZ1pSakVNdm1XQVQrSzcxczJ2TW5Zc2hq?=
 =?utf-8?B?ZUZLaVF0aWlpSjFhWHhlbnBjaG4vU3JtNEM1N3BTVnNtTjlZWHhackZoZ2ti?=
 =?utf-8?B?VVd5UEJ6UWVsQzl2U3p4TzVPZlVlV2tzYjB1aTkzVm5RektUbWZGdUlIaE92?=
 =?utf-8?B?TUVHY2JVUzdXcFBxR3RTU05NNjlJdElWSGoyaW8wWkF6WXVSdk53czgwazBX?=
 =?utf-8?B?SXYxVERQLzA1bnc3ZE9DQ0FUTFE0dzZhR1NTR2lIUXdxUHdCU2tLY1R3aEls?=
 =?utf-8?B?eUlzMGg3Q0s0UEwvMURUd2JPa095SzNxbUlCVFdkSlpnTXJoWThwRGk4MTJK?=
 =?utf-8?B?VjFoNzFJbGNkdkRiNTlzdTFmK3laUkhMSzhzOE0wNmlWYnlkWDRxbWlkZE1n?=
 =?utf-8?B?OThyczBZM25OaWlxcGRJSm82eTZscGRZc0xrMlNoYWo0R1YvQzkzcHBaSXZN?=
 =?utf-8?B?R3UrUnpNbU1mUXd6VCtaT1NKeDJHb29IM3VhLzc0ckgrNVZhQ09Xa1VYUnh5?=
 =?utf-8?B?OXBEWitjT3g2ZFlFOFhJRHl4c0d6c0JseGtNb3NaMVBVQkZLYkttMG5YNnl5?=
 =?utf-8?B?TVZxV0FreXhxTGQrRktCTENTWURtRWpOcThOcWlpL0d0UUp1VDE4ZkJFTjFJ?=
 =?utf-8?B?RTVrRDllZi9mVTNZMlA0TEZ3UDhiTGFkTXMrNHYzZ3doZTlWZUJRRmxnazRO?=
 =?utf-8?B?aEFpY3QvUW5qKyt6WGlNWG5FNFh5Y1dFS1hHUXpJa3NIQUp3OHBpNTZuUVFl?=
 =?utf-8?B?QUJZcm80NDF5U1ExTFpNQTBRTEhhRFZ2bnNQeTVEUTMxMFUySldHWlJhQXZt?=
 =?utf-8?B?Y2hxeFdIZCtieE1sNVVsN2owT3YxM1MyR3plSGdEZjNZNm9XM2J1VE94RGZv?=
 =?utf-8?B?bTh4RTJoNFNtNDdKd1RITDlOdnQwYW11NXd2aDdCNFRra2JVeVJyV3NYWGo3?=
 =?utf-8?B?allVZ1ROeU1ZaExBdFpuSlQxd1BqM1lNNTVYOHlwZHc1bUtTd3AvU1l0d29N?=
 =?utf-8?B?Wmpyc0pla0tSSEdKeTN3UUtZemllaUJINFp1TTEyNkhNZFZ6K2JWbGRHS1k4?=
 =?utf-8?B?M2hacnptWEJhVVRQakdJMnhPRUtYV3lqY2s0UmdTU0JmQW5yRTFpOG5rbG00?=
 =?utf-8?B?SlJLQnVVdkFYZWMwajhpWU15NlBid0FsamlWbUpYaVlTZGpqb2hacU93ajR5?=
 =?utf-8?B?VG91Nmp3eXVlWk1VUXk4bXhiK0JRMkdhalkvYWJwR2hnWTQ3UFFLVkZPaHNM?=
 =?utf-8?B?S1ZLMlVSRmMzdjg4Rkx3RWQrM1ZRa3Y1TVE5NUZ1QU92c1cydE84Ymc1eUZY?=
 =?utf-8?B?U2VVQlBrd2RtNHh4SjQ0YjN4ZGNkcEhUOVhWclBONGJhTmlvQzNUT1BXdXpa?=
 =?utf-8?B?d2xrc0dZcWpFTTc5VlFEcWdETnhjbTBVc2NwdHBUZUhnNll1aEFRM295YWdn?=
 =?utf-8?B?MVdvTHBqenB3OGx4ckJFbHZ5SVRVVFA5N2w3cGJnTTN5L2RLOVlKVHNxU3N5?=
 =?utf-8?B?eHlFVWd0aHd2blgwK3hwSHdXdkR2T01IL3Z0YVJ2UmFaVHovYlhERW1IRENs?=
 =?utf-8?B?dDNlcmxQejB6YVpDMjlCZXhFQk1mbzVEL1lNZnpEbm5TS1lSRXpSeHl5N0hV?=
 =?utf-8?Q?bV2sIEC025M1KIhqMck018UUNcNIlYbc1oLi2xTtrKQT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b42191-45a7-45f9-c0ba-08dd4f5c11d5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:05:01.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALLvxZGH0KXEPPkZP6xX87Un3kiw3gEsF9YFXsSTd6VDZuHOKt09zyR9NAB0O6BpZdccxqoApg6xGFAoBQzjpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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

Add a basic timer device and exercise it during device probing. This
first draft is probably very questionable.

One point in particular which should IMHO receive attention: the generic
wait_on() method aims at providing similar functionality to Nouveau's
nvkm_[num]sec() macros. Since this method will be heavily used with
different conditions to test, I'd like to avoid monomorphizing it
entirely with each instance ; that's something that is achieved in
nvkm_xsec() using functions that the macros invoke.

I have tried achieving the same result in Rust using closures (kept
as-is in the current code), but they seem to be monomorphized as well.
Calling extra functions could work better, but looks also less elegant
to me, so I am really open to suggestions here.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |  4 +-
 drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
 drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 172 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 63c19f140fbdd65d8fccf81669ac590807cc120f..0cd23aa306e4082405f480afc0530a41131485e7 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x9500;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -42,6 +42,8 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
             GFP_KERNEL,
         )?;
 
+        let _ = this.gpu.test_timer();
+
         Ok(this)
     }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e7da6a2fa29d82e9624ba8baa2c7281f38cb3133..2fbf4041f6d421583636c7bede449c3416272301 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::device::Device;
+use kernel::types::ARef;
 use kernel::{
     device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
 };
 
 use crate::driver::Bar0;
 use crate::regs;
+use crate::timer::Timer;
 use core::fmt;
+use core::time::Duration;
 
 /// Enum representation of the GPU chipset.
 #[derive(fmt::Debug)]
@@ -165,10 +169,12 @@ fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
+    dev: ARef<Device>,
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    timer: Timer,
 }
 
 impl Gpu {
@@ -184,6 +190,33 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
             spec.revision
         );
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        let dev = pdev.as_ref().into();
+        let timer = Timer::new();
+
+        Ok(pin_init!(Self {
+            dev,
+            spec,
+            bar,
+            fw,
+            timer,
+        }))
+    }
+
+    pub(crate) fn test_timer(&self) -> Result<()> {
+        let bar = self.bar.try_access().ok_or(ENXIO)?;
+
+        dev_info!(&self.dev, "testing timer subdev\n");
+        assert!(matches!(
+            self.timer
+                .wait_on(&bar, Duration::from_millis(10), || Some(())),
+            Ok(())
+        ));
+        assert_eq!(
+            self.timer
+                .wait_on(&bar, Duration::from_millis(10), || Option::<()>::None),
+            Err(ETIMEDOUT)
+        );
+
+        Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5d0230042793dae97026146e94f3cdb31ba20642..94b165a340ddfffd448f87cd82200391de075806 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -5,6 +5,7 @@
 mod driver;
 mod gpu;
 mod regs;
+mod timer;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f2766f95e9d1eeab6734b18525fe504e1e7ea587..5127cc3454c047d64b7aaf599d8bf5f63a08bdfe 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -54,3 +54,46 @@ pub(crate) fn major_rev(&self) -> u8 {
         ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
     }
 }
+
+const PTIMER_TIME_0: usize = 0x00009400;
+const PTIMER_TIME_1: usize = 0x00009410;
+
+#[derive(Copy, Clone, PartialEq, Eq)]
+pub(crate) struct PtimerTime0(u32);
+
+impl PtimerTime0 {
+    #[inline]
+    pub(crate) fn read(bar: &Bar0) -> Self {
+        Self(bar.readl(PTIMER_TIME_0))
+    }
+
+    #[inline]
+    pub(crate) fn write(bar: &Bar0, val: u32) {
+        bar.writel(val, PTIMER_TIME_0)
+    }
+
+    #[inline]
+    pub(crate) fn lo(&self) -> u32 {
+        self.0
+    }
+}
+
+#[derive(Copy, Clone, PartialEq, Eq)]
+pub(crate) struct PtimerTime1(u32);
+
+impl PtimerTime1 {
+    #[inline]
+    pub(crate) fn read(bar: &Bar0) -> Self {
+        Self(bar.readl(PTIMER_TIME_1))
+    }
+
+    #[inline]
+    pub(crate) fn write(bar: &Bar0, val: u32) {
+        bar.writel(val, PTIMER_TIME_1)
+    }
+
+    #[inline]
+    pub(crate) fn hi(&self) -> u32 {
+        self.0
+    }
+}
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f6a787d4fbdb90b3dc13e322d50da1c7f64818df
--- /dev/null
+++ b/drivers/gpu/nova-core/timer.rs
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core Timer subdevice
+
+use core::time::Duration;
+
+use kernel::num::U64Ext;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+pub(crate) struct Timer {}
+
+impl Timer {
+    pub(crate) fn new() -> Self {
+        Self {}
+    }
+
+    pub(crate) fn read(bar: &Bar0) -> u64 {
+        loop {
+            let hi = regs::PtimerTime1::read(bar);
+            let lo = regs::PtimerTime0::read(bar);
+
+            if hi == regs::PtimerTime1::read(bar) {
+                return u64::from_u32s(hi.hi(), lo.lo());
+            }
+        }
+    }
+
+    #[allow(dead_code)]
+    pub(crate) fn time(bar: &Bar0, time: u64) {
+        let (hi, lo) = time.into_u32s();
+
+        regs::PtimerTime1::write(bar, hi);
+        regs::PtimerTime0::write(bar, lo);
+    }
+
+    /// Wait until `cond` is true or `timeout` elapsed, based on GPU time.
+    ///
+    /// When `cond` evaluates to `Some`, its return value is returned.
+    ///
+    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+    /// `Some`, or if the timer device is stuck for some reason.
+    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
+        &self,
+        bar: &Bar0,
+        timeout: Duration,
+        cond: F,
+    ) -> Result<R> {
+        // Number of consecutive time reads after which we consider the timer frozen if it hasn't
+        // moved forward.
+        const MAX_STALLED_READS: usize = 16;
+
+        let (mut cur_time, mut prev_time, deadline) = (|| {
+            let cur_time = Timer::read(bar);
+            let deadline =
+                cur_time.saturating_add(u64::try_from(timeout.as_nanos()).unwrap_or(u64::MAX));
+
+            (cur_time, cur_time, deadline)
+        })();
+        let mut num_reads = 0;
+
+        loop {
+            if let Some(ret) = cond() {
+                return Ok(ret);
+            }
+
+            (|| {
+                cur_time = Timer::read(bar);
+
+                /* Check if the timer is frozen for some reason. */
+                if cur_time == prev_time {
+                    if num_reads >= MAX_STALLED_READS {
+                        return Err(ETIMEDOUT);
+                    }
+                    num_reads += 1;
+                } else {
+                    if cur_time >= deadline {
+                        return Err(ETIMEDOUT);
+                    }
+
+                    num_reads = 0;
+                    prev_time = cur_time;
+                }
+
+                Ok(())
+            })()?;
+        }
+    }
+}

-- 
2.48.1

