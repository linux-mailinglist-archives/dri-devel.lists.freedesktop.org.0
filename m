Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E155A539A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8509F10EB2B;
	Mon, 29 Aug 2022 17:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC4C10EAF5;
 Mon, 29 Aug 2022 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661795691; x=1693331691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UMOURsdnUfMSGZHwGA5+gszk2jpH4dgKT2MsY00upp0=;
 b=hZowXrFbqzrXGNOmeL/PseO2co+BeOmF+4csGpwx63Y1ZVApcyeE9A22
 SuCPnYeOiNSlpm3gPas6QQz4I270ZDllUExpsoM7GgI3xp24/pPLtldIC
 WnSVIGjxzKhPWov6gKNZ65d8hDrd6akQPmJM/BsLdnaQai/93MOSGWDIV
 mPTVoQACpnLKfRlwuoIokNVDnWIh2gnIwPGR80L55ad6tTT4NEQ6SaELI
 maW7xGN2jAVuJd6tSVtKR0iQEo8avTVQSOfGoY3LZ6FPaolsBBdiwM+W0
 b+ul5DIw0oW8e1xMP75NLpPNWqRaZS73Sri7WxHc7OCR52pXQ4tyEm5GI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381246665"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; d="scan'208";a="381246665"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="562297223"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915/xelpmp: Expose media as another GT
Date: Mon, 29 Aug 2022 10:02:36 -0700
Message-Id: <20220829170238.969875-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829170238.969875-1-matthew.d.roper@intel.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_LPM+ platforms have "standalone media."  I.e., the media unit is
designed as an additional GT with its own engine list, GuC, forcewake,
etc.  Let's allow platforms to include media GTs in their device info.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.c       | 12 ++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  8 +++++
 drivers/gpu/drm/i915/gt/intel_sa_media.c | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h | 15 +++++++++
 drivers/gpu/drm/i915/i915_pci.c          | 15 +++++++++
 drivers/gpu/drm/i915/intel_device_info.h |  5 ++-
 drivers/gpu/drm/i915/intel_uncore.c      | 16 ++++++++--
 drivers/gpu/drm/i915/intel_uncore.h      | 20 ++++++++++--
 9 files changed, 123 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 522ef9b4aff3..e83e4cd46968 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -123,6 +123,7 @@ gt-y += \
 	gt/intel_ring.o \
 	gt/intel_ring_submission.o \
 	gt/intel_rps.o \
+	gt/intel_sa_media.o \
 	gt/intel_sseu.o \
 	gt/intel_sseu_debugfs.o \
 	gt/intel_timeline.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index d21ec11346a5..2a29502289cb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -776,10 +776,15 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
 	}
 }
 
-static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
+static int intel_gt_tile_setup(struct intel_gt *gt,
+			       phys_addr_t phys_addr,
+			       u32 gsi_offset)
 {
 	int ret;
 
+	/* GSI offset is only applicable for media GTs */
+	drm_WARN_ON(&gt->i915->drm, gsi_offset);
+
 	if (!gt_is_root(gt)) {
 		struct intel_uncore *uncore;
 
@@ -832,7 +837,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
 
 	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
-	ret = intel_gt_tile_setup(gt, phys_addr);
+	ret = intel_gt_tile_setup(gt, phys_addr, 0);
 	if (ret)
 		return ret;
 
@@ -862,7 +867,8 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 			goto err;
 		}
 
-		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
+		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base,
+				   gtdef->gsi_offset);
 		if (ret)
 			goto err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 94f9ddcfb3a5..05a40ef33258 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1576,4 +1576,12 @@
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
+/*
+ * Standalone Media's non-engine GT registers are located at their regular GT
+ * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
+ * structure so that the existing code can be used for both GTs without
+ * modification.
+ */
+#define MTL_MEDIA_GSI_BASE			0x380000
+
 #endif /* __INTEL_GT_REGS__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
new file mode 100644
index 000000000000..8c5c519457cc
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "i915_drv.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_sa_media.h"
+
+int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
+			   u32 gsi_offset)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_uncore *uncore;
+
+	uncore = drmm_kzalloc(&i915->drm, sizeof(*uncore), GFP_KERNEL);
+	if (!uncore)
+		return -ENOMEM;
+
+	uncore->gsi_offset = gsi_offset;
+
+	intel_gt_common_init_early(gt);
+	intel_uncore_init_early(uncore, gt);
+
+	/*
+	 * Standalone media shares the general MMIO space with the primary
+	 * GT.  We'll re-use the primary GT's mapping.
+	 */
+	uncore->regs = i915->uncore.regs;
+	if (drm_WARN_ON(&i915->drm, uncore->regs == NULL))
+		return -EIO;
+
+	gt->uncore = uncore;
+	gt->phys_addr = phys_addr;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.h b/drivers/gpu/drm/i915/gt/intel_sa_media.h
new file mode 100644
index 000000000000..3afb310de932
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+#ifndef __INTEL_SA_MEDIA__
+#define __INTEL_SA_MEDIA__
+
+#include <linux/types.h>
+
+struct intel_gt;
+
+int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
+			   u32 gsi_offset);
+
+#endif /* __INTEL_SA_MEDIA_H__ */
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 857e8bb6865c..7183778a69c2 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -26,6 +26,9 @@
 #include <drm/drm_drv.h>
 #include <drm/i915_pciids.h>
 
+#include "gt/intel_gt_regs.h"
+#include "gt/intel_sa_media.h"
+
 #include "i915_driver.h"
 #include "i915_drv.h"
 #include "i915_pci.h"
@@ -1114,6 +1117,17 @@ static const struct intel_device_info pvc_info = {
 	.display.has_cdclk_crawl = 1, \
 	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
 
+static const struct intel_gt_definition xelpmp_extra_gt[] = {
+	{
+		.type = GT_MEDIA,
+		.name = "Standalone Media GT",
+		.setup = intel_sa_mediagt_setup,
+		.gsi_offset = MTL_MEDIA_GSI_BASE,
+		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
+	},
+	{}
+};
+
 __maybe_unused
 static const struct intel_device_info mtl_info = {
 	XE_HP_FEATURES,
@@ -1127,6 +1141,7 @@ static const struct intel_device_info mtl_info = {
 	.media.ver = 13,
 	PLATFORM(INTEL_METEORLAKE),
 	.display.has_modular_fia = 1,
+	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index e0b79dc0fccc..eb4bcf65e91e 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -247,14 +247,17 @@ struct intel_runtime_info {
 enum intel_gt_type {
 	GT_PRIMARY,
 	GT_TILE,
+	GT_MEDIA,
 };
 
 struct intel_gt_definition {
 	enum intel_gt_type type;
 	char *name;
 	int (*setup)(struct intel_gt *gt,
-		     phys_addr_t phys_addr);
+		     phys_addr_t phys_addr,
+		     u32 gsi_offset);
 	u32 mapping_base;
+	u32 gsi_offset;
 	intel_engine_mask_t engine_mask;
 };
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 6841f76533f9..be88fb95cb45 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1780,10 +1780,15 @@ __gen2_read(64)
 #undef GEN2_READ_FOOTER
 #undef GEN2_READ_HEADER
 
+#define IS_GSI_REG(reg) ((reg) < 0x40000)
+
 #define GEN6_READ_HEADER(x) \
-	u32 offset = i915_mmio_reg_offset(reg); \
+	u32 offset; \
 	unsigned long irqflags; \
 	u##x val = 0; \
+	if (IS_GSI_REG(reg.reg)) \
+		reg.reg += uncore->gsi_offset; \
+	offset = i915_mmio_reg_offset(reg); \
 	assert_rpm_wakelock_held(uncore->rpm); \
 	spin_lock_irqsave(&uncore->lock, irqflags); \
 	unclaimed_reg_debug(uncore, reg, true, true)
@@ -1885,8 +1890,11 @@ __gen2_write(32)
 #undef GEN2_WRITE_HEADER
 
 #define GEN6_WRITE_HEADER \
-	u32 offset = i915_mmio_reg_offset(reg); \
+	u32 offset; \
 	unsigned long irqflags; \
+	if (IS_GSI_REG(reg.reg)) \
+		reg.reg += uncore->gsi_offset; \
+	offset = i915_mmio_reg_offset(reg); \
 	trace_i915_reg_rw(true, reg, val, sizeof(val), trace); \
 	assert_rpm_wakelock_held(uncore->rpm); \
 	spin_lock_irqsave(&uncore->lock, irqflags); \
@@ -2265,6 +2273,10 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 
 void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
 {
+	/* The media GT re-uses the primary GT's register mapping */
+	if (uncore->gt->type == GT_MEDIA)
+		return;
+
 	iounmap(uncore->regs);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 6100d0f4498a..1b7311a4b98b 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -135,6 +135,16 @@ struct intel_uncore {
 
 	spinlock_t lock; /** lock is also taken in irq contexts. */
 
+	/*
+	 * Do we need to apply an additional offset to reach the beginning
+	 * of the basic non-engine GT registers (referred to as "GSI" on
+	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
+	 * track that here and apply it transparently to registers in the
+	 * appropriate range to maintain compatibility with our existing
+	 * register definitions and GT code.
+	 */
+	u32 gsi_offset;
+
 	unsigned int flags;
 #define UNCORE_HAS_FORCEWAKE		BIT(0)
 #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
@@ -298,14 +308,20 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
 static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
 					    i915_reg_t reg) \
 { \
-	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
+	u32 offset = i915_mmio_reg_offset(reg); \
+	if (offset < 0x40000) \
+		offset += uncore->gsi_offset; \
+	return read##s__(uncore->regs + offset); \
 }
 
 #define __raw_write(x__, s__) \
 static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
 					   i915_reg_t reg, u##x__ val) \
 { \
-	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
+	u32 offset = i915_mmio_reg_offset(reg); \
+	if (offset < 0x40000) \
+		offset += uncore->gsi_offset; \
+	write##s__(val, uncore->regs + offset); \
 }
 __raw_read(8, b)
 __raw_read(16, w)
-- 
2.37.2

