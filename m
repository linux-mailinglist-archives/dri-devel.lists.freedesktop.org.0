Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D139FB80E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 01:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED6810E171;
	Tue, 24 Dec 2024 00:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="gH2qAQaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAE810E171
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 00:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B25C108A88C9; Tue, 24 Dec 2024 01:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735001117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYl7espBpfQCSZ04CIcZ4uuuRLv2sy+4r9Xwl0BYNDI=;
 b=gH2qAQafzf246O+u2kTbIvSH6tnUJbDzk7WYDHM2ShEn+nLlb6X45WLVKCaY6VJ1He3+1E
 Gx09ICu3sRG0oGYxKuOEgC1Zdcz2e6xeQTEpLBvNB5X0UUu0JgqBg+V/A1mwz5OsHLgei9
 8RVdE1Wa0jQtK36KgjDo3FrpQfrbPr29cT1mdwIgC9+Shz8BYJ2A0lECHDyGbU7pLXNWi1
 osqdEFsBRY38UF9Zgbt4HSczSelfOqQENfwIWtZplbL0P76LTNswbTyMhKXZz2PjLH+WWb
 jrDpcHyYFMR4kcO5awoReAxSUWzfW2oprDeU3zFpNSrhb3nCrn8wKX+LGf6Gsg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to
 drm_bridge_attach
Date: Tue, 24 Dec 2024 01:42:49 +0100
Message-ID: <20241224004439.239880-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224004439.239880-1-marex@denx.de>
References: <20241224004439.239880-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
this flag in some way since then.
Newly added bridge drivers must no longer contain the connector creation and
will fail probing if this flag isn't set.

In order to be able to connect to those newly added bridges as well,
make use of drm_bridge_connector API and have the connector initialized
by the display controller.

Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")

This makes LT9611 work with i.MX8M Mini.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/Kconfig     |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 36 +++++++++++++++++++++----------
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++---
 4 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 07fb6901996ae..e67de148955b2 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -12,6 +12,7 @@ config DRM_MXSFB
 	select DRM_CLIENT_SELECTION
 	select DRM_MXS
 	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e..d034c21e186a4 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -20,6 +20,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -118,10 +119,10 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
+	struct drm_connector *connector = &mxsfb->connector;
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
@@ -139,21 +140,34 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err_probe(drm->dev, ret,
+			      "Failed to initialize bridge connector: %pe\n",
+			      connector);
+		return ret;
+	}
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
+	if (ret < 0) {
+		dev_err_probe(drm->dev, ret,
+			      "Failed to attach encoder.\n");
+		goto err_cleanup_connector;
+	}
+
+	mxsfb->bridge = bridge;
 
 	return 0;
+
+err_cleanup_connector:
+	drm_connector_cleanup(connector);
+	return ret;
 }
 
 static irqreturn_t mxsfb_irq_handler(int irq, void *data)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25fc..7a24e96ab4263 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -43,7 +43,7 @@ struct mxsfb_drm_private {
 	} planes;
 	struct drm_crtc			crtc;
 	struct drm_encoder		encoder;
-	struct drm_connector		*connector;
+	struct drm_connector		connector;
 	struct drm_bridge		*bridge;
 
 	bool				crc_active;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de05..30584091e2aa8 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -281,7 +281,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 {
 	struct drm_device *drm = mxsfb->crtc.dev;
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
-	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
+	u32 bus_flags = mxsfb->connector.display_info.bus_flags;
 	int err;
 
 	if (mxsfb->bridge && mxsfb->bridge->timings)
@@ -378,8 +378,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	/* If there is no bridge, use bus format from connector */
-	if (!bus_format && mxsfb->connector->display_info.num_bus_formats)
-		bus_format = mxsfb->connector->display_info.bus_formats[0];
+	if (!bus_format && mxsfb->connector.display_info.num_bus_formats)
+		bus_format = mxsfb->connector.display_info.bus_formats[0];
 
 	/* If all else fails, default to RGB888_1X24 */
 	if (!bus_format)
-- 
2.45.2

