Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85664344FB1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 20:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC4B6E598;
	Mon, 22 Mar 2021 19:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17FC6E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 19:12:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id b7so23135818ejv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jk4yZz3Y8NbHfOukOwQ6v18UFw2FElNk3rSBBEUqq+k=;
 b=Xkwn02xxLNWUK20TB11kPlNLf6C9NO0zFzGwnF1PvOgPtiopEdDyoZsqOOisYIjukf
 3F9lcGYl1sIshP2GJ8yze/GGwEVwkXj1K9VBXe2eusfTuMVnMouE2kSXG5ZGPkG81fEW
 /iMwZh1P5dn/j9HuViqukKdKRuAL/jcsk0Fj3akQr8HlEqjRO7kIFthu0BUkBIzSmWzh
 Ju3ln80GTqdISzUCftU7vorMw3qmvroJOAf4/dWPW8l+Q2lgQwFhSYBiDEYtfsxqjUB7
 9zrZb0BQePeUGBaj8OabTDmCYHp+4I+wT+Kj4TqscDCaEo718YN9QT77Oy+dJp3yAyA/
 kpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jk4yZz3Y8NbHfOukOwQ6v18UFw2FElNk3rSBBEUqq+k=;
 b=POI7SM3FK8uVFueRaRDj71RfqJwedtG+eTpF/4/iXw5XSt7ozBZOt3kioRpdGaMC3+
 xFcIst1yR/zJ78NA4/0JOwPLjo2oql9QkbGnCazc2PuOp5huLvHjierYhJHiEVY2Fnxu
 Bkd59YdhnDvtbyPZGZEu/pEvRcAUVK+XIApRuKS581ROPKv9vIdL6+tcwnfeRyZxqaQ6
 y38ffyBnLT0uZ2QG/KVokJOjrMziSljN5X3u4qOt4WPGMVz+FTOJNrU4D/HpMXEtOIrR
 8Dfrjpk1Ad8yzOV7RPRWMluPf5bWn6RgcY7dVYlQbC7uJEOaq2aC8cBqi1BGZdoKY+ll
 xfQg==
X-Gm-Message-State: AOAM533HsUpVyaEZ/GSrQ8edf7f33trIZjIzPToxe6q3PJS7Vhht9o8o
 dWePKuxdlwyOWKRcIpT1JCbAuozJken41MV2k5ZMyQ==
X-Google-Smtp-Source: ABdhPJxxLzvf4gzJmEzUIBQP34I9nsWiZDhFIQUR4ra5vyPoAJgAoJrOhOoOTjHVCVFRTYRtWcWfakMu1h0SOSgjwfs=
X-Received: by 2002:a17:907:7683:: with SMTP id
 jv3mr1280435ejc.450.1616440378205; 
 Mon, 22 Mar 2021 12:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-5-jason@jlekstrand.net>
 <YFjM8wM45DiUclYS@phenom.ffwll.local>
In-Reply-To: <YFjM8wM45DiUclYS@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 14:12:46 -0500
Message-ID: <CAOFGe94As67a__oJW7fHrRjKxmkcAriW8Oby9QhxYUZChhXA2w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with
 a syncobj
To: Daniel Vetter <daniel@ffwll.ch>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 11:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Mar 19, 2021 at 05:38:56PM -0500, Jason Ekstrand wrote:
> > I'd love to delete the SINGLE_TIMELINE API because it leaks an
> > implementation detail of contexts through to the API and is something
> > that userspace can do itself, trivially.  Unfortunately, it's used by
> > the media driver so we can't do that.  We can, however, do the next-best
> > thing which is to embed a syncobj in the context and do exactly what
> > we'd expect from userspace internally.
> >
> > This has a couple of advantages.  One is that we're no longer leaking a
> > detail of the current execlist scheduler which will be problematic when
> > we try to add GuC scheduling.  Second is that, together with deleting
> > the CLONE_CONTEXT API, we should now have a 1:1 mapping between
> > intel_context and intel_timeline which should make some of our locking
> > mess a bit easier.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 47 ++++---------------
> >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  8 +++-
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++++
> >  3 files changed, 32 insertions(+), 38 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index f88bac19333ec..e094f4a1ca4cd 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -67,6 +67,8 @@
> >  #include <linux/log2.h>
> >  #include <linux/nospec.h>
> >
> > +#include <drm/drm_syncobj.h>
> > +
> >  #include "gt/gen6_ppgtt.h"
> >  #include "gt/intel_context.h"
> >  #include "gt/intel_engine_heartbeat.h"
> > @@ -224,10 +226,6 @@ static void intel_context_set_gem(struct intel_context *ce,
> >               ce->vm = vm;
> >       }
> >
> > -     GEM_BUG_ON(ce->timeline);
> > -     if (ctx->timeline)
> > -             ce->timeline = intel_timeline_get(ctx->timeline);
> > -
> >       if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> >           intel_engine_has_timeslices(ce->engine))
> >               __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> > @@ -344,8 +342,8 @@ void i915_gem_context_release(struct kref *ref)
> >       mutex_destroy(&ctx->engines_mutex);
> >       mutex_destroy(&ctx->lut_mutex);
> >
> > -     if (ctx->timeline)
> > -             intel_timeline_put(ctx->timeline);
> > +     if (ctx->syncobj)
> > +             drm_syncobj_put(ctx->syncobj);
> >
> >       put_pid(ctx->pid);
> >       mutex_destroy(&ctx->mutex);
> > @@ -790,33 +788,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
> >               i915_vm_close(vm);
> >  }
> >
> > -static void __set_timeline(struct intel_timeline **dst,
> > -                        struct intel_timeline *src)
> > -{
> > -     struct intel_timeline *old = *dst;
> > -
> > -     *dst = src ? intel_timeline_get(src) : NULL;
> > -
> > -     if (old)
> > -             intel_timeline_put(old);
> > -}
> > -
> > -static void __apply_timeline(struct intel_context *ce, void *timeline)
> > -{
> > -     __set_timeline(&ce->timeline, timeline);
> > -}
> > -
> > -static void __assign_timeline(struct i915_gem_context *ctx,
> > -                           struct intel_timeline *timeline)
> > -{
> > -     __set_timeline(&ctx->timeline, timeline);
> > -     context_apply_all(ctx, __apply_timeline, timeline);
> > -}
> > -
> >  static struct i915_gem_context *
> >  i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >  {
> >       struct i915_gem_context *ctx;
> > +     int ret;
> >
> >       if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> >           !HAS_EXECLISTS(i915))
> > @@ -845,16 +821,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >       }
> >
> >       if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > -             struct intel_timeline *timeline;
> > -
> > -             timeline = intel_timeline_create(&i915->gt);
> > -             if (IS_ERR(timeline)) {
> > +             ret = drm_syncobj_create(&ctx->syncobj,
> > +                                      DRM_SYNCOBJ_CREATE_SIGNALED,
> > +                                      NULL);
> > +             if (ret) {
> >                       context_close(ctx);
> > -                     return ERR_CAST(timeline);
> > +                     return ERR_PTR(ret);
> >               }
> > -
> > -             __assign_timeline(ctx, timeline);
> > -             intel_timeline_put(timeline);
> >       }
> >
> >       trace_i915_context_create(ctx);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > index 676592e27e7d2..8a5fdd163b79d 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > @@ -83,7 +83,13 @@ struct i915_gem_context {
> >       struct i915_gem_engines __rcu *engines;
> >       struct mutex engines_mutex; /* guards writes to engines */
> >
> > -     struct intel_timeline *timeline;
> > +     /**
> > +      * @syncobj: Shared timeline syncobj
> > +      *
> > +      * When the SHARED_TIMELINE flag is set on context creation, this
> > +      * provides automatic implicit synchronization across all engines.
>
> I think we should explain a bit more what this actually does, i.e. emulate
> it using a syncobj, but unlike the real timeline it does not make any
> total order guarantees. Since userspace doesn't expect that.

New comment:

    /**
     * @syncobj: Shared timeline syncobj
     *
     * When the SHARED_TIMELINE flag is set on context creation, we
     * emulate a single timeline across all engines using this syncobj.
     * For every execbuffer2 call, this syncobj is used as both an in-
     * and out-fence.  Unlike the real intel_timeline, this doesn't
     * provide perfect atomic in-order guarantees if the client races
     * with itself by calling execbuffer2 twice concurrently.  However,
     * if userspace races with itself, that's not likely to yield well-
     * defined results anyway so we choose to not care.
     */

> > +      */
> > +     struct drm_syncobj *syncobj;
> >
> >       /**
> >        * @vm: unique address space (GTT)
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 96403130a373d..2c56796f6a71b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -3295,6 +3295,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >               goto err_vma;
> >       }
> >
> > +     if (eb.gem_context->syncobj) {
>
> I think would be good to wrap these in unlikely, least also because it's
> nice documentation.

Done.

> -Daniel
>
>
> > +             struct dma_fence *fence;
> > +
> > +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> > +             err = i915_request_await_dma_fence(eb.request, fence);
> > +             if (err)
> > +                     goto err_ext;
> > +     }
> > +
> >       if (in_fence) {
> >               if (args->flags & I915_EXEC_FENCE_SUBMIT)
> >                       err = i915_request_await_execution(eb.request,
> > @@ -3351,6 +3360,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >                       fput(out_fence->file);
> >               }
> >       }
> > +
> > +     if (eb.gem_context->syncobj) {
> > +             drm_syncobj_replace_fence(eb.gem_context->syncobj,
> > +                                       &eb.request->fence);
> > +     }
> > +
> >       i915_request_put(eb.request);
> >
> >  err_vma:
> > --
> > 2.29.2
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
