Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62313A3E5F5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BF110E9DF;
	Thu, 20 Feb 2025 20:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5v3mvlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DBC10E9DF;
 Thu, 20 Feb 2025 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740083915; x=1771619915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0uyGn1APz4ljCn/pIHS38mXX4lsg7s1/S0amSUYGNj8=;
 b=R5v3mvlZR964EyTf6izGoVZLm78nF7wSpE4mzFKEKoG6mxNSaAEqhEG3
 rZtjEuNWIclnQTB9ey1ZpBapvw4jQyWSa2JPDDhlMhsY85X/E9w+c0fkF
 h/42vNA5+PBbBK/pWCgF9YNr7leyTBbxMsr+ZsSdtJ5+P93ywImtl+0yc
 JMgXvF6Lq1FODSCLLe+LEUDnvxvSFgy74EBcbjKUpc1X63qmpC0P+x+vM
 NeOHIrYW3NePdfp6stN73a47QxPKvsKq8NnzAMUT3/01tTEVkA2DQ76/y
 0PuGP343E4KbFZNzl3nkenstiuVKkKXk9LMRUZG1N03xXH0N7KtrMa8Ka w==;
X-CSE-ConnectionGUID: npsCygFSRcCV93qA0ZNeJw==
X-CSE-MsgGUID: A2gOLoV7Q3yK12Hw3K6Ajw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41097935"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41097935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:35 -0800
X-CSE-ConnectionGUID: DtHficPPQWqvIX8QksG+jQ==
X-CSE-MsgGUID: NgBM5AzTR3W+WEPLqYbNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115100560"
Received: from dut4086lnl.fm.intel.com ([10.105.10.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:34 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 3/6] drm/xe/xe_drm_client: Add per drm client pagefault info
Date: Thu, 20 Feb 2025 20:38:29 +0000
Message-ID: <20250220203832.130430-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220203832.130430-1-jonathan.cavitt@intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
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

Add additional information to drm client so it can report up to the last
50 exec queues to have been banned on it, as well as the last pagefault
seen when said exec queues were banned.  Since we cannot reasonably
associate a pagefault to a specific exec queue, we currently report the
last seen pagefault on the associated hw engine instead.

The last pagefault seen per exec queue is saved to the hw engine, and the
pagefault is updated during the pagefault handling process in
xe_gt_pagefault.  The last seen pagefault is reset when the engine is
reset because any future exec queue bans likely were not caused by said
pagefault after the reset.

v2: Remove exec queue from blame list on destroy and recreate (Joonas)
v3: Do not print as part of xe_drm_client_fdinfo (Joonas)
v4: Fix formatting and kzalloc during lock warnings

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c      | 68 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h      | 42 +++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c      |  7 +++
 drivers/gpu/drm/xe/xe_gt_pagefault.c    | 17 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c      | 15 ++++++
 drivers/gpu/drm/xe/xe_hw_engine.c       |  4 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  8 +++
 7 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..1bc978ae4c2f 100644
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
@@ -97,6 +98,8 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 #ifdef CONFIG_PROC_FS
 	spin_lock_init(&client->bos_lock);
 	INIT_LIST_HEAD(&client->bos_list);
+	spin_lock_init(&client->blame_lock);
+	INIT_LIST_HEAD(&client->blame_list);
 #endif
 	return client;
 }
@@ -164,6 +167,71 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
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
+	struct pagefault *pf = NULL;
+	struct xe_file *xef = q->xef;
+	struct xe_hw_engine *hwe = q->hwe;
+
+	b = kzalloc(sizeof(*b), GFP_KERNEL);
+	xe_assert(xef->xe, b);
+
+	spin_lock(&client->blame_lock);
+	list_add_tail(&b->list, &client->blame_list);
+	client->blame_len++;
+	/**
+	 * Limit the number of blames in the blame list to prevent memory overuse.
+	 */
+	if (client->blame_len > MAX_BLAME_LEN) {
+		struct blame *rem = list_first_entry(&client->blame_list, struct blame, list);
+
+		free_blame(rem);
+		client->blame_len--;
+	}
+	spin_unlock(&client->blame_lock);
+
+	/**
+	 * Duplicate pagefault on engine to blame, if one may have caused the
+	 * exec queue to be ban.
+	 */
+	b->pf = NULL;
+	pf = kzalloc(sizeof(*pf), GFP_KERNEL);
+	spin_lock(&hwe->pf.lock);
+	if (hwe->pf.info) {
+		memcpy(pf, hwe->pf.info, sizeof(struct pagefault));
+		b->pf = pf;
+	} else {
+		kfree(pf);
+	}
+	spin_unlock(&hwe->pf.lock);
+
+	/** Save blame data to list element */
+	b->exec_queue_id = q->id;
+}
+
+void xe_drm_client_remove_blame(struct xe_drm_client *client,
+				struct xe_exec_queue *q)
+{
+	struct blame *b, *tmp;
+
+	spin_lock(&client->blame_lock);
+	list_for_each_entry_safe(b, tmp, &client->blame_list, list)
+		if (b->exec_queue_id == q->id) {
+			free_blame(b);
+			client->blame_len--;
+		}
+	spin_unlock(&client->blame_lock);
+}
+
 static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index a9649aa36011..b3d9b279d55f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -13,9 +13,22 @@
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 
+#define MAX_BLAME_LEN	50
+
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
@@ -31,6 +44,21 @@ struct xe_drm_client {
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
+	/**
+	 * @blame_len: length of @blame_list
+	 */
+	unsigned int blame_len;
 #endif
 };
 
@@ -57,6 +85,10 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
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
@@ -66,5 +98,15 @@ static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
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
index 4a98a5d0e405..f8bcf43b2a0e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -13,6 +13,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -712,6 +713,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
index fe18e3ec488a..b95501076569 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -330,6 +330,21 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefault *pf)
+{
+	struct xe_hw_engine *hwe;
+
+	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
+	if (hwe) {
+		spin_lock(&hwe->pf.lock);
+		/** Info initializes as NULL, so alloc if first pagefault */
+		if (!hwe->pf.info)
+			hwe->pf.info = kzalloc(sizeof(*pf), GFP_KERNEL);
+		memcpy(hwe->pf.info, pf, sizeof(*pf));
+		spin_unlock(&hwe->pf.lock);
+	}
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -352,6 +367,8 @@ static void pf_queue_work_func(struct work_struct *w)
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
+		save_pagefault_to_engine(gt, &pf);
+
 		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
 			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
 			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..92de926bd505 100644
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
 
@@ -1983,11 +1987,22 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
+	kfree(hwe->pf.info);
+	hwe->pf.info = NULL;
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

