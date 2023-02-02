Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58F6876AC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 08:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0E710E471;
	Thu,  2 Feb 2023 07:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640610E47D;
 Thu,  2 Feb 2023 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675323829; x=1706859829;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AdwxkFx7q8DAk8HaQMDGEQmLMFwHPr7PtGHjdfRHXKE=;
 b=QdTewjXBl/479B3OSDZv+9XZfTJ2w887DqIgrpF3Fqi630u5sVLSbi+u
 ncWMvkC4vJP4z8g8ny02+N0kPaD8tttdf0P/gaVLVnzV8TbABtoYLghoU
 /gt9KNgtYmgekZRKSIyKymlkZgWOvwjJqbYwn5By02JRUwacRymPorucH
 t20/j7AGIWJ6CltNE4nB/NfrEdpSpxMa1OwP3qp+qY1sI+dOwTewGdR6k
 +BRGayvBYUpAnQnc7259efb5xEZkCLQ3ZCZ5/m5Sgz8SkB7hEk71jXUAK
 P+kqOYELPREqul8ytGEJeCiGccuG0TV90dK7LDhuCgyGqtSBqHx+JpEtf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328395482"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="328395482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 23:43:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697593269"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="697593269"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.221])
 ([10.213.4.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 23:43:46 -0800
Message-ID: <f575e344-e915-c85f-49cd-28fa426bcfd6@intel.com>
Date: Thu, 2 Feb 2023 08:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Consolidate TLB invalidation flow
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
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

On 01.02.2023 17:51, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> As the logic for selecting the register and corresponsing values grew, the
> code become a bit unsightly. Consolidate by storing the required values at
> engine init time in the engine itself, and by doing so minimise the amount
> of invariant platform and engine checks during each and every TLB
> invalidation.
> 
> v2:
>   * Fail engine probe if TLB invlidations registers are unknown.
> 
> v3:
>   * Rebase.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  96 +++++++++++++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 ++
>   drivers/gpu/drm/i915/gt/intel_gt.c           | 138 +++----------------
>   3 files changed, 133 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d4e29da74612..e430945743ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -9,6 +9,7 @@
>   
>   #include "gem/i915_gem_context.h"
>   #include "gem/i915_gem_internal.h"
> +#include "gt/intel_gt_print.h"
>   #include "gt/intel_gt_regs.h"
>   
>   #include "i915_cmd_parser.h"
> @@ -1143,12 +1144,107 @@ static int init_status_page(struct intel_engine_cs *engine)
>   	return ret;
>   }
>   
> +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> +{
> +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> +		[RENDER_CLASS].reg		= GEN8_RTCR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> +	};
> +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> +	};
> +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> +	};
> +	struct drm_i915_private *i915 = engine->i915;
> +	const union intel_engine_tlb_inv_reg *regs;
> +	union intel_engine_tlb_inv_reg reg;
> +	unsigned int class = engine->class;
> +	unsigned int num = 0;
> +	u32 val;
> +
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> +	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> +		regs = xehp_regs;
> +		num = ARRAY_SIZE(xehp_regs);
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> +		regs = gen12_regs;
> +		num = ARRAY_SIZE(gen12_regs);
> +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> +		regs = gen8_regs;
> +		num = ARRAY_SIZE(gen8_regs);
> +	} else if (GRAPHICS_VER(i915) < 8) {
> +		return 0;
> +	}
> +
> +	if (gt_WARN_ONCE(engine->gt, !num,
> +			 "Platform does not implement TLB invalidation!"))
> +		return -ENODEV;
> +
> +	if (gt_WARN_ON_ONCE(engine->gt,
> +			     class >= num ||
> +			     (!regs[class].reg.reg &&
> +			      !regs[class].mcr_reg.reg)))
> +		return -ERANGE;
> +
> +	reg = regs[class];
> +
> +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {

As selftest pointed out it should cover also gen 9-11.
Btw maybe it is worth to convert this pseudo array indexing to direct 
assignment:
if ((GRAPHICS_VER(i915) <= 11 && class == VIDEO_DECODE_CLASS && 
engine->instance == 1) {
	reg.reg = GEN8_M2TCR;
	val = 0;
}

Regards
Andrzej

> +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> +		val = 0;
> +	} else {
> +		val = engine->instance;
> +	}
> +
> +	val = BIT(val);
> +
> +	engine->tlb_inv.mcr = regs == xehp_regs;
> +	engine->tlb_inv.reg = reg;
> +	engine->tlb_inv.done = val;
> +
> +	if (GRAPHICS_VER(i915) >= 12 &&
> +	    (engine->class == VIDEO_DECODE_CLASS ||
> +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> +	     engine->class == COMPUTE_CLASS))
> +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> +	else
> +		engine->tlb_inv.request = val;
> +
> +	return 0;
> +}
> +
>   static int engine_setup_common(struct intel_engine_cs *engine)
>   {
>   	int err;
>   
>   	init_llist_head(&engine->barrier_tasks);
>   
> +	err = intel_engine_init_tlb_invalidation(engine);
> +	if (err)
> +		return err;
> +
>   	err = init_status_page(engine);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 4fd54fb8810f..8c661fe89314 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
>   	u64 start_gt_clk;
>   };
>   
> +union intel_engine_tlb_inv_reg {
> +	i915_reg_t	reg;
> +	i915_mcr_reg_t	mcr_reg;
> +};
> +
> +struct intel_engine_tlb_inv
> +{
> +	bool mcr;
> +	union intel_engine_tlb_inv_reg reg;
> +	u32 request;
> +	u32 done;
> +};
> +
>   struct intel_engine_cs {
>   	struct drm_i915_private *i915;
>   	struct intel_gt *gt;
> @@ -372,6 +385,8 @@ struct intel_engine_cs {
>   	u32 context_size;
>   	u32 mmio_base;
>   
> +	struct intel_engine_tlb_inv tlb_inv;
> +
>   	/*
>   	 * Some w/a require forcewake to be held (which prevents RC6) while
>   	 * a particular engine is active. If so, we set fw_domain to which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 001a7ec5b861..f7f271708fc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -982,35 +982,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>   	intel_sseu_dump(&info->sseu, p);
>   }
>   
> -struct reg_and_bit {
> -	union {
> -		i915_reg_t reg;
> -		i915_mcr_reg_t mcr_reg;
> -	};
> -	u32 bit;
> -};
> -
> -static struct reg_and_bit
> -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> -		const i915_reg_t *regs, const unsigned int num)
> -{
> -	const unsigned int class = engine->class;
> -	struct reg_and_bit rb = { };
> -
> -	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
> -		return rb;
> -
> -	rb.reg = regs[class];
> -	if (gen8 && class == VIDEO_DECODE_CLASS)
> -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> -	else
> -		rb.bit = engine->instance;
> -
> -	rb.bit = BIT(rb.bit);
> -
> -	return rb;
> -}
> -
>   /*
>    * HW architecture suggest typical invalidation time at 40us,
>    * with pessimistic cases up to 100us and a recommendation to
> @@ -1024,14 +995,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>    * but are now considered MCR registers.  Since they exist within a GAM range,
>    * the primary instance of the register rolls up the status from each unit.
>    */
> -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> +static int wait_for_invalidate(struct intel_engine_cs *engine)
>   {
> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> +	if (engine->tlb_inv.mcr)
> +		return intel_gt_mcr_wait_for_reg(engine->gt,
> +						 engine->tlb_inv.reg.mcr_reg,
> +						 engine->tlb_inv.done,
> +						 0,
>   						 TLB_INVAL_TIMEOUT_US,
>   						 TLB_INVAL_TIMEOUT_MS);
>   	else
> -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> +		return __intel_wait_for_register_fw(engine->gt->uncore,
> +						    engine->tlb_inv.reg.reg,
> +						    engine->tlb_inv.done,
> +						    0,
>   						    TLB_INVAL_TIMEOUT_US,
>   						    TLB_INVAL_TIMEOUT_MS,
>   						    NULL);
> @@ -1039,62 +1016,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>   
>   static void mmio_invalidate_full(struct intel_gt *gt)
>   {
> -	static const i915_reg_t gen8_regs[] = {
> -		[RENDER_CLASS]			= GEN8_RTCR,
> -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> -	};
> -	static const i915_reg_t gen12_regs[] = {
> -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> -	};
> -	static const i915_mcr_reg_t xehp_regs[] = {
> -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> -	};
>   	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uncore *uncore = gt->uncore;
>   	struct intel_engine_cs *engine;
>   	intel_engine_mask_t awake, tmp;
>   	enum intel_engine_id id;
> -	const i915_reg_t *regs;
> -	unsigned int num = 0;
>   	unsigned long flags;
>   
> -	/*
> -	 * New platforms should not be added with catch-all-newer (>=)
> -	 * condition so that any later platform added triggers the below warning
> -	 * and in turn mandates a human cross-check of whether the invalidation
> -	 * flows have compatible semantics.
> -	 *
> -	 * For instance with the 11.00 -> 12.00 transition three out of five
> -	 * respective engine registers were moved to masked type. Then after the
> -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> -	 */
> -
> -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> -	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> -		regs = NULL;
> -		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> -		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> -		regs = gen12_regs;
> -		num = ARRAY_SIZE(gen12_regs);
> -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> -		regs = gen8_regs;
> -		num = ARRAY_SIZE(gen8_regs);
> -	} else if (GRAPHICS_VER(i915) < 8) {
> -		return;
> -	}
> -
> -	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
> +	if (GRAPHICS_VER(i915) < 8)
>   		return;
>   
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> @@ -1104,33 +1033,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>   
>   	awake = 0;
>   	for_each_engine(engine, gt, id) {
> -		struct reg_and_bit rb;
> -
>   		if (!intel_engine_pm_is_awake(engine))
>   			continue;
>   
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			u32 val = BIT(engine->instance);
> -
> -			if (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS)
> -				val = _MASKED_BIT_ENABLE(val);
> +		if (engine->tlb_inv.mcr)
>   			intel_gt_mcr_multicast_write_fw(gt,
> -							xehp_regs[engine->class],
> -							val);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -			if (!i915_mmio_reg_offset(rb.reg))
> -				continue;
> -
> -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS))
> -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> -
> -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> -		}
> +							engine->tlb_inv.reg.mcr_reg,
> +							engine->tlb_inv.request);
> +		else
> +			intel_uncore_write_fw(uncore,
> +					      engine->tlb_inv.reg.reg,
> +					      engine->tlb_inv.request);
> +
>   		awake |= engine->mask;
>   	}
>   
> @@ -1149,17 +1063,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>   	intel_gt_mcr_unlock(gt, flags);
>   
>   	for_each_engine_masked(engine, gt, awake, tmp) {
> -		struct reg_and_bit rb;
> -
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			rb.mcr_reg = xehp_regs[engine->class];
> -			rb.bit = BIT(engine->instance);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		}
> -
> -		if (wait_for_invalidate(gt, rb))
> -			gt_err_ratelimited(gt, "%s TLB invalidation did not complete in %ums!\n",
> +		if (wait_for_invalidate(engine))
> +			gt_err_ratelimited(gt,
> +					   "%s TLB invalidation did not complete in %ums!\n",
>   					   engine->name, TLB_INVAL_TIMEOUT_MS);
>   	}
>   

