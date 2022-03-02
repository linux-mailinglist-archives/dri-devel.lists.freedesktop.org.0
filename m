Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0C4CA07C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6A10F297;
	Wed,  2 Mar 2022 09:20:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760610F294;
 Wed,  2 Mar 2022 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646212822; x=1677748822;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0I3f+przvkry8si8fW7kWnK+RaUeDkx6X1S1NdJsyvk=;
 b=GrQ6xcK/DW4jypBlNBVqm10MdNXxs4G+1Uvsjvey7RApb8INfOCejXeG
 RwOTJTQd5YTUfhKwUp5P6kD0AACspafbH6SifK4Z5Ump3+3AfOzyjHlnR
 4Hj2Qm06RWcqKopHN9vLps3x3beHVIYZnO9I8dEscxzpUk4yKcCiclAtA
 2MO7lNtQyh36BH4a/WcKAV7t3+xN9IdhDOX6dqWgV+ZtStuXh9RaJcmRZ
 w1SKCNp1Sw3AvoRD74Ytr4mtYeFGtyAlE6Dm9e3Q+ymUckF5JwOEbja4l
 g5QNu8uxU1IjgMy62PeQ8Quu0+xdDJXyEDzZq92BfCXezJ30c/ZNtNTWM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253551222"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="253551222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 01:20:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="641630480"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 01:20:20 -0800
Message-ID: <588709b6-c19d-eb14-dd31-cb6bc0bdb08f@linux.intel.com>
Date: Wed, 2 Mar 2022 09:20:17 +0000
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
 <d931b54e-0b89-877e-9a7f-ede3c3bf165f@linux.intel.com>
 <1b8edddb-f0c4-0ff9-a07e-25e4a496ea4d@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1b8edddb-f0c4-0ff9-a07e-25e4a496ea4d@intel.com>
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


On 01/03/2022 19:57, John Harrison wrote:
> On 3/1/2022 02:50, Tvrtko Ursulin wrote:
>> On 28/02/2022 18:32, John Harrison wrote:
>>> On 2/28/2022 08:11, Tvrtko Ursulin wrote:
>>>> On 25/02/2022 17:39, John Harrison wrote:
>>>>> On 2/25/2022 09:06, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 24/02/2022 19:19, John Harrison wrote:
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>>>>>>> ./gt/uc/intel_guc_fwif.h: u32 execution_quantum;
>>>>>>>>>>>>
>>>>>>>>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>>>>>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>>>>>>>>
>>>>>>>>>>>> ./gt/intel_engine_types.h: unsigned long timeslice_duration_ms;
>>>>>>>>>>>>
>>>>>>>>>>>> timeslice_store/preempt_timeout_store:
>>>>>>>>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>>>>>>>>
>>>>>>>>>>>> So both kconfig and sysfs can already overflow GuC, not only 
>>>>>>>>>>>> because of tick conversion internally but because at backend 
>>>>>>>>>>>> level nothing was done for assigning 64-bit into 32-bit. Or 
>>>>>>>>>>>> I failed to find where it is handled.
>>>>>>>>>>> That's why I'm adding this range check to make sure we don't 
>>>>>>>>>>> allow overflows.
>>>>>>>>>>
>>>>>>>>>> Yes and no, this fixes it, but the first bug was not only due 
>>>>>>>>>> GuC internal tick conversion. It was present ever since the 
>>>>>>>>>> u64 from i915 was shoved into u32 sent to GuC. So even if GuC 
>>>>>>>>>> used the value without additional multiplication, bug was be 
>>>>>>>>>> there. My point being when GuC backend was added timeout_ms 
>>>>>>>>>> values should have been limited/clamped to U32_MAX. The tick 
>>>>>>>>>> discovery is additional limit on top.
>>>>>>>>> I'm not disagreeing. I'm just saying that the truncation wasn't 
>>>>>>>>> noticed until I actually tried using very long timeouts to 
>>>>>>>>> debug a particular problem. Now that it is noticed, we need 
>>>>>>>>> some method of range checking and this simple clamp solves all 
>>>>>>>>> the truncation problems.
>>>>>>>>
>>>>>>>> Agreed in principle, just please mention in the commit message 
>>>>>>>> all aspects of the problem.
>>>>>>>>
>>>>>>>> I think we can get away without a Fixes: tag since it requires 
>>>>>>>> user fiddling to break things in unexpected ways.
>>>>>>>>
>>>>>>>> I would though put in a code a clamping which expresses both, 
>>>>>>>> something like min(u32, ..GUC LIMIT..). So the full story is 
>>>>>>>> documented forever. Or "if > u32 || > ..GUC LIMIT..) return 
>>>>>>>> -EINVAL". Just in case GuC limit one day changes but u32 stays. 
>>>>>>>> Perhaps internal ticks go away or anything and we are left with 
>>>>>>>> plain 1:1 millisecond relationship.
>>>>>>> Can certainly add a comment along the lines of "GuC API only 
>>>>>>> takes a 32bit field but that is further reduced to GUC_LIMIT due 
>>>>>>> to internal calculations which would otherwise overflow".
>>>>>>>
>>>>>>> But if the GuC limit is > u32 then, by definition, that means the 
>>>>>>> GuC API has changed to take a u64 instead of a u32. So there will 
>>>>>>> no u32 truncation any more. So I'm not seeing a need to 
>>>>>>> explicitly test the integer size when the value check covers that.
>>>>>>
>>>>>> Hmm I was thinking if the internal conversion in the GuC fw 
>>>>>> changes so that GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS goes above u32, 
>>>>>> then to be extra safe by documenting in code there is the 
>>>>>> additional limit of the data structure field. Say the field was 
>>>>>> changed to take some unit larger than a millisecond. Then the 
>>>>>> check against the GuC MAX limit define would not be enough, unless 
>>>>>> that would account both for internal implementation and u32 in the 
>>>>>> protocol. Maybe that is overdefensive but I don't see that it 
>>>>>> harms. 50-50, but it's do it once and forget so I'd do it.
>>>>> Huh?
>>>>>
>>>>> How can the limit be greater than a u32 if the interface only takes 
>>>>> a u32? By definition the limit would be clamped to u32 size.
>>>>>
>>>>> If you mean that the GuC policy is in different units and those 
>>>>> units might not overflow but ms units do, then actually that is 
>>>>> already the case. The GuC works in us not ms. That's part of why 
>>>>> the wrap around is so low, we have to multiply by 1000 before 
>>>>> sending to GuC. However, that is actually irrelevant because the 
>>>>> comparison is being done on the i915 side in i915's units. We have 
>>>>> to scale the GuC limit to match what i915 is using. And the i915 
>>>>> side is u64 so if the scaling to i915 numbers overflows a u32 then 
>>>>> who cares because that comparison can be done at 64 bits wide.
>>>>>
>>>>> If the units change then that is a backwards breaking API change 
>>>>> that will require a manual driver code update. You can't just 
>>>>> recompile with a new header and magically get an ms to us or ms to 
>>>>> s conversion in your a = b assignment. The code will need to be 
>>>>> changed to do the new unit conversion (note we already convert from 
>>>>> ms to us, the GuC API is all expressed in us). And that code change 
>>>>> will mean having to revisit any and all scaling, type conversions, 
>>>>> etc. I.e. any pre-existing checks will not necessarily be valid and 
>>>>> will need to be re-visted anyway. But as above, any scaling to GuC 
>>>>> units has to be incorporated into the limit already because 
>>>>> otherwise the limit would not fit in the GuC's own API.
>>>>
>>>> Yes I get that, I was just worried that u32 field in the protocol 
>>>> and GUC_POLICY_MAX_EXEC_QUANTUM_MS defines are separate in the 
>>>> source code and then how to protect against forgetting to update 
>>>> both in sync.
>>>>
>>>> Like if the protocol was changed to take nanoseconds, and firmware 
>>>> implementation changed to support the full range, but define 
>>>> left/forgotten at 100s. That would then overflow u32.
>>> Huh? If the API was updated to 'support the full range' then how can 
>>> you get overflow by forgetting to update the limit? You could get 
>>> unnecessary clamping, which hopefully would be noticed by whoever is 
>>> testing the new API and/or whoever requested the change. But you 
>>> can't get u32 overflow errors if all the code has been updated to u64.
>>
>> 1)
>> Change the protocol so that "u32 desc->execution_quantum" now takes 
>> nano seconds.
>>
>> This now makes the maximum time 4.29.. seconds.
> You seriously think this is likely to happen?
> 
> That the GuC people would force an API change on us that is completely 
> backwards from what we have been asking? And that such a massive 
> backwards step would not get implemented correctly because someone 
> didn't notice just how huge an impact it was?

I don't know what we have been asking or what GuC people would do.

>> 2)
>> Forget to update GUC_POLICY_MAX_EXEC_QUANTUM_MS from 100s, since for 
>> instance that part at that point still not part of the interface 
>> contract.
> There is zero chance of the us -> ns change occurring in the foreseeable 
> future whereas the expectation is to have the limits be part of the spec 
> in the next firmware release. So this scenario is just not going to 
> happen. And as above, it would be such a big change with such a huge 
> amount of push back and discussion going on that it would be impossible 
> for the limit update to be missed/forgotten.
> 
>>
>> 3)
>> User passes in 5 seconds.
>>
>> Clamping check says all is good.
>>
>> "engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS"
>>
>> 4)
>>
>> Assignment was updated:
>>
>> gt/uc/intel_guc_submission.c:
>>
>>   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;
>>
>> But someone did not realize field is u32.
>>
>>   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;
>>
>> Defensive solution:
>>
>>   if (overflows_type(engine->props.timeslice_duration_ms * 1e6, 
>> desc->execution_quantum))
>>     drm_WARN_ON...
> 
> All you are saying is that bugs can happen. The above is just one more 
> place to have a bug.
> 
> The purpose of the limit is to take into account all reasons for there 
> being a limit. Having a bunch of different tests that are all testing 
> the same thing is pointless.

I am saying this:

1)
The code I pointed out is a boundary layer between two components which 
have independent design and development teams.

2)
The limit in question is currently not explicitly defined by the 
interface provider.

3)
The limit in question is also implicitly defined by the hidden internal 
firmware implementation details not relating to the units of the interface.

4)
The source code location of the clamping check is far away (different 
file, different layer) from the assignment to the interface data structure.

 From this it sounds plausible to me to have the check at the assignment 
site and don't have to think about it further.

Regards,

Tvrtko
