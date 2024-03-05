Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394308729B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 22:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95E112D02;
	Tue,  5 Mar 2024 21:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4OpxBmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935A8112D02;
 Tue,  5 Mar 2024 21:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709675546; x=1741211546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ati3puPWPcSzePZYGKLK60wTrp4P5VtzSGIG6cU2ezU=;
 b=M4OpxBmIA0bNkrQ5P6hpI1umdY/ibwkyO0DWXVAumyVPk60nQ8w6EI03
 dN8hzFCSV/iZ0sptG6gQqZZqVPPJPKIE9Qw8YeNaaOdqzZD9lyXKca3gD
 APQBBMr6DVfiKCxvjPThVMnZuCUhqxFywFIKdlH9JnJqEHWjxeMDvVVa4
 muB1KSic327mk6QNa8/pWsb/1L94+tyq3XpwbRrBCHGpmRLRcojB0pJgm
 nGMbhJL4lxrzR1P8ppow779zpom2KbAEJu0O81XhjrUd85PPfCrBhhnDP
 FNLB/XqyqouqI5LFQYHuOf1eo+Cho+UsaLWZAv5/U11p1WT83bKbPWI6B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15662279"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="15662279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 13:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14219644"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 13:52:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 13:52:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 13:52:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 13:52:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6WWEoXwPXhWYA1OZh/MIdtHqV+vCYcaCvKc/4ipR3n6bZll/9qaxPPSPyklQMo/1LE7GpZ0JZJeuARWN4Amz7EdeF2utoceuwnXwwF+E3hwaAAv3A6S0eCDFhKaz5an3eNlMh1nckybtsPrmin1qBvRTq459e+glfGkMrs4q1Xyj4n2SWu87PMIM48FOvuhoziZctiCqyMLCcdGB6ii18w0bynseiTvzhjXzpEFMOpYq/GAEPUCVP4LNkuTxVHxbi8BeWcTv9pSTHYx6rvgfzN70INDDg2zzUrJSPV8TS8Z1HCiy9fLZBsOuxiZ7sUAbalm6FXQYE/YpW3EEJtJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw/vBqDpnSnXuf0Jz2Q4MHybP6ftYmuA5RqCL8Scm6g=;
 b=hp1zBLnPYSl6ArUMTzbGn+yqtsH+g1stw4dHeCREOn9xFscDIncskWj7/uOcN+Guu0OHDwRCNPSVnT3YtnodFp7nlvQjc5WIphaR95IyaBuYu4O0rD4hSgejlAzcrUw+Cf/vNh37T+qCWOYDXep/FtuAjrdT6XLF6sRY6gD27Dry+5AOm7W9tW3qipc+bhCfuqI0Ilo+kgbSPP6uxODJ0Nk7HOf1BTEbVlfqoIn75mg/I8DSf1IzKS4mUhsNIWXaswtelODSeMzEZ4BEtEyUb5Dqp8+FL3csT/CoJTpVnmmpVxvGx8m4XcyL5c99WE26y3J9Q2sNCv1XA2bAjKn23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 21:52:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 21:52:21 +0000
Date: Tue, 5 Mar 2024 13:52:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 2/4] drm/i915/gt: Do not exposed fused off engines.
Message-ID: <20240305215218.GY718896@mdroper-desk1.amr.corp.intel.com>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
 <20240229232859.70058-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240229232859.70058-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 452be654-42ea-41f4-3554-08dc3d5e88e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgB8nu/n/HnwLDRmQV/VNVOm/LXDzd8fAald/IJDiDqvlns9edox9AAFIE59PLLW6IRqhkZH1ZOJynfc0hmyM2/knaW1CLXaA67tLSsZYrEc/MnXTWelgX88mSQxyUz9E5dk8Pk43ZtOxo63dMbAkHmJx4MTtMFOSjWPHpgBejpS8fcyzE9a2l/1Y+TYl1/Vhs1y/HRbz3AqCdUQmLIg6PfHsgChmzcNk0wO4t37/dM00qAU1rzHYBOQ88VXDtEM9LhiYV+LzQ4UHJnQcgLXJ+FVjg+SKOpag1qoQZwXcW1BfKf/NKktsRYtlYrV9GwLLMG5IYBPznW4/XB+Cl0lSxi3/vl0+bi1qrUMF55GnoqpTXFhqFOptDpCywDJI13Rvu7I/Ygwyhl57d0/JHLAv8mBPPNtLCn6T6aIwnrheoh6N7TXX2qZ03ZpFbx5N08G9nywASpYRS+rmF6bajc46F5YWFEHKPpZfvHOeUXPHLpYQFqqLFHpqtaDJwmM18YyAroKRJKLJ1G1UWQB01jTLzVjxVa9QgRpVBnIAM5JkK/RfoZJeBQkMRDByFiB29lGLwHP7tth05HY8Ge3JWQLJoCOn5RVS94r9IZeI9f/p8wMjvvJAtVCsiCi+A8xzVH6yLLGqQk1QV7k2owE/9gdH8IW2uO3fOK/Yqo4NKB81uM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wy+BS2C/FjsKsqLEQz815qX80oc+OoBFa3b3MDUjpyXZYq3mjapbJxJxvCRU?=
 =?us-ascii?Q?fnAq3W8A5wpGggu0FnDg3wMX5pGAZR1N2xyUWVI/+dKMWpYIppnnrgdbgYYr?=
 =?us-ascii?Q?vbZB02pICW5RVOe1UthsWtoQjsrvNBoumVTqCOQ88jT13kS3MEHEoxk1/WdN?=
 =?us-ascii?Q?+O9w7y/vnZaaUghG2wzHhfofB1k03//LerwW3GlL6bjkRXOS1H34vJJyFOrk?=
 =?us-ascii?Q?Hk7rpedIgrVHERAoGoM6ryOy4I0BXV2lx/LiSjSQcUnVBw/EN3hPLCe7I1UU?=
 =?us-ascii?Q?EmmR3C/20xScLJXmHohZl3ifcoVSY3aY8Qy0UJejIpw9dt+krO8deRf8jHtC?=
 =?us-ascii?Q?DCvQ/ujpTMEB+ehFRWQ6NxlvMkEqGId70bXTe6bxSTVxzz1gD6jXHKEaA87d?=
 =?us-ascii?Q?gLqLpQda4TOSYT/rgdhH5/YaOYdYnLCBd4zaOAZ2Pvj1GsvznkPQnEtZQ5hG?=
 =?us-ascii?Q?iNCJ6EGGRq7z92ZwLyhc0cT83AJgDDBk67D5hRjcK0AqSaObtRpwq01amf0q?=
 =?us-ascii?Q?BZ3WqllnbFy674OtMXlT6oZabo2CtiqULe7FlyEaMmVp4HaPEDcVP7EOb8hK?=
 =?us-ascii?Q?uKa15WbRHRLK3qz77hrX/snvda2Z1ZqLnPalTpUVFcsTnDCLX30q4KpwpbHR?=
 =?us-ascii?Q?wEzhC2l4VhD2Knk5UkaXeIgLJrfdBDp11VPPPc1iifqf1RKMEXKqtFe9Lnj2?=
 =?us-ascii?Q?TzRT7qZ7nZsbhD9dMRzQonP6znX1sbfrcizkKZgW5HIxLir0Nc89VIzPZA6D?=
 =?us-ascii?Q?C47a3vkwg3GQ3KNLkeOZSIZWTQg8tYLOP02gGKIHq+MbdvAuAvgdCdy4Di2U?=
 =?us-ascii?Q?T7V8x9qBur5rw5l1xFd/Mmw/MKPej8Qv+s/ZKptMNmkMt+7e3AyM+zLRQYVu?=
 =?us-ascii?Q?sDkNDHjBSlH2lJtSCJ0rlZPl75ybZZ3nl612J7RLlQbRVHqPidfDPSz8FfHW?=
 =?us-ascii?Q?W3HXtWGqee+t3LziBDDXZ27MMd9VlM2Jc4uQ4fjw7xNu1JPrW7r7XiD5CT9i?=
 =?us-ascii?Q?4bG2pqkGZ6ZFjc2Q5h1TVxsMmV7ZvVR6paAr1vOfZwi/yGgO8LOuY2wC65BT?=
 =?us-ascii?Q?N13NQST5cRBQlKCGw1qkyMqCaQ6tqGaoBNtMsTLu6ylbLbGyC1MkEt/2u31c?=
 =?us-ascii?Q?bQtka1gMxfF7Whuwlx/B+KmU5xd5t/x+IOjFuhjn8mITcfc4M5M4PJHRAHht?=
 =?us-ascii?Q?G7y+K0F7DL5vZu4fmE7OB0GBjwkZgdJID6KbNAlCgi6apr3jWsdFyYD9xtvC?=
 =?us-ascii?Q?60tU/anSB0A9qvSc/t2XeGmlk8epUAgL6n9kTkplHNsVeassRYoJ8kLZ0521?=
 =?us-ascii?Q?QdulCdJCg6v8X3cS1wtgIRyXrT62hLwiBCuSaKbx1ulGpRtf12VNx6PMcoXd?=
 =?us-ascii?Q?ofcC+4CcA0I1P1LBDvCzGWxEDac5ycvxcOO6r+Pkr5CLGMUIsWTDwld4yXN6?=
 =?us-ascii?Q?SBmRzoXTi2nqSzQqYhbGssB4HnIeT6HGqLoBgslAVmbdo1MjdnkpAv7/LJWg?=
 =?us-ascii?Q?kasCaVu2AhjRb7hnXCVQdaAqiMwnmM1j/OeNz9ZqecxNzR29KKDWjt0NiO/7?=
 =?us-ascii?Q?xFx9V6HqQ6dbGseLSw4qBjg7px5ehVLZ+uh/hm6CKTyBKSgn9M5/aXzfUXf/?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 452be654-42ea-41f4-3554-08dc3d5e88e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 21:52:21.3729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrNMNbBTedrfSB9NY+onmiyh38wOTgxwSpUY2Uze1FJROxPnU/ytgbMmqcJ9ULsLAXOtGPIEQDUzXAfP2cFHUuxUQRHeW3L1NHbmJdv2BEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

On Fri, Mar 01, 2024 at 12:28:57AM +0100, Andi Shyti wrote:
> Some of the CCS engines are disabled. They should not be listed
> in the uabi_engine list, that is the list of engines that the
> user can see.

Fused off engines already aren't visible to userspace (or to the kernel
for that matter).  For CCS engines engine_mask_apply_compute_fuses()
removes the fused off engines from the runtime engine mask; other engine
types are handled in similar functions.  Any engine that doesn't appear
in the filtered down engine_mask won't even have a 'struct
intel_engine_cs' allocated for it.


Matt

> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Requires: 4e4f77d74878 ("drm/i915/gt: Refactor uabi engine class/instance list creation")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index cf8f24ad88f6..ec5bcd1c1ec4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -244,6 +244,18 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
>  			continue;
>  
> +		/*
> +		 * If the CCS engine is fused off, the corresponding bit
> +		 * in the engine mask is disabled. Do not expose it
> +		 * to the user.
> +		 *
> +		 * By default at least one engine is enabled (check
> +		 * the engine_mask_apply_compute_fuses() function.
> +		 */
> +		if (!(engine->gt->info.engine_mask &
> +		      BIT(_CCS(engine->uabi_instance))))
> +			continue;
> +
>  		GEM_BUG_ON(uabi_class >=
>  			   ARRAY_SIZE(i915->engine_uabi_class_count));
>  		i915->engine_uabi_class_count[uabi_class]++;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
