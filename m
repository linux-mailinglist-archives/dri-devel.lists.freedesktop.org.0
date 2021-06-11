Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304803A3FCB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 12:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04A16EE6C;
	Fri, 11 Jun 2021 10:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E686EE72;
 Fri, 11 Jun 2021 10:07:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i94so5437991wri.4;
 Fri, 11 Jun 2021 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=n8g7ZnkckiCgaYJXyB5B/9AcD1eNFrx+Hqhw/CS/rHk=;
 b=k3oydvUypepGjTT1OkKfLLbKukr+w4yNuphIJoAx7dfF2Ee6qZpjUkmBzaKjLDLYWS
 HqgI/wWvQ9dfC5aU+zsNTmyP3bDVmvBMP+CpFPQFkdj1yc/ca82lJVVwKXg8CbyuU+tg
 1aAIo20WkFvFt47q3udIl4n8P7Za2mi+fHLthh+sVyVya6jhwOI13wOtJygkcTH6n3NN
 K+SRmeUYwB5xJXJSkO3oRBOEtA5JR4rmpRxhWfCZNyjqqqnHOcxvW7QzgiEcELVUHAyL
 MhnE4U/0rNAQC7xJH1F2i4Rs6oETbhrYZJX2ItDdp3wxl2hn95h80Yc6xUVrFdbW3DNC
 cx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n8g7ZnkckiCgaYJXyB5B/9AcD1eNFrx+Hqhw/CS/rHk=;
 b=Ya7xCXgt/g4dIX42+heMI4cSPzGIe6c8B0JrKjysndJtvo9dr7os3DybvEmnxQOdBF
 eqa6/pwxN8h6UyCk3hKQjQK4PFsQxgS4Mam2i0N9DxtcQrNf45C0y6bb6rfBnS2+0wlq
 q/ilIjLSoTPC1hJTCwqgy3p1Owargo4MmazTAuTQXVzMG5gJBo+TkrqR8xFPFyOFJp6b
 M4HaWdDcgdGOYikxm7HdNccMpYrU01Ge/h+hAOkWB2/3TREk2VuytxfoCn8GIQksOfiu
 eYhbeYtcE9992+95Q+qhwikTwjhMbsy3e2KG5V33YIFGuGN8jdlvL3AAWrRb1+wzod3z
 jk7g==
X-Gm-Message-State: AOAM532oTyN0wPZHLjYqs+VwvsJr77MVvOjFhV1FIQAwAFo4CDJ6sG68
 +AXB6iJd8XbZ8QlVUd0lV8DPtxwuync=
X-Google-Smtp-Source: ABdhPJxbl+NFqmXYbsIiIfZ1gjrs0Pw25LH1Q0zuNWZpUHW0ZsQ9iMb5vdPpX0hWR6LNkK7lSc6whg==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3117739wrn.157.1623406022501; 
 Fri, 11 Jun 2021 03:07:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:108e:ba37:cb49:9c3?
 ([2a02:908:1252:fb60:108e:ba37:cb49:9c3])
 by smtp.gmail.com with ESMTPSA id 89sm6732939wri.94.2021.06.11.03.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 03:07:02 -0700 (PDT)
Subject: Re: [PATCH 4/7] dma-buf: add dma_fence_chain_garbage_collect
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-5-christian.koenig@amd.com>
 <YMMlmt0frb1Pfdo0@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e844dace-832c-3a0a-8ca2-d3aeb5cfde19@gmail.com>
Date: Fri, 11 Jun 2021 12:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMMlmt0frb1Pfdo0@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 10:58 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 11:17:57AM +0200, Christian König wrote:
>> Add some rather sophisticated lockless garbage collection
>> for dma_fence_chain objects.
>>
>> For this keep all initialized dma_fence_chain nodes an a
>> queue and trigger garbage collection before a new one is
>> allocated.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Uh hand-rolled lockless list, I'm not a fan.
>
> But the real question here is why? This is a global list, so it's going to
> look great on your desktop, but gpus are for servers now and those are
> NUMA. So just from that pov doing garbage-collection individually still
> feels like a much better idea.

Yeah, I was pondering on that quite a bit as well. That why I added the 
multi threaded alloc/free test.

> So what's the problem your trying to solve here?

I was not sure if the chain is garbage collected enough when used for 
the dma_resv exclusive object.

But I think we could just drop this for now and just see how it goes.

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-fence-chain.c | 160 +++++++++++++++++++++++++-----
>>   include/linux/dma-fence-chain.h   |   5 +
>>   2 files changed, 142 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index 1b4cb3e5cec9..c2f0b69eabb7 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -9,8 +9,53 @@
>>   
>>   #include <linux/dma-fence-chain.h>
>>   
>> +static struct dma_fence_chain __rcu *fifo_front;
>> +static struct dma_fence_chain __rcu **fifo_back = &fifo_front;
>> +
>>   static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>>   
>> +/**
>> + * dma_fence_chain_enqueue - enqeue a chain node for garbage collection
>> + * @chain: the chain node to enqueue
>> + *
>> + * Add the chain node to the end of the gc fifo.
>> + */
>> +static void dma_fence_chain_enqueue(struct dma_fence_chain *chain)
>> +{
>> +	struct dma_fence_chain __rcu **tmp;
>> +
>> +	RCU_INIT_POINTER(chain->next, NULL);
>> +	tmp = xchg((struct dma_fence_chain __force ***)&fifo_back,
>> +		   &chain->next);
>> +
>> +	/* This is intentionally unordered since we only need the fifo for gc */
>> +	rcu_assign_pointer(*tmp, chain);
>> +}
>> +
>> +/**
>> + * dma_fence_chain_dequeue - deqeueue a chain node for garbage collection
>> + *
>> + * Remove the first chain node from the gc fifo while making sure that always
>> + * keep at least one node on the fifo for lockless fifo implementation.
>> + * Returns the dequeued chain node or NULL.
>> + */
>> +static struct dma_fence_chain *dma_fence_chain_dequeue(void)
>> +{
>> +	struct dma_fence_chain *chain, *tmp;
>> +
>> +	rcu_read_lock();
>> +	chain = rcu_dereference(fifo_front);
>> +	/* Never dequeue the last chain node for lockless fifo */
>> +	if (unlikely(!chain || !rcu_access_pointer(chain->next))) {
>> +		rcu_read_unlock();
>> +		return NULL;
>> +	}
>> +	tmp = cmpxchg((struct dma_fence_chain __force **)&fifo_front,
>> +		      chain, rcu_access_pointer(chain->next));
>> +	rcu_read_unlock();
>> +	return tmp == chain ? chain : NULL;
>> +}
>> +
>>   /**
>>    * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
>>    * @chain: chain node to get the previous node from
>> @@ -28,6 +73,43 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>>   	return prev;
>>   }
>>   
>> +/**
>> + * dma_fence_chain_try_replace - try to replace the prev node
>> + * @chain: Chain node we try to replace prev.
>> + * @prev: the old prev node
>> + *
>> + * Try to replace the previous chain node when it or its containing fence is
>> + * signaled. Returns true if we tried, false if we need to wait.
>> + */
>> +static bool dma_fence_chain_try_replace(struct dma_fence_chain *chain,
>> +					struct dma_fence *prev)
>> +{
>> +	struct dma_fence *replacement, *tmp;
>> +	struct dma_fence_chain *prev_chain;
>> +
>> +	prev_chain = to_dma_fence_chain(prev);
>> +	if (prev_chain) {
>> +		if (!dma_fence_is_signaled(prev_chain->fence))
>> +			return false;
>> +
>> +		replacement = dma_fence_chain_get_prev(prev_chain);
>> +	} else {
>> +		if (!dma_fence_is_signaled(prev))
>> +			return false;
>> +
>> +		replacement = NULL;
>> +	}
>> +
>> +	tmp = cmpxchg((struct dma_fence __force **)&chain->prev, prev,
>> +		      replacement);
>> +	if (tmp == prev)
>> +		dma_fence_put(tmp);
>> +	else
>> +		dma_fence_put(replacement);
>> +
>> +	return true;
>> +}
>> +
>>   /**
>>    * dma_fence_chain_walk - chain walking function
>>    * @fence: current chain node
>> @@ -38,8 +120,8 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>>    */
>>   struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>>   {
>> -	struct dma_fence_chain *chain, *prev_chain;
>> -	struct dma_fence *prev, *replacement, *tmp;
>> +	struct dma_fence_chain *chain;
>> +	struct dma_fence *prev;
>>   
>>   	chain = to_dma_fence_chain(fence);
>>   	if (!chain) {
>> @@ -48,26 +130,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>>   	}
>>   
>>   	while ((prev = dma_fence_chain_get_prev(chain))) {
>> -
>> -		prev_chain = to_dma_fence_chain(prev);
>> -		if (prev_chain) {
>> -			if (!dma_fence_is_signaled(prev_chain->fence))
>> -				break;
>> -
>> -			replacement = dma_fence_chain_get_prev(prev_chain);
>> -		} else {
>> -			if (!dma_fence_is_signaled(prev))
>> -				break;
>> -
>> -			replacement = NULL;
>> -		}
>> -
>> -		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
>> -			      prev, replacement);
>> -		if (tmp == prev)
>> -			dma_fence_put(tmp);
>> -		else
>> -			dma_fence_put(replacement);
>> +		if (!dma_fence_chain_try_replace(chain, prev))
>> +			break;
>>   		dma_fence_put(prev);
>>   	}
>>   
>> @@ -205,7 +269,21 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>>   	dma_fence_put(prev);
>>   
>>   	dma_fence_put(chain->fence);
>> -	dma_fence_free(fence);
>> +	WRITE_ONCE(chain->fence, NULL);
>> +
>> +	/*
>> +	 * Don't garbage collect here to avoid recursion and potential stack
>> +	 * overflow.
>> +	 */
>> +	chain = dma_fence_chain_dequeue();
>> +	if (!chain)
>> +		return;
>> +
>> +	if (kref_read(&chain->base.refcount) ||
>> +	    READ_ONCE(chain->fence))
>> +		dma_fence_chain_enqueue(chain);
>> +	else
>> +		dma_fence_free(&chain->base);
>>   }
>>   
>>   const struct dma_fence_ops dma_fence_chain_ops = {
>> @@ -218,6 +296,40 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>>   };
>>   EXPORT_SYMBOL(dma_fence_chain_ops);
>>   
>> +/**
>> + * dma_fence_chain_garbage_collect - cleanup chain nodes
>> + *
>> + * Do some garbage collection and try to release chain nodes.
>> + */
>> +void dma_fence_chain_garbage_collect(void)
>> +{
>> +	struct dma_fence_chain *chain = dma_fence_chain_dequeue();
>> +
>> +	if (!chain)
>> +		return;
>> +
>> +	if (!dma_fence_get_rcu(&chain->base)) {
>> +		/* Unused, check if it's also clean */
>> +		if (likely(!READ_ONCE(chain->fence))) {
>> +			dma_fence_free(&chain->base);
>> +			return;
>> +		}
>> +
>> +	} else {
>> +		struct dma_fence *prev;
>> +
>> +		/* Used, do some chain walk */
>> +		prev = dma_fence_chain_get_prev(chain);
>> +		if (prev) {
>> +			dma_fence_chain_try_replace(chain, prev);
>> +			dma_fence_put(prev);
>> +		}
>> +		dma_fence_put(&chain->base);
>> +	}
>> +	dma_fence_chain_enqueue(chain);
>> +}
>> +EXPORT_SYMBOL(dma_fence_chain_garbage_collect);
>> +
>>   /**
>>    * dma_fence_chain_init - initialize a fence chain
>>    * @chain: the chain node to initialize
>> @@ -254,5 +366,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>   
>>   	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>>   		       &chain->lock, context, seqno);
>> +	dma_fence_chain_enqueue(chain);
>>   }
>> +
>>   EXPORT_SYMBOL(dma_fence_chain_init);
>> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
>> index 5f45689a6d2e..b412b5396434 100644
>> --- a/include/linux/dma-fence-chain.h
>> +++ b/include/linux/dma-fence-chain.h
>> @@ -19,6 +19,7 @@
>>    * @base: fence base class
>>    * @lock: spinlock for fence handling
>>    * @prev: previous fence of the chain
>> + * @next: next chain node for garbage collection
>>    * @prev_seqno: original previous seqno before garbage collection
>>    * @fence: encapsulated fence
>>    * @cb: callback structure for signaling
>> @@ -27,6 +28,7 @@
>>   struct dma_fence_chain {
>>   	struct dma_fence base;
>>   	struct dma_fence __rcu *prev;
>> +	struct dma_fence_chain __rcu *next;
>>   	u64 prev_seqno;
>>   	struct dma_fence *fence;
>>   	union {
>> @@ -38,6 +40,8 @@ struct dma_fence_chain {
>>   
>>   extern const struct dma_fence_ops dma_fence_chain_ops;
>>   
>> +void dma_fence_chain_garbage_collect(void);
>> +
>>   /**
>>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
>>    * @fence: fence to cast to a dma_fence_array
>> @@ -61,6 +65,7 @@ to_dma_fence_chain(struct dma_fence *fence)
>>    */
>>   static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
>>   {
>> +	dma_fence_chain_garbage_collect();
>>   	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>>   };
>>   
>> -- 
>> 2.25.1
>>

