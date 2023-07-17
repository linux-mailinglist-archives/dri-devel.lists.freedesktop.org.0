Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4681756CDA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9C10E2AD;
	Mon, 17 Jul 2023 19:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674310E2AD;
 Mon, 17 Jul 2023 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689621093; x=1721157093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PUf2yUoTaYi8DC3EY4D3RkYTKWBf0pDWIYA79jnomVA=;
 b=gZ5RB18umcHJW790d3+9Dj3wHlitByk3w5do8cSP84UENqfHLffBu2bT
 GTFF+jlgxnnWuW9/yP30lATJ3Wtr84rl5Im9d9Ez0/HFDUXYm5u6eBk4I
 nKxL3XYcTsbfIaYY7N1qf1QZsPbe4L4qeMMb0PMEcYUpUcQzNeuVROLO7
 XS+NZJYEiY84AfxZ9PUqBX06oB/DdXaBC5+LU7u9ed5qir0SyG3Unu6y1
 OvmfA7IcSBHPlEeK/SOedJWv08wNg7jUybX5LmsU0za0epfsgvyZ0eAVV
 k/a3mobiwiYtT2cncXoa0eVmz5wZptpP8HfzWpZD6+Lr+aXtwuNexcaak A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369569885"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="369569885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="866827301"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:11:29 -0700
Message-ID: <58136997-4870-c321-a04a-d10443e92546@intel.com>
Date: Mon, 17 Jul 2023 21:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v4 6/6] drm/i915/gt: Support aux invalidation
 on all engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-7-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717173059.422892-7-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.07.2023 19:30, Andi Shyti wrote:
> Perform some refactoring with the purpose of keeping in one
> single place all the operations around the aux table
> invalidation.
> 
> With this refactoring add more engines where the invalidation
> should be performed.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 63 +++++++++++++++---------
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
>   drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +------
>   3 files changed, 44 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index fbc70f3b7f2fd..6d21a1ac06e73 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,7 +165,8 @@ static u32 preparser_disable(bool state)
>   	return MI_ARB_CHECK | 1 << 8 | state;
>   }
>   
> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> +static u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs,
> +				     const i915_reg_t inv_reg)
>   {
>   	u32 gsi_offset = gt->uncore->gsi_offset;
>   
> @@ -187,6 +188,40 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>   	return cs;
>   }
>   
> +static i915_reg_t intel_get_aux_inv_reg(struct intel_engine_cs *engine)
> +{
> +	if (HAS_FLAT_CCS(engine->i915))
> +		return _MMIO(0);

Why not INVALID_MMIO_REG ? Here and below.

> +
> +	switch (engine->id) {
> +	case RCS0:
> +		return GEN12_CCS_AUX_INV;
> +	case VCS0:
> +		return GEN12_VD0_AUX_INV;
> +	case VCS2:
> +		return GEN12_VD2_AUX_INV;
> +	case VECS0:
> +		return GEN12_VE0_AUX_INV;
> +	default:
> +		return _MMIO(0);
> +	}
> +}
> +
> +static bool intel_engine_has_aux_inv(struct intel_engine_cs *engine)
> +{
> +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> +
> +	return !!reg.reg;

  return i915_mmio_reg_valid(intel_get_aux_inv_reg(engine));

> +}
> +
> +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> +{
> +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> +	struct intel_gt *gt = engine->gt;
> +
> +	return reg.reg ? gen12_emit_aux_table_inv(gt, cs, reg) : cs;
> +}
> +

I am not sure about prefixes, IMHO gen12_ instead of intel_ is more 
adequate as this is only gen12 feature, works only on gen12, and is 
called from gen12 context, up to you. In any case we can squash 
intel_emit_aux_table_inv and gen12_emit_aux_table_inv into one function, 
am I right?

Regards
Andrzej

>   static int mtl_dummy_pipe_control(struct i915_request *rq)
>   {
>   	/* Wa_14016712196 */
> @@ -311,11 +346,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> -			/* hsdes: 1809175790 */
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
> -						      GEN12_CCS_AUX_INV);
> -		}
> +		cs = intel_emit_aux_table_inv(engine, cs);
>   
>   		*cs++ = preparser_disable(false);
>   		intel_ring_advance(rq, cs);
> @@ -326,21 +357,14 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   {
> -	intel_engine_mask_t aux_inv = 0;
>   	u32 cmd, *cs;
>   
>   	cmd = 4;
>   	if (mode & EMIT_INVALIDATE) {
>   		cmd += 2;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd += 10;
> -		}
> +		if (intel_engine_has_aux_inv(rq->engine))
> +			cmd += 10;
>   	}
>   
>   	cs = intel_ring_begin(rq, cmd);
> @@ -371,14 +395,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
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
> +	cs = intel_emit_aux_table_inv(rq->engine, cs);
>   
>   	if (mode & EMIT_INVALIDATE)
>   		*cs++ = preparser_disable(false);
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index 655e5c00ddc27..d938c94524510 100644
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
> +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs);
>   
>   static inline u32 *
>   __gen8_emit_pipe_control(u32 *batch, u32 flags0, u32 flags1, u32 offset)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 235f3fab60a98..70054767c88c3 100644
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
> +	cs = intel_emit_aux_table_inv(ce->engine, cs);
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
> +	return intel_emit_aux_table_inv(ce->engine, cs);
>   }
>   
>   static void

