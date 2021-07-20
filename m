Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011093CF1C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 04:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E706E0E6;
	Tue, 20 Jul 2021 02:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E851B6E07D;
 Tue, 20 Jul 2021 02:04:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="208047868"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="208047868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 19:04:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="657121066"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 19:04:17 -0700
Date: Mon, 19 Jul 2021 18:53:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 15/51] drm/i915/guc: Update intel_gt_wait_for_idle to
 work with GuC
Message-ID: <20210720015300.GA13203@sdutt-i7>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-16-matthew.brost@intel.com>
 <4bfe5983-eb17-6993-6210-0f7fe38ea1fb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bfe5983-eb17-6993-6210-0f7fe38ea1fb@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 06:03:05PM -0700, John Harrison wrote:
> On 7/16/2021 13:16, Matthew Brost wrote:
> > When running the GuC the GPU can't be considered idle if the GuC still
> > has contexts pinned. As such, a call has been added in
> > intel_gt_wait_for_idle to idle the UC and in turn the GuC by waiting for
> > the number of unpinned contexts to go to zero.
> > 
> > v2: rtimeout -> remaining_timeout
> > v3: Drop unnecessary includes, guc_submission_busy_loop ->
> > guc_submission_send_busy_loop, drop negatie timeout trick, move a
> > refactor of guc_context_unpin to earlier path (John H)
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
> >   drivers/gpu/drm/i915/gt/intel_gt.c            | 19 +++++
> >   drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
> >   drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 21 ++---
> >   drivers/gpu/drm/i915/gt/intel_gt_requests.h   |  7 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  1 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 85 +++++++++++++++++--
> >   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  5 ++
> >   drivers/gpu/drm/i915/i915_gem_evict.c         |  1 +
> >   .../gpu/drm/i915/selftests/igt_live_test.c    |  2 +-
> >   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 +-
> >   13 files changed, 129 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index a90f796e85c0..6fffd4d377c2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -645,7 +645,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> >   		goto insert;
> >   	/* Attempt to reap some mmap space from dead objects */
> > -	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT);
> > +	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
> > +					       NULL);
> >   	if (err)
> >   		goto err;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index e714e21c0a4d..acfdd53b2678 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -585,6 +585,25 @@ static void __intel_gt_disable(struct intel_gt *gt)
> >   	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
> >   }
> > +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> > +{
> > +	long remaining_timeout;
> > +
> > +	/* If the device is asleep, we have no requests outstanding */
> > +	if (!intel_gt_pm_is_awake(gt))
> > +		return 0;
> > +
> > +	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
> > +							   &remaining_timeout)) > 0) {
> > +		cond_resched();
> > +		if (signal_pending(current))
> > +			return -EINTR;
> > +	}
> > +
> > +	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
> > +							  remaining_timeout);
> > +}
> > +
> >   int intel_gt_init(struct intel_gt *gt)
> >   {
> >   	int err;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> > index e7aabe0cc5bf..74e771871a9b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> > @@ -48,6 +48,8 @@ void intel_gt_driver_release(struct intel_gt *gt);
> >   void intel_gt_driver_late_release(struct intel_gt *gt);
> > +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> > +
> >   void intel_gt_check_and_clear_faults(struct intel_gt *gt);
> >   void intel_gt_clear_error_registers(struct intel_gt *gt,
> >   				    intel_engine_mask_t engine_mask);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > index 647eca9d867a..edb881d75630 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> > @@ -130,7 +130,8 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
> >   	GEM_BUG_ON(engine->retire);
> >   }
> > -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
> > +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
> > +				      long *remaining_timeout)
> >   {
> >   	struct intel_gt_timelines *timelines = &gt->timelines;
> >   	struct intel_timeline *tl, *tn;
> > @@ -195,22 +196,10 @@ out_active:	spin_lock(&timelines->lock);
> >   	if (flush_submission(gt, timeout)) /* Wait, there's more! */
> >   		active_count++;
> > -	return active_count ? timeout : 0;
> > -}
> > -
> > -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> > -{
> > -	/* If the device is asleep, we have no requests outstanding */
> > -	if (!intel_gt_pm_is_awake(gt))
> > -		return 0;
> > -
> > -	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout)) > 0) {
> > -		cond_resched();
> > -		if (signal_pending(current))
> > -			return -EINTR;
> > -	}
> > +	if (remaining_timeout)
> > +		*remaining_timeout = timeout;
> > -	return timeout;
> > +	return active_count ? timeout : 0;
> >   }
> >   static void retire_work_handler(struct work_struct *work)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > index fcc30a6e4fe9..83ff5280c06e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> You were saying the the include of stddef is needed here?
> 

Yes, HDRTEST [1] complains otherwise.

[1] https://patchwork.freedesktop.org/series/91840/#rev3

> > @@ -10,10 +10,11 @@ struct intel_engine_cs;
> >   struct intel_gt;
> >   struct intel_timeline;
> > -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout);
> > +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
> > +				      long *remaining_timeout);
> >   static inline void intel_gt_retire_requests(struct intel_gt *gt)
> >   {
> > -	intel_gt_retire_requests_timeout(gt, 0);
> > +	intel_gt_retire_requests_timeout(gt, 0, NULL);
> >   }
> >   void intel_engine_init_retire(struct intel_engine_cs *engine);
> > @@ -21,8 +22,6 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
> >   			     struct intel_timeline *tl);
> >   void intel_engine_fini_retire(struct intel_engine_cs *engine);
> > -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> > -
> >   void intel_gt_init_requests(struct intel_gt *gt);
> >   void intel_gt_park_requests(struct intel_gt *gt);
> >   void intel_gt_unpark_requests(struct intel_gt *gt);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 80b88bae5f24..3cc566565224 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -39,6 +39,8 @@ struct intel_guc {
> >   	spinlock_t irq_lock;
> >   	unsigned int msg_enabled_mask;
> > +	atomic_t outstanding_submission_g2h;
> > +
> >   	struct {
> >   		void (*reset)(struct intel_guc *guc);
> >   		void (*enable)(struct intel_guc *guc);
> > @@ -238,6 +240,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
> >   	spin_unlock_irq(&guc->irq_lock);
> >   }
> > +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
> > +
> >   int intel_guc_reset_engine(struct intel_guc *guc,
> >   			   struct intel_engine_cs *engine);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index c33906ec478d..f1cbed6b9f0a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -109,6 +109,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
> >   	INIT_LIST_HEAD(&ct->requests.incoming);
> >   	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
> >   	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
> > +	init_waitqueue_head(&ct->wq);
> >   }
> >   static inline const char *guc_ct_buffer_type_to_str(u32 type)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > index 785dfc5c6efb..4b30a562ae63 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> > @@ -10,6 +10,7 @@
> >   #include <linux/spinlock.h>
> >   #include <linux/workqueue.h>
> >   #include <linux/ktime.h>
> > +#include <linux/wait.h>
> >   #include "intel_guc_fwif.h"
> > @@ -68,6 +69,9 @@ struct intel_guc_ct {
> >   	struct tasklet_struct receive_tasklet;
> > +	/** @wq: wait queue for g2h chanenl */
> > +	wait_queue_head_t wq;
> > +
> >   	struct {
> >   		u16 last_fence; /* last fence used to send request */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index f7e34baa9506..088d11e2e497 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -254,6 +254,69 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> >   	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
> >   }
> > +static int guc_submission_send_busy_loop(struct intel_guc* guc,
> > +					 const u32 *action,
> > +					 u32 len,
> > +					 u32 g2h_len_dw,
> > +					 bool loop)
> > +{
> > +	int err;
> > +
> > +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > +
> > +	if (!err && g2h_len_dw)
> > +		atomic_inc(&guc->outstanding_submission_g2h);
> > +
> > +	return err;
> > +}
> > +
> > +static int guc_wait_for_pending_msg(struct intel_guc *guc,
> > +				    atomic_t *wait_var,
> > +				    bool interruptible,
> > +				    long timeout)
> > +{
> > +	const int state = interruptible ?
> > +		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
> > +	DEFINE_WAIT(wait);
> > +
> > +	might_sleep();
> > +	GEM_BUG_ON(timeout < 0);
> > +
> > +	if (!atomic_read(wait_var))
> > +		return 0;
> > +
> > +	if (!timeout)
> > +		return -ETIME;
> > +
> > +	for (;;) {
> > +		prepare_to_wait(&guc->ct.wq, &wait, state);
> > +
> > +		if (!atomic_read(wait_var))
> > +			break;
> > +
> > +		if (signal_pending_state(state, current)) {
> > +			timeout = -EINTR;
> > +			break;
> > +		}
> > +
> > +		if (!timeout) {
> > +			timeout = -ETIME;
> > +			break;
> > +		}
> > +
> > +		timeout = io_schedule_timeout(timeout);
> > +	}
> > +	finish_wait(&guc->ct.wq, &wait);
> > +
> > +	return (timeout < 0) ? timeout : 0;
> > +}
> > +
> > +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> > +{
> > +	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
> > +					true, timeout);
> > +}
> > +
> >   static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   {
> >   	int err;
> > @@ -280,6 +343,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
> >   	if (!enabled && !err) {
> > +		atomic_inc(&guc->outstanding_submission_g2h);
> >   		set_context_enabled(ce);
> >   	} else if (!enabled) {
> >   		clr_context_pending_enable(ce);
> > @@ -731,7 +795,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
> >   		offset,
> >   	};
> > -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > +					     0, true);
> >   }
> >   static int register_context(struct intel_context *ce)
> > @@ -751,8 +816,9 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
> >   		guc_id,
> >   	};
> > -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > -					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
> > +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > +					     G2H_LEN_DW_DEREGISTER_CONTEXT,
> > +					     true);
> >   }
> >   static int deregister_context(struct intel_context *ce, u32 guc_id)
> > @@ -893,8 +959,8 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
> >   	intel_context_get(ce);
> > -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > -				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> > +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> >   }
> >   static u16 prep_context_pending_disable(struct intel_context *ce)
> > @@ -1440,6 +1506,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> >   	return ce;
> >   }
> > +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> > +{
> > +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> > +		wake_up_all(&guc->ct.wq);
> > +}
> > +
> >   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   					  const u32 *msg,
> >   					  u32 len)
> > @@ -1475,6 +1547,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   		lrc_destroy(&ce->ref);
> >   	}
> > +	decr_outstanding_submission_g2h(guc);
> > +
> >   	return 0;
> >   }
> > @@ -1523,6 +1597,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   	}
> > +	decr_outstanding_submission_g2h(guc);
> >   	intel_context_put(ce);
> >   	return 0;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > index 9c954c589edf..c4cef885e984 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > @@ -81,6 +81,11 @@ uc_state_checkers(guc, guc_submission);
> >   #undef uc_state_checkers
> >   #undef __uc_state_checker
> > +static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long timeout)
> > +{
> > +	return intel_guc_wait_for_idle(&uc->guc, timeout);
> > +}
> > +
> >   #define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
> >   static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
> >   { \
> > diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> > index 4d2d59a9942b..2b73ddb11c66 100644
> > --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> > +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> > @@ -27,6 +27,7 @@
> >    */
> >   #include "gem/i915_gem_context.h"
> > +#include "gt/intel_gt.h"
> Still not seeing a need for this.
> 
> >   #include "gt/intel_gt_requests.h"
> >   #include "i915_drv.h"
> > diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
> > index c130010a7033..1c721542e277 100644
> > --- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
> > +++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
> > @@ -5,7 +5,7 @@
> >    */
> >   #include "i915_drv.h"
> > -#include "gt/intel_gt_requests.h"
> > +#include "gt/intel_gt.h"
> Nor this.
> 

We need these because intel_gt_wait_for_idle which moved from
"gt/intel_gt_requests.h" to "gt/intel_gt.h".

Matt

> John.
> 
> >   #include "../i915_selftest.h"
> >   #include "igt_flush_test.h"
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > index d189c4bd4bef..4f8180146888 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > @@ -52,7 +52,8 @@ void mock_device_flush(struct drm_i915_private *i915)
> >   	do {
> >   		for_each_engine(engine, gt, id)
> >   			mock_engine_flush(engine);
> > -	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT));
> > +	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT,
> > +						  NULL));
> >   }
> >   static void mock_device_release(struct drm_device *dev)
> 
