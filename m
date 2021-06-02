Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE703994A7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8EF6EE69;
	Wed,  2 Jun 2021 20:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0D36EE69
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:37:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0981B82F33;
 Wed,  2 Jun 2021 22:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622666259;
 bh=CTX07eRZ3MY1YEnrbwIfEKCFB3jD9a973ZShNGZHkEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YTAEmAJBXOtyaPf8dYBwTCKMRrtfHNfBG5JZudQNq8vLyK2d1djx8EZJC1+Hc3DOS
 RLFxt7Fg4LaUButftnawIL6mchtnrCHFuljz8JAnDvlHsWc0ui3feNe+mNYQ4/BnIJ
 Xvv8hBWXDisMWmWpqO3dNqMOeGSVTUf4oXih1Dr3Ts0QiMiUnz5frSvbLCDuqM5C2n
 rfCvghA6Jpn2kPDL5MkIJDKqjq7+2k/K/ml2wlUynjVAY0SukbKLDnkovRW8LiILvD
 ZPOxe5XIaqLkCv5SG+F4GafJns7QKlbLORjRzewZesqx7Ey3BA+nMDu8rHOeET8CjH
 4bT5xC+A5oyBA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Date: Wed,  2 Jun 2021 22:37:31 +0200
Message-Id: <20210602203731.419310-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602203731.419310-1-marex@denx.de>
References: <20210602203731.419310-1-marex@denx.de>
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
V2: - Move the data-mapping to endpoint
---
 drivers/gpu/drm/bridge/lvds-codec.c | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 80ce6783d10a8..0719744e1cddb 100644
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
@@ -82,7 +106,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *bus_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	const char *mapping;
 	u32 val;
+	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -143,6 +169,38 @@ static int lvds_codec_probe(struct platform_device *pdev)
 		of_node_put(bus_node);
 	}
 
+	/*
+	 * Decoder input LVDS format is a property of the decoder chip or even
+	 * its strapping. Handle data-mapping the same way lvds-panel does. In
+	 * case data-mapping is not present, do nothing, since there are still
+	 * legacy bindings which do not specify this property.
+	 */
+	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
+		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
+		if (!bus_node) {
+			dev_dbg(dev, "bus DT node not found\n");
+			return -ENXIO;
+		}
+
+		ret = of_property_read_string(bus_node, "data-mapping",
+					      &mapping);
+		of_node_put(bus_node);
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

