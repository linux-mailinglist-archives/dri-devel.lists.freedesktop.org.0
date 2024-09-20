Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91397D03E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528E10E79C;
	Fri, 20 Sep 2024 03:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W10wzMCP";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4318A10E77B;
 Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802409; x=1758338409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XEdILZGFHVVr2nRvhsvgVC2PkstSC+lh/vnz6+dBdp4=;
 b=W10wzMCPUqDOnieSX8UboSp/xrp9puWwzBM+XSLVKudxDgfjYBB3UELz
 b6NKUSQdLDL/ki5VIVafl3NLQjvdMdcO+nooVsWto+itTEy2xVP5qzXO2
 ctdPZZ/uIVq/t8ACBv/SQpcHAZIWa642jOeJITBmnKnvEXRwgGwFzazjL
 Lpk9j1YLiMSa770HcQOe1vWvCW5mkA/bNagMsYXWCtJmUpzExNgyzcwv6
 U9sI+UYi6myfdz47dNU5sKzjSBD3D4+nlyp/ngcYjLQ7KlNCtm+hzDHof
 o8pygqHxEju2tmVzXb4gO71H7Mbc0og597Kwp3Q3TtMoAvtjM68hnz2lT g==;
X-CSE-ConnectionGUID: q0uZBQezQqecX8VxHE95Iw==
X-CSE-MsgGUID: U4dhAq/RTTCxDf3v6TVRpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269808"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:09 -0700
X-CSE-ConnectionGUID: Vtwj4PwwRFSC3k2/f3dT6g==
X-CSE-MsgGUID: xhuX+ypRTXm6a/PQ3KKFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746194"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:09 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 09/11] drm/xe/guc: Dump entire CTB on errors
Date: Thu, 19 Sep 2024 20:20:04 -0700
Message-ID: <20240920032007.629624-10-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032007.629624-1-John.C.Harrison@Intel.com>
References: <20240920032007.629624-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The dump of the CT buffers was only showing the unprocessed data which
is not generally useful for saying why a hang occurred - because it
was probably caused by the commands that were just processed. So save
and dump the entire buffer but in a more compact dump format. Also
zero fill it on allocation to avoid confusion over uninitialised data
in the dump.

v2: Add kerneldoc - review feedback from Michal W.
v3: Fix kerneldoc.
v4: Use ascii85 instead of hexdump (review feedback from Matthew B).
v5: Dump the entire CTB object rather than separately dumping just the
H2G and G2H sections. That way it includes the full header info.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 94 ++++++++++------------------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 +-
 3 files changed, 41 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 90701fd465c9..5546d4f87ebb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -17,6 +17,7 @@
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "xe_bo.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
@@ -435,6 +436,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
+	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
@@ -1562,48 +1564,33 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
-static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-				     struct guc_ctb_snapshot *snapshot,
-				     bool atomic)
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
 {
-	u32 head, tail;
+	struct xe_guc_ct_snapshot *snapshot;
 
-	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
-			   sizeof(struct guc_ct_buffer_desc));
-	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot)
+		return NULL;
 
-	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
-				       atomic ? GFP_ATOMIC : GFP_KERNEL);
-	if (!snapshot->cmds) {
-		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
-		return;
+	if (ct->bo) {
+		snapshot->ctb_size = ct->bo->size;
+		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
 	}
 
-	head = snapshot->desc.head;
-	tail = snapshot->desc.tail;
-
-	if (head != tail) {
-		struct iosys_map map =
-			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
-
-		while (head != tail) {
-			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
-			++head;
-			if (head == ctb->info.size) {
-				head = 0;
-				map = ctb->cmds;
-			} else {
-				iosys_map_incr(&map, sizeof(u32));
-			}
-		}
-	}
+	return snapshot;
+}
+
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot)
+{
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
 }
 
 static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 				   struct drm_printer *p)
 {
-	u32 head, tail;
-
 	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
 	drm_printf(p, "\tresv_space: %d\n", snapshot->info.resv_space);
 	drm_printf(p, "\thead: %d\n", snapshot->info.head);
@@ -1613,25 +1600,6 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
 	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
 	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
-
-	if (!snapshot->cmds)
-		return;
-
-	head = snapshot->desc.head;
-	tail = snapshot->desc.tail;
-
-	while (head != tail) {
-		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-			   snapshot->cmds[head]);
-		++head;
-		if (head == snapshot->info.size)
-			head = 0;
-	}
-}
-
-static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
-{
-	kfree(snapshot->cmds);
 }
 
 /**
@@ -1652,9 +1620,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = kzalloc(sizeof(*snapshot),
-			   atomic ? GFP_ATOMIC : GFP_KERNEL);
-
+	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
 	if (!snapshot) {
 		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
 		return NULL;
@@ -1663,12 +1629,13 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
 		snapshot->ct_enabled = true;
 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
-		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
-					 &snapshot->h2g, atomic);
-		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
-					 &snapshot->g2h, atomic);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g, &snapshot->h2g);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
 	}
 
+	if (ct->bo && snapshot->ctb)
+		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
+
 	return snapshot;
 }
 
@@ -1691,9 +1658,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 
 		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
-
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
+
+		if (snapshot->ctb) {
+			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
+		} else {
+			drm_printf(p, "CTB snapshot missing!\n");
+			return;
+		}
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
@@ -1711,8 +1684,7 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	guc_ctb_snapshot_free(&snapshot->h2g);
-	guc_ctb_snapshot_free(&snapshot->g2h);
+	kfree(snapshot->ctb);
 	kfree(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 293041bed7ed..338f0b75d29f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -9,6 +9,7 @@
 #include "xe_guc_ct_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
@@ -16,10 +17,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
-struct xe_guc_ct_snapshot *
-xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
-			      struct drm_printer *p);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 85e127ec91d7..8e1b9d981d61 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -52,8 +52,6 @@ struct guc_ctb {
 struct guc_ctb_snapshot {
 	/** @desc: snapshot of the CTB descriptor */
 	struct guc_ct_buffer_desc desc;
-	/** @cmds: snapshot of the CTB commands */
-	u32 *cmds;
 	/** @info: snapshot of the CTB info */
 	struct guc_ctb_info info;
 };
@@ -70,6 +68,10 @@ struct xe_guc_ct_snapshot {
 	struct guc_ctb_snapshot g2h;
 	/** @h2g: H2G CTB snapshot */
 	struct guc_ctb_snapshot h2g;
+	/** @ctb_size: size of the snapshot of the CTB */
+	size_t ctb_size;
+	/** @ctb: snapshot of the entire CTB */
+	u32 *ctb;
 };
 
 /**
-- 
2.46.0

