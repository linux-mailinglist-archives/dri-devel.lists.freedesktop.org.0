Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5138614753
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA0710E350;
	Tue,  1 Nov 2022 09:58:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34B510E345;
 Tue,  1 Nov 2022 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667296689; x=1698832689;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n6QHCydXVUxBSH/s8ywqWP6C2jHOLze0Q/puRrtMZuM=;
 b=S5SWxOFXfW2CDGmp0bxSdAoOPvOaHtKapKl4jm6Hwdfmh9+/2sTdWl8b
 NK1UQmC5SQ/T1XUo/Gf3dfM32Qp8C3wApcYOswhlKZO2lDuB891/F1PD2
 rU2iE0sfmd5Sg/pYAKNcAii0zooLer63GRs5RNwFLfCJ7GqvbnudiJzZs
 XXPgIFv24LhnvM0hgeAZDyZvyYdq1HN7lVxL5kRH6UwktaAeJqVey2XUF
 T77Evia5lZJTMkiMk0vJuWecKVKaOZ0b/ef8yDBGo99Yh8X7c9JDFazm7
 wDVCdafoSWVmv72xqvkEx8DpooITrovhWZ2ce99KSj92y/6Y9YJCm4c5N w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310200512"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="310200512"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:58:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="667141460"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="667141460"
Received: from thaughan-mobl1.ger.corp.intel.com (HELO [10.213.224.101])
 ([10.213.224.101])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:58:07 -0700
Message-ID: <95404887-f886-078f-c644-635ada7d8bee@linux.intel.com>
Date: Tue, 1 Nov 2022 09:58:05 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <3f83f31f-28d4-5b68-3066-5a0b58e20e56@intel.com>
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


On 31/10/2022 18:30, John Harrison wrote:
> On 10/31/2022 05:51, Tvrtko Ursulin wrote:
>> On 31/10/2022 10:09, Tvrtko Ursulin wrote:
>>> On 28/10/2022 20:46, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The engine busyness stats has a worker function to do things like
>>>> 64bit extend the 32bit hardware counters. The GuC's reset prepare
>>>> function flushes out this worker function to ensure no corruption
>>>> happens during the reset. Unforunately, the worker function has an
>>>> infinite wait for active resets to finish before doing its work. Thus
>>>> a deadlock would occur if the worker function had actually started
>>>> just as the reset starts.
>>>>
>>>> Update the worker to abort if a reset is in progress rather than
>>>> waiting for it to complete. It will still acquire the reset lock in
>>>> the case where a reset was not already in progress. So the processing
>>>> is still safe from corruption, but the deadlock can no longer occur.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_reset.c             | 15 
>>>> ++++++++++++++-
>>>>   drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
>>>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> index 3159df6cdd492..2f48c6e4420ea 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> @@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>>>       intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>>>   }
>>>> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>>> +static int _intel_gt_reset_trylock(struct intel_gt *gt, int *srcu, 
>>>> bool retry)
>>>>   {
>>>>       might_lock(&gt->reset.backoff_srcu);
>>>>       might_sleep();
>>>> @@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt 
>>>> *gt, int *srcu)
>>>>       while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>>>           rcu_read_unlock();
>>>> +        if (!retry)
>>>> +            return -EBUSY;
>>>> +
>>>>           if (wait_event_interruptible(gt->reset.queue,
>>>>                            !test_bit(I915_RESET_BACKOFF,
>>>>                                  &gt->reset.flags)))
>>>
>>> Would it be more obvious to rename the existing semantics to 
>>> intel_gt_reset_interruptible(), while the flavour you add in this 
>>> patch truly is trylock? I am not sure, since it's all a bit special, 
>>> but trylock sure feels confusing if it can sleep forever...
> To me, it would seem totally more obvious to have a function called 
> 'trylock' not wait forever until it can manage to acquire the lock. 
> However, according to '2caffbf1176256 drm/i915: Revoke mmaps and prevent 
> access to fence registers across reset', the current behaviour is 
> exactly how the code was originally written and intended. It hasn't just 
> mutated into some confused evolution a thousand patches later. So I 
> figure there is some subtle but important reason why it was named how it 
> is named and yet does what it does. Therefore it seemed safest to not 
> change it unnecessarily.

Yeah I looked at that but honestly I don't see the trylock semantics 
anywhere. The only failure to lock path comes from 
wait_event_interruptible. It could have easily been just a naming mishap.

And I find adding a retry parameter to something called trylock makes 
this even more non-intuitive and would personally rather rename it all. 
Proof in the pudding is that the trylock naming did bite during 
development and review of the code this patch is now fixing.

I do however understand your point about a degree of uncertainty but my 
feeling is to rather err on the side of obvious naming. Shall we ask for 
a third opinion?

>> Oh and might_sleep() shouldn't be there with the trylock version - I 
>> mean any flavour of the real trylock.
> You mean if the code is split into two completely separate functions? Or 
> do you just mean to wrap the might_sleep() call with 'if(!retry)'?
> 
> And just to be totally clear, the unconditional call to rcu_read_lock() 
> is not something that can sleep? One doesn't need a might_sleep() before 
> doing that lock?

Corrrect, rcu_read_lock() can not sleep - it just disables preemption. 
So leaving the unconditional might_sleep() would have opportunity for 
false positives.

Regards,

Tvrtko
