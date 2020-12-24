Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB822E2AE0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CC289BF6;
	Fri, 25 Dec 2020 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A46E89CBA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:18:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D1fz239NRz1rx88;
 Thu, 24 Dec 2020 07:18:37 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D1fz14pZCz1tYVv;
 Thu, 24 Dec 2020 07:18:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id u1MtBhiaEQwu; Thu, 24 Dec 2020 07:18:35 +0100 (CET)
X-Auth-Info: qWw7JslMHxp6E0oq9SamTagkGwdD5AiZEBd+VKwc/Q8=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Dec 2020 07:18:35 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Date: Thu, 24 Dec 2020 07:18:32 +0100
Message-Id: <20201224061832.92010-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Marek Vasut <marex@denx.de>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
select input pixel data sampling edge. Add DT property "pixelclk-active",
same as the one used by display timings, and configure bus flags based on
this DT property.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
V2: - Limit the pixelclk-active to encoders only
    - Update DT binding document
---
 .../bindings/display/bridge/lvds-codec.yaml   |  7 +++
 drivers/gpu/drm/bridge/lvds-codec.c           | 52 +++++++++++++------
 2 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index e5e3c72630cf..399a6528780a 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -74,6 +74,13 @@ properties:
 
     additionalProperties: false
 
+  pixelclk-active:
+    description: |
+      Data sampling on rising or falling edge.
+      Use 0 to sample pixel data on rising edge and
+      Use 1 to sample pixel data on falling edge and
+    enum: [0, 1]
+
   powerdown-gpios:
     description:
       The GPIO used to control the power down line of this device.
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index dcf579a4cf83..cab81ccd895d 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -15,13 +15,18 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
+struct lvds_codec_data {
+	u32 connector_type;
+	bool is_encoder;
+};
+
 struct lvds_codec {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_bridge_timings timings;
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
-	u32 connector_type;
 };
 
 static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
@@ -76,17 +81,20 @@ static const struct drm_bridge_funcs funcs = {
 
 static int lvds_codec_probe(struct platform_device *pdev)
 {
+	const struct lvds_codec_data *data;
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	u32 val;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
 		return -ENOMEM;
 
+	data = of_device_get_match_data(dev);
+
 	lvds_codec->dev = &pdev->dev;
-	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
 
 	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
 	if (IS_ERR(lvds_codec->vcc))
@@ -115,10 +123,22 @@ static int lvds_codec_probe(struct platform_device *pdev)
 
 	lvds_codec->panel_bridge =
 		devm_drm_panel_bridge_add_typed(dev, panel,
-						lvds_codec->connector_type);
+						data->connector_type);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
+	/*
+	 * Encoder might sample data on different clock edge than the display,
+	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
+	 * the sampling edge.
+	 */
+	if (data->is_encoder &&
+	    !of_property_read_u32(dev->of_node, "pixelclk-active", &val)) {
+		lvds_codec->timings.input_bus_flags = val ?
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE :
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
@@ -126,6 +146,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	 */
 	lvds_codec->bridge.of_node = dev->of_node;
 	lvds_codec->bridge.funcs = &funcs;
+	lvds_codec->bridge.timings = &lvds_codec->timings;
 	drm_bridge_add(&lvds_codec->bridge);
 
 	platform_set_drvdata(pdev, lvds_codec);
@@ -142,19 +163,20 @@ static int lvds_codec_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lvds_codec_data decoder_data = {
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.is_encoder = false,
+};
+
+static const struct lvds_codec_data encoder_data = {
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.is_encoder = true,
+};
+
 static const struct of_device_id lvds_codec_match[] = {
-	{
-		.compatible = "lvds-decoder",
-		.data = (void *)DRM_MODE_CONNECTOR_DPI,
-	},
-	{
-		.compatible = "lvds-encoder",
-		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
-	},
-	{
-		.compatible = "thine,thc63lvdm83d",
-		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
-	},
+	{ .compatible = "lvds-decoder", .data = &decoder_data, },
+	{ .compatible = "lvds-encoder", .data = &encoder_data, },
+	{ .compatible = "thine,thc63lvdm83d", .data = &encoder_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvds_codec_match);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
