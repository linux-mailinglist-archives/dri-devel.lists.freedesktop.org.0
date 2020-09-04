Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CD25D051
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 06:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F2C6EA64;
	Fri,  4 Sep 2020 04:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6566EA64;
 Fri,  4 Sep 2020 04:19:38 +0000 (UTC)
IronPort-SDR: 9dfenNGeMuc/R5/Q240hZlf5rAY4N4iZWd8k/e/qEuM3gn0kX3SfDmi0qY69LW6h6FSW1PdTPI
 1WFgnTTc2xlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137211985"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="137211985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:19:38 -0700
IronPort-SDR: iFHTorMmHTjPg7R3HuyKmtcD6KPhSGEOOqLMaljid6GAFe5CF5lyDwUn3VYmtDtlpwuqW4X5ZI
 7oOnsDXi04Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="282899564"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by fmsmga007.fm.intel.com with ESMTP; 03 Sep 2020 21:19:33 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] [RFC] drm/i915/dp: DP PHY compliance for EHL/JSL
Date: Fri,  4 Sep 2020 09:44:19 +0530
Message-Id: <1599192859-2654-3-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599192859-2654-1-git-send-email-vidya.srinivas@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <1599192859-2654-1-git-send-email-vidya.srinivas@intel.com>
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
Cc: Vidya Srinivas <vidya.srinivas@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please Note: Comment from Ville could not be addressed
as his comments are with respect to base implementation
(design) which are already merged. We need JSL changes
for compliance. Hence pushing the required changes
on top of existing design. Apoligies for that.

v2: Rebased patch on top of Khaled's (yet to be merged):
    https://patchwork.freedesktop.org/series/79779/
    Fixed phy patterns for JSL/EHL
    Add TPS4 support for JSL/EHL

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 81 +++++++++++++++++++++++++--------
 drivers/gpu/drm/i915/i915_reg.h         | 18 ++++++--
 2 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a8a3ffcef5dc..1773f3d5d0f4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5405,25 +5405,32 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 	enum pipe pipe = crtc->pipe;
 	u32 pattern_val, dp_tp_ctl;
 
+	i915_reg_t dp_comp_reg;
+
+	if (IS_ELKHARTLAKE(dev_priv))
+		dp_comp_reg = EHL_DDI_DP_COMP_CTL(dig_port->base.port);
+	else if (IS_TIGERLAKE(dev_priv))
+		dp_comp_reg = DDI_DP_COMP_CTL(pipe);
+
 	switch (data->phy_pattern) {
 	case DP_PHY_TEST_PATTERN_NONE:
 		DRM_DEBUG_KMS("Disable Phy Test Pattern\n");
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe), 0x0);
+		intel_de_write(dev_priv, dp_comp_reg, 0x0);
 		break;
 	case DP_PHY_TEST_PATTERN_D10_2:
 		DRM_DEBUG_KMS("Set D10.2 Phy Test Pattern\n");
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
+		intel_de_write(dev_priv, dp_comp_reg,
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_D10_2);
 		break;
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		DRM_DEBUG_KMS("Set Error Count Phy Test Pattern\n");
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
+		intel_de_write(dev_priv, dp_comp_reg,
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_SCRAMBLED_0);
 		break;
 	case DP_PHY_TEST_PATTERN_PRBS7:
 		DRM_DEBUG_KMS("Set PRBS7 Phy Test Pattern\n");
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
+		intel_de_write(dev_priv, dp_comp_reg,
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_PRBS7);
 		break;
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
@@ -5432,14 +5439,27 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 		 * current firmware of DPR-100 could not set it, so hardcoding
 		 * now for complaince test.
 		 */
-		DRM_DEBUG_KMS("Set 80Bit Custom Phy Test Pattern 0x3e0f83e0 0x0f83e0f8 0x0000f83e\n");
+		DRM_DEBUG_KMS("Set 80Bit Custom Phy Test Pattern \
+			      0x3e0f83e0 0x0f83e0f8 0x0000f83e\n");
 		pattern_val = 0x3e0f83e0;
-		intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 0), pattern_val);
+		if (IS_ELKHARTLAKE(dev_priv))
+			intel_de_write(dev_priv, EHL_DDI_DP_COMP_PAT(dig_port->base.port, 0),
+				       pattern_val);
+		else
+			intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 0), pattern_val);
 		pattern_val = 0x0f83e0f8;
-		intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 1), pattern_val);
+		if (IS_ELKHARTLAKE(dev_priv))
+			intel_de_write(dev_priv, EHL_DDI_DP_COMP_PAT(dig_port->base.port, 1),
+				       pattern_val);
+		else
+			intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 1), pattern_val);
 		pattern_val = 0x0000f83e;
-		intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 2), pattern_val);
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
+		if (IS_ELKHARTLAKE(dev_priv))
+			intel_de_write(dev_priv, EHL_DDI_DP_COMP_PAT(dig_port->base.port, 2),
+				       pattern_val);
+		else
+			intel_de_write(dev_priv, DDI_DP_COMP_PAT(pipe, 2), pattern_val);
+		intel_de_write(dev_priv, dp_comp_reg,
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_CUSTOM80);
 		break;
@@ -5451,7 +5471,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 		 */
 		DRM_DEBUG_KMS("Set HBR2 compliance Phy Test Pattern\n");
 		pattern_val = 0xFB;
-		intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
+		intel_de_write(dev_priv, dp_comp_reg,
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_HBR2 |
 			       pattern_val);
 		break;
@@ -5478,22 +5498,32 @@ intel_dp_autotest_phy_ddi_disable(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value;
+	u32 trans_ddi_func_ctl_value, trans_conf_value,
+		dp_tp_ctl_value, trans_ddi_port_mask;
+	i915_reg_t dp_tp_reg;
+
+	if (IS_ELKHARTLAKE(dev_priv)) {
+		dp_tp_reg = DP_TP_CTL(dig_port->base.port);
+		trans_ddi_port_mask = TRANS_DDI_PORT_MASK;
+	} else if (IS_TIGERLAKE(dev_priv)) {
+		dp_tp_reg = TGL_DP_TP_CTL(pipe);
+		trans_ddi_port_mask = TGL_TRANS_DDI_PORT_MASK;
+	}
 
 	trans_ddi_func_ctl_value = intel_de_read(dev_priv,
 						 TRANS_DDI_FUNC_CTL(pipe));
 	trans_conf_value = intel_de_read(dev_priv, PIPECONF(pipe));
-	dp_tp_ctl_value = intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
 
+	dp_tp_ctl_value = intel_de_read(dev_priv, dp_tp_reg);
 	trans_ddi_func_ctl_value &= ~(TRANS_DDI_FUNC_ENABLE |
-				      TGL_TRANS_DDI_PORT_MASK);
+					trans_ddi_port_mask);
 	trans_conf_value &= ~PIPECONF_ENABLE;
 	dp_tp_ctl_value &= ~DP_TP_CTL_ENABLE;
 
 	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
 	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
 		       trans_ddi_func_ctl_value);
-	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
+	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
 }
 
 static void
@@ -5505,20 +5535,29 @@ intel_dp_autotest_phy_ddi_enable(struct intel_dp *intel_dp, uint8_t lane_cnt)
 	enum port port = dig_port->base.port;
 	struct intel_crtc *crtc = to_intel_crtc(dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value;
+	u32 trans_ddi_func_ctl_value, trans_conf_value,
+		dp_tp_ctl_value, trans_ddi_sel_port;
+	i915_reg_t dp_tp_reg;
+
+	if (IS_ELKHARTLAKE(dev_priv)) {
+		dp_tp_reg = DP_TP_CTL(port);
+		trans_ddi_sel_port = TRANS_DDI_SELECT_PORT(port);
+	} else if (IS_TIGERLAKE(dev_priv)) {
+		dp_tp_reg = TGL_DP_TP_CTL(pipe);
+		trans_ddi_sel_port = TGL_TRANS_DDI_SELECT_PORT(port);
+	}
 
 	trans_ddi_func_ctl_value = intel_de_read(dev_priv,
 						 TRANS_DDI_FUNC_CTL(pipe));
 	trans_conf_value = intel_de_read(dev_priv, PIPECONF(pipe));
 	dp_tp_ctl_value = intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
-
 	trans_ddi_func_ctl_value |= TRANS_DDI_FUNC_ENABLE |
-				    TGL_TRANS_DDI_SELECT_PORT(port);
+				    trans_ddi_sel_port;
 	trans_conf_value |= PIPECONF_ENABLE;
 	dp_tp_ctl_value |= DP_TP_CTL_ENABLE;
 
 	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
-	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
+	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
 	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
 		       trans_ddi_func_ctl_value);
 }
@@ -5565,6 +5604,7 @@ static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_i915_private *dev_priv = i915;
 	u8 response = DP_TEST_NAK;
 	u8 request = 0;
 	int status;
@@ -5590,6 +5630,11 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 		response = intel_dp_autotest_edid(intel_dp);
 		break;
 	case DP_TEST_LINK_PHY_TEST_PATTERN:
+		if (!IS_ELKHARTLAKE(dev_priv) && !IS_TIGERLAKE(dev_priv)) {
+			drm_dbg_kms(&i915->drm,
+				"PHY compliance for platform not supported\n");
+			return;
+		}
 		drm_dbg_kms(&i915->drm, "PHY_PATTERN test requested\n");
 		response = intel_dp_autotest_phy_pattern(intel_dp);
 		break;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4850890918dc..7d3b6779661f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -10026,10 +10026,16 @@ enum skl_power_gate {
 #define  DDI_BUF_BALANCE_LEG_ENABLE	(1 << 31)
 #define DDI_BUF_TRANS_HI(port, i)	_MMIO(_PORT(port, _DDI_BUF_TRANS_A, _DDI_BUF_TRANS_B) + (i) * 8 + 4)
 
+/* EHL/JSL DP compliance control */
+#define _EHL_DDI_DP_COMP_CTL_A		0x640F0
+#define _EHL_DDI_DP_COMP_CTL_B		0x641F0
+#define EHL_DDI_DP_COMP_CTL(port) \
+	_MMIO_PORT(port, _EHL_DDI_DP_COMP_CTL_A, _EHL_DDI_DP_COMP_CTL_B)
+
 /* DDI DP Compliance Control */
-#define _DDI_DP_COMP_CTL_A			0x605F0
-#define _DDI_DP_COMP_CTL_B			0x615F0
-#define DDI_DP_COMP_CTL(pipe)			_MMIO_PIPE(pipe, _DDI_DP_COMP_CTL_A, _DDI_DP_COMP_CTL_B)
+#define _DDI_DP_COMP_CTL_A		0x605F0
+#define _DDI_DP_COMP_CTL_B		0x615F0
+#define DDI_DP_COMP_CTL(pipe)		_MMIO_PIPE(pipe, _DDI_DP_COMP_CTL_A, _DDI_DP_COMP_CTL_B)
 #define   DDI_DP_COMP_CTL_ENABLE		(1 << 31)
 #define   DDI_DP_COMP_CTL_D10_2			(0 << 28)
 #define   DDI_DP_COMP_CTL_SCRAMBLED_0		(1 << 28)
@@ -10039,6 +10045,12 @@ enum skl_power_gate {
 #define   DDI_DP_COMP_CTL_SCRAMBLED_1		(5 << 28)
 #define   DDI_DP_COMP_CTL_HBR2_RESET		(0xFC << 0)
 
+/* EHL */
+#define _EHL_DDI_DP_COMP_PAT_A	0x640F4
+#define _EHL_DDI_DP_COMP_PAT_B	0x641F4
+#define EHL_DDI_DP_COMP_PAT(port, i) \
+	_MMIO(_PORT(port, _EHL_DDI_DP_COMP_PAT_A, _EHL_DDI_DP_COMP_PAT_B) + (i) * 4)
+
 /* DDI DP Compliance Pattern */
 #define _DDI_DP_COMP_PAT_A			0x605F4
 #define _DDI_DP_COMP_PAT_B			0x615F4
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
