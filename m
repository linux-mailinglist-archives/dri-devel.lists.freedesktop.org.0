Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75D428BD8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2F56E489;
	Mon, 11 Oct 2021 11:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178C6E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 11:21:50 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E927582B68;
 Mon, 11 Oct 2021 13:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633951308;
 bh=9SJciVdhso2URpnCSgVuQE0kC2L0AhV5gxVXRoJNQTI=;
 h=From:To:Cc:Subject:Date:From;
 b=LkOyMQsPVZUhzlJRhIUKTSKwOGeMPUR4/sd/etW6iapkZZl9Cw6oZdOMQA6zliWhe
 eY8mPq+HXZesvRvuPuoeF9qygbU+u/OkkJKId+wMM537PYc89CNdHpW7G9lrHikXq1
 AaH4HQMpnMycEBvS53xJHvCtButfkXJki6Tyseb45awZRumIKcH1MXHQN4LuA3i8UF
 VXtqZU8NuZZQsnD7mh2ifk/oU/eTybKEfrs1P4FQgcPdflE5hK0j3uRF3wGOL/YEN4
 mxkK4Jt5HalEHXevYi9DvTOqh9pdZ56rU7Pwx4FIr3/tSsRI7KmnTCUbP8y7AL2TQO
 lluanCitBYJFw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2] drm: of: Add drm_of_lvds_get_data_mapping
Date: Mon, 11 Oct 2021 13:21:33 +0200
Message-Id: <20211011112133.5313-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper function to convert DT "data-mapping" property string value
into media bus format value, and deduplicate the code in panel-lvds.c
and lvds-codec.c .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
V2: Drop bogus semicolon
---
 drivers/gpu/drm/bridge/lvds-codec.c | 21 ++++++------------
 drivers/gpu/drm/drm_of.c            | 33 +++++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c  | 18 ++++------------
 include/drm/drm_of.h                |  7 ++++++
 4 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index ad460b96c0a3..f991842a161f 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 struct lvds_codec {
@@ -118,7 +119,6 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *bus_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
-	const char *mapping;
 	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
@@ -174,22 +174,15 @@ static int lvds_codec_probe(struct platform_device *pdev)
 			return -ENXIO;
 		}
 
-		ret = of_property_read_string(bus_node, "data-mapping",
-					      &mapping);
+		ret = drm_of_lvds_get_data_mapping(bus_node);
 		of_node_put(bus_node);
-		if (ret < 0) {
+		if (ret == -ENODEV) {
 			dev_warn(dev, "missing 'data-mapping' DT property\n");
+		} else if (ret) {
+			dev_err(dev, "invalid 'data-mapping' DT property\n");
+			return ret;
 		} else {
-			if (!strcmp(mapping, "jeida-18")) {
-				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
-			} else if (!strcmp(mapping, "jeida-24")) {
-				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
-			} else if (!strcmp(mapping, "vesa-24")) {
-				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
-			} else {
-				dev_err(dev, "invalid 'data-mapping' DT property\n");
-				return -EINVAL;
-			}
+			lvds_codec->bus_format = ret;
 			lvds_codec->bridge.funcs = &funcs_decoder;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 37c34146eea8..a9217bc18e8f 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -402,3 +402,36 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
 }
 EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+
+/**
+ * drm_of_lvds_get_data_mapping - Get LVDS data mapping
+ * @port: DT port node of the LVDS source or sink
+ *
+ * Convert DT "data-mapping" property string value into media bus format value.
+ *
+ * Return:
+ * MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - data-mapping is "jeida-18"
+ * MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA - data-mapping is "jeida-24"
+ * MEDIA_BUS_FMT_RGB888_1X7X4_SPWG - data-mapping is "vesa-24"
+ * -EINVAL - the "data-mapping" property is unsupported
+ * -ENODEV - the "data-mapping" property is missing
+ */
+int drm_of_lvds_get_data_mapping(const struct device_node *port)
+{
+	const char *mapping;
+	int ret;
+
+	ret = of_property_read_string(port, "data-mapping", &mapping);
+	if (ret < 0)
+		return -ENODEV;
+
+	if (!strcmp(mapping, "jeida-18"))
+		return MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
+	if (!strcmp(mapping, "jeida-24"))
+		return MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	if (!strcmp(mapping, "vesa-24"))
+		return MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_data_mapping);
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 59a8d99e777d..27a1c9923b09 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -20,6 +20,7 @@
 #include <video/videomode.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 struct panel_lvds {
@@ -116,7 +117,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 {
 	struct device_node *np = lvds->dev->of_node;
 	struct display_timing timing;
-	const char *mapping;
 	int ret;
 
 	ret = of_drm_get_panel_orientation(np, &lvds->orientation);
@@ -149,24 +149,14 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 
 	of_property_read_string(np, "label", &lvds->label);
 
-	ret = of_property_read_string(np, "data-mapping", &mapping);
+	ret = drm_of_lvds_get_data_mapping(np);
 	if (ret < 0) {
 		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
 			np, "data-mapping");
-		return -ENODEV;
+		return ret;
 	}
 
-	if (!strcmp(mapping, "jeida-18")) {
-		lvds->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
-	} else if (!strcmp(mapping, "jeida-24")) {
-		lvds->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
-	} else if (!strcmp(mapping, "vesa-24")) {
-		lvds->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
-	} else {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "data-mapping");
-		return -EINVAL;
-	}
+	lvds->bus_format = ret;
 
 	lvds->data_mirror = of_property_read_bool(np, "data-mirror");
 
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b9b093add92e..99f79ac8b4cd 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -49,6 +49,7 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
+int drm_of_lvds_get_data_mapping(const struct device_node *port);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -98,6 +99,12 @@ drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 {
 	return -EINVAL;
 }
+
+static inline int
+drm_of_lvds_get_data_mapping(const struct device_node *port)
+{
+	return -EINVAL;
+}
 #endif
 
 /*
-- 
2.33.0

