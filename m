Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D86692CA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B786210E9CD;
	Fri, 13 Jan 2023 09:22:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32BF10E9CD;
 Fri, 13 Jan 2023 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673601731; x=1705137731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5gWSxFpfAL+lScOpF9Y5rkNagHoRgwXHDzWEIKsfyrM=;
 b=Cn8PDp5r7eXjk4zD8Hay8fzDu+QgKPM6AVjN8+yR7ta7mhKWfLHapf3t
 xJ4lkBLXBCjtGNRxBjdDK1aB6SfDm9Qaci2oiDWjsm4enO7kQu6qw5BED
 lbUuThbMxucb6D8TzC90rR44AgsqXcwKCZhKyyUFR0c70uP6zb76A2BLh
 QoE48cXXWT5GDy4RCwJItL8wGFTUNKGeVwuZHhuEDsGyrTgTVfe8e5Sto
 6LLqxHdoiM6BNWwPt/kSaSilvu+yNZtK+JwLtNfRdCZ7QMhZlV8WXKcPK
 1bd9geV72DulGt0FK5OXQ1aiytjlMq9FsRdRbQsHmo3qq9o6Lh7xnY8ik Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324014715"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="324014715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:22:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="658169394"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="658169394"
Received: from skenned1-mobl.ger.corp.intel.com (HELO [10.213.196.186])
 ([10.213.196.186])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:22:06 -0800
Message-ID: <ed669153-0c07-dfdd-58c9-8146ed966366@linux.intel.com>
Date: Fri, 13 Jan 2023 09:22:04 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8531ce98-78af-d818-b5bb-0af753a026d3@intel.com>
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


On 12/01/2023 20:59, John Harrison wrote:
> On 1/12/2023 02:15, Tvrtko Ursulin wrote:
>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Engine resets are supposed to never fail. But in the case when one
>>> does (due to unknown reasons that normally come down to a missing
>>> w/a), it is useful to get as much information out of the system as
>>> possible. Given that the GuC effectively dies on such a situation, it
>>> is not possible to get a guilty context notification back. So do a
>>> manual search instead. Given that GuC is dead, this is safe because
>>> GuC won't be changing the engine state asynchronously.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index b436dd7f12e42..99d09e3394597 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct 
>>> work_struct *w)
>>>       guc->submission_state.reset_fail_mask = 0;
>>>       spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>   -    if (likely(reset_fail_mask))
>>> +    if (likely(reset_fail_mask)) {
>>> +        struct intel_engine_cs *engine;
>>> +        enum intel_engine_id id;
>>> +
>>> +        /*
>>> +         * GuC is toast at this point - it dead loops after sending 
>>> the failed
>>> +         * reset notification. So need to manually determine the 
>>> guilty context.
>>> +         * Note that it should be safe/reliable to do this here 
>>> because the GuC
>>> +         * is toast and will not be scheduling behind the KMD's back.
>>> +         */
>>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>>> +            intel_guc_find_hung_context(engine);
>>> +
>>>           intel_gt_handle_error(gt, reset_fail_mask,
>>>                         I915_ERROR_CAPTURE,
>>> -                      "GuC failed to reset engine mask=0x%x\n",
>>> +                      "GuC failed to reset engine mask=0x%x",
>>>                         reset_fail_mask);
>>> +    }
>>>   }
>>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>
>> This one I don't feel "at home" enough to r-b. Just a question - can 
>> we be sure at this point that GuC is 100% stuck and there isn't a 
>> chance it somehow comes alive and starts running in parallel (being 
>> driven in parallel by a different "thread" in i915), interfering with 
>> the assumption made in the comment?
> The GuC API definition for the engine reset failure notification is that 
> GuC will dead loop itself after sending - to quote "This is a 
> catastrophic failure that requires a full GT reset, or FLR to recover.". 
> So yes, GuC is 100% stuck and is not going to self recover. Guaranteed. 
> If that changes in the future then that would be a backwards breaking 
> API change and would require a corresponding driver update to go with 
> supporting the new GuC firmware version.
> 
> There is the potential for a GT reset to maybe occur in parallel and 
> resurrect the GuC that way. Not sure how that could happen though. The 
> heartbeat timeout is significantly longer than the GuC's pre-emption 
> timeout + engine reset timeout. That just leaves manual resets from the 
> user or maybe from a selftest. If the user is manually poking reset 
> debugfs files then it is already known that all bets are off in terms of 
> getting an accurate error capture. And if a selftest is triggering GT 
> resets in parallel with engine resets then either it is a broken test or 
> it is attempting to test an evil corner case in which it is expected 
> that error capture results will be unreliable. Having said all that, 
> given that the submission_state lock is held here, such a GT reset would 
> not get very far in bring the GuC back up anyway. Certainly, it would 
> not be able to get as far as submitting new work and thus potentially 
> changing the engine state.
> 
> So yes, if multiple impossible events occur back to back then the error 
> capture may be wonky. Where wonky means a potentially innocent 
> context/request gets blamed for breaking the hardware. Oh dear. I can 
> live with that.

Okay, so I was triggered by the "safe/reliable" qualification from the 
comment. I agree "reliable" does not have to be and was mostly worried 
about the "safe" part.

 From what you explain if short heartbeat, or manual reset invocation, 
could actually mess up any of the data structures which added 
intel_guc_find_hung_context walks and so crash the kernel.

Looking inside, there is some lock dropping going on (and undocumented 
irqsave games), and walking the list while unlocked. So whether or not 
that can go bang if a full reset happens in parallel and re-activates 
the normal driver flows.

Regards,

Tvrtko
