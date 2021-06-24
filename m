Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9103B27B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1486EA04;
	Thu, 24 Jun 2021 06:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5456EA00;
 Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
IronPort-SDR: o9XVIL+MBkEgFcjWbJvxsP584QfIE2kUaHcgq4EGU6U4RVB1mTnOHLbzJPhSfU14nzLURRRwjv
 IYB0TqMdGCSg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346761"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346761"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: IS4gVbig+coBIrTvDfAmOIc4L0ymxAZixdgqYgAe9IVgrmYPQrbKbO36jI8tQEGv7GRodgPLrD
 iN6I6VB/592g==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390929"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/47] drm/i915/guc: Update intel_gt_wait_for_idle to work
 with GuC
Date: Thu, 24 Jun 2021 00:04:51 -0700
Message-Id: <20210624070516.21893-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When running the GuC the GPU can't be considered idle if the GuC still
has contexts pinned. As such, a call has been added in
intel_gt_wait_for_idle to idle the UC and in turn the GuC by waiting for
the number of unpinned contexts to go to zero.

v2: rtimeout -> remaining_timeout

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 19 ++++
 drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 22 ++---
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 88 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  5 ++
 drivers/gpu/drm/i915/i915_debugfs.c           |  1 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |  1 +
 .../gpu/drm/i915/selftests/igt_live_test.c    |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 +-
 14 files changed, 137 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2fd155742bd2..335b955d5b4b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -644,7 +644,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 		goto insert;
 
 	/* Attempt to reap some mmap space from dead objects */
-	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT);
+	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
+					       NULL);
 	if (err)
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e714e21c0a4d..acfdd53b2678 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -585,6 +585,25 @@ static void __intel_gt_disable(struct intel_gt *gt)
 	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
 }
 
+int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
+{
+	long remaining_timeout;
+
+	/* If the device is asleep, we have no requests outstanding */
+	if (!intel_gt_pm_is_awake(gt))
+		return 0;
+
+	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
+							   &remaining_timeout)) > 0) {
+		cond_resched();
+		if (signal_pending(current))
+			return -EINTR;
+	}
+
+	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
+							  remaining_timeout);
+}
+
 int intel_gt_init(struct intel_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index e7aabe0cc5bf..74e771871a9b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -48,6 +48,8 @@ void intel_gt_driver_release(struct intel_gt *gt);
 
 void intel_gt_driver_late_release(struct intel_gt *gt);
 
+int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
+
 void intel_gt_check_and_clear_faults(struct intel_gt *gt);
 void intel_gt_clear_error_registers(struct intel_gt *gt,
 				    intel_engine_mask_t engine_mask);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index 647eca9d867a..39f5e824dac5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -13,6 +13,7 @@
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
 #include "intel_timeline.h"
+#include "uc/intel_uc.h"
 
 static bool retire_requests(struct intel_timeline *tl)
 {
@@ -130,7 +131,8 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
 	GEM_BUG_ON(engine->retire);
 }
 
-long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
+long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
+				      long *remaining_timeout)
 {
 	struct intel_gt_timelines *timelines = &gt->timelines;
 	struct intel_timeline *tl, *tn;
@@ -195,22 +197,10 @@ out_active:	spin_lock(&timelines->lock);
 	if (flush_submission(gt, timeout)) /* Wait, there's more! */
 		active_count++;
 
-	return active_count ? timeout : 0;
-}
-
-int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
-{
-	/* If the device is asleep, we have no requests outstanding */
-	if (!intel_gt_pm_is_awake(gt))
-		return 0;
-
-	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout)) > 0) {
-		cond_resched();
-		if (signal_pending(current))
-			return -EINTR;
-	}
+	if (remaining_timeout)
+		*remaining_timeout = timeout;
 
-	return timeout;
+	return active_count ? timeout : 0;
 }
 
 static void retire_work_handler(struct work_struct *work)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
index fcc30a6e4fe9..51dbe0e3294e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
@@ -6,14 +6,17 @@
 #ifndef INTEL_GT_REQUESTS_H
 #define INTEL_GT_REQUESTS_H
 
+#include <stddef.h>
+
 struct intel_engine_cs;
 struct intel_gt;
 struct intel_timeline;
 
-long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout);
+long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
+				      long *remaining_timeout);
 static inline void intel_gt_retire_requests(struct intel_gt *gt)
 {
-	intel_gt_retire_requests_timeout(gt, 0);
+	intel_gt_retire_requests_timeout(gt, 0, NULL);
 }
 
 void intel_engine_init_retire(struct intel_engine_cs *engine);
@@ -21,8 +24,6 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
 			     struct intel_timeline *tl);
 void intel_engine_fini_retire(struct intel_engine_cs *engine);
 
-int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
-
 void intel_gt_init_requests(struct intel_gt *gt);
 void intel_gt_park_requests(struct intel_gt *gt);
 void intel_gt_unpark_requests(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 24e7a924134e..22eb1e9cca41 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -38,6 +38,8 @@ struct intel_guc {
 	spinlock_t irq_lock;
 	unsigned int msg_enabled_mask;
 
+	atomic_t outstanding_submission_g2h;
+
 	struct {
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
@@ -238,6 +240,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
 	spin_unlock_irq(&guc->irq_lock);
 }
 
+int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
+
 int intel_guc_reset_engine(struct intel_guc *guc,
 			   struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a60970e85635..e0f92e28350c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -109,6 +109,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	INIT_LIST_HEAD(&ct->requests.incoming);
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
 	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
+	init_waitqueue_head(&ct->wq);
 }
 
 static inline const char *guc_ct_buffer_type_to_str(u32 type)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 660bf37238e2..ab1b79ab960b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/ktime.h>
+#include <linux/wait.h>
 
 #include "intel_guc_fwif.h"
 
@@ -68,6 +69,9 @@ struct intel_guc_ct {
 
 	struct tasklet_struct receive_tasklet;
 
+	/** @wq: wait queue for g2h chanenl */
+	wait_queue_head_t wq;
+
 	struct {
 		u16 last_fence; /* last fence used to send request */
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ef24758c4266..d1a28283a9ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -254,6 +254,74 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
 }
 
+static int guc_submission_busy_loop(struct intel_guc* guc,
+				    const u32 *action,
+				    u32 len,
+				    u32 g2h_len_dw,
+				    bool loop)
+{
+	int err;
+
+	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+
+	if (!err && g2h_len_dw)
+		atomic_inc(&guc->outstanding_submission_g2h);
+
+	return err;
+}
+
+static int guc_wait_for_pending_msg(struct intel_guc *guc,
+				    atomic_t *wait_var,
+				    bool interruptible,
+				    long timeout)
+{
+	const int state = interruptible ?
+		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
+	DEFINE_WAIT(wait);
+
+	might_sleep();
+	GEM_BUG_ON(timeout < 0);
+
+	if (!atomic_read(wait_var))
+		return 0;
+
+	if (!timeout)
+		return -ETIME;
+
+	for (;;) {
+		prepare_to_wait(&guc->ct.wq, &wait, state);
+
+		if (!atomic_read(wait_var))
+			break;
+
+		if (signal_pending_state(state, current)) {
+			timeout = -ERESTARTSYS;
+			break;
+		}
+
+		if (!timeout) {
+			timeout = -ETIME;
+			break;
+		}
+
+		timeout = io_schedule_timeout(timeout);
+	}
+	finish_wait(&guc->ct.wq, &wait);
+
+	return (timeout < 0) ? timeout : 0;
+}
+
+int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
+{
+	bool interruptible = true;
+
+	if (unlikely(timeout < 0))
+		timeout = -timeout, interruptible = false;
+
+	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
+					interruptible, timeout);
+}
+
 static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
 	int err;
@@ -280,6 +348,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
 	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
 	if (!enabled && !err) {
+		atomic_inc(&guc->outstanding_submission_g2h);
 		set_context_enabled(ce);
 	} else if (!enabled) {
 		clr_context_pending_enable(ce);
@@ -731,7 +800,7 @@ static int __guc_action_register_context(struct intel_guc *guc,
 		offset,
 	};
 
-	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
 }
 
 static int register_context(struct intel_context *ce)
@@ -751,7 +820,7 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
 		guc_id,
 	};
 
-	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
+	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
 					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
 }
 
@@ -868,7 +937,9 @@ static int guc_context_pin(struct intel_context *ce, void *vaddr)
 
 static void guc_context_unpin(struct intel_context *ce)
 {
-	unpin_guc_id(ce_to_guc(ce), ce);
+	struct intel_guc *guc = ce_to_guc(ce);
+
+	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
 }
 
@@ -891,7 +962,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 
 	intel_context_get(ce);
 
-	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
+	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
 				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
 }
 
@@ -1433,6 +1504,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 	return ce;
 }
 
+static void decr_outstanding_submission_g2h(struct intel_guc *guc)
+{
+	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
+		wake_up_all(&guc->ct.wq);
+}
+
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg,
 					  u32 len)
@@ -1468,6 +1545,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		lrc_destroy(&ce->ref);
 	}
 
+	decr_outstanding_submission_g2h(guc);
+
 	return 0;
 }
 
@@ -1516,6 +1595,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	}
 
+	decr_outstanding_submission_g2h(guc);
 	intel_context_put(ce);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 9c954c589edf..c4cef885e984 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -81,6 +81,11 @@ uc_state_checkers(guc, guc_submission);
 #undef uc_state_checkers
 #undef __uc_state_checker
 
+static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long timeout)
+{
+	return intel_guc_wait_for_idle(&uc->guc, timeout);
+}
+
 #define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
 static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
 { \
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index cc745751ac53..277800987bf8 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -36,6 +36,7 @@
 #include "gt/intel_gt_clock_utils.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 #include "gt/intel_reset.h"
 #include "gt/intel_rc6.h"
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 4d2d59a9942b..2b73ddb11c66 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -27,6 +27,7 @@
  */
 
 #include "gem/i915_gem_context.h"
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
index c130010a7033..1c721542e277 100644
--- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
@@ -5,7 +5,7 @@
  */
 
 #include "i915_drv.h"
-#include "gt/intel_gt_requests.h"
+#include "gt/intel_gt.h"
 
 #include "../i915_selftest.h"
 #include "igt_flush_test.h"
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index d189c4bd4bef..4f8180146888 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -52,7 +52,8 @@ void mock_device_flush(struct drm_i915_private *i915)
 	do {
 		for_each_engine(engine, gt, id)
 			mock_engine_flush(engine);
-	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT));
+	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT,
+						  NULL));
 }
 
 static void mock_device_release(struct drm_device *dev)
-- 
2.28.0

