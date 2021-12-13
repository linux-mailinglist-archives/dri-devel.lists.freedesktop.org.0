Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BBC4723C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F3B10E67A;
	Mon, 13 Dec 2021 09:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2261E10E643;
 Mon, 13 Dec 2021 09:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237431900"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="237431900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:25:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="517675927"
Received: from cflatley-mobl1.ger.corp.intel.com (HELO [10.213.196.3])
 ([10.213.196.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:25:18 -0800
Message-ID: <996e5913-106c-a4bb-61e5-2e1ebe4afc4e@linux.intel.com>
Date: Mon, 13 Dec 2021 09:25:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2] drm/i915: Don't disable interrupts and pretend a lock
 as been acquired in __timeline_mark_lock().
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20211118165914.pckik75emivsilek@linutronix.de>
 <c34cd01e-ff00-5137-5dc4-0085157328d2@linux.intel.com>
 <YbO8Ie1Nj7XcQPNQ@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YbO8Ie1Nj7XcQPNQ@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/12/2021 20:44, Sebastian Andrzej Siewior wrote:
> This is a revert of commits
>     d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")
>     6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")
>     6dcb85a0ad990 ("drm/i915: Hold irq-off for the entire fake lock period")
> 
> The existing code leads to a different behaviour depending on whether
> lockdep is enabled or not. Any following lock that is acquired without
> disabling interrupts (but needs to) will not be noticed by lockdep.
> 
> This it not just a lockdep annotation but is used but an actual mutex_t
> that is properly used as a lock but in case of __timeline_mark_lock()
> lockdep is only told that it is acquired but no lock has been acquired.
> 
> It appears that its purpose is just satisfy the lockdep_assert_held()
> check in intel_context_mark_active(). The other problem with disabling
> interrupts is that on PREEMPT_RT interrupts are also disabled which
> leads to problems for instance later during memory allocation.
> 
> Add a CONTEXT_IS_PARKING bit to intel_engine_cs and set_bit/clear_bit it
> instead of mutex_acquire/mutex_release. Use test_bit in the two
> identified spots which relied on the lockdep annotation.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> v1…v2:
>   - Add commit 6dcb85a0ad990 as reference.
>   - Name the bit CONTEXT_IS_PARKING.

Thanks for the tweak;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I'll pull it in in a minute.

Regards,

Tvrtko

>   drivers/gpu/drm/i915/gt/intel_context.h       |  3 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 38 +------------------
>   drivers/gpu/drm/i915/i915_request.h           |  3 +-
>   4 files changed, 7 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 246c37d72cd73..d8c74bbf9aae2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -211,7 +211,8 @@ static inline void intel_context_enter(struct intel_context *ce)
>   
>   static inline void intel_context_mark_active(struct intel_context *ce)
>   {
> -	lockdep_assert_held(&ce->timeline->mutex);
> +	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
> +		       test_bit(CONTEXT_IS_PARKING, &ce->flags));
>   	++ce->active_count;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 9e0177dc5484e..30cd81ad8911a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -118,6 +118,7 @@ struct intel_context {
>   #define CONTEXT_LRCA_DIRTY		9
>   #define CONTEXT_GUC_INIT		10
>   #define CONTEXT_PERMA_PIN		11
> +#define CONTEXT_IS_PARKING		12
>   
>   	struct {
>   		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index a1334b48dde7b..a8a2ad44b7e39 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -80,39 +80,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>   	return 0;
>   }
>   
> -#if IS_ENABLED(CONFIG_LOCKDEP)
> -
> -static unsigned long __timeline_mark_lock(struct intel_context *ce)
> -{
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
> -	mutex_acquire(&ce->timeline->mutex.dep_map, 2, 0, _THIS_IP_);
> -
> -	return flags;
> -}
> -
> -static void __timeline_mark_unlock(struct intel_context *ce,
> -				   unsigned long flags)
> -{
> -	mutex_release(&ce->timeline->mutex.dep_map, _THIS_IP_);
> -	local_irq_restore(flags);
> -}
> -
> -#else
> -
> -static unsigned long __timeline_mark_lock(struct intel_context *ce)
> -{
> -	return 0;
> -}
> -
> -static void __timeline_mark_unlock(struct intel_context *ce,
> -				   unsigned long flags)
> -{
> -}
> -
> -#endif /* !IS_ENABLED(CONFIG_LOCKDEP) */
> -
>   static void duration(struct dma_fence *fence, struct dma_fence_cb *cb)
>   {
>   	struct i915_request *rq = to_request(fence);
> @@ -159,7 +126,6 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>   {
>   	struct intel_context *ce = engine->kernel_context;
>   	struct i915_request *rq;
> -	unsigned long flags;
>   	bool result = true;
>   
>   	/*
> @@ -214,7 +180,7 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>   	 * engine->wakeref.count, we may see the request completion and retire
>   	 * it causing an underflow of the engine->wakeref.
>   	 */
> -	flags = __timeline_mark_lock(ce);
> +	set_bit(CONTEXT_IS_PARKING, &ce->flags);
>   	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
>   
>   	rq = __i915_request_create(ce, GFP_NOWAIT);
> @@ -246,7 +212,7 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>   
>   	result = false;
>   out_unlock:
> -	__timeline_mark_unlock(ce, flags);
> +	clear_bit(CONTEXT_IS_PARKING, &ce->flags);
>   	return result;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index dc359242d1aec..b7fe67405fd32 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -642,7 +642,8 @@ i915_request_timeline(const struct i915_request *rq)
>   {
>   	/* Valid only while the request is being constructed (or retired). */
>   	return rcu_dereference_protected(rq->timeline,
> -					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex));
> +					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||
> +					 test_bit(CONTEXT_IS_PARKING, &rq->context->flags));
>   }
>   
>   static inline struct i915_gem_context *
> 
