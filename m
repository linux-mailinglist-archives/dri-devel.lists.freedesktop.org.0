Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20CF33D173
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 11:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117FA6E2DE;
	Tue, 16 Mar 2021 10:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380F6E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 10:10:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e9so7113865wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2gx8zIVYCIpY0xxbRUU9yWimiwGtSpw+ocTput7RaB0=;
 b=NvpzHsJ/OGzC1M5KGxTHZ6u1YzDsZ9RJssXli7s2zF7ivzfQyjBv/GQeDDd1RWt1z9
 bgr2Y/taUDnb/q4b3h5vZRN126w/lnY/glvlnEL56YZm8mJ91n/7EO0Okj8LQXIMqCIu
 IwIVTLSc2VwrnGuR2E1bbyF71zcwR+/6/6qb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2gx8zIVYCIpY0xxbRUU9yWimiwGtSpw+ocTput7RaB0=;
 b=McwqgNq7K8BQL2Cp59Nk728UqFdP0ceePpjQN53D78m+E/kSyzEzaHGdCO5XGL9ukF
 EEiY3jWbHffrsyglKOnGuDBzRSGoVLQWawC7f+s+hC1cRqZDoc38+0LXCfDZV+xfR92z
 nS9HbsSChDU7kbI8b6nqcxiNCdfzk2aSq6NNFBk3CpzmiD4rzwLjFMBwRfdkK5kXEXyo
 3RPPvBpx+AVa20ifaceK3LmkuA2JA6PCuvDI1PQHsV8K2DeDtdnltwq5LFWgiOUtZb2d
 lsc7tXYneoPRDbk5HCk1WBv7BnnFG3RLjIcsscz1mLdlk4Fh0DLWzFxTC/7zQYd7eGKY
 d7oA==
X-Gm-Message-State: AOAM530oFESRAJEEhjS0xi2bNjEwtDBqFnhm1NOV8pHEp/246lpo7BNq
 PdhiF+IcDAZytooiJlWEic6lcQ==
X-Google-Smtp-Source: ABdhPJzO97T2EF4lWbUrs3BmsvFFXCbViOFB5o/byQPRHxKkxRrDv4TwNSmWP2bq2naF7pBRpUyu/A==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr4080466wre.234.1615889456768; 
 Tue, 16 Mar 2021 03:10:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm22367338wra.71.2021.03.16.03.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:10:56 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:10:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 5/6] drm/i915: Fail too long user submissions by default
Message-ID: <YFCELgxgfy70w68A@phenom.ffwll.local>
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
 <20210312154622.1767865-6-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312154622.1767865-6-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 03:46:21PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> A new Kconfig option CONFIG_DRM_I915_REQUEST_TIMEOUT is added, defaulting
> to 10s, and this timeout is applied to _all_ contexts using the previously
> added watchdog facility.
> 
> Result of this is that any user submission will simply fail after this
> time, either causing a reset (for non-preemptable) or incomplete results.
> 
> This can have an effect that workloads which used to work fine will
> suddenly start failing.
> 
> When the default expiry is active userspace will not be allowed to
> decrease the timeout using the context param setting.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

I think this should explain that it will break long running compute
workloads, and that maybe the modparam in the next patch can paper over
that until we've implemented proper long running compute workload support
in upstream. Which is unfortunately still some ways off.

Otherwise makes all sense to me. Maybe if you want also copy some of the
discussion from your cover letter into this commit message, and think
there's some good stuff there.
-Daniel

> ---
>  drivers/gpu/drm/i915/Kconfig.profile        |  8 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 47 ++++++++++++++++++---
>  2 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> index 35bbe2b80596..55e157ffff73 100644
> --- a/drivers/gpu/drm/i915/Kconfig.profile
> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> @@ -1,3 +1,11 @@
> +config DRM_I915_REQUEST_TIMEOUT
> +	int "Default timeout for requests (ms)"
> +	default 10000 # milliseconds
> +	help
> +	  ...
> +
> +	  May be 0 to disable the timeout.
> +
>  config DRM_I915_FENCE_TIMEOUT
>  	int "Timeout for unsignaled foreign fences (ms, jiffy granularity)"
>  	default 10000 # milliseconds
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 32b05af4fc8f..21c0176e27a0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -854,6 +854,25 @@ static void __assign_timeline(struct i915_gem_context *ctx,
>  	context_apply_all(ctx, __apply_timeline, timeline);
>  }
>  
> +static int
> +__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us);
> +
> +static void __set_default_fence_expiry(struct i915_gem_context *ctx)
> +{
> +	struct drm_i915_private *i915 = ctx->i915;
> +	int ret;
> +
> +	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT))
> +		return;
> +
> +	/* Default expiry for user fences. */
> +	ret = __set_watchdog(ctx, CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000);
> +	if (ret)
> +		drm_notice(&i915->drm,
> +			   "Failed to configure default fence expiry! (%d)",
> +			   ret);
> +}
> +
>  static struct i915_gem_context *
>  i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  {
> @@ -898,6 +917,8 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  		intel_timeline_put(timeline);
>  	}
>  
> +	__set_default_fence_expiry(ctx);
> +
>  	trace_i915_context_create(ctx);
>  
>  	return ctx;
> @@ -1404,23 +1425,35 @@ static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
>  	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
>  }
>  
> -static int set_watchdog(struct i915_gem_context *ctx,
> -			struct drm_i915_gem_context_param *args)
> +static int
> +__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
>  {
>  	int ret;
>  
> -	if (args->size)
> -		return -EINVAL;
> -
>  	ret = context_apply_all(ctx, __apply_watchdog,
> -				(void *)(uintptr_t)args->value);
> +				(void *)(uintptr_t)timeout_us);
>  
>  	if (!ret)
> -		ctx->watchdog.timeout_us = args->value;
> +		ctx->watchdog.timeout_us = timeout_us;
>  
>  	return ret;
>  }
>  
> +static int set_watchdog(struct i915_gem_context *ctx,
> +			struct drm_i915_gem_context_param *args)
> +{
> +	if (args->size)
> +		return -EINVAL;
> +
> +	/* Disallow disabling or configuring longer watchdog than default. */
> +	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> +	    (!args->value ||
> +	     args->value > CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000))
> +		return -EPERM;
> +
> +	return __set_watchdog(ctx, args->value);
> +}
> +
>  static int __get_ringsize(struct intel_context *ce, void *arg)
>  {
>  	long sz;
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
