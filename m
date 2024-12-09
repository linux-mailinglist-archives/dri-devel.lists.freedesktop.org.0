Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A389E9716
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168110E76B;
	Mon,  9 Dec 2024 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8B21MjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8647010E740;
 Mon,  9 Dec 2024 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751218; x=1765287218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mBWGMUlMSlsOjWsvtMpSZ/thOHKnwzkWJWBYWExdDU=;
 b=W8B21MjKvPasLu27Cl9yxzTetXVQ3YvloIophrTYkbCt8CkzS+fvT/F+
 PF/Rmm6ugJz+jIWfIJTuJ2olBeHfODmuHfLujRyFwDiaAqBvuD0LnWp8q
 dgsRp8Ar9Aes8vzkGQFp7noYGkZSEeRJ+vxo4LpA5JBFZB6039K2M04ku
 KLtxWY7aGAzAqkBMnvueSA61wG7yXht0dCN9Cnwind9/SJkXQWNCDRPOM
 sDJ5xfQ9CjOtlmwRj8fCopLuJHEOye5fF+S4bTtuqBbQvfWh1BE/cWM/b
 6W5vW2nSf+XwKGXIee7W8IUpcyHghHtKhSbgTJSuVE2LxEDQi8PVoc2c2 w==;
X-CSE-ConnectionGUID: 0s9zO6ikRdO84BvR/hn5lQ==
X-CSE-MsgGUID: 3paQHqODSTa6w7En0cZY0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192155"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:38 -0800
X-CSE-ConnectionGUID: W6CyEpZARCKliAYMf8w/BQ==
X-CSE-MsgGUID: TF0aPbwsQmOTgYac8SzVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531361"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:37 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 20/26] drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
Date: Mon,  9 Dec 2024 15:33:11 +0200
Message-ID: <20241209133318.1806472-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Introduce kunit test for eudebug. For now it checks the dynamic
application of WAs.

v2: adapt to removal of call_for_each_device (Mika)
v3: s/FW_RENDER/FORCEWAKE_ALL (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug.c       | 176 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
new file mode 100644
index 000000000000..d47e4ff259cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/visibility.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+#include "tests/xe_test.h"
+
+#undef XE_REG_MCR
+#define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
+				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
+				 })
+
+static const char *reg_to_str(struct xe_reg reg)
+{
+	if (reg.raw == TD_CTL.__reg.raw)
+		return "TD_CTL";
+	else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw)
+		return "CS_DEBUG_MODE2";
+	else if (reg.raw == ROW_CHICKEN.__reg.raw)
+		return "ROW_CHICKEN";
+	else if (reg.raw == ROW_CHICKEN2.__reg.raw)
+		return "ROW_CHICKEN2";
+	else if (reg.raw == ROW_CHICKEN3.__reg.raw)
+		return "ROW_CHICKEN3";
+	else
+		return "UNKNOWN REG";
+}
+
+static u32 get_reg_mask(struct xe_device *xe, struct xe_reg reg)
+{
+	struct kunit *test = kunit_get_current_test();
+	u32 val = 0;
+
+	if (reg.raw == TD_CTL.__reg.raw) {
+		val = TD_CTL_BREAKPOINT_ENABLE |
+		      TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+		      TD_CTL_FEH_AND_FEE_ENABLE;
+
+		if (GRAPHICS_VERx100(xe) >= 1250)
+			val |= TD_CTL_GLOBAL_DEBUG_ENABLE;
+
+	} else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw) {
+		val = GLOBAL_DEBUG_ENABLE;
+	} else if (reg.raw == ROW_CHICKEN.__reg.raw) {
+		val = STALL_DOP_GATING_DISABLE;
+	} else if (reg.raw == ROW_CHICKEN2.__reg.raw) {
+		val = XEHPC_DISABLE_BTB;
+	} else if (reg.raw == ROW_CHICKEN3.__reg.raw) {
+		val = XE2_EUPEND_CHK_FLUSH_DIS;
+	} else {
+		kunit_warn(test, "Invalid register selection: %u\n", reg.raw);
+	}
+
+	return val;
+}
+
+static u32 get_reg_expected(struct xe_device *xe, struct xe_reg reg, bool enable_eudebug)
+{
+	u32 reg_mask = get_reg_mask(xe, reg);
+	u32 reg_bits = 0;
+
+	if (enable_eudebug || reg.raw == ROW_CHICKEN3.__reg.raw)
+		reg_bits = reg_mask;
+	else
+		reg_bits = 0;
+
+	return reg_bits;
+}
+
+static void check_reg(struct xe_gt *gt, bool enable_eudebug, struct xe_reg reg)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 reg_bits_expected = get_reg_expected(xe, reg, enable_eudebug);
+	u32 reg_mask = get_reg_mask(xe, reg);
+	u32 reg_bits = 0;
+
+	if (reg.mcr)
+		reg_bits = xe_gt_mcr_unicast_read_any(gt, (struct xe_reg_mcr){.__reg = reg});
+	else
+		reg_bits = xe_mmio_read32(&gt->mmio, reg);
+
+	reg_bits &= reg_mask;
+
+	kunit_printk(KERN_DEBUG, test, "%s bits: expected == 0x%x; actual == 0x%x\n",
+		     reg_to_str(reg), reg_bits_expected, reg_bits);
+	KUNIT_EXPECT_EQ_MSG(test, reg_bits_expected, reg_bits,
+			    "Invalid bits set for %s\n", reg_to_str(reg));
+}
+
+static void __check_regs(struct xe_gt *gt, bool enable_eudebug)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (GRAPHICS_VERx100(xe) >= 1200)
+		check_reg(gt, enable_eudebug, TD_CTL.__reg);
+
+	if (GRAPHICS_VERx100(xe) >= 1250 && GRAPHICS_VERx100(xe) <= 1274)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN.__reg);
+
+	if (xe->info.platform == XE_PVC)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN2.__reg);
+
+	if (GRAPHICS_VERx100(xe) >= 2000 && GRAPHICS_VERx100(xe) <= 2004)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN3.__reg);
+}
+
+static void check_regs(struct xe_device *xe, bool enable_eudebug)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_gt *gt;
+	unsigned int fw_ref;
+	u8 id;
+
+	kunit_printk(KERN_DEBUG, test, "Check regs for eudebug %s\n",
+		     enable_eudebug ? "enabled" : "disabled");
+
+	xe_pm_runtime_get(xe);
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
+
+		/* XXX: Figure out per platform proper domain */
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		KUNIT_ASSERT_TRUE_MSG(test, fw_ref, "Forcewake failed.\n");
+
+		__check_regs(gt, enable_eudebug);
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+	xe_pm_runtime_put(xe);
+}
+
+static int toggle_reg_value(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	bool enable_eudebug = xe->eudebug.enable;
+
+	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
+		     GRAPHICS_VERx100(xe));
+
+	check_regs(xe, enable_eudebug);
+
+	xe_eudebug_enable(xe, !enable_eudebug);
+	check_regs(xe, !enable_eudebug);
+
+	xe_eudebug_enable(xe, enable_eudebug);
+	check_regs(xe, enable_eudebug);
+
+	return 0;
+}
+
+static void xe_eudebug_toggle_reg_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	toggle_reg_value(xe);
+}
+
+static struct kunit_case xe_eudebug_tests[] = {
+	KUNIT_CASE_PARAM(xe_eudebug_toggle_reg_kunit,
+			 xe_pci_live_device_gen_param),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_eudebug_test_suite = {
+	.name = "xe_eudebug",
+	.test_cases = xe_eudebug_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_eudebug_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 5f14737c8210..7dd8a0a4bdfd 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -15,6 +15,11 @@ kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+extern struct kunit_suite xe_eudebug_test_suite;
+kunit_test_suite(xe_eudebug_test_suite);
+#endif
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index fe947d5350d8..f44cc0f8290e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3947,3 +3947,7 @@ xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
 
 	return ret;
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug.c"
+#endif
-- 
2.43.0

