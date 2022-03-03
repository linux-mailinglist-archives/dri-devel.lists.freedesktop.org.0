Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234004CBB00
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB7A10EDCD;
	Thu,  3 Mar 2022 10:07:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7310EDA7;
 Thu,  3 Mar 2022 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646302020; x=1677838020;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7zdLWDU6ZDuGYsW3QFIq03GZd5K+55KJtsDt8kfse/s=;
 b=gDKx1jSX7RXejKCPliCSTfE5gyu3RmTVP+A7IcobWuaLyBcWSPxtNtMH
 XSL24GkVkBuuoCGUYBluo6uy4wOSLvbaCHmk1bTy1EWewRjbjCIKinGMw
 CT228rmlSPEntBvvANHI1mTFpKCwjVmnwPXyTcvDhqNnvtel2mr0cxQRX
 7KEnOe4w92GfNrzHPaZiiohXACivkKH65XhqqsLhtAD+IS0Iw7qy9kzYQ
 D4NyWxpOSf0KLjEXsMTdu5kbHRLecQPBffr2nR6044LZ8Cc20UJHYNbBA
 XoNfzzK7MnUWLmSQBEEf3bRKvL22v+rHAwGfNzUhKh6kYEGU/CP6ZDVjL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237145143"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="237145143"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:06:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="508535584"
Received: from gerar12x-mobl1.ger.corp.intel.com (HELO [10.213.222.145])
 ([10.213.222.145])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:06:58 -0800
Message-ID: <a67d2a44-bbe8-2e62-4d5a-02a95217c253@linux.intel.com>
Date: Thu, 3 Mar 2022 10:06:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/i915/guc: Limit scheduling
 properties to avoid overflow
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
 <20220225204151.2248027-2-John.C.Harrison@Intel.com>
 <abf830db-d613-8374-038f-c0d2a93df73f@linux.intel.com>
 <8edadd30-cefb-c0aa-6078-cfa62bba543c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8edadd30-cefb-c0aa-6078-cfa62bba543c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 02/03/2022 18:22, John Harrison wrote:
> On 3/2/2022 01:49, Tvrtko Ursulin wrote:
>> On 25/02/2022 20:41, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> GuC converts the pre-emption timeout and timeslice quantum values into
>>> clock ticks internally. That significantly reduces the point of 32bit
>>> overflow. On current platforms, worst case scenario is approximately
>>> 110 seconds. Rather than allowing the user to set higher values and
>>> then get confused by early timeouts, add limits when setting these
>>> values.
>>>
>>> v2: Add helper functins for clamping (review feedback from Tvrtko).
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
>>> (v1)
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_engine.h      |  6 ++
>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 69 +++++++++++++++++++++
>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 25 +++++---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++
>>>   4 files changed, 99 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> index be4b1e65442f..5a9186f784c4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> @@ -349,4 +349,10 @@ intel_engine_get_hung_context(struct 
>>> intel_engine_cs *engine)
>>>       return engine->hung_ce;
>>>   }
>>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>>> *engine, u64 value);
>>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>>> *engine, u64 value);
>>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>>> u64 value);
>>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>>> value);
>>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>>> *engine, u64 value);
>>> +
>>>   #endif /* _INTEL_RINGBUFFER_H_ */
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index e855c801ba28..7ad9e6006656 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -399,6 +399,26 @@ static int intel_engine_setup(struct intel_gt 
>>> *gt, enum intel_engine_id id,
>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>>           engine->props.preempt_timeout_ms = 0;
>>>   +    /* Cap properties according to any system limits */
>>> +#define CLAMP_PROP(field) \
>>> +    do { \
>>> +        u64 clamp = intel_clamp_##field(engine, engine->props.field); \
>>> +        if (clamp != engine->props.field) { \
>>> +            drm_notice(&engine->i915->drm, \
>>> +                   "Warning, clamping %s to %lld to prevent 
>>> overflow\n", \
>>> +                   #field, clamp); \
>>> +            engine->props.field = clamp; \
>>> +        } \
>>> +    } while (0)
>>> +
>>> +    CLAMP_PROP(heartbeat_interval_ms);
>>> +    CLAMP_PROP(max_busywait_duration_ns);
>>> +    CLAMP_PROP(preempt_timeout_ms);
>>> +    CLAMP_PROP(stop_timeout_ms);
>>> +    CLAMP_PROP(timeslice_duration_ms);
>>> +
>>> +#undef CLAMP_PROP
>>> +
>>>       engine->defaults = engine->props; /* never to change again */
>>>         engine->context_size = intel_engine_context_size(gt, 
>>> engine->class);
>>> @@ -421,6 +441,55 @@ static int intel_engine_setup(struct intel_gt 
>>> *gt, enum intel_engine_id id,
>>>       return 0;
>>>   }
>>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>>> *engine, u64 value)
>>> +{
>>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>>> +
>>> +    return value;
>>> +}
>>> +
>>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>>> *engine, u64 value)
>>> +{
>>> +    value = min(value, jiffies_to_nsecs(2));
>>> +
>>> +    return value;
>>> +}
>>> +
>>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>>> u64 value)
>>> +{
>>> +    /*
>>> +     * NB: The GuC API only supports 32bit values. However, the 
>>> limit is further
>>> +     * reduced due to internal calculations which would otherwise 
>>> overflow.
>>> +     */
>>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>>> +        value = min_t(u64, value, GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>>> +
>>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>>> +
>>> +    return value;
>>> +}
>>> +
>>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>>> value)
>>> +{
>>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>>> +
>>> +    return value;
>>> +}
>>> +
>>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>>> *engine, u64 value)
>>> +{
>>> +    /*
>>> +     * NB: The GuC API only supports 32bit values. However, the 
>>> limit is further
>>> +     * reduced due to internal calculations which would otherwise 
>>> overflow.
>>> +     */
>>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>>> +        value = min_t(u64, value, GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>> +
>>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>>> +
>>> +    return value;
>>> +}
>>> +
>>>   static void __setup_engine_capabilities(struct intel_engine_cs 
>>> *engine)
>>>   {
>>>       struct drm_i915_private *i915 = engine->i915;
>>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> index 967031056202..f2d9858d827c 100644
>>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> @@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>              const char *buf, size_t count)
>>>   {
>>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>>> -    unsigned long long duration;
>>> +    unsigned long long duration, clamped;
>>>       int err;
>>>         /*
>>> @@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>       if (err)
>>>           return err;
>>>   -    if (duration > jiffies_to_nsecs(2))
>>> +    clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
>>> +    if (duration != clamped)
>>>           return -EINVAL;
>>>         WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
>>> @@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>           const char *buf, size_t count)
>>>   {
>>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>>> -    unsigned long long duration;
>>> +    unsigned long long duration, clamped;
>>>       int err;
>>>         /*
>>> @@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>       if (err)
>>>           return err;
>>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>> +    clamped = intel_clamp_timeslice_duration_ms(engine, duration);
>>> +    if (duration != clamped)
>>>           return -EINVAL;
>>>         WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>> @@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>          const char *buf, size_t count)
>>>   {
>>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>>> -    unsigned long long duration;
>>> +    unsigned long long duration, clamped;
>>>       int err;
>>>         /*
>>> @@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>       if (err)
>>>           return err;
>>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>> +    clamped = intel_clamp_stop_timeout_ms(engine, duration);
>>> +    if (duration != clamped)
>>>           return -EINVAL;
>>>         WRITE_ONCE(engine->props.stop_timeout_ms, duration);
>>> @@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, 
>>> struct kobj_attribute *attr,
>>>                 const char *buf, size_t count)
>>>   {
>>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>>> -    unsigned long long timeout;
>>> +    unsigned long long timeout, clamped;
>>>       int err;
>>>         /*
>>> @@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, 
>>> struct kobj_attribute *attr,
>>>       if (err)
>>>           return err;
>>>   -    if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>> +    clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
>>> +    if (timeout != clamped)
>>>           return -EINVAL;
>>>         WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>> @@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>           const char *buf, size_t count)
>>>   {
>>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>>> -    unsigned long long delay;
>>> +    unsigned long long delay, clamped;
>>>       int err;
>>>         /*
>>> @@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>       if (err)
>>>           return err;
>>>   -    if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>> +    clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
>>> +    if (delay != clamped)
>>>           return -EINVAL;
>>>         err = intel_engine_set_heartbeat(engine, delay);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> index 6a4612a852e2..ad131092f8df 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>>   +/*
>>> + * GuC converts the timeout to clock ticks internally. Different 
>>> platforms have
>>> + * different GuC clocks. Thus, the maximum value before overflow is 
>>> platform
>>> + * dependent. Current worst case scenario is about 110s. So, limit 
>>> to 100s to be
>>> + * safe.
>>> + */
>>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>>> +
>>>   struct guc_policies {
>>>       u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>>>       /* In micro seconds. How much time to allow before DPC 
>>> processing is
>>
>> LGTM. Pretty please:
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b3a429a92c0d..8208164c25e7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2218,13 +2218,24 @@ static inline u32 
>> get_children_join_value(struct intel_context *ce,
>>  static void guc_context_policy_init(struct intel_engine_cs *engine,
>>                                     struct guc_lrc_desc *desc)
>>  {
>> +       struct drm_device *drm = &engine->i915->drm;
>> +
>>         desc->policy_flags = 0;
>>
>>         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>                 desc->policy_flags |= 
>> CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
>>
>>         /* NB: For both of these, zero means disabled. */
>> +       if (overflows_type(engine->props.timeslice_duration_ms * 1000,
>> +                          desc->execution_quantum))
>> +               drm_warn_once(drm, "GuC interface cannot support %lums 
>> timeslice!\n",
>> + engine->props.timeslice_duration_ms);
>>         desc->execution_quantum = engine->props.timeslice_duration_ms 
>> * 1000;
>> +
>> +       if (overflows_type(engine->props.preempt_timeout_ms * 1000,
>> +                          desc->preemption_timeout))
>> +               drm_warn_once(drm, "GuC interface cannot support %lums 
>> preemption timeout!\n",
>> + engine->props.preempt_timeout_ms);
>>         desc->preemption_timeout = engine->props.preempt_timeout_ms * 
>> 1000;
>>  }
>>
> As per comments in other thread, this is redundant code and is too late 
> in the chain to do anything. If such a check is present then should be a 
> BUG not a drm_warn. The whole point of the helper function is to 
> consolidate all limits in one place at the point where it is still 
> possible to correct for problems.

You could put this check in the clamp helpers. I not sure it would look 
amazing since it needs access to struct guc_lrc_desc, which is much 
lower layer, but perhaps it would be passable since some implementation 
knowledge (MAX_SCHEDULE_TIMEOUT) is already there. Maybe by the time you 
multiply by 1000 to check it start looking too ugly. Not sure. I would 
just stick with the above diff. Point is not whether it is too late or 
not, point is just to have a marker which would let us know we forgot 
about something, if it comes to it. Could also be a drm_WARN_ON_ONCE, no 
strong preference from my side.

Regards,

Tvrtko
