Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F723F8903
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAAE6E855;
	Thu, 26 Aug 2021 13:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1656E85A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:32:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id mf2so6288534ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AOGv9B9doUvum8MEGKIxsYq114Ml/vE28rODZJx9YZI=;
 b=KUMYYObFXH/5bb84WCNC9JjdlF2q7SHewGhFxlFQTYU+m7Rvg5m27G9p3MIkBXqqqS
 0leCJNKYDdeteHZeE0b4+Ty8R/nDaCnA9zvK8gAxvPRZfD++GTLYywxsNzHvQBUcvr+b
 v4AcIP32r220w9PmHd9xQjZ1Nm8RcqJxn9YH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AOGv9B9doUvum8MEGKIxsYq114Ml/vE28rODZJx9YZI=;
 b=DrT0l9yqbZ3/Mzr+WOSSKJeIn/pWCL5W4975fwkdzOBjbkTAnjQkuJbs0h8koSTrhI
 o/5gLHvEWaWGgf5M18DTS/+sDQC0+iOUgkAS6rW6de2ImMNibITvXNXU11pBbFps0pA9
 Urr3WZWsMpZIFaZTJNPmjH7f/qCkb8PGoxHBRd4HtE8bnmHEazlDUTLdwG/L3Ev8sBzj
 WiwU1Pe7G/rGvykZTimgPQ53kCHU0Gzhwswm8di39ddTWzTwF0dPxSMem64AFkcydWVJ
 QFONACvK/doiRbjXadtK1ucZ7zQMMTZTuh2uupbWvilEbrx5qYGFp2Vt/BlYw1PHfHHd
 Z9rQ==
X-Gm-Message-State: AOAM532+g11zX9NaRXLq3PRcZR5NhjBNADxQEkz/PRUuG/JXyoQzA4A2
 2dQ+hac+4GhY13Jy54OHTATlKA==
X-Google-Smtp-Source: ABdhPJysUAhrIEp7dhYE5xPCv+76zsM1cmt6XO46VSdN8/FJpwpjasTA7Sng91glGQzzFu9aEgEiIg==
X-Received: by 2002:a17:906:93e1:: with SMTP id
 yl1mr4409696ejb.334.1629984732809; 
 Thu, 26 Aug 2021 06:32:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm1477361ejr.27.2021.08.26.06.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:32:12 -0700 (PDT)
Date: Thu, 26 Aug 2021 15:32:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Zhen Han <zhen.han@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915: Be more gentle when exiting non-persistent
 contexts
Message-ID: <YSeX2q9FiWEj3HVs@phenom.ffwll.local>
References: <20210826105214.152713-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826105214.152713-1-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 26, 2021 at 11:52:14AM +0100, Tvrtko Ursulin wrote:
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
> closed non-persistent ones and then applies different timeouts for both
> and also extends the criteria which determines if a request should be
> scheduled back in after preemption or not.
> 
> 20ms preempt timeout grace is given to exited non-persistent contexts
> which have been empirically tested to satisfy customers requirements
> and still provides reasonably quick cleanup post exit.
> 
> v2:
>  * Streamline fast path checks.
> 
> v3:
>  * Simplify by using only schedulable status.
>  * Increase timeout to 20ms.
> 
> v4:
>  * Fix live_execlists selftest.
> 
> v5:
>  * Fix logic in kill_engines.
> 
> v6:
>  * Rebase.
> 
> v7:
>  * Add GuC support.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Zhen Han <zhen.han@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 22 +++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_context.c       | 25 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_context.h       | 26 ++++++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  3 ++-
>  .../drm/i915/gt/intel_execlists_submission.c  | 13 +++++++---
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  7 ++---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++----
>  drivers/gpu/drm/i915/i915_request.c           |  2 +-
>  8 files changed, 84 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fd169cf2f75a..6ae803cb4de3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1072,7 +1072,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
>  	return engine;
>  }
>  
> -static void kill_engines(struct i915_gem_engines *engines, bool ban)
> +static void
> +kill_engines(struct i915_gem_engines *engines, bool ban, bool persistent)
>  {
>  	struct i915_gem_engines_iter it;
>  	struct intel_context *ce;
> @@ -1086,8 +1087,15 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  	 */
>  	for_each_gem_engine(ce, engines, it) {
>  		struct intel_engine_cs *engine;
> +		bool skip = false;
>  
> -		if (ban && intel_context_ban(ce, NULL))
> +		if (ban)
> +			skip = intel_context_ban(ce, NULL);
> +		else if (!persistent)
> +			skip = intel_context_exit_nonpersistent(ce, NULL);
> +
> +		/* Already banned or non-persistent closed. */
> +		if (skip)
>  			continue;
>  
>  		/*
> @@ -1100,7 +1108,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  		engine = active_engine(ce);
>  
>  		/* First attempt to gracefully cancel the context */
> -		if (engine && !__cancel_engine(engine) && ban)
> +		if (engine && !__cancel_engine(engine) && (ban || !persistent))
>  			/*
>  			 * If we are unable to send a preemptive pulse to bump
>  			 * the context from the GPU, we have to resort to a full
> @@ -1112,8 +1120,6 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  
>  static void kill_context(struct i915_gem_context *ctx)
>  {
> -	bool ban = (!i915_gem_context_is_persistent(ctx) ||
> -		    !ctx->i915->params.enable_hangcheck);
>  	struct i915_gem_engines *pos, *next;
>  
>  	spin_lock_irq(&ctx->stale.lock);
> @@ -1126,7 +1132,8 @@ static void kill_context(struct i915_gem_context *ctx)
>  
>  		spin_unlock_irq(&ctx->stale.lock);
>  
> -		kill_engines(pos, ban);
> +		kill_engines(pos, !ctx->i915->params.enable_hangcheck,
> +			     i915_gem_context_is_persistent(ctx));
>  
>  		spin_lock_irq(&ctx->stale.lock);
>  		GEM_BUG_ON(i915_sw_fence_signaled(&pos->fence));
> @@ -1172,7 +1179,8 @@ static void engines_idle_release(struct i915_gem_context *ctx,
>  
>  kill:
>  	if (list_empty(&engines->link)) /* raced, already closed */
> -		kill_engines(engines, true);
> +		kill_engines(engines, true,
> +			     i915_gem_context_is_persistent(ctx));
>  
>  	i915_sw_fence_commit(&engines->fence);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 745e84c72c90..b9880ffe5da7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -533,6 +533,31 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>  	return active;
>  }
>  
> +bool intel_context_ban(struct intel_context *ce, struct i915_request *rq)
> +{
> +	bool ret = intel_context_set_banned(ce);
> +
> +	trace_intel_context_ban(ce);
> +
> +	if (ce->ops->revoke)
> +		ce->ops->revoke(ce, rq,
> +				INTEL_CONTEXT_BANNED_PREEMPT_TIMEOUT_MS);
> +
> +	return ret;
> +}
> +
> +bool intel_context_exit_nonpersistent(struct intel_context *ce,
> +				      struct i915_request *rq)
> +{
> +	bool ret = intel_context_set_exiting(ce);
> +
> +	if (ce->ops->revoke)
> +		ce->ops->revoke(ce, rq,
> +				INTEL_CONTEXT_EXITING_PREEMPT_TIMEOUT_MS);
> +
> +	return ret;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftest_context.c"
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index c41098950746..8b77f3e7449a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -25,6 +25,9 @@
>  		     ##__VA_ARGS__);					\
>  } while (0)
>  
> +#define INTEL_CONTEXT_EXITING_PREEMPT_TIMEOUT_MS (20)
> +#define INTEL_CONTEXT_BANNED_PREEMPT_TIMEOUT_MS  (1)
> +
>  struct i915_gem_ww_ctx;
>  
>  void intel_context_init(struct intel_context *ce,
> @@ -254,18 +257,27 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
>  	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
>  }
>  
> -static inline bool intel_context_ban(struct intel_context *ce,
> -				     struct i915_request *rq)
> +bool intel_context_ban(struct intel_context *ce, struct i915_request *rq);
> +
> +static inline bool intel_context_is_schedulable(const struct intel_context *ce)
>  {
> -	bool ret = intel_context_set_banned(ce);
> +	return !test_bit(CONTEXT_EXITING, &ce->flags) &&
> +	       !test_bit(CONTEXT_BANNED, &ce->flags);
> +}
>  
> -	trace_intel_context_ban(ce);
> -	if (ce->ops->ban)
> -		ce->ops->ban(ce, rq);
> +static inline bool intel_context_is_exiting(const struct intel_context *ce)
> +{
> +	return test_bit(CONTEXT_EXITING, &ce->flags);
> +}
>  
> -	return ret;
> +static inline bool intel_context_set_exiting(struct intel_context *ce)
> +{
> +	return test_and_set_bit(CONTEXT_EXITING, &ce->flags);

Uh more unordered atomics without barriers and without comments explaining
the barriers and pointing at the counter-party barrier. This needs to be
fixed.

In general it would be really good if all the context status bits are at
least properly documented. As-is this is an extremely challenging maze,
and I'm not sure it's really correct in all cases.
-Daniel

>  }
>  
> +bool intel_context_exit_nonpersistent(struct intel_context *ce,
> +				      struct i915_request *rq);
> +
>  static inline bool
>  intel_context_force_single_submission(const struct intel_context *ce)
>  {
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e54351a170e2..4a0a1e736972 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -37,7 +37,7 @@ struct intel_context_ops {
>  
>  	int (*alloc)(struct intel_context *ce);
>  
> -	void (*ban)(struct intel_context *ce, struct i915_request *rq);
> +	void (*revoke)(struct intel_context *ce, struct i915_request *rq, unsigned int preempt_timeout_ms);
>  
>  	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
>  	int (*pin)(struct intel_context *ce, void *vaddr);
> @@ -112,6 +112,7 @@ struct intel_context {
>  #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>  #define CONTEXT_NOPREEMPT		8
>  #define CONTEXT_LRCA_DIRTY		9
> +#define CONTEXT_EXITING			10
>  
>  	struct {
>  		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..43823b9d4013 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -478,7 +478,7 @@ __execlists_schedule_in(struct i915_request *rq)
>  		     !intel_engine_has_heartbeat(engine)))
>  		intel_context_set_banned(ce);
>  
> -	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
> +	if (unlikely(!intel_context_is_schedulable(ce) || bad_request(rq)))
>  		reset_active(rq, engine);
>  
>  	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> @@ -1222,12 +1222,19 @@ static void record_preemption(struct intel_engine_execlists *execlists)
>  static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
>  					    const struct i915_request *rq)
>  {
> +	struct intel_context *ce;
> +
>  	if (!rq)
>  		return 0;
>  
> +	ce = rq->context;
> +
>  	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
> -	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
> -		return 1;
> +	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
> +		return INTEL_CONTEXT_BANNED_PREEMPT_TIMEOUT_MS;
> +	/* Longer grace for closed non-persistent contexts to avoid resets. */
> +	else if (unlikely(intel_context_is_exiting(ce)))
> +		return INTEL_CONTEXT_EXITING_PREEMPT_TIMEOUT_MS;
>  
>  	return READ_ONCE(engine->props.preempt_timeout_ms);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 3c65efcb7bed..a28862bbe51e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -587,8 +587,9 @@ static void ring_context_reset(struct intel_context *ce)
>  	clear_bit(CONTEXT_VALID_BIT, &ce->flags);
>  }
>  
> -static void ring_context_ban(struct intel_context *ce,
> -			     struct i915_request *rq)
> +static void ring_context_revoke(struct intel_context *ce,
> +				struct i915_request *rq,
> +				unsigned int preempt_timeout_ms)
>  {
>  	struct intel_engine_cs *engine;
>  
> @@ -623,7 +624,7 @@ static const struct intel_context_ops ring_context_ops = {
>  
>  	.cancel_request = ring_context_cancel_request,
>  
> -	.ban = ring_context_ban,
> +	.revoke = ring_context_revoke,
>  
>  	.pre_pin = ring_context_pre_pin,
>  	.pin = ring_context_pin,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 87d8dc8f51b9..b0a8629b26e3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1618,7 +1618,9 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>  	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>  }
>  
> -static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> +static void
> +guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
> +		   unsigned int preempt_timeout_ms)
>  {
>  	struct intel_guc *guc = ce_to_guc(ce);
>  	struct intel_runtime_pm *runtime_pm =
> @@ -1655,7 +1657,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>  		 * gets kicked off the HW ASAP.
>  		 */
>  		with_intel_runtime_pm(runtime_pm, wakeref) {
> -			__guc_context_set_preemption_timeout(guc, guc_id, 1);
> +			__guc_context_set_preemption_timeout(guc, guc_id,
> +							     preempt_timeout_ms);
>  			__guc_context_sched_disable(guc, ce, guc_id);
>  		}
>  	} else {
> @@ -1663,7 +1666,7 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>  			with_intel_runtime_pm(runtime_pm, wakeref)
>  				__guc_context_set_preemption_timeout(guc,
>  								     ce->guc_id,
> -								     1);
> +								     preempt_timeout_ms);
>  		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  	}
>  }
> @@ -1979,7 +1982,7 @@ static const struct intel_context_ops guc_context_ops = {
>  	.unpin = guc_context_unpin,
>  	.post_unpin = guc_context_post_unpin,
>  
> -	.ban = guc_context_ban,
> +	.revoke = guc_context_revoke,
>  
>  	.cancel_request = guc_context_cancel_request,
>  
> @@ -2176,7 +2179,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>  	.unpin = guc_context_unpin,
>  	.post_unpin = guc_context_post_unpin,
>  
> -	.ban = guc_context_ban,
> +	.revoke = guc_context_revoke,
>  
>  	.cancel_request = guc_context_cancel_request,
>  
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ce446716d092..b1a9bec83339 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -583,7 +583,7 @@ bool __i915_request_submit(struct i915_request *request)
>  		goto active;
>  	}
>  
> -	if (unlikely(intel_context_is_banned(request->context)))
> +	if (unlikely(!intel_context_is_schedulable(request->context)))
>  		i915_request_set_error_once(request, -EIO);
>  
>  	if (unlikely(fatal_error(request->fence.error)))
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
