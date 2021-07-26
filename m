Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F833D5DF9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05F96E8AA;
	Mon, 26 Jul 2021 15:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752716E8AA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:46:12 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id x192so15618479ybe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2pjmJQXq3IZvKFhDB7eJ3UiWdNBhobI7x749vSRhuKc=;
 b=aTCtxLly96rK1slOsm4OA9J+QX4/2T3n2pyL/JyQtkkHdk/fj3cnnYXRT0eXSb1Nyx
 /qbAiWFSBFORzI7oO6AiTuWB0kOPW/SSO9bs+qYZo2gjtUxwTdvlrbpJQTAqDEBM3O6j
 xE8a4ETBJizHmYhFn5Vn7iEH6gmvmWWiWA9tHAo3Sw13Mcbkn+0BaiKQej5U2H//tUKq
 M/poGzdOyLkGJDbfZT8wp5EHuymWX48LWI+mEFKI/xahnvJj/KciqAmQiTKds//McrXt
 +sfGHKezrkj3BZc0kZ+9XD2TrR/ryZqQxKQTt6Fmha1X5g/jC87slinisrbdrk72XUVm
 vDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2pjmJQXq3IZvKFhDB7eJ3UiWdNBhobI7x749vSRhuKc=;
 b=WiKtsjqkYE9Ko7UbzgviU+FOYpaodOi5EC4oZGaYjbznD10ucWpof4fTTFXMNsvb5K
 KDgka6IR5Q7ZrgNuOBPKBZVMHR8xG1rkkg8j6Gh75AbH7ScNZrw7p/NwHdc3EXmMWop7
 Eq29sRNtse1044GDnpzLLNt7sRvf6Lg1GZFYhYJRxK6j/uzxKqwnj2QsIxKuYy5QwTgh
 A4Iz7n55V1Wtn/D5Udtzc+ylGrJCOxc8UwiB3UuxMgW8E/x7MNHBCMAoKDYvrVuLwpWV
 0LnHHNsNDW7JeDo7I8av4cPR1f2BQx702tHP/cbzQZVEv5W4Zhud5H0J1Y5vA+SuTzGp
 bttQ==
X-Gm-Message-State: AOAM533NbuN0AqoHuaDVdoLYysXLRdTE8q3wKFKHT2Q3QVwe+R4px0cp
 GeRLVSxxMkApFg0mNR/liGInpUDbQAsCBHD/x/jwYg==
X-Google-Smtp-Source: ABdhPJx2rYDzmdfE/vQ0biEeqlNk+FifvBCHHzd9yw/hVzbOtW2PkuAK4bWetXVNCygrNqXbx73+095OEDIUfUVR9jE=
X-Received: by 2002:a25:5584:: with SMTP id
 j126mr25371691ybb.323.1627314371507; 
 Mon, 26 Jul 2021 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-7-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:46:00 -0500
Message-ID: <CAOFGe95FA+TLOYyuAy7JS63HSkv7T-EApV6L-RUXsCfSjqfDGQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/i915: move request slabs to direct module
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
> noise with removing the static global.slab_requests|execute_cbs to just a
> slab_requests|execute_cbs.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_globals.c |  2 --
>  drivers/gpu/drm/i915/i915_pci.c     |  2 ++
>  drivers/gpu/drm/i915/i915_request.c | 47 ++++++++++++-----------------
>  drivers/gpu/drm/i915/i915_request.h |  3 ++
>  4 files changed, 24 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 40a592fbc3e0..8fffa8d93bc5 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -8,7 +8,6 @@
>  #include <linux/workqueue.h>
>
>  #include "i915_globals.h"
> -#include "i915_request.h"
>  #include "i915_scheduler.h"
>  #include "i915_vma.h"
>
> @@ -30,7 +29,6 @@ static void __i915_globals_cleanup(void)
>  }
>
>  static __initconst int (* const initfn[])(void) = {
> -       i915_global_request_init,
>         i915_global_scheduler_init,
>         i915_global_vma_init,
>  };
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 2334eb3e9abb..bb2bd12fb8c2 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -35,6 +35,7 @@
>  #include "i915_drv.h"
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_object.h"
> +#include "i915_request.h"
>  #include "i915_perf.h"
>  #include "i915_globals.h"
>  #include "i915_selftest.h"
> @@ -1302,6 +1303,7 @@ static const struct {
>         { i915_context_module_init, i915_context_module_exit },
>         { i915_gem_context_module_init, i915_gem_context_module_exit },
>         { i915_objects_module_init, i915_objects_module_exit },
> +       { i915_request_module_init, i915_request_module_exit },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
>         { i915_pmu_init, i915_pmu_exit },
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 6594cb2f8ebd..69152369ea00 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -42,7 +42,6 @@
>
>  #include "i915_active.h"
>  #include "i915_drv.h"
> -#include "i915_globals.h"
>  #include "i915_trace.h"
>  #include "intel_pm.h"
>
> @@ -52,11 +51,8 @@ struct execute_cb {
>         struct i915_request *signal;
>  };
>
> -static struct i915_global_request {
> -       struct i915_global base;
> -       struct kmem_cache *slab_requests;
> -       struct kmem_cache *slab_execute_cbs;
> -} global;
> +struct kmem_cache *slab_requests;

static

> +struct kmem_cache *slab_execute_cbs;

static

Am I tired of typing this?  Yes, I am!  Will I keep typing it?  Probably. :-P

>
>  static const char *i915_fence_get_driver_name(struct dma_fence *fence)
>  {
> @@ -107,7 +103,7 @@ static signed long i915_fence_wait(struct dma_fence *fence,
>
>  struct kmem_cache *i915_request_slab_cache(void)
>  {
> -       return global.slab_requests;
> +       return slab_requests;
>  }
>
>  static void i915_fence_release(struct dma_fence *fence)
> @@ -159,7 +155,7 @@ static void i915_fence_release(struct dma_fence *fence)
>             !cmpxchg(&rq->engine->request_pool, NULL, rq))
>                 return;
>
> -       kmem_cache_free(global.slab_requests, rq);
> +       kmem_cache_free(slab_requests, rq);
>  }
>
>  const struct dma_fence_ops i915_fence_ops = {
> @@ -176,7 +172,7 @@ static void irq_execute_cb(struct irq_work *wrk)
>         struct execute_cb *cb = container_of(wrk, typeof(*cb), work);
>
>         i915_sw_fence_complete(cb->fence);
> -       kmem_cache_free(global.slab_execute_cbs, cb);
> +       kmem_cache_free(slab_execute_cbs, cb);
>  }
>
>  static __always_inline void
> @@ -514,7 +510,7 @@ __await_execution(struct i915_request *rq,
>         if (i915_request_is_active(signal))
>                 return 0;
>
> -       cb = kmem_cache_alloc(global.slab_execute_cbs, gfp);
> +       cb = kmem_cache_alloc(slab_execute_cbs, gfp);
>         if (!cb)
>                 return -ENOMEM;
>
> @@ -868,7 +864,7 @@ request_alloc_slow(struct intel_timeline *tl,
>         rq = list_first_entry(&tl->requests, typeof(*rq), link);
>         i915_request_retire(rq);
>
> -       rq = kmem_cache_alloc(global.slab_requests,
> +       rq = kmem_cache_alloc(slab_requests,
>                               gfp | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>         if (rq)
>                 return rq;
> @@ -881,7 +877,7 @@ request_alloc_slow(struct intel_timeline *tl,
>         retire_requests(tl);
>
>  out:
> -       return kmem_cache_alloc(global.slab_requests, gfp);
> +       return kmem_cache_alloc(slab_requests, gfp);
>  }
>
>  static void __i915_request_ctor(void *arg)
> @@ -942,7 +938,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>          *
>          * Do not use kmem_cache_zalloc() here!
>          */
> -       rq = kmem_cache_alloc(global.slab_requests,
> +       rq = kmem_cache_alloc(slab_requests,
>                               gfp | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>         if (unlikely(!rq)) {
>                 rq = request_alloc_slow(tl, &ce->engine->request_pool, gfp);
> @@ -1029,7 +1025,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>         GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
>
>  err_free:
> -       kmem_cache_free(global.slab_requests, rq);
> +       kmem_cache_free(slab_requests, rq);
>  err_unreserve:
>         intel_context_unpin(ce);
>         return ERR_PTR(ret);
> @@ -2084,19 +2080,15 @@ void i915_request_show(struct drm_printer *m,
>  #include "selftests/i915_request.c"
>  #endif
>
> -static void i915_global_request_exit(void)
> +void i915_request_module_exit(void)
>  {
> -       kmem_cache_destroy(global.slab_execute_cbs);
> -       kmem_cache_destroy(global.slab_requests);
> +       kmem_cache_destroy(slab_execute_cbs);
> +       kmem_cache_destroy(slab_requests);
>  }
>
> -static struct i915_global_request global = { {
> -       .exit = i915_global_request_exit,
> -} };
> -
> -int __init i915_global_request_init(void)
> +int __init i915_request_module_init(void)
>  {
> -       global.slab_requests =
> +       slab_requests =
>                 kmem_cache_create("i915_request",
>                                   sizeof(struct i915_request),
>                                   __alignof__(struct i915_request),
> @@ -2104,20 +2096,19 @@ int __init i915_global_request_init(void)
>                                   SLAB_RECLAIM_ACCOUNT |
>                                   SLAB_TYPESAFE_BY_RCU,
>                                   __i915_request_ctor);
> -       if (!global.slab_requests)
> +       if (!slab_requests)
>                 return -ENOMEM;
>
> -       global.slab_execute_cbs = KMEM_CACHE(execute_cb,
> +       slab_execute_cbs = KMEM_CACHE(execute_cb,
>                                              SLAB_HWCACHE_ALIGN |
>                                              SLAB_RECLAIM_ACCOUNT |
>                                              SLAB_TYPESAFE_BY_RCU);

Indentation is wrong here

With static and indentation fixed,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> -       if (!global.slab_execute_cbs)
> +       if (!slab_execute_cbs)
>                 goto err_requests;
>
> -       i915_global_register(&global.base);
>         return 0;
>
>  err_requests:
> -       kmem_cache_destroy(global.slab_requests);
> +       kmem_cache_destroy(slab_requests);
>         return -ENOMEM;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 717e5b292046..a79480f07f04 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -647,4 +647,7 @@ bool
>  i915_request_active_engine(struct i915_request *rq,
>                            struct intel_engine_cs **active);
>
> +void i915_request_module_exit(void);
> +int i915_request_module_init(void);
> +
>  #endif /* I915_REQUEST_H */
> --
> 2.32.0
>
