Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9061D2736
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A376EAAE;
	Thu, 14 May 2020 06:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C374B88FA0;
 Thu, 14 May 2020 06:08:06 +0000 (UTC)
IronPort-SDR: PgDuTez23w/DapqMjibQPforrwNYPRmjyGovwvv419e59AYQ588fXxvHy8elB7xo6+wTMjR2G2
 Ak71v03VG29Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 23:08:06 -0700
IronPort-SDR: okbFpPWxknPo2xcW/6WA0XulXXFos6mebmzeAZdQ+ILL4KZbXJBlMrxkt9DwIHo6o56IZF+k4m
 MhVM4SCBw7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="409957048"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.18.167])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:08:04 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 13/14] drm/i915/dp: Add compute routine for DP PSR VSC SDP
Date: Thu, 14 May 2020 09:07:31 +0300
Message-Id: <20200514060732.3378396-14-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
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
v10: 1) Fix packing of VSC SDP where Pixel Encoding/Colorimetry Format is
        not supported.
     2) Change a checking of PSR state.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 66 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h |  8 +++
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4ccd6b7a3d83..408c3c1c5e81 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2487,8 +2487,8 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 {
 	struct drm_dp_vsc_sdp *vsc = &crtc_state->infoframes.vsc;
 
-	/* When PSR is enabled, VSC SDP is handled by PSR routine */
-	if (intel_psr_enabled(intel_dp))
+	/* When a crtc state has PSR, VSC SDP will be handled by PSR routine */
+	if (crtc_state->has_psr)
 		return;
 
 	if (!intel_dp_needs_vsc_sdp(crtc_state, conn_state))
@@ -2500,6 +2500,42 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
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
@@ -4791,6 +4827,13 @@ static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
 	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
 
+	/*
+	 * Only revision 0x5 supports Pixel Encoding/Colorimetry Format as
+	 * per DP 1.4a spec.
+	 */
+	if (vsc->revision != 0x5)
+		goto out;
+
 	/* VSC SDP Payload for DB16 through DB18 */
 	/* Pixel Encoding and Colorimetry Formats  */
 	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
@@ -4823,6 +4866,7 @@ static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 	/* Content Type */
 	sdp->db[18] = vsc->content_type & 0x7;
 
+out:
 	return length;
 }
 
@@ -4935,6 +4979,24 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
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
index 0d2de15703c3..1702959ca079 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -16,6 +16,7 @@ struct drm_connector_state;
 struct drm_encoder;
 struct drm_i915_private;
 struct drm_modeset_acquire_ctx;
+struct drm_dp_vsc_sdp;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_digital_port;
@@ -108,6 +109,13 @@ int intel_dp_link_required(int pixel_clock, int bpp);
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
