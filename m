Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F477BAB3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03AA10E20B;
	Mon, 14 Aug 2023 13:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335C310E209
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CD2060EB3;
 Mon, 14 Aug 2023 13:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ECCC433C7;
 Mon, 14 Aug 2023 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021411;
 bh=5FwIWakECN1Fb8VdEDsYOpvXNTYQGx7JKvYanIQ8ciM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UrLEtfa3ndkkl9o39vjy3XqAnLqKAgiL0Z0S+hr1T0xLP5/2txg0cu+Fuy7UkyNt6
 71qiEYLzFXGj6B8QgXaX6k4c9SFODQSQ5mqHacMqqu2xPhIk6UYZbhMXynCeFqCRR5
 kK92mVoDjyZjtlvzhY+mVy0h2biK3c+UCLUcurB5NUQ0dmbi7ADejDfMXfTwoSwq/K
 URRRi6BPFRGcqHL9FcNOijWl1A0BkhZbcghXfQHPZL2fKpwxX5w+1JOrsanDqlWZth
 0A9ldENcKAkG3O44gGgqtAOnOvAtwTybFELOUVWoZwVYFc4X8nhHafBth9O3zEEmmM
 NW/5cAVz6ZFOg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:21 +0200
Subject: [PATCH RFC 09/13] drm/connector: hdmi: Compute bpc and format
 automatically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-9-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7067; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5FwIWakECN1Fb8VdEDsYOpvXNTYQGx7JKvYanIQ8ciM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNrerOP5daLYesOKX95d3t8lX57fc3rxlsLye/n6O
 ZoCfE/XdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiF5IY/qkkaFXs27dnUs6V
 lW4b0yd6rFKZo/9CdHf8xinH247cnbaLkWHqpjc5Be+in68xcX+2LEZw3WfDio2nUzLOq+Q8coi
 7a8sFAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have all the infrastructure needed, we can add some code
that will, for a given connector state and mode, compute the best output
format and bpc.

The algorithm is the same one than the one already found in i915 and
vc4.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_hdmi_connector.c | 182 ++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index d94ceeb6a8ef..22c49906dfb5 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -258,6 +258,91 @@ connector_state_get_adjusted_mode(const struct drm_connector_state *state)
 	return &crtc_state->adjusted_mode;
 }
 
+static bool
+sink_supports_format_bpc(const struct drm_hdmi_connector *hdmi_connector,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode,
+			 unsigned int format, unsigned int bpc)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_device *dev = connector->dev;
+	u8 vic = drm_match_cea_mode(mode);
+
+	if (vic == 1 && bpc != 8) {
+		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
+		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	switch (format) {
+	case HDMI_COLORSPACE_RGB:
+		drm_dbg(dev, "RGB Format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			return false;
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV422:
+		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc != 12) {
+			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV444:
+		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	return false;
+}
+
 static enum drm_mode_status
 drm_hdmi_connector_clock_valid(const struct drm_hdmi_connector *hdmi_connector,
 			       const struct drm_display_mode *mode,
@@ -325,6 +410,95 @@ drm_hdmi_connector_compute_clock(const struct drm_hdmi_connector *hdmi_connector
 	return 0;
 }
 
+static bool
+drm_hdmi_connector_try_format_bpc(const struct drm_hdmi_connector *hdmi_connector,
+				  struct drm_hdmi_connector_state *hdmi_state,
+				  const struct drm_display_mode *mode,
+				  unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	const struct drm_display_info *info = &connector->display_info;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg(dev, "Trying output format %s\n",
+		drm_hdmi_connector_get_output_format_name(fmt));
+
+	if (!sink_supports_format_bpc(hdmi_connector, info, mode, fmt, bpc))
+		return false;
+
+	ret = drm_hdmi_connector_compute_clock(hdmi_connector, hdmi_state,
+					       mode, bpc, fmt);
+	if (ret)
+		return false;
+
+	return true;
+}
+
+static int
+drm_hdmi_connector_compute_format(const struct drm_hdmi_connector *hdmi_connector,
+				  struct drm_hdmi_connector_state *hdmi_state,
+				  const struct drm_display_mode *mode,
+				  unsigned int bpc)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_device *dev = connector->dev;
+
+	if (drm_hdmi_connector_try_format_bpc(hdmi_connector, hdmi_state,
+					      mode, bpc, HDMI_COLORSPACE_RGB)) {
+		hdmi_state->output_format = HDMI_COLORSPACE_RGB;
+		return 0;
+	}
+
+	if (drm_hdmi_connector_try_format_bpc(hdmi_connector, hdmi_state,
+					      mode, bpc, HDMI_COLORSPACE_YUV422)) {
+		hdmi_state->output_format = HDMI_COLORSPACE_YUV422;
+		return 0;
+	}
+
+	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
+static int
+drm_hdmi_connector_compute_config(const struct drm_hdmi_connector *hdmi_connector,
+				  struct drm_hdmi_connector_state *hdmi_state,
+				  const struct drm_display_mode *mode)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_connector_state *conn_state = &hdmi_state->base;
+	struct drm_device *dev = connector->dev;
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       conn_state->max_bpc,
+				       8, hdmi_connector->max_bpc);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = drm_hdmi_connector_compute_format(hdmi_connector,
+							hdmi_state,
+							mode, bpc);
+		if (ret)
+			continue;
+
+		hdmi_state->output_bpc = bpc;
+
+		drm_dbg(dev,
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
+			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			hdmi_state->output_bpc,
+			drm_hdmi_connector_get_output_format_name(hdmi_state->output_format),
+			hdmi_state->tmds_char_rate);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_atomic_helper_hdmi_connector_atomic_check() - Helper to check HDMI connector atomic state
  * @connector: the parent connector this state refers to
@@ -357,11 +531,9 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 		connector_state_get_adjusted_mode(new_state);
 	int ret;
 
-	ret = drm_hdmi_connector_compute_clock(hdmi_connector, new_hdmi_state,
-					       mode,
-					       new_hdmi_state->output_bpc,
-					       new_hdmi_state->output_format);
-	if (!ret)
+	ret = drm_hdmi_connector_compute_config(hdmi_connector, new_hdmi_state,
+						mode);
+	if (ret)
 		return ret;
 
 	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb ||

-- 
2.41.0

