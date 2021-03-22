Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294003440EC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 13:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78916E457;
	Mon, 22 Mar 2021 12:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BBF6E457;
 Mon, 22 Mar 2021 12:28:05 +0000 (UTC)
IronPort-SDR: LvaNM5TKERY4Lleb+wJCTl3V/wEzJULBKWkiHzDz+C8MGIqT34Edz30ybMjotgpe7NkMS+LovM
 9zalDt0P+CwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="254257849"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="254257849"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 05:28:05 -0700
IronPort-SDR: 6/n4f97b4z2FN5NMVJxm/prTl9KGQQyZHZlUKZLGEtiVfB1M45XjwGMhPpgFZroTyamLTh/ny3
 oy990IvOVp+g==
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="407810365"
Received: from rgkirwan-mobl.ger.corp.intel.com (HELO [10.213.212.156])
 ([10.213.212.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 05:28:04 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with
 a syncobj
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-5-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b462561b-6340-fdf3-6b1a-e0370bfe090c@linux.intel.com>
Date: Mon, 22 Mar 2021 12:28:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319223856.2983244-5-jason@jlekstrand.net>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/03/2021 22:38, Jason Ekstrand wrote:
> I'd love to delete the SINGLE_TIMELINE API because it leaks an
> implementation detail of contexts through to the API and is something
> that userspace can do itself, trivially.  Unfortunately, it's used by
> the media driver so we can't do that.  We can, however, do the next-best
> thing which is to embed a syncobj in the context and do exactly what
> we'd expect from userspace internally.
> 
> This has a couple of advantages.  One is that we're no longer leaking a
> detail of the current execlist scheduler which will be problematic when
> we try to add GuC scheduling.  Second is that, together with deleting

Narrative needs to be corrected as with the previous patch.

> the CLONE_CONTEXT API, we should now have a 1:1 mapping between
> intel_context and intel_timeline which should make some of our locking
> mess a bit easier.

Mess or complexity? Could you expand with some details so it's easier to 
understand? (I am thinking what gets easier, how and why, if this is done.)

> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 47 ++++---------------
>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  8 +++-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++++
>   3 files changed, 32 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index f88bac19333ec..e094f4a1ca4cd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -67,6 +67,8 @@
>   #include <linux/log2.h>
>   #include <linux/nospec.h>
>   
> +#include <drm/drm_syncobj.h>
> +
>   #include "gt/gen6_ppgtt.h"
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_heartbeat.h"
> @@ -224,10 +226,6 @@ static void intel_context_set_gem(struct intel_context *ce,
>   		ce->vm = vm;
>   	}
>   
> -	GEM_BUG_ON(ce->timeline);
> -	if (ctx->timeline)
> -		ce->timeline = intel_timeline_get(ctx->timeline);
> -
>   	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
>   	    intel_engine_has_timeslices(ce->engine))
>   		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> @@ -344,8 +342,8 @@ void i915_gem_context_release(struct kref *ref)
>   	mutex_destroy(&ctx->engines_mutex);
>   	mutex_destroy(&ctx->lut_mutex);
>   
> -	if (ctx->timeline)
> -		intel_timeline_put(ctx->timeline);
> +	if (ctx->syncobj)
> +		drm_syncobj_put(ctx->syncobj);
>   
>   	put_pid(ctx->pid);
>   	mutex_destroy(&ctx->mutex);
> @@ -790,33 +788,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
>   		i915_vm_close(vm);
>   }
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
>   static struct i915_gem_context *
>   i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>   {
>   	struct i915_gem_context *ctx;
> +	int ret;
>   
>   	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
>   	    !HAS_EXECLISTS(i915))
> @@ -845,16 +821,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>   	}
>   
>   	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {

If removal works out I would suggest deprecating the flag starting from 
some future platform. Maybe for GT gen greater than 12 you could already 
start rejecting in order to future proof.

> -		struct intel_timeline *timeline;
> -
> -		timeline = intel_timeline_create(&i915->gt);
> -		if (IS_ERR(timeline)) {
> +		ret = drm_syncobj_create(&ctx->syncobj,
> +					 DRM_SYNCOBJ_CREATE_SIGNALED,
> +					 NULL);
> +		if (ret) {
>   			context_close(ctx);
> -			return ERR_CAST(timeline);
> +			return ERR_PTR(ret);
>   		}
> -
> -		__assign_timeline(ctx, timeline);
> -		intel_timeline_put(timeline);
>   	}
>   
>   	trace_i915_context_create(ctx);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 676592e27e7d2..8a5fdd163b79d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -83,7 +83,13 @@ struct i915_gem_context {
>   	struct i915_gem_engines __rcu *engines;
>   	struct mutex engines_mutex; /* guards writes to engines */
>   
> -	struct intel_timeline *timeline;
> +	/**
> +	 * @syncobj: Shared timeline syncobj
> +	 *
> +	 * When the SHARED_TIMELINE flag is set on context creation, this
> +	 * provides automatic implicit synchronization across all engines.
> +	 */
> +	struct drm_syncobj *syncobj;
>   
>   	/**
>   	 * @vm: unique address space (GTT)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 96403130a373d..2c56796f6a71b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3295,6 +3295,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   		goto err_vma;
>   	}
>   
> +	if (eb.gem_context->syncobj) {
> +		struct dma_fence *fence;
> +
> +		fence = drm_syncobj_fence_get(eb.gem_context->syncobj);

Who drops this reference?

> +		err = i915_request_await_dma_fence(eb.request, fence);
> +		if (err)
> +			goto err_ext;
> +	}
> +
>   	if (in_fence) {
>   		if (args->flags & I915_EXEC_FENCE_SUBMIT)
>   			err = i915_request_await_execution(eb.request,
> @@ -3351,6 +3360,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   			fput(out_fence->file);
>   		}
>   	}
> +
> +	if (eb.gem_context->syncobj) {
> +		drm_syncobj_replace_fence(eb.gem_context->syncobj,
> +					  &eb.request->fence);
> +	}
> +
>   	i915_request_put(eb.request);
>   
>   err_vma:
> 

So essentially moving the synchronisation to top level which is extra 
work, but given limited and questionable usage of the uapi may be 
acceptable. Need full picture on motivation to understand.

Semantics are also not 1:1 since dma fence context will be different. So 
not fully single timeline as so far, but just implicitly serialised 
execution. Again due limited usage this may not be a problem. Worth 
spelling out in the commit message though.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
