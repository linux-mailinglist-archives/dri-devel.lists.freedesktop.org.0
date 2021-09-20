Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153AC411128
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB286E431;
	Mon, 20 Sep 2021 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7B66E42E;
 Mon, 20 Sep 2021 08:43:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="221205249"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="221205249"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:43:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="473479639"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119])
 ([10.213.235.119])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:43:26 -0700
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked v2
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-2-christian.koenig@amd.com>
 <YUSWzm+TjD7GHHO5@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8268d2e8-8a37-0ff1-7065-c8aaf5c8672b@linux.intel.com>
Date: Mon, 20 Sep 2021 09:43:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUSWzm+TjD7GHHO5@phenom.ffwll.local>
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


On 17/09/2021 14:23, Daniel Vetter wrote:
> On Fri, Sep 17, 2021 at 02:34:48PM +0200, Christian König wrote:
>> Abstract the complexity of iterating over all the fences
>> in a dma_resv object.
>>
>> The new loop handles the whole RCU and retry dance and
>> returns only fences where we can be sure we grabbed the
>> right one.
>>
>> v2: fix accessing the shared fences while they might be freed,
>>      improve kerneldoc, rename _cursor to _iter, add
>>      dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
>>   include/linux/dma-resv.h   | 84 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 145 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 84fbe60629e3..3e77cad2c9d4 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>   
>> +/**
>> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
>> + * @cursor: cursor to record the current position
>> + * @first: if we should start over
>> + *
>> + * Return all the fences in the dma_resv object which are not yet signaled.
>> + * The returned fence has an extra local reference so will stay alive.
>> + * If a concurrent modify is detected the whole iterration is started over again.
>> + */
>> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
> 
> Bit ocd, but I'd still just call that iter_next.
> 
>> +					      bool first)
> 
> Hm I'd put all the init code into iter_begin ...

@Christian:

Could you engineer something in here which would, at least in debug 
builds, catch failures to call "iter begin" before using the iterator macro?

> 
>> +{
>> +	struct dma_resv *obj = cursor->obj;
> 
> Aren't we missing rcu_read_lock() around the entire thing here?
> 
>> +
>> +	first |= read_seqcount_retry(&obj->seq, cursor->seq);
>> +	do {
>> +		/* Drop the reference from the previous round */
>> +		dma_fence_put(cursor->fence);
>> +
>> +		cursor->is_first = first;
>> +		if (first) {
>> +			cursor->seq = read_seqcount_begin(&obj->seq);
>> +			cursor->index = -1;
>> +			cursor->fences = dma_resv_shared_list(obj);
> 
> And then also call iter_begin from here. That way we guarantee that
> read_seqcount_begin is always called before _retry(). It's not a problem
> with the seqcount implementation (I think at least), but it definitely
> looks funny.
> 
> Calling iter_begin here also makes it clear that we're essentially
> restarting.
> 
>> +
>> +			cursor->fence = dma_resv_excl_fence(obj);
>> +			if (cursor->fence &&
>> +			    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> 
> Please use the right dma_fence wrapper here for this and don't look at the
> bits/flags outside of dma_fence.[hc] code. I just realized that we don't
> have the right amount of barriers in there for the fastpath, i.e. if we
> have:
> 
> x = 0; /* static initializer */
> 
> thread a
> 	x = 1;
> 	dma_fence_signal(fence);
> 
> 
> thread b;
> 	if (dma_fence_is_signalled(fence))
> 		printk("%i\n", x);
> 
> Then you might actually be able to observe x == 0 in thread b. Which is
> not what we want at all.

@Daniel:

What do you mean here - in terms of if 'x' is "external" (not part of 
dma-fence), then are you suggesting dma-fence code should serialise it 
by using barriers?

That would sound incorrect to me, or in other words, I think it's fine 
if x == 0 is observed in your example thread B since that code is mixing 
external data with dma-fence.

Hm also, there is that annoying bit where by using dma_fence_is_signaled 
any code becomes a fence signaling critical path, which I never bought 
into. There should be a way to test the signaled status without actually 
doing the signaling. Or I am misunderstanding something so badly that is 
really really has to be like this?

> So no open-coding of dma_fence flag bits code outside of drm_fence.[hc]
> please. And yes i915-gem code is unfortunately a disaster.

Don't even miss an opportunity for some good trashing no? :D

But yes, deconstructed dma_fence_signal I thought we were supposed to 
add to core. Or at least propose, don't exactly remember how that went.

> 
>> +				     &cursor->fence->flags))
>> +				cursor->fence = NULL;
>> +		} else {
>> +			cursor->fence = NULL;
>> +		}
>> +
>> +		if (cursor->fence) {
>> +			cursor->fence = dma_fence_get_rcu(cursor->fence);
>> +		} else if (cursor->all_fences && cursor->fences) {
>> +			struct dma_resv_list *fences = cursor->fences;
>> +
>> +			while (++cursor->index < fences->shared_count) {
>> +				cursor->fence = rcu_dereference(
>> +					fences->shared[cursor->index]);
>> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> +					      &cursor->fence->flags))
>> +					break;
>> +			}
>> +			if (cursor->index < fences->shared_count)
>> +				cursor->fence =
>> +					dma_fence_get_rcu(cursor->fence);
>> +			else
>> +				cursor->fence = NULL;
>> +		}
> 
> The control flow here is very hairy, but I'm not sure how to best do this.
> With my suggestion to move the read_seqcount_begin into iter_begin maybe
> something like this:
> 
> iter_next()
> {
> 	do {
> 		dma_fence_put(cursor->fence)
> 		cursor->fence = NULL;
> 
> 		if (cursor->index == -1) { /* reset by iter_begin()
> 			cursor->fence = get_exclusive();
> 			cusor->index++;
> 		} else {
> 			cursor->fence = shared_fences[++cursor->index]
> 		}
> 
> 		if (!dma_fence_is_signalled(cursor->fence))
> 			continue; /* just grab the next fence. */
> 
> 		cursor->fence =  dma_fence_get_rcu(cursor->fence);
> 
> 		if (!cursor->fence || read_seqcount_retry()) {
> 			/* we lost the race, restart completely */
> 			iter_begin(); /* ->fence will be cleaned up at beginning of the loop */
> 			continue;
> 		}
> 
> 		return cursor->fence;
> 	} while (true);
> }
> 
> Maybe I missed something, but that avoids the duplication of all the
> tricky code, i.e. checking for signalling, rcu protected conditional
> fence_get, and the retry is also nicely at the end.
>> +
>> +		/* For the eventually next round */
>> +		first = true;
>> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
>> +
>> +	return cursor->fence;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
>> +
>>   /**
>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>    * @dst: the destination reservation object
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index 9100dd3dc21f..693d16117153 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -149,6 +149,90 @@ struct dma_resv {
>>   	struct dma_resv_list __rcu *fence;
>>   };
>>   
>> +/**
>> + * struct dma_resv_iter - current position into the dma_resv fences
>> + *
>> + * Don't touch this directly in the driver, use the accessor function instead.
>> + */
>> +struct dma_resv_iter {
>> +	/** @obj: The dma_resv object we iterate over */
>> +	struct dma_resv *obj;
>> +
>> +	/** @all_fences: If all fences should be returned */
>> +	bool all_fences;
>> +
>> +	/** @fence: the currently handled fence */
>> +	struct dma_fence *fence;
>> +
>> +	/** @seq: sequence number to check for modifications */
>> +	unsigned int seq;
>> +
>> +	/** @index: index into the shared fences */
> 
> If you go with my suggestion (assuming it works): Please add "-1 indicates
> to pick the exclusive fence instead."
> 
>> +	unsigned int index;
>> +
>> +	/** @fences: the shared fences */
>> +	struct dma_resv_list *fences;
>> +
>> +	/** @is_first: true if this is the first returned fence */
>> +	bool is_first;
> 
> I think if we just rely on -1 == exclusive fence/is_first we don't need
> this one here?
> 
>> +};
>> +
>> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
>> +					      bool first);
>> +
>> +/**
>> + * dma_resv_iter_begin - initialize a dma_resv_iter object
>> + * @cursor: The dma_resv_iter object to initialize
>> + * @obj: The dma_resv object which we want to iterator over
>> + * @all_fences: If all fences should be returned or just the exclusive one
> 
> Please add: "Callers must clean up the iterator with dma_resv_iter_end()."
> 
>> + */
>> +static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
>> +					struct dma_resv *obj,
>> +					bool all_fences)
>> +{
>> +	cursor->obj = obj;
>> +	cursor->all_fences = all_fences;
>> +	cursor->fence = NULL;
>> +}
>> +
>> +/**
>> + * dma_resv_iter_end - cleanup a dma_resv_iter object
>> + * @cursor: the dma_resv_iter object which should be cleaned up
>> + *
>> + * Make sure that the reference to the fence in the cursor is properly
>> + * dropped.
> 
> Please add:
> 
> "This function must be called every time dma_resv_iter_begin() was called
> to clean up any references."
>> + */
>> +static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
>> +{
>> +	dma_fence_put(cursor->fence);
>> +}
>> +
>> +/**
>> + * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
>> + * @cursor: the cursor of the current position
>> + *
>> + * Returns true if the currently returned fence is the exclusive one.
>> + */
>> +static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
>> +{
>> +	return cursor->index == -1;
>> +}
>> +
>> +/**
>> + * dma_resv_for_each_fence_unlocked - unlocked fence iterator
>> + * @cursor: a struct dma_resv_iter pointer
>> + * @fence: the current fence
>> + *
>> + * Iterate over the fences in a struct dma_resv object without holding the
>> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
>> + * be dropped and re-taken as necessary inside the loop. The cursor needs to be
>> + * initialized with dma_resv_iter_begin_unlocked() and cleaned up with
> 
> We don't have an _unlocked version?

@Christian:

I'd also mention that the fence reference is held during the walk so 
someone is less likely to grab extra ones.

> 
>> + * dma_resv_iter_end_unlocked().
>> + */
>> +#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
>> +	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
>> +	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
>> +
>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>>   
>> -- 
>> 2.25.1
>>
> 

Regards,

Tvrtko

