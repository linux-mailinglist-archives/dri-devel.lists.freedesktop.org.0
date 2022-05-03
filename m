Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D903D517F98
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A86310E93B;
	Tue,  3 May 2022 08:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736F10E93B;
 Tue,  3 May 2022 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651565981; x=1683101981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1v3Gr74NdhaAotOPjqR08a7OGoKMmanW36HXJsP3rVI=;
 b=EIfV29z9MiOySivMMpoXlqoJSxBcsmJr4Ra6Z4AZvniVjYwrVsNdm+eC
 /jL2HCE8MeceUmPz01qBEgtczstSb6H1UJzWJzAVf13GkMrxYCBJ4Lhl0
 9ZXir2+5wO5qSjZa+d6OZ+Gm/4fVQBAQlFKGkRkR5R3nkCjyLh8uJ3D9s
 Y+2/Nf10BRTmsHOlUMEk9oNAJAMhrtrXZyj0cNpEXppC9PTqfLEXH1lwp
 41hFi9iJi8Vg8yVCRg5DrDSvd2jLMdJYxp6y6TXU2lGx9wh/gI5Fie+3G
 vz0HQ3CPyWRG1juG4SUgc+9TNv+/Ro7PK0i735PE+0bGNKcpnrjLASM+A w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247973239"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="247973239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:19:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562126368"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO [10.213.236.211])
 ([10.213.236.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:19:39 -0700
Message-ID: <6ee8bdd0-15af-4967-5723-e86482f76072@linux.intel.com>
Date: Tue, 3 May 2022 09:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 11/11] drm/i915/pvc: read fuses for link copy
 engines
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-12-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220502163417.2635462-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/05/2022 17:34, Matt Roper wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> The new Link Copy engines in PVC may be fused off according to the
> mslice_mask. Each bit of the MEML3_EN_MASK we read from the
> GEN10_MIRROR_FUSE3 register disables a pair of link copy engines.
> 
> Bspec: 44483
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 28 +++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index c6e93db134b1..d10cdeff5072 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -686,6 +686,33 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>   	}
>   }
>   
> +static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_gt_info *info = &gt->info;
> +	unsigned long meml3_mask;
> +	u8 quad;

Any hidden reason u8 is the right type here and not unsigned long like bitops expect? (Yes I did notice GEN12_MAX_MSLICES only goes to 4 but generally u8 sucks.)

> +
> +	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
> +	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
> +
> +	/*
> +	 * Link Copy engines may be fused off according to meml3_mask. Each
> +	 * bit is a quad that houses 2 Link Copy and two Sub Copy engines.
> +	 */
> +	for_each_clear_bit(quad, &meml3_mask, GEN12_MAX_MSLICES) {
> +		intel_engine_mask_t mask = GENMASK(BCS1 + quad * 2 + 1,
> +						   BCS1 + quad * 2);

So internally we will be sure BCS1 to BCS9 are link copy engines? I mean enum names hardcoded/fixed to function. Should we have a comment to that effect somewhere? In intel_engine_types.h maybe?

> +
> +		if (mask & info->engine_mask) {
> +			drm_dbg(&i915->drm, "bcs%u fused off\n", quad * 2 + 1);
> +			drm_dbg(&i915->drm, "bcs%u fused off\n", quad * 2 + 2);

Bikeshed - I'd be tempted to decrease the amount of "quad * 2 + 1" by having a local variable.

   unsigned int instance = quad * 2 + 1;
   intel_engine_mask_t mask = GENMASK(_BCS(instance + 1), _BCS(instance));

Etc.

Regards,

Tvrtko

> +
> +			info->engine_mask &= ~mask;
> +		}
> +	}
> +}
> +
>   /*
>    * Determine which engines are fused off in our particular hardware.
>    * Note that we have a catch-22 situation where we need to be able to access
> @@ -768,6 +795,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>   	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
>   
>   	engine_mask_apply_compute_fuses(gt);
> +	engine_mask_apply_copy_fuses(gt);
>   
>   	return info->engine_mask;
>   }
