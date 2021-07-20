Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70423D02D0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3E6E4F1;
	Tue, 20 Jul 2021 20:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7CA6E4DE;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885367"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885367"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906067"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 10/42] drm/i915: Add GT PM unpark worker
Date: Tue, 20 Jul 2021 13:57:30 -0700
Message-Id: <20210720205802.39610-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes it is desirable to queue work up for later if the GT PM isn't
held and run that work on next GT PM unpark.

Implemented with a list in the GT of all pending work, workqueues in
the list, a callback to add a workqueue to the list, and finally a
wakeref post_get callback that iterates / drains the list + queues the
workqueues.

First user of this is deregistration of GuC contexts.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 +++++
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c | 35 +++++++++++++++++++
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h | 32 +++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++---
 drivers/gpu/drm/i915/intel_wakeref.c          |  5 +++
 drivers/gpu/drm/i915/intel_wakeref.h          |  1 +
 9 files changed, 99 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ceeb517ba259..172a859e43d2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -29,6 +29,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 
 	spin_lock_init(&gt->irq_lock);
 
+	spin_lock_init(&gt->pm_unpark_work_lock);
+	INIT_LIST_HEAD(&gt->pm_unpark_work_list);
+
 	INIT_LIST_HEAD(&gt->closed_vma);
 	spin_lock_init(&gt->closed_lock);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 463a6ae605a0..ebd4d22c7b19 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -93,6 +93,13 @@ static int __gt_unpark(struct intel_wakeref *wf)
 	return 0;
 }
 
+static void __gt_unpark_work_queue(struct intel_wakeref *wf)
+{
+	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
+
+	intel_gt_pm_unpark_work_queue(gt);
+}
+
 static int __gt_park(struct intel_wakeref *wf)
 {
 	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
@@ -123,6 +130,7 @@ static int __gt_park(struct intel_wakeref *wf)
 
 static const struct intel_wakeref_ops wf_ops = {
 	.get = __gt_unpark,
+	.post_get = __gt_unpark_work_queue,
 	.put = __gt_park,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
new file mode 100644
index 000000000000..23162dbd0c35
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "intel_runtime_pm.h"
+#include "intel_gt_pm.h"
+
+void intel_gt_pm_unpark_work_queue(struct intel_gt *gt)
+{
+	struct intel_gt_pm_unpark_work *work, *next;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
+	list_for_each_entry_safe(work, next,
+				 &gt->pm_unpark_work_list, link) {
+		list_del_init(&work->link);
+		queue_work(system_unbound_wq, &work->worker);
+	}
+	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
+}
+
+void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
+				 struct intel_gt_pm_unpark_work *work)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
+	if (intel_gt_pm_is_awake(gt))
+		queue_work(system_unbound_wq, &work->worker);
+	else if (list_empty(&work->link))
+		list_add_tail(&work->link, &gt->pm_unpark_work_list);
+	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
new file mode 100644
index 000000000000..08e9011be023
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef INTEL_GT_PM_UNPARK_WORK_H
+#define INTEL_GT_PM_UNPARK_WORK_H
+
+#include <linux/list.h>
+#include <linux/workqueue.h>
+
+struct intel_gt;
+
+struct intel_gt_pm_unpark_work {
+	struct list_head link;
+	struct work_struct worker;
+};
+
+void intel_gt_pm_unpark_work_queue(struct intel_gt *gt);
+
+void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
+				 struct intel_gt_pm_unpark_work *work);
+
+static inline void
+intel_gt_pm_unpark_work_init(struct intel_gt_pm_unpark_work *work,
+			     work_func_t fn)
+{
+	INIT_LIST_HEAD(&work->link);
+	INIT_WORK(&work->worker, fn);
+}
+
+#endif /* INTEL_GT_PM_UNPARK_WORK_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index d93d578a4105..b681cb1bdb5f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -91,6 +91,9 @@ struct intel_gt {
 	struct intel_wakeref wakeref;
 	atomic_t user_wakeref;
 
+	struct list_head pm_unpark_work_list;
+	spinlock_t pm_unpark_work_lock;
+
 	struct list_head closed_vma;
 	spinlock_t closed_lock; /* guards the list of closed_vma */
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 4fe7fd4ce10e..b299a6772823 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -18,6 +18,7 @@
 #include "intel_uc_fw.h"
 #include "i915_utils.h"
 #include "i915_vma.h"
+#include "gt/intel_gt_pm_unpark_work.h"
 
 struct __guc_ads_blob;
 
@@ -63,7 +64,7 @@ struct intel_guc {
 
 	spinlock_t destroy_lock;
 	struct list_head destroyed_contexts;
-	struct work_struct destroy_worker;
+	struct intel_gt_pm_unpark_work destroy_worker;
 
 	bool submission_supported;
 	bool submission_selected;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f13558adc142..2fdfcec3b5fa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1397,8 +1397,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	ida_init(&guc->guc_ids);
 
 	spin_lock_init(&guc->destroy_lock);
+
 	INIT_LIST_HEAD(&guc->destroyed_contexts);
-	INIT_WORK(&guc->destroy_worker, destroy_worker_func);
+	intel_gt_pm_unpark_work_init(&guc->destroy_worker, destroy_worker_func);
 
 	return 0;
 }
@@ -2420,13 +2421,18 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
 
 static void destroy_worker_func(struct work_struct *w)
 {
+	struct intel_gt_pm_unpark_work *destroy_worker =
+		container_of(w, struct intel_gt_pm_unpark_work, worker);
 	struct intel_guc *guc =
-		container_of(w, struct intel_guc, destroy_worker);
+		container_of(destroy_worker, struct intel_guc, destroy_worker);
 	struct intel_gt *gt = guc_to_gt(guc);
 	int tmp;
 
-	with_intel_gt_pm(gt, tmp)
+	with_intel_gt_pm_if_awake(gt, tmp)
 		deregister_destroyed_contexts(guc);
+
+	if (!list_empty(&guc->destroyed_contexts))
+		intel_gt_pm_unpark_work_add(gt, destroy_worker);
 }
 
 static void guc_context_destroy(struct kref *kref)
@@ -2489,7 +2495,7 @@ static void guc_context_destroy(struct kref *kref)
 	 * take the GT PM for the first time which isn't allowed from an atomic
 	 * context.
 	 */
-	queue_work(system_unbound_wq, &guc->destroy_worker);
+	intel_gt_pm_unpark_work_add(guc_to_gt(guc), &guc->destroy_worker);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index dfd87d082218..282fc4f312e3 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -24,6 +24,8 @@ static void rpm_put(struct intel_wakeref *wf)
 
 int __intel_wakeref_get_first(struct intel_wakeref *wf)
 {
+	bool do_post = false;
+
 	/*
 	 * Treat get/put as different subclasses, as we may need to run
 	 * the put callback from under the shrinker and do not want to
@@ -44,8 +46,11 @@ int __intel_wakeref_get_first(struct intel_wakeref *wf)
 		}
 
 		smp_mb__before_atomic(); /* release wf->count */
+		do_post = true;
 	}
 	atomic_inc(&wf->count);
+	if (do_post && wf->ops->post_get)
+		wf->ops->post_get(wf);
 	mutex_unlock(&wf->mutex);
 
 	INTEL_WAKEREF_BUG_ON(atomic_read(&wf->count) <= 0);
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index 545c8f277c46..ef7e6a698e8a 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -30,6 +30,7 @@ typedef depot_stack_handle_t intel_wakeref_t;
 
 struct intel_wakeref_ops {
 	int (*get)(struct intel_wakeref *wf);
+	void (*post_get)(struct intel_wakeref *wf);
 	int (*put)(struct intel_wakeref *wf);
 };
 
-- 
2.28.0

