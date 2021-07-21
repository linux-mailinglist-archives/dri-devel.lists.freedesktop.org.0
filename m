Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F13D17C1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E0B6EC46;
	Wed, 21 Jul 2021 20:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653ED6E9C9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:15:21 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v189so1132699ybg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BaFeBHqAdEHJ8sZ9wlap9CpFhKP22NmnG72he3Q2/FY=;
 b=NhQ1jdMP/HkHsV+VoSJMcrBYGuy6Dq76hgwKdoSYNSpwPb8tP9aKviSDf/wQG+Qi7W
 0fzzrjdQmNWAHuRC50HSa1jTSsFSAypCx4AMqzdIC52nLhoatCYRdHbZc762EEyDS/mO
 QzMH4UE5g0jynGe7vh4zpXJ2FaxF095vtK3VAOzuU5KitGNw6SEwQCpVaRQihMeXL9Uu
 rRIga1594Rz82sok9vxbHvd+/KWoYSuAE/ogyWDLXnVb2CuLlz0as3qy91ezof/32w0H
 O4hG4/6ANOeZnZkqW+YZ7nz89IjiGkbSVpvrcVhIkVW0xC+jvQOjSfYuX0yAQaSiPYXk
 N4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BaFeBHqAdEHJ8sZ9wlap9CpFhKP22NmnG72he3Q2/FY=;
 b=XfZrV+8dJew+KHo5jstXEMe8NFvpKq8o5JW3r6SYAPMLcWyRrKGi89SBFh545NDIrP
 7zPJkpFK/39DpTUoQtWnR49z6tHPNs0tAUbbaSHrD4OIqCkS716mbcUf6u/mUWU5rD8b
 0kH7JAixwnInPozEDC9WKkM1RyV+A/suyDrCY50l0YAGAzodWbolo59u16IAcplBkLSB
 vMdJNwRV1SmYiNqGtKVnwe9KfEU+ci9CasYM6vEL25Ci/3+JnJnzkIxFVVYba8kZ7Esb
 p6dxLLWiCl7dPYXwLCXnICCoIxI5NIYQ6B0RJDewOCYZUPQ1KE9xApORBpMa7xjwztqI
 3FjA==
X-Gm-Message-State: AOAM533SktY71O3TjvBIccuuhMqqwKBE4MkiD4E/yqtYmGPIEVLNNKMP
 S72/6Xl9k03Z8yxUz3hyz+65VDADpFsvTkmzG0Jtnw==
X-Google-Smtp-Source: ABdhPJx2fkSFgD4SB1a+EoXcmmkr13ozdx54fC1YXXp80yHHYtLhoG0duYkGWmdNHVwtReCjJeIC++JBWdBrkpIsoFI=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr49187061ybm.323.1626898520554; 
 Wed, 21 Jul 2021 13:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210721152358.2893314-1-jason@jlekstrand.net>
 <20210721152358.2893314-7-jason@jlekstrand.net>
 <23df1788-bd8e-ac44-337d-92bb5f345b8f@intel.com>
 <YPht8s0wtnUxuF5q@phenom.ffwll.local>
In-Reply-To: <YPht8s0wtnUxuF5q@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Jul 2021 15:15:09 -0500
Message-ID: <CAOFGe97Z4NO=80LkyoLp0YnwegF_EGYVut7Ww0+Bc5qQQ7qfVQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915: Make the kmem slab for
 i915_buddy_block a global
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 21, 2021 at 05:25:41PM +0100, Matthew Auld wrote:
> > On 21/07/2021 16:23, Jason Ekstrand wrote:
> > > There's no reason that I can tell why this should be per-i915_buddy_m=
m
> > > and doing so causes KMEM_CACHE to throw dmesg warnings because it tri=
es
> > > to create a debugfs entry with the name i915_buddy_block multiple tim=
es.
> > > We could handle this by carefully giving each slab its own name but t=
hat
> > > brings its own pain because then we have to store that string somewhe=
re
> > > and manage the lifetimes of the different slabs.  The most likely
> > > outcome would be a global atomic which we increment to get a new name=
 or
> > > something like that.
> > >
> > > The much easier solution is to use the i915_globals system like we do
> > > for every other slab in i915.  This ensures that we have exactly one =
of
> > > them for each i915 driver load and it gets neatly created on module l=
oad
> > > and destroyed on module unload.  Using the globals system also means
> > > that its now tied into the shrink handler so we can properly respond =
to
> > > low-memory situations.
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Fixes: 88be9a0a06b7 ("drm/i915/ttm: add ttm_buddy_man")
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > It was intentionally ripped it out with the idea that we would be movin=
g the
> > buddy stuff into ttm, and so part of that was trying to get rid of the =
some
> > of the i915 specifics, like this globals thing.
> >
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> I just sent out a patch to put i915_globals on a diet, so maybe we can
> hold this patch here a bit when there's other reasons for why this is
> special?

This is required to get rid of the dmesg warnings.

> Or at least no make this use the i915_globals stuff and instead just link
> up the init/exit function calls directly into Jason's new table, so that
> we don't have a merge conflict here?

I'm happy to deal with merge conflicts however they land.

--Jason

> -Daniel
>
> >
> > > ---
> > >   drivers/gpu/drm/i915/i915_buddy.c   | 44 ++++++++++++++++++++++----=
---
> > >   drivers/gpu/drm/i915/i915_buddy.h   |  3 +-
> > >   drivers/gpu/drm/i915/i915_globals.c |  2 ++
> > >   3 files changed, 38 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915=
/i915_buddy.c
> > > index 29dd7d0310c1f..911feedad4513 100644
> > > --- a/drivers/gpu/drm/i915/i915_buddy.c
> > > +++ b/drivers/gpu/drm/i915/i915_buddy.c
> > > @@ -8,8 +8,14 @@
> > >   #include "i915_buddy.h"
> > >   #include "i915_gem.h"
> > > +#include "i915_globals.h"
> > >   #include "i915_utils.h"
> > > +static struct i915_global_buddy {
> > > +   struct i915_global base;
> > > +   struct kmem_cache *slab_blocks;
> > > +} global;
> > > +
> > >   static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_=
mm *mm,
> > >                                              struct i915_buddy_block =
*parent,
> > >                                              unsigned int order,
> > > @@ -19,7 +25,7 @@ static struct i915_buddy_block *i915_block_alloc(st=
ruct i915_buddy_mm *mm,
> > >     GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
> > > -   block =3D kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
> > > +   block =3D kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
> > >     if (!block)
> > >             return NULL;
> > > @@ -34,7 +40,7 @@ static struct i915_buddy_block *i915_block_alloc(st=
ruct i915_buddy_mm *mm,
> > >   static void i915_block_free(struct i915_buddy_mm *mm,
> > >                         struct i915_buddy_block *block)
> > >   {
> > > -   kmem_cache_free(mm->slab_blocks, block);
> > > +   kmem_cache_free(global.slab_blocks, block);
> > >   }
> > >   static void mark_allocated(struct i915_buddy_block *block)
> > > @@ -85,15 +91,11 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64=
 size, u64 chunk_size)
> > >     GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
> > > -   mm->slab_blocks =3D KMEM_CACHE(i915_buddy_block, SLAB_HWCACHE_ALI=
GN);
> > > -   if (!mm->slab_blocks)
> > > -           return -ENOMEM;
> > > -
> > >     mm->free_list =3D kmalloc_array(mm->max_order + 1,
> > >                                   sizeof(struct list_head),
> > >                                   GFP_KERNEL);
> > >     if (!mm->free_list)
> > > -           goto out_destroy_slab;
> > > +           return -ENOMEM;
> > >     for (i =3D 0; i <=3D mm->max_order; ++i)
> > >             INIT_LIST_HEAD(&mm->free_list[i]);
> > > @@ -145,8 +147,6 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64=
 size, u64 chunk_size)
> > >     kfree(mm->roots);
> > >   out_free_list:
> > >     kfree(mm->free_list);
> > > -out_destroy_slab:
> > > -   kmem_cache_destroy(mm->slab_blocks);
> > >     return -ENOMEM;
> > >   }
> > > @@ -161,7 +161,6 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
> > >     kfree(mm->roots);
> > >     kfree(mm->free_list);
> > > -   kmem_cache_destroy(mm->slab_blocks);
> > >   }
> > >   static int split_block(struct i915_buddy_mm *mm,
> > > @@ -410,3 +409,28 @@ int i915_buddy_alloc_range(struct i915_buddy_mm =
*mm,
> > >   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > >   #include "selftests/i915_buddy.c"
> > >   #endif
> > > +
> > > +static void i915_global_buddy_shrink(void)
> > > +{
> > > +   kmem_cache_shrink(global.slab_blocks);
> > > +}
> > > +
> > > +static void i915_global_buddy_exit(void)
> > > +{
> > > +   kmem_cache_destroy(global.slab_blocks);
> > > +}
> > > +
> > > +static struct i915_global_buddy global =3D { {
> > > +   .shrink =3D i915_global_buddy_shrink,
> > > +   .exit =3D i915_global_buddy_exit,
> > > +} };
> > > +
> > > +int __init i915_global_buddy_init(void)
> > > +{
> > > +   global.slab_blocks =3D KMEM_CACHE(i915_buddy_block, 0);
> > > +   if (!global.slab_blocks)
> > > +           return -ENOMEM;
> > > +
> > > +   i915_global_register(&global.base);
> > > +   return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915=
/i915_buddy.h
> > > index 37f8c42071d12..d8f26706de52f 100644
> > > --- a/drivers/gpu/drm/i915/i915_buddy.h
> > > +++ b/drivers/gpu/drm/i915/i915_buddy.h
> > > @@ -47,7 +47,6 @@ struct i915_buddy_block {
> > >    * i915_buddy_alloc* and i915_buddy_free* should suffice.
> > >    */
> > >   struct i915_buddy_mm {
> > > -   struct kmem_cache *slab_blocks;
> > >     /* Maintain a free list for each order. */
> > >     struct list_head *free_list;
> > > @@ -130,4 +129,6 @@ void i915_buddy_free(struct i915_buddy_mm *mm, st=
ruct i915_buddy_block *block);
> > >   void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_hea=
d *objects);
> > > +int i915_global_buddy_init(void);
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i9=
15/i915_globals.c
> > > index 87267e1d2ad92..e57102a4c8d16 100644
> > > --- a/drivers/gpu/drm/i915/i915_globals.c
> > > +++ b/drivers/gpu/drm/i915/i915_globals.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/workqueue.h>
> > >   #include "i915_active.h"
> > > +#include "i915_buddy.h"
> > >   #include "gem/i915_gem_context.h"
> > >   #include "gem/i915_gem_object.h"
> > >   #include "i915_globals.h"
> > > @@ -87,6 +88,7 @@ static void __i915_globals_cleanup(void)
> > >   static __initconst int (* const initfn[])(void) =3D {
> > >     i915_global_active_init,
> > > +   i915_global_buddy_init,
> > >     i915_global_context_init,
> > >     i915_global_gem_context_init,
> > >     i915_global_objects_init,
> > >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
