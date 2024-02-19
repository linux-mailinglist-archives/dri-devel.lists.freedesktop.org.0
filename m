Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17785A1BE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201CB10E308;
	Mon, 19 Feb 2024 11:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmRszKxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B77B10E2D9;
 Mon, 19 Feb 2024 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708341395; x=1739877395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fI/xuoTrzJOxWvDHx/Gdn2cdzI4ltJbKPX1loVrgIvw=;
 b=lmRszKxJKFZx3zzpc+N87TJjqmMfjVVwGcQUFT2eqZH9Q/nIoVKOLMb2
 7LaSbB6dIiyGAad/da16jkbFQhAYhO4WP4RtXjQgY8GYo++F34HjYPriQ
 WLheVeZiuW56SSUdvXowZNwRDj7pg/8JA+P4PgGGMK8UcTQUPJXnaJ7NF
 0ZhXBMUOuJXU5zHB6LEGrKLPCXYIJbY4WDngPBJi0CTNZD0Fny2jAzX/r
 NwluWmESyR1MrceW6Zs6rgGRBhjcUKSi7l8jO+WraBhzOPLyU8C2RqPQg
 bC4Ic6NIv+qgbxFyUFN4kBDMZj0wLaSZahpRSMGrsKd+lysWteG3JpbuV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2279451"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2279451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="35238332"
Received: from coldacre-mobl1.ger.corp.intel.com (HELO [10.213.215.68])
 ([10.213.215.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:16:31 -0800
Message-ID: <d61391f6-ff1d-4241-bd9e-2a3bee53c860@linux.intel.com>
Date: Mon, 19 Feb 2024 11:16:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240215135924.51705-3-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/02/2024 13:59, Andi Shyti wrote:
> Since CCS automatic load balancing is disabled, we will impose a
> fixed balancing policy that involves setting all the CCS engines
> to work together on the same load.
> 
> Simultaneously, the user will see only 1 CCS rather than the
> actual number. As of now, this change affects only DG2.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c      | 11 +++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>   drivers/gpu/drm/i915/i915_drv.h         | 17 +++++++++++++++++
>   drivers/gpu/drm/i915/i915_query.c       |  5 +++--
>   4 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..e19df4ef47f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
>   	}
>   }
>   
> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> +}
> +
>   int intel_gt_init_hw(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>   
>   	intel_gt_init_swizzling(gt);
>   
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);
> +
>   	/*
>   	 * At least 830 can leave some of the unused rings
>   	 * "active" (ie. head != tail) after resume which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf709f6c05ae..c148113770ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1605,6 +1605,8 @@
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>   
> +#define XEHP_CCS_MODE                          _MMIO(0x14804)
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN12_HECI_2				(30)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e81b3b2858ac..0853ffd3cb8d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -396,6 +396,23 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>   	     (engine__); \
>   	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>   
> +/*
> + * Exclude unavailable engines.
> + *
> + * Only the first CCS engine is utilized due to the disabling of CCS auto load
> + * balancing. As a result, all CCS engines operate collectively, functioning
> + * essentially as a single CCS engine, hence the count of active CCS engines is
> + * considered '1'.
> + * Currently, this applies to platforms with more than one CCS engine,
> + * specifically DG2.
> + */
> +#define for_each_available_uabi_engine(engine__, i915__) \
> +	for_each_uabi_engine(engine__, i915__) \
> +		if ((IS_DG2(i915__)) && \
> +		    ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
> +		    ((engine__)->uabi_instance)) { } \
> +		else
> +

If you don't want userspace to see some engines, just don't add them to 
the uabi list in intel_engines_driver_register or thereabouts?

Similar as we do for gsc which uses I915_NO_UABI_CLASS, although for ccs 
you can choose a different approach, whatever is more elegant.

That is also needed for i915->engine_uabi_class_count to be right, so 
userspace stats which rely on it are correct.

Regards,

Tvrtko

>   #define INTEL_INFO(i915)	((i915)->__info)
>   #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
>   #define DRIVER_CAPS(i915)	(&(i915)->caps)
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index fa3e937ed3f5..2d41bda626a6 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>   	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>   }
>   
> +
>   static int
>   query_engine_info(struct drm_i915_private *i915,
>   		  struct drm_i915_query_item *query_item)
> @@ -140,7 +141,7 @@ query_engine_info(struct drm_i915_private *i915,
>   	if (query_item->flags)
>   		return -EINVAL;
>   
> -	for_each_uabi_engine(engine, i915)
> +	for_each_available_uabi_engine(engine, i915)
>   		num_uabi_engines++;
>   
>   	len = struct_size(query_ptr, engines, num_uabi_engines);
> @@ -155,7 +156,7 @@ query_engine_info(struct drm_i915_private *i915,
>   
>   	info_ptr = &query_ptr->engines[0];
>   
> -	for_each_uabi_engine(engine, i915) {
> +	for_each_available_uabi_engine(engine, i915) {
>   		info.engine.engine_class = engine->uabi_class;
>   		info.engine.engine_instance = engine->uabi_instance;
>   		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
