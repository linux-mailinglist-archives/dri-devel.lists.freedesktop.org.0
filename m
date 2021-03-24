Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A1347800
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994776EB36;
	Wed, 24 Mar 2021 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AF46EB33;
 Wed, 24 Mar 2021 12:13:53 +0000 (UTC)
IronPort-SDR: eNcx2W5MyhyfYRcy/r+Sh8ak1G7nM6YEbpXnYcpi+11WaXGvk1kMkADYVBTJ/A7wbbN2Pktnwb
 cVc0dkvOigRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386182"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:52 -0700
IronPort-SDR: memHYnBhUD/cMsW4XLOsIhRJYC2wBz0tqitOdw4zynFclYcawVqZYgXuIX+NDkdnJFEO1h7sS8
 fhfvVSnvI85A==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277156"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:51 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915: Request watchdog infrastructure
Date: Wed, 24 Mar 2021 12:13:33 +0000
Message-Id: <20210324121335.2307063-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prepares the plumbing for setting request/fence expiration time. All code
is put in place but is never activated due yet missing ability to actually
configure the timer.

Outline of the basic operation:

A timer is started when request is ready for execution. If the request
completes (retires) before the timer fires, timer is cancelled and nothing
further happens.

If the timer fires request is added to a lockless list and worker queued.
Purpose of this is twofold: a) It allows request cancellation from a more
friendly context and b) coalesces multiple expirations into a single event
of consuming the list.

Worker locklessly consumes the list of expired requests and cancels them
all using previous added i915_request_cancel().

Associated timeout value is stored in rq->context.watchdog.timeout_us.

v2:
 * Log expiration.

v3:
 * Include more information about user timeline in the log message.

v4:
 * Remove obsolete comment and fix formatting. (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |  4 ++
 .../drm/i915/gt/intel_execlists_submission.h  |  2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++
 drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 28 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 +++
 drivers/gpu/drm/i915/i915_request.c           | 52 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  8 +++
 8 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 0ea18c9e2aca..65a5730a4f5b 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -99,6 +99,10 @@ struct intel_context {
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
 
+	struct {
+		u64 timeout_us;
+	} watchdog;
+
 	u32 *lrc_reg_state;
 	union {
 		struct {
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index f7bd3fccfee8..4ca9b475e252 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -6,6 +6,7 @@
 #ifndef __INTEL_EXECLISTS_SUBMISSION_H__
 #define __INTEL_EXECLISTS_SUBMISSION_H__
 
+#include <linux/llist.h>
 #include <linux/types.h>
 
 struct drm_printer;
@@ -13,6 +14,7 @@ struct drm_printer;
 struct i915_request;
 struct intel_context;
 struct intel_engine_cs;
+struct intel_gt;
 
 enum {
 	INTEL_CONTEXT_SCHEDULE_IN = 0,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ca76f93bc03d..8d77dcbad059 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -31,6 +31,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 	INIT_LIST_HEAD(&gt->closed_vma);
 	spin_lock_init(&gt->closed_lock);
 
+	init_llist_head(&gt->watchdog.list);
+	INIT_WORK(&gt->watchdog.work, intel_gt_watchdog_work);
+
 	intel_gt_init_buffer_pool(gt);
 	intel_gt_init_reset(gt);
 	intel_gt_init_requests(gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index a17bd8b3195f..7ec395cace69 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -78,4 +78,6 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
 
+void intel_gt_watchdog_work(struct work_struct *work);
+
 #endif /* __INTEL_GT_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index 36ec97f79174..fbfd19b2e5f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -8,6 +8,7 @@
 #include "i915_drv.h" /* for_each_engine() */
 #include "i915_request.h"
 #include "intel_engine_heartbeat.h"
+#include "intel_execlists_submission.h"
 #include "intel_gt.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
@@ -242,4 +243,31 @@ void intel_gt_fini_requests(struct intel_gt *gt)
 {
 	/* Wait until the work is marked as finished before unloading! */
 	cancel_delayed_work_sync(&gt->requests.retire_work);
+
+	flush_work(&gt->watchdog.work);
+}
+
+void intel_gt_watchdog_work(struct work_struct *work)
+{
+	struct intel_gt *gt =
+		container_of(work, typeof(*gt), watchdog.work);
+	struct i915_request *rq, *rn;
+	struct llist_node *first;
+
+	first = llist_del_all(&gt->watchdog.list);
+	if (!first)
+		return;
+
+	llist_for_each_entry_safe(rq, rn, first, watchdog.link) {
+		if (!i915_request_completed(rq)) {
+			struct dma_fence *f = &rq->fence;
+
+			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
+				  f->ops->get_driver_name(f),
+				  f->ops->get_timeline_name(f),
+				  f->seqno);
+			i915_request_cancel(rq, -EINTR);
+		}
+		i915_request_put(rq);
+	}
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 626af37c7790..d70ebcc6f19f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -8,10 +8,12 @@
 
 #include <linux/ktime.h>
 #include <linux/list.h>
+#include <linux/llist.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include "uc/intel_uc.h"
 
@@ -62,6 +64,11 @@ struct intel_gt {
 		struct delayed_work retire_work;
 	} requests;
 
+	struct {
+		struct llist_head list;
+		struct work_struct work;
+	} watchdog;
+
 	struct intel_wakeref wakeref;
 	atomic_t user_wakeref;
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index d1a4a3fa7425..d58052f3410c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -321,6 +321,53 @@ static void remove_from_engine(struct i915_request *rq)
 	__notify_execute_cb_imm(rq);
 }
 
+static void __rq_init_watchdog(struct i915_request *rq)
+{
+	rq->watchdog.timer.function = NULL;
+}
+
+static enum hrtimer_restart __rq_watchdog_expired(struct hrtimer *hrtimer)
+{
+	struct i915_request *rq =
+		container_of(hrtimer, struct i915_request, watchdog.timer);
+	struct intel_gt *gt = rq->engine->gt;
+
+	if (!i915_request_completed(rq)) {
+		if (llist_add(&rq->watchdog.link, &gt->watchdog.list))
+			schedule_work(&gt->watchdog.work);
+	} else {
+		i915_request_put(rq);
+	}
+
+	return HRTIMER_NORESTART;
+}
+
+static void __rq_arm_watchdog(struct i915_request *rq)
+{
+	struct i915_request_watchdog *wdg = &rq->watchdog;
+	struct intel_context *ce = rq->context;
+
+	if (!ce->watchdog.timeout_us)
+		return;
+
+	hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	wdg->timer.function = __rq_watchdog_expired;
+	hrtimer_start_range_ns(&wdg->timer,
+			       ns_to_ktime(ce->watchdog.timeout_us *
+					   NSEC_PER_USEC),
+			       NSEC_PER_MSEC,
+			       HRTIMER_MODE_REL);
+	i915_request_get(rq);
+}
+
+static void __rq_cancel_watchdog(struct i915_request *rq)
+{
+	struct i915_request_watchdog *wdg = &rq->watchdog;
+
+	if (wdg->timer.function && hrtimer_try_to_cancel(&wdg->timer) > 0)
+		i915_request_put(rq);
+}
+
 bool i915_request_retire(struct i915_request *rq)
 {
 	if (!__i915_request_is_complete(rq))
@@ -332,6 +379,8 @@ bool i915_request_retire(struct i915_request *rq)
 	trace_i915_request_retire(rq);
 	i915_request_mark_complete(rq);
 
+	__rq_cancel_watchdog(rq);
+
 	/*
 	 * We know the GPU must have read the request to have
 	 * sent us the seqno + interrupt, so use the position
@@ -692,6 +741,8 @@ submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 
 		if (unlikely(fence->error))
 			i915_request_set_error_once(request, fence->error);
+		else
+			__rq_arm_watchdog(request);
 
 		/*
 		 * We need to serialize use of the submit_request() callback
@@ -879,6 +930,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 
 	/* No zalloc, everything must be cleared after use */
 	rq->batch = NULL;
+	__rq_init_watchdog(rq);
 	GEM_BUG_ON(rq->capture_list);
 	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
 
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 2dea55ea69e1..5e0946992f1a 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -26,7 +26,9 @@
 #define I915_REQUEST_H
 
 #include <linux/dma-fence.h>
+#include <linux/hrtimer.h>
 #include <linux/irq_work.h>
+#include <linux/llist.h>
 #include <linux/lockdep.h>
 
 #include "gem/i915_gem_context_types.h"
@@ -289,6 +291,12 @@ struct i915_request {
 	/** timeline->request entry for this request */
 	struct list_head link;
 
+	/** Watchdog support fields. */
+	struct i915_request_watchdog {
+		struct llist_node link;
+		struct hrtimer timer;
+	} watchdog;
+
 	I915_SELFTEST_DECLARE(struct {
 		struct list_head link;
 		unsigned long delay;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
