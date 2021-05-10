Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA5378CD5
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 15:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F3F6E25A;
	Mon, 10 May 2021 13:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CD16E25A;
 Mon, 10 May 2021 13:33:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 46F13C800A7;
 Mon, 10 May 2021 15:33:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id CqKkkfnJub4j; Mon, 10 May 2021 15:33:56 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37F0dA80022824231f945140A.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f0d:a800:2282:4231:f945:140a])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id F168BC800A8;
 Mon, 10 May 2021 15:33:55 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: ville.syrjala@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] drm/i915/display: Restructure output format
 computation for better expandability
Date: Mon, 10 May 2021 15:33:48 +0200
Message-Id: <20210510133349.14491-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510133349.14491-1-wse@tuxedocomputers.com>
References: <20210510133349.14491-1-wse@tuxedocomputers.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Couples the decission between RGB and YCbCr420 mode and the check if the
port clock can archive the required frequency. Other checks and
configuration steps that where previously done in between can also be done
before or after.

This allows for are cleaner implementation of retrying different color
encodings.

A slight change in behaviour occurs with this patch: If YCbCr420 is not
allowed but display is YCbCr420 only it no longer fails, but just prints
an error and tries to fallback on RGB.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 66 ++++++++++++-----------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 2f1ca91387e4..c411f1862286 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2000,29 +2000,6 @@ static bool hdmi_deep_color_possible(const struct intel_crtc_state *crtc_state,
 					      INTEL_OUTPUT_FORMAT_YCBCR420);
 }
 
-static int
-intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
-			   const struct drm_connector_state *conn_state)
-{
-	struct drm_connector *connector = conn_state->connector;
-	struct drm_i915_private *i915 = to_i915(connector->dev);
-	const struct drm_display_mode *adjusted_mode =
-		&crtc_state->hw.adjusted_mode;
-
-	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
-		return 0;
-
-	if (!connector->ycbcr_420_allowed) {
-		drm_err(&i915->drm,
-			"Platform doesn't support YCBCR420 output\n");
-		return -EINVAL;
-	}
-
-	crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
-
-	return intel_pch_panel_fitting(crtc_state, conn_state);
-}
-
 static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
 				  struct intel_crtc_state *crtc_state,
 				  int clock)
@@ -2129,6 +2106,31 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
 
+static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
+					    struct intel_crtc_state *crtc_state,
+					    const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int ret;
+	bool ycbcr_420_only;
+
+	ycbcr_420_only = drm_mode_is_420_only(&connector->display_info, adjusted_mode);
+	if (connector->ycbcr_420_allowed && ycbcr_420_only) {
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	} else {
+		if (!connector->ycbcr_420_allowed && ycbcr_420_only)
+			drm_dbg_kms(&i915->drm,
+				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	}
+
+	ret = intel_hdmi_compute_clock(encoder, crtc_state);
+
+	return ret;
+}
+
 int intel_hdmi_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
@@ -2153,23 +2155,25 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pipe_config->pixel_multiplier = 2;
 
-	ret = intel_hdmi_ycbcr420_config(pipe_config, conn_state);
-	if (ret)
-		return ret;
-
-	pipe_config->limited_color_range =
-		intel_hdmi_limited_color_range(pipe_config, conn_state);
-
 	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv))
 		pipe_config->has_pch_encoder = true;
 
 	pipe_config->has_audio =
 		intel_hdmi_has_audio(encoder, pipe_config, conn_state);
 
-	ret = intel_hdmi_compute_clock(encoder, pipe_config);
+	ret = intel_hdmi_compute_output_format(encoder, pipe_config, conn_state);
 	if (ret)
 		return ret;
 
+	if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		ret = intel_pch_panel_fitting(pipe_config, conn_state);
+		if (ret)
+			return ret;
+	}
+
+	pipe_config->limited_color_range =
+		intel_hdmi_limited_color_range(pipe_config, conn_state);
+
 	if (conn_state->picture_aspect_ratio)
 		adjusted_mode->picture_aspect_ratio =
 			conn_state->picture_aspect_ratio;
-- 
2.25.1

