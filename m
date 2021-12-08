Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79646CFBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 10:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1336E8D4;
	Wed,  8 Dec 2021 09:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8DA6E8D4;
 Wed,  8 Dec 2021 09:10:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261867660"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="261867660"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:10:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="515682918"
Received: from amgotede-mobl1.ger.corp.intel.com (HELO [10.213.194.97])
 ([10.213.194.97])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:10:17 -0800
Message-ID: <c34cd01e-ff00-5137-5dc4-0085157328d2@linux.intel.com>
Date: Wed, 8 Dec 2021 09:10:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't disable interrupts and
 pretend a lock as been acquired in __timeline_mark_lock().
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211118165914.pckik75emivsilek@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211118165914.pckik75emivsilek@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/11/2021 16:59, Sebastian Andrzej Siewior wrote:
> This is a revert of commits
>     d67739268cf0e ("drm/i915/gt: Mark up the nested engine-pm timeline lock as irqsafe")
>     6c69a45445af9 ("drm/i915/gt: Mark context->active_count as protected by timeline->mutex")

6dcb85a0ad99 ("drm/i915: Hold irq-off for the entire fake lock period") 
is very relevant as well.

> The existing code leads to a different behaviour depending on whether
> lockdep is enabled or not. Any following lock that is acquired without
> disabling interrupts (but needs to) will not be noticed by lockdep.

Agreed this is not good.

> This it not just a lockdep annotation but is used but an actual mutex_t
> that is properly used as a lock but in case of __timeline_mark_lock()
> lockdep is only told that it is acquired but no lock has been acquired.
> 
> It appears that its purpose is just satisfy the lockdep_assert_held()
> check in intel_context_mark_active(). The other problem with disabling
> interrupts is that on PREEMPT_RT interrupts are also disabled which
> leads to problems for instance later during memory allocation.

Hmm commit message of d67739268cf0 ("drm/i915/gt: Mark up the nested 
engine-pm timeline lock as irqsafe") makes it sound like parking can run 
with interrupts disabled already. I mean outside of the irq disable hack 
in here.

I don't see it possible though, both due might_lock in intel_wakeref_put 
and GFP_NOWAIT in switch_to_kernel_context. So I will assume that commit 
message refers to an earlier state of the code base.

So the approach in this patch looks good to me.

> Add a CONTEXT_IS_PARKED bit to intel_engine_cs and set_bit/clear_bit it
> instead of mutex_acquire/mutex_release. Use test_bit in the two
> identified spots which relied on the lockdep annotation.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h       |    3 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |    1
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   38 +-------------------------
>   drivers/gpu/drm/i915/i915_request.h           |    3 +-
>   4 files changed, 7 insertions(+), 38 deletions(-)
> 
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -211,7 +211,8 @@ static inline void intel_context_enter(s
>   
>   static inline void intel_context_mark_active(struct intel_context *ce)
>   {
> -	lockdep_assert_held(&ce->timeline->mutex);
> +	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
> +		       test_bit(CONTEXT_IS_PARKED, &ce->flags));
>   	++ce->active_count;
>   }
>   
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -118,6 +118,7 @@ struct intel_context {
>   #define CONTEXT_LRCA_DIRTY		9
>   #define CONTEXT_GUC_INIT		10
>   #define CONTEXT_PERMA_PIN		11
> +#define CONTEXT_IS_PARKED		12

Pedantic comment is that semantics of the bit flag suggest it should be 
name CONTEXT_IS_PARKING, or along those lines. Since the flag gets clear 
as soon as the parking completes. I'd suggest doing that change for the 
self-documenting benefit.

Regards,

Tvrtko

>   
>   	struct {
>   		u64 timeout_us;
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -80,39 +80,6 @@ static int __engine_unpark(struct intel_
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
> @@ -159,7 +126,6 @@ static bool switch_to_kernel_context(str
>   {
>   	struct intel_context *ce = engine->kernel_context;
>   	struct i915_request *rq;
> -	unsigned long flags;
>   	bool result = true;
>   
>   	/*
> @@ -214,7 +180,7 @@ static bool switch_to_kernel_context(str
>   	 * engine->wakeref.count, we may see the request completion and retire
>   	 * it causing an underflow of the engine->wakeref.
>   	 */
> -	flags = __timeline_mark_lock(ce);
> +	set_bit(CONTEXT_IS_PARKED, &ce->flags);
>   	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
>   
>   	rq = __i915_request_create(ce, GFP_NOWAIT);
> @@ -246,7 +212,7 @@ static bool switch_to_kernel_context(str
>   
>   	result = false;
>   out_unlock:
> -	__timeline_mark_unlock(ce, flags);
> +	clear_bit(CONTEXT_IS_PARKED, &ce->flags);
>   	return result;
>   }
>   
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -642,7 +642,8 @@ i915_request_timeline(const struct i915_
>   {
>   	/* Valid only while the request is being constructed (or retired). */
>   	return rcu_dereference_protected(rq->timeline,
> -					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex));
> +					 lockdep_is_held(&rcu_access_pointer(rq->timeline)->mutex) ||
> +					 test_bit(CONTEXT_IS_PARKED, &rq->context->flags));
>   }
>   
>   static inline struct i915_gem_context *
> 
