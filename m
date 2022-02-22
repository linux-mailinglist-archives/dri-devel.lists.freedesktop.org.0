Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF884BF521
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567610E6D4;
	Tue, 22 Feb 2022 09:52:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BFB10E68B;
 Tue, 22 Feb 2022 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645523546; x=1677059546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S1ZC4q9yBw7F5NcX7LLJ5IZGejc3vZYi9MkjP5Rau/I=;
 b=PRFdTpmhe8cuhnMVW93xWW2NT5t4okNS8bOOOQAs39vNzW/fN3PykE0M
 YYNIiXt0IhhUbyvjImn9maadLJOUFYubPPCpXIkYQooL8oJk1tlKf0JqI
 PRbS1tCdqQxk0Ssk7eWiCA0AbfMosPqjJV6sw9xhEuTw+u5AE9pi6raAS
 a2hnlP7qQ/VL83m5JnWXLdJsReWaNi4D4kMsDgK7/SHBs5ETQdceu+b8c
 gow/xUR7HqSzMSHN/ffYP1wgPKaQJYXn8UtNy0lVf8SdcdcIdccRI0eWD
 qyUIw8N2QpefM/rOChLWROxWLm8K9dlTFHvTais5ORQS1dI4rJSNGPwKt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314916730"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="314916730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:52:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507923741"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:52:25 -0800
Message-ID: <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
Date: Tue, 22 Feb 2022 09:52:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220218213307.1338478-2-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC converts the pre-emption timeout and timeslice quantum values into
> clock ticks internally. That significantly reduces the point of 32bit
> overflow. On current platforms, worst case scenario is approximately

Where does 32-bit come from, the GuC side? We already use 64-bits so that something to fix to start with. Yep...

./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;

./gt/uc/intel_guc_submission.c: desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;

./gt/intel_engine_types.h:              unsigned long timeslice_duration_ms;

timeslice_store/preempt_timeout_store:
err = kstrtoull(buf, 0, &duration);

So both kconfig and sysfs can already overflow GuC, not only because of tick conversion internally but because at backend level nothing was done for assigning 64-bit into 32-bit. Or I failed to find where it is handled.

> 110 seconds. Rather than allowing the user to set higher values and
> then get confused by early timeouts, add limits when setting these
> values.

Btw who is reviewing GuC patches these days - things have somehow gotten pretty quiet in activity and I don't think that's due absence of stuff to improve or fix? Asking since I think I noticed a few already which you posted and then crickets on the mailing list.

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>   3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index e53008b4dd05..2a1e9f36e6f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>   		engine->props.preempt_timeout_ms = 0;
>   
> +	/* Cap timeouts to prevent overflow inside GuC */
> +	if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
> +		if (engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {

Hm "wanted".. There's been too much back and forth on the GuC load options over the years to keep track.. intel_engine_uses_guc work sounds like would work and read nicer.

And limit to class instead of applying to all engines looks like a miss.

> +			drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %d to prevent possibly overflow\n",
> +				 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
> +			engine->props.timeslice_duration_ms = GUC_POLICY_MAX_EXEC_QUANTUM_MS;

I am not sure logging such message during driver load is useful. Sounds more like a confused driver which starts with one value and then overrides itself. I'd just silently set the value appropriate for the active backend. Preemption timeout kconfig text already documents the fact timeouts can get overriden at runtime depending on platform+engine. So maybe just add same text to timeslice kconfig.

> +		}
> +
> +		if (engine->props.preempt_timeout_ms > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
> +			drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %d to prevent possibly overflow\n",
> +				 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
> +			engine->props.preempt_timeout_ms = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
> +		}
> +	}
> +
>   	engine->defaults = engine->props; /* never to change again */
>   
>   	engine->context_size = intel_engine_context_size(gt, engine->class);
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 967031056202..f57efe026474 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>   		return -EINVAL;
>   
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
> +	    duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
> +		duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
> +		drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %lld to prevent possibly overflow\n",
> +			 duration);
> +	}

I would suggest to avoid duplicated clamping logic. Maybe hide the all backend logic into the helpers then, like maybe:

   d = intel_engine_validate_timeslice/preempt_timeout(engine, duration);
   if (d != duration)
	return -EINVAL:

Returning -EINVAL would be equivalent to existing behaviour:

	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
		return -EINVAL;

That way userspace has explicit notification and read-back is identical to written in value. From engine setup you can just call the helper silently.

> +
>   	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>   
>   	if (execlists_active(&engine->execlists))
> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>   		return -EINVAL;
>   
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
> +	    timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
> +		timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
> +		drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %lld to prevent possibly overflow\n",
> +			 timeout);
> +	}
> +
>   	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>   
>   	if (READ_ONCE(engine->execlists.pending[0]))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 6a4612a852e2..ad131092f8df 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>   
>   #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>   
> +/*
> + * GuC converts the timeout to clock ticks internally. Different platforms have
> + * different GuC clocks. Thus, the maximum value before overflow is platform
> + * dependent. Current worst case scenario is about 110s. So, limit to 100s to be
> + * safe.
> + */
> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS		(100 * 1000)
> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS	(100 * 1000)

Most important question -
how will we know/notice if/when new GuC arrives where these timeouts would still overflow? Can this be queried somehow at runtime or where does the limit comes from? How is GuC told about it? Set in some field and it just allows too large values silently break things?

Regards,

Tvrtko

> +
>   struct guc_policies {
>   	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>   	/* In micro seconds. How much time to allow before DPC processing is
