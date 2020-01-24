Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFAF147741
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94D6FECE;
	Fri, 24 Jan 2020 03:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3F6FECF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7B4E3806;
 Fri, 24 Jan 2020 04:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838111;
 bh=+bjrK0V/Nh57IrixRUshgP/GW2hT6yNbeSvdYptFAqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wWNBA9yBLcrpllYuUNngWFAqs859MJFyckOwQMVLQlJdT90ZYJu2nH7LWfLVcCD0g
 Qybm1uHUCgxzrZUoN8/l9Y1YUIequc4BwnS4i8XJ3TiLrPdjfLbvBoZxmy5/OHTT3Y
 rPvYuckIGZPpn+rf3807dTM9BPJLnL2oYIGSbmp8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/52] drm/bridge: simple-bridge: Add support for non-VGA
 bridges
Date: Fri, 24 Jan 2020 05:54:02 +0200
Message-Id: <20200124035445.1830-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a new simple_bridge_info structure that stores information about
the bridge model, and store the bridge timings in there, along with the
connector type. Use that new structure for of_device_id data. This
enables support for non-VGA bridges.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:

- Renamed simple_bridge_info.type field to connector_type
---
 drivers/gpu/drm/bridge/simple-bridge.c | 41 ++++++++++++++++++--------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 00d810c99193..20866c1230de 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -17,10 +17,17 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+struct simple_bridge_info {
+	const struct drm_bridge_timings *timings;
+	unsigned int connector_type;
+};
+
 struct simple_bridge {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
 
+	const struct simple_bridge_info *info;
+
 	struct i2c_adapter	*ddc;
 	struct regulator	*vdd;
 };
@@ -120,7 +127,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 				 &simple_bridge_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
 					  &simple_bridge_con_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
+					  sbridge->info->connector_type,
 					  sbridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
@@ -190,6 +197,8 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, sbridge);
 
+	sbridge->info = of_device_get_match_data(&pdev->dev);
+
 	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(sbridge->vdd)) {
 		int ret = PTR_ERR(sbridge->vdd);
@@ -213,7 +222,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
 	sbridge->bridge.of_node = pdev->dev.of_node;
-	sbridge->bridge.timings = of_device_get_match_data(&pdev->dev);
+	sbridge->bridge.timings = sbridge->info->timings;
 
 	drm_bridge_add(&sbridge->bridge);
 
@@ -273,19 +282,27 @@ static const struct drm_bridge_timings ti_ths8135_bridge_timings = {
 static const struct of_device_id simple_bridge_match[] = {
 	{
 		.compatible = "dumb-vga-dac",
-		.data = NULL,
-	},
-	{
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
+	}, {
 		.compatible = "adi,adv7123",
-		.data = &default_bridge_timings,
-	},
-	{
+		.data = &(const struct simple_bridge_info) {
+			.timings = &default_bridge_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
+	}, {
 		.compatible = "ti,ths8135",
-		.data = &ti_ths8135_bridge_timings,
-	},
-	{
+		.data = &(const struct simple_bridge_info) {
+			.timings = &ti_ths8135_bridge_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
+	}, {
 		.compatible = "ti,ths8134",
-		.data = &ti_ths8134_bridge_timings,
+		.data = &(const struct simple_bridge_info) {
+			.timings = &ti_ths8134_bridge_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
 	},
 	{},
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
