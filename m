Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7C615D7B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 09:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45C10E07E;
	Wed,  2 Nov 2022 08:17:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FB110E07E;
 Wed,  2 Nov 2022 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667377054; x=1698913054;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dg1bQMy2r8GKZVY+GmS9dZBf9Mqhoetuv0x9jhOVx6k=;
 b=aPhpA/FePCoJFoiO1o7Vr5t76UOi7D59Dwo9EmUI1Ekt3pDCXGZhIlLy
 +5Luop7CPVVu3O/UMyeRTKqtAqV8bdHL4xWpC7ZnCrz3nNcIoTBptYdMs
 jvtA0D6qKKMoqDefdULFjiTWChoPn91AIK7O1pUbhtvOjM+KK8vn2Ks4l
 TdqU1gyZ0DqP6mLpDsrugMLyZwDXzg6HO74nAV5x/8eXLzGLmijijEfd2
 6FVzWQS1Gf1or2xNNg3iI15VwYzAWhkl515azh9tzkNZoyJlJXeB1VWYy
 SkXs7c+mBO/67SiQ3NoZbPbTQz/4Xnoydy61iT2PjRTsmQx63PMN2is5I A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="336021075"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="336021075"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:17:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="776806034"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="776806034"
Received: from dsloan-mobl.ger.corp.intel.com (HELO [10.213.207.205])
 ([10.213.207.205])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:17:32 -0700
Message-ID: <8f9cb0df-d2aa-e35a-1e91-845219b315a0@linux.intel.com>
Date: Wed, 2 Nov 2022 08:17:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
 <20221028194649.1130223-3-John.C.Harrison@Intel.com>
 <56a6c98a-069c-77b0-d6c5-4575bc324075@linux.intel.com>
 <2e7cf7c4-76cb-5a69-8a61-7d1da3577060@linux.intel.com>
 <3f83f31f-28d4-5b68-3066-5a0b58e20e56@intel.com>
 <95404887-f886-078f-c644-635ada7d8bee@linux.intel.com>
 <4eae646a-345b-40d7-1ac6-4de027ee1fd4@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4eae646a-345b-40d7-1ac6-4de027ee1fd4@intel.com>
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


On 01/11/2022 16:56, John Harrison wrote:
> On 11/1/2022 02:58, Tvrtko Ursulin wrote:
>> On 31/10/2022 18:30, John Harrison wrote:
>>> On 10/31/2022 05:51, Tvrtko Ursulin wrote:
>>>> On 31/10/2022 10:09, Tvrtko Ursulin wrote:
>>>>> On 28/10/2022 20:46, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The engine busyness stats has a worker function to do things like
>>>>>> 64bit extend the 32bit hardware counters. The GuC's reset prepare
>>>>>> function flushes out this worker function to ensure no corruption
>>>>>> happens during the reset. Unforunately, the worker function has an
>>>>>> infinite wait for active resets to finish before doing its work. Thus
>>>>>> a deadlock would occur if the worker function had actually started
>>>>>> just as the reset starts.
>>>>>>
>>>>>> Update the worker to abort if a reset is in progress rather than
>>>>>> waiting for it to complete. It will still acquire the reset lock in
>>>>>> the case where a reset was not already in progress. So the processing
>>>>>> is still safe from corruption, but the deadlock can no longer occur.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/gt/intel_reset.c             | 15 
>>>>>> ++++++++++++++-
>>>>>>   drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
>>>>>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>>> index 3159df6cdd492..2f48c6e4420ea 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>>> @@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>>>>>       intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>>>>>   }
>>>>>> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>>>>> +static int _intel_gt_reset_trylock(struct intel_gt *gt, int 
>>>>>> *srcu, bool retry)
>>>>>>   {
>>>>>>       might_lock(&gt->reset.backoff_srcu);
>>>>>>       might_sleep();
>>>>>> @@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt 
>>>>>> *gt, int *srcu)
>>>>>>       while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>>>>>           rcu_read_unlock();
>>>>>> +        if (!retry)
>>>>>> +            return -EBUSY;
>>>>>> +
>>>>>>           if (wait_event_interruptible(gt->reset.queue,
>>>>>>                            !test_bit(I915_RESET_BACKOFF,
>>>>>> &gt->reset.flags)))
>>>>>
>>>>> Would it be more obvious to rename the existing semantics to 
>>>>> intel_gt_reset_interruptible(), while the flavour you add in this 
>>>>> patch truly is trylock? I am not sure, since it's all a bit 
>>>>> special, but trylock sure feels confusing if it can sleep forever...
>>> To me, it would seem totally more obvious to have a function called 
>>> 'trylock' not wait forever until it can manage to acquire the lock. 
>>> However, according to '2caffbf1176256 drm/i915: Revoke mmaps and 
>>> prevent access to fence registers across reset', the current 
>>> behaviour is exactly how the code was originally written and 
>>> intended. It hasn't just mutated into some confused evolution a 
>>> thousand patches later. So I figure there is some subtle but 
>>> important reason why it was named how it is named and yet does what 
>>> it does. Therefore it seemed safest to not change it unnecessarily.
>>
>> Yeah I looked at that but honestly I don't see the trylock semantics 
>> anywhere. The only failure to lock path comes from 
>> wait_event_interruptible. It could have easily been just a naming mishap.
>>
>> And I find adding a retry parameter to something called trylock makes 
>> this even more non-intuitive and would personally rather rename it 
>> all. Proof in the pudding is that the trylock naming did bite during 
>> development and review of the code this patch is now fixing.
>>
>> I do however understand your point about a degree of uncertainty but 
>> my feeling is to rather err on the side of obvious naming. Shall we 
>> ask for a third opinion?
> Umesh had commented (internally) that the naming seems wrong and would 
> be good to change it. So we already have a third :).
> 
> To be clear, you are thinking to keep the wrappers but rename to 
> intel_gt_reset_trylock() [retry = false] and 
> intel_gt_reset_interruptible() [retry = true]? Which will obviously 
> involve updating all but one existing user to use the interruptible name 
> as the existing name will change behaviour in a backwards breaking manner.

Yes, intel_gt_reset_lock_interruptible and intel_gt_reset_trylock.

I don't get the behaviour breaking part? Only the name will change.

And amount of churn does not seem a problem:

$ grep intel_gt_reset_trylock -r .
./gem/i915_gem_mman.c:  ret = intel_gt_reset_trylock(ggtt->vm.gt, &srcu);
./gt/uc/intel_guc_submission.c: ret = intel_gt_reset_trylock(gt, &srcu);
./gt/intel_reset.c:int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
./gt/intel_reset.h:int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)

Regards,

Tvrtko

> 
> John.
> 
>>
>>>> Oh and might_sleep() shouldn't be there with the trylock version - I 
>>>> mean any flavour of the real trylock.
>>> You mean if the code is split into two completely separate functions? 
>>> Or do you just mean to wrap the might_sleep() call with 'if(!retry)'?
>>>
>>> And just to be totally clear, the unconditional call to 
>>> rcu_read_lock() is not something that can sleep? One doesn't need a 
>>> might_sleep() before doing that lock?
>>
>> Corrrect, rcu_read_lock() can not sleep - it just disables preemption. 
>> So leaving the unconditional might_sleep() would have opportunity for 
>> false positives.
>>
>> Regards,
>>
>> Tvrtko
> 
