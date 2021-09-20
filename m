Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E04112D9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0CF6E455;
	Mon, 20 Sep 2021 10:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1D6E491;
 Mon, 20 Sep 2021 10:26:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="210182731"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="210182731"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:26:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473548268"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119])
 ([10.213.235.119])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:26:31 -0700
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-2-christian.koenig@amd.com>
 <YUSWzm+TjD7GHHO5@phenom.ffwll.local>
 <8268d2e8-8a37-0ff1-7065-c8aaf5c8672b@linux.intel.com>
 <e4aa2e1e-753e-655c-423f-93a0bb853b9d@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ae6b83cd-927f-3050-f95f-9c351e98ec80@linux.intel.com>
Date: Mon, 20 Sep 2021 11:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e4aa2e1e-753e-655c-423f-93a0bb853b9d@gmail.com>
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


On 20/09/2021 11:09, Christian König wrote:
> Am 20.09.21 um 10:43 schrieb Tvrtko Ursulin:
>> On 17/09/2021 14:23, Daniel Vetter wrote:
>>> On Fri, Sep 17, 2021 at 02:34:48PM +0200, Christian König wrote:
>>>> Abstract the complexity of iterating over all the fences
>>>> in a dma_resv object.
>>>>
>>>> The new loop handles the whole RCU and retry dance and
>>>> returns only fences where we can be sure we grabbed the
>>>> right one.
>>>>
>>>> v2: fix accessing the shared fences while they might be freed,
>>>>      improve kerneldoc, rename _cursor to _iter, add
>>>>      dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
>>>>   include/linux/dma-resv.h   | 84 
>>>> ++++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 145 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 84fbe60629e3..3e77cad2c9d4 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv 
>>>> *obj, struct dma_fence *fence)
>>>>   }
>>>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>>>   +/**
>>>> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
>>>> + * @cursor: cursor to record the current position
>>>> + * @first: if we should start over
>>>> + *
>>>> + * Return all the fences in the dma_resv object which are not yet 
>>>> signaled.
>>>> + * The returned fence has an extra local reference so will stay alive.
>>>> + * If a concurrent modify is detected the whole iterration is 
>>>> started over again.
>>>> + */
>>>> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter 
>>>> *cursor,
>>>
>>> Bit ocd, but I'd still just call that iter_next.
>>>
>>>> +                          bool first)
>>>
>>> Hm I'd put all the init code into iter_begin ...
>>
>> @Christian:
>>
>> Could you engineer something in here which would, at least in debug 
>> builds, catch failures to call "iter begin" before using the iterator 
>> macro?
> 
> Yeah, I've already played with the thought of somehow teaching lockdep 
> that. But then abandoned this as abusive of lockdep.

Yes probably not lockdep but would need to be a separate build time 
option akin to DEBUG_WW_MUTEXES and similar.

>>
>>>
>>>> +{
>>>> +    struct dma_resv *obj = cursor->obj;
>>>
>>> Aren't we missing rcu_read_lock() around the entire thing here?
>>>
>>>> +
>>>> +    first |= read_seqcount_retry(&obj->seq, cursor->seq);
>>>> +    do {
>>>> +        /* Drop the reference from the previous round */
>>>> +        dma_fence_put(cursor->fence);
>>>> +
>>>> +        cursor->is_first = first;
>>>> +        if (first) {
>>>> +            cursor->seq = read_seqcount_begin(&obj->seq);
>>>> +            cursor->index = -1;
>>>> +            cursor->fences = dma_resv_shared_list(obj);
>>>
>>> And then also call iter_begin from here. That way we guarantee that
>>> read_seqcount_begin is always called before _retry(). It's not a problem
>>> with the seqcount implementation (I think at least), but it definitely
>>> looks funny.
>>>
>>> Calling iter_begin here also makes it clear that we're essentially
>>> restarting.
>>>
>>>> +
>>>> +            cursor->fence = dma_resv_excl_fence(obj);
>>>> +            if (cursor->fence &&
>>>> +                test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>
>>> Please use the right dma_fence wrapper here for this and don't look 
>>> at the
>>> bits/flags outside of dma_fence.[hc] code. I just realized that we don't
>>> have the right amount of barriers in there for the fastpath, i.e. if we
>>> have:
>>>
>>> x = 0; /* static initializer */
>>>
>>> thread a
>>>     x = 1;
>>>     dma_fence_signal(fence);
>>>
>>>
>>> thread b;
>>>     if (dma_fence_is_signalled(fence))
>>>         printk("%i\n", x);
>>>
>>> Then you might actually be able to observe x == 0 in thread b. Which is
>>> not what we want at all.
>>
>> @Daniel:
>>
>> What do you mean here - in terms of if 'x' is "external" (not part of 
>> dma-fence), then are you suggesting dma-fence code should serialise it 
>> by using barriers?
>>
>> That would sound incorrect to me, or in other words, I think it's fine 
>> if x == 0 is observed in your example thread B since that code is 
>> mixing external data with dma-fence.
> 
> No, Daniel is right. The problem is that on architectures other than x86 
> barriers are per memory address (or rather cache line in practice).
> 
> So you need to be really careful that you see the fully consistent state 
> and not just one variable but others in the old state.

I don't see it yet - what are the variables we are talking about here? 
Ordering relating to the iterator code in here or something truly external?

Iterator can obviously race and "return" and already signaled fence 
(transitioned from unsignaled to signaled between iterator checking and 
deciding to walk it). But that I don't think you can, or plan to, fix.

> 
> But this was buggy before as well. I'm just pulling the existing test 
> into the new iterator.

Okay.

> 
>>
>> Hm also, there is that annoying bit where by using 
>> dma_fence_is_signaled any code becomes a fence signaling critical 
>> path, which I never bought into. There should be a way to test the 
>> signaled status without actually doing the signaling. Or I am 
>> misunderstanding something so badly that is really really has to be 
>> like this?
> 
> You are mixing things up. Testing is unproblematic, signaling is the 
> problematic one.

I was pointing out dma_fence_is_signaled can call dma_fence_signal. And 
that has in the past, AFAIR at least, caused some fence annotation 
splats which IMO are questionable.

Regards,

Tvrtko
