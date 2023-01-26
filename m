Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5E67CEB7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90A110E92D;
	Thu, 26 Jan 2023 14:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85110E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:48:26 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d3so1991238plr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMIeNlQX1kpLCSK2213Nh/t20sw/zDBNyvoSqBTr940=;
 b=F7NyYLMycjIoMjaP3DOlXk6uH4cBhJSK095XAZrEqeiEhtY0234kpDJ/jCKP5Ar58q
 nWPzD0tNrOIdogcYU4PeAARxyDFgIjaIESTbr4eRvYsJPKKfF2Dl7aVIiYivl6+xeDXZ
 c1AQfTvFB19+pXXKriuFj/n9hZE4e5muXIMLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMIeNlQX1kpLCSK2213Nh/t20sw/zDBNyvoSqBTr940=;
 b=PAu7SAtWcDUpeD304VsvV2zfGxEF7uvWJGYF7BM1pFLjtz9zrgMmX/Y2IRpK1G2jmU
 +4suDQUTNIfl1bceRtuN0AepO73pzodFTVUofBaRs9muarPk+tk1SeMuhOHawlD7vCmz
 Pevuzoid3hLwFRJxEGCGhQNuLF5kyaQLcSxYwP1CwMIq6jttV4FERA4rZS7JYOBnLJnM
 Ek91F31QGz1UZnmLzMI7FokTem/Nrr9uinJ34R77hvSVzOowyTiJX+wTa7LRyjyJJeq1
 A1uvvZFX6PsIdXIl7zNkjfANSdIp2W0aq6WlVRwsrOrN0qAj1/JNJUQzmNmYBdKeiQC9
 YIjg==
X-Gm-Message-State: AO0yUKUzKqk+SELFbz+EOeQ6jfFqU9mI9IDp3CCo1IgJ9/ooZL/AnDKk
 nSBZtWy7kumiSOATnTqY9opeCA==
X-Google-Smtp-Source: AK7set8m7x1NPxEBd47AGk3fztqr+4pr/7FTzJtG4adsdxO8pdkbQBiGBxb1NTJBcAvA8X+J/mhTyA==
X-Received: by 2002:a05:6a20:ba14:b0:b8:723f:e21b with SMTP id
 fa20-20020a056a20ba1400b000b8723fe21bmr2005411pzb.3.1674744505688; 
 Thu, 26 Jan 2023 06:48:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:48:25 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus support
Date: Thu, 26 Jan 2023 20:14:27 +0530
Message-Id: <20230126144427.607098-19-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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

From: Marek Vasut <marex@denx.de>

Add extras to support i.MX8M Plus. The main change is the removal of
HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
the implementation of this IP in i.MX8M Plus is very much compatible
with the i.MX8M Mini/Nano one.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
- collect ACK from Robert
Changes for v10:
- none
Changes for v9:
- added im8mp in DSIM_STATE_REINITIALIZED check
- drop previous = NULL check

 drivers/gpu/drm/bridge/samsung-dsim.c | 23 +++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index fd042dbcd8d6..ec4a2106d34f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -479,6 +479,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
 	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
+	[DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1452,10 +1453,17 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 	 * 13.6.2.7.2 RGB interface
 	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
 	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 *
+	 * The i.MX8M Plus glue logic between LCDIFv3 and DSIM does not
+	 * implement the same behavior, therefore LCDIFv3 must generate
+	 * HS/VS/DE signals active HIGH.
 	 */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM) {
 		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
 		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	} else if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MP) {
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
 	return 0;
@@ -1678,6 +1686,10 @@ static const struct samsung_dsim_host_ops generic_dsim_host_ops = {
 	.unregister_host = generic_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_high = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
 	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
@@ -1767,6 +1779,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+	else
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
@@ -1872,11 +1886,20 @@ static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
 	.host_ops = &generic_dsim_host_ops,
 };
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mp_pdata = {
+	.hw_type = DSIM_TYPE_IMX8MP,
+	.host_ops = &generic_dsim_host_ops,
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
index 4ba387c958ae..fb923caf09e1 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -28,6 +28,7 @@ enum samsung_dsim_type {
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
 	DSIM_TYPE_IMX8MM,
+	DSIM_TYPE_IMX8MP,
 	DSIM_TYPE_COUNT,
 };
 
-- 
2.25.1

