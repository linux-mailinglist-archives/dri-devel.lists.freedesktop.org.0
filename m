Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF93A44B3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCA16EEB1;
	Fri, 11 Jun 2021 15:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C986EEAF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:11:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m18so6465881wrv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XdyIzqizK6pAqCwRAfCRwynXNk5/rhNcT3ATuA902+M=;
 b=IGto4DjS05PVntPCgr6mFmgFfSPJ9Ce+0agGeqAwcr86bYtW7pR2g/R3jChYOjng5x
 vSgAUj57GMZQqrC74eDq5t1eOFeu3b+4FtlUcVcH+SHrnOGHzO4lfELq//QDZI85zYks
 A0so+6JTTpXMzumRSlLhlwGgOr0xU+6pBe9/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XdyIzqizK6pAqCwRAfCRwynXNk5/rhNcT3ATuA902+M=;
 b=Bz6r8XqFmbU+heLtHAyBdU062jSlp2vGEo10GwsleOYPOau5yPVn0jwdiIPd/E3b90
 QF9pU2hATNXU5s4cE+drNjQtKR+gnCJuTQFwKmFvnccE7wF6R2ZEj9HmRqo4nIql5CQo
 XIHPlVvP1NbO04t5idcG9GFLY7WrgwQNFHnxnBq/HPxCXqgiyamC7tuxKJmJV4BtJ6rE
 6VuyWXEt2BJ5YekYXltr0MPoV0ToLftp9eBf9pI/geAdnMqqNoSOwGtX4tLIGhZODm+h
 TvBThwtLCZ/ILDtkkBoaVpFX0a2m0vkoRGsYVdz2tPHq4yPZf6iqwDXJuoovG/FLxOwY
 aKtQ==
X-Gm-Message-State: AOAM533sDmG7ZyqH/xw2brPyHnAuS7/LxZN2mqorUVSvmVvYtIA43euW
 uvR8sSSAVJ0ZWQozPpu/YSFS4Q==
X-Google-Smtp-Source: ABdhPJxOTbY8he4VgN61JfDiNoLkaLyKVaunrIlyVc6lp1gDPWDPyNHpD/ZQGpYtFUdcURhQfJL0mw==
X-Received: by 2002:adf:ed03:: with SMTP id a3mr4731961wro.166.1623424315698; 
 Fri, 11 Jun 2021 08:11:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 4sm6849586wry.74.2021.06.11.08.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:11:55 -0700 (PDT)
Date: Fri, 11 Jun 2021 17:11:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: add dma_fence_chain_garbage_collect
Message-ID: <YMN9ORJ2xrZKATHu@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-5-christian.koenig@amd.com>
 <YMMlmt0frb1Pfdo0@phenom.ffwll.local>
 <e844dace-832c-3a0a-8ca2-d3aeb5cfde19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e844dace-832c-3a0a-8ca2-d3aeb5cfde19@gmail.com>
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

On Fri, Jun 11, 2021 at 12:07:00PM +0200, Christian König wrote:
> Am 11.06.21 um 10:58 schrieb Daniel Vetter:
> > On Thu, Jun 10, 2021 at 11:17:57AM +0200, Christian König wrote:
> > > Add some rather sophisticated lockless garbage collection
> > > for dma_fence_chain objects.
> > > 
> > > For this keep all initialized dma_fence_chain nodes an a
> > > queue and trigger garbage collection before a new one is
> > > allocated.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Uh hand-rolled lockless list, I'm not a fan.
> > 
> > But the real question here is why? This is a global list, so it's going to
> > look great on your desktop, but gpus are for servers now and those are
> > NUMA. So just from that pov doing garbage-collection individually still
> > feels like a much better idea.
> 
> Yeah, I was pondering on that quite a bit as well. That why I added the
> multi threaded alloc/free test.
> 
> > So what's the problem your trying to solve here?
> 
> I was not sure if the chain is garbage collected enough when used for the
> dma_resv exclusive object.
> 
> But I think we could just drop this for now and just see how it goes.

Yeah I think fixing a perf/tuning problem when we're hitting it is much
better than trying to guess what it might be and writing something really
clever to anticipate that. We generally get it wrong.

Also with the explaination of what it tests added the testcase makes
sense. Just some documentation or comment would have helped.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/dma-buf/dma-fence-chain.c | 160 +++++++++++++++++++++++++-----
> > >   include/linux/dma-fence-chain.h   |   5 +
> > >   2 files changed, 142 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> > > index 1b4cb3e5cec9..c2f0b69eabb7 100644
> > > --- a/drivers/dma-buf/dma-fence-chain.c
> > > +++ b/drivers/dma-buf/dma-fence-chain.c
> > > @@ -9,8 +9,53 @@
> > >   #include <linux/dma-fence-chain.h>
> > > +static struct dma_fence_chain __rcu *fifo_front;
> > > +static struct dma_fence_chain __rcu **fifo_back = &fifo_front;
> > > +
> > >   static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
> > > +/**
> > > + * dma_fence_chain_enqueue - enqeue a chain node for garbage collection
> > > + * @chain: the chain node to enqueue
> > > + *
> > > + * Add the chain node to the end of the gc fifo.
> > > + */
> > > +static void dma_fence_chain_enqueue(struct dma_fence_chain *chain)
> > > +{
> > > +	struct dma_fence_chain __rcu **tmp;
> > > +
> > > +	RCU_INIT_POINTER(chain->next, NULL);
> > > +	tmp = xchg((struct dma_fence_chain __force ***)&fifo_back,
> > > +		   &chain->next);
> > > +
> > > +	/* This is intentionally unordered since we only need the fifo for gc */
> > > +	rcu_assign_pointer(*tmp, chain);
> > > +}
> > > +
> > > +/**
> > > + * dma_fence_chain_dequeue - deqeueue a chain node for garbage collection
> > > + *
> > > + * Remove the first chain node from the gc fifo while making sure that always
> > > + * keep at least one node on the fifo for lockless fifo implementation.
> > > + * Returns the dequeued chain node or NULL.
> > > + */
> > > +static struct dma_fence_chain *dma_fence_chain_dequeue(void)
> > > +{
> > > +	struct dma_fence_chain *chain, *tmp;
> > > +
> > > +	rcu_read_lock();
> > > +	chain = rcu_dereference(fifo_front);
> > > +	/* Never dequeue the last chain node for lockless fifo */
> > > +	if (unlikely(!chain || !rcu_access_pointer(chain->next))) {
> > > +		rcu_read_unlock();
> > > +		return NULL;
> > > +	}
> > > +	tmp = cmpxchg((struct dma_fence_chain __force **)&fifo_front,
> > > +		      chain, rcu_access_pointer(chain->next));
> > > +	rcu_read_unlock();
> > > +	return tmp == chain ? chain : NULL;
> > > +}
> > > +
> > >   /**
> > >    * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
> > >    * @chain: chain node to get the previous node from
> > > @@ -28,6 +73,43 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
> > >   	return prev;
> > >   }
> > > +/**
> > > + * dma_fence_chain_try_replace - try to replace the prev node
> > > + * @chain: Chain node we try to replace prev.
> > > + * @prev: the old prev node
> > > + *
> > > + * Try to replace the previous chain node when it or its containing fence is
> > > + * signaled. Returns true if we tried, false if we need to wait.
> > > + */
> > > +static bool dma_fence_chain_try_replace(struct dma_fence_chain *chain,
> > > +					struct dma_fence *prev)
> > > +{
> > > +	struct dma_fence *replacement, *tmp;
> > > +	struct dma_fence_chain *prev_chain;
> > > +
> > > +	prev_chain = to_dma_fence_chain(prev);
> > > +	if (prev_chain) {
> > > +		if (!dma_fence_is_signaled(prev_chain->fence))
> > > +			return false;
> > > +
> > > +		replacement = dma_fence_chain_get_prev(prev_chain);
> > > +	} else {
> > > +		if (!dma_fence_is_signaled(prev))
> > > +			return false;
> > > +
> > > +		replacement = NULL;
> > > +	}
> > > +
> > > +	tmp = cmpxchg((struct dma_fence __force **)&chain->prev, prev,
> > > +		      replacement);
> > > +	if (tmp == prev)
> > > +		dma_fence_put(tmp);
> > > +	else
> > > +		dma_fence_put(replacement);
> > > +
> > > +	return true;
> > > +}
> > > +
> > >   /**
> > >    * dma_fence_chain_walk - chain walking function
> > >    * @fence: current chain node
> > > @@ -38,8 +120,8 @@ static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
> > >    */
> > >   struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
> > >   {
> > > -	struct dma_fence_chain *chain, *prev_chain;
> > > -	struct dma_fence *prev, *replacement, *tmp;
> > > +	struct dma_fence_chain *chain;
> > > +	struct dma_fence *prev;
> > >   	chain = to_dma_fence_chain(fence);
> > >   	if (!chain) {
> > > @@ -48,26 +130,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
> > >   	}
> > >   	while ((prev = dma_fence_chain_get_prev(chain))) {
> > > -
> > > -		prev_chain = to_dma_fence_chain(prev);
> > > -		if (prev_chain) {
> > > -			if (!dma_fence_is_signaled(prev_chain->fence))
> > > -				break;
> > > -
> > > -			replacement = dma_fence_chain_get_prev(prev_chain);
> > > -		} else {
> > > -			if (!dma_fence_is_signaled(prev))
> > > -				break;
> > > -
> > > -			replacement = NULL;
> > > -		}
> > > -
> > > -		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
> > > -			      prev, replacement);
> > > -		if (tmp == prev)
> > > -			dma_fence_put(tmp);
> > > -		else
> > > -			dma_fence_put(replacement);
> > > +		if (!dma_fence_chain_try_replace(chain, prev))
> > > +			break;
> > >   		dma_fence_put(prev);
> > >   	}
> > > @@ -205,7 +269,21 @@ static void dma_fence_chain_release(struct dma_fence *fence)
> > >   	dma_fence_put(prev);
> > >   	dma_fence_put(chain->fence);
> > > -	dma_fence_free(fence);
> > > +	WRITE_ONCE(chain->fence, NULL);
> > > +
> > > +	/*
> > > +	 * Don't garbage collect here to avoid recursion and potential stack
> > > +	 * overflow.
> > > +	 */
> > > +	chain = dma_fence_chain_dequeue();
> > > +	if (!chain)
> > > +		return;
> > > +
> > > +	if (kref_read(&chain->base.refcount) ||
> > > +	    READ_ONCE(chain->fence))
> > > +		dma_fence_chain_enqueue(chain);
> > > +	else
> > > +		dma_fence_free(&chain->base);
> > >   }
> > >   const struct dma_fence_ops dma_fence_chain_ops = {
> > > @@ -218,6 +296,40 @@ const struct dma_fence_ops dma_fence_chain_ops = {
> > >   };
> > >   EXPORT_SYMBOL(dma_fence_chain_ops);
> > > +/**
> > > + * dma_fence_chain_garbage_collect - cleanup chain nodes
> > > + *
> > > + * Do some garbage collection and try to release chain nodes.
> > > + */
> > > +void dma_fence_chain_garbage_collect(void)
> > > +{
> > > +	struct dma_fence_chain *chain = dma_fence_chain_dequeue();
> > > +
> > > +	if (!chain)
> > > +		return;
> > > +
> > > +	if (!dma_fence_get_rcu(&chain->base)) {
> > > +		/* Unused, check if it's also clean */
> > > +		if (likely(!READ_ONCE(chain->fence))) {
> > > +			dma_fence_free(&chain->base);
> > > +			return;
> > > +		}
> > > +
> > > +	} else {
> > > +		struct dma_fence *prev;
> > > +
> > > +		/* Used, do some chain walk */
> > > +		prev = dma_fence_chain_get_prev(chain);
> > > +		if (prev) {
> > > +			dma_fence_chain_try_replace(chain, prev);
> > > +			dma_fence_put(prev);
> > > +		}
> > > +		dma_fence_put(&chain->base);
> > > +	}
> > > +	dma_fence_chain_enqueue(chain);
> > > +}
> > > +EXPORT_SYMBOL(dma_fence_chain_garbage_collect);
> > > +
> > >   /**
> > >    * dma_fence_chain_init - initialize a fence chain
> > >    * @chain: the chain node to initialize
> > > @@ -254,5 +366,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
> > >   	dma_fence_init(&chain->base, &dma_fence_chain_ops,
> > >   		       &chain->lock, context, seqno);
> > > +	dma_fence_chain_enqueue(chain);
> > >   }
> > > +
> > >   EXPORT_SYMBOL(dma_fence_chain_init);
> > > diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> > > index 5f45689a6d2e..b412b5396434 100644
> > > --- a/include/linux/dma-fence-chain.h
> > > +++ b/include/linux/dma-fence-chain.h
> > > @@ -19,6 +19,7 @@
> > >    * @base: fence base class
> > >    * @lock: spinlock for fence handling
> > >    * @prev: previous fence of the chain
> > > + * @next: next chain node for garbage collection
> > >    * @prev_seqno: original previous seqno before garbage collection
> > >    * @fence: encapsulated fence
> > >    * @cb: callback structure for signaling
> > > @@ -27,6 +28,7 @@
> > >   struct dma_fence_chain {
> > >   	struct dma_fence base;
> > >   	struct dma_fence __rcu *prev;
> > > +	struct dma_fence_chain __rcu *next;
> > >   	u64 prev_seqno;
> > >   	struct dma_fence *fence;
> > >   	union {
> > > @@ -38,6 +40,8 @@ struct dma_fence_chain {
> > >   extern const struct dma_fence_ops dma_fence_chain_ops;
> > > +void dma_fence_chain_garbage_collect(void);
> > > +
> > >   /**
> > >    * to_dma_fence_chain - cast a fence to a dma_fence_chain
> > >    * @fence: fence to cast to a dma_fence_array
> > > @@ -61,6 +65,7 @@ to_dma_fence_chain(struct dma_fence *fence)
> > >    */
> > >   static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
> > >   {
> > > +	dma_fence_chain_garbage_collect();
> > >   	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> > >   };
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
