Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEF82F2F8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B01E10E5A7;
	Tue, 16 Jan 2024 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643C10E596;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ggs7AX76jUNwlcnvEacJrBdicSZ6/kPWJcA7Em/ODg=;
 b=ev/a32Iacz/l7IDhw2q1ECbaSVeFZonqwI9B9h4uBhsivebexl9a8aXX
 7BYpEGclhDNaZ9fvbWGc1+IeR0sDP8rUXSZAfLpar3UMoEZMdmHRIh2CL
 Wan/8fExlg4yEsGsWVLa1gLcFULYpHcmKVXB0KihKrEsD0nmv1NulxtI4
 wSPJViNXpdkYVhoE36UlPU+GeOTObmYFaALnDB0D+vcE9r5RG0U7kKxjf
 HiozrCzTm1D3iFTdzJYKnaDMNrE8yjl54yDNaby4BieT2Q/kN2YZRz60l
 ENgwwhwj8QBMgBHmTN7LR6w2sVdvxr29pVuo18PoC1A6wvQoLpvXPRvbi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593379"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593379"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869637"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:46 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Tue, 16 Jan 2024 09:12:37 -0800
Message-Id: <20240116171237.118463-10-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
node list.
Add data struct to map register to a snapshot field, although all
field is mapped now, which means the offset could be optimized, while
in the future, depends on system configuration, the field might not be
consecutive. This is reserved for future.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c     |  99 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h     |  10 +++
 drivers/gpu/drm/xe/xe_hw_engine.c       |  73 ++++++++---------
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 103 ++++++++++++------------
 4 files changed, 195 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 52f1bacc08ff..d126d32875f9 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -169,6 +169,33 @@ static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
 	{}
 };
 
+struct __reg_map_descr capture_engine_reg[] = {
+	{offsetof(struct snap_shot_regs, ring_hwstam),			RING_HWSTAM(0)},
+	{offsetof(struct snap_shot_regs, ring_hws_pga),			RING_HWS_PGA(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_lo),	RING_EXECLIST_STATUS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_hi),	RING_EXECLIST_STATUS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_lo),	RING_EXECLIST_SQ_CONTENTS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_hi),	RING_EXECLIST_SQ_CONTENTS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_start),			RING_START(0)},
+	{offsetof(struct snap_shot_regs, ring_head),			RING_HEAD(0)},
+	{offsetof(struct snap_shot_regs, ring_tail),			RING_TAIL(0)},
+	{offsetof(struct snap_shot_regs, ring_ctl),			RING_CTL(0)},
+	{offsetof(struct snap_shot_regs, ring_mi_mode),			RING_MI_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_mode),			RING_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_imr),			RING_IMR(0)},
+	{offsetof(struct snap_shot_regs, ring_esr),			RING_ESR(0)},
+	{offsetof(struct snap_shot_regs, ring_emr),			RING_EMR(0)},
+	{offsetof(struct snap_shot_regs, ring_eir),			RING_EIR(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd_udw),		RING_ACTHD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd),			RING_ACTHD(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr_udw),		RING_BBADDR_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr),			RING_BBADDR(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd_udw),		RING_DMA_FADD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd),		RING_DMA_FADD(0)},
+	{offsetof(struct snap_shot_regs, ipehr),			RING_IPEHR(0)},
+	{offsetof(struct snap_shot_regs, rcu_mode),			RCU_MODE},
+};
+
 static const char * capture_list_type_names [] = {
 	"Global",
 	"Class",
@@ -1304,4 +1331,74 @@ int xe_guc_capture_init(struct xe_guc *guc)
 	return 0;
 }
 
-#endif
\ No newline at end of file
+inline struct __reg_map_descr *xe_guc_capture_get_register_map(int *count)
+{
+	*count = ARRAY_SIZE(capture_engine_reg);
+	return capture_engine_reg;
+}
+
+static void cp_reg_to_snapshot(u32 offset, u32 value, struct snap_shot_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg); i++)
+		if (offset == capture_engine_reg[i].reg.addr) {
+			u32 *field = (u32 *)((uintptr_t)regs + capture_engine_reg[i].dst_offset);
+			*field = value;
+			return;
+		}
+}
+
+static void guc_capture_find_ecode(struct __guc_capture_parsed_output *node,
+				   struct xe_hw_engine_snapshot *snapshot)
+{
+	struct gcap_reg_list_info *reginfo;
+	struct guc_mmio_reg *regs;
+	int i;
+
+	if (!node)
+		return;
+
+	reginfo = node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
+	regs = reginfo->regs;
+	for (i = 0; i < reginfo->num_regs; i++)
+		cp_reg_to_snapshot(regs[i].offset, regs[i].value, &snapshot->reg);
+}
+
+/**
+ * xe_hw_engine_snapshot_from_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Xe HW Engine snapshot object to save data, copied from error capture
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_guc *guc = &gt->uc.guc;
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	if (!guc->capture)
+		return;
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on engine class and instance.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+		u32 hwe_guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+		if (n->eng_class == hwe_guc_class
+		    && n->eng_inst == hwe->instance) {
+			guc_capture_find_ecode(n, snapshot);
+			list_del(&n->link);
+			return;
+		}
+	}
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index efa4f177aab5..9f48e2d752d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -14,6 +14,11 @@ struct xe_hw_engine;
 struct xe_gt;
 struct xe_guc;
 
+struct __reg_map_descr {
+	u32 dst_offset;
+	struct xe_reg reg;
+};
+
 bool xe_guc_capture_is_matching_engine(struct xe_gt *gt, struct xe_exec_queue *ce,
 				       struct xe_hw_engine *engine);
 void xe_guc_capture_process(struct xe_guc *guc);
@@ -21,5 +26,10 @@ int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
 int xe_guc_capture_init(struct xe_guc *guc);
+struct __reg_map_descr *xe_guc_capture_get_register_map(int *count);
+void xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe,
+					struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot);
 
 #endif /* _XE_GUC_CAPTURE_H */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index f56d301078b2..281afb564777 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -17,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_capture.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -739,6 +740,30 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
+/**
+ * xe_hw_engine_snapshot_from_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Point to the Xe HW Engine snapshot object to save data.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	int count, i;
+	struct __reg_map_descr *map = xe_guc_capture_get_register_map(&count);
+
+	for (i = 0; i < count; i++) {
+		u32 *field = (u32 *)((uintptr_t)&snapshot->reg + map[i].dst_offset);
+		*field = hw_engine_mmio_read32(hwe, map[i].reg);
+	}
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -775,46 +800,16 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
-							   RING_HWS_PGA(0));
-	snapshot->reg.ring_execlist_status_lo =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	snapshot->reg.ring_execlist_status_hi =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents_lo =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_LO(0));
-	snapshot->reg.ring_execlist_sq_contents_hi =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
-	snapshot->reg.ring_head =
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
-	snapshot->reg.ring_tail =
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
-	snapshot->reg.ring_mi_mode =
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ring_acthd_udw =
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	snapshot->reg.ring_bbaddr_udw =
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	snapshot->reg.ring_dma_fadd_udw =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+	if (xe_device_uc_enabled(gt_to_xe(hwe->gt)))
+		xe_hw_engine_snapshot_from_capture(hwe, snapshot);
+	else
+#endif
+		xe_hw_engine_snapshot_from_engine(hwe, snapshot);
 
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+	/* appy mask for ring head and tail */
+	snapshot->reg.ring_head &= HEAD_ADDR;
+	snapshot->reg.ring_tail &= TAIL_ADDR;
 
 	return snapshot;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index c258228b244f..0d0881f1d53b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -153,6 +153,58 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 };
 
+/** @reg: Useful MMIO register snapshot */
+struct snap_shot_regs {
+	/** @ring_hwstam: RING_HWSTAM */
+	u32 ring_hwstam;
+	/** @ring_hws_pga: RING_HWS_PGA */
+	u32 ring_hws_pga;
+	/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+	u32 ring_execlist_status_lo;
+	/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+	u32 ring_execlist_status_hi;
+	/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+	u32 ring_execlist_sq_contents_lo;
+	/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+	u32 ring_execlist_sq_contents_hi;
+	/** @ring_start: RING_START */
+	u32 ring_start;
+	/** @ring_head: RING_HEAD */
+	u32 ring_head;
+	/** @ring_tail: RING_TAIL */
+	u32 ring_tail;
+	/** @ring_ctl: RING_CTL */
+	u32 ring_ctl;
+	/** @ring_mi_mode: RING_MI_MODE */
+	u32 ring_mi_mode;
+	/** @ring_mode: RING_MODE */
+	u32 ring_mode;
+	/** @ring_imr: RING_IMR */
+	u32 ring_imr;
+	/** @ring_esr: RING_ESR */
+	u32 ring_esr;
+	/** @ring_emr: RING_EMR */
+	u32 ring_emr;
+	/** @ring_eir: RING_EIR */
+	u32 ring_eir;
+	/** @ring_acthd_udw: RING_ACTHD_UDW */
+	u32 ring_acthd_udw;
+	/** @ring_acthd: RING_ACTHD */
+	u32 ring_acthd;
+	/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+	u32 ring_bbaddr_udw;
+	/** @ring_bbaddr: RING_BBADDR */
+	u32 ring_bbaddr;
+	/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+	u32 ring_dma_fadd_udw;
+	/** @ring_dma_fadd: RING_DMA_FADD */
+	u32 ring_dma_fadd;
+	/** @ipehr: IPEHR */
+	u32 ipehr;
+	/** @rcu_mode: RCU_MODE */
+	u32 rcu_mode;
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -175,56 +227,7 @@ struct xe_hw_engine_snapshot {
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
-	struct {
-		/** @ring_hwstam: RING_HWSTAM */
-		u32 ring_hwstam;
-		/** @ring_hws_pga: RING_HWS_PGA */
-		u32 ring_hws_pga;
-		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
-		u32 ring_execlist_status_lo;
-		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
-		u32 ring_execlist_status_hi;
-		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
-		u32 ring_execlist_sq_contents_lo;
-		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
-		u32 ring_execlist_sq_contents_hi;
-		/** @ring_start: RING_START */
-		u32 ring_start;
-		/** @ring_head: RING_HEAD */
-		u32 ring_head;
-		/** @ring_tail: RING_TAIL */
-		u32 ring_tail;
-		/** @ring_ctl: RING_CTL */
-		u32 ring_ctl;
-		/** @ring_mi_mode: RING_MI_MODE */
-		u32 ring_mi_mode;
-		/** @ring_mode: RING_MODE */
-		u32 ring_mode;
-		/** @ring_imr: RING_IMR */
-		u32 ring_imr;
-		/** @ring_esr: RING_ESR */
-		u32 ring_esr;
-		/** @ring_emr: RING_EMR */
-		u32 ring_emr;
-		/** @ring_eir: RING_EIR */
-		u32 ring_eir;
-		/** @ring_acthd_udw: RING_ACTHD_UDW */
-		u32 ring_acthd_udw;
-		/** @ring_acthd: RING_ACTHD */
-		u32 ring_acthd;
-		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
-		u32 ring_bbaddr_udw;
-		/** @ring_bbaddr: RING_BBADDR */
-		u32 ring_bbaddr;
-		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
-		u32 ring_dma_fadd_udw;
-		/** @ring_dma_fadd: RING_DMA_FADD */
-		u32 ring_dma_fadd;
-		/** @ipehr: IPEHR */
-		u32 ipehr;
-		/** @rcu_mode: RCU_MODE */
-		u32 rcu_mode;
-	} reg;
+	struct snap_shot_regs reg;
 };
 
 #endif
-- 
2.34.1

