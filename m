Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB3AE5B89
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5B10E1EE;
	Tue, 24 Jun 2025 04:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="MsUD2kqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9410E009
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 04:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750740053; x=1782276053;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=pKNCgLJnf6kMka63qFgcEq8rakhenaJR7dI+6P8r2ww=;
 b=MsUD2kqE3/WJNy1pHwKTre9zDyeAIc9ISIoLyhAqlvoQdNO21hHI0KbW
 OhC8DTGOv5FP6LsJey7sh1OIj0e69ys+K6vOoCe7iq/C4m3nL5mhkXgOD
 0tI1bxZf9qvBO1Crp2VmCVQfL3a/i+l8Vejjsb/Wd6xsjqfcwz5ZHxLKO
 cFwOMcw+yAGKIBfZKyEE1/hcBjsIq5pfp93RY+Rmt6HeldkUIMsMF2Khx
 Fuk0qKwTExtxfgEBaQ59WoAkOyFfhsAsbvpB7TrDAetDpi/s3jd4pbO3O
 HhW/KT+xjoZGpcTAI3Rjr4T90hY1J+OGLJP8c1uIrH4HM9kHCODP5h4s2 w==;
X-CSE-ConnectionGUID: GtONl7zMSai6tNbRkKAjGw==
X-CSE-MsgGUID: XKy5sicpT0OGvGLTHsMnCQ==
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="43142583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2025 21:40:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Jun 2025 21:40:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 23 Jun 2025 21:40:28 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 24 Jun 2025 10:10:25 +0530
Subject: [PATCH v3] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-microchip-lvds-v3-1-c3c6f1e40516@microchip.com>
X-B4-Tracking: v=1; b=H4sIADgsWmgC/3XMzwrCMAwG8FcZOVtZu3V/PPke4qFLowu4dbRSl
 LF3t9tBRJGQw/eR/GYI5JkCHLIZPEUO7MYUil0G2JvxSoJtyqBypfNKNmJg9A57nsQt2iC6Wmp
 p2ypvSwPpafJ04ccGns4p9xzuzj83P8q1/UtFKdKQIW3Q1qZRx/fBHt0AKxfVB6GKH0IloiHsT
 IdV2vKbWJblBQfIgnPzAAAA
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Sandeep Sheriker M" <sandeep.sheriker@microchip.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750740026; l=6378;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=8SIX3YXqjCEtRZTW6QbWQPaH0ZBHGs4QIObijOpd9GQ=;
 b=vaVv2H8IrmgDDLaeIQ0pLj1YjRohi4JHZd6bantEQA+cwls6BW5qxyygT0zj/pOLAZx7FeDpi
 p/dpGe4X+/yDnN4cgJ+bag6hK9yjSniqQjj89HM2MTlfRRyLk6N5TT3
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
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

From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>

The LVDS controller was hardcoded to JEIDA mapping, which leads to
distorted output on panels expecting VESA mapping.

Update the driver to dynamically select the appropriate mapping and
pixel size based on the panel's advertised media bus format. This
ensures compatibility with both JEIDA and VESA displays.

Modernize the bridge ops to use atomic_enable/disable, and retrieve
the bus format from the connector via the atomic bridge state.

Additionally, drop the drm_panel field as it is unused.

Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v3:
- Use BIT(0) instead of 1.
- Drop the panel field of the mchp_lvds structure.
- Drop the inner parentheses in write in serialiser_on().
- Link to v2: https://lore.kernel.org/r/20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com

Changes in v2:
- Switch to atomic bridge functions
- Drop custom connector creation
- Use drm_atomic_get_new_connector_for_encoder()
- Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 70 +++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 9f4ff82bc6b4..e7b68fb4bec0 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -11,6 +11,7 @@
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/devinfo.h>
@@ -41,9 +42,11 @@
 
 /* Bitfields in LVDSC_CFGR (Configuration Register) */
 #define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)
 #define LVDSC_CFGR_DEN_POL_HIGH		0
 #define LVDSC_CFGR_DC_UNBALANCED	0
 #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+#define LVDSC_CFGR_MAPPING_VESA		0
 
 /*Bitfields in LVDSC_SR */
 #define LVDSC_SR_CS	BIT(0)
@@ -56,7 +59,6 @@ struct mchp_lvds {
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *pclk;
-	struct drm_panel *panel;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 };
@@ -76,9 +78,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
 	writel_relaxed(val, lvds->regs + offset);
 }
 
-static void lvds_serialiser_on(struct mchp_lvds *lvds)
+static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+	u8 map, pix_size;
 
 	/* The LVDSC registers can only be written if WPEN is cleared */
 	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
@@ -93,11 +96,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
 		usleep_range(1000, 2000);
 	}
 
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		map = LVDSC_CFGR_MAPPING_JEIDA;
+		pix_size = LVDSC_CFGR_PIXSIZE_18BITS;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		map = LVDSC_CFGR_MAPPING_VESA;
+		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
+		break;
+	default:
+		map = LVDSC_CFGR_MAPPING_JEIDA;
+		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
+		break;
+	}
+
 	/* Configure the LVDSC */
-	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
-				LVDSC_CFGR_DC_UNBALANCED |
-				LVDSC_CFGR_DEN_POL_HIGH |
-				LVDSC_CFGR_PIXSIZE_24BITS));
+	lvds_writel(lvds, LVDSC_CFGR, map | LVDSC_CFGR_DC_UNBALANCED |
+		    LVDSC_CFGR_DEN_POL_HIGH | pix_size);
 
 	/* Enable the LVDS serializer */
 	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
@@ -113,7 +129,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_enable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -129,11 +146,35 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
 		return;
 	}
+}
+
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+	struct drm_connector *connector;
+
+	/* default to jeida-24 */
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (connector && connector->display_info.num_bus_formats)
+		bus_format = connector->display_info.bus_formats[0];
 
-	lvds_serialiser_on(lvds);
+	lvds_serialiser_on(lvds, bus_format);
 }
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	/* Turn off the serialiser */
+	lvds_writel(lvds, LVDSC_CR, 0);
+}
+
+static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
@@ -143,8 +184,10 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
-	.enable = mchp_lvds_enable,
-	.disable = mchp_lvds_disable,
+	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
+	.atomic_enable = mchp_lvds_atomic_enable,
+	.atomic_disable = mchp_lvds_atomic_disable,
+	.atomic_post_disable = mchp_lvds_atomic_post_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)
@@ -179,13 +222,8 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 			"can't find port point, please init lvds panel port!\n");
 		return -ENODEV;
 	}
-
-	lvds->panel = of_drm_find_panel(port);
 	of_node_put(port);
 
-	if (IS_ERR(lvds->panel))
-		return -EPROBE_DEFER;
-
 	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 
 	if (IS_ERR(lvds->panel_bridge))

---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

