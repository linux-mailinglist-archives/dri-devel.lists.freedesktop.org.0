Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CB3FC7FA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE8C89994;
	Tue, 31 Aug 2021 13:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6589994
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:15:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x6so19425323wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=trHskT2CtpQMpkSfC5aSCNvAyE3U61xq8FE0wLzwOgI=;
 b=f9O1W2IpsIYutklbvjg+FWFSHLzqiZuOZNYrn6kuoj4HW8Rv4NMlOydJh28ppwBauW
 WQGrEMfrsdvpjXq7CZMOg/zvmFEIaQ5ffrYh2U9CfD3v8y/wcoStY4dAEfXYgwejPf5S
 euFN3tskyfYSHj2AZrjXH+Tdiin8CDwrRknzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=trHskT2CtpQMpkSfC5aSCNvAyE3U61xq8FE0wLzwOgI=;
 b=Z7qaGuzQH6ZPxv0CDUC5hQoIVZlJXXPI6PF10X3/N9OXDr21+DzHajng9h5OK6esX9
 cV28XWIOAttAL9TnW7a45lqljdnNE+yku/65hgx/LmNKj8DxZySHiY/KTrECV2AC45Fi
 lfDb+vX08UIxXospmBl5rLxhvKbPChR+MPe/FlT/CUn/iuP5W4fLbGazXRSLuJr/WwSj
 21BS5/oNw1ThDa9FWpfucCjCFz6H7wyV5B+4cOd9PXsvJF3luiwuX2ygYxW0iqAJhP5c
 OGIYK2t8GmZXsQw1c76tcLg1jRMJZKkjcFCzYdhUmqm8rFkqz9IPBgBlUIbQ2a571PJk
 rVYQ==
X-Gm-Message-State: AOAM532gwmInJEoB6LTLVhUZo18qEgu3duB2ydLVDtUlLZGOLzRtKk/Q
 0SyPbTweT9dgt92+UV4kKQRUyA==
X-Google-Smtp-Source: ABdhPJwXCg/GkRMDR5idQXtOFpoc96n6f+iFD1OWHF2FPMMQCS2szbtJd9wGkEw63bf0EiBIGxjY0A==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr30870673wrn.60.1630415743982; 
 Tue, 31 Aug 2021 06:15:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k17sm2782259wmj.0.2021.08.31.06.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:15:43 -0700 (PDT)
Date: Tue, 31 Aug 2021 15:15:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, andrey.grodzovsky@amd.com
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
Message-ID: <YS4rfYno1OQ19J61@phenom.ffwll.local>
References: <20210830085707.209508-1-christian.koenig@amd.com>
 <20210830085707.209508-4-christian.koenig@amd.com>
 <YS4mCPDUQSE1PK0t@phenom.ffwll.local>
 <116910d5-7238-316d-bb5a-c28337201449@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116910d5-7238-316d-bb5a-c28337201449@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 02:57:05PM +0200, Christian König wrote:
> Am 31.08.21 um 14:52 schrieb Daniel Vetter:
> > On Mon, Aug 30, 2021 at 10:56:59AM +0200, Christian König wrote:
> > > It makes sense to have this in the common manager for debugging and
> > > accounting of how much resources are used.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
> > >   include/drm/ttm/ttm_resource.h     | 18 ++++++++++++++++++
> > >   2 files changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index a4c495da0040..426e6841fc89 100644
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
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_init);
> > >   void ttm_resource_fini(struct ttm_resource_manager *man,
> > >   		       struct ttm_resource *res)
> > >   {
> > > +	atomic64_sub(res->bo->base.size, &man->usage);
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_fini);
> > > @@ -100,6 +106,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
> > >   	spin_lock_init(&man->move_lock);
> > >   	man->bdev = bdev;
> > >   	man->size = p_size;
> > > +	atomic64_set(&man->usage, 0);
> > >   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> > >   		INIT_LIST_HEAD(&man->lru[i]);
> > > @@ -172,6 +179,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> > >   	drm_printf(p, "  use_type: %d\n", man->use_type);
> > >   	drm_printf(p, "  use_tt: %d\n", man->use_tt);
> > >   	drm_printf(p, "  size: %llu\n", man->size);
> > > +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
> > >   	if (man->func->debug)
> > >   		man->func->debug(man, p);
> > >   }
> > > diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> > > index e8080192cae4..526fe359c603 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -27,6 +27,7 @@
> > >   #include <linux/types.h>
> > >   #include <linux/mutex.h>
> > > +#include <linux/atomic.h>
> > >   #include <linux/dma-buf-map.h>
> > >   #include <linux/dma-fence.h>
> > >   #include <drm/drm_print.h>
> > > @@ -110,6 +111,7 @@ struct ttm_resource_manager_func {
> > >    * static information. bdev::driver::io_mem_free is never used.
> > >    * @lru: The lru list for this memory type.
> > >    * @move: The fence of the last pipelined move operation.
> > > + * @usage: How much of the region is used.
> > >    *
> > >    * This structure is used to identify and manage memory types for a device.
> > >    */
> > > @@ -134,6 +136,9 @@ struct ttm_resource_manager {
> > >   	 * Protected by @move_lock.
> > >   	 */
> > >   	struct dma_fence *move;
> > > +
> > > +	/* Own protection */

Please document struct members with the inline kerneldoc style, that way
the comment here shows up in the kerneldoc too.

Would be good to just convert the entire struct I think.

> > > +	atomic64_t usage;
> > Shouldn't we keep track of this together with the lru updates, under the
> > same spinlock?
> 
> Mhm, what should that be good for? As far as I know we use it for two use
> cases:
> 1. Early abort when size-usage < requested.

But doesn't have all kinds of potential temporary leaks again? Except this
time around we can't even fix them eventually, because these allocations
aren't on the lru list at all.

> 2. Statistics for debugging.
> 
> Especially the first use case is rather important under memory pressure to
> avoid costly acquiring of a contended lock.

Or maybe I'm just not understanding where this matters? Don't you need to
grab the lru lock anyway under memory pressure?

> > Otherwise this usage here just becomes kinda meaningless I think, and just
> > for some debugging. I really don't like sprinkling random atomic_t around
> > (mostly because i915-gem code has gone totally overboard with them, with
> > complete disregard to complexity of the result).
> 
> Well this here just replaces what drivers did anyway and the cost of inc/dec
> an atomic is pretty much negligible.

Complexity in understanding the locking. The cpu has not problem with this
stuff ofc.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > >   };
> > >   /**
> > > @@ -260,6 +265,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
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
