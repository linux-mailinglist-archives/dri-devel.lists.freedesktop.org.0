Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC13F06DD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8580D6E808;
	Wed, 18 Aug 2021 14:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCC36E808
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:38:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r7so3996401wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gegwNUm8NYo/FXRsVilUojIAs0FePP7OAPmD4YfZhV0=;
 b=OliFTkYP42C/f+ApGDEqK0zM2sD2kSLqtEmpGUTlKS+byFt8/n65gDG7m58fi6o9Zu
 ylJSGtGpExq+X69TqDK6SANqiQ9V8JyEZXes+GZ9dy7vxZw53mSlsodMAU66CzR+1f/C
 m6JiiH4Se4FpI1FD3qlbqbcb6HU5Kfy5LuCEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gegwNUm8NYo/FXRsVilUojIAs0FePP7OAPmD4YfZhV0=;
 b=gsUTZU5ZaNuNl5A3vxx2wO3rIEPpFrTxVUWdthCiWUejdexZp/+RqW4DMd/hxe0y9R
 X8ijI0iYKPZrAnXFGp3yhgIRi8UHmkttFb+eBdqQuX8wzmurd6lZ0DHHMSi2HyYyCJsd
 xvpzH4O3vinmuBRkGiKOlLFHnFgL4Argyiqne5G2kiXtonj76pAHawWmEPggh86/tnIf
 k6uKz7f6yhS6d712Yw0Tmr0BHBp3igWNVXIiT0I7/iLgMUm1n67c8fGsxbIVJaz79upq
 yTyqiXuedUmVKZq3gMf9Tje6nukKL7eQga1WrJ2zWLeW7fcbdaHInCuBcDs58FrZ3RvA
 Dl/Q==
X-Gm-Message-State: AOAM5307pWJi5fd95zSgNF/hmdXxbalYE+6mCmQBvwBfhdDdjHYm1fmU
 cYGWxTlXbPazNubjEJ9ngz3qv2ofkDJdQA==
X-Google-Smtp-Source: ABdhPJxCaAMN1UNaNjAoKPY6xq6sO0wVKPXGtpU9g1vpGRuxPPALNznq46oWUtn8fFOtxZUbTIdkTA==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr11501679wro.14.1629297524833; 
 Wed, 18 Aug 2021 07:38:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm9875wru.1.2021.08.18.07.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:38:44 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:38:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit v3
Message-ID: <YR0bcpLlS4OjQnm+@phenom.ffwll.local>
References: <20210722113453.2314-1-christian.koenig@amd.com>
 <ae7405c6-2d91-e7e4-0a0a-7de6f4b330a0@gmail.com>
 <YRz98uGS7R1AeE+e@phenom.ffwll.local>
 <86b3314e-8dc3-cc6c-f59a-e970859e7716@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86b3314e-8dc3-cc6c-f59a-e970859e7716@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Aug 18, 2021 at 03:09:41PM +0200, Christian König wrote:
> Am 18.08.21 um 14:32 schrieb Daniel Vetter:
> > On Wed, Aug 18, 2021 at 01:27:13PM +0200, Christian König wrote:
> > > Just a gentle ping?
> > > 
> > > Does anybody have any objections? It's just switching back to using a
> > > spinlock in the hot path instead of a mutex.
> > > 
> > > Thanks,
> > > Christian.
> > > 
> > > Am 22.07.21 um 13:34 schrieb Christian König:
> > > > Switch back to using a spinlock again by moving the IOMMU unmap outside
> > > > of the locked region.
> > > > 
> > > > v2: Add a comment explaining why we need sync_shrinkers().
> > > > v3: Drop sync_shrinkers() and use an SRCU instead.
> > Why did you move to your own hand-rolled thing here? From the old thread
> > it just looked like Andrew wanted some proper explanation. And the
> > sychronize_shrinkers is imo much clearer than some hand-rolled srcu thing.
> 
> Well I agree that it is minimal cleaner, but I've pinged Andrew a couple of
> times and he seems to be busy.

Imo if you paste your explainer from that thread into the commit message
that's good enough. Ofc the vmscan patch still needs an ack from Andrew,
but that shouldn't be too hard to get.

Essentially what we're doing is register/unregistering parts of our
shrinker here, instead of doing a full register/unregister and having a
shrinker for each part.

> > Also on the spinlock covnersion, do you have some benchmarks/profile
> > flamegraphs/numbers that show it matters? Would be realy good to record
> > that kind of stuff in the commit message instead of just having the
> > implication that this optimizes stuff.
> 
> The spinlock conversion doesn't matter that much, but what makes the
> difference is that we don't do all IOMMU mapping/unmapping under a single
> mutex any more.
> 
> I've promised to take another look at it when we fixed that and somebody
> from an internal team complained about this as well.
> 
> Not sure if that really helps or if we then have the next bottleneck in the
> IOMMU code, but it is at least a start.

Yeah it'd be really good to record something so we know in the future. We
= very much including non-amd people, because perf tuning where the
reasons are only available if you work for the right company aint good.

Also this is from my experience digging back into i915-gem, where enormous
amounts of tuning was done, but reasons almost never recorded, much less
perf numbers. It's a disaster.

On v2, with the explanation added (for both sync_shrinkers and why the
conversion here actually matters) and perf number/benchmarks included in
the commit message:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (both patches)

One-liner commit message for tuning aint good enough by far :-)
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > ---
> > > >    drivers/gpu/drm/ttm/ttm_pool.c | 45 ++++++++++++++++++++--------------
> > > >    1 file changed, 27 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > index cb38b1a17b09..cee664c487b5 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > @@ -70,7 +70,8 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
> > > >    static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> > > >    static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > > > -static struct mutex shrinker_lock;
> > > > +static spinlock_t shrinker_lock;
> > > > +DEFINE_STATIC_SRCU(shrinker_srcu);
> > > >    static struct list_head shrinker_list;
> > > >    static struct shrinker mm_shrinker;
> > > > @@ -263,9 +264,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
> > > >    	spin_lock_init(&pt->lock);
> > > >    	INIT_LIST_HEAD(&pt->pages);
> > > > -	mutex_lock(&shrinker_lock);
> > > > +	spin_lock(&shrinker_lock);
> > > >    	list_add_tail(&pt->shrinker_list, &shrinker_list);
> > > > -	mutex_unlock(&shrinker_lock);
> > > > +	spin_unlock(&shrinker_lock);
> > > >    }
> > > >    /* Remove a pool_type from the global shrinker list and free all pages */
> > > > @@ -273,9 +274,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
> > > >    {
> > > >    	struct page *p;
> > > > -	mutex_lock(&shrinker_lock);
> > > > +	spin_lock(&shrinker_lock);
> > > >    	list_del(&pt->shrinker_list);
> > > > -	mutex_unlock(&shrinker_lock);
> > > > +	spin_unlock(&shrinker_lock);
> > > >    	while ((p = ttm_pool_type_take(pt)))
> > > >    		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > > > @@ -313,24 +314,27 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
> > > >    static unsigned int ttm_pool_shrink(void)
> > > >    {
> > > >    	struct ttm_pool_type *pt;
> > > > -	unsigned int num_freed;
> > > > +	unsigned int num_pages;
> > > >    	struct page *p;
> > > > +	int idx;
> > > > -	mutex_lock(&shrinker_lock);
> > > > +	idx = srcu_read_lock(&shrinker_srcu);
> > > > +
> > > > +	spin_lock(&shrinker_lock);
> > > >    	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> > > > +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > > > +	spin_unlock(&shrinker_lock);
> > > >    	p = ttm_pool_type_take(pt);
> > > >    	if (p) {
> > > >    		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > > > -		num_freed = 1 << pt->order;
> > > > +		num_pages = 1 << pt->order;
> > > >    	} else {
> > > > -		num_freed = 0;
> > > > +		num_pages = 0;
> > > >    	}
> > > > -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > > > -	mutex_unlock(&shrinker_lock);
> > > > -
> > > > -	return num_freed;
> > > > +	srcu_read_unlock(&shrinker_srcu, idx);
> > > > +	return num_pages;
> > > >    }
> > > >    /* Return the allocation order based for a page */
> > > > @@ -530,6 +534,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > > >    			for (j = 0; j < MAX_ORDER; ++j)
> > > >    				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > > >    	}
> > > > +
> > > > +	/* We removed the pool types from the LRU, but we need to also make sure
> > > > +	 * that no shrinker is concurrently freeing pages from the pool.
> > > > +	 */
> > > > +	synchronize_srcu(&shrinker_srcu);
> > > >    }
> > > >    /* As long as pages are available make sure to release at least one */
> > > > @@ -604,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
> > > >    {
> > > >    	ttm_pool_debugfs_header(m);
> > > > -	mutex_lock(&shrinker_lock);
> > > > +	spin_lock(&shrinker_lock);
> > > >    	seq_puts(m, "wc\t:");
> > > >    	ttm_pool_debugfs_orders(global_write_combined, m);
> > > >    	seq_puts(m, "uc\t:");
> > > > @@ -613,7 +622,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
> > > >    	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> > > >    	seq_puts(m, "uc 32\t:");
> > > >    	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> > > > -	mutex_unlock(&shrinker_lock);
> > > > +	spin_unlock(&shrinker_lock);
> > > >    	ttm_pool_debugfs_footer(m);
> > > > @@ -640,7 +649,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
> > > >    	ttm_pool_debugfs_header(m);
> > > > -	mutex_lock(&shrinker_lock);
> > > > +	spin_lock(&shrinker_lock);
> > > >    	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> > > >    		seq_puts(m, "DMA ");
> > > >    		switch (i) {
> > > > @@ -656,7 +665,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
> > > >    		}
> > > >    		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
> > > >    	}
> > > > -	mutex_unlock(&shrinker_lock);
> > > > +	spin_unlock(&shrinker_lock);
> > > >    	ttm_pool_debugfs_footer(m);
> > > >    	return 0;
> > > > @@ -693,7 +702,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> > > >    	if (!page_pool_size)
> > > >    		page_pool_size = num_pages;
> > > > -	mutex_init(&shrinker_lock);
> > > > +	spin_lock_init(&shrinker_lock);
> > > >    	INIT_LIST_HEAD(&shrinker_list);
> > > >    	for (i = 0; i < MAX_ORDER; ++i) {
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
