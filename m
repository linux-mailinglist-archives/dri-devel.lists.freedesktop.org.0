Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C486239949D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8873F6EE68;
	Wed,  2 Jun 2021 20:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAE36EE69
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:36:32 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0001582F14;
 Wed,  2 Jun 2021 22:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622666191;
 bh=Jlh+N6h+E3Cy4nsbJEhaybdC10KMt20uSZCAHiU/JTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XjTYxmFw//yfMcvqEPHharC1GTl1m/886hszoCfxP1zhYlj5anhvgzrHJt9jQAoDz
 AVR4dDZBJcUoeBv1iSL7MlvxafJmuCF8/xoDRbycW/sr9Ag21eXeZ1JpS3UDkn9VrJ
 DCIjx8Xjoj6AdduWNBEHZHlT56m2UNRhEHMel8WzNqFdkYGRIw0XjUoyKr5PWrP7YO
 zWhIB3mgy2LEPlnMVlYgWoQZbF3hRv3me6wuSqHNFZmkLMi/CUTVwb0y3zxf7xlVs7
 4KOKp+s9cq43sgyqYQ+oroZcMafZNS2dSNK440pEyMDm5jcupQCaj3KhvyucmE1kxH
 dZdp5bc79bCKw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 2/2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Date: Wed,  2 Jun 2021 22:36:08 +0200
Message-Id: <20210602203608.419192-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602203608.419192-1-marex@denx.de>
References: <20210602203608.419192-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
select input pixel data sampling edge. Add DT property "pclk-sample", not
the same as the one used by display timings but rather the same as used by
media, and configure bus flags based on this DT property.

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
V3: - Determine whether this is encoder from connector, i.e.
      lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS
V4: - Switch to pclk-sample. Note that the value of this is inverted,
      so all the existing users of pixelclk-active using previous
      version of this patch must be reworked
V5: - Move pclk-sample to endpoint. Again, all existing users of the
      bindings must be reworked
---
 drivers/gpu/drm/bridge/lvds-codec.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index dcf579a4cf833..80ce6783d10a8 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -19,6 +19,7 @@ struct lvds_codec {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_bridge_timings timings;
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
@@ -78,8 +79,10 @@ static int lvds_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
+	struct device_node *bus_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	u32 val;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -119,6 +122,27 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
+	/*
+	 * Encoder might sample data on different clock edge than the display,
+	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
+	 * the sampling edge.
+	 */
+	if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS) {
+		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+		if (!bus_node) {
+			dev_dbg(dev, "bus DT node not found\n");
+			return -ENXIO;
+		}
+
+		if (!of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
+			lvds_codec->timings.input_bus_flags = val ?
+				DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
+				DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+		}
+
+		of_node_put(bus_node);
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
@@ -126,6 +150,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	 */
 	lvds_codec->bridge.of_node = dev->of_node;
 	lvds_codec->bridge.funcs = &funcs;
+	lvds_codec->bridge.timings = &lvds_codec->timings;
 	drm_bridge_add(&lvds_codec->bridge);
 
 	platform_set_drvdata(pdev, lvds_codec);
-- 
2.30.2

