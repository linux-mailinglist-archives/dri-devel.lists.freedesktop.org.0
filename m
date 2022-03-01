Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D4A4C89A8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 11:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C91D10EC1D;
	Tue,  1 Mar 2022 10:51:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9E10EC0E;
 Tue,  1 Mar 2022 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646131861; x=1677667861;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4GB4qjiiZp+MaVtvQChHi+CT6NDxdKKe03RQpnpr8uI=;
 b=I1o7f9WsU11pBdzHra69ff6BaHbosk/SahW1TPkourkidfXn0OL0zFKL
 oz88UiuBw44B7NkkTL2uWLcpzmklcE45cqWdxjbPTDCLZ6Pbvz8zi46zp
 bS8DN818C11mY6fi3IdwsJYeoRBi4sx9OxJFKfqFg6p5UTg3WR8BN0dA6
 xmwGvwsm2gq9auJaJq+J15QpZf2Ucx51yys/WJAZyY1xLsQ5RRX30azUv
 aXzcoLfqwWaUW2t8XQanA1sAEpbV0JFw15g5VQR+SbcPHI4BmAsnDgu2R
 FUH56mMCxP927QuZNQJDkXgzQYDjK0PA3BrPNPi3NA5I4S6pwdSHz4ULo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="313828838"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="313828838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 02:51:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="510462472"
Received: from ssahani-mobl.amr.corp.intel.com (HELO [10.212.127.177])
 ([10.212.127.177])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 02:50:59 -0800
Message-ID: <d931b54e-0b89-877e-9a7f-ede3c3bf165f@linux.intel.com>
Date: Tue, 1 Mar 2022 10:50:57 +0000
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
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
 <74d30fd4-cb72-113e-fc09-12602b3cf06d@linux.intel.com>
 <986dae97-6c68-34cc-d972-22edaddf7261@intel.com>
 <4e8888d0-f0da-12f3-4010-159b4ff2bdb3@linux.intel.com>
 <fc96ce57-37f7-9962-6d15-1741de9fcd89@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fc96ce57-37f7-9962-6d15-1741de9fcd89@intel.com>
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


On 28/02/2022 18:32, John Harrison wrote:
> On 2/28/2022 08:11, Tvrtko Ursulin wrote:
>> On 25/02/2022 17:39, John Harrison wrote:
>>> On 2/25/2022 09:06, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/02/2022 19:19, John Harrison wrote:
>>>>
>>>> [snip]
>>>>
>>>>>>>>>> ./gt/uc/intel_guc_fwif.h: u32 execution_quantum;
>>>>>>>>>>
>>>>>>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>>>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>>>>>>
>>>>>>>>>> ./gt/intel_engine_types.h:              unsigned long 
>>>>>>>>>> timeslice_duration_ms;
>>>>>>>>>>
>>>>>>>>>> timeslice_store/preempt_timeout_store:
>>>>>>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>>>>>>
>>>>>>>>>> So both kconfig and sysfs can already overflow GuC, not only 
>>>>>>>>>> because of tick conversion internally but because at backend 
>>>>>>>>>> level nothing was done for assigning 64-bit into 32-bit. Or I 
>>>>>>>>>> failed to find where it is handled.
>>>>>>>>> That's why I'm adding this range check to make sure we don't 
>>>>>>>>> allow overflows.
>>>>>>>>
>>>>>>>> Yes and no, this fixes it, but the first bug was not only due 
>>>>>>>> GuC internal tick conversion. It was present ever since the u64 
>>>>>>>> from i915 was shoved into u32 sent to GuC. So even if GuC used 
>>>>>>>> the value without additional multiplication, bug was be there. 
>>>>>>>> My point being when GuC backend was added timeout_ms values 
>>>>>>>> should have been limited/clamped to U32_MAX. The tick discovery 
>>>>>>>> is additional limit on top.
>>>>>>> I'm not disagreeing. I'm just saying that the truncation wasn't 
>>>>>>> noticed until I actually tried using very long timeouts to debug 
>>>>>>> a particular problem. Now that it is noticed, we need some method 
>>>>>>> of range checking and this simple clamp solves all the truncation 
>>>>>>> problems.
>>>>>>
>>>>>> Agreed in principle, just please mention in the commit message all 
>>>>>> aspects of the problem.
>>>>>>
>>>>>> I think we can get away without a Fixes: tag since it requires 
>>>>>> user fiddling to break things in unexpected ways.
>>>>>>
>>>>>> I would though put in a code a clamping which expresses both, 
>>>>>> something like min(u32, ..GUC LIMIT..). So the full story is 
>>>>>> documented forever. Or "if > u32 || > ..GUC LIMIT..) return 
>>>>>> -EINVAL". Just in case GuC limit one day changes but u32 stays. 
>>>>>> Perhaps internal ticks go away or anything and we are left with 
>>>>>> plain 1:1 millisecond relationship.
>>>>> Can certainly add a comment along the lines of "GuC API only takes 
>>>>> a 32bit field but that is further reduced to GUC_LIMIT due to 
>>>>> internal calculations which would otherwise overflow".
>>>>>
>>>>> But if the GuC limit is > u32 then, by definition, that means the 
>>>>> GuC API has changed to take a u64 instead of a u32. So there will 
>>>>> no u32 truncation any more. So I'm not seeing a need to explicitly 
>>>>> test the integer size when the value check covers that.
>>>>
>>>> Hmm I was thinking if the internal conversion in the GuC fw changes 
>>>> so that GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS goes above u32, then to be 
>>>> extra safe by documenting in code there is the additional limit of 
>>>> the data structure field. Say the field was changed to take some 
>>>> unit larger than a millisecond. Then the check against the GuC MAX 
>>>> limit define would not be enough, unless that would account both for 
>>>> internal implementation and u32 in the protocol. Maybe that is 
>>>> overdefensive but I don't see that it harms. 50-50, but it's do it 
>>>> once and forget so I'd do it.
>>> Huh?
>>>
>>> How can the limit be greater than a u32 if the interface only takes a 
>>> u32? By definition the limit would be clamped to u32 size.
>>>
>>> If you mean that the GuC policy is in different units and those units 
>>> might not overflow but ms units do, then actually that is already the 
>>> case. The GuC works in us not ms. That's part of why the wrap around 
>>> is so low, we have to multiply by 1000 before sending to GuC. 
>>> However, that is actually irrelevant because the comparison is being 
>>> done on the i915 side in i915's units. We have to scale the GuC limit 
>>> to match what i915 is using. And the i915 side is u64 so if the 
>>> scaling to i915 numbers overflows a u32 then who cares because that 
>>> comparison can be done at 64 bits wide.
>>>
>>> If the units change then that is a backwards breaking API change that 
>>> will require a manual driver code update. You can't just recompile 
>>> with a new header and magically get an ms to us or ms to s conversion 
>>> in your a = b assignment. The code will need to be changed to do the 
>>> new unit conversion (note we already convert from ms to us, the GuC 
>>> API is all expressed in us). And that code change will mean having to 
>>> revisit any and all scaling, type conversions, etc. I.e. any 
>>> pre-existing checks will not necessarily be valid and will need to be 
>>> re-visted anyway. But as above, any scaling to GuC units has to be 
>>> incorporated into the limit already because otherwise the limit would 
>>> not fit in the GuC's own API.
>>
>> Yes I get that, I was just worried that u32 field in the protocol and 
>> GUC_POLICY_MAX_EXEC_QUANTUM_MS defines are separate in the source code 
>> and then how to protect against forgetting to update both in sync.
>>
>> Like if the protocol was changed to take nanoseconds, and firmware 
>> implementation changed to support the full range, but define 
>> left/forgotten at 100s. That would then overflow u32.
> Huh? If the API was updated to 'support the full range' then how can you 
> get overflow by forgetting to update the limit? You could get 
> unnecessary clamping, which hopefully would be noticed by whoever is 
> testing the new API and/or whoever requested the change. But you can't 
> get u32 overflow errors if all the code has been updated to u64.

1)
Change the protocol so that "u32 desc->execution_quantum" now takes nano seconds.

This now makes the maximum time 4.29.. seconds.

2)
Forget to update GUC_POLICY_MAX_EXEC_QUANTUM_MS from 100s, since for instance that part at that point still not part of the interface contract.

3)
User passes in 5 seconds.

Clamping check says all is good.

"engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS"

4)

Assignment was updated:

gt/uc/intel_guc_submission.c:

   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;

But someone did not realize field is u32.

   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;

Defensive solution:

   if (overflows_type(engine->props.timeslice_duration_ms * 1e6, desc->execution_quantum))
	drm_WARN_ON...

   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;

Regards,

Tvrtko

  
> John.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> John.
>>>
>>>>
>>>>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 
>>>>>>>>>>> +++++++++++++++
>>>>>>>>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 
>>>>>>>>>>> ++++++++++++++
>>>>>>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 9 +++++++++
>>>>>>>>>>>   3 files changed, 38 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct 
>>>>>>>>>>> intel_gt *gt, enum intel_engine_id id,
>>>>>>>>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == 
>>>>>>>>>>> RENDER_CLASS)
>>>>>>>>>>>           engine->props.preempt_timeout_ms = 0;
>>>>>>>>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>>>>>>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>>>>>>>>> +        if (engine->props.timeslice_duration_ms > 
>>>>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>>>>>>>
>>>>>>>>>> Hm "wanted".. There's been too much back and forth on the GuC 
>>>>>>>>>> load options over the years to keep track.. 
>>>>>>>>>> intel_engine_uses_guc work sounds like would work and read nicer.
>>>>>>>>> I'm not adding a new feature check here. I'm just using the 
>>>>>>>>> existing one. If we want to rename it yet again then that would 
>>>>>>>>> be a different patch set.
>>>>>>>>
>>>>>>>> $ grep intel_engine_uses_guc . -rl
>>>>>>>> ./i915_perf.c
>>>>>>>> ./i915_request.c
>>>>>>>> ./selftests/intel_scheduler_helpers.c
>>>>>>>> ./gem/i915_gem_context.c
>>>>>>>> ./gt/intel_context.c
>>>>>>>> ./gt/intel_engine.h
>>>>>>>> ./gt/intel_engine_cs.c
>>>>>>>> ./gt/intel_engine_heartbeat.c
>>>>>>>> ./gt/intel_engine_pm.c
>>>>>>>> ./gt/intel_reset.c
>>>>>>>> ./gt/intel_lrc.c
>>>>>>>> ./gt/selftest_context.c
>>>>>>>> ./gt/selftest_engine_pm.c
>>>>>>>> ./gt/selftest_hangcheck.c
>>>>>>>> ./gt/selftest_mocs.c
>>>>>>>> ./gt/selftest_workarounds.c
>>>>>>>>
>>>>>>>> Sounds better to me than intel_guc_submission_is_wanted. What 
>>>>>>>> does the reader know whether "is wanted" translates to "is 
>>>>>>>> actually used". Shrug on "is wanted".
>>>>>>> Yes, but isn't '_uses' the one that hits a BUG_ON if you call it 
>>>>>>> too early in the boot up sequence? I never understood why that 
>>>>>>> was necessary or why we need so many different ways to ask the 
>>>>>>> same question. But this version already exists and definitely 
>>>>>>> works without hitting any explosions.
>>>>>>
>>>>>> No idea if it causes a bug on, doesn't in the helper itself so 
>>>>>> maybe you are saying it is called too early? Might be.. I think 
>>>>>> over time the nice idea we had that "setup" and "init" phases of 
>>>>>> engine setup clearly separated got destroyed a bit. There would 
>>>>>> always be an option to move this clamping in a later phase, once 
>>>>>> the submission method is known. One could argue that if the 
>>>>>> submission method is not yet known at this point, it is even wrong 
>>>>>> to clamp based on something which will only be decided later. 
>>>>>> Because:
>>>>>>
>>>>>> int intel_engines_init(struct intel_gt *gt)
>>>>>> {
>>>>>>     int (*setup)(struct intel_engine_cs *engine);
>>>>>>     struct intel_engine_cs *engine;
>>>>>>     enum intel_engine_id id;
>>>>>>     int err;
>>>>>>
>>>>>>     if (intel_uc_uses_guc_submission(&gt->uc)) {
>>>>>>         gt->submission_method = INTEL_SUBMISSION_GUC;
>>>>>>
>>>>>> So this uses "uses", not "wanted". Presumably the point for having 
>>>>>> "wanted" and "uses" is that they can disagree, in which case if 
>>>>>> you clamp early based on "wanted" that suggests it could be wrong.
>>>>>
>>>>> Okay, looks like I was getting confused with intel_guc_is_used(). 
>>>>> That one blows up if called too early.
>>>>>
>>>>> I'll change it to _uses_ and repost, then.
>>>>
>>>> Check that it isn't called too early, before gt->submission_setup is 
>>>> set.
>>> Obviously it is because it blew up. But I am not re-writing the 
>>> driver start up sequence just to use the word 'use' instead of 'want'.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>>>> And limit to class instead of applying to all engines looks 
>>>>>>>>>> like a miss.
>>>>>>>>> As per follow up email, the class limit is not applied here.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>>>>>>>> duration to %d to prevent possibly overflow\n",
>>>>>>>>>>> + GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>>>>>>>>> + engine->props.timeslice_duration_ms = 
>>>>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>>>>>>>
>>>>>>>>>> I am not sure logging such message during driver load is 
>>>>>>>>>> useful. Sounds more like a confused driver which starts with 
>>>>>>>>>> one value and then overrides itself. I'd just silently set the 
>>>>>>>>>> value appropriate for the active backend. Preemption timeout 
>>>>>>>>>> kconfig text already documents the fact timeouts can get 
>>>>>>>>>> overriden at runtime depending on platform+engine. So maybe 
>>>>>>>>>> just add same text to timeslice kconfig.
>>>>>>>>> The point is to make people aware if they compile with 
>>>>>>>>> unsupported config options. As far as I know, there is no way 
>>>>>>>>> to apply range checking or other limits to config defines. 
>>>>>>>>> Which means that a user would silently get unwanted behaviour. 
>>>>>>>>> That seems like a bad thing to me. If the driver is confused 
>>>>>>>>> because the user built it in a confused manner then we should 
>>>>>>>>> let them know.
>>>>>>>>
>>>>>>>> Okay, but I think make it notice low level.
>>>>>>>>
>>>>>>>> Also consider in patch 3/3 when you triple it, and then clamp 
>>>>>>>> back down here. That's even more confused state since tripling 
>>>>>>>> gets nerfed. I think that's also an argument to always account 
>>>>>>>> preempt timeout in heartbeat interval calculation. Haven't got 
>>>>>>>> to your reply on 2/3 yet though..
>>>>>>> That sounds like even more reason to make sure the warning gets 
>>>>>>> seen. The more complex the system and the more chances there are 
>>>>>>> to get it wrong, the more important it is to have a nice easy to 
>>>>>>> see and understand notification that it did go wrong.
>>>>>>
>>>>>> I did not disagree, just said make it notice, one level higher 
>>>>>> than info! :)
>>>>> But then it won't appear unless you have explicitly said an 
>>>>> elevated debug level. Whereas info appears in dmesg by default (but 
>>>>> is still not classed as an error by CI and such).
>>>>
>>>> Notice is higher than info! :) If info appears by default so does 
>>>> notice, warning, err, etc...
>>> Doh! I could have sworn those were the other way around.
>>>
>>> Okay. Will update to use notice :).
>>>
>>>>
>>>> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
>>>> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken 
>>>> immediately */
>>>> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
>>>> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>>>> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>>>> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant 
>>>> condition */
>>>> #define KERN_INFO       KERN_SOH "6"    /* informational */
>>>> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>>>>
>>>>>> But also think how, if we agree to go with tripling, that you'd 
>>>>>> have to consider that in the sysfs store when hearbeat timeout is 
>>>>>> written, to consider whether or not to triple and error out if 
>>>>>> preemption timeout is over limit.
>>>>> I see this as just setting the default values. If an end user is 
>>>>> explicitly overriding the defaults then we should obey what they 
>>>>> have requested. If they are changing the heartbeat interval then 
>>>>> they can also change the pre-emption timeout appropriately.
>>>>
>>>> Question is can they unknowingly and without any feedback configure 
>>>> a much worse state than they expect? Like when they set heartbeats 
>>>> up to some value, everything is configured as you intended - but if 
>>>> you go over a certain hidden limit the overall scheme degrades in 
>>>> some way. What is the failure mode here if you silently let them do 
>>>> that?
>>> You can always configure things to be worse than expected. If you 
>>> don't understand what you are doing then any control can make things 
>>> worse instead of better. The assumption is that if a user is savvy 
>>> enough to be writing to sysfs overrides of kernel parameters then 
>>> they know what those parameters are and what their implications are. 
>>> If they want to set a very short heartbeat with a very long 
>>> pre-emption timeout then its their problem if they hit frequent TDRs. 
>>> Conversely, if they want to set a very long heartbeat with a very 
>>> short pre-emption timeout then its still their problem if they hit 
>>> frequent TDRs.
>>>
>>> But if the user explicitly requests a heartbeat period of 3s and a 
>>> pre-emption timeout of 2s and the i915 arbitrarily splats their 2s 
>>> and makes it 9s then that is wrong.
>>>
>>> We should give the driver defaults that work for the majority of 
>>> users and then let the minority specify exactly what they need.
>>>
>>> And there is no silent or hidden limit. If the user specifies a value 
>>> too large then they will get -EINVAL. Nothing hidden or silent about 
>>> that. Any other values are legal and the behaviour will be whatever 
>>> has been requested.
>>>
>>> John.
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>
> 
