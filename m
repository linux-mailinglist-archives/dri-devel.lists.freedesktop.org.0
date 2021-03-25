Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8FA349B81
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 22:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D856EE48;
	Thu, 25 Mar 2021 21:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB7D6EE47;
 Thu, 25 Mar 2021 21:21:13 +0000 (UTC)
IronPort-SDR: 7KTAkfruVGfpYVn3QYsEHLwhSd1Qs4fYZkKPNtfkta2DNQlrlK1yUQi298d+Ht7zaE9zZ+khoi
 ZNhahaOzmRPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276148758"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="276148758"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 14:21:13 -0700
IronPort-SDR: fgDa+XMGbKPI7WlaQdLDT4oi+hAlZfXgTqf4FlbAKGlZFJWkXpi2Ce/xMVLtuFs/OkDVvpm99r
 3fMD9CA+RrDQ==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="443554250"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 14:21:13 -0700
Date: Thu, 25 Mar 2021 14:13:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH] drm/i915: Implement SINGLE_TIMELINE with a syncobj (v2)
Message-ID: <20210325211312.GA29925@sdutt-i7>
References: <20210319223856.2983244-5-jason@jlekstrand.net>
 <20210323175149.3390801-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323175149.3390801-1-jason@jlekstrand.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Mar 23, 2021 at 12:51:49PM -0500, Jason Ekstrand wrote:
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

I'm not going to dive into the philosophical debate that this patch has
pigeonholed into, but a 1:1 mapping between intel_context and
intel_timeline is huge win IMO - these are the types of cleanups I can
get really get behind.

> v2 (Jason Ekstrand):
>  - Update the comment on i915_gem_context::syncobj to mention that it's
>    an emulation and the possible race if userspace calls execbuffer2
>    twice on the same context concurrently.
>  - Wrap the checks for eb.gem_context->syncobj in unlikely()
>  - Drop the dma_fence reference
>  - Improved commit message
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 47 ++++---------------
>  .../gpu/drm/i915/gem/i915_gem_context_types.h | 14 +++++-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 16 +++++++
>  3 files changed, 39 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index f88bac19333ec..e094f4a1ca4cd 100644
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
>  #include "gt/intel_engine_heartbeat.h"
> @@ -224,10 +226,6 @@ static void intel_context_set_gem(struct intel_context *ce,
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
> @@ -344,8 +342,8 @@ void i915_gem_context_release(struct kref *ref)
>  	mutex_destroy(&ctx->engines_mutex);
>  	mutex_destroy(&ctx->lut_mutex);
>  
> -	if (ctx->timeline)
> -		intel_timeline_put(ctx->timeline);
> +	if (ctx->syncobj)
> +		drm_syncobj_put(ctx->syncobj);
>  
>  	put_pid(ctx->pid);
>  	mutex_destroy(&ctx->mutex);
> @@ -790,33 +788,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
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
> @@ -845,16 +821,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
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
> index 96403130a373d..2e9748c1edddf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3295,6 +3295,16 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  		goto err_vma;
>  	}
>  
> +	if (unlikely(eb.gem_context->syncobj)) {
> +		struct dma_fence *fence;
> +
> +		fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> +		err = i915_request_await_dma_fence(eb.request, fence);
> +		if (err)
> +			goto err_ext;
> +		dma_fence_put(fence);

Also think this needs to be moved above the error checking, as this put
corresponds to 'drm_syncobj_fence_get', right?

Matt

> +	}
> +
>  	if (in_fence) {
>  		if (args->flags & I915_EXEC_FENCE_SUBMIT)
>  			err = i915_request_await_execution(eb.request,
> @@ -3351,6 +3361,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
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
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
