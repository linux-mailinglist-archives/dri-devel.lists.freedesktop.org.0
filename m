Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9A519E30
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782E10F1F3;
	Wed,  4 May 2022 11:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF3E10F1F3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:03 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so4941090pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdD/wGuLMDzQpZtAEHDiK9YZwN0IPCd8Y4aW5A9u8PY=;
 b=hf7zZJvFwJauSkyXVeWkDRtHNkmvKRNwJja0aCJjitVuqn0rZ/G1qRLFVAkk6AQlwq
 FFbI8JUUJBNr8y/mJ5RvChuZDt/kOBF5Emqi3R/FXybLYjt6DssBfMb7+DkozBN1tua5
 d2DgAn3WCVtMAdBLnIlEHwaN5ySulFkbGDWG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdD/wGuLMDzQpZtAEHDiK9YZwN0IPCd8Y4aW5A9u8PY=;
 b=sm3TFy/+hQRJT6P1vwjB1FS2XIPJqcUkkraSh1l2BTpiU9PX36V/PPwARgzf1/+uTJ
 gQ7YnMVEsy6kCcgwBkzJ7wUfviEYye0lvM580/9c26YqaamBQC5d56sbDdYMwE5geAeJ
 ZIp8ncGHtykfoY3jiuFT7EAcbrTiIS1WWGDaiSMNGF2QLgKFRfoP+ShrL5+RNX6+K0NQ
 BzY2zHw1Eptr1qMEwkd9jRIBXfuRR9VDDmLwBpNjIXhm+YmQo3Nffcc4nHJqZzQun5hm
 KrXhJ9/xSQmjZk8x9nGQXrWDa9l5RHkggNwLUsf2/KJ2ZdLXilMlG1QGvPvXO9BrwW29
 m7jA==
X-Gm-Message-State: AOAM533XWbkXO7JbWITm/FV1RtgvxSrI/UINX8BU88PaeYDNg2wfV1l9
 M6jyUga+/nWbRcCl7Y9J/sWn5w==
X-Google-Smtp-Source: ABdhPJxQ/Ey7Ts8xFHKdtBw1BihEPT5ET563AMQiQIldEEXMR01uBieFLEoZXcQajLHNZxRIHNjIMQ==
X-Received: by 2002:a17:90a:170c:b0:1dc:20c4:6354 with SMTP id
 z12-20020a17090a170c00b001dc20c46354mr9874828pjd.113.1651664463136; 
 Wed, 04 May 2022 04:41:03 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:02 -0700 (PDT)
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 03/12] drm: bridge: samsung-dsim: Handle platform init via
 driver_data
Date: Wed,  4 May 2022 17:10:12 +0530
Message-Id: <20220504114021.33265-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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

This patch is trying to support that glue code initialization in
the form of platform_init flag in driver_data.

So, the platforms which enable platform_init flags will handle all
platform specific initialization via samsung_dsim_plat_probe.

The Platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v2:
* fix samsung_dsim_plat_probe return pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 +++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f23f06d55158..99f80e9c1600 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -370,6 +370,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -382,6 +383,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -403,6 +406,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.platform_init = true,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -414,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.platform_init = true,
 };
 
 static const struct of_device_id samsung_dsim_of_match[] = {
@@ -1610,12 +1615,16 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	dsi->plat_data = samsung_dsim_plat_probe(dsi);
-	if (IS_ERR(dsi->plat_data)) {
-		ret = PTR_ERR(dsi->plat_data);
-		goto err_disable_runtime;
+	if (dsi->driver_data->platform_init) {
+		dsi->plat_data = samsung_dsim_plat_probe(dsi);
+		ret = IS_ERR(dsi->plat_data) ? PTR_ERR(dsi->plat_data) : 0;
+	} else {
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
 	}
 
+	if (ret)
+		goto err_disable_runtime;
+
 	return 0;
 
 err_disable_runtime:
@@ -1630,7 +1639,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->platform_init)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 5cf8570ac978..70224d20414b 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -41,6 +41,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	bool platform_init;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

