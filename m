Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A43A2D73
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BA66ED26;
	Thu, 10 Jun 2021 13:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045056ED20
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:50:30 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id f84so40947583ybg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cr16b0jZ5BytBt5VBlKPdRVYyLjU4xIOL05sQ47zwWg=;
 b=xT9R3eABeAQDgMkCsk9DfnYdZ16CMH6hX4UjbuQFDF3ayDd9Z7BbFo3gnDlfxGRA2v
 ShKZOtf7HDPGsB+j+JphMvjnUAUuSMaIysIXxDVaTFyAxkifeiiTTnTQNgKY6U5371KG
 Etiwe0RkC+wyX3mOUsGlcsald7KzA3HOZibyHl0L1UMo5K2UvIJ67Y3u/CrbfBhZXXGO
 TcbXDDANo3oRoIqCvYFMYmCXr6n2/sYLGicmwjKdsn4d9Uzj0dfIApb2kAnn5Pdgof6k
 qspa486rh4dekS8Xw5BoyH7W+bXIegTUZWQoEmGiDwdpSfWRhgDnLB9QT5X25ADiJi1P
 t/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cr16b0jZ5BytBt5VBlKPdRVYyLjU4xIOL05sQ47zwWg=;
 b=rrZjyIId6THQaNGOe5ML+Ic/w+Dsfz8WXSKdUgkE2Itv+Gply1bYTN09/SGynoygri
 SJ8dvQnejOKBIQGkQJMZeSMA3xlJccuLx+ovDyG9bGEEVm80dTShuJngUsaV5LcG3R9u
 GzpoM89EB9XhJizWYSIbds49xu5miigUTcXGJqp/KkbuwsM2bMdRwAaLmqiOySFpwA2i
 DNZPNrgKtQsSlvcsCVCHHFiuKlxSLaWZYpFRHihlCh+RrTP6XT0/oYY3c2gAjAbbWHme
 4HS+g525hA3SvZpWn/JdBZkAC7Os5aL1Gac9c7WoI3yPn56W2js0xqwztwH3TbAE5Pq1
 jNYg==
X-Gm-Message-State: AOAM531FQYCp9eSuQNgkABkwVX9Clhs7R0utBu5JaMQZ8982do4cwIy7
 1393KUaMF/KNqiZV1zC+gSj20unDEYqndTXNygo+2A==
X-Google-Smtp-Source: ABdhPJzd/RuKitswbt/DJnx218MR2dG4qlJhwHRkYC4ACjD+MJWkemojoiZM8kJAmt9J6vFqZZPdQpKVfitmWJRHzN8=
X-Received: by 2002:a25:208b:: with SMTP id g133mr7089164ybg.211.1623333029169; 
 Thu, 10 Jun 2021 06:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-3-jason@jlekstrand.net>
 <2902ebcf-ec60-fdd3-2e61-a113bca835fd@linux.intel.com>
In-Reply-To: <2902ebcf-ec60-fdd3-2e61-a113bca835fd@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 08:50:18 -0500
Message-ID: <CAOFGe96veQrGw7024cEeXAw8X-3-7WTjUpmtpFadtQg6xRLTCA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915: Use a simpler scheme for
 caching i915_request
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

On Thu, Jun 10, 2021 at 5:08 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 09/06/2021 22:29, Jason Ekstrand wrote:
> > Instead of attempting to recycle a request in to the cache when it
> > retires, stuff a new one in the cache every time we allocate a request
> > for some other reason.
>
> I supposed the "why?" is "simpler scheme" - but in what way it is simpler?

Maybe it's not simpler?  One way in which it's simpler is that it
doesn't require funny logic to try and figure out whether or not it's
on a virtual engine.  Everyone gets a request pool.  Done.

Back to the "why".  First, in my tome of a e-mail I just sent about
dma_fence_get_rcu_safe() I mentioned that SLAB_TYPESAFE_BY_RCU isn't
the only way you can end up with a recycled object where you don't
want one.  Any caching mechanism that isn't sufficiently careful can
result in such recycled objects.  In particular, this one can because
we don't wait for an RCU grace period before stuffing the newly
released fence into request_pool.

The other reason why I like this one better is that, if any request
has been created for this engine since the last time request_pool was
set to NULL, then we've attempted to re-fill request_pool.  This is
different from the current behavior where request_pool only gets
refilled if something has retired since the last time it was set to
NULL.  AFAIUI, the fence pool is primarily used for switching to a
kernel context for PM/MM stuff.  That's only ever going to happen if a
request has been submitted from userspace since the last time we did
it and hence a fence is sitting there in the request_pool.  While it's
not 100% guaranteed, this should mean memory allocation failures on
that path are less likely than with the fill-on-release scheme.  No, I
don't have numbers on this.

> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_request.c | 66 ++++++++++++++---------------
> >   1 file changed, 31 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 48c5f8527854b..e531c74f0b0e2 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -128,41 +128,6 @@ static void i915_fence_release(struct dma_fence *fence)
> >       i915_sw_fence_fini(&rq->submit);
> >       i915_sw_fence_fini(&rq->semaphore);
> >
> > -     /*
> > -      * Keep one request on each engine for reserved use under mempressure
> > -      *
> > -      * We do not hold a reference to the engine here and so have to be
> > -      * very careful in what rq->engine we poke. The virtual engine is
> > -      * referenced via the rq->context and we released that ref during
> > -      * i915_request_retire(), ergo we must not dereference a virtual
> > -      * engine here. Not that we would want to, as the only consumer of
> > -      * the reserved engine->request_pool is the power management parking,
> > -      * which must-not-fail, and that is only run on the physical engines.
> > -      *
> > -      * Since the request must have been executed to be have completed,
> > -      * we know that it will have been processed by the HW and will
> > -      * not be unsubmitted again, so rq->engine and rq->execution_mask
> > -      * at this point is stable. rq->execution_mask will be a single
> > -      * bit if the last and _only_ engine it could execution on was a
> > -      * physical engine, if it's multiple bits then it started on and
> > -      * could still be on a virtual engine. Thus if the mask is not a
> > -      * power-of-two we assume that rq->engine may still be a virtual
> > -      * engine and so a dangling invalid pointer that we cannot dereference
> > -      *
> > -      * For example, consider the flow of a bonded request through a virtual
> > -      * engine. The request is created with a wide engine mask (all engines
> > -      * that we might execute on). On processing the bond, the request mask
> > -      * is reduced to one or more engines. If the request is subsequently
> > -      * bound to a single engine, it will then be constrained to only
> > -      * execute on that engine and never returned to the virtual engine
> > -      * after timeslicing away, see __unwind_incomplete_requests(). Thus we
> > -      * know that if the rq->execution_mask is a single bit, rq->engine
> > -      * can be a physical engine with the exact corresponding mask.
> > -      */
> > -     if (is_power_of_2(rq->execution_mask) &&
> > -         !cmpxchg(&rq->engine->request_pool, NULL, rq))
> > -             return;
> > -
> >       kmem_cache_free(global.slab_requests, rq);
> >   }
> >
> > @@ -869,6 +834,29 @@ static void retire_requests(struct intel_timeline *tl)
> >                       break;
> >   }
> >
> > +static void
> > +ensure_cached_request(struct i915_request **rsvd, gfp_t gfp)
> > +{
> > +     struct i915_request *rq;
> > +
> > +     /* Don't try to add to the cache if we don't allow blocking.  That
> > +      * just increases the chance that the actual allocation will fail.
> > +      */
>
> Linus has been known to rant passionately against this comment style so
> we actively try to never use it.

What comment style?  It's a comment.  You'll need to be more specific.

--Jason

> Rega4rds,
>
> Tvrtko
>
> > +     if (gfpflags_allow_blocking(gfp))
> > +             return;
> > +
> > +     if (READ_ONCE(rsvd))
> > +             return;
> > +
> > +     rq = kmem_cache_alloc(global.slab_requests,
> > +                           gfp | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > +     if (!rq)
> > +             return; /* Oops but nothing we can do */
> > +
> > +     if (cmpxchg(rsvd, NULL, rq))
> > +             kmem_cache_free(global.slab_requests, rq);
> > +}
> > +
> >   static noinline struct i915_request *
> >   request_alloc_slow(struct intel_timeline *tl,
> >                  struct i915_request **rsvd,
> > @@ -937,6 +925,14 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
> >       /* Check that the caller provided an already pinned context */
> >       __intel_context_pin(ce);
> >
> > +     /* Before we do anything, try to make sure we have at least one
> > +      * request in the engine's cache.  If we get here with GPF_NOWAIT
> > +      * (this can happen when switching to a kernel context), we we want
> > +      * to try very hard to not fail and we fall back to this cache.
> > +      * Top it off with a fresh request whenever it's empty.
> > +      */
> > +     ensure_cached_request(&ce->engine->request_pool, gfp);
> > +
> >       /*
> >        * Beware: Dragons be flying overhead.
> >        *
> >
