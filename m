Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD94C14DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C6310F70C;
	Wed, 23 Feb 2022 13:58:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE0310F70C;
 Wed, 23 Feb 2022 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645624718; x=1677160718;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z4NA0rF3dyrwxNu0yaqsz1V6cw7CjiuNqOpAiOgYtrE=;
 b=Zc7EtF/p1UM2I8fCzAIX1IUmfTA2hqWtbALJ2V6nXRpNAw9WfgOlKmXn
 Ko6o6I2TqZWB9CGFJkXuHsoe2FHcusSEBoH61AmOZesBkHCUN5Vzz6l4r
 qwjlskl1+O6Ohno2tkvI2L+j03rrFJLHwB5KYxLIH7mlbTUo6EuHGFF9p
 0RwXsQufe1L+9/jms3FAUQr57Kk8MfakT8vnHau8syUgERjA9hb9RekzX
 B+/HIIKEkj0yQQqYZ8h3CxdnyTNgEWFkhEYj4Om7+1fzvnVncAagwfKAg
 +M6zIT4skAaSvw1TZWWn3V18wxuzUPoHCbGCJz4henpBygGFiKXZWo8rG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276586245"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="276586245"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:58:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="707038140"
Received: from lportx-mobl3.ger.corp.intel.com (HELO [10.213.242.198])
 ([10.213.242.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:58:36 -0800
Message-ID: <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
Date: Wed, 23 Feb 2022 13:58:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
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


On 23/02/2022 02:45, John Harrison wrote:
> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Compute workloads are inherantly not pre-emptible for long periods on
>>> current hardware. As a workaround for this, the pre-emption timeout
>>> for compute capable engines was disabled. This is undesirable with GuC
>>> submission as it prevents per engine reset of hung contexts. Hence the
>>> next patch will re-enable the timeout but bumped up by an order of
>>> magnititude.
>>
>> (Some typos above.)
> I'm spotting 'inherently' but not anything else.

Magnititude! O;)

>>> However, the heartbeat might not respect that. Depending upon current
>>> activity, a pre-emption to the heartbeat pulse might not even be
>>> attempted until the last heartbeat period. Which means that only one
>>
>> Might not be attempted, but could be if something is running with 
>> lower priority. In which case I think special casing the last 
>> heartbeat does not feel right because it can end up resetting the 
>> engine before it was intended.
>>
>> Like if first heartbeat decides to preempt (the decision is backend 
>> specific, could be same prio + timeslicing), and preempt timeout has 
>> been set to heartbeat interval * 3, then 2nd heartbeat gets queued up, 
>> then 3rd, and so reset is triggered even before the first preempt 
>> timeout legitimately expires (or just as it is about to react).
>>
>> Instead, how about preempt timeout is always considered when 
>> calculating when to emit the next heartbeat? End result would be 
>> similar to your patch, in terms of avoiding the direct problem, 
>> although hang detection would be overall longer (but more correct I 
>> think).
>>
>> And it also means in the next patch you don't have to add coupling 
>> between preempt timeout and heartbeat to intel_engine_setup. Instead 
>> just some long preempt timeout would be needed. Granted, the 
>> decoupling argument is not super strong since then the heartbeat code 
>> has the coupling instead, but that still feels better to me. (Since we 
>> can say heartbeats only make sense on loaded engines, and so things 
>> like preempt timeout can legitimately be considered from there.)
>>
>> Incidentally, that would be similar to a patch which Chris had a year 
>> ago 
>> (https://patchwork.freedesktop.org/patch/419783/?series=86841&rev=1) 
>> to fix some CI issue.
>>
> I'm not following your arguments.
> 
> Chris' patch is about not having two i915 based resets triggered 
> concurrently - i915 based engine reset and i915 based GT reset. The 
> purpose of this patch is to allow the GuC based engine reset to have a 
> chance to occur before the i915 based GT reset kicks in.
> 
> It sounds like your argument above is about making the engine reset 
> slower so that it doesn't happen before the appropriate heartbeat period 
> for that potential reset scenario has expired. I don't see why that is 
> at all necessary or useful.
> 
> If an early heartbeat period triggers an engine reset then the heartbeat 
> pulse will go through. The heartbeat will thus see a happy system and 
> not do anything further. If the given period does not trigger an engine 
> reset but still does not get the pulse through (because the pulse is of 
> too low a priority) then we move on to the next period and bump the 
> priority. If the pre-emption has actually already been triggered anyway 
> (and we are just waiting a while for it to timeout) then that's fine. 
> The priority bump will have no effect because the context is already 
> attempting to run. The heartbeat code doesn't care which priority level 
> actually triggers the reset. It just cares whether or not the pulse 
> finally makes it through. And the GuC doesn't care which heartbeat 
> period the i915 is in. All it knows is that it has a request to schedule 
> and whether the current context is pre-empting or not. So if period #1 
> triggers the pre-emption but the timeout doesn't happen until period #3, 
> who cares? The result is the same as if period #3 triggered the 
> pre-emption and the timeout was shorter. The result being that the hung 
> context is reset, the pulse makes it through and the heartbeat goes to 
> sleep again.
> 
> The only period that really matters is the final one. At that point the 
> pulse request is at highest priority and so must trigger a pre-emption 
> request. We then need at least one full pre-emption period (plus some 
> wiggle room for random delays in reset time, context switching, 
> processing messages, etc.) to allow the GuC based timeout and reset to 
> occur. Hence ensuring that the final heartbeat period is at least twice 
> the pre-emption timeout (because 1.25 times is just messy when working 
> with ints!).
> 
> That guarantees that GuC will get at least one complete opportunity to 
> detect and recover the hang before i915 nukes the universe.
> 
> Whereas, bumping all heartbeat periods to be greater than the 
> pre-emption timeout is wasteful and unnecessary. That leads to a total 
> heartbeat time of about a minute. Which is a very long time to wait for 
> a hang to be detected and recovered. Especially when the official limit 
> on a context responding to an 'are you dead' query is only 7.5 seconds.

Not sure how did you get one minute?

Regardless, crux of argument was to avoid GuC engine reset and heartbeat reset racing with each other, and to do that by considering the preempt timeout with the heartbeat interval. I was thinking about this scenario in this series:

[Please use fixed width font and no line wrap to view.]

A)

tP = preempt timeout
tH = hearbeat interval

tP = 3 * tH

1) Background load = I915_PRIORITY_DISPLAY

<-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * tH] ----> FULL RESET
                                                        |
                                                        \- preemption triggered, tP = 3 * tH ------\
                                                                                                    \-> preempt timeout would hit here

Here we have collateral damage due full reset, since we can't tell GuC to reset just one engine and we fudged tP just to "account" for heartbeats.

2) Background load = I915_CONTEXT_MAX_USER_PRIORITY

<-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * tH] ----> FULL RESET
                                     |
                                     \- preemption triggered, tP = 3 * tH ------> Preempt timeout races with "heartbeat stopped"

Here possible collateral damage due non-deterministic race (GuC and i915 run different clocks, or even if they did not). Can we do better?
                                                                                                   
3) Background load = I915_CONTEXT_MIN_USER_PRIORITY

<-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * tH] ----> full reset would be here
                |
                \- preemption triggered, tP = 3 * tH ----------------\
                                                                      \-> Preempt timeout reset

Here is is kind of least worse, but question is why we fudged tP when it gives us nothing good in this case.

B)

Instead, my idea to account for preempt timeout when calculating when to schedule next hearbeat would look like this:

First of all tP can be left at a large value unrelated to tH. Lets say tP = 640ms. tH stays 2.5s.

1) Background load = I915_PRIORITY_DISPLAY

<-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> Pulse3 <-- [tH + tP] --> full reset would be here
                                                                       |
                                                                       \-[tP]-> Engine reset here
                                                                                                    
Collateral damage avoided here.

2) Background load = I915_CONTEXT_MAX_USER_PRIORITY

<-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> Pulse3 <-- [tH + tP] --> full reset would be here
                                              |
                                              \-[tP]-> Engine reset here

No race, collateral damage avoided. Not sure race can be hit due built-in interdependency between tH and tP, unless maybe for really short timeouts which are not realistic to start with.
                                                                                                   
3) Background load = I915_CONTEXT_MIN_USER_PRIORITY

<-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> Pulse3 <-- [tH + tP] --> full reset would be here
                     |
                     \-[tP]-> Engine reset here
                                                                      
So as long as "640ms" preempt timeout is good enough for compute this option looks better to me. Or even if it is not, the timelines for option A above show engine reset effectively doesn't work for compute anyway. So if they set it to zero manually it's pretty much the same full reset for them.

Am I missing some requirement or you see another problem with this idea?

>> On a related topic, if GuC engine resets stop working when preempt 
>> timeout is set to zero - I think we need to somehow let the user know 
>> if they try to tweak it via sysfs. Perhaps go as far as -EINVAL in GuC 
>> mode, if i915.reset has not explicitly disabled engine resets.
> Define 'stops working'. The definition of the sysfs interface is that a 
> value of zero disables pre-emption. If you don't have pre-emption and 
> your hang detection mechanism relies on pre-emption then you don't have 
> a hang detection mechanism either. If the user really wants to allow 

By stops working I meant that it stops working. :)

With execlist one can disable preempt timeout and "stopped heartbeat" can still reset the stuck engine and so avoid collateral damage. With GuC it appears this is not possible. So I was thinking this is something worthy a log notice.

> their context to run forever and never be pre-empted then that means 
> they also don't want it to be reset arbitrarily. Which means they would 
> also be disabling the heartbeat timer as well. Indeed, this is what we 

I don't think so. Preempt timeout is disabled already on TGL/RCS upstream but hearbeat is not and so hangcheck still works.

> advise compute customers to do. It is then up to the user themselves to 
> spot a hang and to manually kill (Ctrl+C, kill ###, etc.) their task. 
> Killing the CPU task will automatically clear up any GPU resources 
> allocated to that task (excepting context persistence, which is a) 
> broken and b) something we also tell compute customers to disable).

What is broken with context persistence? I noticed one patch claiming to be fixing something in that area which looked suspect. Has it been established no userspace relies on it?

Regards,

Tvrtko
