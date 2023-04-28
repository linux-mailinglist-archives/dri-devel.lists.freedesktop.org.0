Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89E6F1E58
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6010EDA9;
	Fri, 28 Apr 2023 18:56:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF75110E15F;
 Fri, 28 Apr 2023 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708192; x=1714244192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bmzk1rN9tHvEChYvAcvBkJRXu3gRYELWDUrZhsd0zYM=;
 b=WBfdjmkr4ig0jhnJ5AONFqKotR6ffcvFP9KoazTLMPm5aKpJbCmYS7f0
 9TpzimBbwdgc0t6EouMdqKnk9g+jyNWt8T7nG9wyv/DKfGNTUVbr8+Dt5
 J3n9EWheRplZmTsFwfrlQGQx5M588jfIWI1EZownfJ69eEDjXkZqbmvQX
 QHsh8ez9xJkur5225HhYGD6VVk0AXlAb9zL2v7PpKPGQx5BMxCnzz8rsb
 kgand9/mcpq4WNaNgMJ1u6eaVuG1nv/ND+piP82k+gar0vKL0iErynJW9
 xL0r8+Hh1lcb8qcD0WZrq+HN+u3qNiIRpZNcfRnrR+m75O3y+PHussEKn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410934517"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="410934517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869291587"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="869291587"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 11:56:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/4] drm/i915/guc: Capture list naming clean up
Date: Fri, 28 Apr 2023 11:56:35 -0700
Message-Id: <20230428185636.457407-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230428185636.457407-1-John.C.Harrison@Intel.com>
References: <20230428185636.457407-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Don't use 'xe_lp*' prefixes for register lists that are common with
Gen8.

Don't add Xe only GSC registers to pre-Xe devices that don't
even have a GSC engine.

Fix Xe_LP name.

Don't use GEN9 as a prefix for register lists that contain all GEN8
registers.

Rename the 'default_' register list prefix to 'gen8_' as that is the
more accurate name.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 100 +++++++++---------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 9184d2595e4ce..729a8fcf20dda 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -30,12 +30,12 @@
 #define COMMON_BASE_GLOBAL \
 	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
 
-#define COMMON_GEN9BASE_GLOBAL \
+#define COMMON_GEN8BASE_GLOBAL \
 	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
 	{ DONE_REG,                 0,      0, "DONE_REG" }, \
 	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
 
-#define GEN9_GLOBAL \
+#define GEN8_GLOBAL \
 	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
 	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
 
@@ -96,67 +96,65 @@
 	{ GEN12_SFC_DONE(2),        0,      0, "SFC_DONE[2]" }, \
 	{ GEN12_SFC_DONE(3),        0,      0, "SFC_DONE[3]" }
 
-/* XE_LPD - Global */
-static const struct __guc_mmio_reg_descr xe_lpd_global_regs[] = {
+/* XE_LP Global */
+static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_BASE_GLOBAL,
-	COMMON_GEN9BASE_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
 	COMMON_GEN12BASE_GLOBAL,
 };
 
-/* XE_LPD - Render / Compute Per-Class */
-static const struct __guc_mmio_reg_descr xe_lpd_rc_class_regs[] = {
+/* XE_LP Render / Compute Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
 	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 	COMMON_GEN12BASE_RENDER,
 };
 
-/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_rc_inst_regs[] = {
+/* GEN8+ Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_rc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9/XE_LPD - Media Decode/Encode Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_vd_inst_regs[] = {
+/* GEN8+ Media Decode/Encode Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_vd_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* XE_LPD - Video Enhancement Per-Class */
-static const struct __guc_mmio_reg_descr xe_lpd_vec_class_regs[] = {
+/* XE_LP Video Enhancement Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_vec_class_regs[] = {
 	COMMON_GEN12BASE_VEC,
 };
 
-/* GEN9/XE_LPD - Video Enhancement Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_vec_inst_regs[] = {
+/* GEN8+ Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9/XE_LPD - Blitter Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_blt_inst_regs[] = {
+/* GEN8+ Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* XE_LPD - GSC Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
+/* XE_LP - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9 - Global */
-static const struct __guc_mmio_reg_descr default_global_regs[] = {
+/* GEN8 - Global */
+static const struct __guc_mmio_reg_descr gen8_global_regs[] = {
 	COMMON_BASE_GLOBAL,
-	COMMON_GEN9BASE_GLOBAL,
-	GEN9_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
+	GEN8_GLOBAL,
 };
 
-static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_rc_class_regs[] = {
 	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 };
 
 /*
- * Empty lists:
- * GEN9/XE_LPD - Blitter Per-Class
- * GEN9/XE_LPD - Media Decode/Encode Per-Class
- * GEN9 - VEC Class
+ * Empty list to prevent warnings about unknown class/instance types
+ * as not all class/instanace types have entries on all platforms.
  */
 static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 };
@@ -174,37 +172,37 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 	}
 
 /* List of lists */
-static const struct __guc_mmio_reg_descr_group default_lists[] = {
-	MAKE_REGLIST(default_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
+static const struct __guc_mmio_reg_descr_group gen8_lists[] = {
+	MAKE_REGLIST(gen8_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
-static const struct __guc_mmio_reg_descr_group xe_lpd_lists[] = {
-	MAKE_REGLIST(xe_lpd_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
+static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
-	MAKE_REGLIST(xe_lpd_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
@@ -366,9 +364,9 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	const struct __guc_mmio_reg_descr_group *lists;
 
 	if (GRAPHICS_VER(i915) >= 12)
-		lists = xe_lpd_lists;
+		lists = xe_lp_lists;
 	else
-		lists = default_lists;
+		lists = gen8_lists;
 
 	/*
 	 * For certain engine classes, there are slice and subslice
-- 
2.39.1

