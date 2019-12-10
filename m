Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71503119EBA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8D06E9E2;
	Tue, 10 Dec 2019 22:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1AE6E9D6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:12 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320A8E78;
 Tue, 10 Dec 2019 23:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018689;
 bh=GQ8G9r4HQk0u+y4YVQHTsdfHe3iSWdjUDfwKHP2wQ1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZsXKJ/IutmH+ylUyD/kJfu3ukFX6GLxmcCRueZeVrig4CiGZyMHoV8HMwQ4+nc+c
 I8H4IKlDXLyeWYNNLnf4HkGwSlMxprXQrXf5NgrQ7owbGVwdM1UwlMhqmzD5Bz077G
 fMy+Wm2MojRXEkv4C2zOGBsOqxOibNc1Xci+I4DA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/50] drm/bridge: simple-bridge: Add support for enable
 GPIO
Date: Wed, 11 Dec 2019 00:57:09 +0200
Message-Id: <20191210225750.15709-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
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
---
 drivers/gpu/drm/bridge/simple-bridge.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 5a290c14b310..5d8b1b49798e 100644
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
@@ -141,19 +143,23 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
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
@@ -206,6 +212,14 @@ static int simple_bridge_probe(struct platform_device *pdev)
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
