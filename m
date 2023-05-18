Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD7708872
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 21:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3910E12E;
	Thu, 18 May 2023 19:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6157610E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:39:15 +0000 (UTC)
Received: from notapiano.myfiosgateway.com (unknown [185.254.75.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F561660595D;
 Thu, 18 May 2023 20:39:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684438753;
 bh=Fd/pUe/TmQQfLPBep677yYaNxvOidrVU5yODI4VZ/WI=;
 h=From:To:Cc:Subject:Date:From;
 b=Cm8rBRKb5iWL9H9V5UMPH7giv22atdYAqxgQEDhmuUDmgbeROQY7VEgK9AH/6IAZt
 ze15hINQkw12N+YED36gglYUO5N+MBEa/TnEmwLR2Cj/rFaAsPapsyxfc+KqYYS329
 OyF49QitPvbJT3Tl7m/CqOSEJNwYK0+5asJW0MU3QeYF62/oX0LLB06Q1wIrZ8KI5p
 waTDo8bq5n5aZAEI/r14Nfx2N5nJ0kn14ra8P8+e/4J61nN1DGz3NchLB2FeIOENpq
 M4FVvWjoyCpT47iVo9LJp0CDv07OlvFpHHoI7cN567PgG91iDPr9j2KukDy/1DDwXp
 2gKoZDpa3QhHA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Robert Foss <rfoss@kernel.org>
Subject: [PATCH] drm/bridge: anx7625: Prevent endless probe loop
Date: Thu, 18 May 2023 15:39:02 -0400
Message-Id: <20230518193902.891121-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 owen <qwt9588@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During probe, the driver registers i2c dummy devices and populates the
aux bus, which registers a device for the panel. After doing that, the
driver can still defer probe if needed. This ordering of operations is
troublesome however, because the deferred probe work will retry probing
all pending devices every time a new device is registered. Therefore, if
modules need to be loaded in order to satisfy the dependencies for this
driver to complete probe, the kernel will stall, since it'll keep trying
to probe the anx7625 driver, but never succeed, given that modules would
only be loaded after the deferred probe work completes.

Two changes are required to avoid this issue:
* Move of_find_mipi_dsi_host_by_node(), which can defer probe, to before
  anx7625_register_i2c_dummy_clients() and
  devm_of_dp_aux_populate_ep_devices(), which register devices.
* Make use of the done_probing callback when populating the aux bus,
  so that the bridge registration is only done after the panel is
  probed. This is required because the panel might need to defer probe,
  but the aux bus population needs the i2c dummy devices working, so
  this call couldn't just be moved to an earlier point in probe.
  One caveat is that if the panel is described outside the aux bus, the
  probe loop issue can still happen, but we don't have a way to avoid
  it in that case since there's no callback available.

With this patch applied, it's possible to boot on
mt8192-asurada-spherion with

CONFIG_DRM_ANALOGIX_ANX7625=y
CONFIG_MTK_MMSYS=m
CONFIG_BACKLIGHT_PWM=y

and also with

CONFIG_DRM_ANALOGIX_ANX7625=y
CONFIG_MTK_MMSYS=y
CONFIG_BACKLIGHT_PWM=m

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
Fixes: 269332997a16 ("drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not found")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 128 +++++++++++++++-------
 1 file changed, 88 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 093e7b9a570f..c86531f7b072 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1686,6 +1686,14 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	return 0;
+}
+
+static int anx7625_parse_dt_panel(struct device *dev,
+				  struct anx7625_platform_data *pdata)
+{
+	struct device_node *np = dev->of_node;
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
@@ -2031,7 +2039,7 @@ static int anx7625_register_audio(struct device *dev, struct anx7625_data *ctx)
 	return 0;
 }
 
-static int anx7625_attach_dsi(struct anx7625_data *ctx)
+static int anx7625_setup_dsi_device(struct anx7625_data *ctx)
 {
 	struct mipi_dsi_device *dsi;
 	struct device *dev = &ctx->client->dev;
@@ -2041,9 +2049,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		.channel = 0,
 		.node = NULL,
 	};
-	int ret;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
 
 	host = of_find_mipi_dsi_host_by_node(ctx->pdata.mipi_host_node);
 	if (!host) {
@@ -2064,14 +2069,24 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_HSE	|
 		MIPI_DSI_HS_PKT_END_ALIGNED;
 
-	ret = devm_mipi_dsi_attach(dev, dsi);
+	ctx->dsi = dsi;
+
+	return 0;
+}
+
+static int anx7625_attach_dsi(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
+
+	ret = devm_mipi_dsi_attach(dev, ctx->dsi);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
 		return ret;
 	}
 
-	ctx->dsi = dsi;
-
 	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi succeeded.\n");
 
 	return 0;
@@ -2559,6 +2574,40 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static int anx7625_link_bridge(struct drm_dp_aux *aux)
+{
+	struct anx7625_data *platform = container_of(aux, struct anx7625_data, aux);
+	struct device *dev = aux->dev;
+	int ret;
+
+	ret = anx7625_parse_dt_panel(dev, &platform->pdata);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "fail to parse DT for panel : %d\n", ret);
+		return ret;
+	}
+
+	platform->bridge.funcs = &anx7625_bridge_funcs;
+	platform->bridge.of_node = dev->of_node;
+	if (!anx7625_of_panel_on_aux_bus(dev))
+		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
+	if (!platform->pdata.panel_bridge)
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
+					DRM_BRIDGE_OP_DETECT;
+	platform->bridge.type = platform->pdata.panel_bridge ?
+				    DRM_MODE_CONNECTOR_eDP :
+				    DRM_MODE_CONNECTOR_DisplayPort;
+
+	drm_bridge_add(&platform->bridge);
+
+	if (!platform->pdata.is_dpi) {
+		ret = anx7625_attach_dsi(platform);
+		if (ret)
+			drm_bridge_remove(&platform->bridge);
+	}
+
+	return ret;
+}
+
 static int anx7625_i2c_probe(struct i2c_client *client)
 {
 	struct anx7625_data *platform;
@@ -2633,6 +2682,24 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	platform->aux.wait_hpd_asserted = anx7625_wait_hpd_asserted;
 	drm_dp_aux_init(&platform->aux);
 
+	ret = anx7625_parse_dt(dev, pdata);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
+		goto free_wq;
+	}
+
+	if (!platform->pdata.is_dpi) {
+		ret = anx7625_setup_dsi_device(platform);
+		if (ret < 0)
+			goto free_wq;
+	}
+
+	/*
+	 * Registering the i2c devices will retrigger deferred probe, so it
+	 * needs to be done after calls that might return EPROBE_DEFER,
+	 * otherwise we can get an infinite loop.
+	 */
 	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
 		ret = -ENOMEM;
 		DRM_DEV_ERROR(dev, "fail to reserve I2C bus.\n");
@@ -2647,13 +2714,21 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	if (ret)
 		goto free_wq;
 
-	devm_of_dp_aux_populate_ep_devices(&platform->aux);
-
-	ret = anx7625_parse_dt(dev, pdata);
+	/*
+	 * Populating the aux bus will retrigger deferred probe, so it needs to
+	 * be done after calls that might return EPROBE_DEFER, otherwise we can
+	 * get an infinite loop.
+	 */
+	ret = devm_of_dp_aux_populate_bus(&platform->aux, anx7625_link_bridge);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		goto free_wq;
+		if (ret != -ENODEV) {
+			DRM_DEV_ERROR(dev, "failed to populate aux bus : %d\n", ret);
+			goto free_wq;
+		}
+
+		ret = anx7625_link_bridge(&platform->aux);
+		if (ret)
+			goto free_wq;
 	}
 
 	if (!platform->pdata.low_power_mode) {
@@ -2666,27 +2741,6 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	if (platform->pdata.intp_irq)
 		queue_work(platform->workqueue, &platform->work);
 
-	platform->bridge.funcs = &anx7625_bridge_funcs;
-	platform->bridge.of_node = client->dev.of_node;
-	if (!anx7625_of_panel_on_aux_bus(&client->dev))
-		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
-	platform->bridge.type = platform->pdata.panel_bridge ?
-				    DRM_MODE_CONNECTOR_eDP :
-				    DRM_MODE_CONNECTOR_DisplayPort;
-
-	drm_bridge_add(&platform->bridge);
-
-	if (!platform->pdata.is_dpi) {
-		ret = anx7625_attach_dsi(platform);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
-			goto unregister_bridge;
-		}
-	}
-
 	if (platform->pdata.audio_en)
 		anx7625_register_audio(dev, platform);
 
@@ -2694,12 +2748,6 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	return 0;
 
-unregister_bridge:
-	drm_bridge_remove(&platform->bridge);
-
-	if (!platform->pdata.low_power_mode)
-		pm_runtime_put_sync_suspend(&client->dev);
-
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
-- 
2.40.1

