Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD55796A9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596C414A19E;
	Tue, 19 Jul 2022 09:49:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BAB14A096;
 Tue, 19 Jul 2022 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658224186; x=1689760186;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EgH1rgm4HVhwPAFfOniL62zgNxlhsUruveZjN4Tslbo=;
 b=EtIV9NGtlHhzdXxTj3jVb1wWtmGNRILukdsACSKIUzb3OaFezoOUCcfL
 obb5dIHgeo25o33qf8MCAKvpZ2dxMv1/l7djmwsBYZ3I7p5hF/6nmpfSa
 0AX5CRjkDLy43ZL4jwQJsUzF6CVOW/B0JJOR25qLDdGiykFpV/9yOabv9
 g5pOEVqplgwwZCX+LWuV3tQ+yzPX8uefiuMcnn+ZzgNkqNHvw4iGZE9rz
 IsmS5EUt+ZibrzKsqzBjkBMNAH7yZrQPHR5k35zvTcOutUXBAYZVhgPuY
 VOd7dGw47ctY8zHrylP9uCYWS86qDfEYW/FSDE3ITvPxumuaJg94OmtHI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269473536"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="269473536"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601533810"
Received: from ssherida-mobl.ger.corp.intel.com (HELO [10.213.201.170])
 ([10.213.201.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:49:44 -0700
Message-ID: <0107930e-bb8b-c7ee-c03c-7e7abf564498@linux.intel.com>
Date: Tue, 19 Jul 2022 10:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 02/12] drm/i915/guc: Don't call ring_is_idle
 in GuC submission
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org, Matthew Brost <matthew.brost@intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-3-John.C.Harrison@Intel.com>
 <2f9959ae-40fe-f14d-8e70-e94f03237769@linux.intel.com>
 <4f14835e-300e-a1b7-bebb-8ecbb07ab682@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4f14835e-300e-a1b7-bebb-8ecbb07ab682@intel.com>
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


On 19/07/2022 01:09, John Harrison wrote:
> On 7/18/2022 05:26, Tvrtko Ursulin wrote:
>>
>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> The engine registers really shouldn't be touched during GuC submission
>>> as the GuC owns the registers. Don't call ring_is_idle and tie
>>
>> Touch being just read and it is somehow harmful?
> The registers are meaningless when GuC is controlling the submission. 
> The i915 driver has no knowledge of what context is or is not executing 
> on any given engine at any given time. So reading reading the ring 
> registers is incorrect - it can lead to bad assumptions about what state 
> the hardware is in.

Same is actually true with the execlists backend. The code in 
ring_is_idle is not concerning itself with which context is running or 
not. Just that the head/tail/ctl appear idle.

Problem/motivation appears to be on a higher than simply ring registers.

I am not claiming it makes sense with Guc and that it has to remain but 
just suggesting for as a minimum clearer commit message.

>>> intel_engine_is_idle strictly to the engine pm.
>>
>> Strictly seems wrong - it is just ring_is_idle check that is replaced 
>> and not the whole implementation of intel_engine_is_idle.
>>
>>> Because intel_engine_is_idle tied to the engine pm, retire requests
>>> before checking intel_engines_are_idle in gt_drop_caches, and lastly
>> Why is re-ordering important? I at least can't understand it. I hope 
>> it's not working around IGT failures.
> If requests are physically completed but not retired then they will be 
> holding unnecessary PM references. So we need to flush those out before 
> checking for idle.

And if they are not as someone passes in DROP_RESET_ACTIVE? They will 
not retire and code still enters intel_engines_are_idle so that has to 
work, no? Something does not align for me still.

>>> increase the timeout in gt_drop_caches for the intel_engines_are_idle
>>> check.
>>
>> Same here - why?
> @Matthew Brost - do you recall which particular tests were hitting an 
> issue? I'm guessing gem_ctx_create? I believe that's the one that 
> creates and destroys thousands of contexts. That is much slower with GuC 
> (GuC communication required) than with execlists (i915 internal state 
> change only).

And if that is a logically separate change please split the patch up.

Regards,

Tvrtko

> 
> John.
> 
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +++++++++++++
>>>   drivers/gpu/drm/i915/i915_debugfs.c       |  6 +++---
>>>   drivers/gpu/drm/i915/i915_drv.h           |  2 +-
>>>   3 files changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index 283870c659911..959a7c92e8f4d 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -1602,6 +1602,9 @@ static bool ring_is_idle(struct intel_engine_cs 
>>> *engine)
>>>   {
>>>       bool idle = true;
>>>   +    /* GuC submission shouldn't access HEAD & TAIL via MMIO */
>>> +    GEM_BUG_ON(intel_engine_uses_guc(engine));
>>> +
>>>       if (I915_SELFTEST_ONLY(!engine->mmio_base))
>>>           return true;
>>>   @@ -1668,6 +1671,16 @@ bool intel_engine_is_idle(struct 
>>> intel_engine_cs *engine)
>>>       if (!i915_sched_engine_is_empty(engine->sched_engine))
>>>           return false;
>>>   +    /*
>>> +     * We shouldn't touch engine registers with GuC submission as 
>>> the GuC
>>> +     * owns the registers. Let's tie the idle to engine pm, at worst 
>>> this
>>> +     * function sometimes will falsely report non-idle when idle 
>>> during the
>>> +     * delay to retire requests or with virtual engines and a request
>>> +     * running on another instance within the same class / submit mask.
>>> +     */
>>> +    if (intel_engine_uses_guc(engine))
>>> +        return false;
>>> +
>>>       /* Ring stopped? */
>>>       return ring_is_idle(engine);
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>> index 94e5c29d2ee3a..ee5334840e9cb 100644
>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>> @@ -654,13 +654,13 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
>>>   {
>>>       int ret;
>>>   +    if (val & DROP_RETIRE || val & DROP_RESET_ACTIVE)
>>> +        intel_gt_retire_requests(gt);
>>> +
>>>       if (val & DROP_RESET_ACTIVE &&
>>>           wait_for(intel_engines_are_idle(gt), 
>>> I915_IDLE_ENGINES_TIMEOUT))
>>>           intel_gt_set_wedged(gt);
>>>   -    if (val & DROP_RETIRE)
>>> -        intel_gt_retire_requests(gt);
>>> -
>>>       if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>>           ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>           if (ret)
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>> b/drivers/gpu/drm/i915/i915_drv.h
>>> index c22f29c3faa0e..53c7474dde495 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -278,7 +278,7 @@ struct i915_gem_mm {
>>>       u32 shrink_count;
>>>   };
>>>   -#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
>>> +#define I915_IDLE_ENGINES_TIMEOUT (500) /* in ms */
>>>     unsigned long i915_fence_context_timeout(const struct 
>>> drm_i915_private *i915,
>>>                        u64 context);
> 
