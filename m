Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BAB4253A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF14810E919;
	Wed,  3 Sep 2025 15:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RG2SMF6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747810E908;
 Wed,  3 Sep 2025 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yc/U+Eu7vjDBmIo8QKMHvN4HEOJQC1EzgF08w3Fp2iI=; b=RG2SMF6gJMnDxwIf/H7SG53c1v
 BXbPsvvINDbCE7ZganMMV0Q/3IuXRzSwqHwH8x9MKfDqRR9Z/p06LcS41w9Cvqztx2IuRwHdiBCPp
 9TOG2xFS0V62PvCKw/ShNWvHFrbn58FG6D97P9Y0aMk2lwJMNGnih42FJppC3qtdDLDR6HFSFyIW/
 xnGEPR3mi1RE5cZbOpIP43fimWaFd9Ai29GZpZHqChBp3oICrfPEFbLkhoptQXdouHhBPp60SfQIP
 DIKHEpmvnskbmZaqGFdWIuHu3i+26klZ8G+s0qAXQRQFltKQHx1auQA26eH/zHjFW7ih8jKDukR/E
 ArmpkV6w==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKs-006Gc4-Fg; Wed, 03 Sep 2025 17:23:46 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 21/21] drm/xe: Register with the DRM scheduling cgroup controller
Date: Wed,  3 Sep 2025 16:23:27 +0100
Message-ID: <20250903152327.66002-22-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wire up the scheduling weight notification into the driver.

DRM cgroup controller will notify the driver of scheduling weights for
each DRM client, which the driver will map into the three GuC scheduling
priorities by giving the lowest weight client the low priority, and
respectively the highest one high. The other clients will not be changed
as will not be the ones which have individually specified a priority other
than normal.

The priority changes are done from a delayed worker to coalesce
potentially numerous updates and also to allow taking the mutexes from a
callback which runs with preemption disabled.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 18 +++++++
 drivers/gpu/drm/xe/xe_device_types.h | 15 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 80 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  5 ++
 drivers/gpu/drm/xe/xe_guc_submit.c   |  8 ++-
 drivers/gpu/drm/xe/xe_pm.c           |  4 ++
 6 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e2952c9c06a..9fef10c50868 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -112,6 +112,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 		put_task_struct(task);
 	}
 
+#ifdef CONFIG_CGROUP_DRM
+	xef->cg.prio = XE_EXEC_QUEUE_PRIORITY_NORMAL; // TODO: inherit current cgroup priority
+#endif
+
 	return 0;
 }
 
@@ -368,6 +372,12 @@ static const struct file_operations xe_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
+#ifdef CONFIG_CGROUP_DRM
+static const struct drm_cgroup_ops xe_drm_cgroup_ops = {
+	.notify_weight = xe_drm_cgroup_notify_weight,
+};
+#endif
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -386,6 +396,10 @@ static struct drm_driver driver = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
+
+#ifdef CONFIG_CGROUP_DRM
+	.cg_ops = &xe_drm_cgroup_ops,
+#endif
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
 	.fops = &xe_driver_fops,
@@ -500,6 +514,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+#ifdef CONFIG_CGROUP_DRM
+	INIT_DELAYED_WORK(&xe->cg.work, xe_drm_cgroup_work);
+#endif
+
 	return xe;
 
 err:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 092004d14db2..dbc65a4aa08d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -19,6 +19,7 @@
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
+#include "xe_exec_queue_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_pf_types.h"
 #include "xe_sriov_types.h"
@@ -34,6 +35,7 @@
 struct dram_info;
 struct intel_display;
 struct intel_dg_nvm_dev;
+struct xe_file;
 struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
@@ -624,6 +626,12 @@ struct xe_device {
 		unsigned int czclk_freq;
 	};
 #endif
+
+#ifdef CONFIG_CGROUP_DRM
+	struct {
+		struct delayed_work	work;
+	} cg;
+#endif
 };
 
 /**
@@ -685,6 +693,13 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#ifdef CONFIG_CGROUP_DRM
+	struct {
+		atomic_t weight;
+		enum xe_exec_queue_priority prio;
+	} cg;
+#endif
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..2f072d2a0117 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1139,3 +1139,83 @@ void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
 	}
 	spin_unlock(&sched->base.job_list_lock);
 }
+
+#ifdef CONFIG_CGROUP_DRM
+void xe_drm_cgroup_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, typeof(*xe), cg.work.work);
+	unsigned int weight, min = UINT_MAX, max = 0;
+	struct drm_device *dev = &xe->drm;
+	struct drm_file *file;
+	struct xe_file *xef;
+
+	mutex_lock(&dev->filelist_mutex);
+
+	list_for_each_entry(file, &dev->filelist, lhead) {
+		xef = to_xe_file(file);
+		weight = atomic_read(&xef->cg.weight);
+
+		if (!weight)
+			continue;
+
+		if (weight < min)
+			min = weight;
+
+		if (weight > max)
+			max = weight;
+	}
+
+	list_for_each_entry(file, &dev->filelist, lhead) {
+		enum xe_exec_queue_priority new_prio;
+		struct xe_exec_queue *q;
+		unsigned long i;
+
+		xef = to_xe_file(file);
+		weight = atomic_read(&xef->cg.weight);
+
+		if (max == min)
+			new_prio = XE_EXEC_QUEUE_PRIORITY_NORMAL;
+		else if (weight == max)
+			new_prio = XE_EXEC_QUEUE_PRIORITY_HIGH;
+		else if (weight == min)
+			new_prio = XE_EXEC_QUEUE_PRIORITY_LOW;
+		else
+			new_prio = XE_EXEC_QUEUE_PRIORITY_NORMAL;
+
+		if (new_prio == xef->cg.prio)
+			continue;
+
+		mutex_lock(&xef->exec_queue.lock);
+		xa_for_each(&xef->exec_queue.xa, i, q) {
+			if (q->sched_props.priority !=
+			    XE_EXEC_QUEUE_PRIORITY_NORMAL)
+				continue;
+
+			xe_exec_queue_get(q);
+			mutex_unlock(&xef->exec_queue.lock);
+
+			q->ops->set_priority(q, new_prio);
+
+			mutex_lock(&xef->exec_queue.lock);
+			xe_exec_queue_put(q);
+		}
+		mutex_unlock(&xef->exec_queue.lock);
+
+		xef->cg.prio = new_prio;
+	}
+
+	mutex_unlock(&dev->filelist_mutex);
+}
+
+void xe_drm_cgroup_notify_weight(struct drm_file *file_priv,
+				 unsigned int weight)
+{
+	struct xe_file *xef = to_xe_file(file_priv);
+	struct xe_device *xe = xef->xe;
+
+	atomic_set(&xef->cg.weight, weight);
+
+	queue_delayed_work(system_unbound_wq, &xe->cg.work,
+			   msecs_to_jiffies(100));
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 15ec852e7f7e..5f6b42c74086 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -95,4 +95,9 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
+
+void xe_drm_cgroup_notify_weight(struct drm_file *file_priv,
+				 unsigned int weight);
+void xe_drm_cgroup_work(struct work_struct *work);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 86daf6f4728f..df1252f4cd62 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -427,13 +427,19 @@ static const int xe_exec_queue_prio_to_guc[] = {
 static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
-	enum xe_exec_queue_priority prio = q->sched_props.priority;
+	enum xe_exec_queue_priority prio;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 slpc_exec_queue_freq_req = 0;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
+	prio = q->sched_props.priority;
+#ifdef CONFIG_CGROUP_DRM
+	if (prio == XE_EXEC_QUEUE_PRIORITY_NORMAL && q->xef)
+		prio = q->xef->cg.prio;
+#endif
+
 	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
 		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2e85030b7f4..67291f19213b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -124,6 +124,10 @@ int xe_pm_suspend(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Suspending device\n");
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+#ifdef CONFIG_CGROUP_DRM
+	cancel_delayed_work_sync(&xe->cg.work);
+#endif
+
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
-- 
2.48.0

