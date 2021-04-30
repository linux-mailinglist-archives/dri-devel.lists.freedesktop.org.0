Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEB36F993
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 13:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023916EEA2;
	Fri, 30 Apr 2021 11:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897E46EE81
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 11:48:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so1574366wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ztRN2QX+3bdxj6hCT+XDFOD4fkV8hdLGe+kBiNhyYMg=;
 b=L9HFOgl+1hirqQHBR7OzBZKu9X7PVYdvMqpxyVVp9vP9m7C1iM0zoQ+iErYHRR/Zry
 qi8P91wiWJbxPkmboLKTUq0lNsfm0vBuHTgfl4V2uR79kw3rd9jYHRJvZGvQxrJ+EFkJ
 PgWqqBSXwBPI/U/+zMV+Cu93Sk3qpq9mO4gN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ztRN2QX+3bdxj6hCT+XDFOD4fkV8hdLGe+kBiNhyYMg=;
 b=D8r4Sq/8aJjXJgfuzXSuL0i6LB/9o5jtyUpEQ9CLXOgqytpDOpgpdSYMo9NsGNWdKu
 3BqR2Aohe5wQHwa18nho6/u/fe1mUWfGwVb0qFHwp3OrticcuRxw/x5MLjPA2MBG9XhC
 5dDd+cB2AL1bNmlt6xi5UK1sNPiK6fZ2kKDA5RqgjV87zHkE4RhSy2wmSn8rsKjcn91I
 +mLBg2GJ293K8NP5Qe2VkjA0aY2SiXABbD/dNGNDdewCUsZzHjo8NOr0zhEwaoVsIuaG
 bMmHvSr5T6uxoEPObnlhYVtWyQojf2xEZia74KueqNVZAGUw7G/SLbkytX+lLW7qzJt6
 i7UA==
X-Gm-Message-State: AOAM532chiQ1Gt4Q48v3D5YwePSf1fQU12MR6em+obxHaF+vPWf4q69w
 XD22EMfl+t0uAF3yH3z5MouJBA==
X-Google-Smtp-Source: ABdhPJxJ7zouIKlRwYAZOnbkb6YvZjmmPhVFd8LM8wYJTVP2pg4cLjyPla9Bii+elUtpO329UulQsA==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr5884265wme.68.1619783303129; 
 Fri, 30 Apr 2021 04:48:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g10sm11314228wmq.25.2021.04.30.04.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 04:48:22 -0700 (PDT)
Date: Fri, 30 Apr 2021 13:48:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Be more gentle with exiting
 non-persistent context
Message-ID: <YIvuhBHBmUesp0G1@phenom.ffwll.local>
References: <20210429094640.859825-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429094640.859825-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Zhen Han <zhen.han@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 10:46:40AM +0100, Tvrtko Ursulin wrote:
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

Can you pls explain here why this is preferrable?

> To achieve this the patch splits handling of banned contexts from simply
> exited non-persistent ones and then applies different timeouts for both
> and also extends the criteria which determines if a request should be
> scheduled back in after preemption or not.
> 
> 15ms preempt timeout grace is given to exited non-persistent contexts
> which have been empirically tested to satisfy customers requirements
> and still provides reasonably quick cleanup post exit.

Same here, a bit more detail on what exactly was the problem to be fixed
is needed.
-Daniel

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Zhen Han <zhen.han@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c     | 15 +++++++++------
>  drivers/gpu/drm/i915/gt/intel_context.h         | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_context_types.h   |  1 +
>  .../drm/i915/gt/intel_execlists_submission.c    | 12 ++++++++++--
>  drivers/gpu/drm/i915/i915_request.c             |  2 +-
>  5 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fd8ee52e17a4..5a6eba1232cd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -426,7 +426,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
>  	return engine;
>  }
>  
> -static void kill_engines(struct i915_gem_engines *engines, bool ban)
> +static void
> +kill_engines(struct i915_gem_engines *engines, bool ban, bool persistent)
>  {
>  	struct i915_gem_engines_iter it;
>  	struct intel_context *ce;
> @@ -443,6 +444,8 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  
>  		if (ban && intel_context_set_banned(ce))
>  			continue;
> +		else if (!persistent && intel_context_set_non_persistent(ce))
> +			continue;
>  
>  		/*
>  		 * Check the current active state of this context; if we
> @@ -454,7 +457,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  		engine = active_engine(ce);
>  
>  		/* First attempt to gracefully cancel the context */
> -		if (engine && !__cancel_engine(engine) && ban)
> +		if (engine && !__cancel_engine(engine) && (ban || !persistent))
>  			/*
>  			 * If we are unable to send a preemptive pulse to bump
>  			 * the context from the GPU, we have to resort to a full
> @@ -466,8 +469,6 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>  
>  static void kill_context(struct i915_gem_context *ctx)
>  {
> -	bool ban = (!i915_gem_context_is_persistent(ctx) ||
> -		    !ctx->i915->params.enable_hangcheck);
>  	struct i915_gem_engines *pos, *next;
>  
>  	spin_lock_irq(&ctx->stale.lock);
> @@ -480,7 +481,8 @@ static void kill_context(struct i915_gem_context *ctx)
>  
>  		spin_unlock_irq(&ctx->stale.lock);
>  
> -		kill_engines(pos, ban);
> +		kill_engines(pos, !ctx->i915->params.enable_hangcheck,
> +			     i915_gem_context_is_persistent(ctx));
>  
>  		spin_lock_irq(&ctx->stale.lock);
>  		GEM_BUG_ON(i915_sw_fence_signaled(&pos->fence));
> @@ -526,7 +528,8 @@ static void engines_idle_release(struct i915_gem_context *ctx,
>  
>  kill:
>  	if (list_empty(&engines->link)) /* raced, already closed */
> -		kill_engines(engines, true);
> +		kill_engines(engines, true,
> +			     i915_gem_context_is_persistent(ctx));
>  
>  	i915_sw_fence_commit(&engines->fence);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index f83a73a2b39f..b0e812b8ce39 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -220,6 +220,23 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
>  	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
>  }
>  
> +static inline bool intel_context_is_non_persistent(const struct intel_context *ce)
> +{
> +	return test_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
> +}
> +
> +static inline bool intel_context_set_non_persistent(struct intel_context *ce)
> +{
> +	return test_and_set_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
> +}
> +
> +static inline bool intel_context_is_schedulable(const struct intel_context *ce)
> +{
> +	return !intel_context_is_banned(ce) &&
> +	       !(intel_context_is_closed(ce) &&
> +	         intel_context_is_non_persistent(ce));
> +}
> +
>  static inline bool
>  intel_context_force_single_submission(const struct intel_context *ce)
>  {
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index ed8c447a7346..aa949c539e93 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -95,6 +95,7 @@ struct intel_context {
>  #define CONTEXT_BANNED			6
>  #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>  #define CONTEXT_NOPREEMPT		8
> +#define CONTEXT_NON_PERSISTENT		9 /* Only if also closed. */
>  
>  	struct {
>  		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de124870af44..5ad7272fbbc4 100644
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
> @@ -1204,12 +1204,20 @@ static void record_preemption(struct intel_engine_execlists *execlists)
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
> +	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>  		return 1;
> +	/* Longer grace for closed non-persistent contexts to avoid resets. */
> +	else if (unlikely(intel_context_is_closed(ce) &&
> +			  intel_context_is_non_persistent(ce)))
> +		return 15;
>  
>  	return READ_ONCE(engine->props.preempt_timeout_ms);
>  }
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index bec9c3652188..bbac87535923 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -660,7 +660,7 @@ bool __i915_request_submit(struct i915_request *request)
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
