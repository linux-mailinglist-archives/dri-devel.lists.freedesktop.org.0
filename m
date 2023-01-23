Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D96783A0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20910E51C;
	Mon, 23 Jan 2023 17:51:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358C010E51C;
 Mon, 23 Jan 2023 17:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674496284; x=1706032284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=28lcVW9swczBWUhKgQyV38o/Mj7sSzQ1k4iegl2amYU=;
 b=JDaLJ/YAEqqt/JcOm17rILc46qNOMb7qXIQg/ndpjOWR6cSx+DqeQpKB
 Rjex2dybfxDCrQ/UDbtasrOT6G8e3zOXNT4qJM4RK/emkTMEezG4In4Ti
 cCcDq5v1GBX77iT4qgjQba+wEv3+KnKkZKgmeKTrR1Yq053ViYlD1BOeN
 dpJOQ6woxIrupXGDL2Me3+QHXVyq9ClNBaEwuWnSAcjkYwdl4SR4GoFdP
 y7W3IOUBajCkZxefkjouLisCDOgIPml7bSCrMU6nTbXA3dWBsURh2wGL9
 Xqu4XGX3MUxVqpaQw2YD6ApwhRlbSqRCYyQUyGepmqq6D9CS+8OaUYg0o w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327361716"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="327361716"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:51:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785753731"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="785753731"
Received: from bridge4x-mobl.ger.corp.intel.com (HELO [10.213.214.72])
 ([10.213.214.72])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:51:05 -0800
Message-ID: <fd011cd7-7212-ff77-0e1d-56cdc1372e3a@linux.intel.com>
Date: Mon, 23 Jan 2023 17:51:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/7] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230120232831.28177-2-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When GuC support was added to error capture, the locking around the
> request object was broken. Fix it up.
> 
> The context based search manages the spinlocking around the search
> internally. So it needs to grab the reference count internally as
> well. The execlist only request based search relies on external
> locking, so it needs an external reference count but within the
> spinlock not outside it.
> 
> The only other caller of the context based search is the code for
> dumping engine state to debugfs. That code wasn't previously getting
> an explicit reference at all as it does everything while holding the
> execlist specific spinlock. So, that needs updaing as well as that
> spinlock doesn't help when using GuC submission. Rather than trying to
> conditionally get/put depending on submission model, just change it to
> always do the get/put.
> 
> In addition, intel_guc_find_hung_context() was not acquiring the
> correct spinlock before searching the request list. So fix that up
> too. While at it, add some extra whitespace padding for readability.

Is this part splittable into a separate patch?

> 
> v2: Explicitly document adding an extra blank line in some dense code
> (Andy Shevchenko). Fix multiple potential null pointer derefs in case
> of no request found (some spotted by Tvrtko, but there was more!).
> Also fix a leaked request in case of !started and another in
> __guc_reset_context now that intel_context_find_active_request is
> actually reference counting the returned request.
> v3: Add a _get suffix to intel_context_find_active_request now that it
> grabs a reference (Daniele).
> 
> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Michael Cheng <michael.cheng@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c           |  4 +++-
>   drivers/gpu/drm/i915/gt/intel_context.h           |  3 +--
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  6 +++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++++-
>   drivers/gpu/drm/i915/i915_gpu_error.c             | 13 ++++++-------
>   5 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index e94365b08f1ef..4285c1c71fa12 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -528,7 +528,7 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>   	return rq;
>   }
>   
> -struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> +struct i915_request *intel_context_find_active_request_get(struct intel_context *ce)

TBH I don't "dig" this name, it's a bit on the long side and feels out of character. I won't insist it be changed, but if get really has to be included in the name I would be happy with intel_context_get_active_request().

>   {
>   	struct intel_context *parent = intel_context_to_parent(ce);
>   	struct i915_request *rq, *active = NULL;
> @@ -552,6 +552,8 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   
>   		active = rq;
>   	}
> +	if (active)
> +		active = i915_request_get_rcu(active);
>   	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index fb62b7b8cbcda..ccc80c6607ca8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -268,8 +268,7 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
>   
>   struct i915_request *intel_context_create_request(struct intel_context *ce);
>   
> -struct i915_request *
> -intel_context_find_active_request(struct intel_context *ce);
> +struct i915_request *intel_context_find_active_request_get(struct intel_context *ce);
>   
>   static inline bool intel_context_is_barrier(const struct intel_context *ce)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 922f1bb22dc68..fbc0a81617e89 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2237,9 +2237,11 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	if (guc) {
>   		ce = intel_engine_get_hung_context(engine);
>   		if (ce)
> -			hung_rq = intel_context_find_active_request(ce);
> +			hung_rq = intel_context_find_active_request_get(ce);
>   	} else {
>   		hung_rq = intel_engine_execlist_find_hung_request(engine);
> +		if (hung_rq)
> +			hung_rq = i915_request_get_rcu(hung_rq);
>   	}
>   
>   	if (hung_rq)
> @@ -2250,6 +2252,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	else
>   		intel_engine_dump_active_requests(&engine->sched_engine->requests,
>   						  hung_rq, m);
> +	if (hung_rq)
> +		i915_request_put(hung_rq);

Argh... this is so horrible - not your patch - but the existing state of GuC backend was plugged in. I honestly don't know what to suggest here at this point... Above we have:

	if (guc)
		intel_guc_dump_active_requests(engine, hung_rq, m);
	else
		intel_engine_dump_active_requests(&engine->sched_engine->requests,
						  hung_rq, m);

As per your analysis the execlists code wants one lock held over that, especially when it calls intel_engine_dump_active_requests, which the GuC backed will also call from intel_guc_dump_active_requests (!) just needs a different lock held around it.

Is the lock held by intel_engine_dump over the call to engine_dump_active_requests truly useless in case of GuC? Or just wrong scope (too wide)?

>   }
>   
>   void intel_engine_dump(struct intel_engine_cs *engine,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..ad4b2848b0f83 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1702,7 +1702,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
>   			goto next_context;
>   
>   		guilty = false;
> -		rq = intel_context_find_active_request(ce);
> +		rq = intel_context_find_active_request_get(ce);
>   		if (!rq) {
>   			head = ce->ring->tail;
>   			goto out_replay;
> @@ -1715,6 +1715,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
>   		head = intel_ring_wrap(ce->ring, rq->head);
>   
>   		__i915_request_reset(rq, guilty);
> +		i915_request_put(rq);
>   out_replay:
>   		guc_reset_state(ce, head, guilty);
>   next_context:
> @@ -4820,6 +4821,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> +		bool found;
> +
>   		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> @@ -4836,10 +4839,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   				goto next;
>   		}
>   
> +		found = false;
> +		spin_lock(&ce->guc_state.lock);
>   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>   				continue;
>   
> +			found = true;
> +			break;
> +		}
> +		spin_unlock(&ce->guc_state.lock);
> +
> +		if (found) {
>   			intel_engine_set_hung_context(engine, ce);
>   
>   			/* Can only cope with one hang at a time... */
> @@ -4847,6 +4858,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   			xa_lock(&guc->context_lookup);
>   			goto done;
>   		}
> +
>   next:
>   		intel_context_put(ce);
>   		xa_lock(&guc->context_lookup);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64e..5c73dfa2fb3f6 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1607,7 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
>   	ce = intel_engine_get_hung_context(engine);
>   	if (ce) {
>   		intel_engine_clear_hung_context(engine);
> -		rq = intel_context_find_active_request(ce);
> +		rq = intel_context_find_active_request_get(ce);
>   		if (!rq || !i915_request_started(rq))
>   			goto no_request_capture;
>   	} else {
> @@ -1618,21 +1618,18 @@ capture_engine(struct intel_engine_cs *engine,
>   		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>   			spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   			rq = intel_engine_execlist_find_hung_request(engine);
> +			if (rq)
> +				rq = i915_request_get_rcu(rq);
>   			spin_unlock_irqrestore(&engine->sched_engine->lock,
>   					       flags);

Is it possible to consolidate this block with the one in engine_dump_active_requests? They seem identical..

	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
	if (guc) {
		ce = intel_engine_get_hung_context(engine);
		if (ce)
			hung_rq = intel_context_find_active_request(ce);
	} else {
		hung_rq = intel_engine_execlist_find_hung_request(engine);
	}


vs

	ce = intel_engine_get_hung_context(engine);
	if (ce) {
		intel_engine_clear_hung_context(engine);
		rq = intel_context_find_active_request(ce);
		if (!rq || !i915_request_started(rq))
			goto no_request_capture;
	} else {
		/*
		 * Getting here with GuC enabled means it is a forced error capture
		 * with no actual hang. So, no need to attempt the execlist search.
		 */
		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
			spin_lock_irqsave(&engine->sched_engine->lock, flags);
			rq = intel_engine_execlist_find_hung_request(engine);
			spin_unlock_irqrestore(&engine->sched_engine->lock,
					       flags);
		}
	}

We'd need a backend agnostic helper like:

intel_engine_get_hung_request(...)
{
...
	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
	if (guc) {
		ce = intel_engine_get_hung_context(engine);
		if (ce)
			hung_rq = intel_context_find_active_request(ce);
	} else {
		hung_rq = intel_engine_execlist_find_hung_request(engine);
	}

If locking can be untangled to work correctly for both callers.

Looks like I can't do a quick review on this but need to set aside a larger chunk of time. I'll try tomorrow.

Regards,

Tvrtko

>   		}
>   	}
> -	if (rq)
> -		rq = i915_request_get_rcu(rq);
> -
>   	if (!rq)
>   		goto no_request_capture;
>   
>   	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> -	if (!capture) {
> -		i915_request_put(rq);
> +	if (!capture)
>   		goto no_request_capture;
> -	}
>   	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>   		intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>   
> @@ -1642,6 +1639,8 @@ capture_engine(struct intel_engine_cs *engine,
>   	return ee;
>   
>   no_request_capture:
> +	if (rq)
> +		i915_request_put(rq);
>   	kfree(ee);
>   	return NULL;
>   }
