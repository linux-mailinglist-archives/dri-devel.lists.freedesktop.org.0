Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C961EBBB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B9D10E1FD;
	Mon,  7 Nov 2022 07:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251610E21A;
 Mon,  7 Nov 2022 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805636; x=1699341636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UHnwETFfKVUQKlKmiawNkRYhRnAmfrb8vCTMw64NXUY=;
 b=c6XtBo29mQykeLTW/HJLDHCCMoQnnEG7+CUUV2z93LkdzQh6gcAZ4Jwe
 /RPaXbvVdMJb5ywM6/2hSpkc6Vau0gB69zhhdfUqvKchWRHL1Bqe/BVEx
 Jixr5JQta6JkIIEAPgLt28V/O6/nGmeDK6Fc3W2mAkpKE3pHJVhf6MGob
 6jNr44ZiYKRL8DTSnsWTC3MGp9YUwG4lzAvvYeG3aUmRS626QsHc8JTCX
 JEGnsVq7Uw4xXLxCjxwgFmCwkOyqvIRmxJQRspyYIVAMmZxauztB1Rg6n
 aIRy1LvD6a6wSYNzNRdY+zHn4NCYNVNhGgHi0TQEAEin9y8fKVfmRMVaf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463385"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463385"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767286"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767286"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 11/15] drm/i915/display/mtl: Update Transcoder/DDI registers
 with the frl bits
Date: Mon,  7 Nov 2022 12:50:41 +0530
Message-Id: <20221107072045.628895-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For platforms supporting HDMI2.1 we need to fill the lane count
in Transcoder and DDI/PORT registers for FRL mode.
Similarly, FRL SHIFTER ENABLE, and DATA_WIDTH bits are to be set
in FRL mode. These bits are written in both the DDI_BUF_CTL and
PORT_BUF_CTL registers.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 49 +++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e95bde5cf060..5e2e4c78c564 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -38,6 +38,7 @@
 #include "intel_combo_phy_regs.h"
 #include "intel_connector.h"
 #include "intel_crtc.h"
+#include "intel_cx0_reg_defs.h"
 #include "intel_ddi.h"
 #include "intel_ddi_buf_trans.h"
 #include "intel_de.h"
@@ -499,6 +500,8 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 			temp |= TRANS_DDI_HDMI_SCRAMBLING;
 		if (crtc_state->hdmi_high_tmds_clock_ratio)
 			temp |= TRANS_DDI_HIGH_TMDS_CHAR_RATE;
+		if (crtc_state->frl.enable)
+			temp |= TRANS_DDI_PORT_WIDTH(crtc_state->lane_count);
 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_ANALOG)) {
 		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
 		temp |= (crtc_state->fdi_lanes - 1) << 1;
@@ -2587,6 +2590,13 @@ static void intel_disable_ddi_buf(struct intel_encoder *encoder,
 
 	if (wait)
 		intel_wait_ddi_buf_idle(dev_priv, port);
+
+	/* Clear PORT_BUF_CTL */
+	if (crtc_state->frl.enable) {
+		val = intel_de_read(dev_priv, XELPDP_PORT_BUF_CTL1(port));
+		intel_de_write(dev_priv, XELPDP_PORT_BUF_CTL1(port),
+			       val & ~(XELPDP_PORT_HDMI_FRL_SHFTR_EN));
+	}
 }
 
 static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
@@ -2837,7 +2847,6 @@ static void intel_enable_ddi_hdmi(struct intel_atomic_state *state,
 	struct drm_connector *connector = conn_state->connector;
 	enum port port = encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
-	u32 buf_ctl;
 
 	if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
 					       crtc_state->hdmi_high_tmds_clock_ratio,
@@ -2894,13 +2903,43 @@ static void intel_enable_ddi_hdmi(struct intel_atomic_state *state,
 	 *
 	 * On ADL_P the PHY link rate and lane count must be programmed but
 	 * these are both 0 for HDMI.
+	 *
+	 * But MTL onwards HDMI2.1 is supported and in FRL mode, port width
+	 * needs to be filled with either 3 or 4 lanes. For TMDS mode this
+	 * is always filled with 4 lanes, already set in the crtc_state.
 	 */
-	buf_ctl = dig_port->saved_port_bits | DDI_BUF_CTL_ENABLE;
-	if (IS_ALDERLAKE_P(dev_priv) && intel_phy_is_tc(dev_priv, phy)) {
+	if (DISPLAY_VER(dev_priv) > 13) {
+		u32 ddi_buf = 0;
+		u32 port_buf = intel_de_read(dev_priv, XELPDP_PORT_BUF_CTL1(port));
+
+		port_buf |= XELPDP_PORT_WIDTH(crtc_state->lane_count);
+		ddi_buf |= DDI_BUF_CTL_ENABLE |
+			   DDI_PORT_WIDTH(crtc_state->lane_count);
+
+		if (intel_bios_is_lane_reversal_needed(dev_priv, port))
+			port_buf |= XELPDP_PORT_REVERSAL;
+
+		if (crtc_state->frl.enable) {
+			port_buf |= XELPDP_PORT_HDMI_FRL_SHFTR_EN;
+			port_buf |= XELPDP_PORT_BUF_PORT_DATA_20BIT;
+			ddi_buf |= DDI_BUF_PORT_DATA_20BIT;
+		} else {
+			port_buf &= ~XELPDP_PORT_BUF_PORT_DATA_WIDTH_MASK;
+			ddi_buf &= ~DDI_BUF_PORT_DATA_WIDTH_MASK;
+		}
+
+		intel_de_write(dev_priv, XELPDP_PORT_BUF_CTL1(port), port_buf);
+		intel_de_write(dev_priv, DDI_BUF_CTL(port),
+			       dig_port->saved_port_bits | ddi_buf);
+	} else if (IS_ALDERLAKE_P(dev_priv) && intel_phy_is_tc(dev_priv, phy)) {
 		drm_WARN_ON(&dev_priv->drm, !intel_tc_port_in_legacy_mode(dig_port));
-		buf_ctl |= DDI_BUF_CTL_TC_PHY_OWNERSHIP;
+		intel_de_write(dev_priv, DDI_BUF_CTL(port),
+			       dig_port->saved_port_bits | DDI_BUF_CTL_ENABLE |
+			       DDI_BUF_CTL_TC_PHY_OWNERSHIP);
+	} else {
+		intel_de_write(dev_priv, DDI_BUF_CTL(port),
+			       dig_port->saved_port_bits | DDI_BUF_CTL_ENABLE);
 	}
-	intel_de_write(dev_priv, DDI_BUF_CTL(port), buf_ctl);
 
 	intel_audio_codec_enable(encoder, crtc_state, conn_state);
 }
-- 
2.25.1

