Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37D611ADF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 21:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE69F10E8C1;
	Fri, 28 Oct 2022 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ADD10E8C1;
 Fri, 28 Oct 2022 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666985175; x=1698521175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=24fvs9LXF78691NX+x9vUuKpKdmmpuz6aosHYmb83CE=;
 b=jIi0mgrssqVrmwm9lENh8DUWXSOh8V7pP+feylmgeziQ2GKDhmtc2cZq
 sBpe0/pSH113ZQhz6FEx/+RkYdOErMVH1Y5GQIngqyzkaENOuAz/CjYUG
 dfSRzu2SgbiT5OhCo5ARJgHVwhvKh9FItCsYR4oWgk2q5x9+BEqhN1XGS
 59yh3feECLrVlLgj7wB+03au1lIEAdZ1pMBnczopwAXMe8j4GKvIs9zzX
 gDdH+4l2iD6nXrsQrBvGW0lDz9Y3P24WebCt6ZcQtK2oZ0jQ1jIQX9q7m
 RtweDK+v3sAWP9FQ4Sq6Vqh0jqGABx23Jxd09CtAkr6pGZMvG0pBBBywZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288288852"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="288288852"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 12:26:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="738242571"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="738242571"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 12:26:12 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Add MC6 Wa_14017210380 for SAMedia
Date: Sat, 29 Oct 2022 00:59:35 +0530
Message-Id: <20221028192935.1458271-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This workaround is added for Media Tile of MTL A step. It is to help
pcode workaround which handles the hardware bug seen on CXL splitter
during package C2/C3 transitins due to MC6 entry/exit. As a part of
workaround pcode expect kmd to send mailbox message "media busy" when
components of Media tile is in use and "media not busy" when not in use.
As per workaround description gucrc need to be disabled so enabled
host based RC for Media tile.

HSD: 14017210380

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 33 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++-
 drivers/gpu/drm/i915/i915_drv.h           |  4 +++
 drivers/gpu/drm/i915/i915_reg.h           |  9 +++++++
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index f553e2173bda..398dbeb298ca 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -19,10 +19,37 @@
 #include "intel_rc6.h"
 #include "intel_rps.h"
 #include "intel_wakeref.h"
+#include "intel_pcode.h"
 #include "pxp/intel_pxp_pm.h"
 
 #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
 
+/*
+ * Wa_14017210380: mtl
+ */
+
+static bool mtl_needs_media_mc6_wa(struct intel_gt *gt)
+{
+	return (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+		gt->type == GT_MEDIA);
+}
+
+static void mtl_mc6_wa_media_busy(struct intel_gt *gt)
+{
+	if (mtl_needs_media_mc6_wa(gt))
+		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
+				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
+				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
+}
+
+static void mtl_mc6_wa_media_not_busy(struct intel_gt *gt)
+{
+	if (mtl_needs_media_mc6_wa(gt))
+		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
+				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
+				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
+}
+
 static void user_forcewake(struct intel_gt *gt, bool suspend)
 {
 	int count = atomic_read(&gt->user_wakeref);
@@ -70,6 +97,9 @@ static int __gt_unpark(struct intel_wakeref *wf)
 
 	GT_TRACE(gt, "\n");
 
+	/* Wa_14017210380: mtl */
+	mtl_mc6_wa_media_busy(gt);
+
 	/*
 	 * It seems that the DMC likes to transition between the DC states a lot
 	 * when there are no connected displays (no active power domains) during
@@ -119,6 +149,9 @@ static int __gt_park(struct intel_wakeref *wf)
 	GEM_BUG_ON(!wakeref);
 	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
 
+	/* Wa_14017210380: mtl */
+	mtl_mc6_wa_media_not_busy(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index 8f8dd05835c5..cc6356ff84a5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -11,9 +11,20 @@
 
 static bool __guc_rc_supported(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	/*
+	 * Wa_14017210380: mtl
+	 * Do not enable gucrc to avoid additional interrupts which
+	 * may disrupt pcode wa.
+	 */
+	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	    gt->type == GT_MEDIA)
+		return false;
+
 	/* GuC RC is unavailable for pre-Gen12 */
 	return guc->submission_supported &&
-		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+		GRAPHICS_VER(gt->i915) >= 12;
 }
 
 static bool __guc_rc_selected(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 05b3300cc4ed..659b92382ff2 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
 	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
 
+#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
+	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_##variant) && \
+	 IS_GRAPHICS_STEP(__i915, since, until))
+
 /*
  * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
  * create three variants (G10, G11, and G12) which each have distinct
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 1c0da50c0dc7..abe62cea083d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6678,6 +6678,15 @@
 /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
 #define     PCODE_MBOX_DOMAIN_NONE		0x0
 #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
+
+/* Wa_14017210380: mtl */
+#define   PCODE_MBOX_GT_STATE			0x50
+/* sub-commands (param1) */
+#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
+#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
+/* param2 */
+#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
+
 #define GEN6_PCODE_DATA				_MMIO(0x138128)
 #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
 #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
-- 
2.25.1

