Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C9BC6D19
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35DD10E09A;
	Wed,  8 Oct 2025 22:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTzZD0ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3954310E094;
 Wed,  8 Oct 2025 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963692; x=1791499692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Tgo9dKu3hvaZqBih8gvtktvddOgn9b0+qPVyfz/XaZo=;
 b=PTzZD0kiYZA+nPKt8NX1LBUCW68oEANuuj+B2RjEGvlkaKzBQku7jIZ1
 IPceHNNtjHrYq9Ucq0RBVAcuRzEqoPWuFcL6WLKstBeL+abVB8VuJnvqR
 2vaFT5UC9KrMUcWgI4VVA9viBGdJDCoYHOIOR7RySeWE5iU9aaIig6nlE
 elBZyWhg2I0FMysbaVHZWQnO9XjSGaO1vLgDvo6tcIusW3+nxuqbt6hkC
 COd40dHss8uQNBDDd75XcJmsWd1vSitdJ6DJ8UM6m5pRq8tcAJO96xxj6
 QfompeytEK9OpZbUY7BNMOjPNZpH7DX0xoW13fnW/44UPkt4/DoefBQpc A==;
X-CSE-ConnectionGUID: b8b33UA9SVa6MiSrGM34Ig==
X-CSE-MsgGUID: o1F70M9kS2W1yK86WD7umQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65994703"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65994703"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:48:12 -0700
X-CSE-ConnectionGUID: bb7GNhVCRhu2OLMOurpO0w==
X-CSE-MsgGUID: r/M0wU3pR2KzZl4FB52qnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="211501791"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:48:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:48:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:48:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8OT+gVAamI0rcif9H3Veae9b9jAw7SNT0p06Yhv+q5L0j56OpRHK1aRnFwx+SKfvpn3TDKruwaC1SIvrrpQPma6aAuc+aCjSjYwi9zR5b7gqxa1aUCeGhq+BQ/W5moaRGAZCOXfoRh25jJtY//RJYj88SeNqNSwSR2xwPw2q90NUcdN9XYkqLRTNdTfXIbZbN1Br+lNHWvMoQBeYz/jxkdsrNRZ8RCCrXuL98z8fkSIVibZ0Iatwe7zUGr/+WJysP1y28nkQIj7bDOYYkR7OB/t8eGUzByYqOGhq4s96BYyI0CF3irWVn65uxVl8I+RpllBtX/3LqJfLajqSN3TEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boGtKx0K/RL5Ptr6D904Kigv9aNfW6aJpi+ejnvC+GE=;
 b=uIMV1ZLg3XfsGPJvjHPWkd0LUNfUcHHBAIY4zA4gRsDgpKqL1bxHzpd7gLASVZVN0HHhxqXX/B0qRoua6WFsSm/RIAyeOjMNeT9P7o/VGGKbVmJnZRCOX/p5M6mqi2mqEIItvOv8rkqi7ZfvlHVxInBL+prf8Gbz8nEqfZKyGS1pWzUY30DIQF0KO6Q2OXPCTap1/tYZ5wrd2BHPvOS+GenWN08ASyZBYoysMOKa5YH4bM/rJzqMgC0DKh6p9oB/v9H7gtgYwEQlhwdfdwVMzbJLEobgvoLLJgzTc8HGLW83DWAopOhPFbPs3T6Ror8KUeDV8LvWAHh9M9/mHx7dbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 22:48:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:48:03 +0000
Date: Wed, 8 Oct 2025 15:48:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>
Subject: Re: [PATCH 07/28] drm/sched: Free all finished jobs at once
Message-ID: <aObqIN12PwYH5YeO@lstrano-desk.jf.intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008085359.52404-8-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c80210e-acdd-490b-0a8c-08de06bcbd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bhv2xJOmv6ylN266hrJ64ixDQOE6/9PztY0MUX+cAGTqHcfYNByrmMn85k?=
 =?iso-8859-1?Q?9mj+3v+LxUl61JEVwgCIMb6w3VGp2KvYoLrQyBPHf98Hi+8LqlBrNZEV0g?=
 =?iso-8859-1?Q?vr0uTzcFIL6R4U09z3kiWjnCCqC7wWn1oXliZMV08TgcsG6A3UNWQzCb+4?=
 =?iso-8859-1?Q?Cvoi6wE0ywved/KHc2GBcGivWR3t+17izU3ig35ylVQQRWMc+9OzRICNkw?=
 =?iso-8859-1?Q?pjRl0PN3H1FflGEkVqr/zHVelSw3VK4nij8JjXpWmY8XxtGPW6dTPv+clU?=
 =?iso-8859-1?Q?8Q89vibLscG77oFYctbgXL7YrQmQC6jN+Rm4kCUT/IIb9+9siOYoie1EK2?=
 =?iso-8859-1?Q?5nmGMcwlcMqqNMLcJ55uZRVHi7RVIuqF8ppbLK18T/2CdrtEJWAyLbYnRQ?=
 =?iso-8859-1?Q?kYhVnaED9hlvWvrEKGukROdYXhWieUSn7gBziwrigZDCEJDTN9Ah4F+5K9?=
 =?iso-8859-1?Q?Gec6/Xlz8hF9ZBlfks5YjRNMa4B2KFfYa2XrNMpase9oEP/jCf5CuTtddm?=
 =?iso-8859-1?Q?J4fbPqWFKzzAcIqy3xzZM0ib+5xz3QmGsfrko1hEOaV/Or535GZiptaddS?=
 =?iso-8859-1?Q?SoBZd23ReLPBtfsNmVI5D0ln0YnSRCvN+u2jjEW+vtWYmgCkpNP6Ff0HNP?=
 =?iso-8859-1?Q?JvZTbpUEwodqt8fohKc1xeTbwRq8m+6zNfEhTjSHAeQBM4mgtaAVUhDhm4?=
 =?iso-8859-1?Q?PHhXf0VtNu+vVaTBaSXS1DUV5xk0VYND0fwYjP0WlcUZBTdmFE7LEEOede?=
 =?iso-8859-1?Q?0T37Pn/xuVt99ND/5tnOYmlmQBV64pRlDfruhTxITq93SW0Z7aMTJ7M2G3?=
 =?iso-8859-1?Q?RZeobBjzQys/BNBR17RBCrZzze8/NQkPPqyLgDBfpGtapE4o+FPy5gW36F?=
 =?iso-8859-1?Q?IuNkdbSfr/ESw34zmClCu4IxJEc4vKZQn2wE0JSVXZfKIXGACtJHTLCP52?=
 =?iso-8859-1?Q?V1DPYdaCJcrwz0IklirUdV1bLTIrJH1Aw21oPTf4ia5dwRNxWEo5gc0qLA?=
 =?iso-8859-1?Q?gV4KyqupFVeogTbn4w9rR1g/6FhB3o2dq8XROGzk/mx0FW5OS5GLJTAbzh?=
 =?iso-8859-1?Q?nRR7v+HtFZk8wgdpFDh+iEQazlLxplqR5KMQUV1YwXtVYpejVouU2/taMO?=
 =?iso-8859-1?Q?Z0uBTumxzXgBv5pNc/7fbylzfK0111F3RMSOfsHo6o1cMS2FyRTPnW+MaY?=
 =?iso-8859-1?Q?6XlPa0+vJeAg7j2iPXmIgewQmvkJVpwJYE9fr4IW7EVpSv76ufKumNG3OI?=
 =?iso-8859-1?Q?RGFXDuHEOtsHxsHhlrifiFaE+bJQ85Rzud+wBr7s/WhrRV7BZ0RVHsJ+tN?=
 =?iso-8859-1?Q?A+88hcRAHldDR8Fwq83lmZq2jcv9DKA9OZbCi1cS9E2LFPGl1jQdz4tS/C?=
 =?iso-8859-1?Q?0HSmikvfK0CZccunpyJ2GQ+cDsSghg0q8SNWF1sMEHMeW0KIya2/OeTzEi?=
 =?iso-8859-1?Q?JD3qvb2CQzMRWhJroJVx/9wo/casQcJ+y3udIELLO9j9mb6FWRNW4cWXG/?=
 =?iso-8859-1?Q?j50tuzh2y9g8A/OwBMgm+V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GFVhSwpcZWSnTyYn0WBzYw8uGOEQ8yytwj5haSyIRcZGWa+RicoM2mutEA?=
 =?iso-8859-1?Q?G9sb3V1388v1LxYFabbVsHkNgiXUoG+/AsFV9f60mW2+MintYGmaVh3EnI?=
 =?iso-8859-1?Q?VHoim84LsDhMYaDdmGaOI+pdAcCluCDDFoWxhphL3tngzOI5YbOtsd1U0Y?=
 =?iso-8859-1?Q?VED9U/9S7rZh5NJPIP5q2ObTH0eFMHveiGQh5UTigOvhFs1HJ/kU0d4Dz4?=
 =?iso-8859-1?Q?14TGHRncl40Kz48YSHDDsp3Oi1Pd6AkydNcuEYyG6CkDxzve3rfQ4ieHjQ?=
 =?iso-8859-1?Q?OitvJ1qZGxGOyFL7oEDAvMQQChZhIydmoFv/e5F5Oe2I22pFiEiGWsu1bT?=
 =?iso-8859-1?Q?zpLEaY+TBpOqVUM89J79mQJH2/VB7ai+Yzb9LiwKnGtTPpKOy/S45F0dak?=
 =?iso-8859-1?Q?sAUipuFbadfE6Wmbw7bchmrRyFH9jo9UYNE/3Te8iKaW2w/c0mqctbAEBb?=
 =?iso-8859-1?Q?py261cPjAxyj91P2zhcpDxAFTWReIgKKH38y1BwcY2YBfWrDWtEKAbG+yL?=
 =?iso-8859-1?Q?dB7DOXMyETgf8aeWyXGub3KB6WbtBYl727EJimOIO3WaYG35kMsQoa3H9X?=
 =?iso-8859-1?Q?9tTR6pF1rgCwWaSWzPiZA+IXF1FcE42MManZMPLAyDUn59B+uVjCu4+fGp?=
 =?iso-8859-1?Q?uKqHNYFg4hYuPURZ3hm9dqBjAtWDTlrnvq2KY3KdaXwFDzT1W1308I9kqs?=
 =?iso-8859-1?Q?stnkbqsnZSjBtZb0FUNiv7X6PyWD+Tw/vtYrDhLj33vkoVYFAc4/yVOvij?=
 =?iso-8859-1?Q?hDCKlt2zY94d5gsQXqSKpz6M8jarUASNbDBpUvlexasf79QXXrsVRa50Jl?=
 =?iso-8859-1?Q?8pF7mAGel0KfUjBJmqJHeq81jtGLKMOMitLaMD8i0QJ4dHcA53j2+yotXA?=
 =?iso-8859-1?Q?84wBKN7btndX9w+WRasa7nCyxZd4trRVaoChb52PtgeUCZ+e+oINRXEB56?=
 =?iso-8859-1?Q?+oPTsO8+9VHlwDCNClOwMRJ+DIGFFssksqXwONRFXAUJfnsjc68oVMyRp2?=
 =?iso-8859-1?Q?rbp5+BobRf9UMGE6VOdjAYaHBgqQMkRdKpdfGzCeqUDAlxxS3DuNKXF4Lz?=
 =?iso-8859-1?Q?QjVZ/APPnmnYmMqcu92Pzk9P0u7BXPIbvdX3lAUIEVLiSgYq/nRRtrgEHO?=
 =?iso-8859-1?Q?GnVo7iCjyAx2RxJT9isP1s64gtibDLSKmFaRKy76KqGoU+Zxa0ni8UJEFx?=
 =?iso-8859-1?Q?JRrIvDkpwsLZBwwJAeDkw+F52Cf6i7JsSssHkZADzhi33ZNqr/H/VwCqXa?=
 =?iso-8859-1?Q?PXNaOYMRqnS0+l1JGPZ/NDls8sJKiE8yQlVsibKTiQqqTdmMZzDru3oVND?=
 =?iso-8859-1?Q?oRWCCv4zTF4JXEJt/YgwihQs0PaGMiABCB3GpXfWpDQF2XyTlYR2PtKqEb?=
 =?iso-8859-1?Q?M6YOQr/ouKXJpA/jhrYVpiNQL4kq2187HdLOLSW4VLlHFtnw41ypFDIkLx?=
 =?iso-8859-1?Q?0xVZDtFr88c/3BO4H6i2UNtYGcluvyNQCz/WoPn08JSWYeFDEjU5e9LxYh?=
 =?iso-8859-1?Q?cmF9MlNlB7oEpaI9gAAnEJ+StG5BTxHV8WL9o5gz/IqBeHxMMZMYCfKI8O?=
 =?iso-8859-1?Q?1sqq6OAAgVfh1okdG85B07weLYn73B7tErPpEac34VIG6EypGd2MZXPRyb?=
 =?iso-8859-1?Q?PMe44lNueYxJaC8K6bfHB2T3F/JQ92L0kE/92THGbQ4qnWA9uRPhRhvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c80210e-acdd-490b-0a8c-08de06bcbd89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:48:03.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+xQZ8N1g37jp6G+RnAdIVWslqxfZkB3DomadsPHhxJzynVH7JMbzn8CJ1E0pU+WhI0UuT5J4ZWm/C7L9ypwGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Wed, Oct 08, 2025 at 09:53:38AM +0100, Tvrtko Ursulin wrote:
> To implement fair scheduling we will need as accurate as possible view
> into per entity GPU time utilisation. Because sched fence execution time
> are only adjusted for accuracy in the free worker we need to process
> completed jobs as soon as possible so the metric is most up to date when
> view from the submission side of things.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 41bfee6b1777..41e076fdcb0d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -906,7 +906,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>   *
>   * @sched: scheduler instance
> - * @have_more: are there more finished jobs on the list
>   *
>   * Informs the caller through @have_more whether there are more finished jobs
>   * besides the returned one.
> @@ -915,7 +914,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   * ready for it to be destroyed.
>   */
>  static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>  {
>  	struct drm_sched_job *job, *next;
>  
> @@ -930,7 +929,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>  		/* cancel this job's TO timer */
>  		cancel_delayed_work(&sched->work_tdr);
>  
> -		*have_more = false;
>  		next = list_first_entry_or_null(&sched->pending_list,
>  						typeof(*next), list);
>  		if (next) {
> @@ -940,8 +938,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>  				next->s_fence->scheduled.timestamp =
>  					dma_fence_timestamp(&job->s_fence->finished);
>  
> -			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
> -
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -1000,14 +996,9 @@ static void drm_sched_free_job_work(struct work_struct *w)
>  	struct drm_gpu_scheduler *sched =
>  		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *job;
> -	bool have_more;
>  
> -	job = drm_sched_get_finished_job(sched, &have_more);
> -	if (job) {
> +	while ((job = drm_sched_get_finished_job(sched)))
>  		sched->ops->free_job(job);
> -		if (have_more)
> -			drm_sched_run_free_queue(sched);
> -	}
>  
>  	drm_sched_run_job_queue(sched);
>  }
> -- 
> 2.48.0
> 
