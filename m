Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FA4B872D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 12:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0E510EA28;
	Wed, 16 Feb 2022 11:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6478610E999;
 Wed, 16 Feb 2022 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645012480; x=1676548480;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xj4HoD+9u0FMw8ZZdWCf3ehitqJtDMtcGbBS9QDZq7w=;
 b=HrzlZo7a/49wJHC0xo4C0c62MMfBVs1NwdqXxaxiTA+aQBbrUpiFh/7W
 +2Eob6QyxKuGh983acpfNKHKnYM5BhOSeYpUWE+oG4UYkcUsfNx8hlQrJ
 s7CK+0mmQoAXbizqPsxJc5NwjyI4N13kvno//UWZgoBEfV6plqpVeUOzK
 z1mOkWXakXF8URlf4wBPfvB630rDLfCtyFJCz//r0aHgUReWUVmQbO8xm
 suiqKzJBavNHiONChVnp2rEEh38+mQIiR6R6Y3XfNk9WNosCu06ShmlOC
 d7GqYh2oqPe55qHpxrEoOAfw/mKi0xoWYzv5DKVdZKG+sDRwCZVcWMYbp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275167479"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="275167479"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 03:54:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="502992438"
Received: from sphadnis-mobl1.amr.corp.intel.com (HELO [10.212.82.113])
 ([10.212.82.113])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 03:54:38 -0800
Message-ID: <10cd355a-cc30-ac88-bed1-adcf91b033db@linux.intel.com>
Date: Wed, 16 Feb 2022 11:54:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Initialize GuC submission locks
 and queues early
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
 <5de141fa-014f-e95f-7dc8-74d95a9c6b14@linux.intel.com>
 <02e89fe1-a97d-1587-ea78-1e3a4518c649@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <02e89fe1-a97d-1587-ea78-1e3a4518c649@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/02/2022 16:39, Ceraolo Spurio, Daniele wrote:
> On 2/15/2022 1:09 AM, Tvrtko Ursulin wrote:
>>
>> On 15/02/2022 01:11, Daniele Ceraolo Spurio wrote:
>>> Move initialization of submission-related spinlock, lists and workers to
>>> init_early. This fixes an issue where if the GuC init fails we might
>>> still try to get the lock in the context cleanup code. Note that it is
>>
>> What's the worst case impact on non-debug builds aka is Fixes: required?
> 
> There is no lock contention in this scenario and nothing is done within 
> the locked section (because submission is not initialized and all 
> contexts are marked as invalid), so no problems from the fact that the 
> lock doesn't work. Is that enough to avoid a fixes tag?

If the "lock doesn't work" is benign due no chance of touching 
uninitialised memory and then deadlocking then it's good. I just 
couldn't read that part from the commit message and did not have time to 
go dig into the code.

Regards,

Tvrtko

> Daniele
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> safe to call the GuC context cleanup code even if the init failed
>>> because all contexts are initialized with an invalid GuC ID, which will
>>> cause the GuC side of the cleanup to be skipped, so it is easier to just
>>> make sure the variables are initialized than to special case the cleanup
>>> to handle the case when they're not.
>>>
>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4932
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++---------
>>>   1 file changed, 14 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index b3a429a92c0da..2160da2c83cbf 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1818,24 +1818,11 @@ int intel_guc_submission_init(struct 
>>> intel_guc *guc)
>>>        */
>>>       GEM_BUG_ON(!guc->lrc_desc_pool);
>>>   -    xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>>> -
>>> -    spin_lock_init(&guc->submission_state.lock);
>>> -    INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>>> -    ida_init(&guc->submission_state.guc_ids);
>>> - INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>>> -    INIT_WORK(&guc->submission_state.destroyed_worker,
>>> -          destroyed_worker_func);
>>> -    INIT_WORK(&guc->submission_state.reset_fail_worker,
>>> -          reset_fail_worker_func);
>>> -
>>>       guc->submission_state.guc_ids_bitmap =
>>>           bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>>>       if (!guc->submission_state.guc_ids_bitmap)
>>>           return -ENOMEM;
>>>   -    spin_lock_init(&guc->timestamp.lock);
>>> -    INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>>>       guc->timestamp.ping_delay = (POLL_TIME_CLKS / 
>>> gt->clock_frequency + 1) * HZ;
>>>       guc->timestamp.shift = gpm_timestamp_shift(gt);
>>>   @@ -3831,6 +3818,20 @@ static bool __guc_submission_selected(struct 
>>> intel_guc *guc)
>>>     void intel_guc_submission_init_early(struct intel_guc *guc)
>>>   {
>>> +    xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>>> +
>>> +    spin_lock_init(&guc->submission_state.lock);
>>> +    INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>>> +    ida_init(&guc->submission_state.guc_ids);
>>> + INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>>> +    INIT_WORK(&guc->submission_state.destroyed_worker,
>>> +          destroyed_worker_func);
>>> +    INIT_WORK(&guc->submission_state.reset_fail_worker,
>>> +          reset_fail_worker_func);
>>> +
>>> +    spin_lock_init(&guc->timestamp.lock);
>>> +    INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>>> +
>>>       guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>>>       guc->submission_supported = __guc_submission_supported(guc);
>>>       guc->submission_selected = __guc_submission_selected(guc);
> 
