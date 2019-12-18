Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31155124BFF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37756E7D9;
	Wed, 18 Dec 2019 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB16E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u2so2427530wmc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EWqOf/5UfTccr1sJk8zcGA3/YrXns3N3R5vrlaa1tsw=;
 b=fNXpv0MQigpQq9QWpaECPWq/TJQPRlMCrAFYKp9+bYz326CfY2XlV/ljb4s9go9jQv
 ICmG56WGtG23fdKhDuBsc+dEolIomKAP+HQEyzsh7hEsWUJQsEeWSwXiIsL6hgY/vXln
 2RacogP8lrdod3tGWHd4P8R/Dbq9l0XKPiTBhPFnvv9HrEV21Dk3sz14YIIRNIi/bxDv
 NpTJbM+PJPOrDz0xtDSUmZvOwZbHckLe7ICJyaiHnzj4f+mml5x2A4xtUuY+yWGFXv5h
 jiC6OCr1tXBQu4mWAUwI433cMtpP56CJxfS77vVbWDseUugL1ZJ6K9i3Jij5kK0HERin
 Xpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWqOf/5UfTccr1sJk8zcGA3/YrXns3N3R5vrlaa1tsw=;
 b=Mixmw1O08KhQLvN6bBCvdOt7l0q8vDyTqWpgN0kVWWI7ZVil/xd0ADoHWQgxvGEMM/
 TlV8sGvS7RVym1zbeU2Pph85bZgvbdgzkP0wE9UbTsKjCM/78IkSujz7nl0AKUja9ze0
 2LBEqnGIwoHDZ5h547eA1foCZ7sH/fHEku0HO5genh3baPl9Z+W5MKJE3a+ifZqkMMGa
 9t+YNkfYXkcmTQoorBv85LXR1tkbISbEke5/4tF1+hfWjimx3UjGgs1HX8Ytkhi3yQZJ
 s/vTs10wI1N6BCQ3qG4aK8ESaCup8niS6K74Wtmhc1ZqoQAOLQpnnwi9gGAE6evDSKvX
 sjDQ==
X-Gm-Message-State: APjAAAXOBXksPUqxcSdvd87UUwx4g6gndb/0B52dK1zWNmWbhJsdQbXF
 HOzgQKZ/hwgSGr0eFOJpybDzAdj7BklDJw==
X-Google-Smtp-Source: APXvYqwNIo0BhhB8Os+El8dDodmlGQql13R1ahhp8EAPzPhOFlgUl6OqEUvz8hKxOnkipdjEHGjwDQ==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr4029068wmj.96.1576684003606; 
 Wed, 18 Dec 2019 07:46:43 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:42 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 03/10] drm/bridge: synopsys: dw-hdmi: add bus format
 negociation
Date: Wed, 18 Dec 2019 16:46:30 +0100
Message-Id: <20191218154637.17509-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate
the possible output and input formats for the current mode and monitor,
and use the negotiated formats in a basic atomic_check callback.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 272 +++++++++++++++++++++-
 1 file changed, 268 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e7a0600f8cc5..8c1f7e5e6698 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2069,11 +2069,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
 	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
 
-	/* TOFIX: Get input format from plat data or fallback to RGB888 */
 	if (hdmi->plat_data->input_bus_format)
 		hdmi->hdmi_data.enc_in_bus_format =
 			hdmi->plat_data->input_bus_format;
-	else
+	else if (hdmi->hdmi_data.enc_in_bus_format == MEDIA_BUS_FMT_FIXED)
 		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	/* TOFIX: Get input encoding from plat data or fallback to none */
@@ -2083,8 +2082,8 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	else
 		hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
 
-	/* TOFIX: Default to RGB888 output format */
-	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
+		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
@@ -2350,6 +2349,267 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.atomic_check = dw_hdmi_connector_atomic_check,
 };
 
+/*
+ * Possible output formats :
+ * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
+ * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
+ * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
+ * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+ * - MEDIA_BUS_FMT_YUV16_1X48,
+ * - MEDIA_BUS_FMT_RGB161616_1X48,
+ * - MEDIA_BUS_FMT_UYVY12_1X24,
+ * - MEDIA_BUS_FMT_YUV12_1X36,
+ * - MEDIA_BUS_FMT_RGB121212_1X36,
+ * - MEDIA_BUS_FMT_UYVY10_1X20,
+ * - MEDIA_BUS_FMT_YUV10_1X30,
+ * - MEDIA_BUS_FMT_RGB101010_1X30,
+ * - MEDIA_BUS_FMT_UYVY8_1X16,
+ * - MEDIA_BUS_FMT_YUV8_1X24,
+ * - MEDIA_BUS_FMT_RGB888_1X24,
+ */
+
+/* Can return a maximum of 12 possible output formats for a mode/connector */
+#define MAX_OUTPUT_SEL_FORMATS	12
+
+static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct drm_connector *conn = conn_state->connector;
+	struct drm_display_info *info = &conn->display_info;
+	struct drm_display_mode *mode = &crtc_state->mode;
+	u8 max_bpc = conn_state->max_requested_bpc;
+	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
+			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
+	u32 *output_fmts;
+	int i = 0;
+
+	*num_output_fmts = 0;
+
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	/*
+	 * If the current mode enforces 4:2:0, force the output but format
+	 * to 4:2:0 and do not add the YUV422/444/RGB formats
+	 */
+	if (conn->ycbcr_420_allowed &&
+	    (drm_mode_is_420_only(info, mode) ||
+	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
+
+		/* Order bus formats from 16bit to 8bit if supported */
+		if (max_bpc >= 16 && info->bpc == 16 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
+
+		if (max_bpc >= 12 && info->bpc >= 12 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+
+		if (max_bpc >= 10 && info->bpc >= 10 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+
+		/* Default 8bit fallback */
+		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+
+		*num_output_fmts = i;
+
+		return output_fmts;
+	}
+
+	/*
+	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
+	 * if supported. In any case the default RGB888 format is added
+	 */
+
+	if (max_bpc >= 16 && info->bpc == 16) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+	}
+
+	if (max_bpc >= 12 && info->bpc >= 12) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+	}
+
+	if (max_bpc >= 10 && info->bpc >= 10) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+
+	/* Default 8bit RGB fallback */
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num_output_fmts = i;
+
+	return output_fmts;
+}
+
+/*
+ * Possible input formats :
+ * - MEDIA_BUS_FMT_RGB888_1X24
+ * - MEDIA_BUS_FMT_YUV8_1X24
+ * - MEDIA_BUS_FMT_UYVY8_1X16
+ * - MEDIA_BUS_FMT_UYYVYY8_0_5X24
+ * - MEDIA_BUS_FMT_RGB101010_1X30
+ * - MEDIA_BUS_FMT_YUV10_1X30
+ * - MEDIA_BUS_FMT_UYVY10_1X20
+ * - MEDIA_BUS_FMT_UYYVYY10_0_5X30
+ * - MEDIA_BUS_FMT_RGB121212_1X36
+ * - MEDIA_BUS_FMT_YUV12_1X36
+ * - MEDIA_BUS_FMT_UYVY12_1X24
+ * - MEDIA_BUS_FMT_UYYVYY12_0_5X36
+ * - MEDIA_BUS_FMT_RGB161616_1X48
+ * - MEDIA_BUS_FMT_YUV16_1X48
+ * - MEDIA_BUS_FMT_UYYVYY16_0_5X48
+ */
+
+/* Can return a maximum of 4 possible input formats for an output format */
+#define MAX_INPUT_SEL_FORMATS	4
+
+static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+	int i = 0;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	/* 8bit */
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+
+	/* 10bit */
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		break;
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		break;
+
+	/* 12bit */
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		break;
+	case MEDIA_BUS_FMT_YUV12_1X36:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
+
+	/* 16bit */
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+		break;
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+		break;
+
+	/* 420 */
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		input_fmts[i++] = output_fmt;
+		break;
+	}
+
+	*num_input_fmts = i;
+
+	if (*num_input_fmts == 0) {
+		kfree(input_fmts);
+		input_fmts = NULL;
+	}
+
+	return input_fmts;
+}
+
+static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	dev_dbg(hdmi->dev, "selected output format %x\n",
+			bridge_state->output_bus_cfg.format);
+
+	hdmi->hdmi_data.enc_out_bus_format =
+			bridge_state->output_bus_cfg.format;
+
+	dev_dbg(hdmi->dev, "selected input format %x\n",
+			bridge_state->input_bus_cfg.format);
+
+	hdmi->hdmi_data.enc_in_bus_format =
+			bridge_state->input_bus_cfg.format;
+
+	return 0;
+}
+
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
@@ -2458,6 +2718,9 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.attach = dw_hdmi_bridge_attach,
 	.detach = dw_hdmi_bridge_detach,
+	.atomic_check = dw_hdmi_bridge_atomic_check,
+	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
@@ -2921,6 +3184,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
+
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
