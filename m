Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0032ACC174
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BF410E6CD;
	Tue,  3 Jun 2025 07:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaKMXsdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA73A10E6D2;
 Tue,  3 Jun 2025 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748937020; x=1780473020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSTYgeN9vlLNUHmPD4LgWqOeW/t6Ap+WEZ4hqFUAN78=;
 b=RaKMXsddNI2tdoFrQswTuYGWztXjycj5TmPhMmSV9N5Mj63aHV7o7SLq
 GGJLg4R+2L+bAsr45zSkPqgUiWcsWHKMAGEbplykl1DvJYtQiX8zObuzE
 JyK840UOg/UX8xUC/B0Uh0JaWMWSKRYstq3qTlWKP7BNARkU0x7t+SpeT
 SvnmuLB6CsmD3dW8vAp6bpzmmISkUaEj2/E+hmtlSgfzd6vYkm4FQcED8
 y5024ElEDdVjgTrs+DJkgAhxw1F0rkAJalWs7n0xL4PqZr+4V/eW1kosr
 ua9z6CDBUXGfi46Rovjol8i4R2Txp2MyRNhUaqmiMb7BoVnlQTERc4b5W A==;
X-CSE-ConnectionGUID: NkHvlQdVSYGluHbJ/QUV5A==
X-CSE-MsgGUID: 1w7geNeoROqbEIbqedbqeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76356208"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="76356208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:19 -0700
X-CSE-ConnectionGUID: nHN9e4iVT7yEl2Vx9GUk2g==
X-CSE-MsgGUID: 6zxwQXcDQIe8TYIr9lXJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144671551"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, himal.prasad.ghimiray@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH 3/4] drm/xe: Add support to handle hardware errors
Date: Tue,  3 Jun 2025 13:43:59 +0530
Message-ID: <20250603081409.1509709-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250603081409.1509709-1-riana.tauro@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gfx device reports two classes of errors: uncorrectable and
correctable. Depending on the severity uncorrectable errors are
further classified as non fatal and fatal

Correctable and non-fatal errors are reported as MSI's and bits in
the Master Interrupt Register indicate the class of the error.
The source of the error is then read from the Device Error Source
Register. Fatal errors are reported as PCIe errors
When a PCIe error is asserted, the OS will perform a device warm reset
which causes the driver to reload. The error registers are sticky
and the values are maintained through a warm reset

Add basic support to handle these errors

Bspec: 50875, 53073, 53074, 53075, 53076

Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 108 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
 drivers/gpu/drm/xe/xe_irq.c                |   4 +
 6 files changed, 144 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4bf484d4121..29f4e64068b7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
+	xe_hw_error.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
new file mode 100644
index 000000000000..ed9b81fb28a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_HW_ERROR_REGS_H_
+#define _XE_HW_ERROR_REGS_H_
+
+#define DEV_ERR_STAT_NONFATAL			0x100178
+#define DEV_ERR_STAT_CORRECTABLE		0x10017c
+#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
+								  DEV_ERR_STAT_CORRECTABLE, \
+								  DEV_ERR_STAT_NONFATAL))
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index f0ecfcac4003..2758b64cec9e 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -18,6 +18,7 @@
 #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
+#define   ERROR_IRQ(x)				REG_BIT(26 + (x))
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
new file mode 100644
index 000000000000..0f2590839900
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "regs/xe_hw_error_regs.h"
+#include "regs/xe_irq_regs.h"
+
+#include "xe_device.h"
+#include "xe_hw_error.h"
+#include "xe_mmio.h"
+
+/* Error categories reported by hardware */
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+static const char *hw_error_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "CORRECTABLE";
+	case HARDWARE_ERROR_NONFATAL:
+		return "NONFATAL";
+	case HARDWARE_ERROR_FATAL:
+		return "FATAL";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hw_error_to_str(hw_err);
+	struct xe_device *xe = tile_to_xe(tile);
+	unsigned long flags;
+	u32 err_src;
+
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return;
+
+	spin_lock_irqsave(&xe->irq.lock, flags);
+	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
+	if (!err_src) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
+				    tile->id, hw_err_str);
+		goto unlock;
+	}
+
+	/* TODO: Process errrors per source */
+
+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
+
+unlock:
+	spin_unlock_irqrestore(&xe->irq.lock, flags);
+}
+
+/**
+ * xe_hw_error_irq_handler - irq handling for hw errors
+ * @tile: tile instance
+ * @master_ctl: value read from master interrupt register
+ *
+ * Xe platforms add three error bits to the master interrupt register to support error handling.
+ * These three bits are used to convey the class of error FATAL, NONFATAL, or CORRECTABLE.
+ * To process the interrupt, determine the source of error by reading the Device Error Source
+ * Register that corresponds to the class of error being serviced.
+ */
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
+{
+	enum hardware_error hw_err;
+
+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
+		if (master_ctl & ERROR_IRQ(hw_err))
+			hw_error_source_handler(tile, hw_err);
+}
+
+/*
+ * Process hardware errors during boot
+ */
+static void process_hw_errors(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u32 master_ctl;
+	u8 id;
+
+	for_each_tile(tile, xe, id) {
+		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
+		xe_hw_error_irq_handler(tile, master_ctl);
+		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
+	}
+}
+
+/**
+ * xe_hw_error_init - Initialize hw errors
+ * @xe: xe device instance
+ *
+ * Initialize and process hw errors
+ */
+void xe_hw_error_init(struct xe_device *xe)
+{
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+	process_hw_errors(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
new file mode 100644
index 000000000000..d86e28c5180c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef XE_HW_ERROR_H_
+#define XE_HW_ERROR_H_
+
+#include <linux/types.h>
+
+struct xe_tile;
+struct xe_device;
+
+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_hw_error_init(struct xe_device *xe);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5362d3174b06..24ccf3bec52c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -18,6 +18,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_hw_error.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_pxp.h"
@@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
@@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
 	int nvec = 1;
 	int err;
 
+	xe_hw_error_init(xe);
+
 	xe_irq_reset(xe);
 
 	if (xe_device_has_msix(xe)) {
-- 
2.47.1

