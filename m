Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076236ECCC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6786E23B;
	Thu, 29 Apr 2021 14:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900E76E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:54:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g14so19230821edy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUEimQ8VgLkZihkcwTxQ5qSd70LoNYfd7XbzNsHhpNo=;
 b=srdXJh8Aj39Y7yvXJX+2fXB5Aaf8uXeDBdiwu9CVjS4gsdD/XbW25ZKkeWPpUGyYdU
 cdq6Ov2JWcGFo3P3/Nnp00PmngiZf3N+FEXhk+plUGJyw6HXfbJGmpZPxHccAsyfyz2a
 rK/zunyXoEazsLLgsgj/rU8DaeTG2ILOrDhHEhgvt4rBrBm8U8IIz5zkqUhpX4T3tuSB
 vh17uDKZitsibVe5v7Rj0/Pw6uCYD2ybf1G/CrX7U+1f2m4B2371KzmzaU91LjOfuYq5
 wyjMQE+ynoWShxivtaM45OTgHSXA9BWvKIR99U21doSLDlBvV48A0d9Tc6DDDDomx3RX
 cJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUEimQ8VgLkZihkcwTxQ5qSd70LoNYfd7XbzNsHhpNo=;
 b=TeujMHSgpIO/CWp0lMsyblbsIhyg0IjqYKAuZBBczh2M0J+zgn8sLoO8DKbHJPhJ5I
 zMXoKUcdN4gAvV7UzyjtZGSlUNILZHEDaDcEhQUOVZXFbzorcX2I0d1ZgiSCeqofrQqU
 UyD1eXl81YDjCjucg4dRjCe7bGumSuh0c5LisokH57b1OcJOqgn0wWMMFw96s+TRfKCM
 efMPph23wvTdYsZtsEarFqxaxK4eTIbOkmQGaMRzoVWRDa3d226geOpzq1EeNuqeXXVb
 Nh9Uz/z5PTqVDEp429DYxoZ1TpwCaV1A2o3N3ce89IakqYmODdMLBJhyfJvRUwAXrJgB
 OhFw==
X-Gm-Message-State: AOAM532+VrkEmqp4Y4aBiOKrNEpx/b4TKcN+nYOR2UUNLZELUQnOKwpb
 ay4tP86kpJuLc+Y5Tt4vO+7s4AxBC97a/8EhQ/CswzlSrg1LkQ==
X-Google-Smtp-Source: ABdhPJzlSlY2pfLXSaJtiD6IAcJzTyCI4aMIVz5DAvueN69OlgpYqem8TiWFiRk2LoG2tP5+qVE9MCg5l4X36Ab/91M=
X-Received: by 2002:a05:6402:1492:: with SMTP id
 e18mr18739912edv.225.1619708067118; 
 Thu, 29 Apr 2021 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
 <417fe44a-61f9-c90a-c255-309db5bb48ab@linux.intel.com>
 <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
 <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
In-Reply-To: <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 09:54:15 -0500
Message-ID: <CAOFGe95D81vvT1AQPF_sbqWQMZAJeZmr92xgd2m=GZY4TxGYUw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/21] drm/i915/gem: Set the watchdog timeout
 directly in intel_context_set_gem
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

On Thu, Apr 29, 2021 at 3:04 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 28/04/2021 18:24, Jason Ekstrand wrote:
> > On Wed, Apr 28, 2021 at 10:55 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 23/04/2021 23:31, Jason Ekstrand wrote:
> >>> Instead of handling it like a context param, unconditionally set it when
> >>> intel_contexts are created.  This doesn't fix anything but does simplify
> >>> the code a bit.
> >>>
> >>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>> ---
> >>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
> >>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
> >>>    drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
> >>>    3 files changed, 6 insertions(+), 44 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>> index 35bcdeddfbf3f..1091cc04a242a 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
> >>>            intel_engine_has_timeslices(ce->engine))
> >>>                __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> >>>
> >>> -     intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> >>> +     if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> >>> +         ctx->i915->params.request_timeout_ms) {
> >>> +             unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
> >>> +             intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
> >>
> >> Blank line between declarations and code please, or just lose the local.
> >>
> >> Otherwise looks okay. Slight change that same GEM context can now have a
> >> mix of different request expirations isn't interesting I think. At least
> >> the change goes away by the end of the series.
> >
> > In order for that to happen, I think you'd have to have a race between
> > CREATE_CONTEXT and someone smashing the request_timeout_ms param via
> > sysfs.  Or am I missing something?  Given that timeouts are really
> > per-engine anyway, I don't think we need to care too much about that.
>
> We don't care, no.
>
> For completeness only - by the end of the series it is what you say. But
> at _this_ point in the series though it is if modparam changes at any
> point between context create and replacing engines. Which is a change
> compared to before this patch, since modparam was cached in the GEM
> context so far. So one GEM context was a single request_timeout_ms.

I've added the following to the commit message:

It also means that sync files exported from different engines on a
SINGLE_TIMELINE context will have different fence contexts.  This is
visible to userspace if it looks at the obj_name field of
sync_fence_info.

How's that sound?

--Jason

> Regards,
>
> Tvrtko
>
> > --Jason
> >
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> +     }
> >>>    }
> >>>
> >>>    static void __free_engines(struct i915_gem_engines *e, unsigned int count)
> >>> @@ -792,41 +796,6 @@ static void __assign_timeline(struct i915_gem_context *ctx,
> >>>        context_apply_all(ctx, __apply_timeline, timeline);
> >>>    }
> >>>
> >>> -static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
> >>> -{
> >>> -     return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
> >>> -}
> >>> -
> >>> -static int
> >>> -__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret = context_apply_all(ctx, __apply_watchdog,
> >>> -                             (void *)(uintptr_t)timeout_us);
> >>> -     if (!ret)
> >>> -             ctx->watchdog.timeout_us = timeout_us;
> >>> -
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static void __set_default_fence_expiry(struct i915_gem_context *ctx)
> >>> -{
> >>> -     struct drm_i915_private *i915 = ctx->i915;
> >>> -     int ret;
> >>> -
> >>> -     if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
> >>> -         !i915->params.request_timeout_ms)
> >>> -             return;
> >>> -
> >>> -     /* Default expiry for user fences. */
> >>> -     ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
> >>> -     if (ret)
> >>> -             drm_notice(&i915->drm,
> >>> -                        "Failed to configure default fence expiry! (%d)",
> >>> -                        ret);
> >>> -}
> >>> -
> >>>    static struct i915_gem_context *
> >>>    i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >>>    {
> >>> @@ -871,8 +840,6 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> >>>                intel_timeline_put(timeline);
> >>>        }
> >>>
> >>> -     __set_default_fence_expiry(ctx);
> >>> -
> >>>        trace_i915_context_create(ctx);
> >>>
> >>>        return ctx;
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> >>> index 5ae71ec936f7c..676592e27e7d2 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> >>> @@ -153,10 +153,6 @@ struct i915_gem_context {
> >>>         */
> >>>        atomic_t active_count;
> >>>
> >>> -     struct {
> >>> -             u64 timeout_us;
> >>> -     } watchdog;
> >>> -
> >>>        /**
> >>>         * @hang_timestamp: The last time(s) this context caused a GPU hang
> >>>         */
> >>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
> >>> index dffedd983693d..0c69cb42d075c 100644
> >>> --- a/drivers/gpu/drm/i915/gt/intel_context_param.h
> >>> +++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
> >>> @@ -10,11 +10,10 @@
> >>>
> >>>    #include "intel_context.h"
> >>>
> >>> -static inline int
> >>> +static inline void
> >>>    intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
> >>>    {
> >>>        ce->watchdog.timeout_us = timeout_us;
> >>> -     return 0;
> >>>    }
> >>>
> >>>    #endif /* INTEL_CONTEXT_PARAM_H */
> >>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
