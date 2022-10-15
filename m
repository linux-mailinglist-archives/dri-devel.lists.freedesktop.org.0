Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9F5FFC7C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 00:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58BB10E5B1;
	Sat, 15 Oct 2022 22:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90F910E5B0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 22:08:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 86E4A84E2A;
 Sun, 16 Oct 2022 00:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665871692;
 bh=AJtpN9rg3vP14kfUiS2FkQzwMilbUXuCQgOpY3IkUgk=;
 h=From:To:Cc:Subject:Date:From;
 b=dGsC9fe1nJCF7fNcPWgNYyjopgG65x03VvyHVsfOxGxmY/y8kyTQnuPz/qVseCxht
 b+wi53bI7Hrq4TxmSLb6JnE3g0cq+vTTCwBlJ6kFhwJZ5e+bMBOGVGhMMr8bsyHsnc
 CRxyeIfAbysBtzy4VZPpb8QEtNugihu9GL9Q7/n6tR3cAE9EPQbnIKqTcp4gsYNQSR
 SgVh+WFhM6E/EYuYLiBngHh41Og8ObUjdaQaP1omhdD1vpOscrGeYlWPuP+9D8adfq
 rOkj+cGEixLfI2HfyiGHY5v7vlyJqKamXUD+Ul1YmIgAW8JnIGbVj9W58+A/GQ7q65
 eBzuJ/0xi0DQw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date: Sun, 16 Oct 2022 00:07:53 +0200
Message-Id: <20221015220753.108641-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add extras to support i.MX8M Plus. The main change is the removal of
HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
the implementation of this IP in i.MX8M Plus is very much compatible
with the i.MX8M Mini/Nano one.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Tim Harvey <tharvey@gateworks.com>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc: linux-amarula <linux-amarula@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 55 +++++++++++++++++++++------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 012d8b6463ad6..cf40fd8813ff2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -465,6 +465,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1404,18 +1405,26 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 
+	/*
+	 * The i.MX8M Mini/Nano glue logic between LCDIF and DSIM
+	 * inverts HS/VS/DE sync signals polarity, therefore, while
+	 * i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
+	 * 13.6.3.5.2 RGB interface
+	 * i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
+	 * 13.6.2.7.2 RGB interface
+	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
+	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 *
+	 * The i.MX8M Plus glue logic between LCDIFv3 and DSIM does not
+	 * implement the same behavior, therefore LCDIFv3 must generate
+	 * HS/VS/DE signals active HIGH.
+	 */
 	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
-		/**
-		 * FIXME:
-		 * At least LCDIF + DSIM needs active low sync,
-		 * but i.MX 8M Mini Applications Processor Reference Manual,
-		 * Rev. 3, 11/2020 says
-		 *
-		 * 13.6.3.5.2 RGB interface
-		 * Vsync, Hsync, and VDEN are active high signals.
-		 */
 		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	} else if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MP) {
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
 	return 0;
@@ -1448,7 +1457,8 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 	 * Passing NULL to the previous bridge makes Exynos DSI drivers
 	 * work which is exactly done before.
 	 */
-	if (!(dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM))
+	if (dsi->plat_data->hw_type != SAMSUNG_DSIM_TYPE_IMX8MM &&
+	    dsi->plat_data->hw_type != SAMSUNG_DSIM_TYPE_IMX8MP)
 		previous = NULL;
 
 	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, previous,
@@ -1649,7 +1659,11 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
-static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
 
@@ -1733,9 +1747,17 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
-	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	/*
+	 * The i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts DE signal
+	 * polarity, see comment in samsung_dsim_atomic_check().
+	 */
+	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
+
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
 
@@ -1841,11 +1863,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
 	.host_ops = &samsung_dsim_generic_host_ops,
 };
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mp_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MP,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "fsl,imx8mm-mipi-dsim",
 		.data = &samsung_dsim_imx8mm_pdata,
 	},
+	{
+		.compatible = "fsl,imx8mp-mipi-dsim",
+		.data = &samsung_dsim_imx8mp_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index df3d030daec6a..3789f9dbb238b 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -28,6 +28,7 @@ enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS5422,
 	SAMSUNG_DSIM_TYPE_EXYNOS5433,
 	SAMSUNG_DSIM_TYPE_IMX8MM,
+	SAMSUNG_DSIM_TYPE_IMX8MP,
 	SAMSUNG_DSIM_TYPE_COUNT,
 };
 
-- 
2.35.1

