Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85551A27B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470B810EDB5;
	Wed,  4 May 2022 14:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A810ED6F;
 Wed,  4 May 2022 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651675479; x=1683211479;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8Kp+0Qd/rin5WxofA83JB6d6DP60uFy0x9+75eKJke8=;
 b=dW2mDKdhhTzuSGuhRSa42v1DSc88KZYOlwTPbJ1AClfRQ761DipKsTCx
 +qjSllj8xh1+R51txUrPS0wk1w4zbEyGLKXTgyZO9HaVz4CqY6BuEdq58
 JK0HMF+LNY/MT74y7K0A351BQ/XTQPYLecTTiur6oovdUT6c6cKeTdLxK
 fu0saI7kRk/cH1mwf4BjwcZJmZvWaK0UN3zwKNsKLPIgoeEiMsmVn4KOk
 nskTOu/5tHlkosBp6Hsnk8ydJLIsg0WlvBaU8sf25CyWNa/Ga0+VE0XwJ
 7mr1RIhVb9qaOcCqsqI0fCPC7h680ykF5l0j0Iyx3C+1oJdNi2tUqGCWI w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="330773867"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="330773867"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 07:44:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="664497600"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183])
 ([10.213.236.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 07:44:30 -0700
Message-ID: <c851a776-50c0-f075-9861-9545c0ac5682@linux.intel.com>
Date: Wed, 4 May 2022 15:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gt: Clear SET_PREDICATE_RESULT
 prior to executing the ring
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220425152317.4275-1-ramalingam.c@intel.com>
 <20220425152317.4275-4-ramalingam.c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220425152317.4275-4-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/04/2022 16:23, Ramalingam C wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Userspace may leave predication enabled upon return from the batch
> buffer, which has the consequent of preventing all operation from the
> ring from being executed, including all the synchronisation, coherency
> control, arbitration and user signaling. This is more than just a local
> gpu hang in one client, as the user has the ability to prevent the
> kernel from applying critical workarounds and can cause a full GT reset.
> 
> We could simply execute MI_SET_PREDICATE upon return from the user
> batch, but this has the repercussion of modifying the user's context
> state. Instead, we opt to execute a fixup batch which by mixing
> predicated operations can determine the state of the
> SET_PREDICATE_RESULT register and restore it prior to the next userspace
> batch. This allows us to protect the kernel's ring without changing the
> uABI.
> 
> Suggested-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Applies to Gen12+ so Cc: stable?

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 54 +++++++++++++
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.h      |  7 ++
>   drivers/gpu/drm/i915/gt/intel_engine_regs.h   |  1 +
>   .../drm/i915/gt/intel_execlists_submission.c  | 15 +++-
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  2 +
>   drivers/gpu/drm/i915/gt/intel_lrc.c           | 75 ++++++++++++++-----
>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  5 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +
>   8 files changed, 137 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 9529c5455bc3..3e13960615bd 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -5,6 +5,7 @@
>   
>   #include "gen8_engine_cs.h"
>   #include "i915_drv.h"
> +#include "intel_engine_regs.h"
>   #include "intel_gpu_commands.h"
>   #include "intel_lrc.h"
>   #include "intel_ring.h"
> @@ -385,6 +386,59 @@ int gen8_emit_init_breadcrumb(struct i915_request *rq)
>   	return 0;
>   }
>   
> +static int __gen125_emit_bb_start(struct i915_request *rq,
> +				  u64 offset, u32 len,
> +				  const unsigned int flags,
> +				  u32 arb)
> +{
> +	struct intel_context *ce = rq->context;
> +	u32 wa_offset = lrc_indirect_bb(ce);
> +	u32 *cs;
> +
> +	cs = intel_ring_begin(rq, 12);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	*cs++ = MI_ARB_ON_OFF | arb;
> +
> +	*cs++ = MI_LOAD_REGISTER_MEM_GEN8 |
> +		MI_SRM_LRM_GLOBAL_GTT |
> +		MI_LRI_LRM_CS_MMIO;
> +	*cs++ = i915_mmio_reg_offset(RING_PREDICATE_RESULT(0));
> +	*cs++ = wa_offset + DG2_PREDICATE_RESULT_WA;
> +	*cs++ = 0;
> +
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +
> +	/* Fixup stray MI_SET_PREDICATE as it prevents us executing the ring */
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8;
> +	*cs++ = wa_offset + DG2_PREDICATE_RESULT_BB;
> +	*cs++ = 0;
> +
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +int gen125_emit_bb_start_noarb(struct i915_request *rq,
> +			       u64 offset, u32 len,
> +			       const unsigned int flags)
> +{
> +	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_DISABLE);
> +}
> +
> +int gen125_emit_bb_start(struct i915_request *rq,
> +			 u64 offset, u32 len,
> +			 const unsigned int flags)
> +{
> +	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_ENABLE);
> +}
> +
>   int gen8_emit_bb_start_noarb(struct i915_request *rq,
>   			     u64 offset, u32 len,
>   			     const unsigned int flags)
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index 107ab42539ab..32e3d2b831bb 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -31,6 +31,13 @@ int gen8_emit_bb_start(struct i915_request *rq,
>   		       u64 offset, u32 len,
>   		       const unsigned int flags);
>   
> +int gen125_emit_bb_start_noarb(struct i915_request *rq,
> +			       u64 offset, u32 len,
> +			       const unsigned int flags);
> +int gen125_emit_bb_start(struct i915_request *rq,
> +			 u64 offset, u32 len,
> +			 const unsigned int flags);
> +
>   u32 *gen8_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
>   u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> index 1dab554bf640..75a0c55c5aa5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> @@ -148,6 +148,7 @@
>   		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
>   		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
>   
> +#define RING_PREDICATE_RESULT(base)		_MMIO((base) + 0x3b8) /* gen12+ */
>   #define MI_PREDICATE_RESULT_2(base)		_MMIO((base) + 0x3bc)
>   #define   LOWER_SLICE_ENABLED			(1 << 0)
>   #define   LOWER_SLICE_DISABLED			(0 << 0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index f8749c433b7c..86f7a9ac1c39 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3433,10 +3433,17 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   		}
>   	}
>   
> -	if (intel_engine_has_preemption(engine))
> -		engine->emit_bb_start = gen8_emit_bb_start;
> -	else
> -		engine->emit_bb_start = gen8_emit_bb_start_noarb;
> +	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50)) {
> +		if (intel_engine_has_preemption(engine))
> +			engine->emit_bb_start = gen125_emit_bb_start;
> +		else
> +			engine->emit_bb_start = gen125_emit_bb_start_noarb;
> +	} else {
> +		if (intel_engine_has_preemption(engine))
> +			engine->emit_bb_start = gen8_emit_bb_start;
> +		else
> +			engine->emit_bb_start = gen8_emit_bb_start_noarb;
> +	}
>   
>   	engine->busyness = execlists_engine_busyness;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index e52718a87f14..556bca3be804 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -39,6 +39,8 @@
>   #define  MI_GLOBAL_GTT    (1<<22)
>   
>   #define MI_NOOP			MI_INSTR(0, 0)
> +#define MI_SET_PREDICATE	MI_INSTR(0x01, 0)
> +#define   MI_SET_PREDICATE_DISABLE	(0 << 0)
>   #define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
>   #define MI_WAIT_FOR_EVENT       MI_INSTR(0x03, 0)
>   #define   MI_WAIT_FOR_OVERLAY_FLIP	(1<<16)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 3f83a9038e13..eec73c66406c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -904,6 +904,24 @@ check_redzone(const void *vaddr, const struct intel_engine_cs *engine)
>   			     engine->name);
>   }
>   
> +static u32 context_wa_bb_offset(const struct intel_context *ce)
> +{
> +	return PAGE_SIZE * ce->wa_bb_page;
> +}
> +
> +static u32 *context_indirect_bb(const struct intel_context *ce)
> +{
> +	void *ptr;
> +
> +	GEM_BUG_ON(!ce->wa_bb_page);
> +
> +	ptr = ce->lrc_reg_state;
> +	ptr -= LRC_STATE_OFFSET; /* back to start of context image */
> +	ptr += context_wa_bb_offset(ce);
> +
> +	return ptr;
> +}
> +
>   void lrc_init_state(struct intel_context *ce,
>   		    struct intel_engine_cs *engine,
>   		    void *state)
> @@ -922,6 +940,10 @@ void lrc_init_state(struct intel_context *ce,
>   	/* Clear the ppHWSP (inc. per-context counters) */
>   	memset(state, 0, PAGE_SIZE);
>   
> +	/* Clear the indirect wa and storage */
> +	if (ce->wa_bb_page)
> +		memset(state + context_wa_bb_offset(ce), 0, PAGE_SIZE);
> +
>   	/*
>   	 * The second page of the context object contains some registers which
>   	 * must be set up prior to the first execution.
> @@ -929,6 +951,35 @@ void lrc_init_state(struct intel_context *ce,
>   	__lrc_init_regs(state + LRC_STATE_OFFSET, ce, engine, inhibit);
>   }
>   
> +u32 lrc_indirect_bb(const struct intel_context *ce)
> +{
> +	return i915_ggtt_offset(ce->state) + context_wa_bb_offset(ce);
> +}
> +
> +static u32 *setup_predicate_disable_wa(const struct intel_context *ce, u32 *cs)
> +{
> +	/* If predication is active, this will be noop'ed */
> +	*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT | (4 - 2);
> +	*cs++ = lrc_indirect_bb(ce) + DG2_PREDICATE_RESULT_WA;
> +	*cs++ = 0;
> +	*cs++ = 0; /* No predication */
> +
> +	/* predicated end, only terminates if SET_PREDICATE_RESULT:0 is clear */
> +	*cs++ = MI_BATCH_BUFFER_END | BIT(15);
> +	*cs++ = MI_SET_PREDICATE | MI_SET_PREDICATE_DISABLE;
> +
> +	/* Instructions are no longer predicated (disabled), we can proceed */
> +	*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT | (4 - 2);
> +	*cs++ = lrc_indirect_bb(ce) + DG2_PREDICATE_RESULT_WA;
> +	*cs++ = 0;
> +	*cs++ = 1; /* enable predication before the next BB */
> +
> +	*cs++ = MI_BATCH_BUFFER_END;
> +	GEM_BUG_ON(offset_in_page(cs) > DG2_PREDICATE_RESULT_WA);
> +
> +	return cs;
> +}
> +
>   static struct i915_vma *
>   __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>   {
> @@ -1240,24 +1291,6 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>   	return cs;
>   }
>   
> -static u32 context_wa_bb_offset(const struct intel_context *ce)
> -{
> -	return PAGE_SIZE * ce->wa_bb_page;
> -}
> -
> -static u32 *context_indirect_bb(const struct intel_context *ce)
> -{
> -	void *ptr;
> -
> -	GEM_BUG_ON(!ce->wa_bb_page);
> -
> -	ptr = ce->lrc_reg_state;
> -	ptr -= LRC_STATE_OFFSET; /* back to start of context image */
> -	ptr += context_wa_bb_offset(ce);
> -
> -	return ptr;
> -}
> -
>   static void
>   setup_indirect_ctx_bb(const struct intel_context *ce,
>   		      const struct intel_engine_cs *engine,
> @@ -1271,9 +1304,11 @@ setup_indirect_ctx_bb(const struct intel_context *ce,
>   	while ((unsigned long)cs % CACHELINE_BYTES)
>   		*cs++ = MI_NOOP;
>   
> +	GEM_BUG_ON(cs - start > DG2_PREDICATE_RESULT_BB / sizeof(*start));
> +	setup_predicate_disable_wa(ce, start + DG2_PREDICATE_RESULT_BB / sizeof(*start));

AFAICT this applies to Gen12+ but mention of DG2 is then confusing me. 
Should DG2_PREDICATE_RESULT_BB have been named GEN12_..?

Regards,

Tvrtko

> +
>   	lrc_setup_indirect_ctx(ce->lrc_reg_state, engine,
> -			       i915_ggtt_offset(ce->state) +
> -			       context_wa_bb_offset(ce),
> +			       lrc_indirect_bb(ce),
>   			       (cs - start) * sizeof(*cs));
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
> index 7371bb5c8129..31be734010db 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
> @@ -145,4 +145,9 @@ static inline void lrc_runtime_stop(struct intel_context *ce)
>   	WRITE_ONCE(stats->active, 0);
>   }
>   
> +#define DG2_PREDICATE_RESULT_WA (PAGE_SIZE - sizeof(u64))
> +#define DG2_PREDICATE_RESULT_BB (2048)
> +
> +u32 lrc_indirect_bb(const struct intel_context *ce);
> +
>   #endif /* __INTEL_LRC_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 61a6f2424e24..addfdc2c2642 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3910,6 +3910,8 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	 */
>   
>   	engine->emit_bb_start = gen8_emit_bb_start;
> +	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> +		engine->emit_bb_start = gen125_emit_bb_start;
>   }
>   
>   static void rcs_submission_override(struct intel_engine_cs *engine)
