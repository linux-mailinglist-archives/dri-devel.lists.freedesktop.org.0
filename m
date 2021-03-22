Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B7344ABA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418AB6E511;
	Mon, 22 Mar 2021 16:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ACE6E511
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:11:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a7so22204086ejs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DjYPBOOahJ8c3zU7KYhqFZJmQGp+S8qZptKZS48ZJss=;
 b=fEEwGBnc97K9SN6PMRui79wdun68C8VBIiUdEz972zdYlLfwYiQ2FZvvPkRvGCwygI
 jFj1JYK0BresSIjCZe8ohUT1Jdo1jXpj5YiodQJIsb6UzefrfbgH+QnXHJajrQwsKY/k
 2Bn325g28BnjoTaRcjPzO0Pwq61qlXEOjmHnq5cj1qZWzlQl594VwpE6EAN+yRv6Is3y
 OU4a5HZgsD5AJdpR51gZs4Knz5v6uFFZbZEIBXLf1UI5i0aubcqqNpZ5M/ycWhDt/3Xn
 HRMeSaPaNt1qbJeWpndwA7LAU+ailsx5+U1zZABOoDeJKMdRC70Pie0fyvA4ApGQilll
 4pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjYPBOOahJ8c3zU7KYhqFZJmQGp+S8qZptKZS48ZJss=;
 b=iANJhI+CPlGXN6v5uqHFCWqhLY0XK66mvuMafu8fxc6BDe2/OhAp0O6GwyHKVznbQu
 2qXf3dN4CKkv/3xXzhMyv8eb6HmUZr5NIaA2f7Zu/0xokpICrB5zVeI2lFT+7uVOkpwG
 nTvyg97oXrkQhDajuyhLhIWY4eLnM/g7f5fK3W5GufOCS6r4KKXJ2iTaRj2V6HpAtMqQ
 QrZ4m9ywpbHCJKvS+SAT5YZKkjvuZVaO7AWYxxEbO0607jgfXFgs911/9dLiJQFhlsya
 B624h9TZeX50Bdi4gFllz7uzMYvtAeO1g/Ik8nt0RkgvPbW9V//BicXrVOriIKyR9Asu
 6wig==
X-Gm-Message-State: AOAM532z88Mp7BmLpPBfRtOQvbYEpA8ZTDeKEYKnhRRUtrIxr9wCq0dy
 nG07U/iVu0Qewj7EYhmlhS22wRrbgPeqLg2DCxCphA==
X-Google-Smtp-Source: ABdhPJxe7ZHi0vTFmBd708WQKeaKjr/lhmgU6PP7v9jBU7dCdu/mRH2afxupGiJc8L4iC9E4kIahEpfg75097IKyHic=
X-Received: by 2002:a17:906:3c50:: with SMTP id
 i16mr522439ejg.175.1616429467464; 
 Mon, 22 Mar 2021 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-5-jason@jlekstrand.net>
 <b462561b-6340-fdf3-6b1a-e0370bfe090c@linux.intel.com>
In-Reply-To: <b462561b-6340-fdf3-6b1a-e0370bfe090c@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 11:10:56 -0500
Message-ID: <CAOFGe97y67n4EPb6745QsJdz=ERMn3K-gsLR8Qjmemp92nwMoQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with
 a syncobj
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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

On Mon, Mar 22, 2021 at 7:28 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 19/03/2021 22:38, Jason Ekstrand wrote:
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
>
> Narrative needs to be corrected as with the previous patch.
>
> > the CLONE_CONTEXT API, we should now have a 1:1 mapping between
> > intel_context and intel_timeline which should make some of our locking
> > mess a bit easier.
>
> Mess or complexity? Could you expand with some details so it's easier to
> understand? (I am thinking what gets easier, how and why, if this is done.)

Both?  I guess "complexity" is a less abrasive way of stating it.
I've not dug into the actual refactor yet but we should be able to
drop the whole RCU business on intel_timeline that we have right now
just to facilitate sharing like this.  Fewer objects that are shared
deep inside i915 with their own locks and RCUs seems like an advantage
to me.  Especially when we already have nice generic infrastructure
for this.

> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 47 ++++---------------
> >   .../gpu/drm/i915/gem/i915_gem_context_types.h |  8 +++-
> >   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++++
> >   3 files changed, 32 insertions(+), 38 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index f88bac19333ec..e094f4a1ca4cd 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -67,6 +67,8 @@
> >   #include <linux/log2.h>
> >   #include <linux/nospec.h>
> >
> > +#include <drm/drm_syncobj.h>
> > +
> >   #include "gt/gen6_ppgtt.h"
> >   #include "gt/intel_context.h"
> >   #include "gt/intel_engine_heartbeat.h"
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
> >   }
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
> >   static struct i915_gem_context *
> >   i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >   {
> >       struct i915_gem_context *ctx;
> > +     int ret;
> >
> >       if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> >           !HAS_EXECLISTS(i915))
> > @@ -845,16 +821,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >       }
> >
> >       if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
>
> If removal works out I would suggest deprecating the flag starting from
> some future platform. Maybe for GT gen greater than 12 you could already
> start rejecting in order to future proof.
>
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
> > +             struct dma_fence *fence;
> > +
> > +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
>
> Who drops this reference?

i915_request_await_dma_fence() below consumes a reference.

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
> >   err_vma:
> >
>
> So essentially moving the synchronisation to top level which is extra
> work, but given limited and questionable usage of the uapi may be
> acceptable. Need full picture on motivation to understand.

For one thing, the GuC scheduler doesn't natively have a concept of
"timelines" which can be shared like this.  To work with the GuC
scheduler as currently proposed in DII, they've asked the media driver
to stop using this flag in favor of passing a sync file from batch to
batch.  If we want to slide GuC scheduling in smoothly, we've got to
keep it working.  This means either making timelines a concept there
or doing an emulation like this.

> Semantics are also not 1:1 since dma fence context will be different.

Could you elaborate?

--Jason

> So
> not fully single timeline as so far, but just implicitly serialised
> execution. Again due limited usage this may not be a problem. Worth
> spelling out in the commit message though.
>
> Regards,
>
> Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
