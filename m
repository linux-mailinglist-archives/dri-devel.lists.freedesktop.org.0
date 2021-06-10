Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA93A30B8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FAC6EDA4;
	Thu, 10 Jun 2021 16:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E036EDA7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:32:29 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id f84so252015ybg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eFMFB/fW63KwYo06221UXDneuh4KrJBz952h7gh85Nc=;
 b=oc1T1Ob75cS17GJVLj+5U0O327o6I5umFZMlOJD3Jsq/DLpXVshXtMng8fGvjL0N6/
 fDig9BZKXvSTY/XVITBnKd7VXlXseLmUq+1FqUHELmO+QKOcREznzqKWJY5BWP/kRMHv
 I2nJaw6I9wMoR131TgNgaK271+ECrTeHeIsdfoH+7I+YPbLJzhRYv/IeunYciGmQfZ9p
 EhjfDAR3NyFCInl3lGVBotOvePzhSQtAOZGsyX4bH90ogomJ1AE1Lfo8bkJuIELWh9cT
 uz5Z5iVhUTQWfWXYBRqPc/ZfPxGHvYm9+/7uFw/B7UiaB9SPrvICCu9qt0gkBtWivp0d
 GBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eFMFB/fW63KwYo06221UXDneuh4KrJBz952h7gh85Nc=;
 b=Dl/vuXAxoRiXVg+2qf0hbKGkkRV7n+y5+ihNBwckXVv5uUU0LJs7XB4wff1PhXl0nG
 yKZhCoEwjLfemo5zuII+mMLtJjq5KNL0amFH41L93n0/Jeu8TSc77yJYP/Swmd/HGJ9e
 co9N2ZEgd4Qt9VXrEt9GXxoFfk5bcQEz04WG3Xqd5qL2zo+mT0lsKclzmD8w+bRTlXDx
 S3EGUCPrRZuFZQooQuCLf/WqWf6IkeGSBoxjPiXL1suRiSQYBNL3tvpb+9LJ76n5vIKt
 LIVNfikSJpXeWl3LxbHnVpuV13eVFukKvB+pJAqO3KHhFL/RokhN5fvYgw1wtkbEyjcm
 eMAw==
X-Gm-Message-State: AOAM531bO+u3MQiM7OKmVrM7ODSOthRI39VR5gUrlTEicpCTED37XNtR
 EUfYBEYdG2OfJAC8z6t3cXO6LfD0ykGBn7YCaQUyGQ==
X-Google-Smtp-Source: ABdhPJxet+sZtoK5Q/gLxd3WMmqQE+Jshqm9f9UhLvHgNcgZP9QKv62l4OfGaK0DEKOYTC9JQXhy5wvGPYDw9eNKyI8=
X-Received: by 2002:a25:208b:: with SMTP id g133mr8075360ybg.211.1623342748455; 
 Thu, 10 Jun 2021 09:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-2-jason@jlekstrand.net>
 <0f63cba3-ec2f-c246-1375-5b1bced593f5@linux.intel.com>
 <CAOFGe957jdnhkYjROWSrVf0L+4FLrvBhnujXQaX18ZVjBt5CBw@mail.gmail.com>
 <eea9f930-3434-82ad-e5d9-d55bd8a8c6c0@linux.intel.com>
In-Reply-To: <eea9f930-3434-82ad-e5d9-d55bd8a8c6c0@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 11:32:17 -0500
Message-ID: <CAOFGe95E8NXUoNuK0M=3xDY1w7DNLOJ-7yVoRqn4cP3t8R6ThA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Move
 intel_engine_free_request_pool to i915_request.c
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 10:07 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> On 10/06/2021 14:57, Jason Ekstrand wrote:
> > On Thu, Jun 10, 2021 at 5:04 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> On 09/06/2021 22:29, Jason Ekstrand wrote:
> >>> This appears to break encapsulation by moving an intel_engine_cs
> >>> function to a i915_request file.  However, this function is
> >>> intrinsically tied to the lifetime rules and allocation scheme of
> >>> i915_request and having it in intel_engine_cs.c leaks details of
> >>> i915_request.  We have an abstraction leak either way.  Since
> >>> i915_request's allocation scheme is far more subtle than the simple
> >>> pointer that is intel_engine_cs.request_pool, it's probably better to
> >>> keep i915_request's details to itself.
> >>>
> >>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> >>> Cc: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: Matthew Auld <matthew.auld@intel.com>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> ---
> >>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c | 8 --------
> >>>    drivers/gpu/drm/i915/i915_request.c       | 7 +++++--
> >>>    drivers/gpu/drm/i915/i915_request.h       | 2 --
> >>>    3 files changed, 5 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> >>> index 9ceddfbb1687d..df6b80ec84199 100644
> >>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> >>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> >>> @@ -422,14 +422,6 @@ void intel_engines_release(struct intel_gt *gt)
> >>>        }
> >>>    }
> >>>
> >>> -void intel_engine_free_request_pool(struct intel_engine_cs *engine)
> >>> -{
> >>> -     if (!engine->request_pool)
> >>> -             return;
> >>> -
> >>> -     kmem_cache_free(i915_request_slab_cache(), engine->request_pool);
> >>
> >> Argument that the slab cache shouldn't be exported from i915_request.c
> >> sounds good to me.
> >>
> >> But I think step better than simply reversing the break of encapsulation
> >> (And it's even worse because it leaks much higher level object!) could
> >> be to export a freeing helper from i915_request.c, engine pool would
> >> then use:
> >>
> >> void __i915_request_free(...)
> >> {
> >>          kmem_cache_free(...);
> >> }
> >
> > That was what I did at first.  However, the semantics of how the
> > pointer is touched/modified are really also part of i915_request.  In
> > particular, the use of xchg and cmpxchg.  So I pulled the one other
> > access (besides NULL initializing) into i915_request.c which meant
> > pulling in intel_engine_free_request_pool.
>
> Hmmm in my view the only break of encapsulation at the moment is that
> intel_engine_cs.c knows requests have been allocated from a dedicated slab.
>
> Semantics of how the request pool pointer is managed, so xchg and
> cmpxchg, already are in i915_request.c so I don't exactly follow what is
> the problem with wrapping the knowledge on how requests should be freed
> inside i915_request.c as well?
>
> Unless you view the fact intel_engine_cs contains a pointer to
> i915_request a break as well? But even then... <continued below>
>
> > Really, if we wanted proper encapsulation here, we'd have
> >
> > struct i915_request_cache {
> >      struct i915_request *rq;
> > };
> >
> > void i915_request_cache_init(struct i915_request_cache *cache);
> > void i915_request_cache_finish(struct i915_request_cache *cache);
> >
> > all in i915_request.h and have all the gory details inside
> > i915_request.c.  Then all intel_engine_cs knows is that it has a > request cache.
>
> ... with this scheme you'd have intel_engine_cs contain a pointer to
> i915_request_cache,

No, it would contain an i915_request_cache, not a pointer to one.  It
wouldn't fundamentally change any data structures; just add wrapping.

> which does not seem particularly exciting
> improvement for me since wrapping would be extremely thin with no
> fundamental changes.

Yeah, it's not particularly exciting.

> So for me exporting new __i915_request_free() from i915_request.c makes
> things a bit better and I don't think we need to go further than that.

I'm not sure it's necessary either.  The thing that bothers me is that
we have this pointer that's clearly managed by i915_request.c but is
initialized and finished by intel_context_cs.c.  Certainly adding an
i915_request_free() is better than what we have today.  I'm not sure
it's enough better to really make me happy but, TBH, the whole request
cache thing is a bit of a mess....

> I mean there is the issue of i915_request.c knowing about engines having
> request pools, but I am not sure if with i915_request_cache you proposed
> to remove that knowledge and how?

It doesn't, really.  As long as we're stashing a request in the
engine, there's still an encapsulation problem no matter what we do.

>  From the design point of view, given request pool is used only for
> engine pm, clean design could be to manage this from engine pm. Like if
> parking cannot use GFP_KERNEL then check if unparking can and explicitly
> allocate a request from there to be consumed at parking time. It may
> require some splitting of the request creation path though. To allocate
> but not put it on the kernel timeline until park time.

And now we're getting to the heart of things. :-)  Daniel mentioned
this too.  Maybe if the real problem here is that engine parking can't
allocate memory, we need to just fix engine parking to either not
require an i915_request somehow or to do its own caching somehow.  I'm
going to look into this.

--Jason

> Regards,
>
> Tvrtko
>
> >
> > If we really want to go that far, we can, I suppose.
> >
> > --Jason
> >
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> -}
> >>> -
> >>>    void intel_engines_free(struct intel_gt *gt)
> >>>    {
> >>>        struct intel_engine_cs *engine;
> >>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> >>> index 1014c71cf7f52..48c5f8527854b 100644
> >>> --- a/drivers/gpu/drm/i915/i915_request.c
> >>> +++ b/drivers/gpu/drm/i915/i915_request.c
> >>> @@ -106,9 +106,12 @@ static signed long i915_fence_wait(struct dma_fence *fence,
> >>>                                 timeout);
> >>>    }
> >>>
> >>> -struct kmem_cache *i915_request_slab_cache(void)
> >>> +void intel_engine_free_request_pool(struct intel_engine_cs *engine)
> >>>    {
> >>> -     return global.slab_requests;
> >>> +     if (!engine->request_pool)
> >>> +             return;
> >>> +
> >>> +     kmem_cache_free(global.slab_requests, engine->request_pool);
> >>>    }
> >>>
> >>>    static void i915_fence_release(struct dma_fence *fence)
> >>> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> >>> index 270f6cd37650c..f84c38d29f988 100644
> >>> --- a/drivers/gpu/drm/i915/i915_request.h
> >>> +++ b/drivers/gpu/drm/i915/i915_request.h
> >>> @@ -300,8 +300,6 @@ static inline bool dma_fence_is_i915(const struct dma_fence *fence)
> >>>        return fence->ops == &i915_fence_ops;
> >>>    }
> >>>
> >>> -struct kmem_cache *i915_request_slab_cache(void);
> >>> -
> >>>    struct i915_request * __must_check
> >>>    __i915_request_create(struct intel_context *ce, gfp_t gfp);
> >>>    struct i915_request * __must_check
> >>>
