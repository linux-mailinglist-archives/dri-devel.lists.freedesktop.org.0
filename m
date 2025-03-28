Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D0A75038
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881E10EA8E;
	Fri, 28 Mar 2025 18:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln0r9JB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1AC10EA8E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185531; x=1774721531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lO5sWc/yHfoUVr0xVOV/MpPdVAaIA0kdRoiUvtqgZCY=;
 b=Ln0r9JB+a2iD9Hb7VUrHJij9VTo07drOhGcLHmqfY40xkyOj3elo9zBV
 gh8XLcOGl2x3efnJgomGaqcEZ8h9s1Q3K9MWjSC6Qj2ZN+aL8xFWTNrHz
 SBdlb62qRAH4U0H1vChQPiatFruBQCdIu6tI02uq8p4VfqxLoLZyCVBlr
 5f9wuiRCAO6XMyN+ekippJVv0XaKWbhhq7FYUfX/I8w/hDEO2LhqueG/Q
 X5XDeb1vlW+zn2Y2sAlh9OxCjHPD7BBSAFhJ57KUredm4bne5jwwKbgwg
 RjHqYinJYufFgPIDfFiqCSgzr2bvoF3TG6L1fWExGF84vVeoOcMjl++qS g==;
X-CSE-ConnectionGUID: 26yQ1RUyT2ikWlgPqVj6Gg==
X-CSE-MsgGUID: P5t3rkrkTGiLi5HB20PmjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48338820"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="48338820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:12:11 -0700
X-CSE-ConnectionGUID: 4BZwDfA7RBi+6NuMweTvgg==
X-CSE-MsgGUID: Rlq2cLBNQb2uFFHKf6UdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130616395"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 11:12:09 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
Date: Fri, 28 Mar 2025 19:12:00 +0100
Message-Id: <20250328181200.1011623-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328181200.1011623-1-tomasz.lis@intel.com>
References: <20250328181200.1011623-1-tomasz.lis@intel.com>
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

During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct->lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: removed inline keywords, enums for offsets in CTB messages,
  less error messages, if return unused then made functs void (Michal)
v4: update the cached head before starting fixups
v5: removed/updated comments, wrapped lines, converted assert into
  error, enums for offsets to separate patch, reused xe_map_rd

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 142 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c |  25 ++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 686fe664c20d..6c80106e5e8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence->response_buffer = response_buffer;
@@ -1622,6 +1624,146 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static u32 xe_map_rd_u32(struct xe_device *xe, struct iosys_map *cmds,
+			     u32 head, u32 pos)
+{
+	return xe_map_rd(xe, cmds, (head + pos) * sizeof(u32), u32);
+}
+
+static void xe_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
+			       u32 head, u32 pos, s64 shift)
+{
+	u32 msg[2];
+	u64 offset;
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   2 * sizeof(u32));
+	offset = make_u64(msg[1], msg[0]);
+	offset += shift;
+	msg[0] = lower_32_bits(offset);
+	msg[1] = upper_32_bits(offset);
+	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
+}
+
+/*
+ * Shift any GGTT addresses within a single message left within CTB from
+ * before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+			   1 * sizeof(u32));
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		xe_map_fixup_u64(xe, cmds, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
+		xe_map_fixup_u64(xe, cmds, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+			n = xe_map_rd_u32(xe, cmds, head,
+				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
+			for (i = 0; i < n; i++)
+				xe_map_fixup_u64(xe, cmds, head,
+					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA
+					    + 2 * i, shift);
+		} else {
+			xe_map_fixup_u64(xe, cmds, head, 10, shift);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
+					 struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 head = *mhead;
+	u32 size = h2g->info.size;
+	u32 msg[1];
+	u32 len;
+
+	/* Read header */
+	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
+			   sizeof(u32));
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len > (u32)avail)) {
+		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + 1) % size;
+	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
+	*mhead = (head + len - 1) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
+ * GGTT offsets in their payloads.
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &ct->ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
+
+	if (unlikely(h2g->info.broken))
+		return;
+
+	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g->info.head;
+	tail = READ_ONCE(h2g->info.tail);
+	size = h2g->info.size;
+
+	if (unlikely(head > size))
+		goto corrupted;
+
+	if (unlikely(tail >= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail < 0))
+		avail += size;
+	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
+	xe_gt_assert(gt, avail >= 0);
+
+	while (avail > 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
+		 head, tail, size);
+	h2g->info.broken = true;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct->state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2eb6b8d8a217..9a1b578fdd03 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_guc_ct.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -158,6 +159,27 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+
+	return config->ggtt_shift;
+}
+
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
+
+		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &xe_device struct instance
@@ -219,6 +241,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (need_fixups)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
-- 
2.25.1

