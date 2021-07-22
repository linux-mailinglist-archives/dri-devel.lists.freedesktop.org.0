Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00B3D21C1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40B46E857;
	Thu, 22 Jul 2021 10:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1116E857
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:08:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n4so3002283wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=euI9nvHpCU3803TpEyVGMETIawOGnWRBcvEDR/YrZhs=;
 b=Ay9UFWPQUNYO03OvQH24TQaZ9uMEV50Tb0pXJeWgyhoGzc68E/SkWcKGbgaQbhM6Ro
 x/ghwom5++A9DINmH1wZFbnMdiK4QV1zEfV+CyOLiX1zc2TlzFnt4ZJ76DZDLJpp0qwb
 m89+7VA6+GkBAocD78ZHrEtfAFDTDm5o6eKLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=euI9nvHpCU3803TpEyVGMETIawOGnWRBcvEDR/YrZhs=;
 b=r9AxsUcfwwb4+5aH1Xmbz9DmLudM6rcJ/wApdY3rBK8M8S0WKoVGwGuqsHwqK8ARYB
 9Xe31W0eTRv7ldaxEbRmN6wSkb2ziu5TEjl9ukvkywX6C22PnPEt7ztPM6GJIAk/pUB7
 zzIqaX8xZzEKLIt0hmHgpv5qUu3o5IT97Jvq7AYMubZweadv6CCsJCt7G4yZlMrZ3FUi
 1N4OKLnw1F4k6AtV4qeziAu3AH2gL6NAekobdPq6sLEqAPTfWsLhuUvqpjBclsyj+4TM
 Cj7dDftinw0O6yPwqO9+o5dU0iatDKVaviZv+mJVFfvZ56vWMu3u7V1WhpJlzzynpbps
 ubLQ==
X-Gm-Message-State: AOAM531RjxICef2EWx50vmV+TeVQD+Z/E4k4f4kkgaKqLK+NOST2xdp4
 QJHdeBsKLzvyQZA+Ss5VVrHTqQ==
X-Google-Smtp-Source: ABdhPJy63OXeImxeIGz6rXH083rMDkm3QX8Ia+XLpudHDN2alOBHkLIbzf6tiNnFv1tUKkfzDsZYHg==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr36815038wmo.37.1626948535005; 
 Thu, 22 Jul 2021 03:08:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm29367576wrw.56.2021.07.22.03.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:08:54 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:08:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915: Make the kmem slab for
 i915_buddy_block a global
Message-ID: <YPlDtFd5yMBgWxwD@phenom.ffwll.local>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
 <20210721152358.2893314-7-jason@jlekstrand.net>
 <23df1788-bd8e-ac44-337d-92bb5f345b8f@intel.com>
 <YPht8s0wtnUxuF5q@phenom.ffwll.local>
 <CAOFGe97Z4NO=80LkyoLp0YnwegF_EGYVut7Ww0+Bc5qQQ7qfVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe97Z4NO=80LkyoLp0YnwegF_EGYVut7Ww0+Bc5qQQ7qfVQ@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 03:15:09PM -0500, Jason Ekstrand wrote:
> On Wed, Jul 21, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jul 21, 2021 at 05:25:41PM +0100, Matthew Auld wrote:
> > > On 21/07/2021 16:23, Jason Ekstrand wrote:
> > > > There's no reason that I can tell why this should be per-i915_buddy_mm
> > > > and doing so causes KMEM_CACHE to throw dmesg warnings because it tries
> > > > to create a debugfs entry with the name i915_buddy_block multiple times.
> > > > We could handle this by carefully giving each slab its own name but that
> > > > brings its own pain because then we have to store that string somewhere
> > > > and manage the lifetimes of the different slabs.  The most likely
> > > > outcome would be a global atomic which we increment to get a new name or
> > > > something like that.
> > > >
> > > > The much easier solution is to use the i915_globals system like we do
> > > > for every other slab in i915.  This ensures that we have exactly one of
> > > > them for each i915 driver load and it gets neatly created on module load
> > > > and destroyed on module unload.  Using the globals system also means
> > > > that its now tied into the shrink handler so we can properly respond to
> > > > low-memory situations.
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > Fixes: 88be9a0a06b7 ("drm/i915/ttm: add ttm_buddy_man")
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > >
> > > It was intentionally ripped it out with the idea that we would be moving the
> > > buddy stuff into ttm, and so part of that was trying to get rid of the some
> > > of the i915 specifics, like this globals thing.
> > >
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> > I just sent out a patch to put i915_globals on a diet, so maybe we can
> > hold this patch here a bit when there's other reasons for why this is
> > special?
> 
> This is required to get rid of the dmesg warnings.
> 
> > Or at least no make this use the i915_globals stuff and instead just link
> > up the init/exit function calls directly into Jason's new table, so that
> > we don't have a merge conflict here?
> 
> I'm happy to deal with merge conflicts however they land.

I went hitshooting and rebased while applying :-)
-Daniel

> 
> --Jason
> 
> > -Daniel
> >
> > >
> > > > ---
> > > >   drivers/gpu/drm/i915/i915_buddy.c   | 44 ++++++++++++++++++++++-------
> > > >   drivers/gpu/drm/i915/i915_buddy.h   |  3 +-
> > > >   drivers/gpu/drm/i915/i915_globals.c |  2 ++
> > > >   3 files changed, 38 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
> > > > index 29dd7d0310c1f..911feedad4513 100644
> > > > --- a/drivers/gpu/drm/i915/i915_buddy.c
> > > > +++ b/drivers/gpu/drm/i915/i915_buddy.c
> > > > @@ -8,8 +8,14 @@
> > > >   #include "i915_buddy.h"
> > > >   #include "i915_gem.h"
> > > > +#include "i915_globals.h"
> > > >   #include "i915_utils.h"
> > > > +static struct i915_global_buddy {
> > > > +   struct i915_global base;
> > > > +   struct kmem_cache *slab_blocks;
> > > > +} global;
> > > > +
> > > >   static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
> > > >                                              struct i915_buddy_block *parent,
> > > >                                              unsigned int order,
> > > > @@ -19,7 +25,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
> > > >     GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
> > > > -   block = kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
> > > > +   block = kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
> > > >     if (!block)
> > > >             return NULL;
> > > > @@ -34,7 +40,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
> > > >   static void i915_block_free(struct i915_buddy_mm *mm,
> > > >                         struct i915_buddy_block *block)
> > > >   {
> > > > -   kmem_cache_free(mm->slab_blocks, block);
> > > > +   kmem_cache_free(global.slab_blocks, block);
> > > >   }
> > > >   static void mark_allocated(struct i915_buddy_block *block)
> > > > @@ -85,15 +91,11 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
> > > >     GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
> > > > -   mm->slab_blocks = KMEM_CACHE(i915_buddy_block, SLAB_HWCACHE_ALIGN);
> > > > -   if (!mm->slab_blocks)
> > > > -           return -ENOMEM;
> > > > -
> > > >     mm->free_list = kmalloc_array(mm->max_order + 1,
> > > >                                   sizeof(struct list_head),
> > > >                                   GFP_KERNEL);
> > > >     if (!mm->free_list)
> > > > -           goto out_destroy_slab;
> > > > +           return -ENOMEM;
> > > >     for (i = 0; i <= mm->max_order; ++i)
> > > >             INIT_LIST_HEAD(&mm->free_list[i]);
> > > > @@ -145,8 +147,6 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
> > > >     kfree(mm->roots);
> > > >   out_free_list:
> > > >     kfree(mm->free_list);
> > > > -out_destroy_slab:
> > > > -   kmem_cache_destroy(mm->slab_blocks);
> > > >     return -ENOMEM;
> > > >   }
> > > > @@ -161,7 +161,6 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
> > > >     kfree(mm->roots);
> > > >     kfree(mm->free_list);
> > > > -   kmem_cache_destroy(mm->slab_blocks);
> > > >   }
> > > >   static int split_block(struct i915_buddy_mm *mm,
> > > > @@ -410,3 +409,28 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
> > > >   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > > >   #include "selftests/i915_buddy.c"
> > > >   #endif
> > > > +
> > > > +static void i915_global_buddy_shrink(void)
> > > > +{
> > > > +   kmem_cache_shrink(global.slab_blocks);
> > > > +}
> > > > +
> > > > +static void i915_global_buddy_exit(void)
> > > > +{
> > > > +   kmem_cache_destroy(global.slab_blocks);
> > > > +}
> > > > +
> > > > +static struct i915_global_buddy global = { {
> > > > +   .shrink = i915_global_buddy_shrink,
> > > > +   .exit = i915_global_buddy_exit,
> > > > +} };
> > > > +
> > > > +int __init i915_global_buddy_init(void)
> > > > +{
> > > > +   global.slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
> > > > +   if (!global.slab_blocks)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   i915_global_register(&global.base);
> > > > +   return 0;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
> > > > index 37f8c42071d12..d8f26706de52f 100644
> > > > --- a/drivers/gpu/drm/i915/i915_buddy.h
> > > > +++ b/drivers/gpu/drm/i915/i915_buddy.h
> > > > @@ -47,7 +47,6 @@ struct i915_buddy_block {
> > > >    * i915_buddy_alloc* and i915_buddy_free* should suffice.
> > > >    */
> > > >   struct i915_buddy_mm {
> > > > -   struct kmem_cache *slab_blocks;
> > > >     /* Maintain a free list for each order. */
> > > >     struct list_head *free_list;
> > > > @@ -130,4 +129,6 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
> > > >   void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
> > > > +int i915_global_buddy_init(void);
> > > > +
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> > > > index 87267e1d2ad92..e57102a4c8d16 100644
> > > > --- a/drivers/gpu/drm/i915/i915_globals.c
> > > > +++ b/drivers/gpu/drm/i915/i915_globals.c
> > > > @@ -8,6 +8,7 @@
> > > >   #include <linux/workqueue.h>
> > > >   #include "i915_active.h"
> > > > +#include "i915_buddy.h"
> > > >   #include "gem/i915_gem_context.h"
> > > >   #include "gem/i915_gem_object.h"
> > > >   #include "i915_globals.h"
> > > > @@ -87,6 +88,7 @@ static void __i915_globals_cleanup(void)
> > > >   static __initconst int (* const initfn[])(void) = {
> > > >     i915_global_active_init,
> > > > +   i915_global_buddy_init,
> > > >     i915_global_context_init,
> > > >     i915_global_gem_context_init,
> > > >     i915_global_objects_init,
> > > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
