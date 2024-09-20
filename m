Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7C97D03B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493910E795;
	Fri, 20 Sep 2024 03:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZW7V/t2";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B8410E6FD;
 Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802409; x=1758338409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2EA07CHP74Jtj+3CNFXkgzHYFj+GgGu0dgxebYLIwks=;
 b=iZW7V/t2fN2tEykq9PglkqHKCvyREtbnahEgay4N4FihdNzC2u4xt/5Z
 QmItOKnLU0Obv72iA1OqDL0wek+H4TkJRFS22Kg7+Ymm7Ymc3jyUheGNW
 BuQH1mseQvMNxUtDSutuWfqUOn3GUue3hJFXmIZOuxY7mVAZjFr9Amx5v
 sIfmMvRB61h0HH8V1LxEpmIOWSBTZZVaMedrMU85bKU4IQ+JZS2UgnTwn
 ZFoo4daqrBxl3rfYSdjgqd8TRVVACb5rEPLVNMNRy8mgoxDECEFi7B6EF
 eLLYQjBBcFSDqGlSdPouapjM9ZZsRue0XEgGY5jyU0gs2PDUFq/v3rN6d A==;
X-CSE-ConnectionGUID: Bmwt2UZATxaeEwL4BO+V/w==
X-CSE-MsgGUID: f4ULDym0QkmDjsYnMQPHGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269806"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:09 -0700
X-CSE-ConnectionGUID: qabcQ9q+TW6VDrw5/AIQHA==
X-CSE-MsgGUID: Pojo4VI9T4+D8L+PVFHnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746191"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:08 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v8 08/11] drm/xe/guc: Dead CT helper
Date: Thu, 19 Sep 2024 20:20:03 -0700
Message-ID: <20240920032007.629624-9-John.C.Harrison@Intel.com>
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

Add a worker function helper for asynchronously dumping state when an
internal/fatal error is detected in CT processing. Being asynchronous
is required to avoid deadlocks and scheduling-while-atomic or
process-stalled-for-too-long issues. Also check for a bunch more error
conditions and improve the handling of some existing checks.

v2: Use compile time CONFIG check for new (but not directly CT_DEAD
related) checks and use unsigned int for a bitmask, rename
CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
entire mask to zero.
v3: Fix kerneldoc
v4: Nullify some floating pointers after free.
v5: Add section headings and device info to make the state dump look
more like a devcoredump to allow parsing by the same tools (eventual
aim is to just call the devcoredump code itself, but that currently
requires an xe_sched_job, which is not available in the CT code).
v6: Fix potential for leaking snapshots with concurrent error
conditions (review feedback from Julia F).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 320 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h                |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  23 ++
 5 files changed, 318 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index 8f86a16dc577..f58198cf2cf6 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
 #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
 #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
 #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
+#define GUC_CTB_STATUS_DISABLED				(1 << 3)
 	u32 reserved[13];
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fa2b4ae1257a..b867f30847e5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1180,7 +1180,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	xe_guc_ct_print(&guc->ct, p, false);
+	xe_guc_ct_print(&guc->ct, p);
 	xe_guc_submit_print(guc, p);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a63fe0a9077a..90701fd465c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -25,12 +25,48 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
+#include "xe_guc_log.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_trace_guc.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+enum {
+	/* Internal states, not error conditions */
+	CT_DEAD_STATE_REARM,			/* 0x0001 */
+	CT_DEAD_STATE_CAPTURE,			/* 0x0002 */
+
+	/* Error conditions */
+	CT_DEAD_SETUP,				/* 0x0004 */
+	CT_DEAD_H2G_WRITE,			/* 0x0008 */
+	CT_DEAD_H2G_HAS_ROOM,			/* 0x0010 */
+	CT_DEAD_G2H_READ,			/* 0x0020 */
+	CT_DEAD_G2H_RECV,			/* 0x0040 */
+	CT_DEAD_G2H_RELEASE,			/* 0x0080 */
+	CT_DEAD_DEADLOCK,			/* 0x0100 */
+	CT_DEAD_PROCESS_FAILED,			/* 0x0200 */
+	CT_DEAD_FAST_G2H,			/* 0x0400 */
+	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0800 */
+	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
+	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
+	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
+};
+
+static void ct_dead_worker_func(struct work_struct *w);
+static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
+
+#define CT_DEAD(ct, ctb, reason_code)		ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
+#else
+#define CT_DEAD(ct, ctb, reason)			\
+	do {						\
+		struct guc_ctb *_ctb = (ctb);		\
+		if (_ctb)				\
+			_ctb->info.broken = true;	\
+	} while (0)
+#endif
+
 /* Used when a CT send wants to block and / or receive data */
 struct g2h_fence {
 	u32 *response_buffer;
@@ -183,6 +219,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	spin_lock_init(&ct->dead.lock);
+	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
+#endif
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -419,10 +459,22 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (ct_needs_safe_mode(ct))
 		ct_enter_safe_mode(ct);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	/*
+	 * The CT has now been reset so the dumper can be re-armed
+	 * after any existing dead state has been dumped.
+	 */
+	spin_lock_irq(&ct->dead.lock);
+	if (ct->dead.reason)
+		ct->dead.reason |= CT_DEAD_STATE_REARM;
+	spin_unlock_irq(&ct->dead.lock);
+#endif
+
 	return 0;
 
 err_out:
 	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
+	CT_DEAD(ct, NULL, SETUP);
 
 	return err;
 }
@@ -466,6 +518,19 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 	if (cmd_len > h2g->info.space) {
 		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+
+		if (h2g->info.head > h2g->info.size) {
+			struct xe_device *xe = ct_to_xe(ct);
+			u32 desc_status = desc_read(xe, h2g, status);
+
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+
+			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
+				  h2g->info.head, h2g->info.size);
+			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
+			return false;
+		}
+
 		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
 					     h2g->info.size) -
 				  h2g->info.resv_space;
@@ -521,10 +586,24 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
+	bool bad = false;
+
 	lockdep_assert_held(&ct->fast_lock);
-	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
-		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
-	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding);
+
+	bad = ct->ctbs.g2h.info.space + g2h_len >
+		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space;
+	bad |= !ct->g2h_outstanding;
+
+	if (bad) {
+		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+			  ct->ctbs.g2h.info.space, g2h_len,
+			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+			  ct->ctbs.g2h.info.space + g2h_len,
+			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+			  ct->g2h_outstanding);
+		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
+		return;
+	}
 
 	ct->ctbs.g2h.info.space += g2h_len;
 	if (!--ct->g2h_outstanding)
@@ -551,12 +630,43 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
+	u32 desc_status;
 
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
 	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
-	xe_gt_assert(gt, tail <= h2g->info.size);
+
+	desc_status = desc_read(xe, h2g, status);
+	if (desc_status) {
+		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+		goto corrupted;
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		u32 desc_tail = desc_read(xe, h2g, tail);
+		u32 desc_head = desc_read(xe, h2g, head);
+
+		if (tail != desc_tail) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
+			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
+			goto corrupted;
+		}
+
+		if (tail > h2g->info.size) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
+				  tail, h2g->info.size);
+			goto corrupted;
+		}
+
+		if (desc_head >= h2g->info.size) {
+			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
+				  desc_head, h2g->info.size);
+			goto corrupted;
+		}
+	}
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
 	if (tail + full_len > h2g->info.size) {
@@ -609,6 +719,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
+
+corrupted:
+	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
+	return -EPIPE;
 }
 
 /*
@@ -720,7 +834,6 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
-	struct drm_printer p = xe_gt_info_printer(gt);
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
@@ -773,8 +886,13 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			goto broken;
 #undef g2h_avail
 
-		if (dequeue_one_g2h(ct) < 0)
+		ret = dequeue_one_g2h(ct);
+		if (ret < 0) {
+			if (ret != -ECANCELED)
+				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
+					  ERR_PTR(ret));
 			goto broken;
+		}
 
 		goto try_again;
 	}
@@ -783,8 +901,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 broken:
 	xe_gt_err(gt, "No forward process on H2G, reset required\n");
-	xe_guc_ct_print(ct, &p, true);
-	ct->ctbs.h2g.info.broken = true;
+	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
 }
@@ -1011,6 +1128,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		else
 			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
 				  type, fence);
+		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
 	}
@@ -1019,8 +1137,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	if (unlikely(!g2h_fence)) {
 		/* Don't tear down channel, as send could've timed out */
 		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
+		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
 		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
-		return 0;
+		return -EPROTO;
 	}
 
 	xe_gt_assert(gt, fence == g2h_fence->seqno);
@@ -1062,7 +1181,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
 		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
 			  origin);
-		ct->ctbs.g2h.info.broken = true;
+		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
 		return -EPROTO;
 	}
@@ -1080,7 +1199,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	default:
 		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
 			  type);
-		ct->ctbs.g2h.info.broken = true;
+		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
 	}
@@ -1157,9 +1276,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
 
-	if (ret)
+	if (ret) {
 		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
 			  action, ERR_PTR(ret));
+		CT_DEAD(ct, NULL, PROCESS_FAILED);
+	}
 
 	return 0;
 }
@@ -1169,7 +1290,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct guc_ctb *g2h = &ct->ctbs.g2h;
-	u32 tail, head, len;
+	u32 tail, head, len, desc_status;
 	s32 avail;
 	u32 action;
 	u32 *hxg;
@@ -1188,6 +1309,50 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
+	desc_status = desc_read(xe, g2h, status);
+	if (desc_status) {
+		if (desc_status & GUC_CTB_STATUS_DISABLED) {
+			/*
+			 * Potentially valid if a CLIENT_RESET request resulted in
+			 * contexts/engines being reset. But should never happen as
+			 * no contexts should be active when CLIENT_RESET is sent.
+			 */
+			xe_gt_err(gt, "CT read: unexpected G2H after GuC has stopped!\n");
+			desc_status &= ~GUC_CTB_STATUS_DISABLED;
+		}
+
+		if (desc_status) {
+			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
+			goto corrupted;
+		}
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		u32 desc_tail = desc_read(xe, g2h, tail);
+		u32 desc_head = desc_read(xe, g2h, head);
+
+		if (g2h->info.head != desc_head) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
+			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
+				  desc_head, g2h->info.head);
+			goto corrupted;
+		}
+
+		if (g2h->info.head > g2h->info.size) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
+				  g2h->info.head, g2h->info.size);
+			goto corrupted;
+		}
+
+		if (desc_tail >= g2h->info.size) {
+			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
+			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
+				  desc_tail, g2h->info.size);
+			goto corrupted;
+		}
+	}
+
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
 	avail = tail - g2h->info.head;
@@ -1204,9 +1369,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	if (len > avail) {
 		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			  avail, len);
-		g2h->info.broken = true;
-
-		return -EPROTO;
+		goto corrupted;
 	}
 
 	head = (g2h->info.head + 1) % g2h->info.size;
@@ -1252,6 +1415,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			     action, len, g2h->info.head, tail);
 
 	return len;
+
+corrupted:
+	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
+	return -EPROTO;
 }
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
@@ -1278,9 +1445,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_warn(gt, "NOT_POSSIBLE");
 	}
 
-	if (ret)
+	if (ret) {
 		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
 			  action, ERR_PTR(ret));
+		CT_DEAD(ct, NULL, FAST_G2H);
+	}
 }
 
 /**
@@ -1340,7 +1509,6 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 
 static void receive_g2h(struct xe_guc_ct *ct)
 {
-	struct xe_gt *gt = ct_to_gt(ct);
 	bool ongoing;
 	int ret;
 
@@ -1377,9 +1545,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			struct drm_printer p = xe_gt_info_printer(gt);
-
-			xe_guc_ct_print(ct, &p, false);
+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d", ret);
+			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
 	} while (ret == 1);
@@ -1407,9 +1574,8 @@ static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
 
 	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
 				       atomic ? GFP_ATOMIC : GFP_KERNEL);
-
 	if (!snapshot->cmds) {
-		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
+		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
 		return;
 	}
 
@@ -1490,7 +1656,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 			   atomic ? GFP_ATOMIC : GFP_KERNEL);
 
 	if (!snapshot) {
-		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
+		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
 		return NULL;
 	}
 
@@ -1554,16 +1720,114 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
  * xe_guc_ct_print - GuC CT Print.
  * @ct: GuC CT.
  * @p: drm_printer where it will be printed out.
- * @atomic: Boolean to indicate if this is called from atomic context like
- * reset or CTB handler or from some regular path like debugfs.
  *
  * This function quickly capture a snapshot and immediately print it out.
  */
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
 {
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
+	snapshot = xe_guc_ct_snapshot_capture(ct, false);
 	xe_guc_ct_snapshot_print(snapshot, p);
 	xe_guc_ct_snapshot_free(snapshot);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
+{
+	struct xe_guc_log_snapshot *snapshot_log;
+	struct xe_guc_ct_snapshot *snapshot_ct;
+	struct xe_guc *guc = ct_to_guc(ct);
+	unsigned long flags;
+	bool have_capture;
+
+	if (ctb)
+		ctb->info.broken = true;
+
+	/* Ignore further errors after the first dump until a reset */
+	if (ct->dead.reported)
+		return;
+
+	spin_lock_irqsave(&ct->dead.lock, flags);
+
+	/* And only capture one dump at a time */
+	have_capture = ct->dead.reason & CT_DEAD_STATE_CAPTURE;
+	ct->dead.reason |= (1 << reason_code) |
+			   (1 << CT_DEAD_STATE_CAPTURE);
+
+	spin_unlock_irqrestore(&ct->dead.lock, flags);
+
+	if (have_capture)
+		return;
+
+	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
+	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
+
+	spin_lock_irqsave(&ct->dead.lock, flags);
+
+	if (ct->dead.snapshot_log || ct->dead.snapshot_ct) {
+		xe_gt_err(ct_to_gt(ct), "Got unexpected dead CT capture!\n");
+		xe_guc_log_snapshot_free(snapshot_log);
+		xe_guc_ct_snapshot_free(snapshot_ct);
+	} else {
+		ct->dead.snapshot_log = snapshot_log;
+		ct->dead.snapshot_ct = snapshot_ct;
+	}
+
+	spin_unlock_irqrestore(&ct->dead.lock, flags);
+
+	queue_work(system_unbound_wq, &(ct)->dead.worker);
+}
+
+static void ct_dead_print(struct xe_dead_ct *dead)
+{
+	struct xe_guc_ct *ct = container_of(dead, struct xe_guc_ct, dead);
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
+
+	if (!dead->reason) {
+		xe_gt_err(gt, "CTB is dead for no reason!?\n");
+		return;
+	}
+
+	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
+
+	/* Can't generate a genuine core dump at this point, so just do the good bits */
+	drm_printf(&lp, "**** Xe Device Coredump ****\n");
+	xe_device_snapshot_print(xe, &lp);
+	drm_printf(&lp, "**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
+	drm_printf(&lp, "**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+
+	drm_printf(&lp, "Done.\n");
+}
+
+static void ct_dead_worker_func(struct work_struct *w)
+{
+	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
+
+	if (!ct->dead.reported) {
+		ct->dead.reported = true;
+		ct_dead_print(&ct->dead);
+	}
+
+	spin_lock_irq(&ct->dead.lock);
+
+	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
+	ct->dead.snapshot_log = NULL;
+	xe_guc_ct_snapshot_free(ct->dead.snapshot_ct);
+	ct->dead.snapshot_ct = NULL;
+
+	if (ct->dead.reason & CT_DEAD_STATE_REARM) {
+		/* A reset has occurred so re-arm the error reporting */
+		ct->dead.reason = 0;
+		ct->dead.reported = false;
+	}
+
+	spin_unlock_irq(&ct->dead.lock);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 190202fce2d0..293041bed7ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -21,7 +21,7 @@ xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
 void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 			      struct drm_printer *p);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 761cb9031298..85e127ec91d7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -86,6 +86,24 @@ enum xe_guc_ct_state {
 	XE_GUC_CT_STATE_ENABLED,
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+/** struct xe_dead_ct - Information for debugging a dead CT */
+struct xe_dead_ct {
+	/** @lock: protects memory allocation/free operations, and @reason updates */
+	spinlock_t lock;
+	/** @reason: bit mask of CT_DEAD_* reason codes */
+	unsigned int reason;
+	/** @reported: for preventing multiple dumps per error sequence */
+	bool reported;
+	/** @worker: worker thread to get out of interrupt context before dumping */
+	struct work_struct worker;
+	/** snapshot_ct: copy of CT state and CTB content at point of error */
+	struct xe_guc_ct_snapshot *snapshot_ct;
+	/** snapshot_log: copy of GuC log at point of error */
+	struct xe_guc_log_snapshot *snapshot_log;
+};
+#endif
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
@@ -128,6 +146,11 @@ struct xe_guc_ct {
 	u32 msg[GUC_CTB_MSG_MAX_LEN];
 	/** @fast_msg: Message buffer */
 	u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	/** @dead: information for debugging dead CTs */
+	struct xe_dead_ct dead;
+#endif
 };
 
 #endif
-- 
2.46.0

