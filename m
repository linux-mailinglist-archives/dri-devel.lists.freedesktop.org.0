Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E13D5CF3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17356FE59;
	Mon, 26 Jul 2021 15:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468FD6FE36
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:26:47 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id a93so15507123ybi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6wl93W1xfyR4eqzH50U7OL/RM+7q9Jr9sdrZMFnByQ=;
 b=CFCr+uUEcZWea2gJN5y0nIAu9O73tmRG7J/h1OFEYLhXskZ3+wAMcJiuZ+ygGbGCND
 xJQd9zNthTg/YI/7MCVN10IQGX6iKiTuJVFG5WX9NMWdI7mKnpA8EtygtgDzspjcKsuC
 o3xXMgQp8eOzR4BQjlIM29Q/KGD4rzGiSvaDhk/YOczd9FnYytNQiQd2lXVix7Njtrpt
 XMEDJP3OPLOHagxfuvq3nUA8h+p3I1I/ExV2AlpwuLuBayNhlA+HSzcDwtyMGt/rZ4b1
 Bweo2qpLMZ0GhAvRtDMSuPNIg91ZRaKR8RLZfonUAS3NHFijMR1VJ5LiW8bszpVuajTR
 PA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6wl93W1xfyR4eqzH50U7OL/RM+7q9Jr9sdrZMFnByQ=;
 b=uDw2h3JMPhYNd2HdgucEaoXRkmoTak6+QlJzBgjChLmMGozrRAAsiY4Yue9F7wRPRE
 qNguMPo93YrMCU0Lh60P9Mcruegt0wcUfIEfZXXTdrGBnrfORKzzOOZJr/dEhU0FBqBg
 lExZZQmQLGnWJut7q+7Pz5T2rLHGhw9YYYZJXU/c7pLWYQc8wMst5iZK4q4+PmarGORL
 RU7KV1Gb3hSs5KoBy9IHshspaZIywPw7olsozFjx1kPCRqSpEzl3xlf4Hbv2AYt9UPLy
 OhuhFIT2dpVhkwFw9ueFFauno4Ptk8CZE1pcR5lbl+iqrRAjuFqyFmNaXcwcR58565PD
 n1Ag==
X-Gm-Message-State: AOAM533EVJnl87Iqlxim91nPFa0OsfvphagRp321zSvBmzRAHefKYVrJ
 MrQyjwuTFWI9Z/Q7I9VL3ufa2fh30/02imJulSzIng==
X-Google-Smtp-Source: ABdhPJxcsN6RdKYlG/qbjX1RJALedx1OHbE2hmkX6K0QX7kOsnfFHaMcGhGicyFuZxHW335APlAIdbnyB0qn6eVBYxA=
X-Received: by 2002:a25:680b:: with SMTP id d11mr6356282ybc.241.1627313206304; 
 Mon, 26 Jul 2021 08:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-3-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:26:34 -0500
Message-ID: <CAOFGe973=WchP_GK76rewxK8RDMeVjNEqsHF235n=7hGAZX77Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/i915: move i915_buddy slab to direct module
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
> noise with removing the static global.slab_blocks to just a
> slab_blocks.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_buddy.c   | 25 ++++++++-----------------
>  drivers/gpu/drm/i915/i915_buddy.h   |  3 ++-
>  drivers/gpu/drm/i915/i915_globals.c |  2 --
>  drivers/gpu/drm/i915/i915_pci.c     |  2 ++
>  4 files changed, 12 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
> index caabcaea3be7..045d00c43b4c 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.c
> +++ b/drivers/gpu/drm/i915/i915_buddy.c
> @@ -8,13 +8,9 @@
>  #include "i915_buddy.h"
>
>  #include "i915_gem.h"
> -#include "i915_globals.h"
>  #include "i915_utils.h"
>
> -static struct i915_global_buddy {
> -       struct i915_global base;
> -       struct kmem_cache *slab_blocks;
> -} global;
> +struct kmem_cache *slab_blocks;

static?  With that fixed,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

>
>  static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>                                                  struct i915_buddy_block *parent,
> @@ -25,7 +21,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>
>         GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
>
> -       block = kmem_cache_zalloc(global.slab_blocks, GFP_KERNEL);
> +       block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
>         if (!block)
>                 return NULL;
>
> @@ -40,7 +36,7 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>  static void i915_block_free(struct i915_buddy_mm *mm,
>                             struct i915_buddy_block *block)
>  {
> -       kmem_cache_free(global.slab_blocks, block);
> +       kmem_cache_free(slab_blocks, block);
>  }
>
>  static void mark_allocated(struct i915_buddy_block *block)
> @@ -410,21 +406,16 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>  #include "selftests/i915_buddy.c"
>  #endif
>
> -static void i915_global_buddy_exit(void)
> +void i915_buddy_module_exit(void)
>  {
> -       kmem_cache_destroy(global.slab_blocks);
> +       kmem_cache_destroy(slab_blocks);
>  }
>
> -static struct i915_global_buddy global = { {
> -       .exit = i915_global_buddy_exit,
> -} };
> -
> -int __init i915_global_buddy_init(void)
> +int __init i915_buddy_module_init(void)
>  {
> -       global.slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
> -       if (!global.slab_blocks)
> +       slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
> +       if (!slab_blocks)
>                 return -ENOMEM;
>
> -       i915_global_register(&global.base);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
> index d8f26706de52..3940d632f208 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.h
> +++ b/drivers/gpu/drm/i915/i915_buddy.h
> @@ -129,6 +129,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
>
>  void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
>
> -int i915_global_buddy_init(void);
> +void i915_buddy_module_exit(void);
> +int i915_buddy_module_init(void);
>
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index a53135ee831d..3de7cf22ec76 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -7,7 +7,6 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>
> -#include "i915_buddy.h"
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_object.h"
>  #include "i915_globals.h"
> @@ -33,7 +32,6 @@ static void __i915_globals_cleanup(void)
>  }
>
>  static __initconst int (* const initfn[])(void) = {
> -       i915_global_buddy_init,
>         i915_global_context_init,
>         i915_global_gem_context_init,
>         i915_global_objects_init,
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 6ee77a8f43d6..f9527269e30a 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -31,6 +31,7 @@
>  #include "display/intel_fbdev.h"
>
>  #include "i915_active.h"
> +#include "i915_buddy.h"
>  #include "i915_drv.h"
>  #include "i915_perf.h"
>  #include "i915_globals.h"
> @@ -1295,6 +1296,7 @@ static const struct {
>  } init_funcs[] = {
>         { i915_check_nomodeset, NULL },
>         { i915_active_module_init, i915_active_module_exit },
> +       { i915_buddy_module_init, i915_buddy_module_exit },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
>         { i915_pmu_init, i915_pmu_exit },
> --
> 2.32.0
>
