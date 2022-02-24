Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B64C28B6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D879810F3F8;
	Thu, 24 Feb 2022 09:59:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B2610F36F;
 Thu, 24 Feb 2022 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645696751; x=1677232751;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sT/0DMweMnT6QVMSnItICZSe559aLzA6bNKMp8WtlA8=;
 b=W+VOkgykF9gHC/JCJdOak5fekBuHL90L9JlFm3CtG4UoeN5gAyTGoW6b
 MkKFeD1Ejo//xvktDUC+khE+b6+6mrsGJ9/1hD1HDPT1JfSOOvZcpIrpJ
 YSC1TD7OsUbkiC/+vhaUU2E+n2T1Q88AeFHpLJJZ24RvLahjW0xeg2DiX
 8zYLOa/0gtkofWrNDozpzdSLoe3Kl2Mj+9GEi4hS2YKARnQo5hR9pLWFp
 XEcEcWW8EgS+faf0FSOII05P2+YCXYbbJfrRC37HThfupW6lf6W9mlZ45
 Vib+HtRS/jlNIc8ro47oa5+/waDjcS6JfJO4DYYZiya7ZKaWAVxRTpVwr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="239592822"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="239592822"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 01:59:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="543652745"
Received: from cwadams-mobl2.ger.corp.intel.com (HELO [10.213.221.24])
 ([10.213.221.24])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 01:59:09 -0800
Message-ID: <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
Date: Thu, 24 Feb 2022 09:59:07 +0000
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
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
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


On 23/02/2022 19:03, John Harrison wrote:
> On 2/23/2022 04:13, Tvrtko Ursulin wrote:
>> On 23/02/2022 02:11, John Harrison wrote:
>>> On 2/22/2022 01:52, Tvrtko Ursulin wrote:
>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> GuC converts the pre-emption timeout and timeslice quantum values into
>>>>> clock ticks internally. That significantly reduces the point of 32bit
>>>>> overflow. On current platforms, worst case scenario is approximately
>>>>
>>>> Where does 32-bit come from, the GuC side? We already use 64-bits so 
>>>> that something to fix to start with. Yep...
>>> Yes, the GuC API is defined as 32bits only and then does a straight 
>>> multiply by the clock speed with no range checking. We have requested 
>>> 64bit support but there was push back on the grounds that it is not 
>>> something the GuC timer hardware supports and such long timeouts are 
>>> not real world usable anyway.
>>
>> As long as compute are happy with 100 seconds, then it "should be 
>> enough for everbody". :D
> Compute disable all forms of reset and rely on manual kill. So yes.
> 
> But even if they aren't. That's all we can do at the moment. If there is 
> a genuine customer requirement for more then we can push for full 64bit 
> software implemented timers in the GuC but until that happens, we don't 
> have much choice.

Yeah.

> 
>>
>>>>
>>>> ./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;
>>>>
>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>> engine->props.timeslice_duration_ms * 1000;
>>>>
>>>> ./gt/intel_engine_types.h:              unsigned long 
>>>> timeslice_duration_ms;
>>>>
>>>> timeslice_store/preempt_timeout_store:
>>>> err = kstrtoull(buf, 0, &duration);
>>>>
>>>> So both kconfig and sysfs can already overflow GuC, not only because 
>>>> of tick conversion internally but because at backend level nothing 
>>>> was done for assigning 64-bit into 32-bit. Or I failed to find where 
>>>> it is handled.
>>> That's why I'm adding this range check to make sure we don't allow 
>>> overflows.
>>
>> Yes and no, this fixes it, but the first bug was not only due GuC 
>> internal tick conversion. It was present ever since the u64 from i915 
>> was shoved into u32 sent to GuC. So even if GuC used the value without 
>> additional multiplication, bug was be there. My point being when GuC 
>> backend was added timeout_ms values should have been limited/clamped 
>> to U32_MAX. The tick discovery is additional limit on top.
> I'm not disagreeing. I'm just saying that the truncation wasn't noticed 
> until I actually tried using very long timeouts to debug a particular 
> problem. Now that it is noticed, we need some method of range checking 
> and this simple clamp solves all the truncation problems.

Agreed in principle, just please mention in the commit message all aspects of the problem.

I think we can get away without a Fixes: tag since it requires user fiddling to break things in unexpected ways.

I would though put in a code a clamping which expresses both, something like min(u32, ..GUC LIMIT..). So the full story is documented forever. Or "if > u32 || > ..GUC LIMIT..) return -EINVAL". Just in case GuC limit one day changes but u32 stays. Perhaps internal ticks go away or anything and we are left with plain 1:1 millisecond relationship.

>>>>> 110 seconds. Rather than allowing the user to set higher values and
>>>>> then get confused by early timeouts, add limits when setting these
>>>>> values.
>>>>
>>>> Btw who is reviewing GuC patches these days - things have somehow 
>>>> gotten pretty quiet in activity and I don't think that's due absence 
>>>> of stuff to improve or fix? Asking since I think I noticed a few 
>>>> already which you posted and then crickets on the mailing list.
>>> Too much work to do and not enough engineers to do it all :(.
>>>
>>>
>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>>>>   3 files changed, 38 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt 
>>>>> *gt, enum intel_engine_id id,
>>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>>>>           engine->props.preempt_timeout_ms = 0;
>>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>>> +        if (engine->props.timeslice_duration_ms > 
>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>
>>>> Hm "wanted".. There's been too much back and forth on the GuC load 
>>>> options over the years to keep track.. intel_engine_uses_guc work 
>>>> sounds like would work and read nicer.
>>> I'm not adding a new feature check here. I'm just using the existing 
>>> one. If we want to rename it yet again then that would be a different 
>>> patch set.
>>
>> $ grep intel_engine_uses_guc . -rl
>> ./i915_perf.c
>> ./i915_request.c
>> ./selftests/intel_scheduler_helpers.c
>> ./gem/i915_gem_context.c
>> ./gt/intel_context.c
>> ./gt/intel_engine.h
>> ./gt/intel_engine_cs.c
>> ./gt/intel_engine_heartbeat.c
>> ./gt/intel_engine_pm.c
>> ./gt/intel_reset.c
>> ./gt/intel_lrc.c
>> ./gt/selftest_context.c
>> ./gt/selftest_engine_pm.c
>> ./gt/selftest_hangcheck.c
>> ./gt/selftest_mocs.c
>> ./gt/selftest_workarounds.c
>>
>> Sounds better to me than intel_guc_submission_is_wanted. What does the 
>> reader know whether "is wanted" translates to "is actually used". 
>> Shrug on "is wanted".
> Yes, but isn't '_uses' the one that hits a BUG_ON if you call it too 
> early in the boot up sequence? I never understood why that was necessary 
> or why we need so many different ways to ask the same question. But this 
> version already exists and definitely works without hitting any explosions.

No idea if it causes a bug on, doesn't in the helper itself so maybe you are saying it is called too early? Might be.. I think over time the nice idea we had that "setup" and "init" phases of engine setup clearly separated got destroyed a bit. There would always be an option to move this clamping in a later phase, once the submission method is known. One could argue that if the submission method is not yet known at this point, it is even wrong to clamp based on something which will only be decided later. Because:

int intel_engines_init(struct intel_gt *gt)
{
	int (*setup)(struct intel_engine_cs *engine);
	struct intel_engine_cs *engine;
	enum intel_engine_id id;
	int err;

	if (intel_uc_uses_guc_submission(&gt->uc)) {
		gt->submission_method = INTEL_SUBMISSION_GUC;

So this uses "uses", not "wanted". Presumably the point for having "wanted" and "uses" is that they can disagree, in which case if you clamp early based on "wanted" that suggests it could be wrong.

>>>> And limit to class instead of applying to all engines looks like a 
>>>> miss.
>>> As per follow up email, the class limit is not applied here.
>>>
>>>>
>>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>> duration to %d to prevent possibly overflow\n",
>>>>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>>> +            engine->props.timeslice_duration_ms = 
>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>
>>>> I am not sure logging such message during driver load is useful. 
>>>> Sounds more like a confused driver which starts with one value and 
>>>> then overrides itself. I'd just silently set the value appropriate 
>>>> for the active backend. Preemption timeout kconfig text already 
>>>> documents the fact timeouts can get overriden at runtime depending 
>>>> on platform+engine. So maybe just add same text to timeslice kconfig.
>>> The point is to make people aware if they compile with unsupported 
>>> config options. As far as I know, there is no way to apply range 
>>> checking or other limits to config defines. Which means that a user 
>>> would silently get unwanted behaviour. That seems like a bad thing to 
>>> me. If the driver is confused because the user built it in a confused 
>>> manner then we should let them know.
>>
>> Okay, but I think make it notice low level.
>>
>> Also consider in patch 3/3 when you triple it, and then clamp back 
>> down here. That's even more confused state since tripling gets nerfed. 
>> I think that's also an argument to always account preempt timeout in 
>> heartbeat interval calculation. Haven't got to your reply on 2/3 yet 
>> though..
> That sounds like even more reason to make sure the warning gets seen. 
> The more complex the system and the more chances there are to get it 
> wrong, the more important it is to have a nice easy to see and 
> understand notification that it did go wrong.

I did not disagree, just said make it notice, one level higher than info! :)

But also think how, if we agree to go with tripling, that you'd have to consider that in the sysfs store when hearbeat timeout is written, to consider whether or not to triple and error out if preemption timeout is over limit.

>>>>> +        }
>>>>> +
>>>>> +        if (engine->props.preempt_timeout_ms > 
>>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>>>>> pre-emption timeout to %d to prevent possibly overflow\n",
>>>>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>>>>> +            engine->props.preempt_timeout_ms = 
>>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>       engine->defaults = engine->props; /* never to change again */
>>>>>         engine->context_size = intel_engine_context_size(gt, 
>>>>> engine->class);
>>>>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>>>>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>> index 967031056202..f57efe026474 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>>>>> kobj_attribute *attr,
>>>>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>>           return -EINVAL;
>>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>> +        drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>> duration to %lld to prevent possibly overflow\n",
>>>>> +             duration);
>>>>> +    }
>>>>
>>>> I would suggest to avoid duplicated clamping logic. Maybe hide the 
>>>> all backend logic into the helpers then, like maybe:
>>>>
>>>>   d = intel_engine_validate_timeslice/preempt_timeout(engine, 
>>>> duration);
>>>>   if (d != duration)
>>>>     return -EINVAL:
>>>>
>>>> Returning -EINVAL would be equivalent to existing behaviour:
>>>>
>>>>     if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>         return -EINVAL;
>>>>
>>>> That way userspace has explicit notification and read-back is 
>>>> identical to written in value. From engine setup you can just call 
>>>> the helper silently.
>>> Sure, EINVAL rather than clamping works as well. And can certainly 
>>> add helper wrappers. But as above, I don't like the idea of silently 
>>> disregarding a user specified config option.
>>
>> Deal - with the open of heartbeat interval TBD.
>>
>>>
>>>>
>>>>> +
>>>>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>>>>         if (execlists_active(&engine->execlists))
>>>>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>>>>> struct kobj_attribute *attr,
>>>>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>>           return -EINVAL;
>>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>>> +        drm_info(&engine->i915->drm, "Warning, clamping 
>>>>> pre-emption timeout to %lld to prevent possibly overflow\n",
>>>>> +             timeout);
>>>>> +    }
>>>>> +
>>>>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>>>>         if (READ_ONCE(engine->execlists.pending[0]))
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>> index 6a4612a852e2..ad131092f8df 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>>>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>>>>   +/*
>>>>> + * GuC converts the timeout to clock ticks internally. Different 
>>>>> platforms have
>>>>> + * different GuC clocks. Thus, the maximum value before overflow 
>>>>> is platform
>>>>> + * dependent. Current worst case scenario is about 110s. So, limit 
>>>>> to 100s to be
>>>>> + * safe.
>>>>> + */
>>>>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>>>>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>>>>
>>>> Most important question -
>>>> how will we know/notice if/when new GuC arrives where these timeouts 
>>>> would still overflow? Can this be queried somehow at runtime or 
>>>> where does the limit comes from? How is GuC told about it? Set in 
>>>> some field and it just allows too large values silently break things?
>>> Currently, we don't notice except by debugging peculiar test failures 
>>> :(.
>>>
>>> These limits are not in any GuC spec. Indeed, it took a while to 
>>> actually work out why increasing the value actually caused shorter 
>>> timeouts to occur! As above, there is no range checking inside GuC 
>>> itself. It does a truncated multiply which results in an effectively 
>>> random number and just happily uses it.
>>
>> I will agree with what Daniele said - push on GuC fw folks to document 
>> the max values they guarantee to support in the interface spec. 
>> Otherwise it is too fragile.
> I do agree. But that is going to take time. I would like to get 
> something merged now while we fight over spec updates.

Yeah that's okay, did not mean to imply I am against a quick fix. "Otherwise it is too fragile, *in the long run*" should have written or something like that.

Regards,

Tvrtko
