Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A7677AC8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD3810E35E;
	Mon, 23 Jan 2023 12:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8536C10E362
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:24:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso6421094pjp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAvQp2V3Vm1L1L/g4jdQdxESIHHdfq30+cBP/7icSHY=;
 b=eNjD6AW8+bLf0kxU4c1OqKAiySd4LKDm7KeaVcBWchWEvellB1QLfWU3h7/5uSVPpn
 sNsss/PL3V43mQ8AWDMILmkElS4AG60ReBNIJv58WCgekbGvSYCyBPUaYka6l/hUZ3Rr
 rLicn94dp3tBBJuKEV+9b5/c46yPfg2p2RYsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAvQp2V3Vm1L1L/g4jdQdxESIHHdfq30+cBP/7icSHY=;
 b=HQwvslVu/EAXkDDQXNuz6Tq78ITQjO7krXAsd1vp0CsbSogQb9gCdIXSQ6JjciWqVz
 Af1lJw6igDOBtcvspK/vsTcAYjOpkuT0EJJ8DD0VFVaj+TD9dM3E/tc3TmeY/avSuYCC
 Pt8RL8+MJepNbb3eVcs6sOyRqBz/DdFQi1BKkrhAtGJm9QbmyQcJK97vnJ4uoc4zhuK5
 MjRA8bwxYePjjNAH/UHRIDFMSndcjGiBF7oTRo49y2kgQnTCuUWkmNDN+Y8bjWTh7h6A
 dx5vrfdH1Xf5eG28qaqQeswXsFiSCmKhO4UbBFSR7Tvnb3EJFRlouMkMyUUAO1hI6wgi
 3YCw==
X-Gm-Message-State: AFqh2kqiwGTC1wqUSfvZ07HrrVvQCPaLse5XfiwPTd5OMsQAzGeugZLE
 Pxt2aAwa7ssrMkI+pd4A2cbZ7Q==
X-Google-Smtp-Source: AMrXdXs6zgsW+8d6u7OhPJZwO+hved+zc8n6aq3EAFvyKJqtpsYq5se8zU8Ls/4saA5mf5C0GUARFA==
X-Received: by 2002:a17:902:7889:b0:192:b5a8:3eb6 with SMTP id
 q9-20020a170902788900b00192b5a83eb6mr20874074pll.44.1674476667125; 
 Mon, 23 Jan 2023 04:24:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:24:26 -0800 (PST)
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
Subject: [PATCH v11 07/18] drm: exynos: dsi: Introduce hw_type platform data
Date: Mon, 23 Jan 2023 17:53:08 +0530
Message-Id: <20230123122319.261341-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

