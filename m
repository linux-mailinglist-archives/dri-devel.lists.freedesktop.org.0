Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922FE4D5FE1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 11:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DF410E8E5;
	Fri, 11 Mar 2022 10:40:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5910E8E3;
 Fri, 11 Mar 2022 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646995214; x=1678531214;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ahoMELmiybAmi8wGMYc4ITeOeHJPEyFEQtxQWLUheMs=;
 b=EYaJhgiJTujeQl6uh7wPlqy9/3EtbE2cBkRaNMB0yizspPE1aIQQ2gJt
 T23iDtgCyUSGvhkab1IwDn0yHLgB5tYvUlO9OClpZO7Ltfs1dzI/MieaA
 g9WpZqzPX/+0eY8j2IveGEEj4tqm/m9MBHr1wFzVOVohit7P3C+NfEvg6
 c6+lvr9+ZHMoXZs7JZN1upYbIoGY/SYyzPIzRDI0dIoPL/BHTAENVv3Lg
 uGtkoqaInOYnsA6pJNcSFZcDO0NiDJR6KFHfrl9b+sf3427WmrDNEg8BD
 VwOgxBcpF9zzhykdfgJxOLeyx9lTKrwdhYP6jZwLLlRrQzYt574mU777w Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="237721962"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="237721962"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 02:40:03 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="555255503"
Received: from bmeaney-mobl.ger.corp.intel.com (HELO [10.213.199.126])
 ([10.213.199.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 02:40:02 -0800
Message-ID: <1acd134e-c7b1-8334-54d0-48ce41810a36@linux.intel.com>
Date: Fri, 11 Mar 2022 10:39:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 4/4] drm/i915: Improve long running OCL w/a
 for GuC submission
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-5-John.C.Harrison@Intel.com>
 <71a0f9af-7473-ece9-dae8-bcc1c3b55cf5@linux.intel.com>
 <991c5d38-7904-dff8-e610-c4030e526e2e@intel.com>
 <6f61e906-8149-6b39-c1ec-1b44f1bb3ca5@linux.intel.com>
 <98d7ab11-e47d-e642-96b7-b7643d19611a@intel.com>
 <7b1ca52b-3881-d1fc-a64b-6e85271954a7@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <7b1ca52b-3881-d1fc-a64b-6e85271954a7@linux.intel.com>
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


On 11/03/2022 10:07, Tvrtko Ursulin wrote:
> 
> On 10/03/2022 20:24, John Harrison wrote:
>> On 3/10/2022 01:27, Tvrtko Ursulin wrote:
>>> On 09/03/2022 21:16, John Harrison wrote:
>>>> On 3/8/2022 01:41, Tvrtko Ursulin wrote:
>>>>> On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> A workaround was added to the driver to allow OpenCL workloads to run
>>>>>> 'forever' by disabling pre-emption on the RCS engine for Gen12.
>>>>>> It is not totally unbound as the heartbeat will kick in eventually
>>>>>> and cause a reset of the hung engine.
>>>>>>
>>>>>> However, this does not work well in GuC submission mode. In GuC mode,
>>>>>> the pre-emption timeout is how GuC detects hung contexts and triggers
>>>>>> a per engine reset. Thus, disabling the timeout means also losing all
>>>>>> per engine reset ability. A full GT reset will still occur when the
>>>>>> heartbeat finally expires, but that is a much more destructive and
>>>>>> undesirable mechanism.
>>>>>>
>>>>>> The purpose of the workaround is actually to give OpenCL tasks longer
>>>>>> to reach a pre-emption point after a pre-emption request has been
>>>>>> issued. This is necessary because Gen12 does not support mid-thread
>>>>>> pre-emption and OpenCL can have long running threads.
>>>>>>
>>>>>> So, rather than disabling the timeout completely, just set it to a
>>>>>> 'long' value.
>>>>>>
>>>>>> v2: Review feedback from Tvrtko - must hard code the 'long' value
>>>>>> instead of determining it algorithmically. So make it an extra CONFIG
>>>>>> definition. Also, remove the execlist centric comment from the
>>>>>> existing pre-emption timeout CONFIG option given that it applies to
>>>>>> more than just execlists.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> Reviewed-by: Daniele Ceraolo Spurio 
>>>>>> <daniele.ceraolospurio@intel.com> (v1)
>>>>>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/Kconfig.profile      | 26 
>>>>>> +++++++++++++++++++----
>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>>>>>>   2 files changed, 29 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/Kconfig.profile 
>>>>>> b/drivers/gpu/drm/i915/Kconfig.profile
>>>>>> index 39328567c200..7cc38d25ee5c 100644
>>>>>> --- a/drivers/gpu/drm/i915/Kconfig.profile
>>>>>> +++ b/drivers/gpu/drm/i915/Kconfig.profile
>>>>>> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>>>>>>       default 640 # milliseconds
>>>>>>       help
>>>>>>         How long to wait (in milliseconds) for a preemption event 
>>>>>> to occur
>>>>>> -      when submitting a new context via execlists. If the current 
>>>>>> context
>>>>>> -      does not hit an arbitration point and yield to HW before 
>>>>>> the timer
>>>>>> -      expires, the HW will be reset to allow the more important 
>>>>>> context
>>>>>> -      to execute.
>>>>>> +      when submitting a new context. If the current context does 
>>>>>> not hit
>>>>>> +      an arbitration point and yield to HW before the timer 
>>>>>> expires, the
>>>>>> +      HW will be reset to allow the more important context to 
>>>>>> execute.
>>>>>> +
>>>>>> +      This is adjustable via
>>>>>> +      /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>>>>> +
>>>>>> +      May be 0 to disable the timeout.
>>>>>> +
>>>>>> +      The compiled in default may get overridden at driver probe 
>>>>>> time on
>>>>>> +      certain platforms and certain engines which will be 
>>>>>> reflected in the
>>>>>> +      sysfs control.
>>>>>> +
>>>>>> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
>>>>>> +    int "Preempt timeout for compute engines (ms, jiffy 
>>>>>> granularity)"
>>>>>> +    default 7500 # milliseconds
>>>>>> +    help
>>>>>> +      How long to wait (in milliseconds) for a preemption event 
>>>>>> to occur
>>>>>> +      when submitting a new context to a compute capable engine. 
>>>>>> If the
>>>>>> +      current context does not hit an arbitration point and yield 
>>>>>> to HW
>>>>>> +      before the timer expires, the HW will be reset to allow the 
>>>>>> more
>>>>>> +      important context to execute.
>>>>>>           This is adjustable via
>>>>>>         /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> index 4185c7338581..cc0954ad836a 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> @@ -438,9 +438,14 @@ static int intel_engine_setup(struct intel_gt 
>>>>>> *gt, enum intel_engine_id id,
>>>>>>       engine->props.timeslice_duration_ms =
>>>>>>           CONFIG_DRM_I915_TIMESLICE_DURATION;
>>>>>>   -    /* Override to uninterruptible for OpenCL workloads. */
>>>>>> +    /*
>>>>>> +     * Mid-thread pre-emption is not available in Gen12. 
>>>>>> Unfortunately,
>>>>>> +     * some OpenCL workloads run quite long threads. That means 
>>>>>> they get
>>>>>> +     * reset due to not pre-empting in a timely manner. So, bump the
>>>>>> +     * pre-emption timeout value to be much higher for compute 
>>>>>> engines.
>>>>>> +     */
>>>>>>       if (GRAPHICS_VER(i915) == 12 && (engine->flags & 
>>>>>> I915_ENGINE_HAS_RCS_REG_STATE))
>>>>>> -        engine->props.preempt_timeout_ms = 0;
>>>>>> +        engine->props.preempt_timeout_ms = 
>>>>>> CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>>>>>
>>>>> I wouldn't go as far as adding a config option since as it is it 
>>>>> only applies to Gen12 but Kconfig text says nothing about that. And 
>>>>> I am not saying you should add a Gen12 specific config option, that 
>>>>> would be weird. So IMO just drop it.
>>>>>
>>>> You were the one arguing that the driver was illegally overriding 
>>>> the user's explicitly chosen settings, including the compile time 
>>>> config 
>>>
>>> This is a bit out of context and illegally don't think used, so 
>>> misrepresents the earlier discussion. And I certainly did not suggest 
>>> a kconfig option.
>> My recollection is that you clearly stated the i915 driver should not 
>> be overriding the user's settings. To me, that makes any override an 
>> illegal operation.
>>
>> You did not suggest a Kconfig option but the settings in question are 
>> all coming from existing Kconfig options. Putting an explicit "timeout 
>> = 7500;" in the code is the worst of all worlds. It is an override of 
>> a user setting and it is an unmodifiable magic number. The first you 
>> have stated is not allowed and the second is one of the biggest 
>> no-no's of any code review. Magic number randomly splatted in the 
>> code? Nack, do it properly.
>>
>> So in this case, I don't see that there is much choice except to add a 
>> new Kconfig option for the override.
> 
>  From memory, I don't think I said override is not allowed. I used the 
> override argument in a different context. But honestly I don't feel like 
> digging that up at this point since this is just going on for too long.
> 
> In principle adding kconfig options should be avoided and in this case 
> question is cost vs benefit. What is the benefit? Who will tune it, why, 
> and using what knowledge?
> 
> I have asked if we can get compute UMD to give us some numbers relating 
> to typical desktop workloads but did not get anything.
> 
> Currently we override to zero, which is what they wanted. Now we are 
> thinking of overriding to 7.5s, which they acked, but it's not very 
> transparent what is the thinking behind it.
> 
> It simply looks we said 7.5s because that's what gives similar worst 
> case before reset compared to existing out of the box setup, while 
> allowing GuC engine resets to actually work.
> 
> I'd personally go for 2.5s, for the same weak reasons of it being 
> similar to existing timeout, and extension of every heartbeat interval. 
> But you thought 2.5s was too short, I guess, or preferred to view 
> heartbeat as decoupled timeline (barring the last one which *has* to 
> couple). Which is fine by me. So we agreed to compromise on that and 
> moved on.
> 
> So meh. What we end up with is not worse than it was and not having a 
> kconfig saves you a complication...
> 
>>>> options. Just having a hardcoded magic number in the driver is the 
>>>> absolute worst kind of override there is.
>>> >
>>>> And technically, the config option is not Gen12 specific. It is 
>>>> actually compute specific, hence the name. It just so happens that 
>>>> only Gen12 onwards has compute engines. I can add an extra line to 
>>>> the Kconfig description if you want "NB: compute engines only exist 
>>>> on Gen12 but do include the RCS engine on Gen12".
>>>
>>> I am not unconditionally against it but it feels it creates more 
>>> problems than gives solutions.
>>>
>>> In kconfig help you say "compute *capable* engine". Here you say only 
>>> Gen12 has compute engines. Well before Gen12 render is compute 
>>> capable, but then how implemented it does not apply which is not good.
>> Sorry, yes. For some reason I was thinking compute came in with Gen12.
>>
>>>
>>> Given the runtime override has the only purpose of working around 
>>> broken hardware then I'd still say to drop it. But if you can come up 
>>> with help text which won't be misleading and still not overly 
>>> complicated I am not opposing it.
>> So "when submitting a new context to a compute capable engine on Gen12 
>> and later platforms"? And maybe add a _GEN12 suffix to the config name 
>> itself?
> 
> ..."and later" would be wrong, you'd have to change it at some point. 
> Not least that the patch as proposed does "== 12", not ">= 12". And we 
> can't use the term Gen right? List all the affected platform names? Keep 
> patching up the help text as platforms are added? Or do we know the end 
> point already?
> 
> In summary, I will not oppose it if we can have a kconfig text which is 
> accurate, useful and not a maintenance burden.

Maybe avoid listing specifics and provide some guidance:

"""
config DRM_I915_OVERRIDE_PREEMPT_TIMEOUT
         int "Override preempt timeout (ms, jiffy granularity)"
         default 7500 # milliseconds
         help
           On certain platforms and engines where supported preemption
           granularity is reduced due hardware limitations, a longer timeout
           than DRM_I915_PREEMPT_TIMEOUT (see respective help text) is
           required.

           Shorter timeouts will have more chance of terminating legitimate
           workloads, while longer can have detrimental effect on desktop
           interactivity and ability to terminate hanging workloads in
           reasonable time.

           Usage of the override timeout will be logged during driver probe
           for each affected engine.
"""

If approach is acceptable also feel free to reword and improve my English.

Not sure whether to have compute in the name of kconfig. But I do like override in the name, so if you add compute I think also keeping override is good since it works well with not having to mention platform specifics in kconfig and it signifies it is special case. Or maybe "workaround"?

Regards,

Tvrtko
