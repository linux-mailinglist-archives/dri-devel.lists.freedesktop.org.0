Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED382F2F7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685610E59D;
	Tue, 16 Jan 2024 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325C110E564;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CUpYnD24E0dv8yDqYfwBdxRz4+KdS7sfxVl5wTZnNLw=;
 b=g1BlnDY2FPBeOoYNnW41NcKsPwgoKHRmC1xSyX4KyPT3OVfpfWHBlvTH
 tpL5NJwV0314GbnfnJ3y6YFVMVsbCH9Xp9NM7iM+DSAW/cHl27wngMqPr
 5/+lCrUJZtmecSyrnSl3YbBjYht38Pg7MWk4IS5yxGPhnjfiOoKaohNCw
 MFdGD3MucJi/Q2VcYBpn+bW1WiS4aqGpNDhQLkqVB4lJbXH+KsTbK3Lyx
 HJHc6zET3pG2tCqcIhYkB79SzSyytwe+Dwikogb7hnhM1uiKSeUTuLY/c
 2T+jSjPExvZZ3QB9KjpghL3DBVDjfUwiKcGqUrpH2yEyUIcAZ0ANVROX6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593347"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869609"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:45 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Add register defines for GuC based register
 capture
Date: Tue, 16 Jan 2024 09:12:29 -0800
Message-Id: <20240116171237.118463-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add registers defines and list of registers for GuC based error state capture.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Kconfig               |  11 +++
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  12 +++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  20 +++++
 drivers/gpu/drm/xe/xe_guc.c              |   7 ++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 101 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |  19 +++++
 7 files changed, 171 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d7bffbba9674..b248fdf488ae 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -107,6 +107,17 @@ config DRM_XE_PRESI_PCI_DEVELOPMENT_MODE
 
 	  If in doubt, say "N".
 
+config DRM_XE_CAPTURE_ERROR
+	bool "Enable capturing GPU state following a hang"
+	depends on DRM_XE
+	default y
+	help
+	  This option enables capturing the GPU state when a hang is detected.
+	  This information is vital for triaging hangs and assists in debugging.
+	  Please report any hang to your Intel representative to help with triaging.
+
+	  If in doubt, say "Y".
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0292b79852a0..7e21d18f98ff 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -91,6 +91,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 48fc466e7050..cc581607be0e 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -64,10 +64,16 @@
 
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
+#define RING_IPEIR(base)			XE_REG((base) + 0x64)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
+#define RING_INSTPS(base)			XE_REG((base) + 0x70)
+
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
+#define IPEIR(base)				XE_REG((base) + 0x88)
+
 #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
@@ -110,9 +116,12 @@
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
+#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define CCID(base)				XE_REG((base) + 0x180)
+
 #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
 #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
 
@@ -128,6 +137,9 @@
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
+#define RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
+#define RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)
+
 #define RING_MODE(base)				XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 45d47c886b14..5eab86301b61 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -67,6 +67,8 @@
 #define VE1_AUX_INV				XE_REG(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
+#define AUX_ERR_DBG				XE_REG(0x43f4)
+
 #define _PAT_PTA                                0x4820
 #define   XE2_NO_PROMOTE			REG_BIT(10)
 #define   XE2_COMP_EN				REG_BIT(9)
@@ -109,6 +111,8 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
@@ -125,6 +129,10 @@
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
 #define   FD_END_COLLECT			REG_BIT(5)
 
+#define SC_INSTDONE				XE_REG(0x7100)
+#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
+#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
+
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -326,6 +334,11 @@
 
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
+#define FAULT_TLB_DATA0				XE_REG(0xceb8)
+#define FAULT_TLB_DATA1				XE_REG(0xcebc)
+
+#define RING_FAULT_REG				XE_REG(0xcec4)
+
 #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
@@ -349,6 +362,11 @@
 #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
 #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
 
+#define GAM_DONE				XE_REG(0xcf68)
+
+#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
+#define ROW_INSTDONE				XE_REG_MCR(0xe164)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
@@ -515,6 +533,8 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
+#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
+
 #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
 #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 215627a60c5c..b43d680bcdce 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -17,6 +17,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
@@ -264,6 +265,12 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+	ret = xe_guc_capture_init(guc);
+	if (ret)
+		goto out;
+#endif
+
 	ret = xe_guc_ads_init(&guc->ads);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
new file mode 100644
index 000000000000..8bf756fa34e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_abi.h"
+#include "regs/xe_regs.h"
+#include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_hw_engine_types.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_ct.h"
+
+#include "xe_guc_log.h"
+#include "xe_gt_mcr.h"
+#include "xe_guc_submit.h"
+#include "xe_macros.h"
+#include "xe_map.h"
+
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+
+/*
+ * Define all device tables of GuC error capture register lists
+ * NOTE: For engine-registers, GuC only needs the register offsets
+ *       from the engine-mmio-base
+ */
+#define COMMON_XELP_BASE_GLOBAL \
+	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }, \
+	{ FAULT_TLB_DATA0,	    0,      0, "FAULT_TLB_DATA0" }, \
+	{ FAULT_TLB_DATA1,	    0,      0, "FAULT_TLB_DATA1" }, \
+	{ AUX_ERR_DBG,		    0,      0, "AUX_ERR_DBG" }, \
+	{ GAM_DONE,		    0,      0, "GAM_DONE" }, \
+	{ RING_FAULT_REG,	    0,      0, "FAULT_REG" }
+
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
+	{ RING_ESR(0),              0,      0, "ESR" }, \
+	{ RING_EMR(0),              0,      0, "EMR" }, \
+	{ RING_EIR(0),              0,      0, "EIR" }, \
+	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
+	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
+	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
+	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
+	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
+	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
+	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
+	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
+	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
+	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
+	{ CCID(0),                  0,      0, "CCID" }, \
+	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
+	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
+	{ INSTPM(0),                0,      0, "INSTPM" }, \
+	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
+	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
+	{ RING_START(0),            0,      0, "START" }, \
+	{ RING_HEAD(0),             0,      0, "HEAD" }, \
+	{ RING_TAIL(0),             0,      0, "TAIL" }, \
+	{ RING_CTL(0),              0,      0, "CTL" }, \
+	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
+	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
+	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
+	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
+	{ RING_PDP_LDW(0, 0),	    0,      0, "PDP0_LDW" }, \
+	{ RING_PDP_UDW(0, 0),	    0,      0, "PDP0_UDW" }, \
+	{ RING_PDP_LDW(0, 1),	    0,      0, "PDP1_LDW" }, \
+	{ RING_PDP_UDW(0, 1),	    0,      0, "PDP1_UDW" }, \
+	{ RING_PDP_LDW(0, 2),	    0,      0, "PDP2_LDW" }, \
+	{ RING_PDP_UDW(0, 2),	    0,      0, "PDP2_UDW" }, \
+	{ RING_PDP_LDW(0, 3),	    0,      0, "PDP3_LDW" }, \
+	{ RING_PDP_UDW(0, 3),	    0,      0, "PDP3_UDW" }
+
+#define COMMON_XELP_BASE_RENDER \
+	{ SC_INSTDONE,		    0,      0, "SC_INSTDONE" }, \
+	{ SC_INSTDONE_EXTRA,	    0,      0, "SC_INSTDONE_EXTRA" }, \
+	{ SC_INSTDONE_EXTRA2,	    0,      0, "SC_INSTDONE_EXTRA2" }
+
+#define COMMON_XELP_BASE_VEC \
+	{ SFC_DONE(0),		    0,      0, "SFC_DONE[0]" }, \
+	{ SFC_DONE(1),		    0,      0, "SFC_DONE[1]" }, \
+	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
+	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
+
+int xe_guc_capture_init(struct xe_guc *guc)
+{
+	return 0;
+}
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
new file mode 100644
index 000000000000..35fedc78d9e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2021 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_H
+#define _XE_GUC_CAPTURE_H
+
+#include <linux/types.h>
+#include "xe_exec_queue_types.h"
+
+struct xe_hw_engine;
+
+struct xe_gt;
+struct xe_guc;
+
+int xe_guc_capture_init(struct xe_guc *guc);
+
+#endif /* _XE_GUC_CAPTURE_H */
-- 
2.34.1

