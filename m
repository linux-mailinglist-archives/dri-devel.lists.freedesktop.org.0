Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7585FC70
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777C10E96F;
	Thu, 22 Feb 2024 15:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UELFzqka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBBF10E96F;
 Thu, 22 Feb 2024 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708615972; x=1740151972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uR7a0As8AbZp0dMUAebH1yyVCBJ4qNwrkn/qM6yIVwY=;
 b=UELFzqkab2s3tx6H+q321kWu285z153kS1/3YkXHwJNnuO1P9GZibfDk
 oFihPDjsZ5eK/XoGjODPcfd8vuM1Q+Oweeiv0B96SEgfuUN2ueNVw5DA/
 U+mK6wuT1Zy88c6BrH/pK7EwqpOiGpGdWmbxSwYJPcKxo26iUwAErjVH/
 nJGw9Y12WQDX4IUdDEGp99KX7hk6w17HvgzsNO5QwJFTtTo16wh+nBsVs
 FHRZnVE4B8j8PMO2E+DD4fzxJ0nWUBHtzVZ+M7wbXvy1g3CEGbc73r4PG
 b4/mhuM6JS/HqXghamtmS8+D+A3K5llB6ofpjz2fpBoNN9de7wmvkULxS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13549200"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13549200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:32:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5491214"
Received: from sshumihi-mobl.ger.corp.intel.com (HELO [10.213.232.119])
 ([10.213.232.119])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:32:49 -0800
Message-ID: <50e4ed39-bc70-471c-be44-f61920405f67@linux.intel.com>
Date: Thu, 22 Feb 2024 15:32:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Add Compute context hint
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
 <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
 <ZdZq9NH0VYbL-QV8@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZdZq9NH0VYbL-QV8@intel.com>
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


On 21/02/2024 21:28, Rodrigo Vivi wrote:
> On Wed, Feb 21, 2024 at 09:42:34AM +0000, Tvrtko Ursulin wrote:
>>
>> On 21/02/2024 00:14, Vinay Belgaumkar wrote:
>>> Allow user to provide a context hint. When this is set, KMD will
>>> send a hint to GuC which results in special handling for this
>>> context. SLPC will ramp the GT frequency aggressively every time
>>> it switches to this context. The down freq threshold will also be
>>> lower so GuC will ramp down the GT freq for this context more slowly.
>>> We also disable waitboost for this context as that will interfere with
>>> the strategy.
>>>
>>> We need to enable the use of Compute strategy during SLPC init, but
>>> it will apply only to contexts that set this bit during context
>>> creation.
>>>
>>> Userland can check whether this feature is supported using a new param-
>>> I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true for all guc submission
>>> enabled platforms since they use SLPC for freq management.
>>>
>>> The Mesa usage model for this flag is here -
>>> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
>>
>> This allows for setting it for the whole application, correct? Upsides,
>> downsides? Are there any plans for per context?
> 
> Currently there's no extension on a high level API (Vulkan/OpenGL/OpenCL/etc)
> that would allow the application to hint for power/freq/latency. So Mesa cannot
> decide when to hint. So their solution was to use .drirc and make per-application
> decision.
> 
> I would prefer a high level extension for a more granular and informative
> decision. We need to work with that goal, but for now I don't see any
> cons on this approach.

In principle yeah I doesn't harm to have the option. I am just not sure 
how useful this intermediate step this is with its lack of intra-process 
granularity.

>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>>>    drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
>>>    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
>>>    drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
>>>    include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
>>>    9 files changed, 89 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index dcbfe32fd30c..ceab7dbe9b47 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>    			       struct i915_gem_proto_context *pc,
>>>    			       struct drm_i915_gem_context_param *args)
>>>    {
>>> +	struct drm_i915_private *i915 = fpriv->i915;
>>>    	int ret = 0;
>>>    	switch (args->param) {
>>> @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>    			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>>>    		break;
>>> +	case I915_CONTEXT_PARAM_IS_COMPUTE:
>>> +		if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>> +			ret = -EINVAL;
>>> +		else
>>> +			pc->user_flags |= BIT(UCONTEXT_COMPUTE);
>>> +		break;
>>> +
>>>    	case I915_CONTEXT_PARAM_RECOVERABLE:
>>>    		if (args->size)
>>>    			ret = -EINVAL;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> index 03bc7f9d191b..db86d6f6245f 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> @@ -338,6 +338,7 @@ struct i915_gem_context {
>>>    #define UCONTEXT_BANNABLE		2
>>>    #define UCONTEXT_RECOVERABLE		3
>>>    #define UCONTEXT_PERSISTENCE		4
>>> +#define UCONTEXT_COMPUTE		5
>>
>> What is the GuC behaviour when SLPC_CTX_FREQ_REQ_IS_COMPUTE is set for
>> non-compute engines? Wondering if per intel_context is what we want instead.
>> (Which could then be the i915_context_param_engines extension to mark
>> individual contexts as compute strategy.)
> 
> Perhaps we should rename this? This is a freq-decision-strategy inside
> GuC that is there mostly targeting compute workloads that needs lower
> latency with short burst execution. But the engine itself doesn't matter.
> It can be applied to any engine.

I have no idea if it makes sense for other engines, such as video, and 
what would be pros and cons in terms of PnP. But in the case we end up 
allowing it on any engine, then at least userspace name shouldn't be 
compute. :)

Or if we decide to call it compute and only apply to compute engines, 
then I would strongly suggest making the uapi per intel_context i.e. the 
set engines extension instead of the GEM context param. Otherwise it 
would be odd that some engines get it and some don't. With explicit 
configuration userspace gets to see the clear picture of what is what.

Regards,

Tvrtko

>>>    	/**
>>>    	 * @flags: small set of booleans
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> index 4feef874e6d6..1ed40cd61b70 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> @@ -24,6 +24,7 @@
>>>    #include "intel_pcode.h"
>>>    #include "intel_rps.h"
>>>    #include "vlv_sideband.h"
>>> +#include "../gem/i915_gem_context.h"
>>>    #include "../../../platform/x86/intel_ips.h"
>>>    #define BUSY_MAX_EI	20u /* ms */
>>> @@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
>>>    		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>    		if (rps_uses_slpc(rps)) {
>>> +			const struct i915_gem_context *ctx;
>>> +
>>> +			ctx = i915_request_gem_context(rq);
>>> +			if (ctx &&
>>> +			    test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
>>> +				return;
>>> +
>>
>> I think request and intel_context do not own a strong reference to GEM
>> context. So at minimum you need a local one obtained under a RCU lock with
>> kref_get_unless_zero, as do some other places do.
>>
>> However.. it may be simpler to just store the flag in intel_context->flags.
>> If you carry it over at the time GEM context is assigned to intel_context,
>> not only you simplify runtime rules, but you get the ability to not set the
>> compute flags for video etc.
> 
> +1 on the intel_context->flags
> 
>>
>> It may even make sense to add a "don't waitboost" flag on top of the "is
>> compute" so this call site becomes self-documenting (otherwise I ask to add
>> a comment here please). Then you could even move it out from the SLPC
>> special case.
> 
> +1 on the dont_waitboost flag as well. might be worth for other cases
> like display metrics for instance.
> 
>>
>>>    			slpc = rps_to_slpc(rps);
>>>    			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>> index 811add10c30d..c34674e797c6 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>> @@ -207,6 +207,27 @@ struct slpc_shared_data {
>>>    	u8 reserved_mode_definition[4096];
>>>    } __packed;
>>> +struct slpc_context_frequency_request {
>>> +	u32 frequency_request:16;
>>> +	u32 reserved:12;
>>> +	u32 is_compute:1;
>>> +	u32 ignore_busyness:1;
>>> +	u32 is_minimum:1;
>>> +	u32 is_predefined:1;
>>> +} __packed;
>>> +
>>> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
>>> +
>>> +struct slpc_optimized_strategies {
>>> +	u32 compute:1;
>>> +	u32 async_flip:1;
>>> +	u32 media:1;
>>> +	u32 vsync_flip:1;
>>> +	u32 reserved:28;
>>> +} __packed;
>>> +
>>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>>> +
>>>    /**
>>>     * DOC: SLPC H2G MESSAGE FORMAT
>>>     *
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index 3e681ab6fbf9..706fffca698b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
>>>    	return ret;
>>>    }
>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
>>> +{
>>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>> +	intel_wakeref_t wakeref;
>>> +	int ret = 0;
>>> +
>>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>> +		ret = slpc_set_param(slpc,
>>> +				     SLPC_PARAM_STRATEGIES,
>>> +				     val);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>>>    {
>>>    	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>> @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>    	/* Set cached media freq ratio mode */
>>>    	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>>> +	/* Enable SLPC Optimized Strategy for compute */
>>> +	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>> +
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>> index 6ac6503c39d4..1cb5fd44f05c 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>> @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
>>>    void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>>    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>>    int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
>>>    #endif
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index f3dcae4b9d45..bbabfa5532e5 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>>>    MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>>    MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>>>    MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
>>> +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>>>    #undef MAKE_CONTEXT_POLICY_ADD
>>> @@ -2662,8 +2663,10 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>    	struct intel_engine_cs *engine = ce->engine;
>>>    	struct intel_guc *guc = &engine->gt->uc.guc;
>>>    	struct context_policy policy;
>>> +	struct i915_gem_context *ctx = rcu_dereference(ce->gem_context);
>>>    	u32 execution_quantum;
>>>    	u32 preemption_timeout;
>>> +	u32 slpc_ctx_freq_req = 0;
>>>    	unsigned long flags;
>>>    	int ret;
>>> @@ -2675,11 +2678,15 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>    	execution_quantum = engine->props.timeslice_duration_ms * 1000;
>>>    	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>>> +	if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
>>> +		slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>>> +
>>>    	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
>>>    	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
>>>    	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
>>>    	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
>>> +	__guc_context_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
>>>    	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>>    		__guc_context_policy_add_preempt_to_idle(&policy, 1);
>>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
>>> index 5c3fec63cb4c..0f12e36b2a12 100644
>>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>>> @@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>>>    		 */
>>>    		value = 1;
>>>    		break;
>>> +	case I915_PARAM_HAS_COMPUTE_CONTEXT:
>>> +		/* This feature has been available in GuC for a while but
>>> +		 * a use case now required the use of this feature. We
>>> +		 * return true now since this is now being supported from
>>> +		 * the kernel side as well.
>>> +		 */
>>
>> Nit - stick to the multi-line comment style i915 uses please.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>> +			value = 1;
>>> +		else
>>> +			value = -EINVAL;
>>> +		break;
>>>    	case I915_PARAM_HAS_CONTEXT_ISOLATION:
>>>    		value = intel_engines_has_context_isolation(i915);
>>>    		break;
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index 2ee338860b7e..1bd12f536108 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
>>>     */
>>>    #define I915_PARAM_PXP_STATUS		 58
>>> +/*
>>> + * Query if kernel allows marking a context as a Compute context. This will
>>> + * result in more aggressive GT frequency ramping for this context.
>>> + */
>>> +#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
>>> +
>>>    /* Must be kept compact -- no holes and well documented */
>>>    /**
>>> @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
>>>     * -EIO: The firmware did not succeed in creating the protected context.
>>>     */
>>>    #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>> +
>>> +/*
>>> + * I915_CONTEXT_PARAM_IS_COMPUTE:
>>> + *
>>> + * Mark this context as a Compute related workload which requires aggressive GT
>>> + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check if the kernel
>>> + * supports this functionality.
>>> + */
>>> +#define I915_CONTEXT_PARAM_IS_COMPUTE		0xe
>>>    /* Must be kept compact -- no holes and well documented */
>>>    	/** @value: Context parameter value to be set or queried */
