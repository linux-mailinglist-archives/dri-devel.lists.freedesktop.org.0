Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4943D6865
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 23:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5276ECD2;
	Mon, 26 Jul 2021 21:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7107A6ECD2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 21:03:10 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7493E833C2;
 Mon, 26 Jul 2021 23:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1627333388;
 bh=PtSRmhb8cRpEzLzg0IUxWUXiHdvXSenKzQcWXpTXD1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RIZSXBxWAj1hcjFzyNaOwjoHnfhyGRsXE+m8Zj9KOxMg8pubYA8Se45p/699tKz5Q
 80Q3nRnGWRqrwwMSYauubrh5V7jKN4F9pOYpDxUHEbm4+pUjqS+y5B6kZcgvYseahc
 3sOCvsIyi4dIjoav0H6alJViwgOYTIqxm/Fez+w/L34eZl4RP93zoEYDnSkHpjCmv3
 qCFAgUgTGkKbFqXYPQ2ZS4saEMI4CL50/pmh/Xo7o1w27DtIs6LjyfYwCDrN5tdCXH
 pf+unRIU2aNgy91EKh9KEUcM4hXk2JcxKohj1jvdSzPHSEtSSIpH+InGf2td07itO/
 9wWUYADE/44NQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Date: Mon, 26 Jul 2021 23:02:50 +0200
Message-Id: <20210726210250.531544-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726210250.531544-1-marex@denx.de>
References: <20210726210250.531544-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
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
V3: - Rebase on V2 submitted a while ago, reinstate changelog
    - Use .atomic_get_input_bus_fmts for the decoder, separate funcs for encoder
---
 drivers/gpu/drm/bridge/lvds-codec.c | 76 ++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index dcf579a4cf833..afa7ce7ea01e8 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
@@ -22,6 +23,7 @@ struct lvds_codec {
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
+	unsigned int bus_format;
 };
 
 static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
@@ -74,12 +76,50 @@ static const struct drm_bridge_funcs funcs = {
 	.disable = lvds_codec_disable,
 };
 
+#define MAX_INPUT_SEL_FORMATS 1
+static u32 *
+lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state,
+				     u32 output_fmt,
+				     unsigned int *num_input_fmts)
+{
+	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = lvds_codec->bus_format;
+	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
+
+	return input_fmts;
+}
+
+static const struct drm_bridge_funcs funcs_decoder = {
+	.attach = lvds_codec_attach,
+	.enable = lvds_codec_enable,
+	.disable = lvds_codec_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = lvds_codec_atomic_get_input_bus_fmts,
+};
+
 static int lvds_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
+	struct device_node *bus_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	const char *mapping;
+	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -119,13 +159,47 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
+	lvds_codec->bridge.funcs = &funcs;
+
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
+			lvds_codec->bridge.funcs = &funcs_decoder;
+		}
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
 	lvds_codec->bridge.of_node = dev->of_node;
-	lvds_codec->bridge.funcs = &funcs;
 	drm_bridge_add(&lvds_codec->bridge);
 
 	platform_set_drvdata(pdev, lvds_codec);
-- 
2.30.2

