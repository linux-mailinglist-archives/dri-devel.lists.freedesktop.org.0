Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F266BE08
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF69E10E3F7;
	Mon, 16 Jan 2023 12:43:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487B610E3F7;
 Mon, 16 Jan 2023 12:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673873017; x=1705409017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9H+zwntPHXCsJqThIuiXihCEYEIUYm9Vv8cQeZLstF0=;
 b=Z8rqSyyN6BSeeu4+PXieIJobeyo1VVH5TX49OSYBFVGKj06OJ7Xs8MjA
 qh/d9mPg2c/eDa0l/UfLH5bpUIKzMDqdeoO5msDLUMFFGq/gp2K0rqVPb
 GLcuw3S0aEoscJPTMf3+FXLVEW4FEeAznK5qEUjFjpRGp960hQY3OKqaj
 hmIu15GWBTxBHac3ohPA1p+y84yIQEGSq0cWZNjB7DGWucEL/agWaKug6
 oxe24zepbf5JbXfLor4LAXQJt2yiK5ZG5aBpir7wt9O71AD6EdJO9f5Nn
 42qH8PQqKTviGq3Xwr08J6UrVQHXVviLljR7pvnn/SUD4M3gi5KMZ7q7w w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="304153100"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="304153100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:43:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="608889149"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="608889149"
Received: from hgacquin-mobl1.ger.corp.intel.com (HELO [10.213.212.173])
 ([10.213.212.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:43:33 -0800
Message-ID: <195b373c-f98e-306f-40aa-1f028d27a77f@linux.intel.com>
Date: Mon, 16 Jan 2023 12:43:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-4-John.C.Harrison@Intel.com>
 <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
 <8531ce98-78af-d818-b5bb-0af753a026d3@intel.com>
 <ed669153-0c07-dfdd-58c9-8146ed966366@linux.intel.com>
 <f3749fe9-56c9-dcb7-d1bc-bfd57bee668c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f3749fe9-56c9-dcb7-d1bc-bfd57bee668c@intel.com>
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


On 14/01/2023 01:27, John Harrison wrote:
> On 1/13/2023 01:22, Tvrtko Ursulin wrote:
>> On 12/01/2023 20:59, John Harrison wrote:
>>> On 1/12/2023 02:15, Tvrtko Ursulin wrote:
>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> Engine resets are supposed to never fail. But in the case when one
>>>>> does (due to unknown reasons that normally come down to a missing
>>>>> w/a), it is useful to get as much information out of the system as
>>>>> possible. Given that the GuC effectively dies on such a situation, it
>>>>> is not possible to get a guilty context notification back. So do a
>>>>> manual search instead. Given that GuC is dead, this is safe because
>>>>> GuC won't be changing the engine state asynchronously.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 
>>>>> +++++++++++++++--
>>>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index b436dd7f12e42..99d09e3394597 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct 
>>>>> work_struct *w)
>>>>>       guc->submission_state.reset_fail_mask = 0;
>>>>> spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>>>   -    if (likely(reset_fail_mask))
>>>>> +    if (likely(reset_fail_mask)) {
>>>>> +        struct intel_engine_cs *engine;
>>>>> +        enum intel_engine_id id;
>>>>> +
>>>>> +        /*
>>>>> +         * GuC is toast at this point - it dead loops after 
>>>>> sending the failed
>>>>> +         * reset notification. So need to manually determine the 
>>>>> guilty context.
>>>>> +         * Note that it should be safe/reliable to do this here 
>>>>> because the GuC
>>>>> +         * is toast and will not be scheduling behind the KMD's back.
>>>>> +         */
>>>>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>>>>> +            intel_guc_find_hung_context(engine);
>>>>> +
>>>>>           intel_gt_handle_error(gt, reset_fail_mask,
>>>>>                         I915_ERROR_CAPTURE,
>>>>> -                      "GuC failed to reset engine mask=0x%x\n",
>>>>> +                      "GuC failed to reset engine mask=0x%x",
>>>>>                         reset_fail_mask);
>>>>> +    }
>>>>>   }
>>>>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>>>
>>>> This one I don't feel "at home" enough to r-b. Just a question - can 
>>>> we be sure at this point that GuC is 100% stuck and there isn't a 
>>>> chance it somehow comes alive and starts running in parallel (being 
>>>> driven in parallel by a different "thread" in i915), interfering 
>>>> with the assumption made in the comment?
>>> The GuC API definition for the engine reset failure notification is 
>>> that GuC will dead loop itself after sending - to quote "This is a 
>>> catastrophic failure that requires a full GT reset, or FLR to 
>>> recover.". So yes, GuC is 100% stuck and is not going to self 
>>> recover. Guaranteed. If that changes in the future then that would be 
>>> a backwards breaking API change and would require a corresponding 
>>> driver update to go with supporting the new GuC firmware version.
>>>
>>> There is the potential for a GT reset to maybe occur in parallel and 
>>> resurrect the GuC that way. Not sure how that could happen though. 
>>> The heartbeat timeout is significantly longer than the GuC's 
>>> pre-emption timeout + engine reset timeout. That just leaves manual 
>>> resets from the user or maybe from a selftest. If the user is 
>>> manually poking reset debugfs files then it is already known that all 
>>> bets are off in terms of getting an accurate error capture. And if a 
>>> selftest is triggering GT resets in parallel with engine resets then 
>>> either it is a broken test or it is attempting to test an evil corner 
>>> case in which it is expected that error capture results will be 
>>> unreliable. Having said all that, given that the submission_state 
>>> lock is held here, such a GT reset would not get very far in bring 
>>> the GuC back up anyway. Certainly, it would not be able to get as far 
>>> as submitting new work and thus potentially changing the engine state.
>>>
>>> So yes, if multiple impossible events occur back to back then the 
>>> error capture may be wonky. Where wonky means a potentially innocent 
>>> context/request gets blamed for breaking the hardware. Oh dear. I can 
>>> live with that.
>>
>> Okay, so I was triggered by the "safe/reliable" qualification from the 
>> comment. I agree "reliable" does not have to be and was mostly worried 
>> about the "safe" part.
>>
>> From what you explain if short heartbeat, or manual reset invocation, 
>> could actually mess up any of the data structures which added 
>> intel_guc_find_hung_context walks and so crash the kernel.
>>
>> Looking inside, there is some lock dropping going on (and undocumented 
>> irqsave games), and walking the list while unlocked. So whether or not 
>> that can go bang if a full reset happens in parallel and re-activates 
>> the normal driver flows.
> There is no walking of unlocked lists. The xa_lock is held whenever it 
> looks at the xa structure itself. The release is only while analysing 
> the context that was retrieved. And the context retrieval itself starts 
> with a kref_get_unless_zero. So everything is only ever accessed while 
> locked or reference counted. The unlock of the xa while analysing a 
> context is because the xa object can be accessed from interrupt code and 
> so we don't want to hold it locked unnecessarily while scanning through 
> requests within a context (all code which has no connection to the GuC 
> backend at all).

AFAICS intel_guc_find_hung_context walks &ce->guc_state.requests with no 
locks held. Other places in the code appear to use &ce->guc_state.lock, 
or maybe &sched_engine->lock, not sure. Then we have request submission, 
retirement and a few other places modify that list. So *if* indeed hung 
GuC can get resurrected by a parallel full reset while 
reset_fail_worker_func is running, why couldn't that list walk explode?

Regards,

Tvrtko

> I can drop the word 'safe' if it makes you nervous. That was only meant 
> to refer to the possibility of such a scan returning bogus results due 
> to contexts switching in/out of the hardware before/during/after the 
> scan. There is no way for it to go bang.
> 
> John.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
> 
