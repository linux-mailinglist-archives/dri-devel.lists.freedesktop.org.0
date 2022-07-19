Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11929579765
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 12:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C60B14B562;
	Tue, 19 Jul 2022 10:14:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A0514B561;
 Tue, 19 Jul 2022 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658225694; x=1689761694;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=PqNA9KGA4dVNcnGDxzGgW/sKK+3gZ+Gh2ITt3VzXteE=;
 b=OsxeJqaIk3/7kGIlcc7Hw3+hpiGBhKDwbnfmmnUiIEok1nJHO9sCpLir
 kzn6q2JwYHsI1ThjXNUxMJOo9lWEwQTjWhm9hNtU80SRMU/+sJCq9I9S4
 v09Pkr85m6aVkW0+7HbQSNevDSvUNBYqn/HE0aqjj+y3yAxx6DWQoOPDH
 aM/ikhnwb++aMbCCoCIbUjUDU1MuZL1hvuRiQActp5FS0ZJ8gg+QbxVoM
 elY7Dfjnsd8XyR3fQWTy4aVDJYNlVIEr6+GZ5dp6Xk0rUXyfl2bqeTIg4
 Oh7E+lstblhUrl88Q1M4UME42dBfLSUf3iHXausqqutPct46uNsMuMIOh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287603843"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="287603843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 03:14:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601541838"
Received: from ssherida-mobl.ger.corp.intel.com (HELO [10.213.201.170])
 ([10.213.201.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 03:14:52 -0700
Message-ID: <db41993e-6479-e618-1ce9-5abc51c4b72c@linux.intel.com>
Date: Tue, 19 Jul 2022 11:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 02/12] drm/i915/guc: Don't call ring_is_idle
 in GuC submission
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org, Matthew Brost <matthew.brost@intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-3-John.C.Harrison@Intel.com>
 <2f9959ae-40fe-f14d-8e70-e94f03237769@linux.intel.com>
 <4f14835e-300e-a1b7-bebb-8ecbb07ab682@intel.com>
 <0107930e-bb8b-c7ee-c03c-7e7abf564498@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <0107930e-bb8b-c7ee-c03c-7e7abf564498@linux.intel.com>
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


On 19/07/2022 10:49, Tvrtko Ursulin wrote:
> 
> On 19/07/2022 01:09, John Harrison wrote:
>> On 7/18/2022 05:26, Tvrtko Ursulin wrote:
>>>
>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> The engine registers really shouldn't be touched during GuC submission
>>>> as the GuC owns the registers. Don't call ring_is_idle and tie
>>>
>>> Touch being just read and it is somehow harmful?
>> The registers are meaningless when GuC is controlling the submission. 
>> The i915 driver has no knowledge of what context is or is not 
>> executing on any given engine at any given time. So reading reading 
>> the ring registers is incorrect - it can lead to bad assumptions about 
>> what state the hardware is in.
> 
> Same is actually true with the execlists backend. The code in 
> ring_is_idle is not concerning itself with which context is running or 
> not. Just that the head/tail/ctl appear idle.
> 
> Problem/motivation appears to be on a higher than simply ring registers.
> 
> I am not claiming it makes sense with Guc and that it has to remain but 
> just suggesting for as a minimum clearer commit message.
> 
>>>> intel_engine_is_idle strictly to the engine pm.
>>>
>>> Strictly seems wrong - it is just ring_is_idle check that is replaced 
>>> and not the whole implementation of intel_engine_is_idle.
>>>
>>>> Because intel_engine_is_idle tied to the engine pm, retire requests
>>>> before checking intel_engines_are_idle in gt_drop_caches, and lastly
>>> Why is re-ordering important? I at least can't understand it. I hope 
>>> it's not working around IGT failures.
>> If requests are physically completed but not retired then they will be 
>> holding unnecessary PM references. So we need to flush those out 
>> before checking for idle.
> 
> And if they are not as someone passes in DROP_RESET_ACTIVE? They will 
> not retire and code still enters intel_engines_are_idle so that has to 
> work, no? Something does not align for me still.

With "not retire" I meant potentially not retire within 
I915_IDLE_ENGINES_TIMEOUT. I guess hack happens to work for some or all 
IGTs which use DROP_RESET_ACTIVE.

Does it also mean patch would fix that problem without touching 
intel_engine_is_idle/ring_is_idle - with just the re-ordering in 
gt_drop_caches?

Regards,

Tvrtko

> 
>>>> increase the timeout in gt_drop_caches for the intel_engines_are_idle
>>>> check.
>>>
>>> Same here - why?
>> @Matthew Brost - do you recall which particular tests were hitting an 
>> issue? I'm guessing gem_ctx_create? I believe that's the one that 
>> creates and destroys thousands of contexts. That is much slower with 
>> GuC (GuC communication required) than with execlists (i915 internal 
>> state change only).
> 
> And if that is a logically separate change please split the patch up.
> 
> Regards,
> 
> Tvrtko
> 
>>
>> John.
>>
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +++++++++++++
>>>>   drivers/gpu/drm/i915/i915_debugfs.c       |  6 +++---
>>>>   drivers/gpu/drm/i915/i915_drv.h           |  2 +-
>>>>   3 files changed, 17 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> index 283870c659911..959a7c92e8f4d 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> @@ -1602,6 +1602,9 @@ static bool ring_is_idle(struct 
>>>> intel_engine_cs *engine)
>>>>   {
>>>>       bool idle = true;
>>>>   +    /* GuC submission shouldn't access HEAD & TAIL via MMIO */
>>>> +    GEM_BUG_ON(intel_engine_uses_guc(engine));
>>>> +
>>>>       if (I915_SELFTEST_ONLY(!engine->mmio_base))
>>>>           return true;
>>>>   @@ -1668,6 +1671,16 @@ bool intel_engine_is_idle(struct 
>>>> intel_engine_cs *engine)
>>>>       if (!i915_sched_engine_is_empty(engine->sched_engine))
>>>>           return false;
>>>>   +    /*
>>>> +     * We shouldn't touch engine registers with GuC submission as 
>>>> the GuC
>>>> +     * owns the registers. Let's tie the idle to engine pm, at 
>>>> worst this
>>>> +     * function sometimes will falsely report non-idle when idle 
>>>> during the
>>>> +     * delay to retire requests or with virtual engines and a request
>>>> +     * running on another instance within the same class / submit 
>>>> mask.
>>>> +     */
>>>> +    if (intel_engine_uses_guc(engine))
>>>> +        return false;
>>>> +
>>>>       /* Ring stopped? */
>>>>       return ring_is_idle(engine);
>>>>   }
>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>> index 94e5c29d2ee3a..ee5334840e9cb 100644
>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>> @@ -654,13 +654,13 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
>>>>   {
>>>>       int ret;
>>>>   +    if (val & DROP_RETIRE || val & DROP_RESET_ACTIVE)
>>>> +        intel_gt_retire_requests(gt);
>>>> +
>>>>       if (val & DROP_RESET_ACTIVE &&
>>>>           wait_for(intel_engines_are_idle(gt), 
>>>> I915_IDLE_ENGINES_TIMEOUT))
>>>>           intel_gt_set_wedged(gt);
>>>>   -    if (val & DROP_RETIRE)
>>>> -        intel_gt_retire_requests(gt);
>>>> -
>>>>       if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>>>           ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>>           if (ret)
>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>> index c22f29c3faa0e..53c7474dde495 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>> @@ -278,7 +278,7 @@ struct i915_gem_mm {
>>>>       u32 shrink_count;
>>>>   };
>>>>   -#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
>>>> +#define I915_IDLE_ENGINES_TIMEOUT (500) /* in ms */
>>>>     unsigned long i915_fence_context_timeout(const struct 
>>>> drm_i915_private *i915,
>>>>                        u64 context);
>>
