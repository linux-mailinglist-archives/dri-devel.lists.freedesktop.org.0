Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90C1EDCA1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 07:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB246E170;
	Thu,  4 Jun 2020 05:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6CA6E170;
 Thu,  4 Jun 2020 05:07:39 +0000 (UTC)
IronPort-SDR: Z7oRVpzul8TNPILO2MrihQYa2+Da8m8TSHIBMlWcg1KVUaX2xTPNfS9eihD5AH69LAszvN13vj
 NH9bg4LwLr1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 22:07:38 -0700
IronPort-SDR: kEsbg3Bw2NIG+7961KtAAvux2ff7VRiDfkpVrewS1vXxjEIKQOuStOrwdX1x1kpxrk5Qw5sWKf
 39CWSlWRRIeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; d="scan'208";a="294209694"
Received: from unknown (HELO vsrini4-XPS-8920.iind.intel.com) ([10.223.163.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2020 22:07:35 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: DP PHY compliance for JSL
Date: Thu,  4 Jun 2020 10:33:48 +0530
Message-Id: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Vidya Srinivas <vidya.srinivas@intel.com>, animesh.manna@intel.com,
 manasi.d.navare@intel.com, uma.shankar@intel.com, shawn.c.lee@intel.com,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 40 ++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7223367171d1..44663e8ac9a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5470,22 +5470,32 @@ intel_dp_autotest_phy_ddi_disable(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(intel_dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value;
+	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value, trans_ddi_port_mask;
+	enum port port = intel_dig_port->base.port;
+	i915_reg_t dp_tp_reg;
+
+	if (IS_ELKHARTLAKE(dev_priv)) {
+		dp_tp_reg = DP_TP_CTL(port);
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
@@ -5497,20 +5507,28 @@ intel_dp_autotest_phy_ddi_enable(struct intel_dp *intel_dp, uint8_t lane_cnt)
 	enum port port = intel_dig_port->base.port;
 	struct intel_crtc *crtc = to_intel_crtc(intel_dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value;
+	u32 trans_ddi_func_ctl_value, trans_conf_value, dp_tp_ctl_value, trans_ddi_sel_port;
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
@@ -5557,6 +5575,7 @@ static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_i915_private *dev_priv = i915;
 	u8 response = DP_TEST_NAK;
 	u8 request = 0;
 	int status;
@@ -5582,6 +5601,11 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 		response = intel_dp_autotest_edid(intel_dp);
 		break;
 	case DP_TEST_LINK_PHY_TEST_PATTERN:
+		if (!IS_ELKHARTLAKE(dev_priv) || !IS_TIGERLAKE(dev_priv)) {
+			drm_dbg_kms(&i915->drm,
+				"PHY compliance for platform not supported\n");
+			return;
+		}
 		drm_dbg_kms(&i915->drm, "PHY_PATTERN test requested\n");
 		response = intel_dp_autotest_phy_pattern(intel_dp);
 		break;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
