Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8317E41E889
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 09:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5B6ED16;
	Fri,  1 Oct 2021 07:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB66B6ED15;
 Fri,  1 Oct 2021 07:46:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="212444292"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="212444292"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 00:46:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="556181767"
Received: from kdoertel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.222.34])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 00:46:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>,
 Steven Price <steven.price@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/i915: remove IS_ACTIVE
In-Reply-To: <20211001074041.2076538-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211001074041.2076538-1-lucas.demarchi@intel.com>
Date: Fri, 01 Oct 2021 10:46:51 +0300
Message-ID: <871r55uqz8.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Oct 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
> provide much value just encapsulating it in a boolean context. So I also
> added the support for handling undefined macros as the IS_ENABLED()
> counterpart. However the feedback received from Masahiro Yamada was that
> it is too ugly, not providing much value. And just wrapping in a boolean
> context is too dumb - we could simply open code it.
>
> As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
> constant values inside boolean predicates"), the IS_ACTIVE macro was
> added to workaround a compilation warning. However after checking again
> our current uses of IS_ACTIVE it turned out there is only
> 1 case in which it would potentially trigger a warning. All the others
>   can simply use the shorter version, without wrapping it in any macro.
> And even that single one didn't trigger any warning in gcc 10.3.
>
> So here I'm dialing all the way back to simply removing the macro. If it
> triggers warnings in future we may change the few cases to check for > 0
> or != 0. Another possibility would be to use the great "not not
> operator" for all positive checks, which would allow us to maintain
> consistency.  However let's try first the simplest form though, hopefully
> we don't hit broken compilers spitting a warning:
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c        |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  2 +-
>  drivers/gpu/drm/i915/gt/intel_engine.h             |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |  2 +-
>  drivers/gpu/drm/i915/gt/intel_engine_types.h       |  2 +-
>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |  2 +-
>  .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |  4 ++--
>  drivers/gpu/drm/i915/gt/selftest_execlists.c       | 14 +++++++-------
>  drivers/gpu/drm/i915/i915_config.c                 |  2 +-
>  drivers/gpu/drm/i915/i915_request.c                |  2 +-
>  drivers/gpu/drm/i915/i915_utils.h                  | 13 -------------
>  11 files changed, 18 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 8208fd5b72c3..be60bcf8069c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -761,7 +761,7 @@ static int intel_context_set_gem(struct intel_context *ce,
>  	    intel_engine_has_semaphores(ce->engine))
>  		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>  
> -	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> +	if (CONFIG_DRM_I915_REQUEST_TIMEOUT &&
>  	    ctx->i915->params.request_timeout_ms) {
>  		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 5130e8ed9564..65fc6ff5f59d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -395,7 +395,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  	/* Track the mmo associated with the fenced vma */
>  	vma->mmo = mmo;
>  
> -	if (IS_ACTIVE(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND))
> +	if (CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
>  		intel_wakeref_auto(&i915->ggtt.userfault_wakeref,
>  				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 87579affb952..6aba239a10e8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -273,7 +273,7 @@ static inline bool intel_engine_uses_guc(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT)
>  		return false;
>  
>  	return intel_engine_has_preemption(engine);
> @@ -300,7 +300,7 @@ intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
>  		return false;
>  
>  	if (intel_engine_is_virtual(engine))
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 74775ae961b2..a3698f611f45 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -207,7 +207,7 @@ static void heartbeat(struct work_struct *wrk)
>  
>  void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
>  		return;
>  
>  	next_heartbeat(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 5ae1207c363b..9167ce52487c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -556,7 +556,7 @@ intel_engine_has_semaphores(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_timeslices(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
>  		return false;
>  
>  	return engine->flags & I915_ENGINE_HAS_TIMESLICES;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 7147fe80919e..73a79c2acd3a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3339,7 +3339,7 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>  		engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
>  		if (can_preempt(engine)) {
>  			engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> -			if (IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +			if (CONFIG_DRM_I915_TIMESLICE_DURATION)
>  				engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index 317eebf086c3..6e6e4d747cca 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -290,7 +290,7 @@ static int live_heartbeat_fast(void *arg)
>  	int err = 0;
>  
>  	/* Check that the heartbeat ticks at the desired rate. */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -352,7 +352,7 @@ static int live_heartbeat_off(void *arg)
>  	int err = 0;
>  
>  	/* Check that we can turn off heartbeat and not interrupt VIP */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index b3863abc51f5..25a8c4f62b0d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -992,7 +992,7 @@ static int live_timeslice_preempt(void *arg)
>  	 * need to preempt the current task and replace it with another
>  	 * ready task.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
>  		return 0;
>  
>  	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> @@ -1122,7 +1122,7 @@ static int live_timeslice_rewind(void *arg)
>  	 * but only a few of those requests, forcing us to rewind the
>  	 * RING_TAIL of the original request.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -1299,7 +1299,7 @@ static int live_timeslice_queue(void *arg)
>  	 * ELSP[1] is already occupied, so must rely on timeslicing to
>  	 * eject ELSP[0] in favour of the queue.)
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
>  		return 0;
>  
>  	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> @@ -1420,7 +1420,7 @@ static int live_timeslice_nopreempt(void *arg)
>  	 * We should not timeslice into a request that is marked with
>  	 * I915_REQUEST_NOPREEMPT.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
>  		return 0;
>  
>  	if (igt_spinner_init(&spin, gt))
> @@ -2260,7 +2260,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
>  	int err;
>  
>  	/* Preempt cancel non-preemptible spinner in ELSP0 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT)
>  		return 0;
>  
>  	if (!intel_has_reset_engine(arg->engine->gt))
> @@ -2316,7 +2316,7 @@ static int __cancel_fail(struct live_preempt_cancel *arg)
>  	struct i915_request *rq;
>  	int err;
>  
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT)
>  		return 0;
>  
>  	if (!intel_has_reset_engine(engine->gt))
> @@ -3375,7 +3375,7 @@ static int live_preempt_timeout(void *arg)
>  	 * Check that we force preemption to occur by cancelling the previous
>  	 * context if it refuses to yield the GPU.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT)
>  		return 0;
>  
>  	if (!intel_has_reset_engine(gt))
> diff --git a/drivers/gpu/drm/i915/i915_config.c b/drivers/gpu/drm/i915/i915_config.c
> index b79b5f6d2cfa..ad228dd96a0b 100644
> --- a/drivers/gpu/drm/i915/i915_config.c
> +++ b/drivers/gpu/drm/i915/i915_config.c
> @@ -8,7 +8,7 @@
>  unsigned long
>  i915_fence_context_timeout(const struct drm_i915_private *i915, u64 context)
>  {
> -	if (context && IS_ACTIVE(CONFIG_DRM_I915_FENCE_TIMEOUT))
> +	if (context && CONFIG_DRM_I915_FENCE_TIMEOUT)
>  		return msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 79da5eca60af..91bd6f4e9909 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1852,7 +1852,7 @@ long i915_request_wait(struct i915_request *rq,
>  	 * completion. That requires having a good predictor for the request
>  	 * duration, which we currently lack.
>  	 */
> -	if (IS_ACTIVE(CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT) &&
> +	if (CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT &&
>  	    __i915_spin_request(rq, state))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 5259edacde38..62f189e064a9 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -458,17 +458,4 @@ static inline bool timer_expired(const struct timer_list *t)
>  	return timer_active(t) && !timer_pending(t);
>  }
>  
> -/*
> - * This is a lookalike for IS_ENABLED() that takes a kconfig value,
> - * e.g. CONFIG_DRM_I915_SPIN_REQUEST, and evaluates whether it is non-zero
> - * i.e. whether the configuration is active. Wrapping up the config inside
> - * a boolean context prevents clang and smatch from complaining about potential
> - * issues in confusing logical-&& with bitwise-& for constants.
> - *
> - * Sadly IS_ENABLED() itself does not work with kconfig values.
> - *
> - * Returns 0 if @config is 0, 1 if set to any value.
> - */
> -#define IS_ACTIVE(config) ((config) != 0)
> -
>  #endif /* !__I915_UTILS_H */

-- 
Jani Nikula, Intel Open Source Graphics Center
