Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6013D5D18
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5036FE58;
	Mon, 26 Jul 2021 15:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D26D6FD78
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:35:55 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id s48so6931204ybi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmv3EakgEmNLpgM1YVkujmATvlNmxJQRaq17kakwiDA=;
 b=hJOfCrjhq33eVVzxcqgqu2ipWhQEKXeWINspRl43R4ygn44H4pvIyqz/6wSKyiGh2n
 ihnTRKlCGoaqo/163Xj/s7V5xLIL6/0IhD3WD+zdvYYnS+zsly8wjWv1nDsFnH8WB/lL
 yyH2KeoiN30Uv6qdS5rCnGnajZAa06FEclu1JHU5LcDLpzz8nHpmbawf3l4JTkovAvD2
 ttNN3tRBrLa7F91Wd2GFovmykF+Mrd6z7WXyoNi73/JvK0Dd+bujZGMYu6BOHcO70aT1
 66+HwChlqiaXcX4FZ0JcoEWp711sqa+y3IP1wGp+xbaOnPTomcgdvkEdKUta38tmSxaQ
 l0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmv3EakgEmNLpgM1YVkujmATvlNmxJQRaq17kakwiDA=;
 b=VrNHJ6nwjv5TEVXzZmMOzwZ6nruekGV71AhJ3wUcEvPqXxNXIs2g2JZFesh/ObQVOc
 8QcsRXUz6pVvk2GGOyhsaK5C+lkCihphdQOpiFWZhNoCoB2W1PWZa8MtHKDavq3wLB33
 CuwV8SMr/M0CNLdqMie3C24KiyCulGFcmx036vSHgAI/EE+FbdN9wG86elWj+nIfHUen
 UUKS4SozIdTmuGNiRp2udUtocsV5mWh9wyOz2GS77tW/EgPMmnjB/exSpehxSa86bx6M
 pbb1P1v3NpZXbn4BBew08maPcUKKQSBppf/bRuc0SoxqRqQLd+xxUO9yMMTdhPPN9xWp
 cQXg==
X-Gm-Message-State: AOAM531YXa4SfMRNN0g2HEQCe+qq6XoC1Sy6bL8R1KNOZv/SW5Gd9xtp
 iPkRaKkQEv2lWF43Rvkbsc1CywhJU9thF+9pB3E4yQ==
X-Google-Smtp-Source: ABdhPJzhyMAiTKuYH7iEkrTdaG9TlNYk5GWMfzUR+rL2LaRdWtcH1ipyEJDRzAfpWULIZD6Wz5+V68DCpYo59jYvq+k=
X-Received: by 2002:a25:7647:: with SMTP id r68mr25821692ybc.432.1627313754039; 
 Mon, 26 Jul 2021 08:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-5-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:35:43 -0500
Message-ID: <CAOFGe96y9eLQ2CASvdQnsNAX1o+9_DpiFSaQHj1GBpARsoQa3g@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: move gem_context slab to direct module
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
> noise with removing the static global.slab_luts to just a
> slab_luts.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 +++++++--------------
>  drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +++
>  drivers/gpu/drm/i915/i915_globals.c         |  2 --
>  drivers/gpu/drm/i915/i915_globals.h         |  1 -
>  drivers/gpu/drm/i915/i915_pci.c             |  2 ++
>  5 files changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 89ca401bf9ae..c17c28af1e57 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -79,25 +79,21 @@
>  #include "gt/intel_ring.h"
>
>  #include "i915_gem_context.h"
> -#include "i915_globals.h"
>  #include "i915_trace.h"
>  #include "i915_user_extensions.h"
>
>  #define ALL_L3_SLICES(dev) (1 << NUM_L3_SLICES(dev)) - 1
>
> -static struct i915_global_gem_context {
> -       struct i915_global base;
> -       struct kmem_cache *slab_luts;
> -} global;
> +struct kmem_cache *slab_luts;

static.

With that,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

>  struct i915_lut_handle *i915_lut_handle_alloc(void)
>  {
> -       return kmem_cache_alloc(global.slab_luts, GFP_KERNEL);
> +       return kmem_cache_alloc(slab_luts, GFP_KERNEL);
>  }
>
>  void i915_lut_handle_free(struct i915_lut_handle *lut)
>  {
> -       return kmem_cache_free(global.slab_luts, lut);
> +       return kmem_cache_free(slab_luts, lut);
>  }
>
>  static void lut_close(struct i915_gem_context *ctx)
> @@ -2282,21 +2278,16 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
>  #include "selftests/i915_gem_context.c"
>  #endif
>
> -static void i915_global_gem_context_exit(void)
> +void i915_gem_context_module_exit(void)
>  {
> -       kmem_cache_destroy(global.slab_luts);
> +       kmem_cache_destroy(slab_luts);
>  }
>
> -static struct i915_global_gem_context global = { {
> -       .exit = i915_global_gem_context_exit,
> -} };
> -
> -int __init i915_global_gem_context_init(void)
> +int __init i915_gem_context_module_init(void)
>  {
> -       global.slab_luts = KMEM_CACHE(i915_lut_handle, 0);
> -       if (!global.slab_luts)
> +       slab_luts = KMEM_CACHE(i915_lut_handle, 0);
> +       if (!slab_luts)
>                 return -ENOMEM;
>
> -       i915_global_register(&global.base);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index 20411db84914..18060536b0c2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -224,6 +224,9 @@ i915_gem_engines_iter_next(struct i915_gem_engines_iter *it);
>         for (i915_gem_engines_iter_init(&(it), (engines)); \
>              ((ce) = i915_gem_engines_iter_next(&(it)));)
>
> +void i915_gem_context_module_exit(void);
> +int i915_gem_context_module_init(void);
> +
>  struct i915_lut_handle *i915_lut_handle_alloc(void);
>  void i915_lut_handle_free(struct i915_lut_handle *lut);
>
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index d36eb7dc40aa..dbb3d81eeea7 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -7,7 +7,6 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>
> -#include "gem/i915_gem_object.h"
>  #include "i915_globals.h"
>  #include "i915_request.h"
>  #include "i915_scheduler.h"
> @@ -31,7 +30,6 @@ static void __i915_globals_cleanup(void)
>  }
>
>  static __initconst int (* const initfn[])(void) = {
> -       i915_global_gem_context_init,
>         i915_global_objects_init,
>         i915_global_request_init,
>         i915_global_scheduler_init,
> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> index 60daa738a188..f16752dbbdbf 100644
> --- a/drivers/gpu/drm/i915/i915_globals.h
> +++ b/drivers/gpu/drm/i915/i915_globals.h
> @@ -23,7 +23,6 @@ int i915_globals_init(void);
>  void i915_globals_exit(void);
>
>  /* constructors */
> -int i915_global_gem_context_init(void);
>  int i915_global_objects_init(void);
>  int i915_global_request_init(void);
>  int i915_global_scheduler_init(void);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 266618157775..2b56e664d043 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -34,6 +34,7 @@
>  #include "i915_buddy.h"
>  #include "i915_drv.h"
>  #include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_object.h"
>  #include "i915_perf.h"
>  #include "i915_globals.h"
>  #include "i915_selftest.h"
> @@ -1299,6 +1300,7 @@ static const struct {
>         { i915_active_module_init, i915_active_module_exit },
>         { i915_buddy_module_init, i915_buddy_module_exit },
>         { i915_context_module_init, i915_context_module_exit },
> +       { i915_gem_context_module_init, i915_gem_context_module_exit },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
>         { i915_pmu_init, i915_pmu_exit },
> --
> 2.32.0
>
