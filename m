Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E04DD4CD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 07:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E94210E939;
	Fri, 18 Mar 2022 06:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B9610E90E;
 Fri, 18 Mar 2022 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647585647; x=1679121647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F0Z9Q/Axmb5WqRkdh0WZ9qeYG7WyxIfaC5xvTs/F+i8=;
 b=WWKruZOBgwXIIIE7z1JWUzCsTfOdmdwrSxcZG/jCxVBMqGn8KXRtGfU4
 65IY1T7Y2KetioGBufX99oPLws5U9CmMjESdZfQd864W+RBpJWXypG/C9
 U3VhO4sRpQW47fXcrS0IKikDBG135QjyvbDBWSrQX4nAeUyW2F0oIWTo4
 BAX6gwSrhSTrRJq8lx6FxH7BUCOHQNNdxchxDOxgH7u6A4DDWsUg1k9gi
 3ZmopAo3FYFVbK1lRLiknDfm6E+Od0/wUbJQuBnN6XgQWzBgrxnZ40i0V
 SEWzCTdvZxTmgCppejtUhETrlWoTx/bY11XQutqH2Txog7ItMfUVUF61c w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="317787152"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="317787152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 23:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="691205019"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2022 23:40:29 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 05/13] drm/i915/guc: Add Gen9 registers for GuC error
 state capture.
Date: Thu, 17 Mar 2022 23:42:52 -0700
Message-Id: <20220318064300.1831909-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318064300.1831909-1-alan.previn.teres.alexis@intel.com>
References: <20220318064300.1831909-1-alan.previn.teres.alexis@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abstract out a Gen9 register list as the default for all other
platforms we don't yet formally support GuC submission on.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 82 +++++++++++++------
 1 file changed, 59 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 15fc36203463..f9612e45def6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -22,15 +22,24 @@
  * NOTE1: For engine-registers, GuC only needs the register offsets
  *        from the engine-mmio-base
  */
+#define COMMON_BASE_GLOBAL() \
+	{FORCEWAKE_MT,             0,      0, "FORCEWAKE"}
+
+#define COMMON_GEN9BASE_GLOBAL() \
+	{GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0"}, \
+	{GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1"}, \
+	{ERROR_GEN6,               0,      0, "ERROR_GEN6"}, \
+	{DONE_REG,                 0,      0, "DONE_REG"}, \
+	{HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN"}
+
 #define COMMON_GEN12BASE_GLOBAL() \
 	{GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0"}, \
 	{GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1"}, \
-	{FORCEWAKE_MT,             0,      0, "FORCEWAKE"}, \
 	{GEN12_AUX_ERR_DBG,        0,      0, "AUX_ERR_DBG"}, \
 	{GEN12_GAM_DONE,           0,      0, "GAM_DONE"}, \
 	{GEN12_RING_FAULT_REG,     0,      0, "FAULT_REG"}
 
-#define COMMON_GEN12BASE_ENGINE_INSTANCE() \
+#define COMMON_BASE_ENGINE_INSTANCE() \
 	{RING_PSMI_CTL(0),         0,      0, "RC PSMI"}, \
 	{RING_ESR(0),              0,      0, "ESR"}, \
 	{RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW"}, \
@@ -64,11 +73,13 @@
 	{GEN8_RING_PDP_LDW(0, 3),  0,      0, "PDP3_LDW"}, \
 	{GEN8_RING_PDP_UDW(0, 3),  0,      0, "PDP3_UDW"}
 
-#define COMMON_GEN12BASE_HAS_EU() \
+#define COMMON_BASE_HAS_EU() \
 	{EIR,                      0,      0, "EIR"}
 
+#define COMMON_BASE_RENDER() \
+	{GEN7_SC_INSTDONE,         0,      0, "GEN7_SC_INSTDONE"}
+
 #define COMMON_GEN12BASE_RENDER() \
-	{GEN7_SC_INSTDONE,         0,      0, "GEN7_SC_INSTDONE"}, \
 	{GEN12_SC_INSTDONE_EXTRA,  0,      0, "GEN12_SC_INSTDONE_EXTRA"}, \
 	{GEN12_SC_INSTDONE_EXTRA2, 0,      0, "GEN12_SC_INSTDONE_EXTRA2"}
 
@@ -80,28 +91,26 @@
 
 /* XE_LPD - Global */
 static const struct __guc_mmio_reg_descr xe_lpd_global_regs[] = {
+	COMMON_BASE_GLOBAL(),
+	COMMON_GEN9BASE_GLOBAL(),
 	COMMON_GEN12BASE_GLOBAL(),
 };
 
 /* XE_LPD - Render / Compute Per-Class */
 static const struct __guc_mmio_reg_descr xe_lpd_rc_class_regs[] = {
-	COMMON_GEN12BASE_HAS_EU(),
+	COMMON_BASE_HAS_EU(),
+	COMMON_BASE_RENDER(),
 	COMMON_GEN12BASE_RENDER(),
 };
 
-/* XE_LPD - Render / Compute Per-Engine-Instance */
+/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_lpd_rc_inst_regs[] = {
-	COMMON_GEN12BASE_ENGINE_INSTANCE(),
+	COMMON_BASE_ENGINE_INSTANCE(),
 };
 
-/* XE_LPD - Media Decode/Encode Per-Class */
-static const struct __guc_mmio_reg_descr xe_lpd_vd_class_regs[] = {
-	COMMON_GEN12BASE_ENGINE_INSTANCE(),
-};
-
-/* XE_LPD - Media Decode/Encode Per-Engine-Instance */
+/* GEN9/XE_LPD - Media Decode/Encode Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_lpd_vd_inst_regs[] = {
-	COMMON_GEN12BASE_ENGINE_INSTANCE(),
+	COMMON_BASE_ENGINE_INSTANCE(),
 };
 
 /* XE_LPD - Video Enhancement Per-Class */
@@ -109,18 +118,33 @@ static const struct __guc_mmio_reg_descr xe_lpd_vec_class_regs[] = {
 	COMMON_GEN12BASE_VEC(),
 };
 
-/* XE_LPD - Video Enhancement Per-Engine-Instance */
+/* GEN9/XE_LPD - Video Enhancement Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_lpd_vec_inst_regs[] = {
-	COMMON_GEN12BASE_ENGINE_INSTANCE(),
+	COMMON_BASE_ENGINE_INSTANCE(),
 };
 
-/* XE_LPD - Blitter Per-Engine-Instance */
+/* GEN9/XE_LPD - Blitter Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_lpd_blt_inst_regs[] = {
-	COMMON_GEN12BASE_ENGINE_INSTANCE(),
+	COMMON_BASE_ENGINE_INSTANCE(),
 };
 
-/* XE_LPD - Blitter Per-Class */
-/* XE_LPD - Media Decode/Encode Per-Class */
+/* GEN9 - Global */
+static const struct __guc_mmio_reg_descr default_global_regs[] = {
+	COMMON_BASE_GLOBAL(),
+	COMMON_GEN9BASE_GLOBAL(),
+};
+
+static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
+	COMMON_BASE_HAS_EU(),
+	COMMON_BASE_RENDER(),
+};
+
+/*
+ * Empty lists:
+ * GEN9/XE_LPD - Blitter Per-Class
+ * GEN9/XE_LPD - Media Decode/Encode Per-Class
+ * GEN9 - VEC Class
+ */
 static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 };
 
@@ -137,6 +161,19 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 	}
 
 /* List of lists */
+static struct __guc_mmio_reg_descr_group default_lists[] = {
+	MAKE_REGLIST(default_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
+	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(xe_lpd_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	{}
+};
+
 static const struct __guc_mmio_reg_descr_group xe_lpd_lists[] = {
 	MAKE_REGLIST(xe_lpd_global_regs, PF, GLOBAL, 0),
 	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
@@ -376,9 +413,8 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 		return xe_lpd_lists;
 	}
 
-	drm_warn(&i915->drm, "No GuC-capture register lists\n");
-
-	return NULL;
+	/* if GuC submission is enabled on a non-POR platform, just use a common baseline */
+	return default_lists;
 }
 
 static const char *
-- 
2.25.1

