Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3954F9A6B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6610E50A;
	Fri,  8 Apr 2022 16:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409510E50A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:22:25 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso12357399pju.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F25FQfPSS7j5Jl6aKgoVhvmm2u3Vlj8tvVo3HS+kjyo=;
 b=aBaLEom+igUlrFQZdiMs/QzKxvE93YL5BFrixVAL9mbjIoudJePpKPdcX/aFlKDhk8
 ytH0zx+FwxLqndgHN8xZTMzR9HZ0ojs3YJWOhCmwDgYQ4agLP5A+MxS+kKE1oo5rr1RA
 uTVr/Q/2tnYD9z3hC5m7xlavoNduTKLaeMv1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F25FQfPSS7j5Jl6aKgoVhvmm2u3Vlj8tvVo3HS+kjyo=;
 b=R/No/13EgUz7izl7XNxes3rx6OH4YUOTpYYS9pIEuk1oQHsGcYiAnQhjTVvICikO63
 o5+xLg/G+hE5SIq7ybtrFELaeNSPZBjuTmAEaxXxFcj93IqOkRCZ4HLnlfmYpE6MwLYw
 0LAFi1R0oMDjbY7pPB5rCxURKDs5FzfR99Zr1KBJycHWX5ID0iNROZrQvBbiwc3qWtDy
 j8i2VvN5eBXzEvT+8eBe+saam/DuZc42xmf7SRQAM9JNtAmFxOLfuNVlMqc5zC8O3fKp
 S69KVqvKwq65dtmwQygfzE3qsiO/wEhAE5JOlPNHJiFuu1mibDzJgw3JLMVLmaSFVjy4
 pbTQ==
X-Gm-Message-State: AOAM533MgauJ9fwW1wW18X6mrovEs4sWd1zfgS23L1ZJGbAyrUhPprgI
 ukzr0gJ02x3G5d1Wn37C5uqkNw==
X-Google-Smtp-Source: ABdhPJyqoJ+F5cKD3e0t4GkmsEUp4pQLPVzZdPUzFFYovdmn2C/dAXiAG17M0ajaIbBriRTkKuEzPw==
X-Received: by 2002:a17:902:6acc:b0:149:8f60:a526 with SMTP id
 i12-20020a1709026acc00b001498f60a526mr20139884plt.25.1649434945090; 
 Fri, 08 Apr 2022 09:22:25 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:22:24 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 02/11] drm: bridge: samsung-dsim: Handle platform init via
 driver_data
Date: Fri,  8 Apr 2022 21:50:59 +0530
Message-Id: <20220408162108.184583-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make a common Samsung DSIM bridge driver some platform specific
glue code needs to maintain separately as it is hard to maintain platform
specific glue and conventional component_ops on the drm bridge drivers side.

This patch is trying to support that glue code initialization and invocation
in the form of platform_init flag in driver_data.

So, the platforms which enable platform_init flags will handle all platform
specific initialization via samsung_dsim_plat_probe.

The Platform probe is responsible to
- initialize samsung_dsim_plat_data and install hooks
- initialize component_ops
- preserve samsung_dsim structure pointer

v1:
* use platform_init instead of exynos_specific
* handle component_ops in glue code

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 20 ++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ee5d7e5518a6..0e6a5d1c7e4e 100644
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
@@ -1565,12 +1570,16 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	dsi->plat_data = samsung_dsim_plat_probe(dsi);
-	if (IS_ERR(dsi->plat_data)) {
+	if (dsi->driver_data->platform_init) {
+		dsi->plat_data = samsung_dsim_plat_probe(dsi);
 		ret = PTR_ERR(dsi->plat_data);
-		goto err_disable_runtime;
+	} else {
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
 	}
 
+	if (ret)
+		goto err_disable_runtime;
+
 	return 0;
 
 err_disable_runtime:
@@ -1585,7 +1594,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	samsung_dsim_plat_remove(dsi);
+	if (dsi->driver_data->platform_init)
+		samsung_dsim_plat_remove(dsi);
+	else
+		mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	return 0;
 }
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 59a43f9c4477..eca7eacb5910 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -39,6 +39,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	bool platform_init;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.25.1

