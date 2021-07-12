Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7F3C646B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE43689DA7;
	Mon, 12 Jul 2021 20:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1790989994;
 Mon, 12 Jul 2021 20:01:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197231783"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="197231783"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:01:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412698588"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:01:46 -0700
Subject: Re: [PATCH 32/47] drm/i915: Reset GPU immediately if submission is
 disabled
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-33-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <33e8c150-9ecc-ce6b-46e4-ac6442e15a90@intel.com>
Date: Mon, 12 Jul 2021 13:01:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-33-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:05, Matthew Brost wrote:
> If submission is disabled by the backend for any reason, reset the GPU
> immediately in the heartbeat code as the backend can't be reenabled
> until the GPU is reset.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 63 +++++++++++++++----
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  4 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +++
>   drivers/gpu/drm/i915/i915_scheduler.c         |  6 ++
>   drivers/gpu/drm/i915/i915_scheduler.h         |  6 ++
>   drivers/gpu/drm/i915/i915_scheduler_types.h   |  5 ++
>   6 files changed, 80 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index b6a305e6a974..a8495364d906 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -70,12 +70,30 @@ static void show_heartbeat(const struct i915_request *rq,
>   {
>   	struct drm_printer p = drm_debug_printer("heartbeat");
>   
> -	intel_engine_dump(engine, &p,
> -			  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
> -			  engine->name,
> -			  rq->fence.context,
> -			  rq->fence.seqno,
> -			  rq->sched.attr.priority);
> +	if (!rq) {
> +		intel_engine_dump(engine, &p,
> +				  "%s heartbeat not ticking\n",
> +				  engine->name);
> +	} else {
> +		intel_engine_dump(engine, &p,
> +				  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
> +				  engine->name,
> +				  rq->fence.context,
> +				  rq->fence.seqno,
> +				  rq->sched.attr.priority);
> +	}
> +}
> +
> +static void
> +reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> +		show_heartbeat(rq, engine);
> +
> +	intel_gt_handle_error(engine->gt, engine->mask,
> +			      I915_ERROR_CAPTURE,
> +			      "stopped heartbeat on %s",
> +			      engine->name);
>   }
>   
>   static void heartbeat(struct work_struct *wrk)
> @@ -102,6 +120,11 @@ static void heartbeat(struct work_struct *wrk)
>   	if (intel_gt_is_wedged(engine->gt))
>   		goto out;
>   
> +	if (i915_sched_engine_disabled(engine->sched_engine)) {
> +		reset_engine(engine, engine->heartbeat.systole);
> +		goto out;
> +	}
> +
>   	if (engine->heartbeat.systole) {
>   		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>   
> @@ -139,13 +162,7 @@ static void heartbeat(struct work_struct *wrk)
>   			engine->sched_engine->schedule(rq, &attr);
>   			local_bh_enable();
>   		} else {
> -			if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> -				show_heartbeat(rq, engine);
> -
> -			intel_gt_handle_error(engine->gt, engine->mask,
> -					      I915_ERROR_CAPTURE,
> -					      "stopped heartbeat on %s",
> -					      engine->name);
> +			reset_engine(engine, rq);
>   		}
>   
>   		rq->emitted_jiffies = jiffies;
> @@ -194,6 +211,26 @@ void intel_engine_park_heartbeat(struct intel_engine_cs *engine)
>   		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
>   }
>   
> +void intel_gt_unpark_heartbeats(struct intel_gt *gt)
> +{
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +
> +	for_each_engine(engine, gt, id)
> +		if (intel_engine_pm_is_awake(engine))
> +			intel_engine_unpark_heartbeat(engine);
> +
> +}
> +
> +void intel_gt_park_heartbeats(struct intel_gt *gt)
> +{
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +
> +	for_each_engine(engine, gt, id)
> +		intel_engine_park_heartbeat(engine);
> +}
> +
>   void intel_engine_init_heartbeat(struct intel_engine_cs *engine)
>   {
>   	INIT_DELAYED_WORK(&engine->heartbeat.work, heartbeat);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> index a488ea3e84a3..5da6d809a87a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
> @@ -7,6 +7,7 @@
>   #define INTEL_ENGINE_HEARTBEAT_H
>   
>   struct intel_engine_cs;
> +struct intel_gt;
>   
>   void intel_engine_init_heartbeat(struct intel_engine_cs *engine);
>   
> @@ -16,6 +17,9 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
>   void intel_engine_park_heartbeat(struct intel_engine_cs *engine);
>   void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine);
>   
> +void intel_gt_park_heartbeats(struct intel_gt *gt);
> +void intel_gt_unpark_heartbeats(struct intel_gt *gt);
> +
>   int intel_engine_pulse(struct intel_engine_cs *engine);
>   int intel_engine_flush_barriers(struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b8c894ad8caf..59fca9748c15 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -10,6 +10,7 @@
>   #include "gt/intel_breadcrumbs.h"
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
> +#include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm.h"
> @@ -605,6 +606,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   		/* Reset called during driver load? GuC not yet initialised! */
>   		return;
>   
> +	intel_gt_park_heartbeats(guc_to_gt(guc));
>   	disable_submission(guc);
>   	guc->interrupts.disable(guc);
>   
> @@ -890,6 +892,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   	atomic_set(&guc->outstanding_submission_g2h, 0);
>   
>   	enable_submission(guc);
> +	intel_gt_unpark_heartbeats(guc_to_gt(guc));
>   }
>   
>   /*
> @@ -1859,6 +1862,11 @@ static int guc_resume(struct intel_engine_cs *engine)
>   	return 0;
>   }
>   
> +static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
> +{
> +	return !sched_engine->tasklet.callback;
> +}
> +
>   static void guc_set_default_submission(struct intel_engine_cs *engine)
>   {
>   	engine->submit_request = guc_submit_request;
> @@ -2009,6 +2017,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   			return -ENOMEM;
>   
>   		guc->sched_engine->schedule = i915_schedule;
> +		guc->sched_engine->disabled = guc_sched_engine_disabled;
>   		guc->sched_engine->private_data = guc;
>   		tasklet_setup(&guc->sched_engine->tasklet,
>   			      guc_submission_tasklet);
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> index 3a58a9130309..3fb009ea2cb2 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> @@ -440,6 +440,11 @@ void i915_sched_engine_free(struct kref *kref)
>   	kfree(sched_engine);
>   }
>   
> +static bool default_disabled(struct i915_sched_engine *sched_engine)
> +{
> +	return false;
> +}
> +
>   struct i915_sched_engine *
>   i915_sched_engine_create(unsigned int subclass)
>   {
> @@ -453,6 +458,7 @@ i915_sched_engine_create(unsigned int subclass)
>   
>   	sched_engine->queue = RB_ROOT_CACHED;
>   	sched_engine->queue_priority_hint = INT_MIN;
> +	sched_engine->disabled = default_disabled;
>   
>   	INIT_LIST_HEAD(&sched_engine->requests);
>   	INIT_LIST_HEAD(&sched_engine->hold);
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> index 650ab8e0db9f..72105a53b0e1 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> @@ -98,4 +98,10 @@ void i915_request_show_with_schedule(struct drm_printer *m,
>   				     const char *prefix,
>   				     int indent);
>   
> +static inline bool
> +i915_sched_engine_disabled(struct i915_sched_engine *sched_engine)
> +{
> +	return sched_engine->disabled(sched_engine);
> +}
> +
>   #endif /* _I915_SCHEDULER_H_ */
> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> index 5935c3152bdc..cfaf52e528d0 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> @@ -163,6 +163,11 @@ struct i915_sched_engine {
>   	 */
>   	void *private_data;
>   
> +	/**
> +	 * @disabled: check if backend has disabled submission
> +	 */
> +	bool	(*disabled)(struct i915_sched_engine *sched_engine);
> +
>   	/**
>   	 * @kick_backend: kick backend after a request's priority has changed
>   	 */

