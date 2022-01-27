Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6049DCE7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B310ED8D;
	Thu, 27 Jan 2022 08:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22810ED8D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 08:48:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u15so3374490wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=leWJJg9QD1RG5hT6q2BbmCNIwW4dyOgmZTgBk286Bpw=;
 b=IJma2zqC2+C151FGkfnvMyQkf+E3vQTN6gPmMk1fwN+UXGD5zW7Ra4YfpWnMb0tmeX
 b7NSyoewt45YnAqAgxFhGvnuFGTP7mKRboT+QOgH+Dwyiu9xUgRYurCsgkAzRRArR/Jy
 rKKaCaNrwSF6LSAe91ZUGcp8nC8tG6JqCyF1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=leWJJg9QD1RG5hT6q2BbmCNIwW4dyOgmZTgBk286Bpw=;
 b=oYRQ3fQ77vut/M/0nxJEkKDs5UjweUGPp774CLGDClRRUe/rPd4bpk3YVvD1/ANKmP
 55jYsHDgyQ1JIApsZzGVUuoGYv7DxxBPTjE1jRc0aBYK5hDg5IE2lz4MdOdsJrM1gOE/
 nMVOGzcVmKG7TGuCCLfoZZaQUUzsLG0pF52TK6YiH3HUP+YYUE0FaxwqKT/M1i0foyiT
 2Nph+iUCBEMX1Qz6DOjjgQqkGxGBJC978pXudWxxLpFWj5wxos2mQ+Aoa0LGBmnsnhKQ
 J81TTOnTModue31x7rGMMozEVwL9orB1sJCiWemvYQc5VjKowafqZCuzLDJ1RqncIqXs
 8f6g==
X-Gm-Message-State: AOAM531BfkR7UHl3Znmh4IfM9vCOxgO3v4HVhB9S2Jy4vW0q0bpJeO4o
 rJHWl9PQ6wHXSa46rBzxkMVuOA==
X-Google-Smtp-Source: ABdhPJzKo+kyT7fKFSpQRWs9/WhQwQyLkxB1Sll0Jm8m634b19l4hNltd92XQmonpKu+roWL4cU5Pg==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr2036049wrv.503.1643273328742; 
 Thu, 27 Jan 2022 00:48:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k12sm1634143wrd.110.2022.01.27.00.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 00:48:48 -0800 (PST)
Date: Thu, 27 Jan 2022 09:48:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
 v2
Message-ID: <YfJcbjtq0/kfmlPu@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-5-christian.koenig@amd.com>
 <YfAnUIRhBwj7WOJE@phenom.ffwll.local>
 <dceed78e-8693-4480-c732-1498c7eed24f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dceed78e-8693-4480-c732-1498c7eed24f@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 03:42:21PM +0100, Christian König wrote:
> Am 25.01.22 um 17:37 schrieb Daniel Vetter:
> > On Mon, Jan 24, 2022 at 01:25:06PM +0100, Christian König wrote:
> > > It makes sense to have this in the common manager for debugging and
> > > accounting of how much resources are used.
> > > 
> > > v2: cleanup kerneldoc a bit
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Huang Rui <ray.huang@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
> > >   include/drm/ttm/ttm_resource.h     | 20 +++++++++++++++++++-
> > >   2 files changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index 7fdd58b53c61..b8362492980d 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > @@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> > >                          const struct ttm_place *place,
> > >                          struct ttm_resource *res)
> > >   {
> > > +	struct ttm_resource_manager *man;
> > > +
> > >   	res->start = 0;
> > >   	res->num_pages = PFN_UP(bo->base.size);
> > >   	res->mem_type = place->mem_type;
> > > @@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> > >   	res->bus.is_iomem = false;
> > >   	res->bus.caching = ttm_cached;
> > >   	res->bo = bo;
> > > +
> > > +	man = ttm_manager_type(bo->bdev, place->mem_type);
> > > +	atomic64_add(bo->base.size, &man->usage);
> > Doing this with atomics doesn't make a lot of sense to me. Yes with the
> > current organization it's the only thing to do in drivers, but if we move
> > this into ttm there's no reason we can track this together with the lru,
> > consistently with the lru, and under the same spinlock like the lru.
> > 
> > And at least spot-checking a few places the very next thing we generally
> > do is take the lru lock since there's really no other way to get the
> > resource into or out of the resource manager.
> > 
> > I think doing atomics for statistics when there's no need is not great,
> > because then people start using atomics for all kinds of other things, and
> > then get the barriers wrong. In i915 (simply due to the grotesque amount
> > of buggy overuse of atomics, both atomic_t and atomic bitfields) we've put
> > a hard block in place for any atomic addition. So that's why I'm a bit on
> > a crusade, but I also genuinely don't see why we need them here. All they
> > do is cost more since we have to take the spinlock anyway, the accounting
> > is just going to be a slight different (and imo more accurate) place.
> > 
> > Thoughts?
> 
> Well it depends. We have two use cases for those statistics:
> 1. Early abort when there isn't enough free resources.
> 2. Debugging
> 
> For the debugging it's completely irrelevant if we grab the lock or not, but
> for the early abort I'm not that sure.
> 
> Anyway I will just put that under the lock instead for now, if we really
> find that it is contended we could still switch back to an atomic.

To clarify, I don't mind using atomic for statistics, it's kinda the prime
example use case for them (and the reason really why they're unordered
atomics by default). It's just if you already do take a lock anyway might
as well include the statistics in there too, because except in really
silly cases that should be all faster. Worst case you need to make sure
that the datastructure and statistics (list_head and u64 here) are in the
same cacheline, and with that the statistics practically become free when
done under the spinlock.

Anyway just figured I'll drop a bit more of my thinking on this topic
here, we're agreeing already on what the code should look like anyway :-)

Cheers, Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_init);
> > >   void ttm_resource_fini(struct ttm_resource_manager *man,
> > >   		       struct ttm_resource *res)
> > >   {
> > > +	atomic64_sub(res->bo->base.size, &man->usage);
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_fini);
> > > @@ -149,6 +155,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
> > >   	spin_lock_init(&man->move_lock);
> > >   	man->bdev = bdev;
> > >   	man->size = p_size;
> > > +	atomic64_set(&man->usage, 0);
> > >   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > >   		INIT_LIST_HEAD(&man->lru[i]);
> > > @@ -221,6 +228,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> > >   	drm_printf(p, "  use_type: %d\n", man->use_type);
> > >   	drm_printf(p, "  use_tt: %d\n", man->use_tt);
> > >   	drm_printf(p, "  size: %llu\n", man->size);
> > > +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
> > >   	if (man->func->debug)
> > >   		man->func->debug(man, p);
> > >   }
> > > diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> > > index 69eea9d6399b..3d391279b33f 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -27,6 +27,7 @@
> > >   #include <linux/types.h>
> > >   #include <linux/mutex.h>
> > > +#include <linux/atomic.h>
> > >   #include <linux/dma-buf-map.h>
> > >   #include <linux/dma-fence.h>
> > >   #include <drm/drm_print.h>
> > > @@ -132,8 +133,12 @@ struct ttm_resource_manager {
> > >   	/*
> > >   	 * Protected by the global->lru_lock.
> > >   	 */
> > > -
> > >   	struct list_head lru[TTM_MAX_BO_PRIORITY];
> > > +
> > > +	/**
> > > +	 * @usage: How much of the region is used, has its own protection.
> > > +	 */
> > > +	atomic64_t usage;
> > >   };
> > >   /**
> > > @@ -261,6 +266,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
> > >   	man->move = NULL;
> > >   }
> > > +/**
> > > + * ttm_resource_manager_usage
> > > + *
> > > + * @man: A memory manager object.
> > > + *
> > > + * Return how many resources are currently used.
> > > + */
> > > +static inline uint64_t
> > > +ttm_resource_manager_usage(struct ttm_resource_manager *man)
> > > +{
> > > +	return atomic64_read(&man->usage);
> > > +}
> > > +
> > >   void ttm_resource_init(struct ttm_buffer_object *bo,
> > >                          const struct ttm_place *place,
> > >                          struct ttm_resource *res);
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
