Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8E6B0EF9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA02310E69A;
	Wed,  8 Mar 2023 16:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA9210E69A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:41:15 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id l1so17054813pjt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=choR+RZaYvHjo7lhSR6XLRS+PkEWQioBLGP3Z4YHgOU=;
 b=T6TdM3TJhDRIcG1OW2f58rFfng1TBS9kAY9Vy4+97pRdNeUxLnH0FQZPVLXqIvXPoJ
 IF8dzSgMltJ568u9j3NiTdX1OO7CqcezAsby26VAj++fuHGrp9UCMJh2rgmBcz95teEU
 6t6/BAdh2gT0y47Yiar0+ZFE2urn4+uTiSwMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=choR+RZaYvHjo7lhSR6XLRS+PkEWQioBLGP3Z4YHgOU=;
 b=Nl99gjw+Yu1wYKgK7YGhHGi2UTbAFD2BCfZ3bZtHVe+pec2haxCYCij3BVDVvnfgYo
 +Hc+CVM3bLMbhgfpNamJzyMzvBTE4MLg+W0UpBrqeyYkHeXCPw6yySc4wSPAZSDqub0K
 kgkF6Se+QuH0l6+Wffz/xd4KnqnRp1gnuTDFvaUNO5aP7rwg7YmBCz7q7Ya+n5IGg1x7
 Xr1/9+ZDiIHphP4iOSPbGPNUaV/bo76PM1ZTPJzdySYe0gQw0UargIVMP7t6EwWkv0mo
 pxZND1Ehdem3K2JkIhFb4JjvKePT9gqDdi1sdVqWyMyYLpypdsw8cWX+OaBizLS9ubzr
 VkTw==
X-Gm-Message-State: AO0yUKWxmecj8mWpgQ91YhdhaYcB8e6lj68P3gAVmqBT5qTEhqqArnFp
 1DtRaEdDuz/uVAYoyqWuvVD/wQ==
X-Google-Smtp-Source: AK7set/LXqc1TnM7fftx1lEl9pDwlLYsMJBxwBl+b5IY5wF4hVjsDz4zlG1IfFDRxvUkFqK4lqKTfA==
X-Received: by 2002:a17:903:32d2:b0:199:1160:956c with SMTP id
 i18-20020a17090332d200b001991160956cmr19166520plr.31.1678293674999; 
 Wed, 08 Mar 2023 08:41:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:41:14 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 10/16] drm: exynos: dsi: Consolidate component and bridge
Date: Wed,  8 Mar 2023 22:09:47 +0530
Message-Id: <20230308163953.28506-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- fix TE_GPIO handling
- collect TB from Marek S
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

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 138 ++++++++++++++++++++----
 1 file changed, 115 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index bd3bb8622ca3..01ed1677a4fd 100644
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
+	void (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
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
@@ -1648,11 +1661,6 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge,
-			  list_first_entry_or_null(&encoder->bridge_chain,
-						   struct drm_bridge,
-						   chain_node), 0);
-
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
@@ -1665,18 +1673,15 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	mutex_lock(&drm->mode_config.mutex);
+	if (pdata->host_ops && pdata->host_ops->attach) {
+		ret = pdata->host_ops->attach(dsi, device);
+		if (ret)
+			return ret;
+	}
 
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
@@ -1685,12 +1690,12 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_device *drm = dsi->encoder.dev;
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 
 	dsi->out_bridge = NULL;
 
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
+	if (pdata->host_ops && pdata->host_ops->detach)
+		pdata->host_ops->detach(dsi, device);
 
 	exynos_dsi_unregister_te_irq(dsi);
 
@@ -1766,11 +1771,50 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static int exynos_dsim_host_attach(struct exynos_dsi *dsim,
+				   struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
+	struct drm_device *drm = encoder->dev;
+
+	drm_bridge_attach(encoder, &dsim->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
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
+static void exynos_dsim_host_detach(struct exynos_dsi *dsim,
+				    struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_device *drm = dsi_enc->encoder.dev;
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
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
 
@@ -1788,7 +1832,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
+	dsi->bridge.funcs->atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1798,6 +1842,40 @@ static const struct component_ops exynos_dsi_component_ops = {
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
@@ -1892,7 +1970,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &dsim_bridge_timings_de_low;
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
+		ret = dsi->plat_data->host_ops->register_host(dsi);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1983,24 +2063,36 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
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

