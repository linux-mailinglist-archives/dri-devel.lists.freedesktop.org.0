Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7003EA72F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 17:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D5B6E420;
	Thu, 12 Aug 2021 15:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756EB6E422
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 15:10:00 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id z128so12365911ybc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RObpsYa3oVTvHKYxaZZ0VmBfjjX+QSLwEhjq3E7b14=;
 b=UFOhg2pIql72mkDHPixHSQHFrff9UCLGsq0NzrIPupCfzGerCKXWq7SFLetFZS4BBL
 Z2cxQQJfIgkaSmgED9ViTm6TlGUFyBH8NiXI2zCb3vRMyP65QwesJWMI0lhZh6ThLqqL
 xWM8rd2CWpfWCNhNz8mG08ETPkMD96x0p9ZXMFdZo1ynMpWZqlYI4J957aw9XF3UUFtJ
 4Y4J8eeySlUghoN2TV9Lp2jTQ+LW6oBbDQHkct+8JP9+FiwuzSyYTY1TLrmSPfIJMSBX
 Gh1jm8WGqBqROm45616JBYCl7xqOKXTAZguN3VdAY4yp4hgkE1Vc3sdNa6QgTKdKJbry
 dUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RObpsYa3oVTvHKYxaZZ0VmBfjjX+QSLwEhjq3E7b14=;
 b=GTtta376Vr6x2ByPWOnRIBTxii+hmH7qD2JRRmicITIYMSmTWUAwSXTklg92l0ByRs
 HV37g4FfnFlJLyWAWh/qes8rQrykaoVmB0dJ4ivALMQOQoobPArL+GO56ElH5XveS7hs
 P8M9qehdytf75ntp8qeQi//D97YRllb5mTohgNooU4LFSvhaTz+XzEmC72B/WMBhZhAF
 +UtvWm7gWHu9G5k+XcXKjnlqkBt5qPDVZPLbN06FO/AiNVJ9YeHRtfam8DcYbmNbvPqo
 EqNlZDjUUYqe5WzqmrBXAYhenNxeic7pOGlZ0cKjgu8BIie3vi5I2JIOcwr5XPpkNg5T
 N96A==
X-Gm-Message-State: AOAM533EbnHDkkrf68DwRM7BPP3lQ8vKHKdijaXO8X7yvqImCDvfmoYn
 LY5Ux1qsTDA8a+W4hVVWG8PHbvjvGSxyRopl2uQ4Ug==
X-Google-Smtp-Source: ABdhPJxtCuiBUVBRm0fzrChQsr6f09/RJVBYo6zuDgnWiRk2zGfYO9IBi8lRP1GKAMbtN2UiSroHecyl4WJwiRtJPiU=
X-Received: by 2002:a25:208b:: with SMTP id g133mr4728159ybg.211.1628780999248; 
 Thu, 12 Aug 2021 08:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210810130523.1972031-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210810130523.1972031-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 12 Aug 2021 10:09:47 -0500
Message-ID: <CAOFGe94PcMq5ZvF6E=Sc0ukv7SOo48EiKaLSYF=rPqCgjiargg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Use locked access to ctx->engines in
 set_priority
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 8:05 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This essentially reverts
>
> commit 89ff76bf9b3b0b86e6bbe344bd6378d8661303fc
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Thu Apr 2 13:42:18 2020 +0100
>
>     drm/i915/gem: Utilize rcu iteration of context engines
>
> Note that the other use of __context_engines_await have disappeard in
> the following commits:
>
> ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")
> c7a71fc8ee04 ("drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES")
> 4a766ae40ec8 ("drm/i915: Drop the CONTEXT_CLONE API (v2)")
>
> None of these have any business to optimize their engine lookup with
> rcu, unless extremely convincing benchmark data and a solid analysis
> why we can't make that workload (whatever it is that does) faster with
> a proper design fix.
>
> Also since there's only one caller of context_apply_all left and it's
> really just a loop, inline it and then inline the lopp body too. This
> is how all other callers that take the engine lock loop over engines,
> it's much simpler.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 72 ++++-----------------
>  1 file changed, 14 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dbaeb924a437..fd169cf2f75a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1284,49 +1284,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>         return 0;
>  }
>
> -static inline struct i915_gem_engines *
> -__context_engines_await(const struct i915_gem_context *ctx,
> -                       bool *user_engines)
> -{
> -       struct i915_gem_engines *engines;
> -
> -       rcu_read_lock();
> -       do {
> -               engines = rcu_dereference(ctx->engines);
> -               GEM_BUG_ON(!engines);
> -
> -               if (user_engines)
> -                       *user_engines = i915_gem_context_user_engines(ctx);
> -
> -               /* successful await => strong mb */
> -               if (unlikely(!i915_sw_fence_await(&engines->fence)))

Ugh... The first time I looked at this I thought the SW fence meant it
was actually waiting on something.  But, no, it's just making sure the
engines object still exists.  *sigh*  Burn it!

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> -                       continue;
> -
> -               if (likely(engines == rcu_access_pointer(ctx->engines)))
> -                       break;
> -
> -               i915_sw_fence_complete(&engines->fence);
> -       } while (1);
> -       rcu_read_unlock();
> -
> -       return engines;
> -}
> -
> -static void
> -context_apply_all(struct i915_gem_context *ctx,
> -                 void (*fn)(struct intel_context *ce, void *data),
> -                 void *data)
> -{
> -       struct i915_gem_engines_iter it;
> -       struct i915_gem_engines *e;
> -       struct intel_context *ce;
> -
> -       e = __context_engines_await(ctx, NULL);
> -       for_each_gem_engine(ce, e, it)
> -               fn(ce, data);
> -       i915_sw_fence_complete(&e->fence);
> -}
> -
>  static struct i915_gem_context *
>  i915_gem_create_context(struct drm_i915_private *i915,
>                         const struct i915_gem_proto_context *pc)
> @@ -1776,23 +1733,11 @@ set_persistence(struct i915_gem_context *ctx,
>         return __context_set_persistence(ctx, args->value);
>  }
>
> -static void __apply_priority(struct intel_context *ce, void *arg)
> -{
> -       struct i915_gem_context *ctx = arg;
> -
> -       if (!intel_engine_has_timeslices(ce->engine))
> -               return;
> -
> -       if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> -           intel_engine_has_semaphores(ce->engine))
> -               intel_context_set_use_semaphores(ce);
> -       else
> -               intel_context_clear_use_semaphores(ce);
> -}
> -
>  static int set_priority(struct i915_gem_context *ctx,
>                         const struct drm_i915_gem_context_param *args)
>  {
> +       struct i915_gem_engines_iter it;
> +       struct intel_context *ce;
>         int err;
>
>         err = validate_priority(ctx->i915, args);
> @@ -1800,7 +1745,18 @@ static int set_priority(struct i915_gem_context *ctx,
>                 return err;
>
>         ctx->sched.priority = args->value;
> -       context_apply_all(ctx, __apply_priority, ctx);
> +
> +       for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it) {
> +               if (!intel_engine_has_timeslices(ce->engine))
> +                       continue;
> +
> +               if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> +                   intel_engine_has_semaphores(ce->engine))
> +                       intel_context_set_use_semaphores(ce);
> +               else
> +                       intel_context_clear_use_semaphores(ce);
> +       }
> +       i915_gem_context_unlock_engines(ctx);
>
>         return 0;
>  }
> --
> 2.32.0
>
