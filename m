Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7146B0EEE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A22510E695;
	Wed,  8 Mar 2023 16:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0D610E695
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:48 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id i3so18203722plg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuaaNlwtvX1EiEc/sO04f/d6DRUpib29L7439uIhr/E=;
 b=cdcXoPOGiZ6jE/8mI92vnzAOGn2z6uCQn+GgyNspK0+1yl3vsxe7B9pFVVqFgcW18n
 mPtRJrxme45AuB8fNFq4dbsbrzmhWBG1NX+doadoQg6R+VYwHc4athQdKGkYt3rpAzY1
 HRcqERC8NWjGNsR5yd0pEB/rn2uLlLzvqzKVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuaaNlwtvX1EiEc/sO04f/d6DRUpib29L7439uIhr/E=;
 b=kOP8IHNdEPpJNnCK5hSw4VuKrkLCJq8Fa3a1LWeXNhvt6K74kw3XoE6jJkHGjVo0nR
 9crcO00Aje9VenhcVXK+qWp8kuwju2j1KJDQv301OgG4CrlhhEuMwLCm6BdllVeMKV29
 I+ZEH3RaNwd3tASJ8gcsUKE5zVvMlkYEXLlUz9/obfCnpm0z/SI7fVJScdKncWHSPZwL
 2YhYbZFH/6PD8GW1Y5ZbrrGBuB9m+590O/Fd/R+2PK+yyk9ed49Snq+NifV7RxFFQ6sB
 hHP5/tAgOHhSh6IbkpDVpMoxfPV+vUhswCSsdx+ziqDog1GCSivhdvlN1vCj67+0PHGu
 zEqg==
X-Gm-Message-State: AO0yUKWmy0OR2ENdGP03arkH75BFWn/jSRwUvlsaPwWbg+ArLkog9Ybx
 cvHmSzUgJwf1YOXl/RfymF6Io2hHTpDR7+PzDfH5qw==
X-Google-Smtp-Source: AK7set8HSUAONmMGjCLxluWKkblonrYG46aGqMaa0gy97ePYCi6EJ/5rXDpqMSdSXm8WyHjzeDXD4w==
X-Received: by 2002:a17:903:41c4:b0:19c:c184:d208 with SMTP id
 u4-20020a17090341c400b0019cc184d208mr22161867ple.66.1678293648307; 
 Wed, 08 Mar 2023 08:40:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:47 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 05/16] drm: exynos: dsi: Introduce hw_type platform data
Date: Wed,  8 Mar 2023 22:09:42 +0530
Message-Id: <20230308163953.28506-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM controller is common DSI IP that can be used
in various SoCs like Exynos, i.MX8M Mini/Nano/Plus.

Add hw_type enum via platform_data so that accessing the different
controller data between various platforms becomes easy and meaningful.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
Changes for v15, v13:
- none
Changes for v12:
- collect RB from Marek
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
index 90ff40af005c..0f0834ebbdf3 100644
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
@@ -1704,7 +1711,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
-	dsi->driver_data = of_device_get_match_data(dev);
+	dsi->plat_data = of_device_get_match_data(dev);
+	dsi->driver_data = exynos_dsi_types[dsi->plat_data->hw_type];
 
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
@@ -1862,6 +1870,51 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
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

