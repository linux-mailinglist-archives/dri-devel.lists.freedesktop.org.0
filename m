Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912C36C1F3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642FB6E942;
	Tue, 27 Apr 2021 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFAD6E941
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:42:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k14so8839643wrv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1r/VDP10i2ZfLsR2Yr3ayBxnCP9l1GWzjv2mwNzlT5c=;
 b=NOJi3P9ZCwJ39VpR6Tdxyv6ply7QjiJdnamkoVYkGNGBmzS2Z5V7F+D67VQtyDj2zX
 YU2Iz5W00k0HRMV6mBbOLIvFIPlxHB4MBim2dV+EkdC2x4YU59gsROo6oExcHVxp4i/t
 zRR7Ny6SQr1oA9Qn2IOfnwNVusVtJALJXqhY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1r/VDP10i2ZfLsR2Yr3ayBxnCP9l1GWzjv2mwNzlT5c=;
 b=lAGJ25+LNX7yMxpgTzF1u4b8UUeEVW2TJPNI0D4ISVbvykj1L1B5fG5ok/xmGsR06D
 ailFWUJ3/AagDiT11CV2/0xND+Phj1DDk9R4NBxXxbxlnlHTribt5UkMGOW6vDQtvmpo
 At86TTGA8gpyrRqpMO4xiJzOMvEHEvccnF0yszCZxRFcSaSZpZTpRxAOJ4nmdZCLZtK1
 q2D+BYvFf10mQbvpT/9sR0tKVMu0kxp8zV2ogWUUHJ37oCFpoU/a9/JtQjEgdbTPN5OZ
 U9YHQMKgK+5ypLpiHmqI4LWTQ0V1mXVTMlNgWToPZMARXIyaQL50YmQP3Dw5GzeGA4zS
 hEwQ==
X-Gm-Message-State: AOAM531ToRXHKI7RIDUMcHuLxQ2wUgvISTbp7Y4NrjadCo9Qo5KXd6gJ
 XgoYaXjhB7XAQoVZK2+tgR74pMXb9mVtrw==
X-Google-Smtp-Source: ABdhPJzY11qQ1La35OOYHQEbILgVI7A53FdsmWXrTCTT6HHHTAXV+cKtRa9D5Y5RVea961fAChXZ9g==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr28369174wru.150.1619516526557; 
 Tue, 27 Apr 2021 02:42:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm489937wrs.21.2021.04.27.02.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:42:06 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:42:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 03/21] drm/i915/gem: Set the watchdog timeout directly in
 intel_context_set_gem
Message-ID: <YIfcbKoWY3ZbM4Tj@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-4-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:31:13PM -0500, Jason Ekstrand wrote:
> Instead of handling it like a context param, unconditionally set it when
> intel_contexts are created.  This doesn't fix anything but does simplify
> the code a bit.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

So the idea here is that since years we've had a watchdog uapi floating
about. Aim was for media, so that they could set very tight deadlines for
their transcodes jobs, so that if you have a corrupt bitstream (especially
for decoding) you don't hang your desktop unecessarily wrong.

But it's been stuck in limbo since forever, plus I get how this gets a bit
in the way of the proto ctx work, so makes sense to remove this prep work
again.

Maybe include the above in the commit message for a notch more context.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
>  drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
>  3 files changed, 6 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 35bcdeddfbf3f..1091cc04a242a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
>  	    intel_engine_has_timeslices(ce->engine))
>  		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>  
> -	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> +	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> +	    ctx->i915->params.request_timeout_ms) {
> +		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
> +		intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
> +	}
>  }
>  
>  static void __free_engines(struct i915_gem_engines *e, unsigned int count)
> @@ -792,41 +796,6 @@ static void __assign_timeline(struct i915_gem_context *ctx,
>  	context_apply_all(ctx, __apply_timeline, timeline);
>  }
>  
> -static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
> -{
> -	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
> -}
> -
> -static int
> -__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
> -{
> -	int ret;
> -
> -	ret = context_apply_all(ctx, __apply_watchdog,
> -				(void *)(uintptr_t)timeout_us);
> -	if (!ret)
> -		ctx->watchdog.timeout_us = timeout_us;
> -
> -	return ret;
> -}
> -
> -static void __set_default_fence_expiry(struct i915_gem_context *ctx)
> -{
> -	struct drm_i915_private *i915 = ctx->i915;
> -	int ret;
> -
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
> -	    !i915->params.request_timeout_ms)
> -		return;
> -
> -	/* Default expiry for user fences. */
> -	ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
> -	if (ret)
> -		drm_notice(&i915->drm,
> -			   "Failed to configure default fence expiry! (%d)",
> -			   ret);
> -}
> -
>  static struct i915_gem_context *
>  i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  {
> @@ -871,8 +840,6 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  		intel_timeline_put(timeline);
>  	}
>  
> -	__set_default_fence_expiry(ctx);
> -
>  	trace_i915_context_create(ctx);
>  
>  	return ctx;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 5ae71ec936f7c..676592e27e7d2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -153,10 +153,6 @@ struct i915_gem_context {
>  	 */
>  	atomic_t active_count;
>  
> -	struct {
> -		u64 timeout_us;
> -	} watchdog;
> -
>  	/**
>  	 * @hang_timestamp: The last time(s) this context caused a GPU hang
>  	 */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
> index dffedd983693d..0c69cb42d075c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_param.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
> @@ -10,11 +10,10 @@
>  
>  #include "intel_context.h"
>  
> -static inline int
> +static inline void
>  intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
>  {
>  	ce->watchdog.timeout_us = timeout_us;
> -	return 0;
>  }
>  
>  #endif /* INTEL_CONTEXT_PARAM_H */
> -- 
> 2.31.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
