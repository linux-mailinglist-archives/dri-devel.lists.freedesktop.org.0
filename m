Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E339038FD67
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C867E6E420;
	Tue, 25 May 2021 09:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10DD89DA7;
 Tue, 25 May 2021 09:05:51 +0000 (UTC)
IronPort-SDR: d/s2tJlyydovErguT6esBAC2QZOwhXGuj8IA8ra0iB/7SzkFerTynBOEjRrkYARIDWmRmVMpZm
 4OaERdiPY3gg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202162561"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202162561"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:05:49 -0700
IronPort-SDR: VXb/TQyZ9Kd3hw4QqLccDjsdqCpNRhedaINjy2kbq4ibAiO5WeUwB5VOT0QJdCQSxFqxsg22rs
 0LA9Y2nBZ1DQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442454904"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:05:48 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 33/97] drm/i915: Engine relative MMIO
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-34-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <894c5ffe-32dc-db64-e11d-29048e201227@linux.intel.com>
Date: Tue, 25 May 2021 10:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-34-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:13, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> With virtual engines, it is no longer possible to know which specific
> physical engine a given request will be executed on at the time that
> request is generated. This means that the request itself must be engine
> agnostic - any direct register writes must be relative to the engine
> and not absolute addresses.
> 
> The LRI command has support for engine relative addressing. However,
> the mechanism is not transparent to the driver. The scheme for Gen11
> (MI_LRI_ADD_CS_MMIO_START) requires the LRI address to have no
> absolute engine base component. The hardware then adds on the correct
> engine offset at execution time.
> 
> Due to the non-trivial and differing schemes on different hardware, it
> is not possible to simply update the code that creates the LRI
> commands to set a remap flag and let the hardware get on with it.
> Instead, this patch adds function wrappers for generating the LRI
> command itself and then for constructing the correct address to use
> with the LRI.
> 
> Bspec: 45606
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> CC: Chris P Wilson <chris.p.wilson@intel.com>
> CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c  |  7 +++---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 25 ++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h |  3 +++
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  5 ++++
>   drivers/gpu/drm/i915/i915_perf.c             |  6 +++++
>   5 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 188dee13e017..993faa213b41 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1211,7 +1211,7 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
>   {
>   	struct i915_address_space *vm = rq->context->vm;
>   	struct intel_engine_cs *engine = rq->engine;
> -	u32 base = engine->mmio_base;
> +	u32 base = engine->lri_mmio_base;
>   	u32 *cs;
>   	int i;
>   
> @@ -1223,7 +1223,7 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
>   		if (IS_ERR(cs))
>   			return PTR_ERR(cs);
>   
> -		*cs++ = MI_LOAD_REGISTER_IMM(2);
> +		*cs++ = MI_LOAD_REGISTER_IMM(2) | engine->lri_cmd_mode;

Would a helper like MI_LOAD_REGISTER_IMM_REL(engine, n) look better?

>   
>   		*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_UDW(base, 0));
>   		*cs++ = upper_32_bits(pd_daddr);
> @@ -1245,7 +1245,8 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
>   		if (IS_ERR(cs))
>   			return PTR_ERR(cs);
>   
> -		*cs++ = MI_LOAD_REGISTER_IMM(2 * GEN8_3LVL_PDPES) | MI_LRI_FORCE_POSTED;
> +		*cs++ = MI_LOAD_REGISTER_IMM(2 * GEN8_3LVL_PDPES) |
> +			MI_LRI_FORCE_POSTED | engine->lri_cmd_mode;
>   		for (i = GEN8_3LVL_PDPES; i--; ) {
>   			const dma_addr_t pd_daddr = i915_page_dir_dma_addr(ppgtt, i);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index ec82a7ec0c8d..c88b792c1ab5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -16,6 +16,7 @@
>   #include "intel_engine_pm.h"
>   #include "intel_engine_user.h"
>   #include "intel_execlists_submission.h"
> +#include "intel_gpu_commands.h"
>   #include "intel_gt.h"
>   #include "intel_gt_requests.h"
>   #include "intel_gt_pm.h"
> @@ -223,6 +224,28 @@ static u32 __engine_mmio_base(struct drm_i915_private *i915,
>   	return bases[i].base;
>   }
>   
> +static bool i915_engine_has_relative_lri(const struct intel_engine_cs *engine)
> +{
> +	if (INTEL_GEN(engine->i915) < 11)
> +		return false;
> +
> +	if (engine->class == COPY_ENGINE_CLASS)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void lri_init(struct intel_engine_cs *engine)
> +{
> +	if (i915_engine_has_relative_lri(engine)) {
> +		engine->lri_cmd_mode = MI_LRI_LRM_CS_MMIO;
> +		engine->lri_mmio_base = 0;
> +	} else {
> +		engine->lri_cmd_mode = 0;
> +		engine->lri_mmio_base = engine->mmio_base;
> +	}
> +}
> +
>   static void __sprint_engine_name(struct intel_engine_cs *engine)
>   {
>   	/*
> @@ -327,6 +350,8 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
>   	if (engine->context_size)
>   		DRIVER_CAPS(i915)->has_logical_contexts = true;
>   
> +	lri_init(engine);
> +
>   	ewma__engine_latency_init(&engine->latency);
>   	seqcount_init(&engine->stats.lock);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 93aa22680db0..86302e6d86b2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -281,6 +281,9 @@ struct intel_engine_cs {
>   	u32 context_size;
>   	u32 mmio_base;
>   
> +	u32 lri_mmio_base;
> +	u32 lri_cmd_mode;
> +
>   	/*
>   	 * Some w/a require forcewake to be held (which prevents RC6) while
>   	 * a particular engine is active. If so, we set fw_domain to which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 14e2ffb6c0e5..887d59897bc2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -134,6 +134,11 @@
>    *   simply ignores the register load under certain conditions.
>    * - One can actually load arbitrary many arbitrary registers: Simply issue x
>    *   address/value pairs. Don't overdue it, though, x <= 2^4 must hold!
> + * - Newer hardware supports engine relative addressing but older hardware does
> + *   not. This is required for hw engine load balancing. Hence the MI_LRI
> + *   instruction itself is prefixed with '__' and should only be used on
> + *   legacy hardware code paths. Generic code must always use the MI_LRI
> + *   and i915_get_lri_reg() helper functions instead.

Stale comment.

>    */
>   #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
>   /* Gen11+. addr = base + (ctx_restore ? offset & GENMASK(12,2) : offset) */
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 66f1f25119b5..b9cc3f0a616f 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -2118,6 +2118,11 @@ gen8_update_reg_state_unlocked(const struct intel_context *ce,
>   	u32 *reg_state = ce->lrc_reg_state;
>   	int i;
>   
> +	/*
> +	 * NB: The LRI instruction is generated by the hardware.
> +	 * Should we read it in and assert that the offset flag is set?
> +	 */
> +
>   	reg_state[ctx_oactxctrl + 1] =
>   		(stream->period_exponent << GEN8_OA_TIMER_PERIOD_SHIFT) |
>   		(stream->periodic ? GEN8_OA_TIMER_ENABLE : 0) |
> @@ -2174,6 +2179,7 @@ gen8_load_flex(struct i915_request *rq,
>   
>   	*cs++ = MI_LOAD_REGISTER_IMM(count);
>   	do {
> +		/* FIXME: Is this table LRI remap/offset friendly? */
>   		*cs++ = i915_mmio_reg_offset(flex->reg);
>   		*cs++ = flex->value;
>   	} while (flex++, --count);
> 

NB and FIXME would ideally be resolved before merging.

Regards,

Tvrtko


