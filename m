Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496A5A5413
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBC010F6BA;
	Mon, 29 Aug 2022 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A5A10E603
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:41:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id u22so8833311plq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PPlEiJ1s7VViC3D9HvOY78/ATyLjYX2n1j74zd4YcKk=;
 b=QhLJ26UKWuluZfQdk2QtTP/ylCjGaEfAvCSyKojFJah7jSAQzU1r0fOM0wwqIoTz4p
 qgSIew4UizYRkAW6QT/fbhSo3SzpbwVDA1ruqI6zIUz/T9TTIatvdSBd073EOlUZV4Eo
 DRkj4pMqHCOyyeEtGUYEJoMCeEkSUuKo8sznY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PPlEiJ1s7VViC3D9HvOY78/ATyLjYX2n1j74zd4YcKk=;
 b=x9h8xys3WUCAVH3wDbIJFIxes6j+c58ndSaHKYHLJfL7dgMgk46qLgDC6rZV2oFz0F
 B1BYZCWvOE0TVvIRoqcbgkqm6nMGBAhZDcyYXA8zAxtMZL/KPk6XzQDtZVIpgsNiyv3a
 +Mqu8PqmO9CZQbdHSjToCRB1FGxu/arYieriFSO2v5H0HZiXG+Fo7BAbCH/SnfHhC2HI
 GDlP6ptDLN27bpWVtjjV73AL8EArX22vIGuG2hxgqNrp+5+/7FaQphuA7KxCIrEdjvWB
 fsIm0rjE9FPJLovAcZ+sgJJSBalS2btHnYYof2tk4+8MKNpK26fdQXDdvtZubV9dI37H
 Zbmw==
X-Gm-Message-State: ACgBeo2woNTuLVvhrr26oaRLQ758ln5RjM4o8bd7lfTLSO6MWFb6K/JN
 79suVzhYMVdWM5f1lmXw0zgdng==
X-Google-Smtp-Source: AA6agR6vTqim2hlf9fZI6ItfjbP5zs3H1cmu5kV+ibwJP7DhviVYcQ0aOB9pCO7sJpJMBJKgwW6xRA==
X-Received: by 2002:a17:90b:2c12:b0:1fd:78fa:5ea7 with SMTP id
 rv18-20020a17090b2c1200b001fd78fa5ea7mr16325155pjb.29.1661798482992; 
 Mon, 29 Aug 2022 11:41:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:41:22 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v4 04/12] drm: bridge: samsung-dsim: Handle platform init via
 driver_data
Date: Tue, 30 Aug 2022 00:10:23 +0530
Message-Id: <20220829184031.1863663-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

In order to make a common Samsung DSIM bridge driver some platform
specific glue code needs to maintain separately as it is hard to
maintain platform specific glue and conventional component_ops on
the drm bridge drivers side.

This patch is trying to support that glue code initialization based
on the DSIM_QUIRK_PLAT_DATA set from respective driver_data.

So, the platforms which enable DSIM_QUIRK_PLAT_DATA flags will handle
all platform specific initialization via samsung_dsim_plat_probe.

The platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v4:
* none

v3:
* update samsung_dsim_plat_probe return value
* add plat_data quirk to handle platform init

v2:
* fix samsung_dsim_plat_probe return pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  5 +++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8130845750ac..76dc7687857a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -369,6 +369,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -391,6 +393,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -402,6 +405,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -413,6 +417,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
 
 static const struct of_device_id samsung_dsim_of_match[] = {
@@ -1609,7 +1614,11 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	ret = samsung_dsim_plat_probe(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		ret = samsung_dsim_plat_probe(dsi);
+	else
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
+
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1627,7 +1636,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2e245bffd1b6..97fdee5ef5df 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -33,6 +33,10 @@ struct samsung_dsim_transfer {
 	u16 rx_done;
 };
 
+enum samsung_dsim_quirks {
+	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+};
+
 struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
@@ -43,6 +47,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	enum samsung_dsim_quirks quirks;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

