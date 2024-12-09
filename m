Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F599E9702
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3297710E736;
	Mon,  9 Dec 2024 13:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOBB03GF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E419210E74A;
 Mon,  9 Dec 2024 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751193; x=1765287193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNM6oQlSauXXuILxxXcsInHRqIDZ2PUMt45iwjx3+6c=;
 b=VOBB03GFjXA08IoeLdzXfU+XYMFtuZBAN8PIfkkAcmevzZkMOx1xOnk2
 PmIt+B0FJLrd+b/FMY14kvRaOqwB6a/0LKoOCCW8tUsh/Q1E0wkscxROD
 L9uDaEF8AidDyVAqo2t2EnZbF0gxHX46WfnWmANiO7r5cBbybdUXpuxLL
 5XZPdWJdNw4Y9PmBA2tDVDq6wLMm9IyHA8HBwwVgQ2kQc2WKevWuNm5HY
 5wPRNzniCUbnRvu7BleyJpPLqd6+XCM1RxEAdVGNcYZB2Hj85HcLWIJJL
 rl3LtW7J93dpBBItAJY5VgqUOQdEXuBl6hEgV5MS51aFfb0wp/aQ1RKlt g==;
X-CSE-ConnectionGUID: cbuZjH2JQz+XYMUm6uVU+Q==
X-CSE-MsgGUID: eLdRAAqNRYuYgU6UPCar8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34191954"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34191954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:12 -0800
X-CSE-ConnectionGUID: TCpWUaxSTlOG9xQMY9Sr9w==
X-CSE-MsgGUID: l0e5TdlATTKLKM5vKpxbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531270"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:11 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/26] drm/xe/eudebug: hw enablement for eudebug
Date: Mon,  9 Dec 2024 15:32:57 +0200
Message-ID: <20241209133318.1806472-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
and some other registers needs to be programmed. Implement eudebug
mode enabling including eudebug related workarounds.

v2: Move workarounds to xe_wa_oob. Use reg_sr directly instead of
xe_rtp as it suits better for dynamic manipulation of those register we
do later in the series.
v3: get rid of undefining XE_MCR_REG (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 10 +++++
 drivers/gpu/drm/xe/xe_eudebug.c          | 49 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h          |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 +
 6 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7c78496e6213..e45c4d5378e5 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -115,6 +115,10 @@
 
 #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
 
+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
+#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
+#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 162f18e975da..cd8c49a9000f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -455,6 +455,14 @@
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
+#define TD_CTL					XE_REG_MCR(0xe400)
+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
+
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
@@ -481,11 +489,13 @@
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 #define   EARLY_EOT_DIS				REG_BIT(1)
+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index cbcf7a72fdba..fecb7c8a9779 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -10,13 +10,21 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
+
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
+#include "xe_reg_sr.h"
+#include "xe_rtp.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /*
  * If there is no detected event read by userspace, during this period, assume
@@ -947,6 +955,47 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static void add_sr_entry(struct xe_hw_engine *hwe,
+			 struct xe_reg_mcr mcr_reg,
+			 u32 mask)
+{
+	const struct xe_reg_sr_entry sr_entry = {
+		.reg = mcr_reg.__reg,
+		.clr_bits = mask,
+		.set_bits = mask,
+		.read_mask = mask,
+	};
+
+	xe_reg_sr_add(&hwe->reg_sr, &sr_entry, hwe->gt);
+}
+
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->eudebug.available)
+		return;
+
+	if (!xe_rtp_match_first_render_or_compute(gt, hwe))
+		return;
+
+	if (XE_WA(gt, 18022722726))
+		add_sr_entry(hwe, ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
+
+	if (XE_WA(gt, 14015474168))
+		add_sr_entry(hwe, ROW_CHICKEN2, XEHPC_DISABLE_BTB);
+
+	if (xe->info.graphics_verx100 >= 1200)
+		add_sr_entry(hwe, TD_CTL,
+			     TD_CTL_BREAKPOINT_ENABLE |
+			     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+			     TD_CTL_FEH_AND_FEE_ENABLE);
+
+	if (xe->info.graphics_verx100 >= 1250)
+		add_sr_entry(hwe, TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE);
+}
+
 void xe_eudebug_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->eudebug.lock);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 326ddbd50651..3cd6bc7bb682 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -11,6 +11,7 @@ struct xe_device;
 struct xe_file;
 struct xe_vm;
 struct xe_exec_queue;
+struct xe_hw_engine;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -20,6 +21,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 void xe_eudebug_init(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
@@ -38,6 +40,7 @@ static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 static inline void xe_eudebug_init(struct xe_device *xe) { }
 static inline void xe_eudebug_fini(struct xe_device *xe) { }
+static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe) { }
 
 static inline void xe_eudebug_file_open(struct xe_file *xef) { }
 static inline void xe_eudebug_file_close(struct xe_file *xef) { }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c..8a188ddc99f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -16,6 +16,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
@@ -558,6 +559,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
+	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 3ed12a85cc60..cc2f28663072 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -42,3 +42,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
+14015474168	PLATFORM(PVC)
-- 
2.43.0

