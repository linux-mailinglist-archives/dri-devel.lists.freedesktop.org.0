Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59999381B15
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A0F6E448;
	Sat, 15 May 2021 20:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057496E448
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 20:47:16 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1A55082B36;
 Sat, 15 May 2021 22:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621111635;
 bh=Msdi4EgOgI6YRke3ZH8keGty80PBxiOM+J79VeOtK+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xiHAHygBqKvq+9VQYExqDLLBRgtldScskrSvRwBXZLiH1r42r5lru49bqVWXF8NnC
 D1Ji2N7ba7MfGF5u5LqU3aVPIwmdvXYk1d6MkV5wowNeNPF8XzCA1FXAnxU7AYPDLE
 otK+ndk8dOwlZvkvEABB56SuBcHmo9MJbgNLHb8FQJk6c0BHPtpThtiOONr/91Jr3L
 2/fTCvWX3amWRHaXCRgZhCe9isak2vvYBhL9xnhCVJC+7Gdvj5f7KgUbkSiMqknONG
 9sG3bvtpIwJlqenvs/VGMn/fTpF0QHcd3nNNtu/JBw94p/bM3OGaIxl7Yh4b8AlIjY
 tvi+yHXT5nJ8A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: lvds-codec: Add support for LVDS data mapping
 select
Date: Sat, 15 May 2021 22:46:56 +0200
Message-Id: <20210515204656.367442-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515204656.367442-1-marex@denx.de>
References: <20210515204656.367442-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decoder input LVDS format is a property of the decoder chip or even
its strapping. Handle data-mapping the same way lvds-panel does. In
case data-mapping is not present, do nothing, since there are still
legacy bindings which do not specify this property.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/lvds-codec.c | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 8a7cb267ab14..33f992d52902 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -23,6 +23,7 @@ struct lvds_codec {
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
+	unsigned int bus_format;
 };
 
 static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
@@ -69,10 +70,33 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
 			"Failed to disable regulator \"vcc\": %d\n", ret);
 }
 
+static bool lvds_codec_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adj)
+{
+	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_device *ddev = encoder->dev;
+	struct drm_connector *connector;
+
+	/* If 'data-mapping' was not specified, do nothing. */
+	if (!lvds_codec->bus_format)
+		return true;
+
+	/* Patch in the LVDS format */
+	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 &lvds_codec->bus_format, 1);
+	}
+
+	return true;
+}
+
 static const struct drm_bridge_funcs funcs = {
 	.attach = lvds_codec_attach,
 	.enable = lvds_codec_enable,
 	.disable = lvds_codec_disable,
+	.mode_fixup = lvds_codec_mode_fixup,
 };
 
 static int lvds_codec_probe(struct platform_device *pdev)
@@ -81,6 +105,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	const char *mapping;
 	u32 val;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
@@ -133,6 +158,31 @@ static int lvds_codec_probe(struct platform_device *pdev)
 			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
 	}
 
+	/*
+	 * Decoder input LVDS format is a property of the decoder chip or even
+	 * its strapping. Handle data-mapping the same way lvds-panel does. In
+	 * case data-mapping is not present, do nothing, since there are still
+	 * legacy bindings which do not specify this property.
+	 */
+	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
+		ret = of_property_read_string(dev->of_node, "data-mapping",
+					      &mapping);
+		if (ret < 0) {
+			dev_err(dev, "missing 'data-mapping' DT property\n");
+		} else {
+			if (!strcmp(mapping, "jeida-18")) {
+				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
+			} else if (!strcmp(mapping, "jeida-24")) {
+				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+			} else if (!strcmp(mapping, "vesa-24")) {
+				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+			} else {
+				dev_err(dev, "invalid 'data-mapping' DT property\n");
+				return -EINVAL;
+			}
+		}
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
-- 
2.30.2

