Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7A37435F
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 19:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29016EC25;
	Wed,  5 May 2021 17:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161BC6EC18;
 Wed,  5 May 2021 17:15:00 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 95304C800B1;
 Wed,  5 May 2021 19:14:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id poLkfxXzwFVL; Wed,  5 May 2021 19:14:58 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F39860005A4018A54F094b9.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:8600:5a4:18a:54f0:94b9])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 46FFAC800A8;
 Wed,  5 May 2021 19:14:58 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: wse@tuxedocomputers.com, ville.syrjala@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Restructure output format computation for better
 expandability
Date: Wed,  5 May 2021 19:14:52 +0200
Message-Id: <20210505171453.1403560-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505171453.1403560-1-wse@tuxedocomputers.com>
References: <20210505171453.1403560-1-wse@tuxedocomputers.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Couples the decission between RGB and YCbCr420 mode and the check if the port
clock can archive the required frequency. Other checks and configuration steps
that where previously done in between can also be done before or after.

This allows for are cleaner implementation of retrying different color
encodings.

Slight change in behaviour: If YCbCr420 is not allowed but display is YCbCr420
only it no longer fails, but just prints an error and tries to fallback on RGB.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
Imho an error message in when YCbCR420 not allowed meets YCbCr420 only can be
a usefull bugfinding tool for cases of blackscreen on exotic configurations.

I'm unsure if this should be a warning instead.

From 883678ef703b6bb15cd2883eb2c5ce27d07911d3 Mon Sep 17 00:00:00 2001
From: Werner Sembach <wse@tuxedocomputers.com>
Date: Mon, 3 May 2021 15:30:40 +0200
Subject: [PATCH 2/3] Restructure output format computation for better
 expandability

---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 65 ++++++++++++-----------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 576d3d910d06..b0201d4f27eb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1999,29 +1999,6 @@ static bool hdmi_deep_color_possible(const struct intel_crtc_state *crtc_state,
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
@@ -2128,6 +2105,30 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
 
+static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
+				     struct intel_crtc_state *crtc_state,
+				     const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int ret;
+	bool ycbcr_420_only;
+
+	ycbcr_420_only = drm_mode_is_420_only(&connector->display_info, adjusted_mode);
+	if (connector->ycbcr_420_allowed && ycbcr_420_only)
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	else {
+		if (!connector->ycbcr_420_allowed && ycbcr_420_only)
+			drm_err(&i915->drm, "Display only supports YCbCr420 output, but connector does not allow it. Fallback to RGB, but this will likely fail.\n");
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
@@ -2152,23 +2153,25 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
