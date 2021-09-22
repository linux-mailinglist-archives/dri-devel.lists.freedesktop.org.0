Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62686414778
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99806EB79;
	Wed, 22 Sep 2021 11:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAA86EB78;
 Wed, 22 Sep 2021 11:12:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="284582051"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="284582051"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:12:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="550208051"
Received: from vidyaram-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.251.218.73])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:12:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, tvrtko.ursulin@intel.com
Subject: Re: [PATCH] drm/i915: Drop stealing of bits from i915_sw_fence
 function pointer
In-Reply-To: <20210922021305.33096-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210922021305.33096-1-matthew.brost@intel.com>
Date: Wed, 22 Sep 2021 14:12:55 +0300
Message-ID: <877df8n9s8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 21 Sep 2021, Matthew Brost <matthew.brost@intel.com> wrote:
> Rather than stealing bits from i915_sw_fence function pointer use
> seperate fields for function pointer and flags. If using two different
> fields, the 4 byte alignment for the i915_sw_fence function pointer can
> also be dropped.

Yes, please, thank you.

Acked-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>  drivers/gpu/drm/i915/i915_request.c           |  4 ++--
>  drivers/gpu/drm/i915/i915_sw_fence.c          |  9 +++-----
>  drivers/gpu/drm/i915/i915_sw_fence.h          | 21 +++++++++----------
>  drivers/gpu/drm/i915/i915_sw_fence_work.c     |  2 +-
>  .../gpu/drm/i915/selftests/i915_sw_fence.c    |  2 +-
>  drivers/gpu/drm/i915/selftests/lib_sw_fence.c |  4 ++--
>  8 files changed, 21 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index a7ca38613f89..6d5bb55ffc82 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10323,7 +10323,7 @@ static void intel_atomic_commit_work(struct work_struct *work)
>  	intel_atomic_commit_tail(state);
>  }
>  
> -static int __i915_sw_fence_call
> +static int
>  intel_atomic_commit_ready(struct i915_sw_fence *fence,
>  			  enum i915_sw_fence_notify notify)
>  {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index c2ab0e22db0a..df5fec5c3da8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -800,7 +800,7 @@ static void free_engines_rcu(struct rcu_head *rcu)
>  	free_engines(engines);
>  }
>  
> -static int __i915_sw_fence_call
> +static int
>  engines_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	struct i915_gem_engines *engines =
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ce446716d092..945d3025a0b6 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -719,7 +719,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
>  	intel_context_cancel_request(rq->context, rq);
>  }
>  
> -static int __i915_sw_fence_call
> +static int
>  submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	struct i915_request *request =
> @@ -755,7 +755,7 @@ submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  	return NOTIFY_DONE;
>  }
>  
> -static int __i915_sw_fence_call
> +static int
>  semaphore_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	struct i915_request *rq = container_of(fence, typeof(*rq), semaphore);
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index c589a681da77..5cf101cf06d2 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -34,7 +34,7 @@ enum {
>  
>  static void *i915_sw_fence_debug_hint(void *addr)
>  {
> -	return (void *)(((struct i915_sw_fence *)addr)->flags & I915_SW_FENCE_MASK);
> +	return (void *)(((struct i915_sw_fence *)addr)->fn);
>  }
>  
>  #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
> @@ -126,10 +126,7 @@ static inline void debug_fence_assert(struct i915_sw_fence *fence)
>  static int __i915_sw_fence_notify(struct i915_sw_fence *fence,
>  				  enum i915_sw_fence_notify state)
>  {
> -	i915_sw_fence_notify_t fn;
> -
> -	fn = (i915_sw_fence_notify_t)(fence->flags & I915_SW_FENCE_MASK);
> -	return fn(fence, state);
> +	return fence->fn(fence, state);
>  }
>  
>  #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
> @@ -242,7 +239,7 @@ void __i915_sw_fence_init(struct i915_sw_fence *fence,
>  			  const char *name,
>  			  struct lock_class_key *key)
>  {
> -	BUG_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
> +	BUG_ON(!fn);
>  
>  	__init_waitqueue_head(&fence->wait, name, key);
>  	fence->flags = (unsigned long)fn;
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 30a863353ee6..70ba1789aa89 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -17,26 +17,25 @@
>  
>  struct completion;
>  struct dma_resv;
> +struct i915_sw_fence;
> +
> +enum i915_sw_fence_notify {
> +	FENCE_COMPLETE,
> +	FENCE_FREE
> +};
> +
> +typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
> +				      enum i915_sw_fence_notify state);
>  
>  struct i915_sw_fence {
>  	wait_queue_head_t wait;
> +	i915_sw_fence_notify_t fn;
>  	unsigned long flags;
>  	atomic_t pending;
>  	int error;
>  };
>  
>  #define I915_SW_FENCE_CHECKED_BIT	0 /* used internally for DAG checking */
> -#define I915_SW_FENCE_PRIVATE_BIT	1 /* available for use by owner */
> -#define I915_SW_FENCE_MASK		(~3)
> -
> -enum i915_sw_fence_notify {
> -	FENCE_COMPLETE,
> -	FENCE_FREE
> -};
> -
> -typedef int (*i915_sw_fence_notify_t)(struct i915_sw_fence *,
> -				      enum i915_sw_fence_notify state);
> -#define __i915_sw_fence_call __aligned(4)
>  
>  void __i915_sw_fence_init(struct i915_sw_fence *fence,
>  			  i915_sw_fence_notify_t fn,
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> index 5b33ef23d54c..d2e56b387993 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> @@ -23,7 +23,7 @@ static void fence_work(struct work_struct *work)
>  	dma_fence_put(&f->dma);
>  }
>  
> -static int __i915_sw_fence_call
> +static int
>  fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	struct dma_fence_work *f = container_of(fence, typeof(*f), chain);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> index cbf45d85cbff..daa985e5a19b 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
> @@ -28,7 +28,7 @@
>  
>  #include "../i915_selftest.h"
>  
> -static int __i915_sw_fence_call
> +static int
>  fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	switch (state) {
> diff --git a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> index 080b90b63d16..eb59a41bdb79 100644
> --- a/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> +++ b/drivers/gpu/drm/i915/selftests/lib_sw_fence.c
> @@ -26,7 +26,7 @@
>  
>  /* Small library of different fence types useful for writing tests */
>  
> -static int __i915_sw_fence_call
> +static int
>  nop_fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	return NOTIFY_DONE;
> @@ -89,7 +89,7 @@ struct heap_fence {
>  	};
>  };
>  
> -static int __i915_sw_fence_call
> +static int
>  heap_fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  {
>  	struct heap_fence *h = container_of(fence, typeof(*h), fence);

-- 
Jani Nikula, Intel Open Source Graphics Center
