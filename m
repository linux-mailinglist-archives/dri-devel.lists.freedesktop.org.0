Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3DC47D516
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 17:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CA110E216;
	Wed, 22 Dec 2021 16:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ED510E216;
 Wed, 22 Dec 2021 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640190319; x=1671726319;
 h=message-id:date:mime-version:subject:from:to:references:
 cc:in-reply-to:content-transfer-encoding;
 bh=w04gZYOw/p0MMOohsQT4hgj1PSb8fwyWNI7FhQVNNgU=;
 b=FtkHbQXsjlkE6ZBarn/jbkndIK3anXKaWXkwZDg4zi9hc3qjRrzIud3O
 VDXqdKJmol0fa7XIUoiOUrxYZprRau/6nBj/Qwp3+rJZMycShQfXlxCp1
 5BntxZdby6AN9HD1D7r9WEBAkC+8lGHD3SUR439BVRX/ElAXIFf7O7+Um
 avER/yyC0TwKMzqvDBV0EkPiBhwr79pXXCRIzEPOtv2RP+YJt4HmwMxB+
 qhgkoI/wWpB2Pv/ufaqIJp9M86ypcD+BgNfS/KPfqb1c2pceudKSameL1
 pVK10/wK0C3tOhe86Z9qaG2DRYGkv9IyIT5UzD78NOWyPeJ1n3edVuWYF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240459556"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="240459556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 08:25:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="468222445"
Received: from rajvende-mobl1.ger.corp.intel.com (HELO [10.213.198.55])
 ([10.213.198.55])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 08:25:16 -0800
Message-ID: <d614aa61-91ed-5e99-64fa-baa147c6d493@linux.intel.com>
Date: Wed, 22 Dec 2021 16:25:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/guc: Don't hog IRQs when
 destroying contexts
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20211214170500.28569-1-matthew.brost@intel.com>
 <20211214170500.28569-5-matthew.brost@intel.com>
 <7cc85926-75e8-0368-1684-62ae5f341807@linux.intel.com>
 <35bc4a2a-9a50-9651-5c17-65f788817f64@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <35bc4a2a-9a50-9651-5c17-65f788817f64@linux.intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ping?

Main two points being:

1) Commit message seems in contradiction with the change in 
guc_flush_destroyed_contexts. And the lock drop to immediately 
re-acquire it looks questionable to start with.

2) And in deregister_destroyed_contexts and in 1) I was therefore asking 
if you can unlink all at once and process with reduced hammering on the 
lock.

Regards,

Tvrtko

On 17/12/2021 11:14, Tvrtko Ursulin wrote:
> 
> On 17/12/2021 11:06, Tvrtko Ursulin wrote:
>> On 14/12/2021 17:04, Matthew Brost wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> While attempting to debug a CT deadlock issue in various CI failures
>>> (most easily reproduced with gem_ctx_create/basic-files), I was seeing
>>> CPU deadlock errors being reported. This were because the context
>>> destroy loop was blocking waiting on H2G space from inside an IRQ
>>> spinlock. There no was deadlock as such, it's just that the H2G queue
>>> was full of context destroy commands and GuC was taking a long time to
>>> process them. However, the kernel was seeing the large amount of time
>>> spent inside the IRQ lock as a dead CPU. Various Bad Things(tm) would
>>> then happen (heartbeat failures, CT deadlock errors, outstanding H2G
>>> WARNs, etc.).
>>>
>>> Re-working the loop to only acquire the spinlock around the list
>>> management (which is all it is meant to protect) rather than the
>>> entire destroy operation seems to fix all the above issues.
>>>
>>> v2:
>>>   (John Harrison)
>>>    - Fix typo in comment message
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 ++++++++++++-------
>>>   1 file changed, 28 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 36c2965db49b..96fcf869e3ff 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2644,7 +2644,6 @@ static inline void guc_lrc_desc_unpin(struct 
>>> intel_context *ce)
>>>       unsigned long flags;
>>>       bool disabled;
>>> -    lockdep_assert_held(&guc->submission_state.lock);
>>>       GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>>>       GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>>>       GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>>> @@ -2660,7 +2659,7 @@ static inline void guc_lrc_desc_unpin(struct 
>>> intel_context *ce)
>>>       }
>>>       spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>>       if (unlikely(disabled)) {
>>> -        __release_guc_id(guc, ce);
>>> +        release_guc_id(guc, ce);
>>>           __guc_context_destroy(ce);
>>>           return;
>>>       }
>>> @@ -2694,36 +2693,48 @@ static void __guc_context_destroy(struct 
>>> intel_context *ce)
>>>   static void guc_flush_destroyed_contexts(struct intel_guc *guc)
>>>   {
>>> -    struct intel_context *ce, *cn;
>>> +    struct intel_context *ce;
>>>       unsigned long flags;
>>>       GEM_BUG_ON(!submission_disabled(guc) &&
>>>              guc_submission_initialized(guc));
>>> -    spin_lock_irqsave(&guc->submission_state.lock, flags);
>>> -    list_for_each_entry_safe(ce, cn,
>>> -                 &guc->submission_state.destroyed_contexts,
>>> -                 destroyed_link) {
>>> -        list_del_init(&ce->destroyed_link);
>>> -        __release_guc_id(guc, ce);
>>> +    while (!list_empty(&guc->submission_state.destroyed_contexts)) {
>>
>> Are lockless false negatives a concern here - I mean this thread not 
>> seeing something just got added to the list?
>>
>>> +        spin_lock_irqsave(&guc->submission_state.lock, flags);
>>> +        ce = 
>>> list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
>>> +                          struct intel_context,
>>> +                          destroyed_link);
>>> +        if (ce)
>>> +            list_del_init(&ce->destroyed_link);
>>> +        spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>> +
>>> +        if (!ce)
>>> +            break;
>>> +
>>> +        release_guc_id(guc, ce);
>>
>> This looks suboptimal and in conflict with this part of the commit 
>> message:
>>
>> """
>>   Re-working the loop to only acquire the spinlock around the list
>>   management (which is all it is meant to protect) rather than the
>>   entire destroy operation seems to fix all the above issues.
>> """
>>
>> Because you end up doing:
>>
>> ... loop ...
>>    spin_lock_irqsave(&guc->submission_state.lock, flags);
>>    list_del_init(&ce->destroyed_link);
>>    spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>
>>    release_guc_id, which calls:
>>      spin_lock_irqsave(&guc->submission_state.lock, flags);
>>      __release_guc_id(guc, ce);
>>      spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>
>> So a) the lock seems to be protecting more than just list management, 
>> or release_guc_if is wrong, and b) the loop ends up with highly 
>> questionable hammering on the lock.
>>
>> Is there any point to this part of the patch? Or the only business end 
>> of the patch is below:
>>
>>>           __guc_context_destroy(ce);
>>>       }
>>> -    spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>   }
>>>   static void deregister_destroyed_contexts(struct intel_guc *guc)
>>>   {
>>> -    struct intel_context *ce, *cn;
>>> +    struct intel_context *ce;
>>>       unsigned long flags;
>>> -    spin_lock_irqsave(&guc->submission_state.lock, flags);
>>> -    list_for_each_entry_safe(ce, cn,
>>> -                 &guc->submission_state.destroyed_contexts,
>>> -                 destroyed_link) {
>>> -        list_del_init(&ce->destroyed_link);
>>> +    while (!list_empty(&guc->submission_state.destroyed_contexts)) {
>>> +        spin_lock_irqsave(&guc->submission_state.lock, flags);
>>> +        ce = 
>>> list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
>>> +                          struct intel_context,
>>> +                          destroyed_link);
>>> +        if (ce)
>>> +            list_del_init(&ce->destroyed_link);
>>> +        spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>> +
>>> +        if (!ce)
>>> +            break;
>>> +
>>>           guc_lrc_desc_unpin(ce);
>>
>> Here?
>>
>> Not wanting/needing to nest ce->guc_state.lock under 
>> guc->submission_state.lock, and call the CPU cycle expensive 
>> deregister_context?
>>
>> 1)
>> Could you unlink en masse, under the assumption destroyed contexts are 
>> not reachable from anywhere else at this point, so under a single lock 
>> hold?
>>
>> 2)
>> But then you also end up with guc_lrc_desc_unpin calling 
>> __release_guc_id, which when called by release_guc_id does take 
>> guc->submission_state.lock and here it does not. Is it then clear 
>> which operations inside __release_guc_id need the lock? Bitmap or IDA?
> 
> Ah no, with 2nd point I missed you changed guc_lrc_desc_unpin to call 
> release_guc_id.
> 
> Question on the merit of change in guc_flush_destroyed_contexts remains, 
> and also whether at both places you could do group unlink (one lock 
> hold), put on a private list, and then unpin/deregister.
> 
> Regards,
> 
> Tvrtko
