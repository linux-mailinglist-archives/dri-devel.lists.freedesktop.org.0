Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D83C66AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 01:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55289EBB;
	Mon, 12 Jul 2021 23:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358F89A56;
 Mon, 12 Jul 2021 23:05:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="207051081"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="207051081"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 16:05:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="412750366"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 16:05:08 -0700
Subject: Re: [PATCH 41/47] drm/i915/guc: Capture error state on context reset
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-42-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <55df23b1-4f01-b077-a1ba-505b628bb922@intel.com>
Date: Mon, 12 Jul 2021 16:05:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-42-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:05, Matthew Brost wrote:
> We receive notification of an engine reset from GuC at its
> completion. Meaning GuC has potentially cleared any HW state
> we may have been interested in capturing. GuC resumes scheduling
> on the engine post-reset, as the resets are meant to be transparent,
> further muddling our error state.
>
> There is ongoing work to define an API for a GuC debug state dump. The
> suggestion for now is to manually disable FW initiated resets in cases
> where debug state is needed.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 20 +++++++++++
>   drivers/gpu/drm/i915/gt/intel_context.h       |  3 ++
>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++++++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 11 ++++--
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  2 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++----------
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 25 ++++++++++---
>   7 files changed, 91 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 2f01437056a8..3fe7794b2bfd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -514,6 +514,26 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>   	return rq;
>   }
>   
> +struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> +{
> +	struct i915_request *rq, *active = NULL;
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
> +
> +	spin_lock_irqsave(&ce->guc_active.lock, flags);
> +	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> +				    sched.link) {
> +		if (i915_request_completed(rq))
> +			break;
> +
> +		active = rq;
> +	}
> +	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> +
> +	return active;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_context.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index a592a9605dc8..3363b59c0c40 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -201,6 +201,9 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
>   
>   struct i915_request *intel_context_create_request(struct intel_context *ce);
>   
> +struct i915_request *
> +intel_context_find_active_request(struct intel_context *ce);
> +
>   static inline struct intel_ring *__intel_context_ring_size(u64 sz)
>   {
>   	return u64_to_ptr(struct intel_ring, sz);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index e9e0657f847a..6ea5643a3aaa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -245,7 +245,7 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>   				   ktime_t *now);
>   
>   struct i915_request *
> -intel_engine_find_active_request(struct intel_engine_cs *engine);
> +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
>   
>   u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>   struct intel_context *
> @@ -328,4 +328,23 @@ intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
>   	return engine->cops->get_sibling(engine, sibling);
>   }
>   
> +static inline void
> +intel_engine_set_hung_context(struct intel_engine_cs *engine,
> +			      struct intel_context *ce)
> +{
> +	engine->hung_ce = ce;
> +}
> +
> +static inline void
> +intel_engine_clear_hung_context(struct intel_engine_cs *engine)
> +{
> +	intel_engine_set_hung_context(engine, NULL);
> +}
> +
> +static inline struct intel_context *
> +intel_engine_get_hung_context(struct intel_engine_cs *engine)
> +{
> +	return engine->hung_ce;
> +}
> +
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 69245670b8b0..1d243b83b023 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1671,7 +1671,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   	drm_printf(m, "\tRequests:\n");
>   
>   	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -	rq = intel_engine_find_active_request(engine);
> +	rq = intel_engine_execlist_find_hung_request(engine);
>   	if (rq) {
>   		struct intel_timeline *tl = get_timeline(rq);
>   
> @@ -1782,10 +1782,17 @@ static bool match_ring(struct i915_request *rq)
>   }
>   
>   struct i915_request *
> -intel_engine_find_active_request(struct intel_engine_cs *engine)
> +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>   {
>   	struct i915_request *request, *active = NULL;
>   
> +	/*
> +	 * This search does not work in GuC submission mode. However, the GuC
> +	 * will report the hanging context directly to the driver itself. So
> +	 * the driver should never get here when in GuC mode.
> +	 */
> +	GEM_BUG_ON(intel_uc_uses_guc_submission(&engine->gt->uc));
> +
>   	/*
>   	 * We are called by the error capture, reset and to dump engine
>   	 * state at random points in time. In particular, note that neither is
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index f9d264c008e8..0ceffa2be7a7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -303,6 +303,8 @@ struct intel_engine_cs {
>   	/* keep a request in reserve for a [pm] barrier under oom */
>   	struct i915_request *request_pool;
>   
> +	struct intel_context *hung_ce;
> +
>   	struct llist_head barrier_tasks;
>   
>   	struct intel_context *kernel_context; /* pinned */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c3223958dfe0..315edeaa186a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -727,24 +727,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> -static struct i915_request *context_find_active_request(struct intel_context *ce)
> -{
> -	struct i915_request *rq, *active = NULL;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ce->guc_active.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> -				    sched.link) {
> -		if (i915_request_completed(rq))
> -			break;
> -
> -		active = rq;
> -	}
> -	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> -
> -	return active;
> -}
> -
>   static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   {
>   	struct i915_request *rq;
> @@ -758,7 +740,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	 */
>   	clr_context_enabled(ce);
>   
> -	rq = context_find_active_request(ce);
> +	rq = intel_context_find_active_request(ce);
>   	if (!rq) {
>   		head = ce->ring->tail;
>   		stalled = false;
> @@ -2192,6 +2174,20 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	return 0;
>   }
>   
> +static void capture_error_state(struct intel_guc *guc,
> +				struct intel_context *ce)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> +	intel_wakeref_t wakeref;
> +
> +	intel_engine_set_hung_context(engine, ce);
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		i915_capture_error_state(gt, engine->mask);
> +	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
> +}
> +
>   static void guc_context_replay(struct intel_context *ce)
>   {
>   	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> @@ -2204,6 +2200,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   				     struct intel_context *ce)
>   {
>   	trace_intel_context_reset(ce);
> +	capture_error_state(guc, ce);
>   	guc_context_replay(ce);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index cb182c6d265a..20e0a1bfadc1 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1429,20 +1429,37 @@ capture_engine(struct intel_engine_cs *engine,
>   {
>   	struct intel_engine_capture_vma *capture = NULL;
>   	struct intel_engine_coredump *ee;
> -	struct i915_request *rq;
> +	struct intel_context *ce;
> +	struct i915_request *rq = NULL;
>   	unsigned long flags;
>   
>   	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
>   	if (!ee)
>   		return NULL;
>   
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -	rq = intel_engine_find_active_request(engine);
> +	ce = intel_engine_get_hung_context(engine);
> +	if (ce) {
> +		intel_engine_clear_hung_context(engine);
> +		rq = intel_context_find_active_request(ce);
> +		if (!rq || !i915_request_started(rq))
> +			goto no_request_capture;
> +	} else {
> +		/*
> +		 * Getting here with GuC enabled means it is a forced error capture
> +		 * with no actual hang. So, no need to attempt the execlist search.
> +		 */
> +		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> +			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +			rq = intel_engine_execlist_find_hung_request(engine);
> +			spin_unlock_irqrestore(&engine->sched_engine->lock,
> +					       flags);
> +		}
> +	}
>   	if (rq)
>   		capture = intel_engine_coredump_add_request(ee, rq,
>   							    ATOMIC_MAYFAIL);
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>   	if (!capture) {
> +no_request_capture:
>   		kfree(ee);
>   		return NULL;
>   	}

