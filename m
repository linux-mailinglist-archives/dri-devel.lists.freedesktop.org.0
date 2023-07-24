Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21C75EF4C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C473410E087;
	Mon, 24 Jul 2023 09:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8038810E087;
 Mon, 24 Jul 2023 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690191742; x=1721727742;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VvytKGDtH/fBtdVc6oyotXKFmAWRI9fZEF7VjkY63Aw=;
 b=I4J+a/oRxVRvziBM1XEpzYHxuohQdSiLbNxVnYUlMwq0HWijneAOiBPJ
 YLQ0rK3O80qXBajclJcn3/uAtcKdlTDVL8XrUrPgh6z0uN97mHLpJDf8o
 JTmT9El7tmEbJ7n0V828W1DYF03G1ZSZbW9E/pjVJhGhAoNOxGAAec1d3
 644eUMeaL6PVntwBGR7Inr4esn1HqNtbG1CMM4inBsoy/ikXywnjdoSw5
 LLdBfby+HOZvRJIknAmHbFcUmiIVP0DRvHS6bZQkBQbgONIRfDKTsdm1+
 yxlC0GDrPnNOmFf80LE73ljx3xJHYsTjVXYrmtIvp30B/xmJRqRdIPVgD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398298040"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="398298040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="702807513"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="702807513"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.115])
 ([10.213.14.115])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:42:19 -0700
Message-ID: <5f846260-8416-fb19-bd46-ced39153a92a@intel.com>
Date: Mon, 24 Jul 2023 11:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v8 9/9] drm/i915/gt: Support aux invalidation
 on all engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-10-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230721161514.818895-10-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.07.2023 18:15, Andi Shyti wrote:
> Perform some refactoring with the purpose of keeping in one
> single place all the operations around the aux table
> invalidation.
> 
> With this refactoring add more engines where the invalidation
> should be performed.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 53 ++++++++++++++----------
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
>   drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +-------
>   3 files changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 6daf7d99700e0..d33462387d1c6 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -178,9 +178,36 @@ static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
>   	return !HAS_FLAT_CCS(engine->i915);
>   }
>   
> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> +static i915_reg_t gen12_get_aux_inv_reg(struct intel_engine_cs *engine)
> +{
> +	if (!gen12_needs_ccs_aux_inv(engine))
> +		return INVALID_MMIO_REG;
> +
> +	switch (engine->id) {
> +	case RCS0:
> +		return GEN12_CCS_AUX_INV;
> +	case BCS0:
> +		return GEN12_BCS0_AUX_INV;

Shouldn't be MTL only?
With that explained/fixed:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +	case VCS0:
> +		return GEN12_VD0_AUX_INV;
> +	case VCS2:
> +		return GEN12_VD2_AUX_INV;
> +	case VECS0:
> +		return GEN12_VE0_AUX_INV;
> +	case CCS0:
> +		return GEN12_CCS0_AUX_INV;
> +	default:
> +		return INVALID_MMIO_REG;
> +	}
> +}
> +
> +u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
>   {
> -	u32 gsi_offset = gt->uncore->gsi_offset;
> +	i915_reg_t inv_reg = gen12_get_aux_inv_reg(engine);
> +	u32 gsi_offset = engine->gt->uncore->gsi_offset;
> +
> +	if (i915_mmio_reg_valid(inv_reg))
> +		return cs;
>   
>   	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
>   	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
> @@ -322,11 +349,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>   
> -		if (gen12_needs_ccs_aux_inv(rq->engine)) {
> -			/* hsdes: 1809175790 */
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
> -						      GEN12_CCS_AUX_INV);
> -		}
> +		cs = gen12_emit_aux_table_inv(engine, cs);
>   
>   		*cs++ = preparser_disable(false);
>   		intel_ring_advance(rq, cs);
> @@ -337,7 +360,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   {
> -	intel_engine_mask_t aux_inv = 0;
>   	u32 cmd_flush = 0;
>   	u32 cmd = 4;
>   	u32 *cs;
> @@ -345,15 +367,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	if (mode & EMIT_INVALIDATE)
>   		cmd += 2;
>   
> -	if (gen12_needs_ccs_aux_inv(rq->engine))
> -		aux_inv = rq->engine->mask &
> -			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -
>   	/*
>   	 * On Aux CCS platforms the invalidation of the Aux
>   	 * table requires quiescing memory traffic beforehand
>   	 */
> -	if (aux_inv) {
> +	if (gen12_needs_ccs_aux_inv(rq->engine)) {
>   		cmd += 8; /* for the AUX invalidation */
>   		cmd += 2; /* for the engine quiescing */
>   
> @@ -396,14 +414,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	*cs++ = 0; /* upper addr */
>   	*cs++ = 0; /* value */
>   
> -	if (aux_inv) { /* hsdes: 1809175790 */
> -		if (rq->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> +	cs = gen12_emit_aux_table_inv(rq->engine, cs);
>   
>   	if (mode & EMIT_INVALIDATE)
>   		*cs++ = preparser_disable(false);
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index a44eda096557c..867ba697aceb8 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -13,6 +13,7 @@
>   #include "intel_gt_regs.h"
>   #include "intel_gpu_commands.h"
>   
> +struct intel_engine_cs;
>   struct intel_gt;
>   struct i915_request;
>   
> @@ -46,7 +47,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>   u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>   u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>   
> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg);
> +u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs);
>   
>   static inline u32 *
>   __gen8_emit_pipe_control(u32 *batch, u32 bit_group_0,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 235f3fab60a98..119deb9f938c7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1371,10 +1371,7 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>   	    IS_DG2_G11(ce->engine->i915))
>   		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
>   
> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915))
> -		cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -					      cs, GEN12_CCS_AUX_INV);
> +	cs = gen12_emit_aux_table_inv(ce->engine, cs);
>   
>   	/* Wa_16014892111 */
>   	if (IS_MTL_GRAPHICS_STEP(ce->engine->i915, M, STEP_A0, STEP_B0) ||
> @@ -1399,17 +1396,7 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>   						    PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE,
>   						    0);
>   
> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915)) {
> -		if (ce->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
> -			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> -
> -	return cs;
> +	return gen12_emit_aux_table_inv(ce->engine, cs);
>   }
>   
>   static void

