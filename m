Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700684E67CD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8497910E270;
	Thu, 24 Mar 2022 17:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193A10E270
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 17:27:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u3so7647746wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hQpVmaE3VdJwkGDY4HZfxpwaHN9FA4iljlRhUTFsAIM=;
 b=Skcp19yV6rdDELYfqmP8CUZBh+7t3OuqgwGIxZPtj6R4ciyiS+QXhHS2KDMNB9IrYy
 lhAUl+EN2nze0RizgkvpRM+I38ILQHErfoWN3CVb1tjsz2e+7+19du3RUrdXwE/qkspn
 4No/u00ETHSxquM0AHcVVE1wRaNW2/KFs2xns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hQpVmaE3VdJwkGDY4HZfxpwaHN9FA4iljlRhUTFsAIM=;
 b=TlyHO/fF54gzsAlh48VgyJsqQG2LwNJeTwVH/BEdSMKKRkAZlkAXIGLcxJOW3h71C0
 wqUTOlQEYTypnOmgZWwuOffS01Fz5MhFAROSZojAvf+RUEwQQH/VPfocKbNKRAW4wdq/
 LEFpxK3RWTDa1q0PrOLEt6kJ3rgHHYVLG17cktgLlbw/G74IObfrCnw4zyYTbiybi4RV
 mfY+9IFtqRSBs9CFl4jm+hXvgcQQWpwNm3kLtGe6S1ic4FR6eJZ85pmWhwLsn/IfjP9U
 CSvuDp4IDZ4TTcSs9lUhJHMltnlTJNqnGJuYXFN2thTCB0GmVt0pf7xt/bBs8ctlAPMA
 sWLw==
X-Gm-Message-State: AOAM5320YWjCJMNYtopHGUxnri9P1WdfdWXQMA8LSeeAks19pXEQVtBI
 b2AOaa5iIlUZoiQgSd5LZRsvDA==
X-Google-Smtp-Source: ABdhPJwybiKKPjJxSLtMOLw1py93KMtKAZudP4yj+LDKTNOeiabVp8cOO7LZmgWTa/AUaBUmkeRZfg==
X-Received: by 2002:adf:f4ce:0:b0:203:fb72:8709 with SMTP id
 h14-20020adff4ce000000b00203fb728709mr5663807wrp.28.1648142850780; 
 Thu, 24 Mar 2022 10:27:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm3940685wri.59.2022.03.24.10.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:27:29 -0700 (PDT)
Date: Thu, 24 Mar 2022 18:27:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Message-ID: <Yjyp/ygjjZiVc5EA@phenom.ffwll.local>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <Yjr31qQyWxaEbkmZ@phenom.ffwll.local>
 <8b211aca-87ea-faee-c1c8-ab832929fdcf@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b211aca-87ea-faee-c1c8-ab832929fdcf@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 03:25:08PM +0100, Christian König wrote:
> Am 23.03.22 um 11:35 schrieb Daniel Vetter:
> > On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
> > > [SNIP]
> > >   EXPORT_SYMBOL(ttm_resource_init);
> > > @@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
> > >    * @res: the resource to clean up
> > >    *
> > >    * Should be used by resource manager backends to clean up the TTM resource
> > > - * objects before freeing the underlying structure. Counterpart of
> > > - * &ttm_resource_init
> > > + * objects before freeing the underlying structure. Makes sure the resource is
> > > + * removed from the LRU before destruction.
> > > + * Counterpart of &ttm_resource_init.
> > ttm_resource_init() or the link wont work correctly. There's a few more
> > like this. From earlier patches, but please fix.
> 
> Hui what? I've just tried it and the current documentation works fine, but
> when I add the () it doesn't work any more.

&foo is for linking to structs (but struct foo is recommended since it's
easier on the eyes), foo() is for linking to functions.

So if that doesn't work then something fishy is going on, maybe the
kerneldoc for ttm_resource_init is using the struct header and not the
function header?

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#highlights-and-cross-references
 
> > Also in my earlier review I had a bunch more kerneldoc comments that
> > arean't addressed here yet:
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FYfAqtI95aewAb10L%40phenom.ffwll.local%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C43a4517eb6bc4ccda10708da0cb8cbd6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637836285385616052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2BqlN6044DRHaXsYub9pCEVKUu5a0Nfod06lOp%2BaXNP0%3D&amp;reserved=0
> 
> What comment exactly do you mean? I thought I've addressed everything except
> for the lockdep checks.

There was a bunch about adding more cross references. The main one is that
imo struct ttm_lru_bulk_move should link to all the functions you need to
use this with. I made similar comments in later patches (e.g. for
set_bulk_move). That struct just seems like the best place to tie this all
together, and maybe even add a bit of wording why this is a cool idea.

I guess you only read the initial review up to the locking comments, since
that's the stuff we ended up discussing a bit :-)

Cheers, Daniel

> 
> Thanks,
> Christian.
> 
> > 
> > With that addressed Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > still holds.
> > -Daniel
> > 
> > 
> > >    */
> > >   void ttm_resource_fini(struct ttm_resource_manager *man,
> > >   		       struct ttm_resource *res)
> > >   {
> > > -	spin_lock(&man->bdev->lru_lock);
> > > -	man->usage -= res->bo->base.size;
> > > -	spin_unlock(&man->bdev->lru_lock);
> > > +	struct ttm_device *bdev = man->bdev;
> > > +
> > > +	spin_lock(&bdev->lru_lock);
> > > +	list_del_init(&res->lru);
> > > +	if (res->bo && bdev->funcs->del_from_lru_notify)
> > > +		bdev->funcs->del_from_lru_notify(res->bo);
> > > +	man->usage -= res->num_pages << PAGE_SHIFT;
> > > +	spin_unlock(&bdev->lru_lock);
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_fini);
> > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > > index c17b2df9178b..3da77fc54552 100644
> > > --- a/include/drm/ttm/ttm_bo_api.h
> > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > @@ -55,8 +55,6 @@ struct ttm_placement;
> > >   struct ttm_place;
> > > -struct ttm_lru_bulk_move;
> > > -
> > >   /**
> > >    * enum ttm_bo_type
> > >    *
> > > @@ -94,7 +92,6 @@ struct ttm_tt;
> > >    * @ttm: TTM structure holding system pages.
> > >    * @evicted: Whether the object was evicted without user-space knowing.
> > >    * @deleted: True if the object is only a zombie and already deleted.
> > > - * @lru: List head for the lru list.
> > >    * @ddestroy: List head for the delayed destroy list.
> > >    * @swap: List head for swap LRU list.
> > >    * @moving: Fence set when BO is moving
> > > @@ -143,7 +140,6 @@ struct ttm_buffer_object {
> > >   	 * Members protected by the bdev::lru_lock.
> > >   	 */
> > > -	struct list_head lru;
> > >   	struct list_head ddestroy;
> > >   	/**
> > > @@ -295,7 +291,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
> > >    * ttm_bo_move_to_lru_tail
> > >    *
> > >    * @bo: The buffer object.
> > > - * @mem: Resource object.
> > >    * @bulk: optional bulk move structure to remember BO positions
> > >    *
> > >    * Move this BO to the tail of all lru lists used to lookup and reserve an
> > > @@ -303,19 +298,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
> > >    * held, and is used to make a BO less likely to be considered for eviction.
> > >    */
> > >   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> > > -			     struct ttm_resource *mem,
> > >   			     struct ttm_lru_bulk_move *bulk);
> > > -/**
> > > - * ttm_bo_bulk_move_lru_tail
> > > - *
> > > - * @bulk: bulk move structure
> > > - *
> > > - * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
> > > - * BO order never changes. Should be called with ttm_global::lru_lock held.
> > > - */
> > > -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
> > > -
> > >   /**
> > >    * ttm_bo_lock_delayed_workqueue
> > >    *
> > > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> > > index 5f087575194b..6c7352e13708 100644
> > > --- a/include/drm/ttm/ttm_bo_driver.h
> > > +++ b/include/drm/ttm/ttm_bo_driver.h
> > > @@ -45,33 +45,6 @@
> > >   #include "ttm_tt.h"
> > >   #include "ttm_pool.h"
> > > -/**
> > > - * struct ttm_lru_bulk_move_pos
> > > - *
> > > - * @first: first BO in the bulk move range
> > > - * @last: last BO in the bulk move range
> > > - *
> > > - * Positions for a lru bulk move.
> > > - */
> > > -struct ttm_lru_bulk_move_pos {
> > > -	struct ttm_buffer_object *first;
> > > -	struct ttm_buffer_object *last;
> > > -};
> > > -
> > > -/**
> > > - * struct ttm_lru_bulk_move
> > > - *
> > > - * @tt: first/last lru entry for BOs in the TT domain
> > > - * @vram: first/last lru entry for BOs in the VRAM domain
> > > - * @swap: first/last lru entry for BOs on the swap list
> > > - *
> > > - * Helper structure for bulk moves on the LRU list.
> > > - */
> > > -struct ttm_lru_bulk_move {
> > > -	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> > > -	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> > > -};
> > > -
> > >   /*
> > >    * ttm_bo.c
> > >    */
> > > @@ -182,7 +155,7 @@ static inline void
> > >   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
> > >   {
> > >   	spin_lock(&bo->bdev->lru_lock);
> > > -	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
> > > +	ttm_bo_move_to_lru_tail(bo, NULL);
> > >   	spin_unlock(&bo->bdev->lru_lock);
> > >   }
> > > diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> > > index 323c14a30c6b..181e82e3d806 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -26,10 +26,12 @@
> > >   #define _TTM_RESOURCE_H_
> > >   #include <linux/types.h>
> > > +#include <linux/list.h>
> > >   #include <linux/mutex.h>
> > >   #include <linux/atomic.h>
> > >   #include <linux/dma-buf-map.h>
> > >   #include <linux/dma-fence.h>
> > > +
> > >   #include <drm/drm_print.h>
> > >   #include <drm/ttm/ttm_caching.h>
> > >   #include <drm/ttm/ttm_kmap_iter.h>
> > > @@ -179,6 +181,33 @@ struct ttm_resource {
> > >   	uint32_t placement;
> > >   	struct ttm_bus_placement bus;
> > >   	struct ttm_buffer_object *bo;
> > > +	struct list_head lru;
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_bulk_move_pos
> > > + *
> > > + * @first: first res in the bulk move range
> > > + * @last: last res in the bulk move range
> > > + *
> > > + * Positions for a lru bulk move.
> > > + */
> > > +struct ttm_lru_bulk_move_pos {
> > > +	struct ttm_resource *first;
> > > +	struct ttm_resource *last;
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_bulk_move
> > > + *
> > > + * @tt: first/last lru entry for resources in the TT domain
> > > + * @vram: first/last lru entry for resources in the VRAM domain
> > > + *
> > > + * Helper structure for bulk moves on the LRU list.
> > > + */
> > > +struct ttm_lru_bulk_move {
> > > +	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> > > +	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> > >   };
> > >   /**
> > > @@ -267,6 +296,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
> > >   	man->move = NULL;
> > >   }
> > > +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
> > > +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> > > +
> > > +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
> > > +				   struct ttm_lru_bulk_move *bulk);
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
