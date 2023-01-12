Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F2666EEF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527C610E8C4;
	Thu, 12 Jan 2023 10:01:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411F10E8C3;
 Thu, 12 Jan 2023 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673517704; x=1705053704;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=55H+eyU/qEfwJZO+GICiQaD6+L3P9sKV4wnVfArICUc=;
 b=amndNP6I0fgGTAxgSCGUOI4NLwMqgyPKw5rSjdo7Ki+Mn5iLvbMOGej4
 FtSIK/nXmEUeUbgFdH2mEQ4nI99648sW4jAmCbzP2U0wM2W8h0ppfWxnj
 Ea5ozDyEIoJLTi/uAtnUe/uY/e/8n74A6HYtJDiSk+uDNeyhYn66iRUKO
 vbssYq1lbKkXBVFMf1NF2MErkQ4TuxDHhgKs1PvmpCpiSK/u2NPgIXGDN
 nItVHTf7UWLg1VpczVQ9fEwm0wJxuSkCDnxQGq1bGzO/v9GNLCbvw6t+T
 aPuAm2YiU59BqXs4SkQwNOXPNPipOpfpPsFw1B5j7x4rry3GFxoiyDJJ5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350888579"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="350888579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:01:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765547537"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="765547537"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:01:42 -0800
Message-ID: <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
Date: Thu, 12 Jan 2023 10:01:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230112025311.2577084-2-John.C.Harrison@Intel.com>
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


On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There was a report of error captures occurring without any hung
> context being indicated despite the capture being initiated by a 'hung
> context notification' from GuC. The problem was not reproducible.
> However, it is possible to happen if the context in question has no
> active requests. For example, if the hang was in the context switch
> itself then the breadcrumb write would have occurred and the KMD would
> see an idle context.
> 
> In the interests of attempting to provide as much information as
> possible about a hang, it seems wise to include the engine info
> regardless of whether a request was found or not. As opposed to just
> prentending there was no hang at all.
> 
> So update the error capture code to always record engine information
> if an engine is given. Which means updating record_context() to take a
> context instead of a request (which it only ever used to find the
> context anyway). And split the request agnostic parts of
> intel_engine_coredump_add_request() out into a seaprate function.
> 
> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
> pointer.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 61 +++++++++++++++++++--------
>   1 file changed, 43 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64e..bd2cf7d235df0 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct intel_engine_coredump *ee)
>   }
>   
>   static bool record_context(struct i915_gem_context_coredump *e,
> -			   const struct i915_request *rq)
> +			   struct intel_context *ce)
>   {
>   	struct i915_gem_context *ctx;
>   	struct task_struct *task;
>   	bool simulated;
>   
>   	rcu_read_lock();
> -	ctx = rcu_dereference(rq->context->gem_context);
> +	ctx = rcu_dereference(ce->gem_context);
>   	if (ctx && !kref_get_unless_zero(&ctx->ref))
>   		ctx = NULL;
>   	rcu_read_unlock();
> @@ -1396,8 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
>   	e->guilty = atomic_read(&ctx->guilty_count);
>   	e->active = atomic_read(&ctx->active_count);
>   
> -	e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
> -	e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
> +	e->total_runtime = intel_context_get_total_runtime_ns(ce);
> +	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>   
>   	simulated = i915_gem_context_no_error_capture(ctx);
>   
> @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_
>   	return ee;
>   }
>   
> +static struct intel_engine_capture_vma *
> +engine_coredump_add_context(struct intel_engine_coredump *ee,
> +			    struct intel_context *ce,
> +			    gfp_t gfp)
> +{
> +	struct intel_engine_capture_vma *vma = NULL;
> +
> +	ee->simulated |= record_context(&ee->context, ce);
> +	if (ee->simulated)
> +		return NULL;
> +
> +	/*
> +	 * We need to copy these to an anonymous buffer
> +	 * as the simplest method to avoid being overwritten
> +	 * by userspace.
> +	 */
> +	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
> +	vma = capture_vma(vma, ce->state, "HW context", gfp);
> +
> +	return vma;
> +}
> +
>   struct intel_engine_capture_vma *
>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   				  struct i915_request *rq,
>   				  gfp_t gfp)
>   {
> -	struct intel_engine_capture_vma *vma = NULL;
> +	struct intel_engine_capture_vma *vma;
>   
> -	ee->simulated |= record_context(&ee->context, rq);
> -	if (ee->simulated)
> +	vma = engine_coredump_add_context(ee, rq->context, gfp);
> +	if (!vma)
>   		return NULL;
>   
>   	/*
> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   	 */
>   	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>   	vma = capture_user(vma, rq, gfp);
> -	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
> -	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>   
>   	ee->rq_head = rq->head;
>   	ee->rq_post = rq->postfix;
> @@ -1608,8 +1628,11 @@ capture_engine(struct intel_engine_cs *engine,
>   	if (ce) {
>   		intel_engine_clear_hung_context(engine);
>   		rq = intel_context_find_active_request(ce);
> -		if (!rq || !i915_request_started(rq))
> -			goto no_request_capture;
> +		if (rq && !i915_request_started(rq)) {
> +			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",

Suggest s/active/started/ since we have both i915_request_active and 
i915_request_started, so to align the terminology.

> +				 engine->name);
> +			rq = NULL;
> +		}
>   	} else {
>   		/*
>   		 * Getting here with GuC enabled means it is a forced error capture
> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs *engine,
>   					       flags);
>   		}
>   	}
> -	if (rq)
> +	if (rq) {
>   		rq = i915_request_get_rcu(rq);
> +		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> +	} else if (ce) {
> +		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
> +	}
>   
> -	if (!rq)
> -		goto no_request_capture;
> -
> -	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
>   	if (!capture) {
> -		i915_request_put(rq);
> +		if (rq)
> +			i915_request_put(rq);
>   		goto no_request_capture;
>   	}
>   	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>   		intel_guc_capture_get_matching_node(engine->gt, ee, ce);

This step requires non-NULL ce, so if you move it under the "else if 
(ce)" above then I *think* exit from the function can be consolidated to 
just:

if (capture) {
	intel_engine_coredump_add_vma(ee, capture, compress);
	if (rq)
		i915_request_put(rq);
} else {
	kfree(ee);
	ee = NULL;
}

return ee;

No "if (rq) i915_request_put()" twice, and goto label can be completely 
removed.

Regards,

Tvrtko

>   
>   	intel_engine_coredump_add_vma(ee, capture, compress);
> -	i915_request_put(rq);
> +	if (rq)
> +		i915_request_put(rq);
>   
>   	return ee;
>   
