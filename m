Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA290996C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377A610E033;
	Sat, 15 Jun 2024 17:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WUCiOGTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04010E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:53:36 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52b7e693b8aso3742079e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718474015; x=1719078815; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QlANpMb5skb9j8A6rCketIfwen0xll0H3lJtTWXdrxI=;
 b=WUCiOGTuzKiSanm6LKF8oM0zHLyTQ0lepxzVJAVQ0WT9Yatx6cmAjTAIoSPZxMiHUj
 /HISaj/+8Zz77dS70rgRncZ9IZLDzxUEF1vXO9MXIWT30vEdcoBNCko0Z8aMvvTBDJq3
 nFiuXMD4pSvBLUuxMzXu7O4Y3chjwb9e+HUWOPiot5ehR0TP9sM3hJsE9X4kwbTojqOK
 va1aIT4ZYxo8iSjTAFEgQGv4nxjzcUdYZUGXsnKXHIQs7c4szYYxgid43p0fkA14VNsQ
 bdi6G8tknx+MoWnZmqwv2ZCvxTYI5YlOme3c6RlUfxgKYwF7au3yQfnZPq/oAXDdU5NV
 mG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718474015; x=1719078815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlANpMb5skb9j8A6rCketIfwen0xll0H3lJtTWXdrxI=;
 b=v3JIvswHwOpS9dyfiTsMz8E+fAFXGzfXrtKRlK+dJ8PiTmBJ7IplNRAYfNkubXjOUJ
 GfZ+q/hdL3RE67IuWi6m8QS0sCeW4wLfI4KdoP37rU84w2kx6agWcefHYRzPBUqBPYHc
 AXqIlN/f0uylDV7Ha+glAuR4zZkiceKfn0dDKro6C2WLq0gtbnohKtFbmkXBT2fcNpDc
 GbSnLhrCkWCLskwnsNAUQYxEHMXV0AeHhnBt8vGPouqPMlrws5UU3ROf11wi1ttMfV0I
 bT1H8p4y1JGDq5qLod9OoeyL2rfTpIdDb8GkuLglRew7eKbiVgag9qg8GqXlvDZlZ7Ca
 OGNA==
X-Gm-Message-State: AOJu0Yw22o0gXAbeLTsVTmWcL25Oc7LYneUIXv/Ex+2l16cLXEgJekNK
 neW/WoE0v8QSDrjMPPQBy14QSGhj0fbg10E5ZUrFi98w3uP4ZeNgUMtFTJCnUZY=
X-Google-Smtp-Source: AGHT+IHrTqiamW3tjd1h0AT0KzFG/oQcLS/rGaUBf5VuD/2/RtRDBwEeBxYBBv6ORagQqAsz4VOglg==
X-Received: by 2002:a05:6512:ba0:b0:52c:8dea:c56f with SMTP id
 2adb3069b0e04-52ca6cc6e6bmr2428094e87.25.1718474014884; 
 Sat, 15 Jun 2024 10:53:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287affcsm799209e87.232.2024.06.15.10.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 10:53:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Jun 2024 20:53:30 +0300
Subject: [PATCH RFC 1/5] drm/bridge: lt9611: use HDMI Connector helper to
 set InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240615-drm-bridge-hdmi-connector-v1-1-d59fc7865ab2@linaro.org>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8080;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aL8nPSZM3lQNEMPRaCYGZfpxv/0gb5cmUE3ToFjqcjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbdUc5OiUzAZhdrE2hgXcqb9AuEMwC4hboqUw/
 TdOkcnk+vaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZm3VHAAKCRCLPIo+Aiko
 1eEpB/4pD9xOj0U7d0zlANyosGgLZMuY5Z39+KplUH8AYJi0qP23SR9naWQ3Zjd9IRCCuYT6ci9
 CpbSLZxjnQrmzKY/hNkND0RTXEO2xq8PIyO2Bz7JVtdrXQY798c1DWk594WUjyUMvURU3SnhKDo
 P701fO8wo1DfyVRFdY3toI6QZR9TzJlS1HMRthB9tqfS2CTc59NiVXltHZpSXqRdIPd0LSUyPDF
 st4G/0eiHKTS7H8AqilwFzURyFbE6/rBzsZHM5Mz4IMiRYQY7btCDggLu6o8iqGwKh54mcq/JyN
 SnaIkkSNu80NxPJO/229ODMf+z1S4B85X0Kz/ADnXD5IblEH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new HDMI Connector helpers in the Lontium LT9611 bridge driver.
Program InfoFrames using the helper's callbacks. Also use TMDS char rate
validation callback to filter out modes, instead of hardcoding 4k@30.

The Audio InfoFrame isn't yet handled by these helpers, it requires
additional drm_bridge interface changes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/Kconfig          |   2 +
 drivers/gpu/drm/bridge/lontium-lt9611.c | 173 ++++++++++++++++++++++----------
 2 files changed, 120 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..b27b8a072101 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -140,6 +140,8 @@ config DRM_LONTIUM_LT9611
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select REGMAP_I2C
 	help
 	  Driver for Lontium LT9611 DSI to HDMI bridge
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 73983f9b50cb..1b31fdebe164 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -23,6 +23,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #define EDID_SEG_SIZE	256
 #define EDID_LEN	32
@@ -333,49 +335,6 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_set_infoframes(struct lt9611 *lt9611,
-				       struct drm_connector *connector,
-				       struct drm_display_mode *mode)
-{
-	union hdmi_infoframe infoframe;
-	ssize_t len;
-	u8 iframes = 0x0a; /* UD1 infoframe */
-	u8 buf[32];
-	int ret;
-	int i;
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
-						       connector,
-						       mode);
-	if (ret < 0)
-		goto out;
-
-	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
-	if (len < 0)
-		goto out;
-
-	for (i = 0; i < len; i++)
-		regmap_write(lt9611->regmap, 0x8440 + i, buf[i]);
-
-	ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
-							  connector,
-							  mode);
-	if (ret < 0)
-		goto out;
-
-	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
-	if (len < 0)
-		goto out;
-
-	for (i = 0; i < len; i++)
-		regmap_write(lt9611->regmap, 0x8474 + i, buf[i]);
-
-	iframes |= 0x20;
-
-out:
-	regmap_write(lt9611->regmap, 0x843d, iframes); /* UD1 infoframe */
-}
-
 static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
 {
 	if (is_hdmi)
@@ -719,7 +678,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	lt9611_mipi_input_analog(lt9611);
-	lt9611_hdmi_set_infoframes(lt9611, connector, mode);
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
@@ -798,22 +757,25 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay > 2160)
-		return MODE_BAD_VVALUE;
-
-	if (mode->hdisplay == 3840 &&
-	    mode->vdisplay == 2160 &&
-	    drm_mode_vrefresh(mode) > 30)
-		return MODE_CLOCK_HIGH;
-
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
-	else
-		return MODE_OK;
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+}
+
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
+						      conn_state->state);
 }
 
 static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -887,6 +849,99 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+/*
+ * Other working frames:
+ * - 0x01, 0x84df
+ * - 0x04, 0x84c0
+ */
+#define LT9611_INFOFRAME_AUDIO	0x02
+#define LT9611_INFOFRAME_AVI	0x08
+#define LT9611_INFOFRAME_SPD	0x10
+#define LT9611_INFOFRAME_VENDOR	0x20
+
+static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	unsigned int mask;
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		mask = LT9611_INFOFRAME_AVI;
+		break;
+
+	case HDMI_INFOFRAME_TYPE_SPD:
+		mask = LT9611_INFOFRAME_SPD;
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		mask = LT9611_INFOFRAME_VENDOR;
+		break;
+
+	default:
+		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		mask = 0;
+		break;
+	}
+
+	if (mask)
+		regmap_update_bits(lt9611->regmap, 0x843d, mask, 0);
+
+	return 0;
+}
+
+static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type,
+				       const u8 *buffer, size_t len)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	unsigned int mask, addr;
+	int i;
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		mask = LT9611_INFOFRAME_AVI;
+		addr = 0x8440;
+		break;
+
+	case HDMI_INFOFRAME_TYPE_SPD:
+		mask = LT9611_INFOFRAME_SPD;
+		addr = 0x8493;
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		mask = LT9611_INFOFRAME_VENDOR;
+		addr = 0x8474;
+		break;
+
+	default:
+		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		mask = 0;
+		break;
+	}
+
+	if (mask) {
+		for (i = 0; i < len; i++)
+			regmap_write(lt9611->regmap, addr + i, buffer[i]);
+
+		regmap_update_bits(lt9611->regmap, 0x843d, mask, mask);
+	}
+
+	return 0;
+}
+
+static enum drm_mode_status
+lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 unsigned long long tmds_rate)
+{
+	/* 297 MHz for 4k@30 mode */
+	if (tmds_rate > 297000000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -894,6 +949,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,
@@ -902,6 +958,10 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
+
+	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
+	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
+	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1116,8 +1176,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES;
+			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
+			     DRM_BRIDGE_OP_HDMI;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	lt9611->bridge.vendor = "Lontium";
+	lt9611->bridge.product = "LT9611";
 
 	drm_bridge_add(&lt9611->bridge);
 

-- 
2.39.2

