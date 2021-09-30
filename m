Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0E41D808
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA746EB71;
	Thu, 30 Sep 2021 10:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CA96EB70;
 Thu, 30 Sep 2021 10:46:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="247694634"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="247694634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:46:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="479848413"
Received: from vmurthy-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.37.18])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:46:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/i915: rename IS_ACTIVE
In-Reply-To: <20210929183357.1490204-2-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <20210929183357.1490204-2-lucas.demarchi@intel.com>
Date: Thu, 30 Sep 2021 13:46:21 +0300
Message-ID: <87fstmuyrm.fsf@intel.com>
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

On Wed, 29 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> It took me some time to understand the need for IS_ACTIVE and why we
> couldn't use kconfig.h.

For anyone else wondering, the clues are in babaab2f4738 ("drm/i915:
Encapsulate kconfig constant values inside boolean predicates").

But this series tries to take it further; we currently don't have a need
for checking whether the config is defined or not. It always is. I mean
it's probably a useful feature, but not the original problem we had.

BR,
Jani.


> Rename it to something else that would be more
> suitable to include in kconfig.h and shared with other subsystems rather
> than maintaining it only in i915.
>
> Name here is pretty open for suggestions, but I think this is slightly
> better than "active".
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
>  drivers/gpu/drm/i915/i915_utils.h                  |  2 +-
>  11 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 8208fd5b72c3..ff748441a0e2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -761,7 +761,7 @@ static int intel_context_set_gem(struct intel_context *ce,
>  	    intel_engine_has_semaphores(ce->engine))
>  		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>  
> -	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> +	if (IS_CONFIG_NONZERO(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
>  	    ctx->i915->params.request_timeout_ms) {
>  		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 5130e8ed9564..9e12c026e59f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -395,7 +395,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  	/* Track the mmo associated with the fenced vma */
>  	vma->mmo = mmo;
>  
> -	if (IS_ACTIVE(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND))
> +	if (IS_CONFIG_NONZERO(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND))
>  		intel_wakeref_auto(&i915->ggtt.userfault_wakeref,
>  				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 87579affb952..f181c8654cbf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -273,7 +273,7 @@ static inline bool intel_engine_uses_guc(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
>  		return false;
>  
>  	return intel_engine_has_preemption(engine);
> @@ -300,7 +300,7 @@ intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>  		return false;
>  
>  	if (intel_engine_is_virtual(engine))
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 74775ae961b2..9b2eb0491c9d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -207,7 +207,7 @@ static void heartbeat(struct work_struct *wrk)
>  
>  void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>  		return;
>  
>  	next_heartbeat(engine);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 5ae1207c363b..938b49e41e48 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -556,7 +556,7 @@ intel_engine_has_semaphores(const struct intel_engine_cs *engine)
>  static inline bool
>  intel_engine_has_timeslices(const struct intel_engine_cs *engine)
>  {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  		return false;
>  
>  	return engine->flags & I915_ENGINE_HAS_TIMESLICES;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 7147fe80919e..851dce6bfc6f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3339,7 +3339,7 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>  		engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
>  		if (can_preempt(engine)) {
>  			engine->flags |= I915_ENGINE_HAS_PREEMPTION;
> -			if (IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +			if (IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  				engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index 317eebf086c3..7ca44d0105b8 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -290,7 +290,7 @@ static int live_heartbeat_fast(void *arg)
>  	int err = 0;
>  
>  	/* Check that the heartbeat ticks at the desired rate. */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -352,7 +352,7 @@ static int live_heartbeat_off(void *arg)
>  	int err = 0;
>  
>  	/* Check that we can turn off heartbeat and not interrupt VIP */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index b3863abc51f5..d7daded90e35 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -992,7 +992,7 @@ static int live_timeslice_preempt(void *arg)
>  	 * need to preempt the current task and replace it with another
>  	 * ready task.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  		return 0;
>  
>  	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> @@ -1122,7 +1122,7 @@ static int live_timeslice_rewind(void *arg)
>  	 * but only a few of those requests, forcing us to rewind the
>  	 * RING_TAIL of the original request.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  		return 0;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -1299,7 +1299,7 @@ static int live_timeslice_queue(void *arg)
>  	 * ELSP[1] is already occupied, so must rely on timeslicing to
>  	 * eject ELSP[0] in favour of the queue.)
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  		return 0;
>  
>  	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> @@ -1420,7 +1420,7 @@ static int live_timeslice_nopreempt(void *arg)
>  	 * We should not timeslice into a request that is marked with
>  	 * I915_REQUEST_NOPREEMPT.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_TIMESLICE_DURATION))
>  		return 0;
>  
>  	if (igt_spinner_init(&spin, gt))
> @@ -2260,7 +2260,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
>  	int err;
>  
>  	/* Preempt cancel non-preemptible spinner in ELSP0 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
>  		return 0;
>  
>  	if (!intel_has_reset_engine(arg->engine->gt))
> @@ -2316,7 +2316,7 @@ static int __cancel_fail(struct live_preempt_cancel *arg)
>  	struct i915_request *rq;
>  	int err;
>  
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
>  		return 0;
>  
>  	if (!intel_has_reset_engine(engine->gt))
> @@ -3375,7 +3375,7 @@ static int live_preempt_timeout(void *arg)
>  	 * Check that we force preemption to occur by cancelling the previous
>  	 * context if it refuses to yield the GPU.
>  	 */
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
> +	if (!IS_CONFIG_NONZERO(CONFIG_DRM_I915_PREEMPT_TIMEOUT))
>  		return 0;
>  
>  	if (!intel_has_reset_engine(gt))
> diff --git a/drivers/gpu/drm/i915/i915_config.c b/drivers/gpu/drm/i915/i915_config.c
> index b79b5f6d2cfa..3566d26f2068 100644
> --- a/drivers/gpu/drm/i915/i915_config.c
> +++ b/drivers/gpu/drm/i915/i915_config.c
> @@ -8,7 +8,7 @@
>  unsigned long
>  i915_fence_context_timeout(const struct drm_i915_private *i915, u64 context)
>  {
> -	if (context && IS_ACTIVE(CONFIG_DRM_I915_FENCE_TIMEOUT))
> +	if (context && IS_CONFIG_NONZERO(CONFIG_DRM_I915_FENCE_TIMEOUT))
>  		return msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 79da5eca60af..4745d3efadca 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1852,7 +1852,7 @@ long i915_request_wait(struct i915_request *rq,
>  	 * completion. That requires having a good predictor for the request
>  	 * duration, which we currently lack.
>  	 */
> -	if (IS_ACTIVE(CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT) &&
> +	if (IS_CONFIG_NONZERO(CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT) &&
>  	    __i915_spin_request(rq, state))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 5259edacde38..02bbfa4d68d3 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -469,6 +469,6 @@ static inline bool timer_expired(const struct timer_list *t)
>   *
>   * Returns 0 if @config is 0, 1 if set to any value.
>   */
> -#define IS_ACTIVE(config) ((config) != 0)
> +#define IS_CONFIG_NONZERO(config) ((config) != 0)
>  
>  #endif /* !__I915_UTILS_H */

-- 
Jani Nikula, Intel Open Source Graphics Center
