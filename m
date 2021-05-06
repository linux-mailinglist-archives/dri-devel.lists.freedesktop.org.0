Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E786375B3B
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBE26EDAC;
	Thu,  6 May 2021 18:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407766EDAA;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: KyehVxz5TTl5kklX+Jag/4IRA8auT/w99I5TFoaa8mJDIrMh3UiSeejIH9prf9EBmyCFszdNVS
 UD6s6Ydcv2vA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531039"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531039"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 96ves7/d9AZEqq17++NY59vw5Xanm+NwG1nxESA+4RXVd/bFSxBFNj3P4ZoTuKsfQ4ug0ZACE5
 1dVhJjuL235w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583664"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 92/97] drm/i915: Add GT PM delayed worker
Date: Thu,  6 May 2021 12:14:46 -0700
Message-Id: <20210506191451.77768-93-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes it is desirable to queue work up for later if the GT PM isn't
held and run that work on next GT PM unpark.

Implemented with a list in the GT of all pending work, workqueues in
the list, a callback to add a workqueue to the list, and finally a
wakeref post_get callback that iterates / drains the list + queues the
workqueues.

First user of this is deregistration of GuC contexts.

Signed-off-by: Matthew Brost <matthew.brost@intel.com
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 +++++
 .../drm/i915/gt/intel_gt_pm_delayed_work.c    | 35 +++++++++++++++++++
 .../drm/i915/gt/intel_gt_pm_delayed_work.h    | 24 +++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++---
 drivers/gpu/drm/i915/intel_wakeref.c          |  5 +++
 drivers/gpu/drm/i915/intel_wakeref.h          |  1 +
 10 files changed, 92 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d0d936d9137b..c80ec163a7d1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -102,6 +102,7 @@ gt-y += \
 	gt/intel_gt_clock_utils.o \
 	gt/intel_gt_irq.o \
 	gt/intel_gt_pm.o \
+	gt/intel_gt_pm_delayed_work.o \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
 	gt/intel_gtt.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 0e4a5c4c883f..b3ea788de9e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -28,6 +28,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 
 	spin_lock_init(&gt->irq_lock);
 
+	spin_lock_init(&gt->pm_delayed_work_lock);
+	INIT_LIST_HEAD(&gt->pm_delayed_work_list);
+
 	INIT_LIST_HEAD(&gt->closed_vma);
 	spin_lock_init(&gt->closed_lock);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 463a6ae605a0..9f5485be156e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -93,6 +93,13 @@ static int __gt_unpark(struct intel_wakeref *wf)
 	return 0;
 }
 
+static void __gt_queue_delayed_work(struct intel_wakeref *wf)
+{
+	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
+
+	intel_gt_pm_queue_delayed_work(gt);
+}
+
 static int __gt_park(struct intel_wakeref *wf)
 {
 	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
@@ -123,6 +130,7 @@ static int __gt_park(struct intel_wakeref *wf)
 
 static const struct intel_wakeref_ops wf_ops = {
 	.get = __gt_unpark,
+	.post_get = __gt_queue_delayed_work,
 	.put = __gt_park,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.c
new file mode 100644
index 000000000000..fc97a37b9ca1
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "intel_runtime_pm.h"
+#include "intel_gt_pm.h"
+
+void intel_gt_pm_queue_delayed_work(struct intel_gt *gt)
+{
+	struct intel_gt_pm_delayed_work *work, *next;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gt->pm_delayed_work_lock, flags);
+	list_for_each_entry_safe(work, next,
+				 &gt->pm_delayed_work_list, link) {
+		list_del_init(&work->link);
+		queue_work(system_unbound_wq, &work->worker);
+	}
+	spin_unlock_irqrestore(&gt->pm_delayed_work_lock, flags);
+}
+
+void intel_gt_pm_add_delayed_work(struct intel_gt *gt,
+				  struct intel_gt_pm_delayed_work *work)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&gt->pm_delayed_work_lock, flags);
+	if (intel_gt_pm_is_awake(gt))
+		queue_work(system_unbound_wq, &work->worker);
+	else if (list_empty(&work->link))
+		list_add_tail(&work->link, &gt->pm_delayed_work_list);
+	spin_unlock_irqrestore(&gt->pm_delayed_work_lock, flags);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.h
new file mode 100644
index 000000000000..7e91a9432f7f
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef INTEL_GT_PM_DELAYED_WORK_H
+#define INTEL_GT_PM_DELAYED_WORK_H
+
+#include <linux/list.h>
+#include <linux/workqueue.h>
+
+struct intel_gt;
+
+struct intel_gt_pm_delayed_work {
+	struct list_head link;
+	struct work_struct worker;
+};
+
+void intel_gt_pm_queue_delayed_work(struct intel_gt *gt);
+
+void intel_gt_pm_add_delayed_work(struct intel_gt *gt,
+				  struct intel_gt_pm_delayed_work *work);
+
+#endif /* INTEL_GT_PM_DELAYED_WORK_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index fecfacf551d5..60ed7af94dba 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -68,6 +68,9 @@ struct intel_gt {
 	struct intel_wakeref wakeref;
 	atomic_t user_wakeref;
 
+	struct list_head pm_delayed_work_list;
+	spinlock_t pm_delayed_work_lock;
+
 	struct list_head closed_vma;
 	spinlock_t closed_lock; /* guards the list of closed_vma */
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index f6c40f6fb7ac..10dcfd790aa2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -17,6 +17,7 @@
 #include "intel_uc_fw.h"
 #include "i915_utils.h"
 #include "i915_vma.h"
+#include "gt/intel_gt_pm_delayed_work.h"
 
 struct __guc_ads_blob;
 
@@ -63,7 +64,7 @@ struct intel_guc {
 
 	spinlock_t destroy_lock;
 	struct list_head destroyed_contexts;
-	struct work_struct destroy_worker;
+	struct intel_gt_pm_delayed_work destroy_worker;
 
 	bool submission_selected;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 6fd5414296cd..25c77084c3a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1395,7 +1395,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 
 	spin_lock_init(&guc->destroy_lock);
 	INIT_LIST_HEAD(&guc->destroyed_contexts);
-	INIT_WORK(&guc->destroy_worker, destroy_worker_func);
+	INIT_LIST_HEAD(&guc->destroy_worker.link);
+	INIT_WORK(&guc->destroy_worker.worker, destroy_worker_func);
 
 	return 0;
 }
@@ -2374,13 +2375,18 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
 
 static void destroy_worker_func(struct work_struct *w)
 {
+	struct intel_gt_pm_delayed_work *destroy_worker =
+		container_of(w, struct intel_gt_pm_delayed_work, worker);
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
+		intel_gt_pm_add_delayed_work(gt, destroy_worker);
 }
 
 static void guc_context_destroy(struct kref *kref)
@@ -2441,7 +2447,7 @@ static void guc_context_destroy(struct kref *kref)
 	 * take the GT PM for the first time which isn't allowed from an atomic
 	 * context.
 	 */
-	queue_work(system_unbound_wq, &guc->destroy_worker);
+	intel_gt_pm_add_delayed_work(guc_to_gt(guc), &guc->destroy_worker);
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

