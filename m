Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BC90996E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7FA10E208;
	Sat, 15 Jun 2024 17:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zd7GoJkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF1F10E080
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:53:38 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so3531698e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718474017; x=1719078817; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zagial1Hqf0gQMJ4r3bBETUYdf9xoObT6u8X513CE/c=;
 b=zd7GoJkXIdMWLSABvPvfRU7chpz9GZHXyNljhMtiLvWKJsxq/ggKSLwapS/0aqkXHy
 C2TjO0/pes34lh3eFWTJ0MVR+2GpjlFI8/iJYdRl6HyPyZga5FM3F7gcUTYDbHaPpS7F
 0rWKVBxTAA/dU8ZbM+hqdf19OkZU3rYb/EemSsTeVjuvxPXW7PuNzDgj2D53K8LfMsRl
 a25JSY4HU1LryLNzjY4Lwe3t/X9+8G98yCYrKVCTAeulaq5EJGjzF+iiyWSDiAmQJBlZ
 KdZwmJvrRjX+vLqrnzpWATtrcxL35lqei66LE8bPX3HFVoA3t7bC7Hx/TOz4UTmeyW2r
 XKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718474017; x=1719078817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zagial1Hqf0gQMJ4r3bBETUYdf9xoObT6u8X513CE/c=;
 b=UFmfxZl0XpMeXY9ESRMNvjz/W78UdcmDyPoB4FDfPCLCVhb73x8tPc+q7354ts/FIX
 i/mgsBgEJsOZza2Q1PFK3wmTzDsoGvNL87z+7OY8nIjncngKiA1ChF+uOQ2ubFraLyCM
 QuNftcDec2aa4iGrv3MsZB2hUOkFTKCq4Oz7MR/zjbCc2jyY/xL5e5HkbW8fANgsXJyR
 B8e1kGGoIXI/saALB1U5T11VBHu69LfAoealPhxObKa77NiSgyp1OQYUSkNURhUXhtQT
 Xo8/g2pWMehh+qlpCw9ZOreZRjmAUIrp1If67OucnTihEeMWXkYUWymZU2bAvGMmLGDT
 47Mg==
X-Gm-Message-State: AOJu0Yz31+vUv0xiWnb084dorXUcG+mHx7Dxixmcs8ZzowcjogVU2dpI
 1sIYRRSysMGHRqys4Ti4hpkjhQEV2F2V1mSjaFp3jTz5OUhDLX3Nsk1EbP+qa/A=
X-Google-Smtp-Source: AGHT+IGEa6fYbnm8utLHEy/SZhPk/cQQ3mFskFXipOhkauxiVqiW0GWVOkOCWGj8UKZuDXRIYXPRdQ==
X-Received: by 2002:a19:ac03:0:b0:52c:4cfa:c5a6 with SMTP id
 2adb3069b0e04-52ca6e6d56dmr2918061e87.34.1718474017042; 
 Sat, 15 Jun 2024 10:53:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287affcsm799209e87.232.2024.06.15.10.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 10:53:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Jun 2024 20:53:33 +0300
Subject: [PATCH RFC 4/5] drm/bridge: connector: add support for HDMI codec
 framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9543;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9qyJ3spGDjMnMxvSzQbD6SgbbMB2IHj4AFz00AeF73Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbdUcWcZAmhsCIb/4ABEiX4VMbOdSHnfRGXU8u
 fYxUsRmrqKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZm3VHAAKCRCLPIo+Aiko
 1Wn7B/9NCdiqRayjQzUJ96ROIBhJzPiJOV57jaUlAdNu3hJjoZ5puOTfUggvMYIEAX5A1COiTij
 EDJ3SGQOfuShfl4KDkAQ1aBYHcH6ixE51266YpAPZiXZk/pz2Ooz4WL5S5KnHyYQ1Pcox0SI2KA
 Cn45B1QSWmYRGU6p5iIA5/Fh9QktxJp/TLrD7y7nriECTfmQrfu3MGIeU7E1WyIjfEx5j2sjhBn
 h2xtHgqRE2HUxmD9Fpjo6kDbIGMOiH01hNDdR8UNvSBapRJdsNGlIs+SMzenqdu7xjB8nLDHb6X
 EF2B2Axwv6XTFp+BfFlA0OnJTZBJJc9qufqHHmHjGlOULXbJ
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

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 130 ++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h               |  46 ++++++++++++
 2 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0869b663f17e..71d6fdc2391f 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -20,6 +20,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 /**
  * DOC: overview
  *
@@ -95,6 +97,14 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_hdmi_codec:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * HDMI Audio Codec infrastructure, if any (see
+	 * &DRM_BRIDGE_OP_HDMI_CODEC).
+	 */
+	struct drm_bridge *bridge_hdmi_codec;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -343,10 +353,104 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static int drm_bridge_connector_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_codec;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_codec_audio_startup)
+		return bridge->funcs->hdmi_codec_audio_startup(dev, connector, bridge);
+	else
+		return 0;
+}
+
+static int drm_bridge_connector_prepare(struct device *dev, void *data,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_codec;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_codec_prepare(dev, connector, bridge, fmt, hparms);
+}
+
+static void drm_bridge_connector_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_codec;
+	if (!bridge)
+		return;
+
+	bridge->funcs->hdmi_codec_audio_shutdown(dev, connector, bridge);
+}
+
+static int drm_bridge_connector_mute_stream(struct device *dev, void *data,
+					    bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_codec;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_codec_mute_stream)
+		return bridge->funcs->hdmi_codec_mute_stream(dev, connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static int drm_bridge_connector_get_dai_id(struct snd_soc_component *comment,
+					   struct device_node *endpoint,
+					   void *data)
+{
+	struct drm_connector *connector = data;
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_codec;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_codec_get_dai_id)
+		return bridge->funcs->hdmi_codec_get_dai_id(connector, bridge, endpoint);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct hdmi_codec_ops drm_bridge_connector_hdmi_codec_ops = {
+	.audio_startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_prepare,
+	.audio_shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_mute_stream,
+	.get_dai_id = drm_bridge_connector_get_dai_id,
+};
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.codec_ops = &drm_bridge_connector_hdmi_codec_ops,
 };
 
 /* -----------------------------------------------------------------------------
@@ -427,6 +531,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CODEC) {
+			if (bridge_connector->bridge_hdmi_codec)
+				return ERR_PTR(-EBUSY);
+			if (!bridge->funcs->hdmi_codec_prepare ||
+			    !bridge->funcs->hdmi_codec_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi_codec = bridge;
+
+			connector->hdmi_codec.parent_dev = bridge->parent;
+			connector->hdmi_codec.i2s = bridge->hdmi_codec_i2s;
+			connector->hdmi_codec.spdif = bridge->hdmi_codec_spdif;
+			connector->hdmi_codec.max_i2s_channels = bridge->max_i2s_channels;
+
+			bridge->hdmi_codec = &connector->hdmi_codec;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -448,7 +569,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -457,10 +578,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
+		if (!ret && bridge_connector->bridge_hdmi_codec) {
+			ret = drmm_connector_hdmi_codec_alloc(drm, connector,
+							      &drm_bridge_connector_hdmi_codec_ops);
+		}
+	}
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be64..c4a95c489b00 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -41,6 +41,8 @@ struct drm_display_info;
 struct drm_minor;
 struct drm_panel;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 /**
@@ -676,6 +678,29 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	int (*hdmi_codec_audio_startup)(struct device *dev,
+					struct drm_connector *connector,
+					struct drm_bridge *bridge);
+
+	int (*hdmi_codec_prepare)(struct device *dev,
+				  struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	void (*hdmi_codec_audio_shutdown)(struct device *dev,
+					  struct drm_connector *connector,
+					  struct drm_bridge *bridge);
+
+	int (*hdmi_codec_mute_stream)(struct device *dev,
+				      struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
+	int (*hdmi_codec_get_dai_id)(struct drm_connector *connector,
+				     struct drm_bridge *bridge,
+				     struct device_node *endpoint);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -761,6 +786,20 @@ enum drm_bridge_ops {
 	 * drivers.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_CODEC: The bridge provides HDMI Audio Codec
+	 * operations. Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->hdmi_codec_prepare and
+	 * &drm_bridge_funcs->hdmi_codec_audio_shutdown callbacks and set the
+	 * relevant field in the &drm_bridge structure.
+	 *
+	 * This framework can be used by both HDMI and DisplayPort bridges.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers.
+	 */
+	DRM_BRIDGE_OP_HDMI_CODEC = BIT(5),
 };
 
 /**
@@ -771,6 +810,8 @@ struct drm_bridge {
 	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
+	/** @parent: device corresponding to the bridge, required only for HDMI codec */
+	struct device *parent;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
@@ -854,6 +895,11 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	int max_i2s_channels;
+	unsigned int hdmi_codec_i2s : 1;
+	unsigned int hdmi_codec_spdif : 1;
+	struct drm_connector_hdmi_codec *hdmi_codec;
 };
 
 static inline struct drm_bridge *

-- 
2.39.2

