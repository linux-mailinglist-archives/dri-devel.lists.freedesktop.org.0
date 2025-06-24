Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD924AE60CD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B0610E55E;
	Tue, 24 Jun 2025 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="kDNPSYlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FD710E561
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750757096; x=1782293096;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=d8blF+pwGOzvN5a5pRJDPvXOWg+al/nOtmjJMwPEerE=;
 b=kDNPSYlEFjJDXw+nXrlqmDR90g21uu6sjGiFqV1kgXvpnVm3+8xSph4F
 i8M8lr1nY76fxNo5xBqKfqSpd7sGVTsoVqEEy92IK8glS+p9qVSZr9C9Y
 K6rfQhK7Us1Ky4pnoHlRRh9ScVJJLSWvLJDhR2wguDYXyvxUoToEKfizR
 WzDz2CYWN2JfmVaojls3a+IwaLHqHWAjV+hsaBlv9LyjkZ5wKMPJRfe0a
 yGW7168zAZJPv/+3mAE9gFtz/e2PVSZxasFn1okSyfOfBVMC5QQTJs5EJ
 +dsOo+vcCWHTj/b+nASS7qrvuelYaTtVjpgHufeTKI4GXz9jQMCBHaFuq Q==;
X-CSE-ConnectionGUID: kAMBk0q5SXCuhoUD0ewa8g==
X-CSE-MsgGUID: RTHlKML7TziMPnVq5VuWLg==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="42674601"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 02:24:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:41 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:35 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 24 Jun 2025 14:54:16 +0530
Subject: [PATCH v4 3/3] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-microchip-lvds-v4-3-937d42a420e9@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
In-Reply-To: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Sandeep Sheriker M
 <sandeep.sheriker@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=3511;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=d8blF+pwGOzvN5a5pRJDPvXOWg+al/nOtmjJMwPEerE=;
 b=Dx906w6ttNzYlzdGDxTMFtBAZo1nTR9KV989/dvE4oUmqvjsQdiIgK0o6pvINvIM0VgcCa8KA
 F8VtroDvcHbAlQXhLTyTPdbTINU/EvMnvUerHvC6/tCJxljj6xCQURw
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

The LVDS controller was hardcoded to JEIDA mapping, which leads to
distorted output on panels expecting VESA mapping.

Update the driver to dynamically select the appropriate mapping and
pixel size based on the panel's advertised media bus format. This
ensures compatibility with both JEIDA and VESA displays.

Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 38 +++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index e4ff46b03d54..ce52b794a9c6 100644
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
@@ -40,9 +41,11 @@
 
 /* Bitfields in LVDSC_CFGR (Configuration Register) */
 #define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)
 #define LVDSC_CFGR_DEN_POL_HIGH		0
 #define LVDSC_CFGR_DC_UNBALANCED	0
 #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+#define LVDSC_CFGR_MAPPING_VESA		0
 
 /*Bitfields in LVDSC_SR */
 #define LVDSC_SR_CS	BIT(0)
@@ -74,9 +77,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
 	writel_relaxed(val, lvds->regs + offset);
 }
 
-static void lvds_serialiser_on(struct mchp_lvds *lvds)
+static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+	u8 map, pix_size;
 
 	/* The LVDSC registers can only be written if WPEN is cleared */
 	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
@@ -91,11 +95,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
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
@@ -134,7 +151,16 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
-	lvds_serialiser_on(lvds);
+	struct drm_connector *connector;
+
+	/* default to jeida-24 */
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (connector && connector->display_info.num_bus_formats)
+		bus_format = connector->display_info.bus_formats[0];
+
+	lvds_serialiser_on(lvds, bus_format);
 }
 
 static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,

-- 
2.43.0

