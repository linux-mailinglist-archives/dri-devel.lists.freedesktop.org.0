Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBFC3C6D12
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 11:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0989A1A;
	Tue, 13 Jul 2021 09:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786A89A1A;
 Tue, 13 Jul 2021 09:16:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210105022"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="210105022"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 02:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="459513798"
Received: from mphilpot-mobl.ger.corp.intel.com (HELO [10.213.255.124])
 ([10.213.255.124])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 02:16:53 -0700
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Be more gentle with exiting
 non-persistent context
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
References: <20210614120906.1616120-1-tvrtko.ursulin@linux.intel.com>
 <20210616100939.2096552-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0ceb2c60-b4be-8b4a-0aa4-288196edba51@linux.intel.com>
Date: Tue, 13 Jul 2021 10:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616100939.2096552-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Zhen Han <zhen.han@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ping for any reviewers? This fixes a customer issue on heavily loaded 
transcode boxes by avoiding false GPU hang reports upon pressing Ctrl-C.

Regards,

Tvrtko

On 16/06/2021 11:09, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> When a non-persistent context exits we currently mark it as banned in
> order to trigger fast termination of any outstanding GPU jobs it may have
> left running.
> 
> In doing so we apply a very strict 1ms limit in which the left over job
> has to preempt before we issues an engine resets.
> 
> Some workloads are not able to cleanly preempt in that time window and it
> can be argued that it would instead be better to give them a bit more
> grace since avoiding engine resets is generally preferrable.
> 
> To achieve this the patch splits handling of banned contexts from simply
> exited non-persistent ones and then applies different timeouts for both
> and also extends the criteria which determines if a request should be
> scheduled back in after preemption or not.
> 
> 15ms preempt timeout grace is given to exited non-persistent contexts
> which have been empirically tested to satisfy customers requirements
> and still provides reasonably quick cleanup post exit.
> 
> v2:
>   * Streamline fast path checks.
> 
> v3:
>   * Simplify by using only schedulable status.
>   * Increase timeout to 20ms.
> 
> v4:
>   * Fix live_execlists selftest.
> 
> v5:
>   * Fix logic in kill_engines.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Zhen Han <zhen.han@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 22 +++++++++++++------
>   drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
>   drivers/gpu/drm/i915/gt/intel_context.h       | 17 +++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
>   .../drm/i915/gt/intel_execlists_submission.c  | 11 ++++++++--
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  | 20 +++++++++++------
>   drivers/gpu/drm/i915/i915_request.c           |  2 +-
>   7 files changed, 57 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7720b8c22c81..6289d82d55d1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -426,7 +426,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
>   	return engine;
>   }
>   
> -static void kill_engines(struct i915_gem_engines *engines, bool ban)
> +static void
> +kill_engines(struct i915_gem_engines *engines, bool ban, bool persistent)
>   {
>   	struct i915_gem_engines_iter it;
>   	struct intel_context *ce;
> @@ -440,8 +441,15 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   	 */
>   	for_each_gem_engine(ce, engines, it) {
>   		struct intel_engine_cs *engine;
> +		bool skip = false;
>   
> -		if (ban && intel_context_set_banned(ce))
> +		if (ban)
> +			skip = intel_context_set_banned(ce);
> +		else if (!persistent)
> +			skip = !intel_context_clear_schedulable(ce);
> +
> +		/* Already previously banned or made non-schedulable? */
> +		if (skip)
>   			continue;
>   
>   		/*
> @@ -454,7 +462,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   		engine = active_engine(ce);
>   
>   		/* First attempt to gracefully cancel the context */
> -		if (engine && !__cancel_engine(engine) && ban)
> +		if (engine && !__cancel_engine(engine) && (ban || !persistent))
>   			/*
>   			 * If we are unable to send a preemptive pulse to bump
>   			 * the context from the GPU, we have to resort to a full
> @@ -466,8 +474,6 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   
>   static void kill_context(struct i915_gem_context *ctx)
>   {
> -	bool ban = (!i915_gem_context_is_persistent(ctx) ||
> -		    !ctx->i915->params.enable_hangcheck);
>   	struct i915_gem_engines *pos, *next;
>   
>   	spin_lock_irq(&ctx->stale.lock);
> @@ -480,7 +486,8 @@ static void kill_context(struct i915_gem_context *ctx)
>   
>   		spin_unlock_irq(&ctx->stale.lock);
>   
> -		kill_engines(pos, ban);
> +		kill_engines(pos, !ctx->i915->params.enable_hangcheck,
> +			     i915_gem_context_is_persistent(ctx));
>   
>   		spin_lock_irq(&ctx->stale.lock);
>   		GEM_BUG_ON(i915_sw_fence_signaled(&pos->fence));
> @@ -526,7 +533,8 @@ static void engines_idle_release(struct i915_gem_context *ctx,
>   
>   kill:
>   	if (list_empty(&engines->link)) /* raced, already closed */
> -		kill_engines(engines, true);
> +		kill_engines(engines, true,
> +			     i915_gem_context_is_persistent(ctx));
>   
>   	i915_sw_fence_commit(&engines->fence);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 4033184f13b9..9d539f48d7c6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -373,6 +373,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->sseu = engine->sseu;
>   	ce->ring = __intel_context_ring_size(SZ_4K);
>   
> +	__set_bit(CONTEXT_SCHEDULABLE, &ce->flags);
> +
>   	ewma_runtime_init(&ce->runtime.avg);
>   
>   	ce->vm = i915_vm_get(engine->gt->vm);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index f83a73a2b39f..28d955668e49 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -217,7 +217,22 @@ static inline bool intel_context_is_banned(const struct intel_context *ce)
>   
>   static inline bool intel_context_set_banned(struct intel_context *ce)
>   {
> -	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
> +	bool banned = test_and_set_bit(CONTEXT_BANNED, &ce->flags);
> +
> +	if (!banned)
> +		clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
> +
> +	return banned;
> +}
> +
> +static inline bool intel_context_clear_schedulable(struct intel_context *ce)
> +{
> +	return test_and_clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
> +}
> +
> +static inline bool intel_context_is_schedulable(const struct intel_context *ce)
> +{
> +	return test_bit(CONTEXT_SCHEDULABLE, &ce->flags);
>   }
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index ed8c447a7346..79d0bff7927a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -95,6 +95,7 @@ struct intel_context {
>   #define CONTEXT_BANNED			6
>   #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>   #define CONTEXT_NOPREEMPT		8
> +#define CONTEXT_SCHEDULABLE		9  /* Unless banned or non-persistent closed. */
>   
>   	struct {
>   		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index fc77592d88a9..ed9c4f6969f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -479,7 +479,7 @@ __execlists_schedule_in(struct i915_request *rq)
>   		     !intel_engine_has_heartbeat(engine)))
>   		intel_context_set_banned(ce);
>   
> -	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
> +	if (unlikely(!intel_context_is_schedulable(ce) || bad_request(rq)))
>   		reset_active(rq, engine);
>   
>   	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> @@ -1205,12 +1205,19 @@ static void record_preemption(struct intel_engine_execlists *execlists)
>   static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
>   					    const struct i915_request *rq)
>   {
> +	struct intel_context *ce;
> +
>   	if (!rq)
>   		return 0;
>   
> +	ce = rq->context;
> +
>   	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
> -	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
> +	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>   		return 1;
> +	/* Longer grace for closed non-persistent contexts to avoid resets. */
> +	else if (unlikely(!intel_context_is_schedulable(ce)))
> +		return 20;
>   
>   	return READ_ONCE(engine->props.preempt_timeout_ms);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 1c8108d30b85..0fdc706058e0 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -2050,6 +2050,12 @@ struct live_preempt_cancel {
>   	struct preempt_client a, b;
>   };
>   
> +static void context_clear_banned(struct intel_context *ce)
> +{
> +	clear_bit(CONTEXT_BANNED, &ce->flags);
> +	set_bit(CONTEXT_SCHEDULABLE, &ce->flags);
> +}
> +
>   static int __cancel_active0(struct live_preempt_cancel *arg)
>   {
>   	struct i915_request *rq;
> @@ -2068,7 +2074,7 @@ static int __cancel_active0(struct live_preempt_cancel *arg)
>   	if (IS_ERR(rq))
>   		return PTR_ERR(rq);
>   
> -	clear_bit(CONTEXT_BANNED, &rq->context->flags);
> +	context_clear_banned(rq->context);
>   	i915_request_get(rq);
>   	i915_request_add(rq);
>   	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
> @@ -2112,7 +2118,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
>   	if (IS_ERR(rq[0]))
>   		return PTR_ERR(rq[0]);
>   
> -	clear_bit(CONTEXT_BANNED, &rq[0]->context->flags);
> +	context_clear_banned(rq[0]->context);
>   	i915_request_get(rq[0]);
>   	i915_request_add(rq[0]);
>   	if (!igt_wait_for_spinner(&arg->a.spin, rq[0])) {
> @@ -2128,7 +2134,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
>   		goto out;
>   	}
>   
> -	clear_bit(CONTEXT_BANNED, &rq[1]->context->flags);
> +	context_clear_banned(rq[1]->context);
>   	i915_request_get(rq[1]);
>   	err = i915_request_await_dma_fence(rq[1], &rq[0]->fence);
>   	i915_request_add(rq[1]);
> @@ -2183,7 +2189,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
>   	if (IS_ERR(rq[0]))
>   		return PTR_ERR(rq[0]);
>   
> -	clear_bit(CONTEXT_BANNED, &rq[0]->context->flags);
> +	context_clear_banned(rq[0]->context);
>   	i915_request_get(rq[0]);
>   	i915_request_add(rq[0]);
>   	if (!igt_wait_for_spinner(&arg->a.spin, rq[0])) {
> @@ -2197,7 +2203,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
>   		goto out;
>   	}
>   
> -	clear_bit(CONTEXT_BANNED, &rq[1]->context->flags);
> +	context_clear_banned(rq[1]->context);
>   	i915_request_get(rq[1]);
>   	err = i915_request_await_dma_fence(rq[1], &rq[0]->fence);
>   	i915_request_add(rq[1]);
> @@ -2273,7 +2279,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
>   	if (IS_ERR(rq))
>   		return PTR_ERR(rq);
>   
> -	clear_bit(CONTEXT_BANNED, &rq->context->flags);
> +	context_clear_banned(rq->context);
>   	i915_request_get(rq);
>   	i915_request_add(rq);
>   	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
> @@ -2329,7 +2335,7 @@ static int __cancel_fail(struct live_preempt_cancel *arg)
>   	if (IS_ERR(rq))
>   		return PTR_ERR(rq);
>   
> -	clear_bit(CONTEXT_BANNED, &rq->context->flags);
> +	context_clear_banned(rq->context);
>   	i915_request_get(rq);
>   	i915_request_add(rq);
>   	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 1014c71cf7f5..5beaa18d6c7a 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -660,7 +660,7 @@ bool __i915_request_submit(struct i915_request *request)
>   		goto active;
>   	}
>   
> -	if (unlikely(intel_context_is_banned(request->context)))
> +	if (unlikely(!intel_context_is_schedulable(request->context)))
>   		i915_request_set_error_once(request, -EIO);
>   
>   	if (unlikely(fatal_error(request->fence.error)))
> 
