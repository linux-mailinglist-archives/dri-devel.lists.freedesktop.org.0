Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554716FD7D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEC36E529;
	Wed, 26 Feb 2020 11:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B146E504
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:25:52 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FAD7D53;
 Wed, 26 Feb 2020 12:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716347;
 bh=cjrOgnyb2vqB8n0/H339sILnyGegI2tJpvsSjSWrYfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lw95Mi4OinDY4vgRz5kesdraGCbvy+U3SHe1APbmOLcHLaJWncAYKejzecXncIHF/
 dqLLZiQONg+YT3PKe3xnYbK3ues+GeSmMeQfeFuo0pPrw/1CMbhRELS0bHERLG0zK8
 gpZrK7h16yHxvxx6gFi2rhdPkW05Toru2dn0f2c0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 13/54] drm/bridge: simple-bridge: Add support for enable
 GPIO
Date: Wed, 26 Feb 2020 13:24:33 +0200
Message-Id: <20200226112514.12455-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
References: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an enable GPIO is declared in the firmware, assert it when enabling
the bridge and deassert it when disabling it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 20866c1230de..70e6092bdf6c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -6,6 +6,7 @@
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
@@ -30,6 +31,7 @@ struct simple_bridge {
 
 	struct i2c_adapter	*ddc;
 	struct regulator	*vdd;
+	struct gpio_desc	*enable;
 };
 
 static inline struct simple_bridge *
@@ -143,19 +145,23 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 static void simple_bridge_enable(struct drm_bridge *bridge)
 {
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
-	int ret = 0;
+	int ret;
 
-	if (sbridge->vdd)
+	if (sbridge->vdd) {
 		ret = regulator_enable(sbridge->vdd);
+		if (ret)
+			DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
+	}
 
-	if (ret)
-		DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
+	gpiod_set_value_cansleep(sbridge->enable, 1);
 }
 
 static void simple_bridge_disable(struct drm_bridge *bridge)
 {
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 
+	gpiod_set_value_cansleep(sbridge->enable, 0);
+
 	if (sbridge->vdd)
 		regulator_disable(sbridge->vdd);
 }
@@ -208,6 +214,14 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
 	}
 
+	sbridge->enable = devm_gpiod_get_optional(&pdev->dev, "enable",
+						  GPIOD_OUT_LOW);
+	if (IS_ERR(sbridge->enable)) {
+		if (PTR_ERR(sbridge->enable) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Unable to retrieve enable GPIO\n");
+		return PTR_ERR(sbridge->enable);
+	}
+
 	sbridge->ddc = simple_bridge_retrieve_ddc(&pdev->dev);
 	if (IS_ERR(sbridge->ddc)) {
 		if (PTR_ERR(sbridge->ddc) == -ENODEV) {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
