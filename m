Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAC679C23
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD93C10E691;
	Tue, 24 Jan 2023 14:40:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990A10E691;
 Tue, 24 Jan 2023 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674571216; x=1706107216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IzpFRTjqYvccRJv9uj5VrF3XyRd4WLL/R7SMsvcukl0=;
 b=g+JBa1gNdiW4vIur+MqmHMK4sdrb+FOav+hTh7AMDg4azSVZNmlqJA11
 shG9N1DMx788dRLk7f/CDOC8HAPQAO+wNuYRW2YdeaKgyS1bTASmejPKm
 bJ/p2Nn9xW3CfRLQWIwVCXNDLfIdt9pqDzJR2f+c//+3iyUPSkauVM0Cm
 rCgJThkDDu2ISc4smf4B3WOEh3zL58uqrKZrfmIL0ZbFfMIVSPx7TeTTI
 ChaV70eqMF8FUTTilPqY6pvByEDUF/UwdOuniL7TisOZRwt3lzW8wZ5hW
 Jfc8GxejCCMKo/DPhCYIadf0vTlz39wVzx9vieTDgkjn4fyuTxe51lZzM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412537697"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="412537697"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 06:40:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692608572"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="692608572"
Received: from ecarran-mobl1.amr.corp.intel.com (HELO [10.212.41.53])
 ([10.212.41.53])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 06:40:08 -0800
Message-ID: <f2aa8185-216a-2cb8-45be-7b7179de83ba@linux.intel.com>
Date: Tue, 24 Jan 2023 14:40:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 2/7] drm/i915: Fix up locking around
 dumping requests lists
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230120232831.28177-3-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The debugfs dump of requests was confused about what state requires
> the execlist lock versus the GuC lock. There was also a bunch of
> duplicated messy code between it and the error capture code.
> 
> So refactor the hung request search into a re-usable function. And
> reduce the span of the execlist state lock to only the execlist
> specific code paths. In order to do that, also move the report of hold
> count (which is an execlist only concept) from the top level dump
> function to the lower level execlist specific function. Also, move the
> execlist specific code into the execlist source file.
> 
> v2: Rename some functions and move to more appropriate files (Daniele).

Continuing from yesterday where you pointed out 2/7 exists, after I 
declared capitulation on 1/7.. I think this refactor makes sense and 
definitely improves things a lot.

On the high level I am only unsure if the patch split could be improved. 
There seem to be three separate things, correct me if I missed something:

1) Locking fix in intel_guc_find_hung_context
2) Ref counting change throughout
3) Locking refactor / helper consolidation

(Or 2 and 3 swapped around, not sure.)

That IMO might be a bit easier to read because first patch wouldn't have 
two logical changes in it. Maybe easier to backport too if it comes to that?

On the low level it all looks fine to me - hopefully Daniele can do a 
detailed pass.

Regards,

Tvrtko

P.S. Only that intel_context_find_active_request_get hurts my eyes, and 
inflates the diff. I wouldn't rename it but if you guys insist okay.

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 +++++++++----------
>   .../drm/i915/gt/intel_execlists_submission.c  | 27 +++++++
>   .../drm/i915/gt/intel_execlists_submission.h  |  4 +
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 26 +------
>   5 files changed, 73 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 0e24af5efee9c..b58c30ac8ef02 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -250,8 +250,8 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>   				   ktime_t *now);
>   
> -struct i915_request *
> -intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
> +				  struct intel_context **ce, struct i915_request **rq);
>   
>   u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>   struct intel_context *
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index fbc0a81617e89..1d77e27801bce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2114,17 +2114,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
>   	}
>   }
>   
> -static unsigned long list_count(struct list_head *list)
> -{
> -	struct list_head *pos;
> -	unsigned long count = 0;
> -
> -	list_for_each(pos, list)
> -		count++;
> -
> -	return count;
> -}
> -
>   static unsigned long read_ul(void *p, size_t x)
>   {
>   	return *(unsigned long *)(p + x);
> @@ -2216,11 +2205,11 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   	}
>   }
>   
> -static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
> +static void engine_dump_active_requests(struct intel_engine_cs *engine,
> +					struct drm_printer *m)
>   {
> +	struct intel_context *hung_ce = NULL;
>   	struct i915_request *hung_rq = NULL;
> -	struct intel_context *ce;
> -	bool guc;
>   
>   	/*
>   	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
> @@ -2229,29 +2218,20 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>   	 * But the intention here is just to report an instantaneous snapshot
>   	 * so that's fine.
>   	 */
> -	lockdep_assert_held(&engine->sched_engine->lock);
> +	intel_engine_get_hung_entity(engine, &hung_ce, &hung_rq);
>   
>   	drm_printf(m, "\tRequests:\n");
>   
> -	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
> -	if (guc) {
> -		ce = intel_engine_get_hung_context(engine);
> -		if (ce)
> -			hung_rq = intel_context_find_active_request_get(ce);
> -	} else {
> -		hung_rq = intel_engine_execlist_find_hung_request(engine);
> -		if (hung_rq)
> -			hung_rq = i915_request_get_rcu(hung_rq);
> -	}
> -
>   	if (hung_rq)
>   		engine_dump_request(hung_rq, m, "\t\thung");
> +	else if (hung_ce)
> +		drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
>   
> -	if (guc)
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
>   		intel_guc_dump_active_requests(engine, hung_rq, m);
>   	else
> -		intel_engine_dump_active_requests(&engine->sched_engine->requests,
> -						  hung_rq, m);
> +		intel_execlist_dump_active_requests(engine, hung_rq, m);
> +
>   	if (hung_rq)
>   		i915_request_put(hung_rq);
>   }
> @@ -2263,7 +2243,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   	struct i915_gpu_error * const error = &engine->i915->gpu_error;
>   	struct i915_request *rq;
>   	intel_wakeref_t wakeref;
> -	unsigned long flags;
>   	ktime_t dummy;
>   
>   	if (header) {
> @@ -2300,13 +2279,8 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   		   i915_reset_count(error));
>   	print_properties(engine, m);
>   
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
>   	engine_dump_active_requests(engine, m);
>   
> -	drm_printf(m, "\tOn hold?: %lu\n",
> -		   list_count(&engine->sched_engine->hold));
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> -
>   	drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
>   	wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
>   	if (wakeref) {
> @@ -2352,8 +2326,7 @@ intel_engine_create_virtual(struct intel_engine_cs **siblings,
>   	return siblings[0]->cops->create_virtual(siblings, count, flags);
>   }
>   
> -struct i915_request *
> -intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
> +static struct i915_request *engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>   {
>   	struct i915_request *request, *active = NULL;
>   
> @@ -2405,6 +2378,33 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>   	return active;
>   }
>   
> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
> +				  struct intel_context **ce, struct i915_request **rq)
> +{
> +	unsigned long flags;
> +
> +	*ce = intel_engine_get_hung_context(engine);
> +	if (*ce) {
> +		intel_engine_clear_hung_context(engine);
> +
> +		*rq = intel_context_find_active_request_get(*ce);
> +		return;
> +	}
> +
> +	/*
> +	 * Getting here with GuC enabled means it is a forced error capture
> +	 * with no actual hang. So, no need to attempt the execlist search.
> +	 */
> +	if (intel_uc_uses_guc_submission(&engine->gt->uc))
> +		return;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +	*rq = engine_execlist_find_hung_request(engine);
> +	if (*rq)
> +		*rq = i915_request_get_rcu(*rq);
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
>   void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
>   {
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 18ffe55282e59..05995c8577bef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -4150,6 +4150,33 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static unsigned long list_count(struct list_head *list)
> +{
> +	struct list_head *pos;
> +	unsigned long count = 0;
> +
> +	list_for_each(pos, list)
> +		count++;
> +
> +	return count;
> +}
> +
> +void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,
> +					 struct i915_request *hung_rq,
> +					 struct drm_printer *m)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +
> +	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
> +
> +	drm_printf(m, "\tOn hold?: %lu\n",
> +		   list_count(&engine->sched_engine->hold));
> +
> +	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_execlists.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index a1aa92c983a51..cb07488a03764 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -32,6 +32,10 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   							int indent),
>   				   unsigned int max);
>   
> +void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,
> +					 struct i915_request *hung_rq,
> +					 struct drm_printer *m);
> +
>   bool
>   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 5c73dfa2fb3f6..b20bd6365615b 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1596,35 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
>   {
>   	struct intel_engine_capture_vma *capture = NULL;
>   	struct intel_engine_coredump *ee;
> -	struct intel_context *ce;
> +	struct intel_context *ce = NULL;
>   	struct i915_request *rq = NULL;
> -	unsigned long flags;
>   
>   	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, dump_flags);
>   	if (!ee)
>   		return NULL;
>   
> -	ce = intel_engine_get_hung_context(engine);
> -	if (ce) {
> -		intel_engine_clear_hung_context(engine);
> -		rq = intel_context_find_active_request_get(ce);
> -		if (!rq || !i915_request_started(rq))
> -			goto no_request_capture;
> -	} else {
> -		/*
> -		 * Getting here with GuC enabled means it is a forced error capture
> -		 * with no actual hang. So, no need to attempt the execlist search.
> -		 */
> -		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> -			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -			rq = intel_engine_execlist_find_hung_request(engine);
> -			if (rq)
> -				rq = i915_request_get_rcu(rq);
> -			spin_unlock_irqrestore(&engine->sched_engine->lock,
> -					       flags);
> -		}
> -	}
> -	if (!rq)
> +	intel_engine_get_hung_entity(engine, &ce, &rq);
> +	if (!rq || !i915_request_started(rq))
>   		goto no_request_capture;
>   
>   	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
