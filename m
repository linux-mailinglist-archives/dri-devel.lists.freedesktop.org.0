Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C085764C98E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6066810E3F2;
	Wed, 14 Dec 2022 13:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EB710E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 13:00:59 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d15so3246534pls.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 05:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykkoMPBFg25R5qn07gjEHjZhs49sxOTu6Me4c71olVs=;
 b=Jq3ptjESO2wHV5IRcVBWUOvXZwoaahLFW00pQ0FRc+V8/l2sjFasc41foy4Jj1GQGH
 F4TxJ8fvSdVDdd6958iXl+vVIsRsc1yaUbeayAWDpE2yPvy1NofpjGpxT89SW93tS6/7
 Z1Ptpfo+uJsYF+ywld47arX3YBhvlmkmpBe5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykkoMPBFg25R5qn07gjEHjZhs49sxOTu6Me4c71olVs=;
 b=2UWNfWG8uY70RxJWh1LgkE2LH7rP5IYA3urNRANt7U+Yl7y/yo0PDS+jhF2YFKJ0xP
 13P7FNfwovOtrdajqkJnl18iK66/P/P6e0nqdoZ/ard2bqQW63KNFDhhTUuVf4mbUJTr
 N03XPYrbLjfO+/6OOqH3reKea01QlTYEJ9eH/XMMuchxlB2N1aQR5X5nxqpzNQEYEEa1
 84AQM72eF3X5mQcmeL76/d3A9tmMt26ArSnh52PkUksjGc1WsPj3GDDzHjMQqfcYKV5i
 9ensCgvax7CrJQLLUU/2p0Pl9AJuqmIzuUq7YGy6gfyv+cLZ7cen3p1Zptn5wTTMVfVW
 HdHw==
X-Gm-Message-State: ANoB5plDUS3Tqt+/Fc7J1UkvuYWKdW0UlFSjreq9mkMv0dA4186Dx34G
 mhMtrT/OyJhVrPnJ8mqFtvGBpQ==
X-Google-Smtp-Source: AA0mqf5vdHVFhRDZ0aWrLvfcHQcDuxG+WEM0vIwFNjrnoP40lrSBAWK+DekgxlvW9/njoJI0O14nWA==
X-Received: by 2002:a17:902:7b83:b0:189:b0e7:c5f0 with SMTP id
 w3-20020a1709027b8300b00189b0e7c5f0mr22677431pll.14.1671022858705; 
 Wed, 14 Dec 2022 05:00:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
 by smtp.gmail.com with ESMTPSA id
 ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 05:00:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v10 12/18] drm: exynos: dsi: Consolidate component and bridge
Date: Wed, 14 Dec 2022 18:29:01 +0530
Message-Id: <20221214125907.376148-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI host registration, attach and detach operations are quite
different for the component and bridge-based DRM drivers. 

Supporting generic bridge driver to use both component and bridge
based DRM drivers can be tricky and would require additional host
related operation hooks.

Add host operation hooks for registering and unregistering Exynos
and generic drivers, where Exynos hooks are used in existing Exynos
component based DRM drivers and generic hooks are used in i.MX8M
bridge based DRM drivers. 

Add host attach and detach operation hooks for Exynos component
DRM drivers and those get invoked while DSI core host attach and
detach gets called.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 179 ++++++++++++++++++------
 1 file changed, 140 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index bb3d6a7fa84e..819131a36b96 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -250,6 +250,8 @@ struct exynos_dsi_transfer {
 	u16 rx_done;
 };
 
+struct exynos_dsi;
+
 #define DSIM_STATE_ENABLED		BIT(0)
 #define DSIM_STATE_INITIALIZED		BIT(1)
 #define DSIM_STATE_CMD_LPM		BIT(2)
@@ -282,12 +284,19 @@ struct exynos_dsi_driver_data {
 	const unsigned int *reg_values;
 };
 
+struct exynos_dsim_host_ops {
+	int (*register_host)(struct exynos_dsi *dsim);
+	void (*unregister_host)(struct exynos_dsi *dsim);
+	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+};
+
 struct exynos_dsi_plat_data {
 	enum exynos_dsi_type hw_type;
+	const struct exynos_dsim_host_ops *host_ops;
 };
 
 struct exynos_dsi {
-	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
@@ -317,6 +326,12 @@ struct exynos_dsi {
 
 	const struct exynos_dsi_driver_data *driver_data;
 	const struct exynos_dsi_plat_data *plat_data;
+
+	void *priv;
+};
+
+struct exynos_dsi_enc {
+	struct drm_encoder encoder;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1320,10 +1335,11 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
-	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
+	struct exynos_dsi *dsim = (struct exynos_dsi *)dev_id;
+	struct exynos_dsi_enc *dsi = dsim->priv;
 	struct drm_encoder *encoder = &dsi->encoder;
 
-	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
+	if (dsim->state & DSIM_STATE_VIDOUT_AVAILABLE)
 		exynos_drm_crtc_te_handler(encoder->crtc);
 
 	return IRQ_HANDLED;
@@ -1597,9 +1613,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
 	int ret;
 
 	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
@@ -1613,35 +1628,15 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge,
-			  list_first_entry_or_null(&encoder->bridge_chain,
-						   struct drm_bridge,
-						   chain_node), 0);
-
-	/*
-	 * This is a temporary solution and should be made by more generic way.
-	 *
-	 * If attached panel device is for command mode one, dsi should register
-	 * TE interrupt handler.
-	 */
-	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
-		ret = exynos_dsi_register_te_irq(dsi, &device->dev);
-		if (ret)
+	if (pdata->host_ops && pdata->host_ops->attach) {
+		ret = pdata->host_ops->attach(dsi, device);
+		if (ret < 0)
 			return ret;
 	}
 
-	mutex_lock(&drm->mode_config.mutex);
-
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
-
-	mutex_unlock(&drm->mode_config.mutex);
-
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
 
 	return 0;
 }
@@ -1650,12 +1645,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_device *drm = dsi->encoder.dev;
-
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+	int ret;
 
-	exynos_dsi_unregister_te_irq(dsi);
+	if (pdata->host_ops && pdata->host_ops->detach) {
+		ret = pdata->host_ops->detach(dsi, device);
+		if (ret < 0)
+			return ret;
+	}
 
 	drm_bridge_remove(&dsi->bridge);
 
@@ -1729,10 +1726,66 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static int _exynos_dsi_host_attach(struct exynos_dsi *dsim,
+				   struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi = dsim->priv;
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_device *drm = encoder->dev;
+	int ret;
+
+	drm_bridge_attach(encoder, &dsim->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
+
+	/*
+	 * This is a temporary solution and should be made by more generic way.
+	 *
+	 * If attached panel device is for command mode one, dsi should register
+	 * TE interrupt handler.
+	 */
+	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+		ret = exynos_dsi_register_te_irq(dsim, &device->dev);
+		if (ret)
+			return ret;
+	}
+
+	mutex_lock(&drm->mode_config.mutex);
+
+	dsim->lanes = device->lanes;
+	dsim->format = device->format;
+	dsim->mode_flags = device->mode_flags;
+	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
+			!(dsim->mode_flags & MIPI_DSI_MODE_VIDEO);
+
+	mutex_unlock(&drm->mode_config.mutex);
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static int _exynos_dsi_host_detach(struct exynos_dsi *dsim,
+				   struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi = dsim->priv;
+	struct drm_device *drm = dsi->encoder.dev;
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	exynos_dsi_unregister_te_irq(dsim);
+
+	return 0;
+}
+
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi *dsim = dev_get_drvdata(dev);
+	struct exynos_dsi_enc *dsi = dsim->priv;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	int ret;
@@ -1743,17 +1796,17 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_host_register(&dsi->dsi_host);
+	return mipi_dsi_host_register(&dsim->dsi_host);
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi *dsim = dev_get_drvdata(dev);
 
-	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
+	dsim->bridge.funcs->atomic_disable(&dsim->bridge, NULL);
 
-	mipi_dsi_host_unregister(&dsi->dsi_host);
+	mipi_dsi_host_unregister(&dsim->dsi_host);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
@@ -1761,6 +1814,40 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static int exynos_dsi_register_host(struct exynos_dsi *dsim)
+{
+	struct exynos_dsi_enc *dsi;
+
+	dsi = devm_kzalloc(dsim->dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
+	dsim->priv = dsi;
+	dsim->bridge.pre_enable_prev_first = true;
+
+	return component_add(dsim->dev, &exynos_dsi_component_ops);
+}
+
+static void exynos_dsi_unregister_host(struct exynos_dsi *dsim)
+{
+	component_del(dsim->dev, &exynos_dsi_component_ops);
+}
+
+static int generic_dsim_register_host(struct exynos_dsi *dsim)
+{
+	return mipi_dsi_host_register(&dsim->dsi_host);
+}
+
+static void generic_dsim_unregister_host(struct exynos_dsi *dsim)
+{
+	mipi_dsi_host_unregister(&dsim->dsi_host);
+}
+
+static const struct exynos_dsim_host_ops generic_dsim_host_ops = {
+	.register_host = generic_dsim_register_host,
+	.unregister_host = generic_dsim_unregister_host,
+};
+
 static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1855,7 +1942,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &dsim_bridge_timings_de_low;
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
+		ret = dsi->plat_data->host_ops->register_host(dsi);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1946,24 +2035,36 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
+	.register_host = exynos_dsi_register_host,
+	.unregister_host = exynos_dsi_unregister_host,
+	.attach = _exynos_dsi_host_attach,
+	.detach = _exynos_dsi_host_detach,
+};
+
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS3250,
+	.host_ops = &exynos_dsi_host_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS4210,
+	.host_ops = &exynos_dsi_host_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5410,
+	.host_ops = &exynos_dsi_host_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5422,
+	.host_ops = &exynos_dsi_host_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5433,
+	.host_ops = &exynos_dsi_host_ops,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
-- 
2.25.1

