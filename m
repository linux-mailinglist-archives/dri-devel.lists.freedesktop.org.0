Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71413D5D35
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A406E39B;
	Mon, 26 Jul 2021 15:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952B56E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:40:07 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id v46so15544453ybi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bA4thv1i6cRjXLozgmM/SFrkCBsmVT9u9Ze2PgAgFmk=;
 b=qvOtGALqmO7zcjhGmZhMTVqWkyVa4NKAT5alIF1m24PF9fkCeSbrcvSahe0nEBPyeV
 w/02G4G74PnBxoXrYOOPfqvMQ+vrBhn1zVhB0spHIE5FDyHWx+6q36IQBD9RTaBulP4R
 JPeNAQVezKegDISJ4QfejEaVReN3kSC/APMYJ1YM2+QQSPc/vKXmqJgsIchr91Pd6KDc
 aKAEUSE5MRrt7ITmfVrWXSfFsa11znHHqJEz7y4oEtdD7gXTNWSxgQcILWoacOLGvs9I
 MgTTr0JP0fhIwpXpd58MhQk3NlFX2FZf3pye+4J8Uf76RU5SGry97sJPG5B6+/U9r1EX
 jDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bA4thv1i6cRjXLozgmM/SFrkCBsmVT9u9Ze2PgAgFmk=;
 b=oZs9eN+DDhUurwyagcbbNLhQe/8kbmAV5LvfMFp/T/YVI44WN37dBeb+5QwSe7My/7
 1Kma7Ep5azEm4Vf3s9Jjz4NaI557reO3PeiMN/PBMbNJYz1oL4hvEkAvQijLyGHFfwbV
 WLChGj7FhYeRNHgmFOzdjyUl35+rdcq1dY6DAkxwlqF//6qo+q4wYEcbPg34rjv3V3nF
 k5ivjQ+/iV2Mf7U1ZhbVVRB1CqO8cpSpTBIKVY2dlkUSGn4j77X7F54EyrNOqySqZE/N
 NnQQ69Yqr/lfkos48QPh9pj+bhxhWIVTfa/AYU4pgTnIkgMqlRIcpbqTob6QPslyAhLN
 To5g==
X-Gm-Message-State: AOAM532vNfk4P/F3xjnVQOQCkDYxLUjNJDIrCNG2JcaAI4M1D5WNPfPB
 pONZG+4yDmI4nVMbQbALGz3EE1U6IUhJ3ic/p82ffg==
X-Google-Smtp-Source: ABdhPJzCHtgiIVxqF8Hy/sRRKFNjIq6si6aJuKnjP1l7UODMvcJTan32wouEqxxhjRm4ZMu7Z2Fk1KZQD4e+gcNJv/A=
X-Received: by 2002:a25:3750:: with SMTP id e77mr7272740yba.469.1627314006587; 
 Mon, 26 Jul 2021 08:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-6-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:39:55 -0500
Message-ID: <CAOFGe945J0aheqkWpM1AUeq8RZbeJ19P7rAnJxuNBsejSffqbw@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/i915: move gem_objects slab to direct module
 init/exit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 2:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> With the global kmem_cache shrink infrastructure gone there's nothing
> special and we can convert them over.
>
> I'm doing this split up into each patch because there's quite a bit of
> noise with removing the static global.slab_objects to just a
> slab_objects.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 26 +++++++---------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 +++
>  drivers/gpu/drm/i915/i915_globals.c        |  1 -
>  drivers/gpu/drm/i915/i915_globals.h        |  1 -
>  drivers/gpu/drm/i915/i915_pci.c            |  1 +
>  5 files changed, 12 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 5c21cff33199..53156250d283 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -30,14 +30,10 @@
>  #include "i915_gem_context.h"
>  #include "i915_gem_mman.h"
>  #include "i915_gem_object.h"
> -#include "i915_globals.h"
>  #include "i915_memcpy.h"
>  #include "i915_trace.h"
>
> -static struct i915_global_object {
> -       struct i915_global base;
> -       struct kmem_cache *slab_objects;
> -} global;
> +struct kmem_cache *slab_objects;

static

With that,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

>  static const struct drm_gem_object_funcs i915_gem_object_funcs;
>
> @@ -45,7 +41,7 @@ struct drm_i915_gem_object *i915_gem_object_alloc(void)
>  {
>         struct drm_i915_gem_object *obj;
>
> -       obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +       obj = kmem_cache_zalloc(slab_objects, GFP_KERNEL);
>         if (!obj)
>                 return NULL;
>         obj->base.funcs = &i915_gem_object_funcs;
> @@ -55,7 +51,7 @@ struct drm_i915_gem_object *i915_gem_object_alloc(void)
>
>  void i915_gem_object_free(struct drm_i915_gem_object *obj)
>  {
> -       return kmem_cache_free(global.slab_objects, obj);
> +       return kmem_cache_free(slab_objects, obj);
>  }
>
>  void i915_gem_object_init(struct drm_i915_gem_object *obj,
> @@ -664,23 +660,17 @@ void i915_gem_init__objects(struct drm_i915_private *i915)
>         INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>  }
>
> -static void i915_global_objects_exit(void)
> +void i915_objects_module_exit(void)
>  {
> -       kmem_cache_destroy(global.slab_objects);
> +       kmem_cache_destroy(slab_objects);
>  }
>
> -static struct i915_global_object global = { {
> -       .exit = i915_global_objects_exit,
> -} };
> -
> -int __init i915_global_objects_init(void)
> +int __init i915_objects_module_init(void)
>  {
> -       global.slab_objects =
> -               KMEM_CACHE(drm_i915_gem_object, SLAB_HWCACHE_ALIGN);
> -       if (!global.slab_objects)
> +       slab_objects = KMEM_CACHE(drm_i915_gem_object, SLAB_HWCACHE_ALIGN);
> +       if (!slab_objects)
>                 return -ENOMEM;
>
> -       i915_global_register(&global.base);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index f3ede43282dc..6d8ea62a372f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -48,6 +48,9 @@ static inline bool i915_gem_object_size_2big(u64 size)
>
>  void i915_gem_init__objects(struct drm_i915_private *i915);
>
> +void i915_objects_module_exit(void);
> +int i915_objects_module_init(void);
> +
>  struct drm_i915_gem_object *i915_gem_object_alloc(void);
>  void i915_gem_object_free(struct drm_i915_gem_object *obj);
>
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index dbb3d81eeea7..40a592fbc3e0 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -30,7 +30,6 @@ static void __i915_globals_cleanup(void)
>  }
>
>  static __initconst int (* const initfn[])(void) = {
> -       i915_global_objects_init,
>         i915_global_request_init,
>         i915_global_scheduler_init,
>         i915_global_vma_init,
> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> index f16752dbbdbf..9734740708f4 100644
> --- a/drivers/gpu/drm/i915/i915_globals.h
> +++ b/drivers/gpu/drm/i915/i915_globals.h
> @@ -23,7 +23,6 @@ int i915_globals_init(void);
>  void i915_globals_exit(void);
>
>  /* constructors */
> -int i915_global_objects_init(void);
>  int i915_global_request_init(void);
>  int i915_global_scheduler_init(void);
>  int i915_global_vma_init(void);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 2b56e664d043..2334eb3e9abb 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1301,6 +1301,7 @@ static const struct {
>         { i915_buddy_module_init, i915_buddy_module_exit },
>         { i915_context_module_init, i915_context_module_exit },
>         { i915_gem_context_module_init, i915_gem_context_module_exit },
> +       { i915_objects_module_init, i915_objects_module_exit },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
>         { i915_pmu_init, i915_pmu_exit },
> --
> 2.32.0
>
