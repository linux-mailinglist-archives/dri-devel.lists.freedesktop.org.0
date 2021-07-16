Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C73CBFD5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 01:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9F76E9FA;
	Fri, 16 Jul 2021 23:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBFA6E9EC;
 Fri, 16 Jul 2021 23:43:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210794376"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="210794376"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 16:43:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="495092485"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 16:43:27 -0700
Date: Fri, 16 Jul 2021 23:43:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 48/51] drm/i915/selftest: Fix hangcheck self test for GuC
 submission
Message-ID: <20210716234325.GA10468@DUT151-ICLU.fm.intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-49-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716201724.54804-49-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:17:21PM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When GuC submission is enabled, the GuC controls engine resets. Rather
> than explicitly triggering a reset, the driver must submit a hanging
> context to GuC and wait for the reset to occur.
> 
> Conversely, one of the tests specifically sends hanging batches to the
> engines but wants them to sit around until a manual reset of the full
> GT (including GuC itself). That means disabling GuC based engine
> resets to prevent those from killing the hanging batch too soon. So,
> add support to the scheduling policy helper for disabling resets as
> well as making them quicker!
> 
> In GuC submission mode, the 'is engine idle' test basically turns into
> 'is engine PM wakelock held'. Independently, there is a heartbeat
> disable helper function that the tests use. For unexplained reasons,
> this acquires the engine wakelock before disabling the heartbeat and
> only releases it when re-enabling the heartbeat. As one of the tests
> tries to do a wait for idle in the middle of a heartbeat disabled
> section, it is therefore guaranteed to always fail. Added a 'no_pm'
> variant of the heartbeat helper that allows the engine to be asleep
> while also having heartbeats disabled.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_types.h  |   1 +
>  .../drm/i915/gt/selftest_engine_heartbeat.c   |  22 ++
>  .../drm/i915/gt/selftest_engine_heartbeat.h   |   2 +
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 223 +++++++++++++-----
>  drivers/gpu/drm/i915/gt/selftest_mocs.c       |   3 +-
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |   6 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   3 +
>  .../i915/selftests/intel_scheduler_helpers.c  |  39 ++-
>  .../i915/selftests/intel_scheduler_helpers.h  |   9 +-
>  9 files changed, 237 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index d66b732a91c2..eec57e57403f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -449,6 +449,7 @@ struct intel_engine_cs {
>  #define I915_ENGINE_IS_VIRTUAL       BIT(5)
>  #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
>  #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
> +#define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
>  	unsigned int flags;
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index 4896e4ccad50..317eebf086c3 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -405,3 +405,25 @@ void st_engine_heartbeat_enable(struct intel_engine_cs *engine)
>  	engine->props.heartbeat_interval_ms =
>  		engine->defaults.heartbeat_interval_ms;
>  }
> +
> +void st_engine_heartbeat_disable_no_pm(struct intel_engine_cs *engine)
> +{
> +	engine->props.heartbeat_interval_ms = 0;
> +
> +	/*
> +	 * Park the heartbeat but without holding the PM lock as that
> +	 * makes the engines appear not-idle. Note that if/when unpark
> +	 * is called due to the PM lock being acquired later the
> +	 * heartbeat still won't be enabled because of the above = 0.
> +	 */
> +	if (intel_engine_pm_get_if_awake(engine)) {
> +		intel_engine_park_heartbeat(engine);
> +		intel_engine_pm_put(engine);
> +	}
> +}
> +
> +void st_engine_heartbeat_enable_no_pm(struct intel_engine_cs *engine)
> +{
> +	engine->props.heartbeat_interval_ms =
> +		engine->defaults.heartbeat_interval_ms;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
> index cd27113d5400..81da2cd8e406 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
> @@ -9,6 +9,8 @@
>  struct intel_engine_cs;
>  
>  void st_engine_heartbeat_disable(struct intel_engine_cs *engine);
> +void st_engine_heartbeat_disable_no_pm(struct intel_engine_cs *engine);
>  void st_engine_heartbeat_enable(struct intel_engine_cs *engine);
> +void st_engine_heartbeat_enable_no_pm(struct intel_engine_cs *engine);
>  
>  #endif /* SELFTEST_ENGINE_HEARTBEAT_H */
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 0ed87cc4d063..971c0c249eb0 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -17,6 +17,8 @@
>  #include "selftests/igt_flush_test.h"
>  #include "selftests/igt_reset.h"
>  #include "selftests/igt_atomic.h"
> +#include "selftests/igt_spinner.h"
> +#include "selftests/intel_scheduler_helpers.h"
>  
>  #include "selftests/mock_drm.h"
>  
> @@ -449,6 +451,14 @@ static int igt_reset_nop_engine(void *arg)
>  		IGT_TIMEOUT(end_time);
>  		int err;
>  
> +		if (intel_engine_uses_guc(engine)) {
> +			/* Engine level resets are triggered by GuC when a hang
> +			 * is detected. They can't be triggered by the KMD any
> +			 * more. Thus a nop batch cannot be used as a reset test
> +			 */
> +			continue;
> +		}
> +
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
>  			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> @@ -560,6 +570,10 @@ static int igt_reset_fail_engine(void *arg)
>  		IGT_TIMEOUT(end_time);
>  		int err;
>  
> +		/* Can't manually break the reset if i915 doesn't perform it */
> +		if (intel_engine_uses_guc(engine))
> +			continue;
> +
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
>  			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
> @@ -699,8 +713,12 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  	for_each_engine(engine, gt, id) {
>  		unsigned int reset_count, reset_engine_count;
>  		unsigned long count;
> +		bool using_guc = intel_engine_uses_guc(engine);
>  		IGT_TIMEOUT(end_time);
>  
> +		if (using_guc && !active)
> +			continue;
> +
>  		if (active && !intel_engine_can_store_dword(engine))
>  			continue;
>  
> @@ -718,14 +736,23 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		count = 0;
>  		do {
> -			if (active) {
> -				struct i915_request *rq;
> +			struct i915_request *rq = NULL;
> +			struct intel_selftest_saved_policy saved;
> +			int err2;
> +
> +			err = intel_selftest_modify_policy(engine, &saved,
> +							   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
> +			if (err) {
> +				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
> +				break;
> +			}
>  
> +			if (active) {
>  				rq = hang_create_request(&h, engine);
>  				if (IS_ERR(rq)) {
>  					err = PTR_ERR(rq);
>  					pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
> -					break;
> +					goto restore;
>  				}
>  
>  				i915_request_get(rq);
> @@ -741,34 +768,58 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>  
>  					i915_request_put(rq);
>  					err = -EIO;
> -					break;
> +					goto restore;
>  				}
> +			}
>  
> -				i915_request_put(rq);
> +			if (!using_guc) {
> +				err = intel_engine_reset(engine, NULL);
> +				if (err) {
> +					pr_err("intel_engine_reset(%s) failed, err:%d\n",
> +					       engine->name, err);
> +					goto skip;
> +				}
>  			}
>  
> -			err = intel_engine_reset(engine, NULL);
> -			if (err) {
> -				pr_err("intel_engine_reset(%s) failed, err:%d\n",
> -				       engine->name, err);
> -				break;
> +			if (rq) {
> +				/* Ensure the reset happens and kills the engine */
> +				err = intel_selftest_wait_for_rq(rq);
> +				if (err)
> +					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
> +					       engine->name, rq->fence.context, rq->fence.seqno, rq->context->guc_id, err);
>  			}
>  
> +skip:
> +			if (rq)
> +				i915_request_put(rq);
> +
>  			if (i915_reset_count(global) != reset_count) {
>  				pr_err("Full GPU reset recorded! (engine reset expected)\n");
>  				err = -EINVAL;
> -				break;
> +				goto restore;
>  			}
>  
> -			if (i915_reset_engine_count(global, engine) !=
> -			    ++reset_engine_count) {
> -				pr_err("%s engine reset not recorded!\n",
> -				       engine->name);
> -				err = -EINVAL;
> -				break;
> +			/* GuC based resets are not logged per engine */
> +			if (!using_guc) {
> +				if (i915_reset_engine_count(global, engine) !=
> +				    ++reset_engine_count) {
> +					pr_err("%s engine reset not recorded!\n",
> +					       engine->name);
> +					err = -EINVAL;
> +					goto restore;
> +				}
>  			}
>  
>  			count++;
> +
> +restore:
> +			err2 = intel_selftest_restore_policy(engine, &saved);
> +			if (err2)
> +				pr_err("[%s] Restore policy failed: %d!\n", engine->name, err);
> +			if (err == 0)
> +				err = err2;
> +			if (err)
> +				break;
>  		} while (time_before(jiffies, end_time));
>  		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		st_engine_heartbeat_enable(engine);
> @@ -941,10 +992,13 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  		struct active_engine threads[I915_NUM_ENGINES] = {};
>  		unsigned long device = i915_reset_count(global);
>  		unsigned long count = 0, reported;
> +		bool using_guc = intel_engine_uses_guc(engine);
>  		IGT_TIMEOUT(end_time);
>  
> -		if (flags & TEST_ACTIVE &&
> -		    !intel_engine_can_store_dword(engine))
> +		if (flags & TEST_ACTIVE) {
> +			if (!intel_engine_can_store_dword(engine))
> +				continue;
> +		} else if (using_guc)
>  			continue;
>  
>  		if (!wait_for_idle(engine)) {
> @@ -984,17 +1038,26 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  
>  		yield(); /* start all threads before we begin */
>  
> -		st_engine_heartbeat_disable(engine);
> +		st_engine_heartbeat_disable_no_pm(engine);
>  		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>  		do {
>  			struct i915_request *rq = NULL;
> +			struct intel_selftest_saved_policy saved;
> +			int err2;
> +
> +			err = intel_selftest_modify_policy(engine, &saved,
> +							  SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
> +			if (err) {
> +				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
> +				break;
> +			}
>  
>  			if (flags & TEST_ACTIVE) {
>  				rq = hang_create_request(&h, engine);
>  				if (IS_ERR(rq)) {
>  					err = PTR_ERR(rq);
>  					pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
> -					break;
> +					goto restore;
>  				}
>  
>  				i915_request_get(rq);
> @@ -1010,15 +1073,27 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  
>  					i915_request_put(rq);
>  					err = -EIO;
> -					break;
> +					goto restore;
>  				}
> +			} else {
> +				intel_engine_pm_get(engine);
>  			}
>  
> -			err = intel_engine_reset(engine, NULL);
> -			if (err) {
> -				pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
> -				       engine->name, test_name, err);
> -				break;
> +			if (!using_guc) {
> +				err = intel_engine_reset(engine, NULL);
> +				if (err) {
> +					pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
> +					       engine->name, test_name, err);
> +					goto restore;
> +				}
> +			}
> +
> +			if (rq) {
> +				/* Ensure the reset happens and kills the engine */
> +				err = intel_selftest_wait_for_rq(rq);
> +				if (err)
> +					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
> +					       engine->name, rq->fence.context, rq->fence.seqno, rq->context->guc_id, err);
>  			}
>  
>  			count++;
> @@ -1035,7 +1110,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  					GEM_TRACE_DUMP();
>  					intel_gt_set_wedged(gt);
>  					err = -EIO;
> -					break;
> +					goto restore;
>  				}
>  
>  				if (i915_request_wait(rq, 0, HZ / 5) < 0) {
> @@ -1054,12 +1129,15 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  					GEM_TRACE_DUMP();
>  					intel_gt_set_wedged(gt);
>  					err = -EIO;
> -					break;
> +					goto restore;
>  				}
>  
>  				i915_request_put(rq);
>  			}
>  
> +			if (!(flags & TEST_ACTIVE))
> +				intel_engine_pm_put(engine);
> +
>  			if (!(flags & TEST_SELF) && !wait_for_idle(engine)) {
>  				struct drm_printer p =
>  					drm_info_printer(gt->i915->drm.dev);
> @@ -1071,22 +1149,34 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  						  "%s\n", engine->name);
>  
>  				err = -EIO;
> -				break;
> +				goto restore;
>  			}
> +
> +restore:
> +			err2 = intel_selftest_restore_policy(engine, &saved);
> +			if (err2)
> +				pr_err("[%s] Restore policy failed: %d!\n", engine->name, err2);
> +			if (err == 0)
> +				err = err2;
> +			if (err)
> +				break;
>  		} while (time_before(jiffies, end_time));
>  		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> -		st_engine_heartbeat_enable(engine);
> +		st_engine_heartbeat_enable_no_pm(engine);
>  
>  		pr_info("i915_reset_engine(%s:%s): %lu resets\n",
>  			engine->name, test_name, count);
>  
> -		reported = i915_reset_engine_count(global, engine);
> -		reported -= threads[engine->id].resets;
> -		if (reported != count) {
> -			pr_err("i915_reset_engine(%s:%s): reset %lu times, but reported %lu\n",
> -			       engine->name, test_name, count, reported);
> -			if (!err)
> -				err = -EINVAL;
> +		/* GuC based resets are not logged per engine */
> +		if (!using_guc) {
> +			reported = i915_reset_engine_count(global, engine);
> +			reported -= threads[engine->id].resets;
> +			if (reported != count) {
> +				pr_err("i915_reset_engine(%s:%s): reset %lu times, but reported %lu\n",
> +				       engine->name, test_name, count, reported);
> +				if (!err)
> +					err = -EINVAL;
> +			}
>  		}
>  
>  unwind:
> @@ -1105,15 +1195,18 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  			}
>  			put_task_struct(threads[tmp].task);
>  
> -			if (other->uabi_class != engine->uabi_class &&
> -			    threads[tmp].resets !=
> -			    i915_reset_engine_count(global, other)) {
> -				pr_err("Innocent engine %s was reset (count=%ld)\n",
> -				       other->name,
> -				       i915_reset_engine_count(global, other) -
> -				       threads[tmp].resets);
> -				if (!err)
> -					err = -EINVAL;
> +			/* GuC based resets are not logged per engine */
> +			if (!using_guc) {
> +				if (other->uabi_class != engine->uabi_class &&
> +				    threads[tmp].resets !=
> +				    i915_reset_engine_count(global, other)) {
> +					pr_err("Innocent engine %s was reset (count=%ld)\n",
> +					       other->name,
> +					       i915_reset_engine_count(global, other) -
> +					       threads[tmp].resets);
> +					if (!err)
> +						err = -EINVAL;
> +				}
>  			}
>  		}
>  
> @@ -1553,18 +1646,29 @@ static int igt_reset_queue(void *arg)
>  		goto unlock;
>  
>  	for_each_engine(engine, gt, id) {
> +		struct intel_selftest_saved_policy saved;
>  		struct i915_request *prev;
>  		IGT_TIMEOUT(end_time);
>  		unsigned int count;
> +		bool using_guc = intel_engine_uses_guc(engine);
>  
>  		if (!intel_engine_can_store_dword(engine))
>  			continue;
>  
> +		if (using_guc) {
> +			err = intel_selftest_modify_policy(engine, &saved,
> +							  SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK);
> +			if (err) {
> +				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
> +				goto fini;
> +			}
> +		}
> +
>  		prev = hang_create_request(&h, engine);
>  		if (IS_ERR(prev)) {
>  			err = PTR_ERR(prev);
>  			pr_err("[%s] Create 'prev' hang request failed: %d!\n", engine->name, err);
> -			goto fini;
> +			goto restore;
>  		}
>  
>  		i915_request_get(prev);
> @@ -1579,7 +1683,7 @@ static int igt_reset_queue(void *arg)
>  			if (IS_ERR(rq)) {
>  				err = PTR_ERR(rq);
>  				pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			i915_request_get(rq);
> @@ -1604,7 +1708,7 @@ static int igt_reset_queue(void *arg)
>  
>  				GEM_TRACE_DUMP();
>  				intel_gt_set_wedged(gt);
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			if (!wait_until_running(&h, prev)) {
> @@ -1622,7 +1726,7 @@ static int igt_reset_queue(void *arg)
>  				intel_gt_set_wedged(gt);
>  
>  				err = -EIO;
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			reset_count = fake_hangcheck(gt, BIT(id));
> @@ -1633,7 +1737,7 @@ static int igt_reset_queue(void *arg)
>  				i915_request_put(rq);
>  				i915_request_put(prev);
>  				err = -EINVAL;
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			if (rq->fence.error) {
> @@ -1642,7 +1746,7 @@ static int igt_reset_queue(void *arg)
>  				i915_request_put(rq);
>  				i915_request_put(prev);
>  				err = -EINVAL;
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			if (i915_reset_count(global) == reset_count) {
> @@ -1650,7 +1754,7 @@ static int igt_reset_queue(void *arg)
>  				i915_request_put(rq);
>  				i915_request_put(prev);
>  				err = -EINVAL;
> -				goto fini;
> +				goto restore;
>  			}
>  
>  			i915_request_put(prev);
> @@ -1665,6 +1769,17 @@ static int igt_reset_queue(void *arg)
>  
>  		i915_request_put(prev);
>  
> +restore:
> +		if (using_guc) {
> +			int err2 = intel_selftest_restore_policy(engine, &saved);
> +			if (err2)
> +				pr_err("%s:%d> [%s] Restore policy failed: %d!\n", __func__, __LINE__, engine->name, err2);
> +			if (err == 0)
> +				err = err2;
> +		}
> +		if (err)
> +			goto fini;
> +
>  		err = igt_flush_test(gt->i915);
>  		if (err) {
>  			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index b7314739ee40..13d25bf2a94a 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -408,7 +408,8 @@ static int live_mocs_reset(void *arg)
>  		struct intel_context *ce;
>  		int err2;
>  
> -		err = intel_selftest_modify_policy(engine, &saved);
> +		err = intel_selftest_modify_policy(engine, &saved,
> +						   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
>  		if (err)
>  			break;
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 7727bc531ea9..d820f0b41634 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -810,7 +810,8 @@ static int live_reset_whitelist(void *arg)
>  				struct intel_selftest_saved_policy saved;
>  				int err2;
>  
> -				err = intel_selftest_modify_policy(engine, &saved);
> +				err = intel_selftest_modify_policy(engine, &saved,
> +								   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
>  				if(err)
>  					goto out;
>  
> @@ -1268,7 +1269,8 @@ live_engine_reset_workarounds(void *arg)
>  		int ret2;
>  
>  		pr_info("Verifying after %s reset...\n", engine->name);
> -		ret = intel_selftest_modify_policy(engine, &saved);
> +		ret = intel_selftest_modify_policy(engine, &saved,
> +						   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
>  		if (ret)
>  			break;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1c30d04733ff..536fdbc406c6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1235,6 +1235,9 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>  {
>  	desc->policy_flags = 0;
>  
> +	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> +		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
> +
>  	/* NB: For both of these, zero means disabled. */
>  	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
>  	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 91ecd8a1bd21..69db139f9e0d 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -16,7 +16,8 @@
>  #define WAIT_FOR_RESET_TIME	1000
>  
>  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> -				 struct intel_selftest_saved_policy *saved)
> +				 struct intel_selftest_saved_policy *saved,
> +				 u32 modify_type)
>  
>  {
>  	int err;
> @@ -26,18 +27,30 @@ int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>  	saved->timeslice = engine->props.timeslice_duration_ms;
>  	saved->preempt_timeout = engine->props.preempt_timeout_ms;
>  
> -	/*
> -	 * Enable force pre-emption on time slice expiration
> -	 * together with engine reset on pre-emption timeout.
> -	 * This is required to make the GuC notice and reset
> -	 * the single hanging context.
> -	 * Also, reduce the preemption timeout to something
> -	 * small to speed the test up.
> -	 */
> -	engine->i915->params.reset = 2;
> -	engine->flags |= I915_ENGINE_WANT_FORCED_PREEMPTION;
> -	engine->props.timeslice_duration_ms = REDUCED_TIMESLICE;
> -	engine->props.preempt_timeout_ms = REDUCED_PREEMPT;
> +	switch (modify_type) {
> +	case SELFTEST_SCHEDULER_MODIFY_FAST_RESET:
> +		/*
> +		 * Enable force pre-emption on time slice expiration
> +		 * together with engine reset on pre-emption timeout.
> +		 * This is required to make the GuC notice and reset
> +		 * the single hanging context.
> +		 * Also, reduce the preemption timeout to something
> +		 * small to speed the test up.
> +		 */
> +		engine->i915->params.reset = 2;
> +		engine->flags |= I915_ENGINE_WANT_FORCED_PREEMPTION;
> +		engine->props.timeslice_duration_ms = REDUCED_TIMESLICE;
> +		engine->props.preempt_timeout_ms = REDUCED_PREEMPT;
> +		break;
> +
> +	case SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK:
> +		engine->props.preempt_timeout_ms = 0;
> +		break;
> +
> +	default:
> +		pr_err("Invalid scheduler policy modification type: %d!\n", modify_type);
> +		return -EINVAL;
> +	}
>  
>  	if (!intel_engine_uses_guc(engine))
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> index f30e96f0ba95..050bc5a8ba8b 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> @@ -19,8 +19,15 @@ struct intel_selftest_saved_policy
>  	u64 preempt_timeout;
>  };
>  
> +enum selftest_scheduler_modify
> +{
> +	SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK = 0,
> +	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
> +};
> +
>  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> -				 struct intel_selftest_saved_policy *saved);
> +				 struct intel_selftest_saved_policy *saved,
> +				 enum selftest_scheduler_modify modify_type);
>  int intel_selftest_restore_policy(struct intel_engine_cs *engine,
>  				  struct intel_selftest_saved_policy *saved);
>  int intel_selftest_wait_for_rq( struct i915_request *rq);
> -- 
> 2.28.0
> 
