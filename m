Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3BE1580F6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 18:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FD26ECE5;
	Mon, 10 Feb 2020 17:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B46B6ECE5;
 Mon, 10 Feb 2020 17:10:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 09:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="233168297"
Received: from helsinki.fi.intel.com ([10.237.66.159])
 by orsmga003.jf.intel.com with ESMTP; 10 Feb 2020 09:10:54 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 17/18] drm/i915/dp: Add compute routine for DP PSR VSC SDP
Date: Mon, 10 Feb 2020 19:10:20 +0200
Message-Id: <20200210171021.109684-18-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
References: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use a common VSC SDP Colorimetry calculating code on PSR,
it adds a compute routine for PSR VSC SDP.
As PSR routine can not use infoframes.vsc of crtc state, it also adds new
writing of DP SDPs (Secondary Data Packet) for PSR.
PSR routine has its own scenario and timings of writing a VSC SDP.

v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
v4: Use struct drm_device logging macros

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 54 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h |  8 ++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2d6001dd7975..bfc39fbc6534 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2469,6 +2469,42 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 					 &crtc_state->infoframes.vsc);
 }
 
+void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
+				  const struct intel_crtc_state *crtc_state,
+				  const struct drm_connector_state *conn_state,
+				  struct drm_dp_vsc_sdp *vsc)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+
+	vsc->sdp_type = DP_SDP_VSC;
+
+	if (dev_priv->psr.psr2_enabled) {
+		if (dev_priv->psr.colorimetry_support &&
+		    intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
+			/* [PSR2, +Colorimetry] */
+			intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
+							 vsc);
+		} else {
+			/*
+			 * [PSR2, -Colorimetry]
+			 * Prepare VSC Header for SU as per eDP 1.4 spec, Table 6-11
+			 * 3D stereo + PSR/PSR2 + Y-coordinate.
+			 */
+			vsc->revision = 0x4;
+			vsc->length = 0xe;
+		}
+	} else {
+		/*
+		 * [PSR1]
+		 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
+		 * VSC SDP supporting 3D stereo + PSR (applies to eDP v1.3 or
+		 * higher).
+		 */
+		vsc->revision = 0x2;
+		vsc->length = 0x8;
+	}
+}
+
 static void
 intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
 					    struct intel_crtc_state *crtc_state,
@@ -4902,6 +4938,24 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 	intel_dig_port->write_infoframe(encoder, crtc_state, type, &sdp, len);
 }
 
+void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
+			    const struct intel_crtc_state *crtc_state,
+			    struct drm_dp_vsc_sdp *vsc)
+{
+	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct dp_sdp sdp = {};
+	ssize_t len;
+
+	len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
+
+	if (drm_WARN_ON(&dev_priv->drm, len < 0))
+		return;
+
+	intel_dig_port->write_infoframe(encoder, crtc_state, DP_SDP_VSC,
+					&sdp, len);
+}
+
 void intel_dp_set_infoframes(struct intel_encoder *encoder,
 			     bool enable,
 			     const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 6562bb8edeba..5074e52722c0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -18,6 +18,7 @@ struct drm_connector_state;
 struct drm_encoder;
 struct drm_i915_private;
 struct drm_modeset_acquire_ctx;
+struct drm_dp_vsc_sdp;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_digital_port;
@@ -110,6 +111,13 @@ int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_max_data_rate(int max_link_clock, int max_lanes);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
+void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
+				  const struct intel_crtc_state *crtc_state,
+				  const struct drm_connector_state *conn_state,
+				  struct drm_dp_vsc_sdp *vsc);
+void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
+			    const struct intel_crtc_state *crtc_state,
+			    struct drm_dp_vsc_sdp *vsc);
 void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
