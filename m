Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC13581D9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51A16EAA4;
	Thu,  8 Apr 2021 11:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108FA6EAA6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:31:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so1056023wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p2LG95rmuOVD3gxnEGZOgmAC4ze9gdtMKggG6BoWiug=;
 b=jZSMqOuvJqPb3uC2Til6oGb8MKZnGA1zkAt1gjdVwwM3U0sGlUE6iM8VWI3TVLvRB3
 pFKFUULRcKOYwAIjVStg2tbr4uh0mkljerws9PtGXJNUtrUtmuuS5bqqm7rKJ0NoBRt6
 EZLbkW4m6lHrF1JQaVAls43CKsWHasyK5NJ2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p2LG95rmuOVD3gxnEGZOgmAC4ze9gdtMKggG6BoWiug=;
 b=MAYuNfWfXEwqfpZrQyEjMCEizM9XGL4cJA9SBAz40SO9jj1Z+1rhrixQLRauuDN3JW
 wSPZl1yk9Z+A3uuqGcXdablQEVm94fyzUHwpYHsJaioKFAOJEwnshhigpCOE4LQj7LZI
 0GgOXpboloDf5Bstfi8IdwUd/+/tveBLUUn1jlqKGFqg3W2w+iHiuolOp5GhVFZcDK2e
 GVWo0zp7gWYge/CRaCkRrm7C6b0YrrsieOkfXPs/tDORXnQNN5ZDvVcrd7CG/l0SSsBX
 e6RKdCcUlrHwJDFhgvvH80B7q9f5Kdxti9yZRxGuF6LeRO2gCbx/twJQFCjQwCPEmEct
 msxQ==
X-Gm-Message-State: AOAM530Rl7WpAHMCTLRrmcKCzaM16TpTU2awHSgZPGrV44tWCjqeBp/M
 wZIWfIsLzvPSEOUmpS3ehbLioA==
X-Google-Smtp-Source: ABdhPJy2UXPMH8jLjhU0OHaW051PECGA5lK5Js0Gp2nyAJ3nKj4dNF9rUbcwiEGbvG6wBr1S4aTYpw==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr6119311wmf.112.1617881516754; 
 Thu, 08 Apr 2021 04:31:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm38362098wrh.88.2021.04.08.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:31:56 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:31:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit
Message-ID: <YG7pqs50QXkLQUz3@phenom.ffwll.local>
References: <20210401135413.1416-1-christian.koenig@amd.com>
 <YG7kNLwYbDPkyGKx@phenom.ffwll.local>
 <8f38a064-8afa-492d-251f-4ff715d9f9bf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f38a064-8afa-492d-251f-4ff715d9f9bf@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:17:32PM +0200, Christian K=F6nig wrote:
> Am 08.04.21 um 13:08 schrieb Daniel Vetter:
> > On Thu, Apr 01, 2021 at 03:54:13PM +0200, Christian K=F6nig wrote:
> > > Switch back to using a spinlock again by moving the IOMMU unmap outsi=
de
> > > of the locked region.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_pool.c | 40 +++++++++++++++----------------=
---
> > >   include/linux/shrinker.h       |  1 +
> > >   mm/vmscan.c                    | 10 +++++++++
> > >   3 files changed, 29 insertions(+), 22 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm=
_pool.c
> > > index cb38b1a17b09..a8b4abe687ce 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -70,7 +70,7 @@ static struct ttm_pool_type global_uncached[MAX_ORD=
ER];
> > >   static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> > >   static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > > -static struct mutex shrinker_lock;
> > > +static spinlock_t shrinker_lock;
> > >   static struct list_head shrinker_list;
> > >   static struct shrinker mm_shrinker;
> > > @@ -263,9 +263,9 @@ static void ttm_pool_type_init(struct ttm_pool_ty=
pe *pt, struct ttm_pool *pool,
> > >   	spin_lock_init(&pt->lock);
> > >   	INIT_LIST_HEAD(&pt->pages);
> > > -	mutex_lock(&shrinker_lock);
> > > +	spin_lock(&shrinker_lock);
> > >   	list_add_tail(&pt->shrinker_list, &shrinker_list);
> > > -	mutex_unlock(&shrinker_lock);
> > > +	spin_unlock(&shrinker_lock);
> > >   }
> > >   /* Remove a pool_type from the global shrinker list and free all pa=
ges */
> > > @@ -273,9 +273,9 @@ static void ttm_pool_type_fini(struct ttm_pool_ty=
pe *pt)
> > >   {
> > >   	struct page *p;
> > > -	mutex_lock(&shrinker_lock);
> > > +	spin_lock(&shrinker_lock);
> > >   	list_del(&pt->shrinker_list);
> > > -	mutex_unlock(&shrinker_lock);
> > > +	spin_unlock(&shrinker_lock);
> > >   	while ((p =3D ttm_pool_type_take(pt)))
> > >   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > > @@ -313,24 +313,19 @@ static struct ttm_pool_type *ttm_pool_select_ty=
pe(struct ttm_pool *pool,
> > >   static unsigned int ttm_pool_shrink(void)
> > >   {
> > >   	struct ttm_pool_type *pt;
> > > -	unsigned int num_freed;
> > >   	struct page *p;
> > > -	mutex_lock(&shrinker_lock);
> > > +	spin_lock(&shrinker_lock);
> > >   	pt =3D list_first_entry(&shrinker_list, typeof(*pt), shrinker_list=
);
> > > +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > > +	spin_unlock(&shrinker_lock);
> > >   	p =3D ttm_pool_type_take(pt);
> > > -	if (p) {
> > > -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > > -		num_freed =3D 1 << pt->order;
> > > -	} else {
> > > -		num_freed =3D 0;
> > > -	}
> > > -
> > > -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > > -	mutex_unlock(&shrinker_lock);
> > > +	if (!p)
> > > +		return 0;
> > > -	return num_freed;
> > > +	ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > > +	return 1 << pt->order;
> > >   }
> > >   /* Return the allocation order based for a page */
> > > @@ -530,6 +525,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > >   			for (j =3D 0; j < MAX_ORDER; ++j)
> > >   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > >   	}
> > > +	sync_shrinkers();
> > >   }
> > >   /* As long as pages are available make sure to release at least one=
 */
> > > @@ -604,7 +600,7 @@ static int ttm_pool_debugfs_globals_show(struct s=
eq_file *m, void *data)
> > >   {
> > >   	ttm_pool_debugfs_header(m);
> > > -	mutex_lock(&shrinker_lock);
> > > +	spin_lock(&shrinker_lock);
> > >   	seq_puts(m, "wc\t:");
> > >   	ttm_pool_debugfs_orders(global_write_combined, m);
> > >   	seq_puts(m, "uc\t:");
> > > @@ -613,7 +609,7 @@ static int ttm_pool_debugfs_globals_show(struct s=
eq_file *m, void *data)
> > >   	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> > >   	seq_puts(m, "uc 32\t:");
> > >   	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> > > -	mutex_unlock(&shrinker_lock);
> > > +	spin_unlock(&shrinker_lock);
> > >   	ttm_pool_debugfs_footer(m);
> > > @@ -640,7 +636,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struc=
t seq_file *m)
> > >   	ttm_pool_debugfs_header(m);
> > > -	mutex_lock(&shrinker_lock);
> > > +	spin_lock(&shrinker_lock);
> > >   	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> > >   		seq_puts(m, "DMA ");
> > >   		switch (i) {
> > > @@ -656,7 +652,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struc=
t seq_file *m)
> > >   		}
> > >   		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
> > >   	}
> > > -	mutex_unlock(&shrinker_lock);
> > > +	spin_unlock(&shrinker_lock);
> > >   	ttm_pool_debugfs_footer(m);
> > >   	return 0;
> > > @@ -693,7 +689,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> > >   	if (!page_pool_size)
> > >   		page_pool_size =3D num_pages;
> > > -	mutex_init(&shrinker_lock);
> > > +	spin_lock_init(&shrinker_lock);
> > >   	INIT_LIST_HEAD(&shrinker_list);
> > >   	for (i =3D 0; i < MAX_ORDER; ++i) {
> > > diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> > > index 0f80123650e2..6b75dc372fce 100644
> > > --- a/include/linux/shrinker.h
> > > +++ b/include/linux/shrinker.h
> > > @@ -92,4 +92,5 @@ extern void register_shrinker_prepared(struct shrin=
ker *shrinker);
> > >   extern int register_shrinker(struct shrinker *shrinker);
> > >   extern void unregister_shrinker(struct shrinker *shrinker);
> > >   extern void free_prealloced_shrinker(struct shrinker *shrinker);
> > > +extern void sync_shrinkers(void);
> > >   #endif
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 562e87cbd7a1..46cd9c215d73 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -408,6 +408,16 @@ void unregister_shrinker(struct shrinker *shrink=
er)
> > >   }
> > >   EXPORT_SYMBOL(unregister_shrinker);
> > > +/**
> > > + * sync_shrinker - Wait for all running shrinkers to complete.
> > > + */
> > > +void sync_shrinkers(void)
> > This one should probably be in its own patch, with a bit more commit
> > message about why we need it and all that. I'd assume that just
> > unregistering the shrinker should sync everything we needed to sync
> > already, and for other sync needs we can do locking within our own
> > shrinker?
> =

> Correct. Reason why we need the barrier is that we need to destroy the
> device (during hotplug) before the shrinker is unregistered (during module
> unload).
> =

> Going to separate that, write something up in the commit message and send=
 it
> to the appropriate audience.

Hm why do we need that? Either way sounds like an orthogonal series for
the hotunplug work, not just shrinker optimization.
-Daniel

> =

> Thanks,
> Christian.
> =

> > -Daniel
> > =

> > > +{
> > > +	down_write(&shrinker_rwsem);
> > > +	up_write(&shrinker_rwsem);
> > > +}
> > > +EXPORT_SYMBOL(sync_shrinkers);
> > > +
> > >   #define SHRINK_BATCH 128
> > >   static unsigned long do_shrink_slab(struct shrink_control *shrinkct=
l,
> > > -- =

> > > 2.25.1
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
