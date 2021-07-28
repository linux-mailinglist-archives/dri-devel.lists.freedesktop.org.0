Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172F3D8957
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 10:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266E6E4B7;
	Wed, 28 Jul 2021 08:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8196E4B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:01:58 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 z6-20020a9d24860000b02904d14e47202cso1252701ota.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d28HUJQy1mJP6dYNZ5p/iP56nCyaRCKX7PxlKK/OwzE=;
 b=LU5KfOO6tgnzshT7kfRnlQfWb5G0YiJLN8MVG2vMyhm8m1ou8RGNlGBBniHCQQWnxy
 vtluKAygOMtzdV2srK7tkMuVZ1Ttj+8+t0iWiv8lcvA+N+V9SfdypXDsQSUv0mLCN2H4
 28mWWczWTI28XXBoMQgrrwpwXxOD5ZbQTgB0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d28HUJQy1mJP6dYNZ5p/iP56nCyaRCKX7PxlKK/OwzE=;
 b=S2JNr4XaOVp1BdYJmxn1+dm0EVYBRS90+TYxJUPclfMPqOox8iu+0vDVraBaYHw9NI
 OPtR+VgfH1+zpbe2Q+FnoynKU1qN7T3/cFu9kj1pPNp4XS3t4uMZuWhoGZSJGureMcne
 UTucXyRp96W87gJneGQviQVSbxP+N7OG5BujkeIH9Xpv1VlKwCTwZu4yASWsd2RDmvjF
 qEl9jMNBPisnke4iN/rBR+sXQv2TOu/yOVd0+IayyA24vxbUjmEDrhQ1IIVkBvYG7YEf
 /wHc/NhbjrAobNQneCq6UV7ZRdVo0759hr4QGxK6bGkUKimAO5l6DO821a9HIwV7R56y
 qaPQ==
X-Gm-Message-State: AOAM533xSB4HxIEK7fHxK+NqhmSvadFtK00LF+cWGln1ioeJ68/zULf6
 2vb/zEspzJ+GHBWCMbw1guADE0gcHl9KEcJgCEEn8A==
X-Google-Smtp-Source: ABdhPJzgTvrQbrWSRUCqMspyawJaW5UsbRapyqr/y444gkKpVB+O2COx7S0zqqOMGT/wcvk4g2iysbMVud1LZmVVsx0=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr18563055otb.281.1627459317526; 
 Wed, 28 Jul 2021 01:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-4-matthew.brost@intel.com>
In-Reply-To: <20210727002348.97202-4-matthew.brost@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 28 Jul 2021 10:01:44 +0200
Message-ID: <CAKMK7uEM24AhVj-yhWyCLQ2LXHYpY4HMYBPTKY4zG2Yo1vodSQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/33] drm/i915: Hold reference to
 intel_context over life of i915_request
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 2:06 AM Matthew Brost <matthew.brost@intel.com> wrote:
> Hold a reference to the intel_context over life of an i915_request.
> Without this an i915_request can exist after the context has been
> destroyed (e.g. request retired, context closed, but user space holds a
> reference to the request from an out fence). In the case of GuC
> submission + virtual engine, the engine that the request references is
> also destroyed which can trigger bad pointer dref in fence ops (e.g.
> i915_fence_get_driver_name). We could likely change
> i915_fence_get_driver_name to avoid touching the engine but let's just
> be safe and hold the intel_context reference.
>
> v2:
>  (John Harrison)
>   - Update comment explaining how GuC mode and execlists mode deal with
>     virtual engines differently
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

Please also update the comment in the header for i915_request. That is
back from 2016 or so, when the context was actually fully refcounted
...

It would also be good to record a bit more the history here and all
the back&forth (and maybe why).

Don't ask why I've stumbled over this.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_request.c | 55 ++++++++++++-----------------
>  1 file changed, 23 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 39a21d96577e..57c9187aff74 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -125,39 +125,17 @@ static void i915_fence_release(struct dma_fence *fence)
>         i915_sw_fence_fini(&rq->semaphore);
>
>         /*
> -        * Keep one request on each engine for reserved use under mempressure
> -        *
> -        * We do not hold a reference to the engine here and so have to be
> -        * very careful in what rq->engine we poke. The virtual engine is
> -        * referenced via the rq->context and we released that ref during
> -        * i915_request_retire(), ergo we must not dereference a virtual
> -        * engine here. Not that we would want to, as the only consumer of
> -        * the reserved engine->request_pool is the power management parking,
> -        * which must-not-fail, and that is only run on the physical engines.
> -        *
> -        * Since the request must have been executed to be have completed,
> -        * we know that it will have been processed by the HW and will
> -        * not be unsubmitted again, so rq->engine and rq->execution_mask
> -        * at this point is stable. rq->execution_mask will be a single
> -        * bit if the last and _only_ engine it could execution on was a
> -        * physical engine, if it's multiple bits then it started on and
> -        * could still be on a virtual engine. Thus if the mask is not a
> -        * power-of-two we assume that rq->engine may still be a virtual
> -        * engine and so a dangling invalid pointer that we cannot dereference
> -        *
> -        * For example, consider the flow of a bonded request through a virtual
> -        * engine. The request is created with a wide engine mask (all engines
> -        * that we might execute on). On processing the bond, the request mask
> -        * is reduced to one or more engines. If the request is subsequently
> -        * bound to a single engine, it will then be constrained to only
> -        * execute on that engine and never returned to the virtual engine
> -        * after timeslicing away, see __unwind_incomplete_requests(). Thus we
> -        * know that if the rq->execution_mask is a single bit, rq->engine
> -        * can be a physical engine with the exact corresponding mask.
> +        * Keep one request on each engine for reserved use under mempressure,
> +        * do not use with virtual engines as this really is only needed for
> +        * kernel contexts.
>          */
> -       if (is_power_of_2(rq->execution_mask) &&
> -           !cmpxchg(&rq->engine->request_pool, NULL, rq))
> +       if (!intel_engine_is_virtual(rq->engine) &&
> +           !cmpxchg(&rq->engine->request_pool, NULL, rq)) {
> +               intel_context_put(rq->context);
>                 return;
> +       }
> +
> +       intel_context_put(rq->context);
>
>         kmem_cache_free(global.slab_requests, rq);
>  }
> @@ -956,7 +934,19 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>                 }
>         }
>
> -       rq->context = ce;
> +       /*
> +        * Hold a reference to the intel_context over life of an i915_request.
> +        * Without this an i915_request can exist after the context has been
> +        * destroyed (e.g. request retired, context closed, but user space holds
> +        * a reference to the request from an out fence). In the case of GuC
> +        * submission + virtual engine, the engine that the request references
> +        * is also destroyed which can trigger bad pointer dref in fence ops
> +        * (e.g. i915_fence_get_driver_name). We could likely change these
> +        * functions to avoid touching the engine but let's just be safe and
> +        * hold the intel_context reference. In execlist mode the request always
> +        * eventually points to a physical engine so this isn't an issue.
> +        */
> +       rq->context = intel_context_get(ce);
>         rq->engine = ce->engine;
>         rq->ring = ce->ring;
>         rq->execution_mask = ce->engine->mask;
> @@ -1033,6 +1023,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>         GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
>
>  err_free:
> +       intel_context_put(ce);
>         kmem_cache_free(global.slab_requests, rq);
>  err_unreserve:
>         intel_context_unpin(ce);
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
