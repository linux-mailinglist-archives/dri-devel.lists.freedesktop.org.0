Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A935ABB3E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCC610E94F;
	Fri,  2 Sep 2022 23:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6834610E93C;
 Fri,  2 Sep 2022 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161594; x=1693697594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h7GEOK9MlrOioZFRBSZgaYnqTyURvVNjcR9vnoLOXCA=;
 b=SIhMXwnmZfI03TO4v8FnHHYeNRfGYQd+4qHEv+376rgcF8Py8J2XGPir
 dFJix9Owi8vjsMwOsqReCwjpwviRhqI7n5skG2yD+KUHJhly/q62kGK2m
 qXfsG6Ma83r3/y8U8COY94qJ8kcXTJgv2kTVb6FCWdmuzDttLSJV5Vz00
 QGUvMu/qBiIlOwkx8Y2gbUCdytz9BcEzezPVz23dvZJreGtBdBKaayTQ/
 h8+oYuK/O5U8zYfiDNoEnLLlFVGEeGMhOZwM1EerOZchY6qBwtJsTDnL1
 Jzr1o5gK3h/dVILVlPDz8V5VD47I7gksbrNFLoTZ1S4GGCypEUrHJYUOv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="279123430"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="279123430"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464210"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/12] drm/i915/xelpmp: Expose media as another GT
Date: Fri,  2 Sep 2022 16:32:55 -0700
Message-Id: <20220902233257.3088492-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_LPM+ platforms have "standalone media."  I.e., the media unit is
designed as an additional GT with its own engine list, GuC, forcewake,
etc.  Let's allow platforms to include media GTs in their device info.

v2:
 - Simplify GSI register handling and split it out to a separate patch
   for ease of review.  (Daniele)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  8 +++++
 drivers/gpu/drm/i915/gt/intel_sa_media.c | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h | 15 +++++++++
 drivers/gpu/drm/i915/i915_pci.c          | 15 +++++++++
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 drivers/gpu/drm/i915/intel_uncore.c      |  4 +++
 7 files changed, 83 insertions(+)
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
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index d414785003cc..fb2c56777480 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1578,4 +1578,12 @@
 
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
index 26b25d9434d6..18d3722331e4 100644
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
@@ -1115,6 +1118,17 @@ static const struct intel_device_info pvc_info = {
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
@@ -1128,6 +1142,7 @@ static const struct intel_device_info mtl_info = {
 	.media.ver = 13,
 	PLATFORM(INTEL_METEORLAKE),
 	.display.has_modular_fia = 1,
+	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 85e0ef0e91b1..7b6d5341b34b 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -248,6 +248,7 @@ struct intel_runtime_info {
 enum intel_gt_type {
 	GT_PRIMARY,
 	GT_TILE,
+	GT_MEDIA,
 };
 
 struct intel_gt_definition {
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index ecb02421502d..94fbc8cd986a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2271,6 +2271,10 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 
 void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
 {
+	/* The media GT re-uses the primary GT's register mapping */
+	if (uncore->gt->type == GT_MEDIA)
+		return;
+
 	iounmap(uncore->regs);
 }
 
-- 
2.37.2

