Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF74D1394
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E64810E391;
	Tue,  8 Mar 2022 09:43:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCCD10E3E6;
 Tue,  8 Mar 2022 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646732601; x=1678268601;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y1z//sElY2xI8TTgmIPB4EQcVboDLTJXzCf1YfSpY8A=;
 b=ipAKILGmsASKkT7CSOzyaoV33syu8Qm5mUCnkoN+vJmICFDVjWhtZf3V
 6tPdnsWqLBMGndTBtbsGaQyvA0jmp9PErIVVyvEPyQhFBz4/wqAxD/xKm
 o4wFRrJrZaVvxZKtcvgWYKf0S7mxnP6ygmgFYy/dpRORidIbpIjkZodhU
 XszWY/k5apWh2WM0znXz+V+DgfvU6EOhInE2Bt0120MvNGBrha+821SkR
 wxFrt9XGAS9XcrBhCYWM5wBPh/obNKDWAGSdZj9Y2tInQJ5BtrRUc3+t0
 YHIRm4FNwx/bqMyX2pPZHpbwuqgM66obaljlcgsAJOcBYbLTDyxMCqlzI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="252214306"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="252214306"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 01:43:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="537503406"
Received: from sklehane-mobl1.ger.corp.intel.com (HELO [10.213.197.202])
 ([10.213.197.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 01:43:19 -0800
Message-ID: <897489fb-e0d4-78bc-11d0-d7ec9c20ae07@linux.intel.com>
Date: Tue, 8 Mar 2022 09:43:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 1/4] drm/i915/guc: Limit scheduling
 properties to avoid overflow
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220303223737.708659-2-John.C.Harrison@Intel.com>
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



On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC converts the pre-emption timeout and timeslice quantum values into
> clock ticks internally. That significantly reduces the point of 32bit
> overflow. On current platforms, worst case scenario is approximately
> 110 seconds. Rather than allowing the user to set higher values and
> then get confused by early timeouts, add limits when setting these
> values.
> 
> v2: Add helper functins for clamping (review feedback from Tvrtko).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..8208164c25e7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2218,13 +2218,24 @@ static inline u32 get_children_join_value(struct intel_context *ce,
  static void guc_context_policy_init(struct intel_engine_cs *engine,
                                     struct guc_lrc_desc *desc)
  {
+       struct drm_device *drm = &engine->i915->drm;
+
         desc->policy_flags = 0;
  
         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
                 desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
  
         /* NB: For both of these, zero means disabled. */
+       if (overflows_type(engine->props.timeslice_duration_ms * 1000,
+                          desc->execution_quantum))
+               drm_warn_once(drm, "GuC interface cannot support %lums timeslice!\n",
+                             engine->props.timeslice_duration_ms);
         desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
+
+       if (overflows_type(engine->props.preempt_timeout_ms * 1000,
+                          desc->preemption_timeout))
+               drm_warn_once(drm, "GuC interface cannot support %lums preemption timeout!\n",
+                             engine->props.preempt_timeout_ms);
         desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
  }
  

With that:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h      |  6 ++
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 69 +++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 25 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++
>   4 files changed, 99 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 1c0ab05c3c40..d7044c4e526e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -351,4 +351,10 @@ intel_engine_get_hung_context(struct intel_engine_cs *engine)
>   	return engine->hung_ce;
>   }
>   
> +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value);
> +
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 7447411a5b26..22e70e4e007c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -442,6 +442,26 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
>   	}
>   
> +	/* Cap properties according to any system limits */
> +#define CLAMP_PROP(field) \
> +	do { \
> +		u64 clamp = intel_clamp_##field(engine, engine->props.field); \
> +		if (clamp != engine->props.field) { \
> +			drm_notice(&engine->i915->drm, \
> +				   "Warning, clamping %s to %lld to prevent overflow\n", \
> +				   #field, clamp); \
> +			engine->props.field = clamp; \
> +		} \
> +	} while (0)
> +
> +	CLAMP_PROP(heartbeat_interval_ms);
> +	CLAMP_PROP(max_busywait_duration_ns);
> +	CLAMP_PROP(preempt_timeout_ms);
> +	CLAMP_PROP(stop_timeout_ms);
> +	CLAMP_PROP(timeslice_duration_ms);
> +
> +#undef CLAMP_PROP
> +
>   	engine->defaults = engine->props; /* never to change again */
>   
>   	engine->context_size = intel_engine_context_size(gt, engine->class);
> @@ -464,6 +484,55 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	return 0;
>   }
>   
> +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min(value, jiffies_to_nsecs(2));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	/*
> +	 * NB: The GuC API only supports 32bit values. However, the limit is further
> +	 * reduced due to internal calculations which would otherwise overflow.
> +	 */
> +	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +		value = min_t(u64, value, GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
> +
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	/*
> +	 * NB: The GuC API only supports 32bit values. However, the limit is further
> +	 * reduced due to internal calculations which would otherwise overflow.
> +	 */
> +	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +		value = min_t(u64, value, GUC_POLICY_MAX_EXEC_QUANTUM_MS);
> +
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
>   static void __setup_engine_capabilities(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 967031056202..f2d9858d827c 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	       const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_nsecs(2))
> +	clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
> @@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_timeslice_duration_ms(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
> @@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	   const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_stop_timeout_ms(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.stop_timeout_ms, duration);
> @@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		      const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long timeout;
> +	unsigned long long timeout, clamped;
>   	int err;
>   
>   	/*
> @@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
> +	if (timeout != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
> @@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long delay;
> +	unsigned long long delay, clamped;
>   	int err;
>   
>   	/*
> @@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
> +	if (delay != clamped)
>   		return -EINVAL;
>   
>   	err = intel_engine_set_heartbeat(engine, delay);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 4b300b6cc0f9..a2d574f2fdd5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -262,6 +262,15 @@ struct guc_lrc_desc {
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
> +
>   struct guc_policies {
>   	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>   	/* In micro seconds. How much time to allow before DPC processing is
