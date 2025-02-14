Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB224A36703
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4498110ED3E;
	Fri, 14 Feb 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7eBZ+8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92B10E033;
 Fri, 14 Feb 2025 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739565480; x=1771101480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaZbYFPEVJ5Ap2Np5lSbLA64yEB8lQfrldsffJdO/mA=;
 b=C7eBZ+8BBKEg+0z/a/7xrTG8TCrO5YRwUPuLLLGi8RlRD8JbMRRWlAPM
 ZR97nSCRm/qXYsypVG+RrFOsnggo3V3u/dUOjxeTh2I0Cbc7D+8Ee/mkW
 iVxh7N3MZTrT3ZgxPxR9iOls+bWgBFLFM+sylfYObTDjW/+yYewWYbuPr
 OEc94h4twrpybdEVz9rxjBORYGHI6Ii8+d6TnKcJ+h3FVWRwYupIbi04b
 A8vhW5C7Z/9W08rRRm/UozPPjRecady1q3m5MNiILlEYQNMaWKXWwKJud
 s8Hwv6NSEwWq5Ovrcn8sxdlx0LvIGQN1WuolINWvHCH/2xbXA+G/SMsyn Q==;
X-CSE-ConnectionGUID: ACnbCU2fRCOUdAOCXefNmQ==
X-CSE-MsgGUID: GguplN25RxCqCTsa3ZTeJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39558867"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39558867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:38:00 -0800
X-CSE-ConnectionGUID: ZSVONbSSQpuWxBs3D+Uwag==
X-CSE-MsgGUID: Gy7g6RdzQOSOOlCluR22rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118760822"
Received: from dut4066lnl.fm.intel.com ([10.105.8.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client pagefault
 info
Date: Fri, 14 Feb 2025 20:37:56 +0000
Message-ID: <20250214203757.27895-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Add additional information to drm client so it can report the last 50
exec queues to have been banned on it, as well as the last pagefault
seen when said exec queues were banned.  Since we cannot reasonably
associate a pagefault to a specific exec queue, we currently report the
last seen pagefault on the associated hw engine instead.

The last pagefault seen per exec queue is saved to the hw engine, and the
pagefault is updated during the pagefault handling process in
xe_gt_pagefault.  The last seen pagefault is reset when the engine is
reset because any future exec queue bans likely were not caused by said
pagefault after the reset.

v2: Remove exec queue from blame list on destroy and recreate (Joonas)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c      | 128 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h      |  36 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c      |   7 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c    |  19 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c      |  17 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c       |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   8 ++
 7 files changed, 219 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..f15560d0b6ff 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -17,6 +17,7 @@
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_pagefault.h"
 #include "xe_hw_engine.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
@@ -70,6 +71,21 @@
  * 	drm-total-cycles-ccs:   7655183225
  * 	drm-engine-capacity-ccs:        4
  *
+ * 	- Exec queue ban list -
+ *
+ * 		Exec queue 1 banned:
+ * 			Associated pagefault:
+ * 			ASID: 9
+ * 			VFID: 0
+ * 			PDATA: 0x0450
+ * 			Faulted Address: 0x000001fff86a9000
+ * 			FaultType: NOT_PRESENT
+ * 			AccessType: ACCESS_TYPE_WRITE
+ * 			FaultLevel: 0
+ * 			EngineClass: 1 vcs
+ * 			EngineInstance: 0
+ *		
+ *
  * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
  * "other".
  */
@@ -97,6 +113,8 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 #ifdef CONFIG_PROC_FS
 	spin_lock_init(&client->bos_lock);
 	INIT_LIST_HEAD(&client->bos_list);
+	spin_lock_init(&client->blame_lock);
+	INIT_LIST_HEAD(&client->blame_list);
 #endif
 	return client;
 }
@@ -164,6 +182,72 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
 	xe_drm_client_put(client);
 }
 
+static void free_blame(struct blame *b)
+{
+	list_del(&b->list);
+	kfree(b->pf);
+	kfree(b);
+}
+
+void xe_drm_client_add_blame(struct xe_drm_client *client,
+			     struct xe_exec_queue *q)
+{
+	struct blame *b = NULL;
+	struct list_head *h;
+	struct pagefault *pf = NULL;
+	struct xe_file *xef = q->xef;
+	struct xe_hw_engine *hwe = q->hwe;
+	unsigned long count;
+
+	b = kzalloc(sizeof(struct blame), GFP_KERNEL);
+	xe_assert(xef->xe, b);
+
+	spin_lock(&client->blame_lock);
+	list_add_tail(&b->list, &client->blame_list);
+	/**
+	 * Limit the number of blames in the blame list to prevent memory overuse.
+	 *
+	 * TODO: Parameterize max blame list size.
+	 */
+	count = 0;
+	list_for_each(h, &client->blame_list)
+		count++;
+	if (count >= 50) {
+		struct blame *rem = list_first_entry(&client->blame_list, struct blame, list);
+		free_blame(rem);
+	}
+	spin_unlock(&client->blame_lock);
+
+	/**
+	 * Duplicate pagefault on engine to blame, if one may have caused the
+	 * exec queue to be banned.
+	 */
+	b->pf = NULL;
+	spin_lock(&hwe->pf.lock);
+	if (hwe->pf.info) {
+		pf = kzalloc(sizeof(struct pagefault), GFP_KERNEL);
+		memcpy(pf, hwe->pf.info, sizeof(struct pagefault));
+	}
+	spin_unlock(&hwe->pf.lock);
+
+	/** Save blame data to list element */
+	b->exec_queue_id = q->id;
+	b->pf = pf;
+}
+
+void xe_drm_client_remove_blame(struct xe_drm_client *client,
+				struct xe_exec_queue *q)
+{
+	struct blame *b, *tmp;
+
+	spin_lock(&client->blame_lock);
+	list_for_each_entry_safe(b, tmp, &client->blame_list, list)
+		if (b->exec_queue_id == q->id)
+			free_blame(b);
+	spin_unlock(&client->blame_lock);
+
+}
+
 static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
@@ -380,6 +464,49 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	}
 }
 
+static void print_pagefault(struct drm_printer *p, struct pagefault *pf)
+{
+	drm_printf(p, "\n\t\tASID: %d\n"
+	 "\t\tVFID: %d\n"
+	 "\t\tPDATA: 0x%04x\n"
+	 "\t\tFaulted Address: 0x%08x%08x\n"
+	 "\t\tFaultType: %s\n"
+	 "\t\tAccessType: %s\n"
+	 "\t\tFaultLevel: %d\n"
+	 "\t\tEngineClass: %d %s\n"
+	 "\t\tEngineInstance: %d\n",
+	 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
+	 lower_32_bits(pf->page_addr),
+	 fault_type_to_str(pf->fault_type),
+	 access_type_to_str(pf->access_type),
+	 pf->fault_level, pf->engine_class,
+	 xe_hw_engine_class_to_str(pf->engine_class),
+	 pf->engine_instance);
+}
+
+static void show_blames(struct drm_printer *p, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+	struct xe_drm_client *client;
+	struct blame *b;
+
+	client = xef->client;
+
+	drm_printf(p, "\n");
+	drm_printf(p, "- Exec queue ban list -\n");
+	spin_lock(&client->blame_lock);
+	list_for_each_entry(b, &client->blame_list, list) {
+		struct pagefault *pf = b->pf;
+		drm_printf(p, "\n\tExec queue %u banned:\n", b->exec_queue_id);
+		drm_printf(p, "\t\tAssociated pagefault:\n");
+		if (pf)
+			print_pagefault(p, pf);
+		else
+			drm_printf(p, "\t\t- No associated pagefault -\n");
+	}
+	spin_unlock(&client->blame_lock);
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -394,5 +521,6 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	show_meminfo(p, file);
 	show_run_ticks(p, file);
+	show_blames(p, file);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index a9649aa36011..d21fd0b90742 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -15,7 +15,18 @@
 
 struct drm_file;
 struct drm_printer;
+struct pagefault;
 struct xe_bo;
+struct xe_exec_queue;
+
+struct blame {
+	/** @exec_queue_id: ID number of banned exec queue */
+	u32 exec_queue_id;
+	/** @pf: pagefault on engine of banned exec queue, if any at time */
+	struct pagefault *pf;
+	/** @list: link into @xe_drm_client.blame_list */
+	struct list_head list;
+};
 
 struct xe_drm_client {
 	struct kref kref;
@@ -31,6 +42,17 @@ struct xe_drm_client {
 	 * Protected by @bos_lock.
 	 */
 	struct list_head bos_list;
+	/**
+	 * @blame_lock: lock protecting @blame_list
+	 */
+	spinlock_t blame_lock;
+	/**
+	 * @blame_list: list of banned exec queues associated with this drm
+	 *		client, as well as any pagefaults at time of ban.
+	 *
+	 * Protected by @blame_lock;
+	 */
+	struct list_head blame_list;
 #endif
 };
 
@@ -57,6 +79,10 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 void xe_drm_client_add_bo(struct xe_drm_client *client,
 			  struct xe_bo *bo);
 void xe_drm_client_remove_bo(struct xe_bo *bo);
+void xe_drm_client_add_blame(struct xe_drm_client *client,
+			     struct xe_exec_queue *q);
+void xe_drm_client_remove_blame(struct xe_drm_client *client,
+				struct xe_exec_queue *q);
 #else
 static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
 					struct xe_bo *bo)
@@ -66,5 +92,15 @@ static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
 static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
 {
 }
+
+static inline void xe_drm_client_add_blame(struct xe_drm_client *client,
+					   struct xe_exec_queue *q)
+{
+}
+
+static inline void xe_drm_client_remove_blame(struct xe_drm_client *client,
+					      struct xe_exec_queue *q)
+{
+}
 #endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a02e62465e01..9c9bc617020c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -13,6 +13,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -714,6 +715,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	q->id = id;
 	args->exec_queue_id = id;
 
+	/**
+	 * If an exec queue in the blame list shares the same exec queue
+	 * ID, remove it from the blame list to avoid confusion.
+	 */
+	xe_drm_client_remove_blame(q->xef->client, q);
+
 	return 0;
 
 kill_exec_queue:
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index fe18e3ec488a..a0e6f2281e37 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -330,6 +330,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefault *pf)
+{
+	struct xe_hw_engine *hwe;
+
+	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
+	if (hwe) {
+		spin_lock(&hwe->pf.lock);
+		/** The latest pagefault is pf, so remove old pf info from engine */
+		if (hwe->pf.info)
+			kfree(hwe->pf.info);
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);
+		if (hwe->pf.info)
+			memcpy(hwe->pf.info, pf, sizeof(struct pagefault));
+		spin_unlock(&hwe->pf.lock);
+	}
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -352,6 +369,8 @@ static void pf_queue_work_func(struct work_struct *w)
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
+		save_pagefault_to_engine(gt, &pf);
+
 		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
 			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
 			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..d9da5c89429e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -20,11 +20,13 @@
 #include "xe_assert.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
@@ -146,6 +148,7 @@ static bool exec_queue_banned(struct xe_exec_queue *q)
 static void set_exec_queue_banned(struct xe_exec_queue *q)
 {
 	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
+	xe_drm_client_add_blame(q->xef->client, q);
 }
 
 static bool exec_queue_suspended(struct xe_exec_queue *q)
@@ -1971,6 +1974,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u32 guc_id;
 
@@ -1983,11 +1987,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
+	hwe = q->hwe;
+
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_reset(q);
 
+	/**
+	 * Clear last pagefault from engine.  Any future exec queue bans likely were
+	 * not caused by said pagefault now that the engine has reset.
+	 */
+	spin_lock(&hwe->pf.lock);
+	if (hwe->pf.info) {
+		kfree(hwe->pf.info);
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);
+	}
+	spin_unlock(&hwe->pf.lock);
+
 	/*
 	 * A banned engine is a NOP at this point (came from
 	 * guc_exec_queue_timedout_job). Otherwise, kick drm scheduler to cancel
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..69f61e4905e2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -21,6 +21,7 @@
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
@@ -557,6 +558,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->eclass->defaults = hwe->eclass->sched_props;
 	}
 
+	hwe->pf.info = NULL;
+	spin_lock_init(&hwe->pf.lock);
+
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e4191a7a2c31..2e1be9481d9b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -64,6 +64,7 @@ enum xe_hw_engine_id {
 struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
+struct pagefault;
 
 /**
  * struct xe_hw_engine_class_intf - per hw engine class struct interface
@@ -150,6 +151,13 @@ struct xe_hw_engine {
 	struct xe_oa_unit *oa_unit;
 	/** @hw_engine_group: the group of hw engines this one belongs to */
 	struct xe_hw_engine_group *hw_engine_group;
+	/** @pf: the last pagefault seen on this engine */
+	struct {
+		/** @pf.info: info containing last seen pagefault details */
+		struct pagefault *info;
+		/** @pf.lock: lock protecting @pf.info */
+		spinlock_t lock;
+	} pf;
 };
 
 enum xe_hw_engine_snapshot_source_id {
-- 
2.43.0

