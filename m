Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB53F03C1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF1A6E588;
	Wed, 18 Aug 2021 12:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4F6E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:32:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k29so3256996wrd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=E8qM5Pi/IUwDLHD0a01bmhWdnq1LJTiLPPCBprjcvOI=;
 b=HZQPKpibBPocdRBp5IYLtwu5C17EE9wqh6+7klaGMuRBV52IeUdGL4OatMu52+kR2D
 l/IMdB4Sb5viVOycYEaGaegFt0OMfynnCDud83lg6aFDyT5MNIQR4wvCc3+/5IxDC4Yz
 v4tftVKN1oQ+cSN9QKMAWwME3MJcpwcHk9/Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E8qM5Pi/IUwDLHD0a01bmhWdnq1LJTiLPPCBprjcvOI=;
 b=pKKZ2kFL4jrOXVWw0hwe5CPG7aLWrc2zCagBsikEI1055Cdwu43ifc/WBOqr3RRhUt
 ejv+fNpq/ydut3GgPhpgSxG2GNlll2OFt/k/Uukk4jq5Z+JQnwz1xM7cpc3ldOW1j6qg
 IhtYkIZKypmHl4RSu/ixnt63vXWEc+cvpGCWGYKXz5QvV2ATng16bmXowq2Rm/v/V3WO
 dj5Ig6+O8AP0vgIM61KYtDsjbSCplkzqQJSS3UUYUuBL3hn2GBslsoLcieLB6cz7+94+
 twDIchTa3K/4YZht9qWv5P8GG/ee4/tvmLb+8bJohZhCiQdlNylA0knEr3s3kesXHM3g
 WlQg==
X-Gm-Message-State: AOAM532q2Lg3wiP9sqFOLVb+lughPWJt9qvE/UpjwPTAD+8APuIZl7So
 SfxhPlBP7CpYxZMcaOUZFddFIA==
X-Google-Smtp-Source: ABdhPJz3Mb4VkcvoqXR0tBxdR/vvYKCBeP5tlAnVHNA3Aw2O9UcML+rzoqwKiL1WMmYLzjJUuJtZGw==
X-Received: by 2002:a05:6000:1a42:: with SMTP id
 t2mr10389497wry.61.1629289973116; 
 Wed, 18 Aug 2021 05:32:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e6sm5880112wrx.87.2021.08.18.05.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:32:52 -0700 (PDT)
Date: Wed, 18 Aug 2021 14:32:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit v3
Message-ID: <YRz98uGS7R1AeE+e@phenom.ffwll.local>
References: <20210722113453.2314-1-christian.koenig@amd.com>
 <ae7405c6-2d91-e7e4-0a0a-7de6f4b330a0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae7405c6-2d91-e7e4-0a0a-7de6f4b330a0@gmail.com>
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

On Wed, Aug 18, 2021 at 01:27:13PM +0200, Christian König wrote:
> Just a gentle ping?
> 
> Does anybody have any objections? It's just switching back to using a
> spinlock in the hot path instead of a mutex.
> 
> Thanks,
> Christian.
> 
> Am 22.07.21 um 13:34 schrieb Christian König:
> > Switch back to using a spinlock again by moving the IOMMU unmap outside
> > of the locked region.
> > 
> > v2: Add a comment explaining why we need sync_shrinkers().
> > v3: Drop sync_shrinkers() and use an SRCU instead.

Why did you move to your own hand-rolled thing here? From the old thread
it just looked like Andrew wanted some proper explanation. And the
sychronize_shrinkers is imo much clearer than some hand-rolled srcu thing.

Also on the spinlock covnersion, do you have some benchmarks/profile
flamegraphs/numbers that show it matters? Would be realy good to record
that kind of stuff in the commit message instead of just having the
implication that this optimizes stuff.
-Daniel

> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_pool.c | 45 ++++++++++++++++++++--------------
> >   1 file changed, 27 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > index cb38b1a17b09..cee664c487b5 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -70,7 +70,8 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
> >   static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> >   static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > -static struct mutex shrinker_lock;
> > +static spinlock_t shrinker_lock;
> > +DEFINE_STATIC_SRCU(shrinker_srcu);
> >   static struct list_head shrinker_list;
> >   static struct shrinker mm_shrinker;
> > @@ -263,9 +264,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
> >   	spin_lock_init(&pt->lock);
> >   	INIT_LIST_HEAD(&pt->pages);
> > -	mutex_lock(&shrinker_lock);
> > +	spin_lock(&shrinker_lock);
> >   	list_add_tail(&pt->shrinker_list, &shrinker_list);
> > -	mutex_unlock(&shrinker_lock);
> > +	spin_unlock(&shrinker_lock);
> >   }
> >   /* Remove a pool_type from the global shrinker list and free all pages */
> > @@ -273,9 +274,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
> >   {
> >   	struct page *p;
> > -	mutex_lock(&shrinker_lock);
> > +	spin_lock(&shrinker_lock);
> >   	list_del(&pt->shrinker_list);
> > -	mutex_unlock(&shrinker_lock);
> > +	spin_unlock(&shrinker_lock);
> >   	while ((p = ttm_pool_type_take(pt)))
> >   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > @@ -313,24 +314,27 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
> >   static unsigned int ttm_pool_shrink(void)
> >   {
> >   	struct ttm_pool_type *pt;
> > -	unsigned int num_freed;
> > +	unsigned int num_pages;
> >   	struct page *p;
> > +	int idx;
> > -	mutex_lock(&shrinker_lock);
> > +	idx = srcu_read_lock(&shrinker_srcu);
> > +
> > +	spin_lock(&shrinker_lock);
> >   	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> > +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > +	spin_unlock(&shrinker_lock);
> >   	p = ttm_pool_type_take(pt);
> >   	if (p) {
> >   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > -		num_freed = 1 << pt->order;
> > +		num_pages = 1 << pt->order;
> >   	} else {
> > -		num_freed = 0;
> > +		num_pages = 0;
> >   	}
> > -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > -	mutex_unlock(&shrinker_lock);
> > -
> > -	return num_freed;
> > +	srcu_read_unlock(&shrinker_srcu, idx);
> > +	return num_pages;
> >   }
> >   /* Return the allocation order based for a page */
> > @@ -530,6 +534,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
> >   			for (j = 0; j < MAX_ORDER; ++j)
> >   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> >   	}
> > +
> > +	/* We removed the pool types from the LRU, but we need to also make sure
> > +	 * that no shrinker is concurrently freeing pages from the pool.
> > +	 */
> > +	synchronize_srcu(&shrinker_srcu);
> >   }
> >   /* As long as pages are available make sure to release at least one */
> > @@ -604,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
> >   {
> >   	ttm_pool_debugfs_header(m);
> > -	mutex_lock(&shrinker_lock);
> > +	spin_lock(&shrinker_lock);
> >   	seq_puts(m, "wc\t:");
> >   	ttm_pool_debugfs_orders(global_write_combined, m);
> >   	seq_puts(m, "uc\t:");
> > @@ -613,7 +622,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
> >   	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> >   	seq_puts(m, "uc 32\t:");
> >   	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> > -	mutex_unlock(&shrinker_lock);
> > +	spin_unlock(&shrinker_lock);
> >   	ttm_pool_debugfs_footer(m);
> > @@ -640,7 +649,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
> >   	ttm_pool_debugfs_header(m);
> > -	mutex_lock(&shrinker_lock);
> > +	spin_lock(&shrinker_lock);
> >   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> >   		seq_puts(m, "DMA ");
> >   		switch (i) {
> > @@ -656,7 +665,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
> >   		}
> >   		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
> >   	}
> > -	mutex_unlock(&shrinker_lock);
> > +	spin_unlock(&shrinker_lock);
> >   	ttm_pool_debugfs_footer(m);
> >   	return 0;
> > @@ -693,7 +702,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> >   	if (!page_pool_size)
> >   		page_pool_size = num_pages;
> > -	mutex_init(&shrinker_lock);
> > +	spin_lock_init(&shrinker_lock);
> >   	INIT_LIST_HEAD(&shrinker_list);
> >   	for (i = 0; i < MAX_ORDER; ++i) {
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
