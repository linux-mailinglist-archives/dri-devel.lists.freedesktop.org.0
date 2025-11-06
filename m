Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C1FC38E5C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5E10E7F4;
	Thu,  6 Nov 2025 02:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kz5Sdfsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16F10E7EC;
 Thu,  6 Nov 2025 02:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oP08nRWWMHBC+CtaCO3UGHJNfRA2t3QgMQc7xcLgV5g7gU4svpcz3QeSk35RW1B2R4ikG/1qvZFSqLDrWwZnBEFd+uwyA37o7Mnv8mqqrv5S3u/lcFrf/ZzkT1VvCWzKDw8MxmtdkkWu19TEP+LWDoauZe6PzT59aNNUGCBblh8tDR7RP5G18wJTjbY/oUrrm9pO9KL3xQ7sQ1Vy1MOqj7PZ7GEy5erUJqIqNMDumfphfUA2OEFqwDGADD2jQyFH6lNMR/rjQuYv8hlYit2GNeZl41uv+yQ6+OmZy3bRxjHsUeunbXjWp5AE2+Ikpvw6nqsEDgeMNdXbRzEveysmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT4ztwz+n6CCQ4mr9igVGOGM+DQOiekvJ7A+2V+n5r0=;
 b=UpYX35SYRXfdkq0uafM94xKevAO9oeDgakjS69vEryGF7wafF5NSzs5HnKu4M2UBiq7rj1Bmm+uWPCAydalCPH/xESgFwAJ850YxE6t3RkJhe6PpNlw8qFmugy4aXgei2hDgBP9BOWseMuBFeArRGDJiJ/USI9G5bozUC+IhIiZIOkl65/xNdbDHydxU51e0Wmj0mAf3QKmSiunJgtTDZ04qdPmj0tHtIkoVGao3BcdFRTDc6aabtqQM38FjNpmwDROwYELhN5MfqDX1QiM8Cy8vD2qbifoD+FkfmOCl7XMdgD6gha4lI6+tnsvA5fZjs1mKgE8yziEL+PCOQJMNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT4ztwz+n6CCQ4mr9igVGOGM+DQOiekvJ7A+2V+n5r0=;
 b=Kz5SdfsiKk8i7/BnW2dUmKUTwcfZHQHLvFZlkOiCsVTgeD1f905Iq9DYAK1XgYb1HMMPTj515m1j0+Zve6q0CpJhTPidERmc3LCi0+XFtKdCK6//PBKiUOhYABGS+eZDNB7b7DyaK15R5vDbeeot2Pmx9cVZI+nqRiOPoUOWNJly96pSunvtDvw54+qhWpnAk5R/tqCF9eu9U0s2Fwkj1BbORQnvwo5GqicH1yF/SoZJmC0kytrpr0wJGWzNiYGxanqVWZYYyUiSCXkwBkXn/5hsNSZZ169vBTbRUF+oBZJGqd8qmvTTM6bb4yny1TyrvRenIxukHCXe48jgk8MLHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:41:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:41:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 06 Nov 2025 11:40:55 +0900
Subject: [PATCH v3 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-select-rust-fw-v3-2-771172257755@nvidia.com>
References: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
In-Reply-To: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 790ffb4e-e5e6-4ae5-bac0-08de1cddf045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STRDclp6OXRVWm9DbXZRVkhESTVXUXpMQ1ZyWHJrNzRGbnNqb09hdVBVU1lJ?=
 =?utf-8?B?eDhmVmJra2tKTWhOK1BEcGRETzRVNnNKOUVJaldOZW5kVkg2cDFyNVV0cFh3?=
 =?utf-8?B?amVHM2hMeE01N1BzY0pYMlZCYWZXNjhjQ2d2MG9KcXZjMStRMGZaMW1PQndv?=
 =?utf-8?B?cUwzUWlxY2QxRnlVUnI1ZmwvMkhOUEVMWCsyWXZTNlVUcHBOZUhGVStNc0gz?=
 =?utf-8?B?L0xodWZBSmdBVCs2UHVnTnpBSmp1Sm5YVWRXYTJIU3E5amlQNXFOK1J3cGhh?=
 =?utf-8?B?UXRkWWVCUHFyNW5Tc09YODVteENGc1A3T3lIcU1kM21iQW5qa0NPa3ovV0tB?=
 =?utf-8?B?S1VDQ1FzdS9TcHRqV2J4RjNuNFdLM05mUlJBa1loTXQ3U2R1bTF1UjJXcGdN?=
 =?utf-8?B?MlpHTVVQdTRWRGx6UGswUVNuaGZET2tDWG5vMnBja29nWjVQMCt6N2RzeitU?=
 =?utf-8?B?NWhRbG81cFZxU0xrZ0FUckQvWmM0VGYrSmYweFViZ1dlVE9RT0o5aXRQNE1n?=
 =?utf-8?B?YzRzVUIwbnRHL21aZFpkZlJSR3pVeE9tOWNHVDJ1ZkZKdmJ3UDV0cjJpTEhT?=
 =?utf-8?B?Ukhxb0ZydXZCWlZabmIrdzdDOHhyU1QvdXdUc0NoMGl3NGRlQXloZzZUWkN5?=
 =?utf-8?B?bGpyUkVxT0xsVzZ3M25JNGJLWDF4S2JjaEVOSWJQbkdENWExQ3JxalU3YWJM?=
 =?utf-8?B?c0NkTWFzMmM5UjVpTlNPN3hGMlU4akdHcmxrYUI5Tmx4MzRoMWF0dlR4QVUv?=
 =?utf-8?B?NTV1Q28zaktYWDlobVNaN1hnRzc4TmVRSm5pamJUdklKcEJTZkJTQ1NnTWxM?=
 =?utf-8?B?THZGRFhnNHJVK1JXb0hzdnBmZU95cFhHRzBHVkMzbzhmRC9xQ0ZFMFF3N1VY?=
 =?utf-8?B?azJ6ekUxZXNRR3d2MUVHVmtiYWV5TFZDeHFjVCtUMnhSWkQ0TS9lclZyTk4v?=
 =?utf-8?B?MmN1dVhIMzBxQUo5WWZrR0dTNnRVZGxJNlVyd1l1emxrRjRtWk1WZm5nY2dL?=
 =?utf-8?B?ZjluNWJEUzI4ZVNHR01kOTJHdklyeEZQdGkydnZEUWkzRGhlTDVnQW5LTVI1?=
 =?utf-8?B?dFJqZ0lSSzYra2dWVXZ4dXhrYjJ3dEIxcDcyL3BZTyt0aElnN21mYnpJTGVs?=
 =?utf-8?B?U1ZlQ2dVbWN3dUF0YXhhRDFzM1BNVy9lNURjQzJ6RFpxNTdNaC93bmVUVUpB?=
 =?utf-8?B?V3hUM1QyUG93RnFlenZ6bnd1bnVXaVBBOUV1Y1lkZTkxbGs5ZFQ1Q09uMlRo?=
 =?utf-8?B?dUV0dEh2U1NJOTA2bi9KUVBXaVVMbnBDd2JYcFVWRlp4REg2QXhlQVNjNitS?=
 =?utf-8?B?S3hpS3U3Z2Nvdk9kOG41QUJ6U0RYaE9PY29GVHZKeXVhMm5OOE9rNk5SWlJT?=
 =?utf-8?B?QTlqTVgrcDRocXlmRExsNmxEN0FrSklwY0dzY0l0bVVQdmd3YllQKzdQRjd5?=
 =?utf-8?B?UGNqejlCSEFGVExjUU9zUFJ2NElPdFZrZVVsY0lLOHJVNXVwSEdtZEJiWFlv?=
 =?utf-8?B?ZnRsTVJpUXNsWGNKZXlKckUwK2EvbE9SNTlEL2JwemxBNG5Vd1VncW52UU5I?=
 =?utf-8?B?RFhBdjhaeWRUVHJLM0FOZFJEUzdLdFVSUTBIRFV4Yzh5VFVqamNaWVZqRDdN?=
 =?utf-8?B?SEtCWU5ldEN3TGs5Ty9rU09IYVNiOFJPa3A0ek5sQ1Y4U0twMkhzK2pBZFFi?=
 =?utf-8?B?ZXYrNzJXZW95MDRObE8xdnRZRWE0VFJZaHp4NGd0aTFnMDVxc21EVllPN3VK?=
 =?utf-8?B?b3ZqMHY2UWZuWGtZVkQ0Nnl3ZUVRcWRjSEhyRTFFMGplSnVNMTVsWnhHeWRk?=
 =?utf-8?B?RW8yYWZPRXU2RHh2RWhZZWtEM0xrZmpoU1YxTFJWOUhJZERqZjdBSnBUZnA2?=
 =?utf-8?B?YWVoMElmUUpiR0xidDFkNXdKLytVRlpNd01zMlN3RWVvVytsWjhIbUk5eFZZ?=
 =?utf-8?B?Q3lmR3Jad0IzZVJWQkFXeFRkR1hPVUVNYU0zbFZFNDRWS1J5M0J5WDAwNVEv?=
 =?utf-8?Q?bYpCLe41ZPzdVP1Q8/oHb2iY5AJLuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGlRc1V3M3NmZ0RJVmRhd2ptUlE5bFV5MkM2ZDBrNUZtZytFNHo5VEV0dy9N?=
 =?utf-8?B?MENmN2t5MmJPdkhTYnkvTWd5QTUxNkpjbmNFY1lMNkRLeUtPZ2dacS9zT25T?=
 =?utf-8?B?dU5GYnR0Sk5IQXB0RnpYUmw2Y1lEaG1jZzlkM1lROUJFdFBaT3Bqc2svUUdt?=
 =?utf-8?B?Tm90MVdBRm1GZFljL0h5NTZrY3FON0k4TmNmcEdoR2ZHNnZJNE1tRncyY2Ni?=
 =?utf-8?B?NnoxZFRrYkdiU1VDdENzNXRmbU8rV1AybnpoSSs5QldvcWlheWppUVV1UjdL?=
 =?utf-8?B?cHJzZ3N3UGRNWkhEd2grYmxiSkd3dGVGR2tFdTY2YjNXbkM5REhDWEJ6dm53?=
 =?utf-8?B?Q1hCU1JWUERRbHNJNEVxNmt0M2M4cDd5QVlFUjlyODJoNlE0MkJTR0JyRS9j?=
 =?utf-8?B?OHBjcGtQbmNtdXVpeGVVdm9sYWlsUzZGMDZXOHdKdmtZQWUwaCtFVlcrOHVM?=
 =?utf-8?B?OWpINnZpRHFBcmJWSzFNTTlQSG53OEZ2Z0VBY0NIZUg2elN5VklncmRZOTNi?=
 =?utf-8?B?b3djR1RvcHB4MGx2TjhGQ3lBbnhzcmJlaC9XcHVsS0xSNlFzY2VscnFaekJJ?=
 =?utf-8?B?VmxaaUxQNk1vRzMzbXNNek5uQ2pTVGFGNHYvQ3RjMFhITjFjUUhndExYOXZR?=
 =?utf-8?B?TWdxc3kvM2xyd1hvbFpGcUtWTFY4eDBJRnR5NnNmWkRZblJWNnZOMjhOTWh5?=
 =?utf-8?B?ZmhOUFRVMENRbDZzN3pYTlNMdzd4VFg0VG96Ni9BRVFBZ201amcrK2FJQStx?=
 =?utf-8?B?SVJFZUIxcmI4Wks5cWJuNlZDY0NGQzIrcndlZ1QwKzB6eGxRdTlnT21ybXFC?=
 =?utf-8?B?K2RVbnR1U0E2WVZQQ0ZrMUVoUklrclR2NVEwSGQ3dXhOMTJ1cHU5cDc0L1hX?=
 =?utf-8?B?NnVNNFZsU00xTU44UU5Cc0xEcjE4eHc3NnBSMWkvMXlEZ3JJT0grdmdUUFdk?=
 =?utf-8?B?QXplVnJUbzdOa2o0a2VOYU5nMFRCdGZ0WWNaZjA1RnlSQ2djckFSdGw5OENS?=
 =?utf-8?B?S01hK3JYVzlYckh3WEtHSXNDNXpoU3lSNkJiU0JhcFRxWHRnNXkranZhOXNR?=
 =?utf-8?B?ZmtyVG1HSHFRVGxQSkxGdDYvOC93R3JJVHJyV1VJMnFxTVVaR25YUzdtbHpV?=
 =?utf-8?B?UUtPNHNRWGFpS2pUYUE0QnFQVG5VVFh1V0tZY1owMmVpeTN0dk9pYnFwUHJX?=
 =?utf-8?B?dmZLVnYreWo1VjNsVlAweS9mMmFOMlFabENpT3prYTNxUDUvenpUUXo3ZUNH?=
 =?utf-8?B?eE5abTRiaFlKa3dRN2Y2MnBjWGIvNGVBcE5mNUNHcFBkQzh0eXJFQ1BMT2hp?=
 =?utf-8?B?OU9OZ2FFb25wQUtRU3FjZEpnSjV2bWJNSGhUZnp0NWZwSTd2WlBpdEhYOGRx?=
 =?utf-8?B?WjF3eUg5M2pYdEhCQmhsNFlGSVBRckdvSG1LNng1eW5UTUtCOTFtQTNRenZW?=
 =?utf-8?B?ZTEvbjBTaGNQOU9xOU4vVXRYdjJuSW5TeFFqZUNXNDJYdnNzSmVMcnRWeGE5?=
 =?utf-8?B?WnRPcEpjZU9ZOHgvYTlabFBILzJiWVlkOVoxOWtoYkJlUDdKcTVhdi9XeGZY?=
 =?utf-8?B?UStScnZoVDIrQmxUUWk2VTJLSklJcjdGeTdnQnYzZkVGajNwaWRkWlRZWE4x?=
 =?utf-8?B?MTNOQWJTTTg1SzlEV1M2d1FxeE52NUxQWG1nYVlORFZVbUNSdVdYcnJKeHFv?=
 =?utf-8?B?ckhoS2FsaWJXaEVsSjZ0VkVTYVdDNFFhWFgxUHBKdWt5Zmw2bjJ6emt4bVZX?=
 =?utf-8?B?WGhEQnBGaEJNQUZObFR3UGRsWnBhYWZTdkNjNW9XTEIrS3pGeERzOC9vaGtM?=
 =?utf-8?B?UzB5YzdXemNkbml6OStYNGdRT1JHTU15SHJWMW56OEgvSjZRTjlvZWw4N1J1?=
 =?utf-8?B?WndjY2tZZUVhY0JyamJidjlHc0pleWo5SkdFZ0V2R3pEajJqNGVlMGlHNmk4?=
 =?utf-8?B?Sm11S2dTbGFwdTBoa3Rha3JGcmxUL1RFZnlTTGhZNURvWWY4bzAzcno4NDFh?=
 =?utf-8?B?ckZFTEQvenp4UGNmdEJoQ3N4T2ZrTnRTQ3ViNnhRK3Rwbmt1c1B0MWVJalQ0?=
 =?utf-8?B?TDRhdEt0aW01eEZaOUFxNTBXYXhYTEhiMXJrUHFRWWVudHVlOTM1MURHa1h1?=
 =?utf-8?B?a2cwVTdRdmFmMVRHd3BOaU9qZVErRmsxcTZFcE1BMDZtc05CNkVzUVpQc0NH?=
 =?utf-8?Q?cP2Nf/9EVgNkVNEzZzDcgpAZC+zld+BjdlDUqXok9uGd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790ffb4e-e5e6-4ae5-bac0-08de1cddf045
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 02:41:08.1709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqhRg/p4nEz12EwJT+HGK8V77H+j4JgUdlaiyyjtE13J0geW8gckdwPRTP8DzG7V+i7P7SkPXj0K3FGvX/Bekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
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

RUST_FW_LOADER_ABSTRACTIONS was depended on by NOVA_CORE, but NOVA_CORE
is selected by DRM_NOVA. This creates a situation where, if DRM_NOVA is
selected, NOVA_CORE gets enabled but not RUST_FW_LOADER_ABSTRACTIONS,
which results in a build error.

Since the firmware loader is an implementation detail of the driver, it
should be enabled along with it, so change the "depends on" to a
"select".

Fixes: 54e6baf123fd ("gpu: nova-core: add initial driver stub")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 20d3e6d0d796..527920f9c4d3 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,7 +3,7 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
-	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
 	default n
 	help

-- 
2.51.2

