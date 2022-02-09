Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24C4AEC37
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B035E10E4D1;
	Wed,  9 Feb 2022 08:27:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482410E4D1;
 Wed,  9 Feb 2022 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644395225; x=1675931225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Us5xx47RA+BaRpkyZMTNHSDyRRwoIXbbpVJt9c2BiUo=;
 b=hZrm3kFvh0paK3SVHgrkekE//goIj9vMf7NYsPhwNA4ZfOOz7sT0UMCC
 SEiUl/R9EKjhJTG/tEcN0F6QiR6LOtDDl3pcG7LhcQWFxhKifT9wD4Oci
 Q4StzVJkQHtZlwPfX91JT+rOMFHCV+RclloZGLM9hkmpEzY6Y19NWa8+K
 TibSI0PM8rtAJMcXIDrvLANRfbsSTaJooJvEqObcsqo+IwCof/SpJrn/w
 9cwcR1V/Cehc+YD/Va6oDX1XAIg2wlpH2Bql97cfgLFRYHo4cm+7dRtcz
 LHyk3q4iYMTwg26VnWx8BcMO8Qkc93E1zJaysFEHKfV+C77jEh2JHIEPQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229124759"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="229124759"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:27:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="525902823"
Received: from dhussain-mobl.ger.corp.intel.com (HELO [10.213.227.135])
 ([10.213.227.135])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:27:03 -0800
Message-ID: <e85c44be-0770-3555-bed4-6fc598cdfb7b@linux.intel.com>
Date: Wed, 9 Feb 2022 08:27:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix flag query to not modify
 state
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220208020716.2140157-1-John.C.Harrison@Intel.com>
 <ba8ce5c6-ba11-f2af-917c-9e6e14445d43@linux.intel.com>
 <eaf8a239-57c6-69e8-a166-987eb6338acb@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <eaf8a239-57c6-69e8-a166-987eb6338acb@intel.com>
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



On 08/02/2022 18:53, John Harrison wrote:
> On 2/8/2022 01:39, Tvrtko Ursulin wrote:
>> On 08/02/2022 02:07, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A flag query helper was actually writing to the flags word rather than
>>> just reading. Fix that. Also update the function's comment as it was
>>> out of date.
>>>
>>> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
>>> Signed-off-by: John Harrison <john.c.harrison@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
>>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index b3a429a92c0d..d9f4218f5ef4 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -174,11 +174,8 @@ static inline void init_sched_state(struct 
>>> intel_context *ce)
>>>   __maybe_unused
>>>   static bool sched_state_is_init(struct intel_context *ce)
>>>   {
>>> -    /*
>>> -     * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED 
>>> after
>>> -     * suspend.
>>> -     */
>>> -    return !(ce->guc_state.sched_state &=
>>> +    /* Kernel contexts can have SCHED_STATE_REGISTERED after 
>>> suspend. */
>>> +    return !(ce->guc_state.sched_state &
>>>            ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>>>   }
>>
>> Looks important - what are the consequences?
> Supposedly nothing.
> 
> The test was only ever used inside a BUG_ON during context registration. 
> Rather than asserting that the condition was true, it was making the 
> condition true. So, in theory, there was no consequence because we 
> should never have hit a BUG_ON anyway. Which means the write should 
> always have been a no-op.
> 
>>
>> Needs Cc: stable for 5.16?
> Meaning "Cc: <stable@vger.kernel.org>"? Or is there anything required to 
> specify 5.16?

It would have been:

Cc: <stable@vger.kernel.org> # v5.16+

You can use "dim fixes <sha>" and it will output you the suggested tags.

But given what you say about it having no impact even in debug builds 
then it's not needed. Just note that explaining the impact in the commit 
message when Fixes: tag is present is very desirable in general. Without 
it maintainers have a hard time assessing and highlighting important 
stuff in pull requests. So I would at least ask for respin with updated 
commit message explaining there is no consequence and why cc stable is 
not needed.

Regards,

Tvrtko
