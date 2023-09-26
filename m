Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1C7AF636
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 00:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553910E44C;
	Tue, 26 Sep 2023 22:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EC910E448;
 Tue, 26 Sep 2023 22:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695766518; x=1727302518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jYE3RPNqRlbKksdYmuopiPfI2KKSwlAWx7wbYQAElMw=;
 b=ny+zd09+Y7JQtfzPYuvmis1tkLHGF8c7PhZdM2fDSqtZkPKk0MTSdBiw
 nRGV2WDRGrNdLwAoiHpcwAi3diC7a2eem0IC8Ve8usiHbXhr3u7Vv60Ol
 jzk/WBdEatIt12GDbQIW4VD1CMagpAPCHoF9R/x26Uwmat5UNbrRg0X05
 YMn73BoVJR2GN/AltO7FvlH04PkVPWw4MA9rlcRCvHbOcnSgtxpOc2sTQ
 89Vhc5p4Oyj/badR8C/pGgcPG7MO5o9a4gY3tFf6nkYmkourvisIxEjCF
 E7JIJXgCeT22jjqwSLb72Y1cCddS8q45CRCFwCMZFkv1W+iIulWo/lSMN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445809414"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="445809414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="308760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:15:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:15:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:15:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpTv5HHKyU6QA4zhVZwRjbYm40/VaMucGew1USmMnw8JQrulrSEnoUnCjgMdMnBIUdC3p2u2dZwci8AS+O8aIgMCSDrGRz8YD7RB7USAhqiDmUHaUY2lp3wAowtd7IIBsRlXFf5A7qe1GS7T7//Jo9gKK9ev7QjZoWiFafbz3Kb9iogQQEf9tJnXBLtOkQZFQ105XhvVNx4pkHPHQRrZHhbNm0x7Jchq1Dwi/IwmeaDFzL+sQLHkp2wwd7Bl6Dw7ELtcG6v8r7LWmNHnUUea9MHt0iejvCYzuyzCo2BNwPdBFCxajW8l974xhD3sGy/xb9HoxE4g4iwHtZyncMB33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=No3yt596in/DsbAb4GEf4RgyZf6bp2ahFkqKMH7jMdE=;
 b=TQDTXYTCNaFsxagisqfnaVFXS5mBfcRNfxY2QACbpu9AZJEmR5XyuuVaPhzh/byAN7yqoL8ifnHudNiRKqgumPlvdSwR0pI8lG+RyVXihVXJZsDrT7SU2f8uogrG/iTRCk1PUU/CqgNUzXjIUattjPuRUIz6y+CRyBguYxUXotsiRweNqWAPUn0tU8pS249MeLZMKohHvGPsmbuRucO6z24wyo2evG3USi1qX/4fUoDaWFRXD4fWXXzupqbC9PUuORcyOhYnibXHtY3m4ADtnNHZR3GsEUm2JDA2/cIw97U3O3uCIY3Il1NJKFzuLEwxueiXG2/stbfKXKg0Y0tzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 22:15:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:15:13 +0000
Date: Tue, 26 Sep 2023 15:15:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915/mtl: Skip MCR ops for ring fault register
Message-ID: <20230926221510.GL2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926215802.10822-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926215802.10822-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::47) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6043c0-b7ac-406f-8101-08dbbede0e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbVAbBBrEO+ZqD6iWvP1tL9VT6Sm3aan0gD4avmC+ZPjMgZ325BxXmmI5cQ9hMrcvJEBA0taKwMjxSlWOVept7Fa+eCsdA+/M12pd9kFsTUIW+IM6dM1+UZdy0pOSeEKTy83WV3Z8L08XFK1Qwb9t+bvEJ8y9u+GLO8cZuudMlTtm/j3+ezXDXv1b404l9+wg0BNygWD0tV2A++yqXCReDzlHQliDjbuGh5N6GMjlrp6gRQjB9esGyamPRkVzm3wkvrgFHJ19FUQmk1fCLI3/OPzdkBQ9LlGudeBxKJTS3qVG4rKWGfNy1gSZ3/mTxIqmZiYpN0+Q4KOuC/5BqKN+uByuowQosx01LZLkO5sNytljCevxjuhKr5sLNAky7gY0hn84y6mwHLSCzmbrGHNSftN0tKcYUD7wOkrTklcqJFhpTnZHySt6SQg+ZcDrCCYBJqslnbbGCrh8JDTAF589nppnE6evpYiK8EPu16/HbzCtwazIy54zLbi/neWnKh59XW7RwgMMB6atb4JucrSWEnZMiP/bMoGo3PsJI9zxr58ZgOjjmXidKlpuWlpdRxC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(38100700002)(4326008)(478600001)(6486002)(6506007)(33656002)(6512007)(8936002)(5660300002)(316002)(66556008)(2906002)(83380400001)(41300700001)(66946007)(6636002)(8676002)(66476007)(26005)(82960400001)(6862004)(86362001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFVMQIbTEgc0Ux2taajBjrgIZ8tACzQQ8Sti2D2q/tFzaJv+GjYb8OBey/Xg?=
 =?us-ascii?Q?vD1WdYsYFWjnbsGXiIGAsUX6vecucgxLwUHgi8yNEPxEoZXiJnRlLYvcENP/?=
 =?us-ascii?Q?9m9kOPKfuEQULKW+3eN2ZHiHuRHuTY8Rj2MxMo4IcaKo+/21qAMyOdw5wTqM?=
 =?us-ascii?Q?pYtzDMTQnuj428KZ2cM+iYE3/rFILawgBzVc3kpxLW9r+TnkGrER/GA0/wi5?=
 =?us-ascii?Q?B6PWPR2h0RgUQxxIQdn8ftg4EF5F1VIIXMvQZK6YziLztMICH8g8wrhpVLBO?=
 =?us-ascii?Q?rYh7daLimhzF5182KsSd3Ojvv6t6WCWlfO7dWwRkoAV24XZcS5NUtEBXIn3c?=
 =?us-ascii?Q?BZdlEq367m+vncnRl9klFe2eqhft71/5diL98N1UcPtT8W/osCAXUU5CmICx?=
 =?us-ascii?Q?RD/bId5DKSzXtcdbsDThK5edPMAi+Kg/vRgLbPHsaV/QM29ECjv9Fg8Vz/+z?=
 =?us-ascii?Q?qeB+QwAZ4AqXLzp5n4+UytORVHd1QU/bGzEKFOmVfkAIfb0NYV0RKOk+p6so?=
 =?us-ascii?Q?FP5xfrDInjaFDFjNlOQ4m1l0yJdSD4g0L1+9WHm4tvemkaHm076gU7pWTqwE?=
 =?us-ascii?Q?U2cd8vAoY2OpAcIz31hc40WmzC2ULVtlfv014NMpZsNZq1dIhD8wXsz3YHhn?=
 =?us-ascii?Q?cbTW0jxQyEyUzGpvQhtl5jcQRbv7ZitP7G1LlnikAcVbYQrjcRU0B1gE3+Hc?=
 =?us-ascii?Q?Y/EIDDi0e+qmt9XEXBp2jTGg19xp4e6HmwyJI1zyHLJJHPY1qquoTwHgvrM9?=
 =?us-ascii?Q?hESifV6VMXj82Qwr7Kye3y8yFEJI/xPEdsfgix+u95IqY3WRb1dDU6w+97FU?=
 =?us-ascii?Q?rR2UlaRMcbYYvNp6hsAvEwnRU4gRnCtRKYYmLv+59g1oHaMLMebpSvzl7jg9?=
 =?us-ascii?Q?v9Cp/ngFasKPDtHIhxqthX6NW7QJF75nrR4VEIcI8trkR0jSegVCgCER5DxE?=
 =?us-ascii?Q?O8dIjFg8w76/UqOfLzaZWGckEx4cDonOFkHKEZo96B3Xt5DZfbiMGC+vbtDP?=
 =?us-ascii?Q?tRjfHR1j3+ScTPTyj0wqe1rAJD4sARXx244J1KzJK39Xio+cA/+XtV8AaOKJ?=
 =?us-ascii?Q?VxUGIQbbgwLVhPBiwsRUqXrcpmlsd4Ra4hA5c76uldYMB26Gv8WJk/2DVVJh?=
 =?us-ascii?Q?XlQWnRPFv9rslkFzzHRwvvctK3AzDTQer6PFvMcNSZkEFpYa6jb9976lNG/H?=
 =?us-ascii?Q?6RD0Slj5V5vJCeqO4BZu5UmQaoGmNtt4J6HySniJReX1+3YT6gsvbGZSECHf?=
 =?us-ascii?Q?VTKkDFWs3sSGjo135EAepvYXKq5IN6mVizvY1xSvUFAPnjsE6d9qhxvZJCP2?=
 =?us-ascii?Q?JsRyZr5dSq8y5wqWZNc8kIqmY4dpU10seHN8jWN3IMmyzRrD1fzQhryj5HWY?=
 =?us-ascii?Q?+1VwxpZPSjX4XAscWvARm4mayAkdGYQ/kZKh5snizZaMQ5RzmzzvboD0Jgrj?=
 =?us-ascii?Q?Q/rgeoOWob4j2MtVEHn8SdoiW7eYMIdOuAEMAcNNymePW8x0TG1kmTUinW69?=
 =?us-ascii?Q?/fUdDwfwve1q5N6a5vSiQvCCWiiPE2kJroZDmBqolsj9r+9hc5TF/E5pUn6Y?=
 =?us-ascii?Q?FbmFfHaiSe30GoGr68y9cfEARtUNvH22oMBagLw8T8XabeGc42PcnZ1DDqdn?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6043c0-b7ac-406f-8101-08dbbede0e38
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:15:13.5034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymHfMov3apkbLK8O5NU4U1a28U7pHvLRYPdbM4eDQp84eEaWC1fFWzfif/Qm0ee623dRlUya85doJadsN1WIRZO9pwNJb+yld+B06thOiu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 11:58:02PM +0200, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c      | 13 ++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>  drivers/gpu/drm/i915/i915_gpu_error.c   | 10 +++++++++-
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 93062c35e072..430738607f61 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -262,10 +262,21 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>  				   I915_MASTER_ERROR_INTERRUPT);
>  	}
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * for media tile this ring fault register is not replicated

Nitpicks:  s/tile/gt/ and either write it as "For the media GT..."
(singular) or "For media GTs..." (plural).  Same with the other copy of
this comment farther down.

> +	 * so skip doing mcr ops on it.
> +	 */
> +	if (MEDIA_VER(i915) == 13 && gt->type == GT_MEDIA) {

I guess for now we should probably make this (and the one farther down)
a ">=" instead of "==" under the assumption future media versions will
do the same in case we get some kind of refresh platform down the road
with a slightly higher version number.

Aside from those minor tweaks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
> +				 RING_FAULT_VALID, 0);
> +		intel_uncore_posting_read(uncore,
> +					  XELPMP_RING_FAULT_REG);
> +
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>  		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
>  					   RING_FAULT_VALID, 0);
>  		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +
>  	} else if (GRAPHICS_VER(i915) >= 12) {
>  		intel_uncore_rmw(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID, 0);
>  		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cca4bac8f8b0..eecd0a87a647 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1084,6 +1084,7 @@
>  
>  #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
>  #define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
> +#define XELPMP_RING_FAULT_REG			_MMIO(0xcec4)
>  #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>  #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>  #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f4ebcfb70289..f0b691ea3a6e 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1234,7 +1234,15 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>  	if (GRAPHICS_VER(i915) >= 6) {
>  		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>  
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		/*
> +		 * for media tile this ring fault register is not replicated
> +		 * so skip doing mcr ops on it.
> +		 */
> +		if (MEDIA_VER(i915) == 13 && engine->gt->type == GT_MEDIA)
> +			ee->fault_reg = intel_uncore_read(engine->uncore,
> +							  XELPMP_RING_FAULT_REG);
> +
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>  			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
>  							      XEHP_RING_FAULT_REG);
>  		else if (GRAPHICS_VER(i915) >= 12)
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
