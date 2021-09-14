Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBDA40AE90
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07736E49C;
	Tue, 14 Sep 2021 13:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB986E49C;
 Tue, 14 Sep 2021 13:07:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307538149"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307538149"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 06:07:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544063969"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116])
 ([10.213.234.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 06:07:22 -0700
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-2-christian.koenig@amd.com>
 <1eee4105-e154-9d1d-b92b-d17c6f8f8432@linux.intel.com>
 <abeccf85-13d1-9e3a-26c9-1ca0f6d4c322@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c03a61f2-9d70-c6f4-584d-b91c89ec7462@linux.intel.com>
Date: Tue, 14 Sep 2021 14:07:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <abeccf85-13d1-9e3a-26c9-1ca0f6d4c322@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/09/2021 12:25, Christian König wrote:
> Am 14.09.21 um 12:53 schrieb Tvrtko Ursulin:
>>
>> On 13/09/2021 14:16, Christian König wrote:
>>> Abstract the complexity of iterating over all the fences
>>> in a dma_resv object.
>>>
>>> The new loop handles the whole RCU and retry dance and
>>> returns only fences where we can be sure we grabbed the
>>> right one.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>>>   include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>>>   2 files changed, 99 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>> index 84fbe60629e3..213a9b7251ca 100644
>>> --- a/drivers/dma-buf/dma-resv.c
>>> +++ b/drivers/dma-buf/dma-resv.c
>>> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv 
>>> *obj, struct dma_fence *fence)
>>>   }
>>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>>   +/**
>>> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
>>> + * @obj: the dma_resv object
>>> + * @cursor: cursor to record the current position
>>> + * @all_fences: true returns also the shared fences
>>> + * @first: if we should start over
>>> + *
>>> + * Return all the fences in the dma_resv object which are not yet 
>>> signaled.
>>> + * The returned fence has an extra local reference so will stay alive.
>>> + * If a concurrent modify is detected the whole iterator is started 
>>> over again.
>>> + */
>>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>>> +                     struct dma_resv_cursor *cursor,
>>> +                     bool all_fences, bool first)
>>> +{
>>> +    struct dma_fence *fence = NULL;
>>> +
>>> +    do {
>>> +        /* Drop the reference from the previous round */
>>> +        dma_fence_put(fence);
>>> +
>>> +        cursor->is_first = first;
>>> +        if (first) {
>>> +            cursor->seq = read_seqcount_begin(&obj->seq);
>>> +            cursor->index = -1;
>>> +            cursor->fences = dma_resv_shared_list(obj);
>>> +            cursor->is_exclusive = true;
>>> +
>>> +            fence = dma_resv_excl_fence(obj);
>>> +            if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> +                          &fence->flags))
>>> +                fence = NULL;
>>> +        } else {
>>> +            fence = NULL;
>>> +        }
>>> +
>>> +        if (fence) {
>>> +            fence = dma_fence_get_rcu(fence);
>>> +        } else if (all_fences && cursor->fences) {
>>> +            struct dma_resv_list *fences = cursor->fences;
>>
>> If rcu lock is allowed to be dropped while walking the list what 
>> guarantees list of fences hasn't been freed?
> 
> Ah, good point! We need to test the sequence number when we enter the 
> function as well. Going to fix that.

Right, but just to say, I am still on the fence a bit on the concept of 
the unlocked iterator. So for now I am looking only superficially at the 
implementation and i915 side of things.

> 
>>
>> Like:
>>
>> 1st call
>>   -> gets seqcount
>>   -> stores cursor->fences
>>
>> rcu lock dropped/re-acquired
>>
>> 2nd call
>>   -> dereferences into cursor->fences -> boom?
>>
>>> +
>>> +            cursor->is_exclusive = false;
>>> +            while (++cursor->index < fences->shared_count) {
>>> +                fence = rcu_dereference(fences->shared[
>>> +                            cursor->index]);
>>> +                if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> +                          &fence->flags))
>>> +                    break;
>>> +            }
>>> +            if (cursor->index < fences->shared_count)
>>> +                fence = dma_fence_get_rcu(fence);
>>> +            else
>>> +                fence = NULL;
>>> +        }
>>> +
>>> +        /* For the eventually next round */
>>> +        first = true;
>>> +    } while (read_seqcount_retry(&obj->seq, cursor->seq));
>>> +
>>> +    return fence;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
>>> +
>>>   /**
>>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>>    * @dst: the destination reservation object
>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>> index 9100dd3dc21f..f5b91c292ee0 100644
>>> --- a/include/linux/dma-resv.h
>>> +++ b/include/linux/dma-resv.h
>>> @@ -149,6 +149,39 @@ struct dma_resv {
>>>       struct dma_resv_list __rcu *fence;
>>>   };
>>>   +/**
>>> + * struct dma_resv_cursor - current position into the dma_resv fences
>>> + * @seq: sequence number to check
>>> + * @index: index into the shared fences
>>> + * @shared: the shared fences
>>> + * @is_first: true if this is the first returned fence
>>> + * @is_exclusive: if the current fence is the exclusive one
>>> + */
>>> +struct dma_resv_cursor {
>>> +    unsigned int seq;
>>> +    unsigned int index;
>>> +    struct dma_resv_list *fences;
>>> +    bool is_first;
>>
>> Is_first is useful to callers - like they are legitimately allowed to 
>> look inside this, what could otherwise be private object?
> 
> Yes, I was pondering on the same question. Key point is that this is 
> only used by other dma_resv functions which also use cursor.fences for 
> example.
> 
> So this is only supposed to be used by code working with other privates 
> of the dma_resv object as well.

Hmmm and you think external callers have no legitimate case of detecting 
restarts? Or to better say will not have the need of distinguishing 
between real restarts and just the first iteration? I need to read more 
of the series to get a more complete opinion here.

> 
> Maybe adding that as a comment?
> 
>> What is the intended use case, given when true the returned fence can 
>> be either exclusive or first from a shared list?
> 
> To reset counters for and know that the sequence has restarted. See how 
> this is used in dma_resv_copy_fences() for example:
> 
>          rcu_read_lock();
>          dma_resv_for_each_fence_unlocked(dst, &cursor, true, f) {
> 
>                  if (cursor.is_first) {
>                          dma_resv_list_free(list);
>                          dma_fence_put(excl);
> 
>                          if (cursor.fences) {
>                                  unsigned int cnt = 
> cursor.fences->shared_count;
> 
>                                  rcu_read_unlock();
>                                  list = dma_resv_list_alloc(cnt);
> ...
> 
> 
>>
>>> +    bool is_exclusive;
>>
>> Is_exclusive could be written as index == -1 in the code, right? If so 
>> then an opportunity to remove some redundancy.
> 
> Correct and good point. But I want to move away a bit from the 
> exclusive/shared notation in the future and avoid that tests like index 
> == -1 spread around in the code.
> 
> What we could do is to add some helper like 
> dma_resv_cursor_is_excludive(cursor) which tests that.

Helper is I think a good solution.

> 
>>
>>> +};
>>> +
>>> +/**
>>> + * dma_resv_for_each_fence_unlocked - fence iterator
>>> + * @obj: a dma_resv object pointer
>>> + * @cursor: a struct dma_resv_cursor pointer
>>> + * @all_fences: true if all fences should be returned
>>> + * @fence: the current fence
>>> + *
>>> + * Iterate over the fences in a struct dma_resv object without 
>>> holding the
>>> + * dma_resv::lock. The RCU read side lock must be hold when using 
>>> this, but can
>>> + * be dropped and re-taken as necessary inside the loop. @all_fences 
>>> controls
>>> + * if the shared fences are returned as well.
>>> + */
>>> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, 
>>> fence)    \
>>> +    for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>>> true); \
>>> +         fence; dma_fence_put(fence),                    \
>>> +         fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>>> false))
>>
>> Has the fact RCU lock can be dropped so there is potential to walk 
>> over completely different snapshots been discussed?
> 
> Well that's basically the heart of the functionality. Even without 
> dropping the RCU lock there can be an restart at any time when the 
> dma_resv object is modified.

Hm yes.. that's one of the thing which makes me undecided yet whether a 
generalised helper is desirable. For example i915_gem_busy_ioctl, as 
converted, is not completely like-for-like. Maybe it is irrelevant for 
that one, but then the question needs to be answered for all of the 
replacements.

> 
>> At least if I followed the code correctly - it appears there is 
>> potential the walk restarts from the start (exclusive slot) at any 
>> point during the walk.
> 
> Correct, yes.
> 
>> Because theoretically I think you could take an atomic snapshot of 
>> everything (given you have a cursor object) and then release it on the 
>> end condition.
> 
> That's what the dma_resv_get_fences() function is good for, yes. This 
> one returns an array of fences.
> 
> The key difference is that we need to allocate memory for that which is 
> at least sometimes not feasible or desired.

Ah true.. dma_resv_list is not reference counted to simply grab it 
during setup.

> Thanks for the review,

Np, it is intriguing to look at the option of code consolidation. Just 
need to read more of the series to form a better high level opinion.

Regards,

Tvrtko

> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>   #define dma_resv_assert_held(obj) 
>>> lockdep_assert_held(&(obj)->lock.base)
>>>   @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int 
>>> num_fences);
>>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct 
>>> dma_fence *fence);
>>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence 
>>> *fence);
>>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>>> +                     struct dma_resv_cursor *cursor,
>>> +                     bool first, bool all_fences);
>>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence 
>>> **pfence_excl,
>>>               unsigned *pshared_count, struct dma_fence ***pshared);
>>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>>
> 
