Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B4B4212BA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DDF6EA3E;
	Mon,  4 Oct 2021 15:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F50D6EA3E;
 Mon,  4 Oct 2021 15:33:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206286722"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206286722"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 08:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="483158199"
Received: from shearne-mobl.ger.corp.intel.com (HELO [10.213.208.122])
 ([10.213.208.122])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 08:21:46 -0700
Subject: Re: [PATCH] drm/i915/pmu: Connect engine busyness stats from GuC to
 pmu
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com, daniel.vetter@ffwll.ch
References: <20210924223451.71316-1-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d15ab2f3-6b4b-7603-75f3-aff7e3c0a913@linux.intel.com>
Date: Mon, 4 Oct 2021 16:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924223451.71316-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/09/2021 23:34, Umesh Nerlige Ramappa wrote:
> With GuC handling scheduling, i915 is not aware of the time that a
> context is scheduled in and out of the engine. Since i915 pmu relies on
> this info to provide engine busyness to the user, GuC shares this info
> with i915 for all engines using shared memory. For each engine, this
> info contains:
> 
> - total busyness: total time that the context was running (total)
> - id: id of the running context (id)
> - start timestamp: timestamp when the context started running (start)
> 
> At the time (now) of sampling the engine busyness, if the id is valid
> (!= ~0), and start is non-zero, then the context is considered to be
> active and the engine busyness is calculated using the below equation
> 
> 	engine busyness = total + (now - start)
> 
> All times are obtained from the gt clock base. For inactive contexts,
> engine busyness is just equal to the total.
> 
> The start and total values provided by GuC are 32 bits and wrap around
> in a few minutes. Since perf pmu provides busyness as 64 bit
> monotonically increasing values, there is a need for this implementation
> to account for overflows and extend the time to 64 bits before returning
> busyness to the user. In order to do that, a worker runs periodically at
> frequqncy = 1/8th the time it takes for the timestamp to wrap. As an

frequency

> example, that would be once in 27 seconds for a gt clock frequency of
> 19.2 MHz.
> 
> Opens and wip that are targeted for later patches:
> 
> 1) On global gt reset the total busyness of engines resets and i915
>     needs to fix that so that user sees monotonically increasing
>     busyness.
> 2) In runtime suspend mode, the worker may not need to be run. We could
>     stop the worker on suspend and rerun it on resume provided that the
>     guc pm timestamp does not tick during suspend.

2) sounds easy since there are park/unpark hooks for pmu already. Will 
see if I can figure out why you did not just immediately do it.

I would also document in the commit message the known problem of 
possible over-accounting, just for historical reference.

> 
> v2: (Tvrtko)
> - Include details in commit message
> - Move intel engine busyness function into execlist code
> - Use union inside engine->stats
> - Use natural type for ping delay jiffies
> - Drop active_work condition checks
> - Use for_each_engine if iterating all engines
> - Drop seq locking, use spinlock at guc level to update engine stats
> - Document worker specific details
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  26 +--
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  82 ++++---
>   .../drm/i915/gt/intel_execlists_submission.c  |  32 +++
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  26 +++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  21 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   5 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  13 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 204 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_reg.h               |   2 +
>   10 files changed, 363 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2ae57e4656a3..6fcc70a313d9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1873,22 +1873,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>   	intel_engine_print_breadcrumbs(engine, m);
>   }
>   
> -static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
> -					    ktime_t *now)
> -{
> -	ktime_t total = engine->stats.total;
> -
> -	/*
> -	 * If the engine is executing something at the moment
> -	 * add it to the total.
> -	 */
> -	*now = ktime_get();
> -	if (READ_ONCE(engine->stats.active))
> -		total = ktime_add(total, ktime_sub(*now, engine->stats.start));
> -
> -	return total;
> -}
> -
>   /**
>    * intel_engine_get_busy_time() - Return current accumulated engine busyness
>    * @engine: engine to report on
> @@ -1898,15 +1882,7 @@ static ktime_t __intel_engine_get_busy_time(struct intel_engine_cs *engine,
>    */
>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   {
> -	unsigned int seq;
> -	ktime_t total;
> -
> -	do {
> -		seq = read_seqcount_begin(&engine->stats.lock);
> -		total = __intel_engine_get_busy_time(engine, now);
> -	} while (read_seqcount_retry(&engine->stats.lock, seq));
> -
> -	return total;
> +	return engine->busyness(engine, now);
>   }
>   
>   struct intel_context *
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 5ae1207c363b..490166b54ed6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -432,6 +432,12 @@ struct intel_engine_cs {
>   	void		(*add_active_request)(struct i915_request *rq);
>   	void		(*remove_active_request)(struct i915_request *rq);
>   
> +	/*
> +	 * Get engine busyness and the time at which the busyness was sampled.
> +	 */
> +	ktime_t		(*busyness)(struct intel_engine_cs *engine,
> +				    ktime_t *now);
> +
>   	struct intel_engine_execlists execlists;
>   
>   	/*
> @@ -481,30 +487,58 @@ struct intel_engine_cs {
>   	u32 (*get_cmd_length_mask)(u32 cmd_header);
>   
>   	struct {
> -		/**
> -		 * @active: Number of contexts currently scheduled in.
> -		 */
> -		unsigned int active;
> -
> -		/**
> -		 * @lock: Lock protecting the below fields.
> -		 */
> -		seqcount_t lock;
> -
> -		/**
> -		 * @total: Total time this engine was busy.
> -		 *
> -		 * Accumulated time not counting the most recent block in cases
> -		 * where engine is currently busy (active > 0).
> -		 */
> -		ktime_t total;
> -
> -		/**
> -		 * @start: Timestamp of the last idle to active transition.
> -		 *
> -		 * Idle is defined as active == 0, active is active > 0.
> -		 */
> -		ktime_t start;
> +		union {

Maybe put a marker like:

			/* Fields used by the execlists backend. */

> +			struct {
> +				/**
> +				 * @active: Number of contexts currently
> +				 * scheduled in.
> +				 */
> +				unsigned int active;
> +
> +				/**
> +				 * @lock: Lock protecting the below fields.
> +				 */
> +				seqcount_t lock;
> +
> +				/**
> +				 * @total: Total time this engine was busy.
> +				 *
> +				 * Accumulated time not counting the most recent
> +				 * block in cases where engine is currently busy
> +				 * (active > 0).
> +				 */
> +				ktime_t total;
> +
> +				/**
> +				 * @start: Timestamp of the last idle to active
> +				 * transition.
> +				 *
> +				 * Idle is defined as active == 0, active is
> +				 * active > 0.
> +				 */
> +				ktime_t start;
> +			};
> +

			/* Fields used by the GuC backend. */

> +			struct {
> +				/**
> +				 * @prev_total: Previous value of total runtime
> +				 * clock cycles.
> +				 */
> +				u32 prev_total;
> +
> +				/**
> +				 * @total_gt_clks: Total gt clock cycles this
> +				 * engine was busy.
> +				 */
> +				u64 total_gt_clks;
> +
> +				/**
> +				 * @start_gt_clk: GT clock time of last idle to
> +				 * active transition.
> +				 */
> +				u64 start_gt_clk;
> +			};
> +		};
>   
>   		/**
>   		 * @rps: Utilisation at last RPS sampling.
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 7147fe80919e..5c9b695e906c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3292,6 +3292,36 @@ static void execlists_release(struct intel_engine_cs *engine)
>   	lrc_fini_wa_ctx(engine);
>   }
>   
> +static ktime_t __execlists_engine_busyness(struct intel_engine_cs *engine,
> +					   ktime_t *now)
> +{
> +	ktime_t total = engine->stats.total;
> +
> +	/*
> +	 * If the engine is executing something at the moment
> +	 * add it to the total.
> +	 */
> +	*now = ktime_get();
> +	if (READ_ONCE(engine->stats.active))
> +		total = ktime_add(total, ktime_sub(*now, engine->stats.start));
> +
> +	return total;
> +}
> +
> +static ktime_t execlists_engine_busyness(struct intel_engine_cs *engine,
> +					 ktime_t *now)
> +{
> +	unsigned int seq;
> +	ktime_t total;
> +
> +	do {
> +		seq = read_seqcount_begin(&engine->stats.lock);
> +		total = __execlists_engine_busyness(engine, now);
> +	} while (read_seqcount_retry(&engine->stats.lock, seq));
> +
> +	return total;
> +}
> +
>   static void
>   logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   {
> @@ -3348,6 +3378,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   		engine->emit_bb_start = gen8_emit_bb_start;
>   	else
>   		engine->emit_bb_start = gen8_emit_bb_start_noarb;
> +
> +	engine->busyness = execlists_engine_busyness;
>   }
>   
>   static void logical_ring_default_irqs(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 8ff582222aff..ff1311d4beff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -143,6 +143,7 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>   	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
> +	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>   	INTEL_GUC_ACTION_LIMIT
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 5dd174babf7a..22c30dbdf63a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -104,6 +104,8 @@ struct intel_guc {
>   	u32 ads_regset_size;
>   	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>   	u32 ads_golden_ctxt_size;
> +	/** @ads_engine_usage_size: size of engine usage in the ADS */
> +	u32 ads_engine_usage_size;
>   
>   	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
>   	struct i915_vma *lrc_desc_pool;
> @@ -138,6 +140,30 @@ struct intel_guc {
>   
>   	/** @send_mutex: used to serialize the intel_guc_send actions */
>   	struct mutex send_mutex;
> +
> +	struct {
> +		/**
> +		 * @lock: Lock protecting the below fields and the engine stats.
> +		 */
> +		spinlock_t lock;
> +
> +		/**
> +		 * @gt_stamp: 64 bit extended value of the GT timestamp.
> +		 */
> +		u64 gt_stamp;
> +
> +		/**
> +		 * @ping_delay: Period for polling the GT timestamp for
> +		 * overflow.
> +		 */
> +		unsigned long ping_delay;
> +
> +		/**
> +		 * @work: Periodic work to adjust GT timestamp, engine and
> +		 * context usage for overflows.
> +		 */
> +		struct delayed_work work;
> +	} timestamp;
>   };
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 2c6ea64af7ec..ca9ab53999d5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -26,6 +26,8 @@
>    *      | guc_policies                          |
>    *      +---------------------------------------+
>    *      | guc_gt_system_info                    |
> + *      +---------------------------------------+
> + *      | guc_engine_usage                      |
>    *      +---------------------------------------+ <== static
>    *      | guc_mmio_reg[countA] (engine 0.0)     |
>    *      | guc_mmio_reg[countB] (engine 0.1)     |
> @@ -47,6 +49,7 @@ struct __guc_ads_blob {
>   	struct guc_ads ads;
>   	struct guc_policies policies;
>   	struct guc_gt_system_info system_info;
> +	struct guc_engine_usage engine_usage;
>   	/* From here on, location is dynamic! Refer to above diagram. */
>   	struct guc_mmio_reg regset[0];
>   } __packed;
> @@ -628,3 +631,21 @@ void intel_guc_ads_reset(struct intel_guc *guc)
>   
>   	guc_ads_private_data_reset(guc);
>   }
> +
> +u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
> +{
> +	struct __guc_ads_blob *blob = guc->ads_blob;
> +	u32 base = intel_guc_ggtt_offset(guc, guc->ads_vma);
> +	u32 offset = base + ptr_offset(blob, engine_usage);
> +
> +	return offset;
> +}
> +
> +struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine)
> +{
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct __guc_ads_blob *blob = guc->ads_blob;
> +	u8 guc_class = engine_class_to_guc_class(engine->class);
> +
> +	return &blob->engine_usage.engines[guc_class][engine->instance];
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
> index 3d85051d57e4..e74c110facff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
> @@ -6,8 +6,11 @@
>   #ifndef _INTEL_GUC_ADS_H_
>   #define _INTEL_GUC_ADS_H_
>   
> +#include <linux/types.h>
> +
>   struct intel_guc;
>   struct drm_printer;
> +struct intel_engine_cs;
>   
>   int intel_guc_ads_create(struct intel_guc *guc);
>   void intel_guc_ads_destroy(struct intel_guc *guc);
> @@ -15,5 +18,7 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
>   void intel_guc_ads_reset(struct intel_guc *guc);
>   void intel_guc_ads_print_policy_info(struct intel_guc *guc,
>   				     struct drm_printer *p);
> +struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine);
> +u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index fa4be13c8854..7c9c081670fc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -294,6 +294,19 @@ struct guc_ads {
>   	u32 reserved[15];
>   } __packed;
>   
> +/* Engine usage stats */
> +struct guc_engine_usage_record {
> +	u32 current_context_index;
> +	u32 last_switch_in_stamp;
> +	u32 reserved0;
> +	u32 total_runtime;
> +	u32 reserved1[4];
> +} __packed;
> +
> +struct guc_engine_usage {
> +	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> +} __packed;
> +
>   /* GuC logging structures */
>   
>   enum guc_log_buffer_type {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ba0de35f6323..5d29a4913e17 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -12,6 +12,7 @@
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_clock_utils.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm.h"
>   #include "gt/intel_gt_requests.h"
> @@ -20,6 +21,7 @@
>   #include "gt/intel_mocs.h"
>   #include "gt/intel_ring.h"
>   
> +#include "intel_guc_ads.h"
>   #include "intel_guc_submission.h"
>   
>   #include "i915_drv.h"
> @@ -762,12 +764,25 @@ submission_disabled(struct intel_guc *guc)
>   static void disable_submission(struct intel_guc *guc)
>   {
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +	unsigned long flags;
>   
>   	if (__tasklet_is_enabled(&sched_engine->tasklet)) {
>   		GEM_BUG_ON(!guc->ct.enabled);
>   		__tasklet_disable_sync_once(&sched_engine->tasklet);
>   		sched_engine->tasklet.callback = NULL;
>   	}
> +
> +	cancel_delayed_work(&guc->timestamp.work);
> +
> +	spin_lock_irqsave(&guc->timestamp.lock, flags);
> +
> +	for_each_engine(engine, gt, id)
> +		engine->stats.prev_total = 0;
> +
> +	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
>   }
>   
>   static void enable_submission(struct intel_guc *guc)
> @@ -1164,6 +1179,192 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	i915_sched_engine_put(guc->sched_engine);
>   }
>   
> +/*
> + * GuC stores busyness stats for each engine at context in/out boundaries. A
> + * context 'in' logs execution start time, 'out' adds in -> out delta to total.
> + * i915/kmd accesses 'start', 'total' and 'context id' from memory shared with
> + * GuC.
> + *
> + * __i915_pmu_event_read samples engine busyness. When sampling, if context id
> + * is valid (!= ~0) and start is non-zero, the engine is considered to be
> + * active. For an active engine total busyness = total + (now - start), where
> + * 'now' is the time at which the busyness is sampled. For inactive engine,
> + * total busyness = total.
> + *
> + * All times are captured from GUCPMTIMESTAMP reg and are in gt clock domain.
> + *
> + * The start and total values provided by GuC are 32 bits and wrap around in a
> + * few minutes. Since perf pmu provides busyness as 64 bit monotonically
> + * increasing ns values, there is a need for this implementation to account for
> + * overflows and extend the GuC proviced values to 64 bits before returning
> + * busyness to the user. In order to do that, a worker runs periodically at
> + * frequency = 1/8th the time it takes for the timestamp to wrap (i.e. once in
> + * 27 seconds for a gt clock frequency of 19.2 MHz).
> + */
> +
> +#define WRAP_TIME_CLKS U32_MAX
> +#define POLL_TIME_CLKS (WRAP_TIME_CLKS >> 3)
> +
> +static inline void

I'd probably drop the inline from here and the one below and let the 
compiler decide.

> +__update_timestamp(struct intel_guc *guc, u64 *prev_start, u32 new_start)
> +{
> +	u32 gt_stamp_hi = upper_32_bits(guc->timestamp.gt_stamp);
> +	u32 gt_stamp_last = lower_32_bits(guc->timestamp.gt_stamp);
> +
> +	if (new_start == lower_32_bits(*prev_start))
> +		return;
> +
> +	if (new_start < gt_stamp_last &&
> +	    (new_start - gt_stamp_last) <= POLL_TIME_CLKS)
> +		gt_stamp_hi++;
> +
> +	if (new_start > gt_stamp_last &&
> +	    (gt_stamp_last - new_start) <= POLL_TIME_CLKS)
> +		if (gt_stamp_hi)
> +			gt_stamp_hi--;
> +
> +	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
> +}
> +
> +static inline void
> +__update_counter(u64 *curr_value, u32 new)
> +{
> +	u32 hi = upper_32_bits(*curr_value);
> +
> +	if (new < lower_32_bits(*curr_value))
> +		hi++;
> +
> +	*curr_value = ((u64)hi << 32) | new;
> +}
> +
> +static bool guc_update_engine_gt_clks(struct intel_engine_cs *engine)
> +{
> +	struct guc_engine_usage_record *rec = intel_guc_engine_usage(engine);
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	u32 last_switch = rec->last_switch_in_stamp;
> +	u32 ctx_id = rec->current_context_index;
> +	u32 total = rec->total_runtime;
> +	bool active = ctx_id != ~0U && last_switch;
> +
> +	if (active)
> +		__update_timestamp(guc, &engine->stats.start_gt_clk,
> +				   last_switch);
> +
> +	/*
> +	 * Instead of adjusting the total for overflow, just add the
> +	 * difference from previous sample to the stats.total_gt_clks
> +	 */
> +	if (total && total != ~0U) {
> +		engine->stats.total_gt_clks += (u32)(total -
> +						     engine->stats.prev_total);
> +		engine->stats.prev_total = total;
> +	}
> +
> +	return active;
> +}
> +
> +static void guc_update_pm_timestamp(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 gt_stamp_now;
> +
> +	if (intel_gt_pm_get_if_awake(gt)) {
> +		gt_stamp_now = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
> +		intel_gt_pm_put_async(gt);
> +		__update_counter(&guc->timestamp.gt_stamp, gt_stamp_now);
> +	}
> +}
> +
> +/*
> + * Unlike the execlist mode of submission total and active times are in terms of
> + * gt clocks. The *now parameter is retained to return the cpu time at which the
> + * busyness was sampled.
> + */
> +static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
> +{
> +	struct intel_gt *gt = engine->gt;
> +	struct intel_guc *guc = &gt->uc.guc;
> +	unsigned long flags;
> +	bool active;
> +	u64 total;
> +
> +	spin_lock_irqsave(&guc->timestamp.lock, flags);
> +
> +	*now = ktime_get();
> +	active = guc_update_engine_gt_clks(engine);
> +	guc_update_pm_timestamp(guc);

I am a bit nervous that we have a mix of i915 view of "active" (pm get 
if awake) and GuC via "active = <read shared page and determine>".

The two sources come together in:

  if (active) {
	u64 clk = guc->timestamp.gt_stamp - engine->stats.start_gt_clk;

Where active comes from GuC and gt_stamp "up to dateness" comes from 
whether or not intel_gt_pm_get_if_awake succeeded.

Coupled with the fact that you will need to add some hooks to pmu 
park/unpark to handle the ping worker I wonder how it would look to try 
and use a more consistent view here.

What I mean is use the i915 view exclusively when deciding whether or 
not to query anything from the GuC, or just use last known i915 copy of 
the data.

In other words the outline of the operation would be:

guc_engine_busyness / guc_timestamp_ping
{
	intel_gt_pm_get_if_awake {
		spin_lock
		read and update guc state
		spin_unlock
	} else {
		spin_lock
		read last known guc state (100% driver copy)
		spin_unlock
	}

	...
}

pmu park
{
	park worker

	spin_lock
	read and update guc state
	spin_unlock
}

pmu unpark
{
	unpark worker
}	

Not sure to how much my concern amounts in practice so it is open for 
discussion.

At least we know we have inherent racyness in context save vs guc 
tracking so perhaps best not to add more.

Otherwise the design, in terms of how it fits into i915, now looks fine 
to me (module unfinished worker parking).

Regards,

Tvrtko

> +
> +	total = intel_gt_clock_interval_to_ns(gt, engine->stats.total_gt_clks);
> +	if (active) {
> +		u64 clk = guc->timestamp.gt_stamp - engine->stats.start_gt_clk;
> +
> +		total += intel_gt_clock_interval_to_ns(gt, clk);
> +	}
> +
> +	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
> +
> +	return ns_to_ktime(total);
> +}
> +
> +static void guc_timestamp_ping(struct work_struct *wrk)
> +{
> +	struct intel_guc *guc = container_of(wrk, typeof(*guc), timestamp.work.work);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->timestamp.lock, flags);
> +
> +	/* adjust the guc pm timestamp for overflow */
> +	guc_update_pm_timestamp(guc);
> +
> +	/* adjust the engine stats for overflow */
> +	for_each_engine_masked(engine, gt, ALL_ENGINES, tmp)

for_each_engine

> +		guc_update_engine_gt_clks(engine);
> +
> +	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
> +
> +	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
> +}
> +
> +static int guc_action_enable_usage_stats(struct intel_guc *guc)
> +{
> +	u32 offset = intel_guc_engine_usage_offset(guc);
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF,
> +		offset,
> +		0,
> +	};
> +
> +	return intel_guc_send(guc, action, ARRAY_SIZE(action));
> +}
> +
> +static void __queue_work(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> +	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> +	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
> +}
> +
> +static void guc_init_engine_stats(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	intel_wakeref_t wakeref;
> +
> +	spin_lock_init(&guc->timestamp.lock);
> +	__queue_work(guc);
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
> +		int ret = guc_action_enable_usage_stats(guc);
> +
> +		if (ret)
> +			drm_err(&gt->i915->drm,
> +				"Failed to enable usage stats: %d!\n", ret);
> +	}
> +}
> +
>   static inline void queue_request(struct i915_sched_engine *sched_engine,
>   				 struct i915_request *rq,
>   				 int prio)
> @@ -2606,7 +2807,9 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   		engine->emit_flush = gen12_emit_flush_xcs;
>   	}
>   	engine->set_default_submission = guc_set_default_submission;
> +	engine->busyness = guc_engine_busyness;
>   
> +	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
>   	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
>   	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>   
> @@ -2705,6 +2908,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   void intel_guc_submission_enable(struct intel_guc *guc)
>   {
>   	guc_init_lrc_mapping(guc);
> +	guc_init_engine_stats(guc);
>   }
>   
>   void intel_guc_submission_disable(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index ef594df039db..8bc88c1bd68e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2664,6 +2664,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>   #define   RING_WAIT		(1 << 11) /* gen3+, PRBx_CTL */
>   #define   RING_WAIT_SEMAPHORE	(1 << 10) /* gen6+ */
>   
> +#define GUCPMTIMESTAMP          _MMIO(0xC3E8)
> +
>   /* There are 16 64-bit CS General Purpose Registers per-engine on Gen8+ */
>   #define GEN8_RING_CS_GPR(base, n)	_MMIO((base) + 0x600 + (n) * 8)
>   #define GEN8_RING_CS_GPR_UDW(base, n)	_MMIO((base) + 0x600 + (n) * 8 + 4)
> 
