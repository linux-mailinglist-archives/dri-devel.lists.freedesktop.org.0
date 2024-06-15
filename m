Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63DC909972
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EA210E190;
	Sat, 15 Jun 2024 17:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JX6I6q4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A496110E080
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:53:39 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52c815e8e9eso3363977e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718474018; x=1719078818; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BNoqJV99DpCpKEKBVdbTZULLg3yGlQIJ3RlKgG+D6Ow=;
 b=JX6I6q4lb6kD+yPIoZ8fUmFoE5YFjyZvK42rBMqRJb3qtwUyrFxkdau7ngrNZ3SI8A
 4oBZX4T6u7dukSAEgTEvqkFMLmWb7BjDqcy6kxRflkvf7nQAIGEm0qk9KNcCjxtGKmiQ
 4u6OFFV1bGI9/IBLnBba/am9HBCiD072QHm6j/U6jeTDGR6OdPbTEKUrs+PF1yw5BvmN
 FpOtXmtS+IpYN5iu+JH5WuLAK0QPyC9EEYyTrbagzeu0vnxrwPFb9P3t7FfoNdrUQgNa
 irRsT3B0qWA2pnhBrrp3ztci1rUF35ibH+Dheho8U/bGbJ8w9KkMPOrSTsAHi912cxo5
 +ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718474018; x=1719078818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNoqJV99DpCpKEKBVdbTZULLg3yGlQIJ3RlKgG+D6Ow=;
 b=gx+kIWqPrzxKnFnemf4RQamnKQSHV9+shSV1BlZkGeJmL7hbuna2ogtCQ+8CWvb/HW
 1vkNJN4BT/pVLeCf4KQbQokNopcc2owDIq+3X1BymdCQ4bKDJs48hFlzMrqp9+MZDh0H
 wKcZPVDn6903ow6aFSNwcLaYYvumcv+xnhnB4TpSOa9RqMPIA6dZiI07lkgBWnsu6M3y
 Fwcx12zgeWyBpogAy7+JJHlhMjsrFIB7mDLvlz3I4Vc3FHg/4zwh1TYaoDU8GKzvBkLa
 Up2buBIQdoTdYESOrf3wHl/keT+YszFt15DgknvV7YSNx7Rhntowjr2nJGezDCJOtJlt
 cNhw==
X-Gm-Message-State: AOJu0YyVcdR+ceilvDLFS8Hf7GOWK1f/zwHVHzKs2/WweUkyZXMIBGkj
 W79Ae3ng2iLob9U0MAvnOfktfRQ3kikqyYZ/tm27O1AEU5SQqER64T2Q29wRiE0=
X-Google-Smtp-Source: AGHT+IGMV2nV7xKWzH/4jIfi24E5+YGvRngTLXuMdzhfRlPyiUnBTAiPzEX2D9ECyNJt1xnPR/7s5Q==
X-Received: by 2002:ac2:53a7:0:b0:52c:84b0:bd21 with SMTP id
 2adb3069b0e04-52ca6e653femr3874949e87.16.1718474017740; 
 Sat, 15 Jun 2024 10:53:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287affcsm799209e87.232.2024.06.15.10.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 10:53:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Jun 2024 20:53:34 +0300
Subject: [PATCH RFC 5/5] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9303;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pg+NRAC0FNupuz6uv3BfUWUNO6rGMBpHZpbeR8Kzwy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbdUdiPOrd2HtCz9fm5aEflYaOE/wUAWKLvFrG
 2NyaQ0z1OWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZm3VHQAKCRCLPIo+Aiko
 1RkRCACS1kFdCiPQG5o+eQXNCAkRvuZZavw4HRwK4olL+TOkKtgLKWSlo/rhMujreuc3g3c/O/f
 vBcgurnu5awKebMRausxudvE9PfQpVjiw03oPbe0kyiLzFfJdsDU9POGTpghbjxbPHjZFtuRAqO
 8T9ZuX3fGExcwdHWSUK35XWJwIaflRa9Ufgfr/d7cEEYYq/OhU1oZNjqW2Y8aQ2pLI4Vqn/Dt61
 Re3KfBJm+lgUY24J4oJA+SQUSh5n5SjVBS8Ydfs5nPae63MY/hjZ105SOmEk2BBcWOJBwxqsR5h
 781wwoauK61FcgzAwJk35MePBiQbYuk+2uSBxqbqE0CCBsUJ
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

Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
framework. This enables programming of Audio InfoFrames using the HDMI
Connector interface and also enables support for the missing features,
including the ELD retrieval and better hotplug support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 207 ++++++++++++++++----------------
 1 file changed, 104 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 4fa0dfc5539a..02953468cb76 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -45,7 +45,6 @@ struct lt9611 {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	bool ac_mode;
 
@@ -688,15 +687,22 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	/* Enable HDMI output */
 	regmap_write(lt9611->regmap, 0x8130, 0xea);
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
 }
 
 static void
 lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
 			     struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector;
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	int ret;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	drm_connector_hdmi_codec_plugged_notify(connector, false);
+
 	/* Disable HDMI output */
 	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
 	if (ret) {
@@ -866,6 +872,10 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	unsigned int mask;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		break;
@@ -899,6 +909,11 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	int i;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		addr = 0x84b2;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		addr = 0x8440;
@@ -942,6 +957,79 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int lt9611_hdmi_codec_prepare(struct device *dev,
+				     struct drm_connector *connector,
+				     struct drm_bridge *bridge,
+				     struct hdmi_codec_daifmt *fmt,
+				     struct hdmi_codec_params *hparms)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	if (hparms->sample_rate == 48000)
+		regmap_write(lt9611->regmap, 0x840f, 0x2b);
+	else if (hparms->sample_rate == 96000)
+		regmap_write(lt9611->regmap, 0x840f, 0xab);
+	else
+		return -EINVAL;
+
+	regmap_write(lt9611->regmap, 0x8435, 0x00);
+	regmap_write(lt9611->regmap, 0x8436, 0x18);
+	regmap_write(lt9611->regmap, 0x8437, 0x00);
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static int lt9611_hdmi_codec_audio_startup(struct device *dev,
+					   struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	regmap_write(lt9611->regmap, 0x82d7, 0x04);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x08);
+	regmap_write(lt9611->regmap, 0x8407, 0x10);
+
+	regmap_write(lt9611->regmap, 0x8434, 0xd5);
+
+	return 0;
+}
+
+static void lt9611_hdmi_codec_audio_shutdown(struct device *dev,
+					     struct drm_connector *connector,
+					     struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	drm_atomic_helper_connector_hdmi_disable_audio_infoframe(connector);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x00);
+	regmap_write(lt9611->regmap, 0x8407, 0x00);
+}
+
+static int lt9611_hdmi_codec_get_dai_id(struct drm_connector *connector,
+					struct drm_bridge *bridge,
+					struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * HDMI sound should be located as reg = <2>
+	 * Then, it is sound port 0
+	 */
+	if (of_ep.port == 2)
+		return 0;
+
+	return -EINVAL;
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -962,6 +1050,11 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
 	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+
+	.hdmi_codec_audio_startup = lt9611_hdmi_codec_audio_startup,
+	.hdmi_codec_prepare = lt9611_hdmi_codec_prepare,
+	.hdmi_codec_audio_shutdown = lt9611_hdmi_codec_audio_shutdown,
+	.hdmi_codec_get_dai_id = lt9611_hdmi_codec_get_dai_id,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1015,102 +1108,6 @@ static int lt9611_read_device_rev(struct lt9611 *lt9611)
 	return ret;
 }
 
-static int lt9611_hdmi_hw_params(struct device *dev, void *data,
-				 struct hdmi_codec_daifmt *fmt,
-				 struct hdmi_codec_params *hparms)
-{
-	struct lt9611 *lt9611 = data;
-
-	if (hparms->sample_rate == 48000)
-		regmap_write(lt9611->regmap, 0x840f, 0x2b);
-	else if (hparms->sample_rate == 96000)
-		regmap_write(lt9611->regmap, 0x840f, 0xab);
-	else
-		return -EINVAL;
-
-	regmap_write(lt9611->regmap, 0x8435, 0x00);
-	regmap_write(lt9611->regmap, 0x8436, 0x18);
-	regmap_write(lt9611->regmap, 0x8437, 0x00);
-
-	return 0;
-}
-
-static int lt9611_audio_startup(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
-	regmap_write(lt9611->regmap, 0x82d7, 0x04);
-
-	regmap_write(lt9611->regmap, 0x8406, 0x08);
-	regmap_write(lt9611->regmap, 0x8407, 0x10);
-
-	regmap_write(lt9611->regmap, 0x8434, 0xd5);
-
-	return 0;
-}
-
-static void lt9611_audio_shutdown(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x8406, 0x00);
-	regmap_write(lt9611->regmap, 0x8407, 0x00);
-}
-
-static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint,
-				      void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611_codec_ops = {
-	.hw_params	= lt9611_hdmi_hw_params,
-	.audio_shutdown = lt9611_audio_shutdown,
-	.audio_startup	= lt9611_audio_startup,
-	.get_dai_id	= lt9611_hdmi_i2s_get_dai_id,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &lt9611_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
-{
-	codec_data.data = lt9611;
-	lt9611->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
-}
-
-static void lt9611_audio_exit(struct lt9611 *lt9611)
-{
-	if (lt9611->audio_pdev) {
-		platform_device_unregister(lt9611->audio_pdev);
-		lt9611->audio_pdev = NULL;
-	}
-}
-
 static int lt9611_probe(struct i2c_client *client)
 {
 	struct lt9611 *lt9611;
@@ -1174,14 +1171,20 @@ static int lt9611_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lt9611);
 
+	/* Disable Audio InfoFrame, enabled by default */
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
+
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI;
+			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_CODEC;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.parent = dev;
+	lt9611->bridge.max_i2s_channels = 8;
+	lt9611->bridge.hdmi_codec_i2s = 1;
 
 	drm_bridge_add(&lt9611->bridge);
 
@@ -1203,10 +1206,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611_enable_hpd_interrupts(lt9611);
 
-	ret = lt9611_audio_init(dev, lt9611);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -1227,7 +1226,9 @@ static void lt9611_remove(struct i2c_client *client)
 	struct lt9611 *lt9611 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	lt9611_audio_exit(lt9611);
+	if (lt9611->bridge.dev)
+		drmm_connector_hdmi_codec_free(lt9611->bridge.dev,
+					       lt9611->bridge.hdmi_codec);
 	drm_bridge_remove(&lt9611->bridge);
 
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);

-- 
2.39.2

