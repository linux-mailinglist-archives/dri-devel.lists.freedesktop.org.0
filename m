Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB64CD3E2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD0810F07B;
	Fri,  4 Mar 2022 11:59:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752610F069;
 Fri,  4 Mar 2022 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646395194; x=1677931194;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XQfkAyACPDfukEYZhSsqO3RX1ZyfcidMaFvEbtNmT/I=;
 b=Y0LjZlLnsG+JupeiMhFdYlEE6j+vSvrs7tSVKXLx5qQSPF35tRrExo0M
 dzYtvfrGcS8ed6LzS68057+mQtg+61N1uuEEpPXT1MIN4pedfBw8tFVdv
 5LHKDIHj1hbnbnWtBf8hnjsNfNkYF1Fg9RiLqHNME7pkYFwDf5ib8lM4K
 c60Q3mMdpXjI3AwSw9NoZ5wtr3ockf0FyG4Ls+nN3tBtkabHLGr5O7q0i
 iyYcJHq3CaYb1PQDIeX2iaY3OyWXm884TcWZ9XLr7pK9qAouzbwiHFR18
 rfpr9UwuIx/dwB1FtBkSmdPywkKi3y7QwIOZRjgH6qfPF5fAtZCG2uNXj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233921582"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233921582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:59:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511828938"
Received: from pruilobx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.28.174])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:59:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915/guc: Do not conflate
 lrc_desc with GuC id for registration
In-Reply-To: <20220225000623.1934438-2-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
 <20220225000623.1934438-2-John.C.Harrison@Intel.com>
Date: Fri, 04 Mar 2022 13:59:46 +0200
Message-ID: <87ilsu2aj1.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Feb 2022, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. So, stop using it as a check for
> context registration, use the GuC id instead (being the thing that
> actually gets registered with the GuC).
>
> Also, rename the set/clear/query helper functions for context id
> mappings to better reflect their purpose and to differentiate from
> other registration related helper functions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++---------
>  1 file changed, 38 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..7fb889e14995 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -514,31 +514,20 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
>  	return !!guc->lrc_desc_pool_vaddr;
>  }
>  
> -static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> +static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
>  {
> -	if (likely(guc_submission_initialized(guc))) {
> -		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> -		unsigned long flags;
> -
> -		memset(desc, 0, sizeof(*desc));
> +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>  
> -		/*
> -		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> -		 * the lower level functions directly.
> -		 */
> -		xa_lock_irqsave(&guc->context_lookup, flags);
> -		__xa_erase(&guc->context_lookup, id);
> -		xa_unlock_irqrestore(&guc->context_lookup, flags);
> -	}
> +	memset(desc, 0, sizeof(*desc));
>  }
>  
> -static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> +static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
>  {
>  	return __get_context(guc, id);
>  }
>  
> -static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> -					   struct intel_context *ce)
> +static inline void set_ctx_id_mapping(struct intel_guc *guc, u32 id,
> +				      struct intel_context *ce)
>  {
>  	unsigned long flags;
>  
> @@ -551,6 +540,24 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>  	xa_unlock_irqrestore(&guc->context_lookup, flags);
>  }
>  
> +static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
> +{
> +	unsigned long flags;
> +
> +	if (unlikely(!guc_submission_initialized(guc)))
> +		return;
> +
> +	_reset_lrc_desc(guc, id);
> +
> +	/*
> +	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> +	 * the lower level functions directly.
> +	 */
> +	xa_lock_irqsave(&guc->context_lookup, flags);
> +	__xa_erase(&guc->context_lookup, id);
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +}

There are a plethora of static inlines in the guc .c files, and this
adds more. How about just letting the compiler decide what's the best
course of action, inline or not? I think hand rolling the inline is a
micro optimization that you'd need to justify i.e. show that you're
doing a better job than the compiler.

The main downsides to using inlines are that you'll miss compiler
warnings for unused functions, and it sets an example for people to
start using inline more, while they should be an exception.

BR,
Jani.


PS. I also don't much like the likely/unlikely annotations, but that's
another can of worms.


> +
>  static void decr_outstanding_submission_g2h(struct intel_guc *guc)
>  {
>  	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> @@ -795,7 +802,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>  	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>  	GEM_BUG_ON(context_guc_id_invalid(ce));
>  	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> -	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> +	GEM_BUG_ON(!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id));
>  
>  	/* Insert NOOP if this work queue item will wrap the tail pointer. */
>  	if (wqi_size > wq_space_until_wrap(ce)) {
> @@ -923,7 +930,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>  	if (submit) {
>  		struct intel_context *ce = request_to_scheduling_context(last);
>  
> -		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> +		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>  			     !intel_context_is_banned(ce))) {
>  			ret = guc_lrc_desc_pin(ce, false);
>  			if (unlikely(ret == -EPIPE)) {
> @@ -1897,7 +1904,7 @@ static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
>  
>  	return submission_disabled(guc) || guc->stalled_request ||
>  		!i915_sched_engine_is_empty(sched_engine) ||
> -		!lrc_desc_registered(guc, ce->guc_id.id);
> +		!ctx_id_mapped(guc, ce->guc_id.id);
>  }
>  
>  static void guc_submit_request(struct i915_request *rq)
> @@ -1954,7 +1961,7 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  		else
>  			ida_simple_remove(&guc->submission_state.guc_ids,
>  					  ce->guc_id.id);
> -		reset_lrc_desc(guc, ce->guc_id.id);
> +		clr_ctx_id_mapping(guc, ce->guc_id.id);
>  		set_context_guc_id_invalid(ce);
>  	}
>  	if (!list_empty(&ce->guc_id.link))
> @@ -2250,10 +2257,10 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>  	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>  		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>  
> -	context_registered = lrc_desc_registered(guc, desc_idx);
> +	context_registered = ctx_id_mapped(guc, desc_idx);
>  
> -	reset_lrc_desc(guc, desc_idx);
> -	set_lrc_desc_registered(guc, desc_idx, ce);
> +	clr_ctx_id_mapping(guc, desc_idx);
> +	set_ctx_id_mapping(guc, desc_idx, ce);
>  
>  	desc = __get_lrc_desc(guc, desc_idx);
>  	desc->engine_class = engine_class_to_guc_class(engine->class);
> @@ -2324,7 +2331,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>  		}
>  		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  		if (unlikely(disabled)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>  			return 0;	/* Will get registered later */
>  		}
>  
> @@ -2340,9 +2347,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>  		with_intel_runtime_pm(runtime_pm, wakeref)
>  			ret = register_context(ce, loop);
>  		if (unlikely(ret == -EBUSY)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>  		} else if (unlikely(ret == -ENODEV)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>  			ret = 0;	/* Will get registered later */
>  		}
>  	}
> @@ -2529,7 +2536,7 @@ static bool context_cant_unblock(struct intel_context *ce)
>  
>  	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
>  		context_guc_id_invalid(ce) ||
> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id) ||
> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
>  		!intel_context_is_pinned(ce);
>  }
>  
> @@ -2699,7 +2706,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>  	bool disabled;
>  
>  	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
> -	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
> +	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id));
>  	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>  	GEM_BUG_ON(context_enabled(ce));
>  
> @@ -2816,7 +2823,7 @@ static void guc_context_destroy(struct kref *kref)
>  	 */
>  	spin_lock_irqsave(&guc->submission_state.lock, flags);
>  	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
> -		!lrc_desc_registered(guc, ce->guc_id.id);
> +		!ctx_id_mapped(guc, ce->guc_id.id);
>  	if (likely(!destroy)) {
>  		if (!list_empty(&ce->guc_id.link))
>  			list_del_init(&ce->guc_id.link);
> @@ -3059,7 +3066,7 @@ static void guc_signal_context_fence(struct intel_context *ce)
>  static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>  {
>  	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id)) &&
> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id)) &&
>  		!submission_disabled(ce_to_guc(ce));
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
