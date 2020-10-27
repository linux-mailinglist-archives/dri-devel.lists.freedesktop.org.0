Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5129BE1A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ACA6EBA6;
	Tue, 27 Oct 2020 16:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6154F6EBA6;
 Tue, 27 Oct 2020 16:56:17 +0000 (UTC)
IronPort-SDR: Sp3ElGFDqqMa9QdKpHfH/xD+6M8LiypP6NFZy0YfgX0xcT7TTOPBEYszOrF6f/vTMdNW+LKAwO
 8T+Mj5JMgF4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="147975797"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="147975797"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:56:17 -0700
IronPort-SDR: 2VFaNWQL74Qbi32MqDFV7qX7i2LY2aBtKaJRsEy/l/X07VGO7bhSVvkDxh0p9g6R9ZIyf0v0v4
 HMfyX7I7QRZg==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="355613117"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:56:13 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/16] drm/i915/hdcp: HDCP stream encryption support
Date: Tue, 27 Oct 2020 22:11:58 +0530
Message-Id: <20201027164208.10026-7-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027164208.10026-1-anshuman.gupta@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both HDCP_{1.x,2.x} requires to select/deselect Multistream HDCP bit
in TRANS_DDI_FUNC_CTL in order to enable/disable stream HDCP
encryption over DP MST Transport Link.

HDCP 1.4 stream encryption requires to validate the stream encryption
status in HDCP_STATUS_{TRANSCODER,PORT} register driving that link
in order to enable/disable the stream encryption.

Both of above requirement are same for all Gen with respect to
B.Spec Documentation.

v2:
Cosmetic changes function name, error msg print and
stream typo fixes. [Uma]

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 10 +--
 drivers/gpu/drm/i915/display/intel_ddi.h      |  6 +-
 .../drm/i915/display/intel_display_types.h    |  4 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 80 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++--
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 6 files changed, 90 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9fce623e951e..779603a38cfc 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1948,9 +1948,9 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 	}
 }
 
-int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
-				     enum transcoder cpu_transcoder,
-				     bool enable)
+int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
+			       enum transcoder cpu_transcoder,
+			       bool enable, u32 hdcp_mask)
 {
 	struct drm_device *dev = intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1965,9 +1965,9 @@ int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
 
 	tmp = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder));
 	if (enable)
-		tmp |= TRANS_DDI_HDCP_SIGNALLING;
+		tmp |= hdcp_mask;
 	else
-		tmp &= ~TRANS_DDI_HDCP_SIGNALLING;
+		tmp &= ~hdcp_mask;
 	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder), tmp);
 	intel_display_power_put(dev_priv, intel_encoder->power_domain, wakeref);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.h b/drivers/gpu/drm/i915/display/intel_ddi.h
index dcc711cfe4fe..a4dd815c0000 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi.h
@@ -50,9 +50,9 @@ u32 bxt_signal_levels(struct intel_dp *intel_dp,
 		      const struct intel_crtc_state *crtc_state);
 u32 ddi_signal_levels(struct intel_dp *intel_dp,
 		      const struct intel_crtc_state *crtc_state);
-int intel_ddi_toggle_hdcp_signalling(struct intel_encoder *intel_encoder,
-				     enum transcoder cpu_transcoder,
-				     bool enable);
+int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
+			       enum transcoder cpu_transcoder,
+			       bool enable, u32 hdcp_mask);
 void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder);
 
 #endif /* __INTEL_DDI_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c47124a679b6..59b8fc21e3e8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -339,6 +339,10 @@ struct intel_hdcp_shim {
 				 enum transcoder cpu_transcoder,
 				 bool enable);
 
+	/* Enable/Disable stream encryption on DP MST Transport Link */
+	int (*stream_encryption)(struct intel_digital_port *dig_port,
+				 bool enable);
+
 	/* Ensures the link is still protected */
 	bool (*check_link)(struct intel_digital_port *dig_port,
 			   struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 03424d20e9f7..6dcbfaffd2c5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -16,6 +16,30 @@
 #include "intel_dp.h"
 #include "intel_hdcp.h"
 
+static unsigned int transcoder_to_stream_enc_status(enum transcoder cpu_transcoder)
+{
+	u32 stream_enc_mask;
+
+	switch (cpu_transcoder) {
+	case TRANSCODER_A:
+		stream_enc_mask = HDCP_STATUS_STREAM_A_ENC;
+		break;
+	case TRANSCODER_B:
+		stream_enc_mask = HDCP_STATUS_STREAM_B_ENC;
+		break;
+	case TRANSCODER_C:
+		stream_enc_mask = HDCP_STATUS_STREAM_C_ENC;
+		break;
+	case TRANSCODER_D:
+		stream_enc_mask = HDCP_STATUS_STREAM_D_ENC;
+		break;
+	default:
+		stream_enc_mask = 0;
+	}
+
+	return stream_enc_mask;
+}
+
 static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
 {
 	long ret;
@@ -622,24 +646,57 @@ static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
 };
 
 static int
-intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
-				    enum transcoder cpu_transcoder,
-				    bool enable)
+intel_dp_mst_toggle_hdcp_stream_select(struct intel_digital_port *dig_port,
+				       bool enable)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct intel_dp *dp = &dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	int ret;
 
-	if (!enable)
-		usleep_range(6, 60); /* Bspec says >= 6us */
-
-	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base,
-					       cpu_transcoder, enable);
+	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base,
+					 hdcp->stream_transcoder, enable,
+					 TRANS_DDI_HDCP_SELECT);
 	if (ret)
-		drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
-			      enable ? "Enable" : "Disable", ret);
+		drm_err(&i915->drm, "%s HDCP stream select failed (%d)\n",
+			enable ? "Enable" : "Disable", ret);
 	return ret;
 }
 
+static int
+intel_dp_mst_hdcp_stream_encryption(struct intel_digital_port *dig_port,
+				    bool enable)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct intel_dp *dp = &dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
+	enum port port = dig_port->base.port;
+	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
+	u32 stream_enc_status;
+	int ret;
+
+	ret = intel_dp_mst_toggle_hdcp_stream_select(dig_port, enable);
+	if (ret)
+		return ret;
+
+	stream_enc_status =  transcoder_to_stream_enc_status(hdcp->stream_transcoder);
+	if (!stream_enc_status)
+		return -EINVAL;
+
+	/* Wait for encryption confirmation */
+	if (intel_de_wait_for_register(i915,
+				       HDCP_STATUS(i915, cpu_transcoder, port),
+				       stream_enc_status,
+				       enable ? stream_enc_status : 0,
+				       HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
+		drm_err(&i915->drm, "Timed out waiting for stream encryption %s\n",
+			enable ? "enabled" : "disabled");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static
 bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
 				  struct intel_connector *connector)
@@ -673,7 +730,8 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
 	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
 	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
-	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
+	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
+	.stream_encryption = intel_dp_mst_hdcp_stream_encryption,
 	.check_link = intel_dp_mst_hdcp_check_link,
 	.hdcp_capable = intel_dp_hdcp_capable,
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index f90838bc74fb..f58469226694 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1495,15 +1495,16 @@ static int kbl_repositioning_enc_en_signal(struct intel_connector *connector,
 		usleep_range(25, 50);
 	}
 
-	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
-					       false);
+	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base, cpu_transcoder,
+					 false, TRANS_DDI_HDCP_SIGNALLING);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Disable HDCP signalling failed (%d)\n", ret);
 		return ret;
 	}
-	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
-					       true);
+
+	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base, cpu_transcoder,
+					 true, TRANS_DDI_HDCP_SIGNALLING);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Enable HDCP signalling failed (%d)\n", ret);
@@ -1526,8 +1527,9 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 	if (!enable)
 		usleep_range(6, 60); /* Bspec says >= 6us */
 
-	ret = intel_ddi_toggle_hdcp_signalling(&dig_port->base, cpu_transcoder,
-					       enable);
+	ret = intel_ddi_toggle_hdcp_bits(&dig_port->base,
+					 cpu_transcoder, enable,
+					 TRANS_DDI_HDCP_SIGNALLING);
 	if (ret) {
 		drm_err(&dev_priv->drm, "%s HDCP signalling failed (%d)\n",
 			enable ? "Enable" : "Disable", ret);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8b021f77cb1f..77461cde6549 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9982,6 +9982,7 @@ enum skl_power_gate {
 #define  TRANS_DDI_DP_VC_PAYLOAD_ALLOC	(1 << 8)
 #define  TRANS_DDI_HDMI_SCRAMBLER_CTS_ENABLE (1 << 7)
 #define  TRANS_DDI_HDMI_SCRAMBLER_RESET_FREQ (1 << 6)
+#define  TRANS_DDI_HDCP_SELECT		REG_BIT(5)
 #define  TRANS_DDI_BFI_ENABLE		(1 << 4)
 #define  TRANS_DDI_HIGH_TMDS_CHAR_RATE	(1 << 4)
 #define  TRANS_DDI_HDMI_SCRAMBLING	(1 << 0)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
