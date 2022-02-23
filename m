Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497B4C1287
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 13:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A8A10EC5E;
	Wed, 23 Feb 2022 12:13:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC3210EC37;
 Wed, 23 Feb 2022 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645618428; x=1677154428;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fxlOa2pO6dl2ezOK3f4DYMmMqWT/rfUT4TzUF6lxrRs=;
 b=g/3uJyllfQgLA0I1jyGme90wImHFLM21u/0I9Vh2m99cTthpbcah4QUr
 HyLC0b+nIvCrrk8u7gPW0+C1RnlFJb19ytwzsWpxWsKoxMJ9c1gQA9qoJ
 UkrcCW+x+ElEXl8ALnJamfyGkaP/J6wEk7ovD99dd7QTJmHgSe3qbRLUu
 nULXYsuFtNAOxt4esAYnYIcVhiDdeKG6B7IX2s9x6M5l9WTXKTisRBIr0
 ZlTW0ouNh8gFz01tJEz3mCMVdwVhPqMumxGnheso14WkklJBIwhu9qf8d
 25K/PW3m2v6l/Qqt0hDvJhN8bjlO5CBacA1dLjY3U1omeT1tlSry5M2X2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276568032"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="276568032"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:13:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="707009862"
Received: from lportx-mobl3.ger.corp.intel.com (HELO [10.213.242.198])
 ([10.213.242.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:13:47 -0800
Message-ID: <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
Date: Wed, 23 Feb 2022 12:13:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
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


On 23/02/2022 02:11, John Harrison wrote:
> On 2/22/2022 01:52, Tvrtko Ursulin wrote:
>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> GuC converts the pre-emption timeout and timeslice quantum values into
>>> clock ticks internally. That significantly reduces the point of 32bit
>>> overflow. On current platforms, worst case scenario is approximately
>>
>> Where does 32-bit come from, the GuC side? We already use 64-bits so 
>> that something to fix to start with. Yep...
> Yes, the GuC API is defined as 32bits only and then does a straight 
> multiply by the clock speed with no range checking. We have requested 
> 64bit support but there was push back on the grounds that it is not 
> something the GuC timer hardware supports and such long timeouts are not 
> real world usable anyway.

As long as compute are happy with 100 seconds, then it "should be enough 
for everbody". :D

>>
>> ./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;
>>
>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>> engine->props.timeslice_duration_ms * 1000;
>>
>> ./gt/intel_engine_types.h:              unsigned long 
>> timeslice_duration_ms;
>>
>> timeslice_store/preempt_timeout_store:
>> err = kstrtoull(buf, 0, &duration);
>>
>> So both kconfig and sysfs can already overflow GuC, not only because 
>> of tick conversion internally but because at backend level nothing was 
>> done for assigning 64-bit into 32-bit. Or I failed to find where it is 
>> handled.
> That's why I'm adding this range check to make sure we don't allow 
> overflows.

Yes and no, this fixes it, but the first bug was not only due GuC 
internal tick conversion. It was present ever since the u64 from i915 
was shoved into u32 sent to GuC. So even if GuC used the value without 
additional multiplication, bug was be there. My point being when GuC 
backend was added timeout_ms values should have been limited/clamped to 
U32_MAX. The tick discovery is additional limit on top.

>>> 110 seconds. Rather than allowing the user to set higher values and
>>> then get confused by early timeouts, add limits when setting these
>>> values.
>>
>> Btw who is reviewing GuC patches these days - things have somehow 
>> gotten pretty quiet in activity and I don't think that's due absence 
>> of stuff to improve or fix? Asking since I think I noticed a few 
>> already which you posted and then crickets on the mailing list.
> Too much work to do and not enough engineers to do it all :(.
> 
> 
>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>>   3 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt 
>>> *gt, enum intel_engine_id id,
>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>>           engine->props.preempt_timeout_ms = 0;
>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>> +        if (engine->props.timeslice_duration_ms > 
>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>
>> Hm "wanted".. There's been too much back and forth on the GuC load 
>> options over the years to keep track.. intel_engine_uses_guc work 
>> sounds like would work and read nicer.
> I'm not adding a new feature check here. I'm just using the existing 
> one. If we want to rename it yet again then that would be a different 
> patch set.

$ grep intel_engine_uses_guc . -rl
./i915_perf.c
./i915_request.c
./selftests/intel_scheduler_helpers.c
./gem/i915_gem_context.c
./gt/intel_context.c
./gt/intel_engine.h
./gt/intel_engine_cs.c
./gt/intel_engine_heartbeat.c
./gt/intel_engine_pm.c
./gt/intel_reset.c
./gt/intel_lrc.c
./gt/selftest_context.c
./gt/selftest_engine_pm.c
./gt/selftest_hangcheck.c
./gt/selftest_mocs.c
./gt/selftest_workarounds.c

Sounds better to me than intel_guc_submission_is_wanted. What does the 
reader know whether "is wanted" translates to "is actually used". Shrug 
on "is wanted".

>> And limit to class instead of applying to all engines looks like a miss.
> As per follow up email, the class limit is not applied here.
> 
>>
>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice duration 
>>> to %d to prevent possibly overflow\n",
>>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>> +            engine->props.timeslice_duration_ms = 
>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>
>> I am not sure logging such message during driver load is useful. 
>> Sounds more like a confused driver which starts with one value and 
>> then overrides itself. I'd just silently set the value appropriate for 
>> the active backend. Preemption timeout kconfig text already documents 
>> the fact timeouts can get overriden at runtime depending on 
>> platform+engine. So maybe just add same text to timeslice kconfig.
> The point is to make people aware if they compile with unsupported 
> config options. As far as I know, there is no way to apply range 
> checking or other limits to config defines. Which means that a user 
> would silently get unwanted behaviour. That seems like a bad thing to 
> me. If the driver is confused because the user built it in a confused 
> manner then we should let them know.

Okay, but I think make it notice low level.

Also consider in patch 3/3 when you triple it, and then clamp back down 
here. That's even more confused state since tripling gets nerfed. I 
think that's also an argument to always account preempt timeout in 
heartbeat interval calculation. Haven't got to your reply on 2/3 yet 
though..

>>
>>> +        }
>>> +
>>> +        if (engine->props.preempt_timeout_ms > 
>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>>> pre-emption timeout to %d to prevent possibly overflow\n",
>>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>>> +            engine->props.preempt_timeout_ms = 
>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>> +        }
>>> +    }
>>> +
>>>       engine->defaults = engine->props; /* never to change again */
>>>         engine->context_size = intel_engine_context_size(gt, 
>>> engine->class);
>>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> index 967031056202..f57efe026474 100644
>>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>           return -EINVAL;
>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>> +        drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>> duration to %lld to prevent possibly overflow\n",
>>> +             duration);
>>> +    }
>>
>> I would suggest to avoid duplicated clamping logic. Maybe hide the all 
>> backend logic into the helpers then, like maybe:
>>
>>   d = intel_engine_validate_timeslice/preempt_timeout(engine, duration);
>>   if (d != duration)
>>     return -EINVAL:
>>
>> Returning -EINVAL would be equivalent to existing behaviour:
>>
>>     if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>         return -EINVAL;
>>
>> That way userspace has explicit notification and read-back is 
>> identical to written in value. From engine setup you can just call the 
>> helper silently.
> Sure, EINVAL rather than clamping works as well. And can certainly add 
> helper wrappers. But as above, I don't like the idea of silently 
> disregarding a user specified config option.

Deal - with the open of heartbeat interval TBD.

> 
>>
>>> +
>>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>>         if (execlists_active(&engine->execlists))
>>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>>> struct kobj_attribute *attr,
>>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>           return -EINVAL;
>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>> +        drm_info(&engine->i915->drm, "Warning, clamping pre-emption 
>>> timeout to %lld to prevent possibly overflow\n",
>>> +             timeout);
>>> +    }
>>> +
>>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>>         if (READ_ONCE(engine->execlists.pending[0]))
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
>>
>> Most important question -
>> how will we know/notice if/when new GuC arrives where these timeouts 
>> would still overflow? Can this be queried somehow at runtime or where 
>> does the limit comes from? How is GuC told about it? Set in some field 
>> and it just allows too large values silently break things?
> Currently, we don't notice except by debugging peculiar test failures :(.
> 
> These limits are not in any GuC spec. Indeed, it took a while to 
> actually work out why increasing the value actually caused shorter 
> timeouts to occur! As above, there is no range checking inside GuC 
> itself. It does a truncated multiply which results in an effectively 
> random number and just happily uses it.

I will agree with what Daniele said - push on GuC fw folks to document 
the max values they guarantee to support in the interface spec. 
Otherwise it is too fragile.

Regards,

Tvrtko
