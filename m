Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078006A99E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8610E63E;
	Fri,  3 Mar 2023 14:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D006710E63E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:53:07 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so2500503pjp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpLWAK14peIKe8R0E4tzY6GUsUPXTajM4OP5jILu6lM=;
 b=UXnLPNPAVLoZ8Jr3n7rKiQJ0EpQwe5dmvyiKSTigfAjQqyQBKGTFr8gfIg5e4hZHJv
 1gBAXA+g2AMkpehIlTXPLcWhYo9QY+1kv2FmxH27ljIxm6JkzIW3jQGdGt4xrx4djdnu
 jqdgIEyE4OVew2ngWe2saCsWf0MwD+CCxkulQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpLWAK14peIKe8R0E4tzY6GUsUPXTajM4OP5jILu6lM=;
 b=16rpEgBRs65gO8UdorRkroZrQy37jshIQEdK7exiuIODW0PZyNxENzIBQPtUbP91tI
 Smxej1Re6Hi7FSIs+iBNpWT6mL0QdqNuK2HaUi04QJbp2Gh5rrHSySq3B6QiUXPJYgRl
 75rXQ2gP8hq5wweyU5a0LK6Ol36AstFNTvADql+faBmKb/U/bGYlIksxUEZEntwvmXsd
 N7EQi2FTD6N5SRHHRskebP+PVKyRAm7+39VmUYwVyhcxn/a5qvqJjZVnXegERyCgIXuM
 Xovvpxb9StqpaaRtfX7msY/6RytmYSwY5avTJFL3H/8NA7eqcsc0bFDeGeV4rYxCixp/
 Ediw==
X-Gm-Message-State: AO0yUKW7ZQ6a+6+oHMJk7Hu5UwsKw1I8kkvzMuiEMKT0unLfVz2cEIyD
 vhw8+Lklv4b6we2gQzgbLGLblw==
X-Google-Smtp-Source: AK7set9L3ZRRBpY0ndzmse3E387SZkD4gvBO19DGxfBsvWK/E6OUl8lfxcpblTaT4eQKBVH9d4KJIA==
X-Received: by 2002:a05:6a21:32a2:b0:cb:8d74:112e with SMTP id
 yt34-20020a056a2132a200b000cb8d74112emr2340673pzb.45.1677855187397; 
 Fri, 03 Mar 2023 06:53:07 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:53:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 10/16] drm: exynos: dsi: Consolidate component and bridge
Date: Fri,  3 Mar 2023 20:21:32 +0530
Message-Id: <20230303145138.29233-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
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

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15:
- remove leading  underscores in function names
Changes for v13:
- none
Changes for v12:
- fix unneeded decleration
- collect RB from Marek
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 169 +++++++++++++++++++-----
 1 file changed, 134 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c8829f33f36e..afe2d293c785 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -283,10 +283,10 @@ struct exynos_dsi_driver_data {
 
 struct exynos_dsi_plat_data {
 	enum exynos_dsi_type hw_type;
+	const struct exynos_dsim_host_ops *host_ops;
 };
 
 struct exynos_dsi {
-	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
@@ -316,6 +316,19 @@ struct exynos_dsi {
 
 	const struct exynos_dsi_driver_data *driver_data;
 	const struct exynos_dsi_plat_data *plat_data;
+
+	void *priv;
+};
+
+struct exynos_dsim_host_ops {
+	int (*register_host)(struct exynos_dsi *dsim);
+	void (*unregister_host)(struct exynos_dsi *dsim);
+	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+};
+
+struct exynos_dsi_enc {
+	struct drm_encoder encoder;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1320,7 +1333,8 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct drm_encoder *encoder = &dsi->encoder;
+	struct exynos_dsi_enc *dsi_enc = dsi->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
 
 	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
 		exynos_drm_crtc_te_handler(encoder->crtc);
@@ -1589,9 +1603,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
 	struct drm_panel *panel;
@@ -1648,35 +1661,15 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
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
@@ -1685,14 +1678,16 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_device *drm = dsi->encoder.dev;
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+	int ret;
 
 	dsi->out_bridge = NULL;
 
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
-
-	exynos_dsi_unregister_te_irq(dsi);
+	if (pdata->host_ops && pdata->host_ops->detach) {
+		ret = pdata->host_ops->detach(dsi, device);
+		if (ret < 0)
+			return ret;
+	}
 
 	drm_bridge_remove(&dsi->bridge);
 
@@ -1766,11 +1761,67 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static int exynos_dsim_host_attach(struct exynos_dsi *dsim,
+				   struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
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
+static int exynos_dsim_host_detach(struct exynos_dsi *dsim,
+				   struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_device *drm = dsi_enc->encoder.dev;
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
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
+	struct exynos_dsi_enc *dsi_enc = dsi->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
 	struct drm_device *drm_dev = data;
 	int ret;
 
@@ -1788,7 +1839,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
+	dsi->bridge.funcs->atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1798,6 +1849,40 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static int exynos_dsi_register_host(struct exynos_dsi *dsim)
+{
+	struct exynos_dsi_enc *dsi_enc;
+
+	dsi_enc = devm_kzalloc(dsim->dev, sizeof(*dsi_enc), GFP_KERNEL);
+	if (!dsi_enc)
+		return -ENOMEM;
+
+	dsim->priv = dsi_enc;
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
@@ -1892,7 +1977,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &dsim_bridge_timings_de_low;
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
+		ret = dsi->plat_data->host_ops->register_host(dsi);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1983,24 +2070,36 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
+	.register_host = exynos_dsi_register_host,
+	.unregister_host = exynos_dsi_unregister_host,
+	.attach = exynos_dsim_host_attach,
+	.detach = exynos_dsim_host_detach,
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

