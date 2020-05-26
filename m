Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DED1E18C1
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637B089CC1;
	Tue, 26 May 2020 01:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F0189CB9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:29 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 091C6B63;
 Tue, 26 May 2020 03:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455726;
 bh=M6C9iN/KP04aFXoeEOm5CpkqV4p403+RkQUAkfOUFBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qv13sn/FHavIQdSzQpaJTdyw7hS6e39r0oVNnYXgNgLzU28I9QCrRe9XUv8+3Suzb
 ri9f5fCgFP99ja3gaKUZ6+kH+8SEOf0OoIuV+ku1eo6lI8epmr5yt3Gm2qaxnb6qN7
 B/XNWs2XW4H5IxJG9ybahuxSJVkPcAnQQ+b71vPc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/27] drm: bridge: adv7511: Split connector creation to a
 separate function
Date: Tue, 26 May 2020 04:14:40 +0300
Message-Id: <20200526011505.31884-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for making the connector creation optional, move the related
code out of adv7511_bridge_attach() to a separate function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:

- Test for (ret < 0) instead of (ret)
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 62 +++++++++++++-------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 58d02e92b6b9..f0992b6d654f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -783,7 +783,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	adv7511->f_tmds = mode->clock;
 }
 
-/* Connector funcs */
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
 static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
 {
 	return container_of(connector, struct adv7511, connector);
@@ -827,7 +830,40 @@ static const struct drm_connector_funcs adv7511_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-/* Bridge funcs */
+static int adv7511_connector_init(struct adv7511 *adv)
+{
+	struct drm_bridge *bridge = &adv->bridge;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	if (adv->i2c_main->irq)
+		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	else
+		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
+				DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_init(bridge->dev, &adv->connector,
+				 &adv7511_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret < 0) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+	drm_connector_helper_add(&adv->connector,
+				 &adv7511_connector_helper_funcs);
+	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
 static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct adv7511, bridge);
@@ -867,27 +903,9 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	if (adv->i2c_main->irq)
-		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	else
-		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
-				DRM_CONNECTOR_POLL_DISCONNECT;
-
-	ret = drm_connector_init(bridge->dev, &adv->connector,
-				 &adv7511_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = adv7511_connector_init(adv);
+	if (ret < 0)
 		return ret;
-	}
-	drm_connector_helper_add(&adv->connector,
-				 &adv7511_connector_helper_funcs);
-	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
 
 	if (adv->type == ADV7533 || adv->type == ADV7535)
 		ret = adv7533_attach_dsi(adv);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
