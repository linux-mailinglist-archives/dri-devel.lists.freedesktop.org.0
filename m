Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75209BA3EA2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4B10E239;
	Fri, 26 Sep 2025 13:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3ym682I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DEA10E237;
 Fri, 26 Sep 2025 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758893697; x=1790429697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=whN69VE8UvkqcFwMtgpx5nMZI7gRj44lyc0dvj3Pt8w=;
 b=d3ym682IcQXhplPgMPC8xGDl+1VBxzv0yl8e7YjQrWv1OAlQ2qbyyaby
 PQFnO+UmzdAuS0Q+5DGaRD8PwvKfzINAR5lAflHKv4lXHr0igPGtxIm3W
 JpA6gCn0H3Wy5ihl23EgQLT39tPXWeLKD+pK5yc0wPcQpHx8z+xX2aVVm
 A9sIvJYp5PIvp4rZvuA5neCv+3QZudEaUXlnbKexe6cG+4CeRXOYyezBi
 B1pxttwWXVUGsTGF30+rGyEWftl3ytsWPbx7WNi8pgX4as9O2keLWz1fu
 wZktvFXN+JJtlJu2JkZ9F0/rD76pqLJMJVX5ciHgQMjH9dDbc3/yrKO+I Q==;
X-CSE-ConnectionGUID: /3pPbnZ9RjCPHY0DSwG+2w==
X-CSE-MsgGUID: tBsiKd55QfyqHjNA+YKccg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86669736"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="86669736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:34:57 -0700
X-CSE-ConnectionGUID: 4X0c9+vySQSwHr35YMyPXg==
X-CSE-MsgGUID: TKqxxGQtS8aKbhiQEnxKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177544150"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 06:34:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 06:34:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 06:34:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 06:34:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGFG13IZJqZDA1L7Kh3U+E5dT/GRh/2hopnLhNAY/7ya9Qfl2IKDUktfkjCgKvjthY7AiYjUYsistsoLr+IaIG829xqEfh3F7FQ4bMvfXiU1LMGQBtVdm5hyFntrea8XREZG89QIo7TwjnD7eSWoxqSgg5RqHwat6EAtOcOwHmY6b9ZosDqJk4gjoruzGqHmvxozlh5pjLKsmSlIQM71sISy62svvRXLXImC9iOh13GoX+Bnp2D3gl6VZvFOefgmnJW7++iiP677sQ73sZv7QLiAEYcWBpxPtilr62ga4liQs1aO6vgVuDAlbP1k+/H9msmsiSccHMZNi/1lzDquyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWJ4kC5NP1R9VB0SoDZc/OhBRa1ExzWreP4GtaIVbKQ=;
 b=nfnc3bxWk87pf9FW12/QcA/y92lYwuYOMILGB4UqUpBMJt0SLrZ4krCCRmLhH8gpak2PJwXgnOt4JOKSIU+FBtRbQbI9FjSEHmT63vO7nwtGUSA10z8a2lKokvNrOCBi6WU0uUpk50EPG/cDkWsmVEjYlgExGVYrdPjHZiKZ/cj8abSW83Atzz2t9FX4pC12nvjT2jiCHha/duyLZMDkr7P/Sz89Axy/Nt3OKcaxfZ389wNNiHvL5dHObEAVXh9cI+wKSdJqbqHns65d/Vr6o1uY0Sb6N+F9xusOeUou28SOYSACfszX3m9y5ZKldqmU9PZ8hHCg+7zcxkKG239MbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 13:34:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 13:34:54 +0000
Date: Fri, 26 Sep 2025 08:34:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/{i915,xe}: driver agnostic drm to display pointer
 chase
Message-ID: <vxxrpnasd5qfoof4coi3rw4pu3pbnau42u3lywc5dd52nma5sx@r5coda25idn4>
References: <20250926111032.1188876-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926111032.1188876-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 121ba967-1e34-4b1b-5ddf-08ddfd017a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fOylpDNL4I7yzLNFkKqZNEZL+F8ooLWRHIPB7OYvL2OG1Kh3sEn5H2gldt?=
 =?iso-8859-1?Q?f0o4+i/Tnitlp3w8PFMwU3G40bez4cCnbfppoX5rv7DUE0ZtOZCDXfLGqE?=
 =?iso-8859-1?Q?qWOz1F/jKZ1orPA5Xg/W0iX3xulsaLwCgQX+QzYr8AGau1ZdJGYP/spLoB?=
 =?iso-8859-1?Q?Dq3xTEWDorF/F+gepSCB0hzqnQdvTXQonq+D4a4gD6R5w5H1IBxUHrApSa?=
 =?iso-8859-1?Q?JXdda340GTkE7WP14u3qRCEV2DGxujs6PTva7+zHextCohepp1wtFGWTH7?=
 =?iso-8859-1?Q?NEvLtNUS7RP6fLsAVYTUi0P7XQYr81ur4XfYDGFFWZpGPm5MSHkxPAK1CP?=
 =?iso-8859-1?Q?TZnBPN4DgXoZXjwgP8kbGvf98LO3CqZV90YMp6VAeBx6ZSw7owQs4n79l+?=
 =?iso-8859-1?Q?RBq6pFtvlFrh7KwJQXXVzbp1XlUOeMyt4gBb2xOhA+vTQRCOnwKDKZ1XwD?=
 =?iso-8859-1?Q?DlKagiIZu/MKUL3BhSIVU0RF8Qm72X3lo/IVDGrArUp610anJufYIsPiw7?=
 =?iso-8859-1?Q?amBb+Y92LNOMdWYZLFQhXxZn2HI1pbhSlqpnhX/NXx3aH5mUbG7OCwjVJT?=
 =?iso-8859-1?Q?6wDEIsM5Kow1+KQycfHHdAWyzWYxqi7Tx2S15hOCNRz92j5DuYAEeKjDKy?=
 =?iso-8859-1?Q?Kuq9deOrr7ktRjHl7h9jZeZWTPRUsNkZp0QP6R/vQ9Nn2X5dIk+GxZqWZL?=
 =?iso-8859-1?Q?Ke2TRi/O/iVi4R0JZne/aEO59M7XvdZoqiaQ3j+l/6LDKKW1JybgzgCJEn?=
 =?iso-8859-1?Q?nUkl4ogXpGwP0ovY/DuoUNroXjOTdotbV+LhuKJXcU3mjo5QR1+Sj6elZU?=
 =?iso-8859-1?Q?z31QVgI2pLvMpH57XjhbX+Z7hKH5dQT1o9YvhyssXDx5ez/xzuGO+w7mXP?=
 =?iso-8859-1?Q?+GGIp/HGYDcup7DgqnxDg1gRh6DyQiUbn5CfHiuuMWmnFS8sYZyiVdXCcm?=
 =?iso-8859-1?Q?et5DTRESrwCa81bNHrh+/i1NjD2ZlINBAvtWVInZx0NSnZqg8zSFGN7f3f?=
 =?iso-8859-1?Q?gVFmc4jo6f/qGROToYfZkECkw/ATr8J1MpyyACCnRCjr669E/yI6y3iRI2?=
 =?iso-8859-1?Q?QxeDG1qcwWIxSpSSYgmczetwr14D+bPiZBZMmOWIKRJSIsZgOqPTfyDNCB?=
 =?iso-8859-1?Q?RJPNZxpOGdRJqVhTI29Yqvyg9tfsdSikAWZtPXz3oD6RyzjNGw5m3zv/at?=
 =?iso-8859-1?Q?l/8p44pNq6s6wIrOMbd5JBe8msNX7HjzyvPkKamDDG9VDQKm9A6vwC8iza?=
 =?iso-8859-1?Q?T89HqsxnmDjreMTU6Z9+fkDZ4o1uVutW6IRPDfhbM4PHyUPbvisgR2yWP1?=
 =?iso-8859-1?Q?zy3eSwkZKoAYItnwV66Kif8/xlXUizN3li0r0PlbxcR+5ic31PoNjGTTPJ?=
 =?iso-8859-1?Q?mu8Fn+/ZTO8Gk57RfegW+KKLAUhd41P8yC2KR0XuuusRG3vZuAI+gEIc0h?=
 =?iso-8859-1?Q?hPQCszIfNJ8PTfbQEn9hS21+qiApEmVFrsoiEh3X3Zq2zbPjKqQdCu2XSb?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ofx/fZiVsMFFPI0Ozq1PAbHAItkHAsu4ZcY10PDSLL0Hr6IVwKPp9uCFRQ?=
 =?iso-8859-1?Q?7wVrd+LJH9IylF5vFNFImRSQMGLXhmtYGvxrF2R13GBTJPAydszNdkBo8T?=
 =?iso-8859-1?Q?ZeFDqfDmZtbAaPctXT6yWgo+jAd1v//s3+geYSB9L81GlwEWiLEMy0y7FX?=
 =?iso-8859-1?Q?2K2m0xW7OwtkZLn3Q/6gl36zPfPq5x0OGd1GK6z20yv4YARxnaF9abZYhg?=
 =?iso-8859-1?Q?QtfvkAQHfhJZRWu6/RIMSeCS52KctJML24WpqNskLtvxhIUJ7CChTBsq8b?=
 =?iso-8859-1?Q?OG+ue+SvWrzODGtt/zlMj3tBgitVJ9sbdG5O+d8tqA+zUsAq9ou+AoLrhK?=
 =?iso-8859-1?Q?W52nH73hkI1ossDQd/mFf4m1vbb8oQ//oikyzwoIGAuKGKAlaBmdF6mGJT?=
 =?iso-8859-1?Q?bWZEjpnCpjTiq2VcfOj2FVbl0Xg/ez0iUL8Lg3zgGScyHdE1yd8V8vXprv?=
 =?iso-8859-1?Q?leYHiJ7Ye7YC/7JquTAvcTFZHgLE9Xw/Yw+NnUg1zH36SeMykDapAAMESS?=
 =?iso-8859-1?Q?QioTl1oya2x45IESL7Hp4s44M/B5eXArEM5bRKiIOAo7Y3L2slG0IQ9r1f?=
 =?iso-8859-1?Q?h8ToyDjVWSF0sNWsjzr+H+q7hXglFuGV422W5fJkZ5AE1Bdjg2VIL1ZzGE?=
 =?iso-8859-1?Q?52OyZCFe3SkTJyAUeP4pZnakvlBoTTjVRfCeLt6NiUrRHVQ5Pnt5ag2rnD?=
 =?iso-8859-1?Q?NP+ph15q6PdgAaBh2hSXOUDURchJ2jSgh8jVkxmUpL0vsiP/Z9P4oQiJ3f?=
 =?iso-8859-1?Q?RBe+iViHKHCc4FhnVurgAaTVUa5k++GbiLntRq6D0YBy+CrHQl99wvTuBd?=
 =?iso-8859-1?Q?JEz734kSOsbUyOCbtt8mejf63gCwzPuN41dk706ys3QXnA11pMwrH6Rlr4?=
 =?iso-8859-1?Q?mHCGABIAlmqnhl93BH4nR7o6H+EJCZU8Svk4OKP9ewmIgWQRzWgWIohJV7?=
 =?iso-8859-1?Q?/FYeOK8F2SE6f1CgkoiJk6/xW5Gva1DHQRpYvWAIxatMHvbklS8J/XM+pX?=
 =?iso-8859-1?Q?Z1vfwIj9fTRDHBSE+/sjVsenrdr+2EnQp5qqJLxPo7gpJCFcjesYFUYYr0?=
 =?iso-8859-1?Q?mt5FbrapEKoa1c+IXccaNe/xhKAcJuj4fHbRPQQSmVpfNbJL9ta5Rn2sfP?=
 =?iso-8859-1?Q?mZv+Er0zNaCfCtjhyDVmD7gpSBda3iFIJ0Vk3LczKVaNxrY+bLvU5l0pM7?=
 =?iso-8859-1?Q?N1Brmwd7LgKaH5/F0ienJK59+gePRpu5EzlNRGDLwah/mVBTL6FuSGHRRl?=
 =?iso-8859-1?Q?fBsejRu0cgftZGurnJjVG1REVjUNbJKOQeaCRIglFKc85LhErZzc3swkas?=
 =?iso-8859-1?Q?XvGeXi94cLYvoHDmm6dspWAotJftsVbaPvJyj1TzDROXWvXBMGM4kBIdYr?=
 =?iso-8859-1?Q?yJhTFAvXzzhP7CHwYA7COxNiin957cp0Gp3nEEUq4Crvfb6CGBF+f5VbCR?=
 =?iso-8859-1?Q?8cZgUkSEnSMrZdPfiYbmNbjDZRBQWKB070JVPShvtX+RgQnC8gts1DGh9B?=
 =?iso-8859-1?Q?hqBTP9JbZDCBo6JNYu9EL063N7dtenQHBn5dI2Okv8kPFaLPKO+5qrfpBL?=
 =?iso-8859-1?Q?YXR3l6KQYiceJj+F4hyEI8JoOmPsKnes4ClJwrkxBGymtdgcPNYRB17Vao?=
 =?iso-8859-1?Q?URTXgJEJR2BtDAWzEc4dEquGXdjjKBPoRxrCXzFfA3QinWzEa34vsDgg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121ba967-1e34-4b1b-5ddf-08ddfd017a06
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 13:34:54.2098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t51AfpWz6ArxOr9oUkFMxPN8zTjFcaFpQb80JFd44Km7uzIpYv23Nh5raZ30WiPGN/35P4HW6IcMQCCYE+s+FaKfpKcrLJWssG9IW2VkiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com
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

On Fri, Sep 26, 2025 at 02:10:32PM +0300, Jani Nikula wrote:
>The display driver needs to get from the struct drm_device pointer to
>the struct intel_display pointer. Currently, this depends on knowledge
>of the struct drm_i915_private and struct xe_device definitions, but
>we'd like to hide those definitions from display.
>
>Require the struct drm_device and struct intel_display * members within
>struct drm_i915_private and struct xe_device to be placed next to each
>other, to be able to figure out the display pointer without knowledge of
>the structures.
>
>Use a generic dummy device structure to define the relative offsets of
>the drm and display members, and add static assertions to ensure this
>holds for both i915 and xe. Use the dummy structure to do the pointer
>chase from struct drm_device * to struct intel_display *.
>
>This requires moving the display member in struct xe_device after the
>drm member.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> .../i915/display/intel_display_conversion.c   | 20 +++++----
> drivers/gpu/drm/i915/i915_driver.c            |  4 ++
> drivers/gpu/drm/i915/i915_drv.h               |  1 +
> drivers/gpu/drm/xe/display/xe_display.c       |  4 ++
> drivers/gpu/drm/xe/xe_device_types.h          |  7 +++-
> include/drm/intel/display_member.h            | 42 +++++++++++++++++++
> 6 files changed, 69 insertions(+), 9 deletions(-)
> create mode 100644 include/drm/intel/display_member.h
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display_conversion.c b/drivers/gpu/drm/i915/display/intel_display_conversion.c
>index d56065f22655..9a47aa38cf82 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_conversion.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_conversion.c
>@@ -1,15 +1,21 @@
> // SPDX-License-Identifier: MIT
> /* Copyright © 2024 Intel Corporation */
>
>-#include "i915_drv.h"
>-#include "intel_display_conversion.h"
>+#include <drm/intel/display_member.h>
>
>-static struct intel_display *__i915_to_display(struct drm_i915_private *i915)
>-{
>-	return i915->display;
>-}
>+#include "intel_display_conversion.h"
>
> struct intel_display *__drm_to_display(struct drm_device *drm)

it seems like this could be inline in drm/intel/display_member.h

Although it doesn't seem we have many calls to convert from drm to
intel_display, so lgtm as is.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> {
>-	return __i915_to_display(to_i915(drm));
>+	/*
>+	 * Note: This relies on both struct drm_i915_private and struct
>+	 * xe_device having the struct drm_device and struct intel_display *
>+	 * members at the same relative offsets, as defined by struct
>+	 * __intel_generic_device.
>+	 *
>+	 * See also INTEL_DISPLAY_MEMBER_STATIC_ASSERT().
>+	 */
>+	struct __intel_generic_device *d = container_of(drm, struct __intel_generic_device, drm);
>+
>+	return d->display;
> }
>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>index 95165e45de74..b46cb54ef5dc 100644
>--- a/drivers/gpu/drm/i915/i915_driver.c
>+++ b/drivers/gpu/drm/i915/i915_driver.c
>@@ -46,6 +46,7 @@
> #include <drm/drm_ioctl.h>
> #include <drm/drm_managed.h>
> #include <drm/drm_probe_helper.h>
>+#include <drm/intel/display_member.h>
>
> #include "display/i9xx_display_sr.h"
> #include "display/intel_bw.h"
>@@ -737,6 +738,9 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
> 			 "DRM_I915_DEBUG_RUNTIME_PM enabled\n");
> }
>
>+/* Ensure drm and display members are placed properly. */
>+INTEL_DISPLAY_MEMBER_STATIC_ASSERT(struct drm_i915_private, drm, display);
>+
> static struct drm_i915_private *
> i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
> {
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index 03e497d2081e..6e159bb8ad2f 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -174,6 +174,7 @@ struct i915_selftest_stash {
> struct drm_i915_private {
> 	struct drm_device drm;
>
>+	/* display device data, must be placed after drm device member */
> 	struct intel_display *display;
>
> 	/* FIXME: Device release actions should all be moved to drmm_ */
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>index 19e691fccf8c..5f4044e63185 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -13,6 +13,7 @@
> #include <drm/drm_drv.h>
> #include <drm/drm_managed.h>
> #include <drm/drm_probe_helper.h>
>+#include <drm/intel/display_member.h>
> #include <uapi/drm/xe_drm.h>
>
> #include "soc/intel_dram.h"
>@@ -35,6 +36,9 @@
> #include "skl_watermark.h"
> #include "xe_module.h"
>
>+/* Ensure drm and display members are placed properly. */
>+INTEL_DISPLAY_MEMBER_STATIC_ASSERT(struct xe_device, drm, display);
>+
> /* Xe device functions */
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a6c361db11d9..53264b2bb832 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -217,6 +217,11 @@ struct xe_device {
> 	/** @drm: drm device */
> 	struct drm_device drm;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>+	/** @display: display device data, must be placed after drm device member */
>+	struct intel_display *display;
>+#endif
>+
> 	/** @devcoredump: device coredump */
> 	struct xe_devcoredump devcoredump;
>
>@@ -617,8 +622,6 @@ struct xe_device {
> 	 * drm_i915_private during build. After cleanup these should go away,
> 	 * migrating to the right sub-structs
> 	 */
>-	struct intel_display *display;
>-
> 	const struct dram_info *dram_info;
>
> 	/*
>diff --git a/include/drm/intel/display_member.h b/include/drm/intel/display_member.h
>new file mode 100644
>index 000000000000..0319ea560b60
>--- /dev/null
>+++ b/include/drm/intel/display_member.h
>@@ -0,0 +1,42 @@
>+/* SPDX-License-Identifier: MIT */
>+/* Copyright © 2025 Intel Corporation */
>+
>+#ifndef __DRM_INTEL_DISPLAY_H__
>+#define __DRM_INTEL_DISPLAY_H__
>+
>+#include <linux/build_bug.h>
>+#include <linux/stddef.h>
>+#include <linux/stringify.h>
>+
>+#include <drm/drm_device.h>
>+
>+struct intel_display;
>+
>+/*
>+ * A dummy device struct to define the relative offsets of drm and display
>+ * members. With the members identically placed in struct drm_i915_private and
>+ * struct xe_device, this allows figuring out the struct intel_display pointer
>+ * without the definition of either driver specific structure.
>+ */
>+struct __intel_generic_device {
>+	struct drm_device drm;
>+	struct intel_display *display;
>+};
>+
>+/**
>+ * INTEL_DISPLAY_MEMBER_STATIC_ASSERT() - ensure correct placing of drm and display members
>+ * @type: The struct to check
>+ * @drm_member: Name of the struct drm_device member
>+ * @display_member: Name of the struct intel_display * member.
>+ *
>+ * Use this static assert macro to ensure the struct drm_i915_private and struct
>+ * xe_device struct drm_device and struct intel_display * members are at the
>+ * same relative offsets.
>+ */
>+#define INTEL_DISPLAY_MEMBER_STATIC_ASSERT(type, drm_member, display_member) \
>+	static_assert( \
>+		offsetof(struct __intel_generic_device, display) - offsetof(struct __intel_generic_device, drm) == \
>+		offsetof(type, display_member) - offsetof(type, drm_member), \
>+		__stringify(type) " " __stringify(drm_member) " and " __stringify(display_member) " members at invalid offsets")
>+
>+#endif
>-- 
>2.47.3
>
