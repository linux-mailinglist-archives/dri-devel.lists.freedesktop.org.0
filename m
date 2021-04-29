Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2D36EC99
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268846EEB7;
	Thu, 29 Apr 2021 14:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8EF6EEB4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:47:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u21so100313817ejo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4kju/K1gzFoMOadG+b/UQFjFm4QErJpsP91rCku5UI=;
 b=ST2forYtcRzOFumu5kaHRRmVKq7p2MmRImfMZpKafnlMJHh5nmNuImyctxuhzddPcP
 NjFndOlPQ17a2ZOg+cNlhtwYYKQRZmvvdkj8a/XFYRPyqXHihOgcNhXTl3UTDWyahaCz
 VkkXJNeWFRzTSlqJNENLCi16VVoRW7OxPwIhhWxJHuQU+5ZZ7iMKL+Ev/SKMO/ecBbc6
 LlU/+R50A9QI17OvERhUPqCCArZExlxqTNOSUcTMJA5m8RizC8l0pcWdlOFl8ho2dcG1
 aZ7z+f7kk+moq753/hF+suRrKCWuNt++vN6TQfAtq+l3EduoML5E8/QIg4dzoECY5fAr
 yOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4kju/K1gzFoMOadG+b/UQFjFm4QErJpsP91rCku5UI=;
 b=dIy4O2YMHI4E8HqvPvz0g5usWCrKR1DwogC/gX1je8lniNVdKMVMxOD9kD4tT2b2sX
 yo+aZAyOGYhhjbSLH4bpxydmnZvsLZ8UA+1Bo2PNW8W/MBFwS5fHDhRO8oyff5EnV+yh
 MtYyi++SBv2heDMIC7+viJHg+IvFJGO1jB9hP3yG50YRSGtx5YCTMlv5vV7AtArZOHJv
 m7sBmH/6T7O5RyI0NdlNVEKTa3y5mwmhCmfDoZM5NZbnjmzjSsPolpT9rOjgN+3pf+iV
 9b65bNy9ShxABZzH0J0LefGnevlMEzwXxC7pkd3kRLu96JEZXXB6gjW6Sy99wUGjK4FO
 GsYw==
X-Gm-Message-State: AOAM530L7/WIcKWryEa8QPprTLZmwnAZG5Qpt1Hob1pgJU1K7qMLqCQM
 1fqI/BamcD3fFzn5ae44S3WI6hKpZQPVB/1mNJQn1A==
X-Google-Smtp-Source: ABdhPJwnwA7ZpV55bDxeZNqlXF1lcj6TQaKeRP7uKA7mjBO+pQYDAnGXk+CoKequP6RUOlwQ8y7enH+abUmjV+TCD18=
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr194103ejb.175.1619707665296; 
 Thu, 29 Apr 2021 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-7-jason@jlekstrand.net>
 <a1561dbe-a109-9a1d-df1d-bf91fd67e3f6@linux.intel.com>
 <CAOFGe96wvRvxKMczMwfJL7naQZs1tp9owj7xte9+0QnhxVEhag@mail.gmail.com>
 <4d16e4ec-2167-965d-12a5-6b766a2a110a@linux.intel.com>
 <YIqh1jIovYGKtkeu@phenom.ffwll.local>
In-Reply-To: <YIqh1jIovYGKtkeu@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 09:47:33 -0500
Message-ID: <CAOFGe94aK79LzaoMG9Mac2SkDPt8SWHsOo_puQkd7MxBhdefqw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 06/21] drm/i915: Implement SINGLE_TIMELINE
 with a syncobj (v3)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 7:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 29, 2021 at 09:06:47AM +0100, Tvrtko Ursulin wrote:
> >
> > On 28/04/2021 18:26, Jason Ekstrand wrote:
> > > On Wed, Apr 28, 2021 at 10:49 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > >
> > > >
> > > > On 23/04/2021 23:31, Jason Ekstrand wrote:
> > > > > This API is entirely unnecessary and I'd love to get rid of it.  If
> > > > > userspace wants a single timeline across multiple contexts, they can
> > > > > either use implicit synchronization or a syncobj, both of which existed
> > > > > at the time this feature landed.  The justification given at the time
> > > > > was that it would help GL drivers which are inherently single-timeline.
> > > > > However, neither of our GL drivers actually wanted the feature.  i965
> > > > > was already in maintenance mode at the time and iris uses syncobj for
> > > > > everything.
> > > > >
> > > > > Unfortunately, as much as I'd love to get rid of it, it is used by the
> > > > > media driver so we can't do that.  We can, however, do the next-best
> > > > > thing which is to embed a syncobj in the context and do exactly what
> > > > > we'd expect from userspace internally.  This isn't an entirely identical
> > > > > implementation because it's no longer atomic if userspace races with
> > > > > itself by calling execbuffer2 twice simultaneously from different
> > > > > threads.  It won't crash in that case; it just doesn't guarantee any
> > > > > ordering between those two submits.
> > > >
> > > > 1)
> > > >
> > > > Please also mention the difference in context/timeline name when
> > > > observed via the sync file API.
> > > >
> > > > 2)
> > > >
> > > > I don't remember what we have concluded in terms of observable effects
> > > > in sync_file_merge?
> > >
> > > I don't see how either of these are observable since this syncobj is
> > > never exposed to userspace in any way.  Please help me understand what
> > > I'm missing here.
> >
> > Single timeline context - two execbufs - return two out fences.
> >
> > Before the patch those two had the same fence context, with the patch they
> > have different ones.
> >
> > Fence context is visible to userspace via sync file info (timeline name at
> > least) and rules in sync_file_merge.

Thanks!  How about adding this to the commit message:

It also means that sync files exported from different engines on a
SINGLE_TIMELINE context will have different fence contexts.  This is
visible to userspace if it looks at the obj_name field of
sync_fence_info.

I don't think sync_file_merge is significantly affected.  If there are
ever multiple fences in a sync_file, it gets a driver name of
"dma_fence_array" and an object name of "unbound".

--Jason

> Good point worth mentioninig in the commit message.
>
> media-driver doesn't use any of this in combination with single_timeline,
> so we just dont care.
> -Daniel
>
> >
> > Regards,
> >
> > Tvrtko
> >
> > >
> > > --Jason
> > >
> > >
> > > > Regards,
> > > >
> > > > Tvrtko
> > > >
> > > > > Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
> > > > > advantages beyond mere annoyance.  One is that intel_timeline is no
> > > > > longer an api-visible object and can remain entirely an implementation
> > > > > detail.  This may be advantageous as we make scheduler changes going
> > > > > forward.  Second is that, together with deleting the CLONE_CONTEXT API,
> > > > > we should now have a 1:1 mapping between intel_context and
> > > > > intel_timeline which may help us reduce locking.
> > > > >
> > > > > v2 (Jason Ekstrand):
> > > > >    - Update the comment on i915_gem_context::syncobj to mention that it's
> > > > >      an emulation and the possible race if userspace calls execbuffer2
> > > > >      twice on the same context concurrently.
> > > > >    - Wrap the checks for eb.gem_context->syncobj in unlikely()
> > > > >    - Drop the dma_fence reference
> > > > >    - Improved commit message
> > > > >
> > > > > v3 (Jason Ekstrand):
> > > > >    - Move the dma_fence_put() to before the error exit
> > > > >
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 49 +++++--------------
> > > > >    .../gpu/drm/i915/gem/i915_gem_context_types.h | 14 +++++-
> > > > >    .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 16 ++++++
> > > > >    3 files changed, 40 insertions(+), 39 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > index 2c2fefa912805..a72c9b256723b 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > @@ -67,6 +67,8 @@
> > > > >    #include <linux/log2.h>
> > > > >    #include <linux/nospec.h>
> > > > >
> > > > > +#include <drm/drm_syncobj.h>
> > > > > +
> > > > >    #include "gt/gen6_ppgtt.h"
> > > > >    #include "gt/intel_context.h"
> > > > >    #include "gt/intel_context_param.h"
> > > > > @@ -225,10 +227,6 @@ static void intel_context_set_gem(struct intel_context *ce,
> > > > >                ce->vm = vm;
> > > > >        }
> > > > >
> > > > > -     GEM_BUG_ON(ce->timeline);
> > > > > -     if (ctx->timeline)
> > > > > -             ce->timeline = intel_timeline_get(ctx->timeline);
> > > > > -
> > > > >        if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > > > >            intel_engine_has_timeslices(ce->engine))
> > > > >                __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> > > > > @@ -351,9 +349,6 @@ void i915_gem_context_release(struct kref *ref)
> > > > >        mutex_destroy(&ctx->engines_mutex);
> > > > >        mutex_destroy(&ctx->lut_mutex);
> > > > >
> > > > > -     if (ctx->timeline)
> > > > > -             intel_timeline_put(ctx->timeline);
> > > > > -
> > > > >        put_pid(ctx->pid);
> > > > >        mutex_destroy(&ctx->mutex);
> > > > >
> > > > > @@ -570,6 +565,9 @@ static void context_close(struct i915_gem_context *ctx)
> > > > >        if (vm)
> > > > >                i915_vm_close(vm);
> > > > >
> > > > > +     if (ctx->syncobj)
> > > > > +             drm_syncobj_put(ctx->syncobj);
> > > > > +
> > > > >        ctx->file_priv = ERR_PTR(-EBADF);
> > > > >
> > > > >        /*
> > > > > @@ -765,33 +763,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
> > > > >                i915_vm_close(vm);
> > > > >    }
> > > > >
> > > > > -static void __set_timeline(struct intel_timeline **dst,
> > > > > -                        struct intel_timeline *src)
> > > > > -{
> > > > > -     struct intel_timeline *old = *dst;
> > > > > -
> > > > > -     *dst = src ? intel_timeline_get(src) : NULL;
> > > > > -
> > > > > -     if (old)
> > > > > -             intel_timeline_put(old);
> > > > > -}
> > > > > -
> > > > > -static void __apply_timeline(struct intel_context *ce, void *timeline)
> > > > > -{
> > > > > -     __set_timeline(&ce->timeline, timeline);
> > > > > -}
> > > > > -
> > > > > -static void __assign_timeline(struct i915_gem_context *ctx,
> > > > > -                           struct intel_timeline *timeline)
> > > > > -{
> > > > > -     __set_timeline(&ctx->timeline, timeline);
> > > > > -     context_apply_all(ctx, __apply_timeline, timeline);
> > > > > -}
> > > > > -
> > > > >    static struct i915_gem_context *
> > > > >    i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > > > >    {
> > > > >        struct i915_gem_context *ctx;
> > > > > +     int ret;
> > > > >
> > > > >        if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> > > > >            !HAS_EXECLISTS(i915))
> > > > > @@ -820,16 +796,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> > > > >        }
> > > > >
> > > > >        if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> > > > > -             struct intel_timeline *timeline;
> > > > > -
> > > > > -             timeline = intel_timeline_create(&i915->gt);
> > > > > -             if (IS_ERR(timeline)) {
> > > > > +             ret = drm_syncobj_create(&ctx->syncobj,
> > > > > +                                      DRM_SYNCOBJ_CREATE_SIGNALED,
> > > > > +                                      NULL);
> > > > > +             if (ret) {
> > > > >                        context_close(ctx);
> > > > > -                     return ERR_CAST(timeline);
> > > > > +                     return ERR_PTR(ret);
> > > > >                }
> > > > > -
> > > > > -             __assign_timeline(ctx, timeline);
> > > > > -             intel_timeline_put(timeline);
> > > > >        }
> > > > >
> > > > >        trace_i915_context_create(ctx);
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > index 676592e27e7d2..df76767f0c41b 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > @@ -83,7 +83,19 @@ struct i915_gem_context {
> > > > >        struct i915_gem_engines __rcu *engines;
> > > > >        struct mutex engines_mutex; /* guards writes to engines */
> > > > >
> > > > > -     struct intel_timeline *timeline;
> > > > > +     /**
> > > > > +      * @syncobj: Shared timeline syncobj
> > > > > +      *
> > > > > +      * When the SHARED_TIMELINE flag is set on context creation, we
> > > > > +      * emulate a single timeline across all engines using this syncobj.
> > > > > +      * For every execbuffer2 call, this syncobj is used as both an in-
> > > > > +      * and out-fence.  Unlike the real intel_timeline, this doesn't
> > > > > +      * provide perfect atomic in-order guarantees if the client races
> > > > > +      * with itself by calling execbuffer2 twice concurrently.  However,
> > > > > +      * if userspace races with itself, that's not likely to yield well-
> > > > > +      * defined results anyway so we choose to not care.
> > > > > +      */
> > > > > +     struct drm_syncobj *syncobj;
> > > > >
> > > > >        /**
> > > > >         * @vm: unique address space (GTT)
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > index b812f313422a9..d640bba6ad9ab 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > > @@ -3460,6 +3460,16 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> > > > >                goto err_vma;
> > > > >        }
> > > > >
> > > > > +     if (unlikely(eb.gem_context->syncobj)) {
> > > > > +             struct dma_fence *fence;
> > > > > +
> > > > > +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> > > > > +             err = i915_request_await_dma_fence(eb.request, fence);
> > > > > +             dma_fence_put(fence);
> > > > > +             if (err)
> > > > > +                     goto err_ext;
> > > > > +     }
> > > > > +
> > > > >        if (in_fence) {
> > > > >                if (args->flags & I915_EXEC_FENCE_SUBMIT)
> > > > >                        err = i915_request_await_execution(eb.request,
> > > > > @@ -3517,6 +3527,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> > > > >                        fput(out_fence->file);
> > > > >                }
> > > > >        }
> > > > > +
> > > > > +     if (unlikely(eb.gem_context->syncobj)) {
> > > > > +             drm_syncobj_replace_fence(eb.gem_context->syncobj,
> > > > > +                                       &eb.request->fence);
> > > > > +     }
> > > > > +
> > > > >        i915_request_put(eb.request);
> > > > >
> > > > >    err_vma:
> > > > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
