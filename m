Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C4677AD5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839810E369;
	Mon, 23 Jan 2023 12:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BD010E469
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:25:04 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso10805597pjd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1hJXJQdt5ZCT1mSKIuiHURptg88R24MKTm4kRNQiUQ=;
 b=eWKdZbI/v401MuUFSqtDcz6f4hTTveK8YlsqNqooxO1rM725kUf0W+B8MbjX+ndJan
 TcHKeP6nmfBwqfmEpeFdKug/npwKPtGcT+pSKuljuINgv8H0RmnPcZFwXx222Pu4getz
 6txibuNmfbXp3I2wKp7vRHfzU4XvVbQdLxDD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1hJXJQdt5ZCT1mSKIuiHURptg88R24MKTm4kRNQiUQ=;
 b=4tBCNCuM7H/N55sQce23R68tSF79ab/f3IxSU6rGJoGbEo8bIk9EDRbG4DzLEtSz6k
 mgV9+5PayIWniZX2UVfa/p4L86wIHstqMcSidWDLz+pQYpAbK9Bh+UpORocrQzuqqnN2
 3khkdJjLRdntgmXHmTcGa39d+ziPvxyVLnA4xlIL7/RA7JoHrkj3yhBli+6IlNd6w4IJ
 ExVi42UlrxBkaUWUYrUwIqDar/1NFtq8+TxEeFIWpsFYum0HkmV1SXQy+ceyOzCvIKxu
 Gwsg/KQAlwWnzh5ePy+smSrY3nvBnlf7nEu1up9m2zC6d8fV40nT1JgzVclEr1BeCUep
 YiLA==
X-Gm-Message-State: AFqh2kq+4GI0O8pibi3/No0Rh6bgUWhyV9QMLfbBEr5MOoECQnJo3rEQ
 O/VYK/vq/9iY349VF4BvwYhAiQ==
X-Google-Smtp-Source: AMrXdXts8N9Nd8WS9ejdfVejZ+28IWX1AdFAYsG1xF0jFhaltYXo8VjYB27FPUQ3WxSNWcmNIepoEQ==
X-Received: by 2002:a17:903:428a:b0:193:1557:457c with SMTP id
 ju10-20020a170903428a00b001931557457cmr21834283plb.62.1674476704052; 
 Mon, 23 Jan 2023 04:25:04 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:25:03 -0800 (PST)
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
Subject: [PATCH v11 12/18] drm: exynos: dsi: Consolidate component and bridge
Date: Mon, 23 Jan 2023 17:53:13 +0530
Message-Id: <20230123122319.261341-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 179 ++++++++++++++++++------
 1 file changed, 140 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7afbbe30d1d3..fc7f00ab01b4 100644
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
@@ -281,12 +283,19 @@ struct exynos_dsi_driver_data {
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
@@ -316,6 +325,12 @@ struct exynos_dsi {
 
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
@@ -1319,10 +1334,11 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 
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
@@ -1595,9 +1611,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
 	int ret;
 
 	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
@@ -1611,35 +1626,15 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
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
@@ -1648,12 +1643,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
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
 
@@ -1727,10 +1724,66 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
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
@@ -1741,17 +1794,17 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
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
@@ -1759,6 +1812,40 @@ static const struct component_ops exynos_dsi_component_ops = {
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
@@ -1853,7 +1940,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &dsim_bridge_timings_de_low;
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
+		ret = dsi->plat_data->host_ops->register_host(dsi);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1944,24 +2033,36 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
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

