Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692223B978F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF09D6EC4A;
	Thu,  1 Jul 2021 20:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571C96EC14;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998673"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998673"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564545"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 47/53] drm/i915/dg2: Wait for SNPS PHY calibration during
 display init
Date: Thu,  1 Jul 2021 13:24:21 -0700
Message-Id: <20210701202427.1547543-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialization of the PHY is handled by the hardware/firmware, but the
driver should wait up to 25ms for the PHY to report that its calibration
has completed.

Bspec: 49189
Bspec: 50107
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power.c    |  5 +++++
 drivers/gpu/drm/i915/display/intel_snps_phy.c     | 15 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_snps_phy.h     |  3 +++
 drivers/gpu/drm/i915/i915_reg.h                   |  1 +
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index df6358638fee..83bc2e691560 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -18,6 +18,7 @@
 #include "intel_pm.h"
 #include "intel_pps.h"
 #include "intel_sideband.h"
+#include "intel_snps_phy.h"
 #include "intel_tc.h"
 #include "intel_vga.h"
 
@@ -5899,6 +5900,10 @@ static void icl_display_core_init(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 12)
 		tgl_bw_buddy_init(dev_priv);
 
+	/* 8. Ensure PHYs have completed calibration and adaptation */
+	if (IS_DG2(dev_priv))
+		intel_snps_phy_wait_for_calibration(dev_priv);
+
 	if (resume && intel_dmc_has_payload(dev_priv))
 		intel_dmc_load_program(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index 77759bda98a4..f0c30d3d2dfb 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -21,6 +21,21 @@
  * since it is not handled by the shared DPLL framework as on other platforms.
  */
 
+void intel_snps_phy_wait_for_calibration(struct drm_i915_private *dev_priv)
+{
+	enum phy phy;
+
+	for_each_phy_masked(phy, ~0) {
+		if (!intel_phy_is_snps(dev_priv, phy))
+			continue;
+
+		if (intel_de_wait_for_clear(dev_priv, ICL_PHY_MISC(phy),
+					    DG2_PHY_DP_TX_ACK_MASK, 25))
+			DRM_ERROR("SNPS PHY %c failed to calibrate after 25ms.\n",
+				  phy);
+	}
+}
+
 static const u32 dg2_ddi_translations[] = {
 	/* VS 0, pre-emph 0 */
 	REG_FIELD_PREP(SNPS_PHY_TX_EQ_MAIN, 26),
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.h b/drivers/gpu/drm/i915/display/intel_snps_phy.h
index 3ce92d424f66..6aa33ff729ec 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.h
@@ -8,10 +8,13 @@
 
 #include <linux/types.h>
 
+struct drm_i915_private;
 struct intel_encoder;
 struct intel_crtc_state;
 struct intel_mpllb_state;
 
+void intel_snps_phy_wait_for_calibration(struct drm_i915_private *dev_priv);
+
 int intel_mpllb_calc_state(struct intel_crtc_state *crtc_state,
 			   struct intel_encoder *encoder);
 void intel_mpllb_enable(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 203056b9f02c..e3a165eb4fb6 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12442,6 +12442,7 @@ enum skl_power_gate {
 						 _ICL_PHY_MISC_B)
 #define  ICL_PHY_MISC_MUX_DDID			(1 << 28)
 #define  ICL_PHY_MISC_DE_IO_COMP_PWR_DOWN	(1 << 23)
+#define  DG2_PHY_DP_TX_ACK_MASK			REG_GENMASK(23, 20)
 
 /* Icelake Display Stream Compression Registers */
 #define DSCA_PICTURE_PARAMETER_SET_0		_MMIO(0x6B200)
-- 
2.25.4

