Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3314FE01
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 16:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14E6EAD7;
	Sun,  2 Feb 2020 15:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DD989F24;
 Sun,  2 Feb 2020 15:49:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2020 07:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,394,1574150400"; d="scan'208";a="430899893"
Received: from jghithan-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.251.88.23])
 by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2020 07:49:43 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/18] drm/i915/dp: Add compute routine for DP VSC SDP
Date: Sun,  2 Feb 2020 17:49:23 +0200
Message-Id: <20200202154938.1129610-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200202154938.1129610-1-gwan-gyeong.mun@intel.com>
References: <20200202154938.1129610-1-gwan-gyeong.mun@intel.com>
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

It stores computed dp vsc sdp to infoframes.vsc of crtc state.
While computing we'll also fill out the inforames.enable bitmask
appropriately.

The compute routine follows DP 1.4 spec [Table 2-117: VSC SDP Payload for
DB16 through DB18].

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 92 +++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4dede6253f8..705d36b548b1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2372,6 +2372,97 @@ static bool intel_dp_port_has_audio(struct drm_i915_private *dev_priv,
 	return true;
 }
 
+static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
+					     const struct drm_connector_state *conn_state,
+					     struct intel_dp_vsc_sdp *vsc)
+{
+	/*
+	 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
+	 * VSC SDP supporting 3D stereo, PSR2, and Pixel Encoding/
+	 * Colorimetry Format indication.
+	 */
+	vsc->revision = 0x5;
+	vsc->length = 0x13;
+
+	/* DP 1.4a spec, Table 2-120 */
+	switch (crtc_state->output_format) {
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		vsc->colorspace = DP_COLORSPACE_YUV444;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		vsc->colorspace = DP_COLORSPACE_YUV420;
+		break;
+	case INTEL_OUTPUT_FORMAT_RGB:
+	default:
+		vsc->colorspace = DP_COLORSPACE_RGB;
+	}
+
+	switch (conn_state->colorspace) {
+	case DRM_MODE_COLORIMETRY_BT709_YCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT709_YCC;
+		break;
+	case DRM_MODE_COLORIMETRY_XVYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_XVYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_XVYCC_709:
+		vsc->colorimetry = DP_COLORIMETRY_XVYCC_709;
+		break;
+	case DRM_MODE_COLORIMETRY_SYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_SYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_OPYCC_601:
+		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
+		break;
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+		vsc->colorimetry = DP_COLORIMETRY_DCI_P3_RGB;
+		break;
+	default:
+		/*
+		 * RGB->YCBCR color conversion uses the BT.709
+		 * color space.
+		 */
+		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+			vsc->colorimetry = DP_COLORIMETRY_BT709_YCC;
+		else
+			vsc->colorimetry = DP_COLORIMETRY_DEFAULT;
+		break;
+	}
+
+	vsc->bpc = crtc_state->pipe_bpp / 3;
+	/* all YCbCr are always limited range */
+	vsc->dynamic_range = DP_DYNAMIC_RANGE_CTA;
+	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
+}
+
+static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state,
+				     const struct drm_connector_state *conn_state)
+{
+	struct intel_dp_vsc_sdp *vsc = &crtc_state->infoframes.vsc;
+
+	/* When PSR is enabled, VSC SDP is handled by PSR routine */
+	if (intel_psr_enabled(intel_dp))
+		return;
+
+	if (!intel_dp_needs_vsc_sdp(crtc_state, conn_state))
+		return;
+
+	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
+	vsc->sdp_type = DP_SDP_VSC;
+	intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
+					 &crtc_state->infoframes.vsc);
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -2477,6 +2568,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		intel_dp_set_clock(encoder, pipe_config);
 
 	intel_psr_compute_config(intel_dp, pipe_config);
+	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 
 	return 0;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
