Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED936C233
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AAF6E92B;
	Tue, 27 Apr 2021 09:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370816E199
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:55:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g65so2288266wmg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rQPZgaTbNkgwin1RyajntYQBJwcTV0+SxwfS9RXsh0o=;
 b=HDovRQGwhbqfxvPfSFDLT2NMoIocqPo0F4DySDExxohTLbWlBfV+JT9iFLubeIouhv
 /GZBLXYquNQj+G0Cs8adXQJ/RZuC+seNfDsct87wTXTvAy88qfeGRXEv4oSbYyXbd1Oq
 v7CeBBpr6Cjemtl6MiN0aQHV0OwBVJGYeqBqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rQPZgaTbNkgwin1RyajntYQBJwcTV0+SxwfS9RXsh0o=;
 b=fBR70ImN3i53Hjsa4Nv3kR1bajnsdVc6UPsCL1UxYVtWqCOqygzJxtvHEt2bsnCpY2
 sM6NXlZn/9OFwYw3M4hCgKFvuYFb8gmFy9wAQX7+joTlP0EttMyFzpsQV7CL4/mDDb22
 I9OXIbcpodwhCvgLZ2l8cWUioQVmE/9FYqC/MPNFskSMY6HYrNnX/0/5/8XlMIdN7TIv
 paB+Z9EPYQAKyZtKkIfl+2Oy0JOqYaxQqffHCQKBrbU1qDbgws519Rd9BNWBEtKRVWnm
 4UAgS+XST84Awd297J0idpXG2bqkgMbh97VahtqTFQqzcZuhIDczQWiQXihNUKkAVNDV
 x3sw==
X-Gm-Message-State: AOAM532S4aTD/Q0qc9BNpdmoA5eoXL9S7AKEBDZJeGORnrik+bUWZGPZ
 rt+ZMM18PWoNl19OLJGGTP+fWT3GYr7Scw==
X-Google-Smtp-Source: ABdhPJznK2FysmKwap3ZeCDaYWLEs2/A87BnPR/5mU63ckoJWApr5vlEZmm3NO/5/xJFfFVYv1YwwQ==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr24512801wmi.186.1619517308981; 
 Tue, 27 Apr 2021 02:55:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l21sm2252860wme.10.2021.04.27.02.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:55:08 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:55:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 06/21] drm/i915: Implement SINGLE_TIMELINE
 with a syncobj (v3)
Message-ID: <YIffemMS/eiXLZ2Q@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-7-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-7-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:16PM -0500, Jason Ekstrand wrote:
> This API is entirely unnecessary and I'd love to get rid of it.  If
> userspace wants a single timeline across multiple contexts, they can
> either use implicit synchronization or a syncobj, both of which existed
> at the time this feature landed.  The justification given at the time
> was that it would help GL drivers which are inherently single-timeline.
> However, neither of our GL drivers actually wanted the feature.  i965
> was already in maintenance mode at the time and iris uses syncobj for
> everything.
> 
> Unfortunately, as much as I'd love to get rid of it, it is used by the
> media driver so we can't do that.  We can, however, do the next-best
> thing which is to embed a syncobj in the context and do exactly what
> we'd expect from userspace internally.  This isn't an entirely identical
> implementation because it's no longer atomic if userspace races with
> itself by calling execbuffer2 twice simultaneously from different
> threads.  It won't crash in that case; it just doesn't guarantee any
> ordering between those two submits.
> 
> Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
> advantages beyond mere annoyance.  One is that intel_timeline is no
> longer an api-visible object and can remain entirely an implementation
> detail.  This may be advantageous as we make scheduler changes going
> forward.  Second is that, together with deleting the CLONE_CONTEXT API,
> we should now have a 1:1 mapping between intel_context and
> intel_timeline which may help us reduce locking.
> 
> v2 (Jason Ekstrand):
>  - Update the comment on i915_gem_context::syncobj to mention that it's
>    an emulation and the possible race if userspace calls execbuffer2
>    twice on the same context concurrently.
>  - Wrap the checks for eb.gem_context->syncobj in unlikely()
>  - Drop the dma_fence reference
>  - Improved commit message
> 
> v3 (Jason Ekstrand):
>  - Move the dma_fence_put() to before the error exit
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming that igt coverage is good enough. Otoh if CI didn't catch
that racing execbuf are now unsynced maybe it wasn't good enough, but
whatever :-)
-Daniel


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 49 +++++--------------
>  .../gpu/drm/i915/gem/i915_gem_context_types.h | 14 +++++-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 16 ++++++
>  3 files changed, 40 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 2c2fefa912805..a72c9b256723b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -67,6 +67,8 @@
>  #include <linux/log2.h>
>  #include <linux/nospec.h>
>  
> +#include <drm/drm_syncobj.h>
> +
>  #include "gt/gen6_ppgtt.h"
>  #include "gt/intel_context.h"
>  #include "gt/intel_context_param.h"
> @@ -225,10 +227,6 @@ static void intel_context_set_gem(struct intel_context *ce,
>  		ce->vm = vm;
>  	}
>  
> -	GEM_BUG_ON(ce->timeline);
> -	if (ctx->timeline)
> -		ce->timeline = intel_timeline_get(ctx->timeline);
> -
>  	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
>  	    intel_engine_has_timeslices(ce->engine))
>  		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> @@ -351,9 +349,6 @@ void i915_gem_context_release(struct kref *ref)
>  	mutex_destroy(&ctx->engines_mutex);
>  	mutex_destroy(&ctx->lut_mutex);
>  
> -	if (ctx->timeline)
> -		intel_timeline_put(ctx->timeline);
> -
>  	put_pid(ctx->pid);
>  	mutex_destroy(&ctx->mutex);
>  
> @@ -570,6 +565,9 @@ static void context_close(struct i915_gem_context *ctx)
>  	if (vm)
>  		i915_vm_close(vm);
>  
> +	if (ctx->syncobj)
> +		drm_syncobj_put(ctx->syncobj);
> +
>  	ctx->file_priv = ERR_PTR(-EBADF);
>  
>  	/*
> @@ -765,33 +763,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
>  		i915_vm_close(vm);
>  }
>  
> -static void __set_timeline(struct intel_timeline **dst,
> -			   struct intel_timeline *src)
> -{
> -	struct intel_timeline *old = *dst;
> -
> -	*dst = src ? intel_timeline_get(src) : NULL;
> -
> -	if (old)
> -		intel_timeline_put(old);
> -}
> -
> -static void __apply_timeline(struct intel_context *ce, void *timeline)
> -{
> -	__set_timeline(&ce->timeline, timeline);
> -}
> -
> -static void __assign_timeline(struct i915_gem_context *ctx,
> -			      struct intel_timeline *timeline)
> -{
> -	__set_timeline(&ctx->timeline, timeline);
> -	context_apply_all(ctx, __apply_timeline, timeline);
> -}
> -
>  static struct i915_gem_context *
>  i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  {
>  	struct i915_gem_context *ctx;
> +	int ret;
>  
>  	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
>  	    !HAS_EXECLISTS(i915))
> @@ -820,16 +796,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  	}
>  
>  	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> -		struct intel_timeline *timeline;
> -
> -		timeline = intel_timeline_create(&i915->gt);
> -		if (IS_ERR(timeline)) {
> +		ret = drm_syncobj_create(&ctx->syncobj,
> +					 DRM_SYNCOBJ_CREATE_SIGNALED,
> +					 NULL);
> +		if (ret) {
>  			context_close(ctx);
> -			return ERR_CAST(timeline);
> +			return ERR_PTR(ret);
>  		}
> -
> -		__assign_timeline(ctx, timeline);
> -		intel_timeline_put(timeline);
>  	}
>  
>  	trace_i915_context_create(ctx);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 676592e27e7d2..df76767f0c41b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -83,7 +83,19 @@ struct i915_gem_context {
>  	struct i915_gem_engines __rcu *engines;
>  	struct mutex engines_mutex; /* guards writes to engines */
>  
> -	struct intel_timeline *timeline;
> +	/**
> +	 * @syncobj: Shared timeline syncobj
> +	 *
> +	 * When the SHARED_TIMELINE flag is set on context creation, we
> +	 * emulate a single timeline across all engines using this syncobj.
> +	 * For every execbuffer2 call, this syncobj is used as both an in-
> +	 * and out-fence.  Unlike the real intel_timeline, this doesn't
> +	 * provide perfect atomic in-order guarantees if the client races
> +	 * with itself by calling execbuffer2 twice concurrently.  However,
> +	 * if userspace races with itself, that's not likely to yield well-
> +	 * defined results anyway so we choose to not care.
> +	 */
> +	struct drm_syncobj *syncobj;
>  
>  	/**
>  	 * @vm: unique address space (GTT)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b812f313422a9..d640bba6ad9ab 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3460,6 +3460,16 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  		goto err_vma;
>  	}
>  
> +	if (unlikely(eb.gem_context->syncobj)) {
> +		struct dma_fence *fence;
> +
> +		fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> +		err = i915_request_await_dma_fence(eb.request, fence);
> +		dma_fence_put(fence);
> +		if (err)
> +			goto err_ext;
> +	}
> +
>  	if (in_fence) {
>  		if (args->flags & I915_EXEC_FENCE_SUBMIT)
>  			err = i915_request_await_execution(eb.request,
> @@ -3517,6 +3527,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  			fput(out_fence->file);
>  		}
>  	}
> +
> +	if (unlikely(eb.gem_context->syncobj)) {
> +		drm_syncobj_replace_fence(eb.gem_context->syncobj,
> +					  &eb.request->fence);
> +	}
> +
>  	i915_request_put(eb.request);
>  
>  err_vma:
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
