Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1379677F00
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC5910E4B5;
	Mon, 23 Jan 2023 15:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924110E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:13:20 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9so11663157pll.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAvQp2V3Vm1L1L/g4jdQdxESIHHdfq30+cBP/7icSHY=;
 b=rNYUxj7H6FbL9Rt9wIcjIcjAzA3XMegdpkfsKuSb5R4Pd5j02dkMHCfggKhAhXt6o/
 Q0aveeyXnjT55Ep3EWyVH4ffVXUiW0zImTM5HbiHWo+oOPNmlfZGPvyfZLiE5k3XX55y
 pfMKIQCyRmtL/sCdrs8SeoFubyp2J3OAr/Hwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAvQp2V3Vm1L1L/g4jdQdxESIHHdfq30+cBP/7icSHY=;
 b=t8OSlfFG9pk+jDr5b9njnlGbcQatJ2CSX3Fl7YZqicBR+TgVRbDrte1k96lqxVGSev
 xCA4IBPBa5brmi8Tp5B3OgDIONeYeQ6ccT4creyRmtjHLUfiHw6SpP/CeQJSvCHddMi+
 LGqjFXddLYxGGoKL4YD8lMJLenMERtUC/0RFSqc4s5O7OaPQdkIFCpgGlVGZNRbA9OcA
 BjBCyU4gEAVKYXsPrFOufOTle0Q3xKLyRxxWKUXgvERiqF6mL5BGSZSdXy3hDmQ+RRl2
 8PpGYZQJJwDF9FjZeUfKeIpBDCTLgxf/pS2oi1W2e63FuPy3h/H88Y6bfwaJncbtssvy
 HtlA==
X-Gm-Message-State: AFqh2kr2pEtNZGTVCqjzl0bJ2WCV+7hX/gI1P1kQgitiafWM0MxKtYS5
 0QpYQTtklDwEpDPnqmTrOOrPKg==
X-Google-Smtp-Source: AMrXdXuqkfT5s9h6YGABBg2oBOAliCmzFYKpynwfoq+KxnRdWJTeKfqwqeqh65SdBSNGQx6G/lHR6g==
X-Received: by 2002:a17:902:8304:b0:194:9de0:bed1 with SMTP id
 bd4-20020a170902830400b001949de0bed1mr22176414plb.32.1674486800519; 
 Mon, 23 Jan 2023 07:13:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:19 -0800 (PST)
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
Subject: [RESEND PATCH v11 07/18] drm: exynos: dsi: Introduce hw_type platform
 data
Date: Mon, 23 Jan 2023 20:42:01 +0530
Message-Id: <20230123151212.269082-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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

Samsung MIPI DSIM controller is common DSI IP that can be used
in various SoCs like Exynos, i.MX8M Mini/Nano/Plus.

Add hw_type enum via platform_data so that accessing the different
controller data between various platforms becomes easy and meaningful.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect RB from Frieder
- drop extra line
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"
- update enum type names

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 83 ++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7a845badb1b2..902bd46964cb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,15 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+enum exynos_dsi_type {
+	DSIM_TYPE_EXYNOS3250,
+	DSIM_TYPE_EXYNOS4210,
+	DSIM_TYPE_EXYNOS5410,
+	DSIM_TYPE_EXYNOS5422,
+	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_COUNT,
+};
+
 struct exynos_dsi_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
@@ -267,6 +276,10 @@ struct exynos_dsi_driver_data {
 	const unsigned int *reg_values;
 };
 
+struct exynos_dsi_plat_data {
+	enum exynos_dsi_type hw_type;
+};
+
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
@@ -297,6 +310,7 @@ struct exynos_dsi {
 	struct list_head transfer_list;
 
 	const struct exynos_dsi_driver_data *driver_data;
+	const struct exynos_dsi_plat_data *plat_data;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -524,18 +538,13 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.reg_values = exynos5422_reg_values,
 };
 
-static const struct of_device_id exynos_dsi_of_match[] = {
-	{ .compatible = "samsung,exynos3250-mipi-dsi",
-	  .data = &exynos3_dsi_driver_data },
-	{ .compatible = "samsung,exynos4210-mipi-dsi",
-	  .data = &exynos4_dsi_driver_data },
-	{ .compatible = "samsung,exynos5410-mipi-dsi",
-	  .data = &exynos5_dsi_driver_data },
-	{ .compatible = "samsung,exynos5422-mipi-dsi",
-	  .data = &exynos5422_dsi_driver_data },
-	{ .compatible = "samsung,exynos5433-mipi-dsi",
-	  .data = &exynos5433_dsi_driver_data },
-	{ }
+static const struct exynos_dsi_driver_data *
+exynos_dsi_types[DSIM_TYPE_COUNT] = {
+	[DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS4210] = &exynos4_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 };
 
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
@@ -1468,8 +1477,6 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.attach				= exynos_dsi_attach,
 };
 
-MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
-
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -1659,7 +1666,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
-	dsi->driver_data = of_device_get_match_data(dev);
+	dsi->plat_data = of_device_get_match_data(dev);
+	dsi->driver_data = exynos_dsi_types[dsi->plat_data->hw_type];
 
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
@@ -1817,6 +1825,51 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS3250,
+};
+
+static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS4210,
+};
+
+static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5410,
+};
+
+static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5422,
+};
+
+static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS5433,
+};
+
+static const struct of_device_id exynos_dsi_of_match[] = {
+	{
+		.compatible = "samsung,exynos3250-mipi-dsi",
+		.data = &exynos3250_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos4210-mipi-dsi",
+		.data = &exynos4210_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5410-mipi-dsi",
+		.data = &exynos5410_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5422-mipi-dsi",
+		.data = &exynos5422_dsi_pdata,
+	},
+	{
+		.compatible = "samsung,exynos5433-mipi-dsi",
+		.data = &exynos5433_dsi_pdata,
+	},
+	{ /* sentinel. */ }
+};
+MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
+
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
 	.remove = exynos_dsi_remove,
-- 
2.25.1

