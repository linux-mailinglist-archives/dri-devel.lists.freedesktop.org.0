Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA53883CC
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 02:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9620A6ECB7;
	Wed, 19 May 2021 00:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850266E115;
 Wed, 19 May 2021 00:32:55 +0000 (UTC)
IronPort-SDR: 52Rgk0QnxUAxNoRkJhWfKbhEZH2AwT9+jiHdAu9CI5N+cdQRyD5LdtIOb+MWn/glWRg04mu04t
 cd1QIz7o7jIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="188266514"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="188266514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 17:32:54 -0700
IronPort-SDR: oUDE/Yi5SCDorstDvWQH7xaKlrVB3Qoywb+0Qlbne1hOR4NjmGlTm7XqlOVV50T0+xi0omkiXJ
 Ix+K7K+R8cTQ==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439713847"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 17:32:53 -0700
Date: Tue, 18 May 2021 17:25:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 01/97] drm/i915/gt: Move engine setup out of
 set_default_submission
Message-ID: <20210519002540.GA14725@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-2-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, May 06, 2021 at 12:13:15PM -0700, Matthew Brost wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Now that we no longer switch back and forth between guc and execlists,
> we no longer need to restore the backend's vfunc and can leave them set
> after initialisation. The only catch is that we lose the submission on
> wedging and still need to reset the submit_request vfunc on unwedging.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../drm/i915/gt/intel_execlists_submission.c  | 46 ++++++++---------
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  4 --
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 50 ++++++++-----------
>  3 files changed, 44 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de124870af44..1108c193ab65 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3076,29 +3076,6 @@ static void execlists_set_default_submission(struct intel_engine_cs *engine)
>  	engine->submit_request = execlists_submit_request;
>  	engine->schedule = i915_schedule;
>  	engine->execlists.tasklet.callback = execlists_submission_tasklet;
> -
> -	engine->reset.prepare = execlists_reset_prepare;
> -	engine->reset.rewind = execlists_reset_rewind;
> -	engine->reset.cancel = execlists_reset_cancel;
> -	engine->reset.finish = execlists_reset_finish;
> -
> -	engine->park = execlists_park;
> -	engine->unpark = NULL;
> -
> -	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
> -	if (!intel_vgpu_active(engine->i915)) {
> -		engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
> -		if (can_preempt(engine)) {
> -			engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> -			if (IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> -				engine->flags |= I915_ENGINE_HAS_TIMESLICES;
> -		}
> -	}
> -
> -	if (intel_engine_has_preemption(engine))
> -		engine->emit_bb_start = gen8_emit_bb_start;
> -	else
> -		engine->emit_bb_start = gen8_emit_bb_start_noarb;
>  }
>  
>  static void execlists_shutdown(struct intel_engine_cs *engine)
> @@ -3129,6 +3106,14 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>  	engine->cops = &execlists_context_ops;
>  	engine->request_alloc = execlists_request_alloc;
>  
> +	engine->reset.prepare = execlists_reset_prepare;
> +	engine->reset.rewind = execlists_reset_rewind;
> +	engine->reset.cancel = execlists_reset_cancel;
> +	engine->reset.finish = execlists_reset_finish;
> +
> +	engine->park = execlists_park;
> +	engine->unpark = NULL;
> +
>  	engine->emit_flush = gen8_emit_flush_xcs;
>  	engine->emit_init_breadcrumb = gen8_emit_init_breadcrumb;
>  	engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_xcs;
> @@ -3149,6 +3134,21 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>  		 * until a more refined solution exists.
>  		 */
>  	}
> +
> +	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
> +	if (!intel_vgpu_active(engine->i915)) {
> +		engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
> +		if (can_preempt(engine)) {
> +			engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> +			if (IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +				engine->flags |= I915_ENGINE_HAS_TIMESLICES;
> +		}
> +	}
> +
> +	if (intel_engine_has_preemption(engine))
> +		engine->emit_bb_start = gen8_emit_bb_start;
> +	else
> +		engine->emit_bb_start = gen8_emit_bb_start_noarb;
>  }
>  
>  static void logical_ring_default_irqs(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 9585546556ee..5f4f7f1df48f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -989,14 +989,10 @@ static void gen6_bsd_submit_request(struct i915_request *request)
>  static void i9xx_set_default_submission(struct intel_engine_cs *engine)
>  {
>  	engine->submit_request = i9xx_submit_request;
> -
> -	engine->park = NULL;
> -	engine->unpark = NULL;
>  }
>  
>  static void gen6_bsd_set_default_submission(struct intel_engine_cs *engine)
>  {
> -	i9xx_set_default_submission(engine);
>  	engine->submit_request = gen6_bsd_submit_request;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 92688a9b6717..f72faa0b8339 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -608,35 +608,6 @@ static int guc_resume(struct intel_engine_cs *engine)
>  static void guc_set_default_submission(struct intel_engine_cs *engine)
>  {
>  	engine->submit_request = guc_submit_request;
> -	engine->schedule = i915_schedule;
> -	engine->execlists.tasklet.callback = guc_submission_tasklet;
> -
> -	engine->reset.prepare = guc_reset_prepare;
> -	engine->reset.rewind = guc_reset_rewind;
> -	engine->reset.cancel = guc_reset_cancel;
> -	engine->reset.finish = guc_reset_finish;
> -
> -	engine->flags |= I915_ENGINE_NEEDS_BREADCRUMB_TASKLET;
> -	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> -
> -	/*
> -	 * TODO: GuC supports timeslicing and semaphores as well, but they're
> -	 * handled by the firmware so some minor tweaks are required before
> -	 * enabling.
> -	 *
> -	 * engine->flags |= I915_ENGINE_HAS_TIMESLICES;
> -	 * engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
> -	 */
> -
> -	engine->emit_bb_start = gen8_emit_bb_start;
> -
> -	/*
> -	 * For the breadcrumb irq to work we need the interrupts to stay
> -	 * enabled. However, on all platforms on which we'll have support for
> -	 * GuC submission we don't allow disabling the interrupts at runtime, so
> -	 * we're always safe with the current flow.
> -	 */
> -	GEM_BUG_ON(engine->irq_enable || engine->irq_disable);
>  }
>  
>  static void guc_release(struct intel_engine_cs *engine)
> @@ -658,6 +629,13 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>  	engine->cops = &guc_context_ops;
>  	engine->request_alloc = guc_request_alloc;
>  
> +	engine->schedule = i915_schedule;
> +
> +	engine->reset.prepare = guc_reset_prepare;
> +	engine->reset.rewind = guc_reset_rewind;
> +	engine->reset.cancel = guc_reset_cancel;
> +	engine->reset.finish = guc_reset_finish;
> +
>  	engine->emit_flush = gen8_emit_flush_xcs;
>  	engine->emit_init_breadcrumb = gen8_emit_init_breadcrumb;
>  	engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_xcs;
> @@ -666,6 +644,20 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>  		engine->emit_flush = gen12_emit_flush_xcs;
>  	}
>  	engine->set_default_submission = guc_set_default_submission;
> +
> +	engine->flags |= I915_ENGINE_NEEDS_BREADCRUMB_TASKLET;
> +	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> +
> +	/*
> +	 * TODO: GuC supports timeslicing and semaphores as well, but they're
> +	 * handled by the firmware so some minor tweaks are required before
> +	 * enabling.
> +	 *
> +	 * engine->flags |= I915_ENGINE_HAS_TIMESLICES;
> +	 * engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
> +	 */
> +
> +	engine->emit_bb_start = gen8_emit_bb_start;
>  }
>  
>  static void rcs_submission_override(struct intel_engine_cs *engine)
> -- 
> 2.28.0
> 
