Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC813A3E6E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 10:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59586E87A;
	Fri, 11 Jun 2021 08:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2586E87A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:58:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r9so5179669wrz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FMEqqIZNJAnBlxmxIYr+7vjHX7UJFxwgE3aT0eL/IGM=;
 b=XvNx0x/oBjx2/7SqS5LOLZTE51+hILj83aFltbyvoo2BE41tgL7Z4DD+LRm340Og6V
 QxiPqFFxWJzBhcGU49hIKEX/NvIP8WOgV1UUIeFPXLdl0NKaZKunVwzyYGXtjbUzPVpb
 nJi6z+ivzQXt4pPJBtYza2cvLj3dt9jLdjcDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FMEqqIZNJAnBlxmxIYr+7vjHX7UJFxwgE3aT0eL/IGM=;
 b=Hs/gw1r4w6oEr14VGylPV7vYUx2ksAs2+syZuCP2kvouSJZXqp00JL7Q4+TJbsEE/c
 gKCJgVERG0nm1CO2NMd2vZChltwiULZ4ktpmK8idm3Tq/ZZU92ZUtNM3CefhG6oC6/0n
 vNSLX0ENOEqrwmAlWt/LU+aoPTdt3Wcb4jvH38scymk5tfyqrFSYtqTv3O9WoeNB3Ldb
 itukUGSs7Q/u1lNwxjLgBaMyIhKR+Bl1cLU7xtwhBV/q5dnCsusz7SD82y4fiyMtC1VJ
 MRc/UA7kDCuAXD1oo03Z/BzXbnZz8iODFBSkf45bX/PMLcTMT9/7BxbVCtbSJoI3u4A3
 Gigw==
X-Gm-Message-State: AOAM533Qlruwg3g3rTiUuA/7Q/uCIuWzjiyyKBEtbmrpWIyNfdZdEGf4
 t4Tk39HkXLj45g6jBzbyuS4e+A==
X-Google-Smtp-Source: ABdhPJxoTR4/Rlgzq+4tok7htegrWc0im2HIOR6CtrNnzQAt2LflRyidsH/Pgdg3uIazwDhLzR1z9A==
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr2771240wrc.273.1623401884845; 
 Fri, 11 Jun 2021 01:58:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm6172571wmq.14.2021.06.11.01.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 01:58:04 -0700 (PDT)
Date: Fri, 11 Jun 2021 10:58:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: add dma_fence_chain_garbage_collect
Message-ID: <YMMlmt0frb1Pfdo0@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610091800.1833-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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

On Thu, Jun 10, 2021 at 11:17:57AM +0200, Christian König wrote:
> Add some rather sophisticated lockless garbage collection
> for dma_fence_chain objects.
> 
> For this keep all initialized dma_fence_chain nodes an a
> queue and trigger garbage collection before a new one is
> allocated.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Uh hand-rolled lockless list, I'm not a fan.

But the real question here is why? This is a global list, so it's going to
look great on your desktop, but gpus are for servers now and those are
NUMA. So just from that pov doing garbage-collection individually still
feels like a much better idea.

So what's the problem your trying to solve here?
-Daniel

> ---
>  drivers/dma-buf/dma-fence-chain.c | 160 +++++++++++++++++++++++++-----
>  include/linux/dma-fence-chain.h   |   5 +
>  2 files changed, 142 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..c2f0b69eabb7 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -9,8 +9,53 @@
>  
>  #include <linux/dma-fence-chain.h>
>  
> +static struct dma_fence_chain __rcu *fifo_front;
> +static struct dma_fence_chain __rcu **fifo_back = &fifo_front;
> +
>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>  
> +/**
> + * dma_fence_chain_enqueue - enqeue a chain node for garbage collection
> + * @chain: the chain node to enqueue
> + *
> + * Add the chain node to the end of the gc fifo.
> + */
> +static void dma_fence_chain_enqueue(struct dma_fence_chain *chain)
> +{
> +	struct dma_fence_chain __rcu **tmp;
> +
> +	RCU_INIT_POINTER(chain->next, NULL);
> +	tmp = xchg((struct dma_fence_chain __force ***)&fifo_back,
> +		   &chain->next);
> +
> +	/* This is intentionally unordered since we only need the fifo for gc */
> +	rcu_assign_pointer(*tmp, chain);
> +}
> +
> +/**
> + * dma_fence_chain_dequeue - deqeueue a chain node for garbage collection
> + *
> + * Remove the first chain node from the gc fifo while making sure that always
> + * keep at least one node on the fifo for lockless fifo implementation.
> + * Returns the dequeued chain node or NULL.
> + */
> +static struct dma_fence_chain *dma_fence_chain_dequeue(void)
> +{
> +	struct dma_fence_chain *chain, *tmp;
> +
> +	rcu_read_lock();
> +	chain = rcu_dereference(fifo_front);
> +	/* Never dequeue the last chain node for lockless fifo */
> +	if (unlikely(!chain || !rcu_access_pointer(chain->next))) {
> +		rcu_read_unlock();
> +		return NULL;
> +	}
> +	tmp = cmpxchg((struct dma_fence_chain __force **)&fifo_front,
> +		      chain, rcu_access_pointer(chain->next));
> +	rcu_read_unlock();
> +	return tmp == chain ? chain : NULL;
> +}
> +
>  /**
>   * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
>   * @chain: chain node to get the previous node from
> @@ -28,6 +73,43 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>  	return prev;
>  }
>  
> +/**
> + * dma_fence_chain_try_replace - try to replace the prev node
> + * @chain: Chain node we try to replace prev.
> + * @prev: the old prev node
> + *
> + * Try to replace the previous chain node when it or its containing fence is
> + * signaled. Returns true if we tried, false if we need to wait.
> + */
> +static bool dma_fence_chain_try_replace(struct dma_fence_chain *chain,
> +					struct dma_fence *prev)
> +{
> +	struct dma_fence *replacement, *tmp;
> +	struct dma_fence_chain *prev_chain;
> +
> +	prev_chain = to_dma_fence_chain(prev);
> +	if (prev_chain) {
> +		if (!dma_fence_is_signaled(prev_chain->fence))
> +			return false;
> +
> +		replacement = dma_fence_chain_get_prev(prev_chain);
> +	} else {
> +		if (!dma_fence_is_signaled(prev))
> +			return false;
> +
> +		replacement = NULL;
> +	}
> +
> +	tmp = cmpxchg((struct dma_fence __force **)&chain->prev, prev,
> +		      replacement);
> +	if (tmp == prev)
> +		dma_fence_put(tmp);
> +	else
> +		dma_fence_put(replacement);
> +
> +	return true;
> +}
> +
>  /**
>   * dma_fence_chain_walk - chain walking function
>   * @fence: current chain node
> @@ -38,8 +120,8 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>   */
>  struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>  {
> -	struct dma_fence_chain *chain, *prev_chain;
> -	struct dma_fence *prev, *replacement, *tmp;
> +	struct dma_fence_chain *chain;
> +	struct dma_fence *prev;
>  
>  	chain = to_dma_fence_chain(fence);
>  	if (!chain) {
> @@ -48,26 +130,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>  	}
>  
>  	while ((prev = dma_fence_chain_get_prev(chain))) {
> -
> -		prev_chain = to_dma_fence_chain(prev);
> -		if (prev_chain) {
> -			if (!dma_fence_is_signaled(prev_chain->fence))
> -				break;
> -
> -			replacement = dma_fence_chain_get_prev(prev_chain);
> -		} else {
> -			if (!dma_fence_is_signaled(prev))
> -				break;
> -
> -			replacement = NULL;
> -		}
> -
> -		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
> -			      prev, replacement);
> -		if (tmp == prev)
> -			dma_fence_put(tmp);
> -		else
> -			dma_fence_put(replacement);
> +		if (!dma_fence_chain_try_replace(chain, prev))
> +			break;
>  		dma_fence_put(prev);
>  	}
>  
> @@ -205,7 +269,21 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>  	dma_fence_put(prev);
>  
>  	dma_fence_put(chain->fence);
> -	dma_fence_free(fence);
> +	WRITE_ONCE(chain->fence, NULL);
> +
> +	/*
> +	 * Don't garbage collect here to avoid recursion and potential stack
> +	 * overflow.
> +	 */
> +	chain = dma_fence_chain_dequeue();
> +	if (!chain)
> +		return;
> +
> +	if (kref_read(&chain->base.refcount) ||
> +	    READ_ONCE(chain->fence))
> +		dma_fence_chain_enqueue(chain);
> +	else
> +		dma_fence_free(&chain->base);
>  }
>  
>  const struct dma_fence_ops dma_fence_chain_ops = {
> @@ -218,6 +296,40 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>  };
>  EXPORT_SYMBOL(dma_fence_chain_ops);
>  
> +/**
> + * dma_fence_chain_garbage_collect - cleanup chain nodes
> + *
> + * Do some garbage collection and try to release chain nodes.
> + */
> +void dma_fence_chain_garbage_collect(void)
> +{
> +	struct dma_fence_chain *chain = dma_fence_chain_dequeue();
> +
> +	if (!chain)
> +		return;
> +
> +	if (!dma_fence_get_rcu(&chain->base)) {
> +		/* Unused, check if it's also clean */
> +		if (likely(!READ_ONCE(chain->fence))) {
> +			dma_fence_free(&chain->base);
> +			return;
> +		}
> +
> +	} else {
> +		struct dma_fence *prev;
> +
> +		/* Used, do some chain walk */
> +		prev = dma_fence_chain_get_prev(chain);
> +		if (prev) {
> +			dma_fence_chain_try_replace(chain, prev);
> +			dma_fence_put(prev);
> +		}
> +		dma_fence_put(&chain->base);
> +	}
> +	dma_fence_chain_enqueue(chain);
> +}
> +EXPORT_SYMBOL(dma_fence_chain_garbage_collect);
> +
>  /**
>   * dma_fence_chain_init - initialize a fence chain
>   * @chain: the chain node to initialize
> @@ -254,5 +366,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  
>  	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>  		       &chain->lock, context, seqno);
> +	dma_fence_chain_enqueue(chain);
>  }
> +
>  EXPORT_SYMBOL(dma_fence_chain_init);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 5f45689a6d2e..b412b5396434 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -19,6 +19,7 @@
>   * @base: fence base class
>   * @lock: spinlock for fence handling
>   * @prev: previous fence of the chain
> + * @next: next chain node for garbage collection
>   * @prev_seqno: original previous seqno before garbage collection
>   * @fence: encapsulated fence
>   * @cb: callback structure for signaling
> @@ -27,6 +28,7 @@
>  struct dma_fence_chain {
>  	struct dma_fence base;
>  	struct dma_fence __rcu *prev;
> +	struct dma_fence_chain __rcu *next;
>  	u64 prev_seqno;
>  	struct dma_fence *fence;
>  	union {
> @@ -38,6 +40,8 @@ struct dma_fence_chain {
>  
>  extern const struct dma_fence_ops dma_fence_chain_ops;
>  
> +void dma_fence_chain_garbage_collect(void);
> +
>  /**
>   * to_dma_fence_chain - cast a fence to a dma_fence_chain
>   * @fence: fence to cast to a dma_fence_array
> @@ -61,6 +65,7 @@ to_dma_fence_chain(struct dma_fence *fence)
>   */
>  static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
>  {
> +	dma_fence_chain_garbage_collect();
>  	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>  };
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
