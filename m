Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB764858A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9710E554;
	Fri,  9 Dec 2022 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8A610E551
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:29:11 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w23so5203816ply.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSNOc+bqWhWXNl6JS/X0v2ej/6qOLiMK7cWS2dLY9bo=;
 b=pqKNlGd1L6MkLcGapDn1ddT9qsRA2tBBcsH/QwAPPKVOuIWBuxFMvYRlHNHXTwGqhr
 P5hpvucfwEjVdBGeuUHz4cVkMVjA+3+p3TwykepSuU9vkgK5yEG1WtncA10tzkl04I6x
 ZTeYXaQwN9uVhbWlBge1sHAM8RH52rdfSaP9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSNOc+bqWhWXNl6JS/X0v2ej/6qOLiMK7cWS2dLY9bo=;
 b=ZEJucO4t1/c0lfAj3H4awsh0Oavx0AfLYyWOKaly4/n0c1Wbtsrbt7qSctfqMDEIzO
 dMe9PoqdUzTxMeWNoREGJvJ2QlXhNIXV2WIJS8PfzZrgQ0kMldrpSTAeee4ev0HaXvsj
 VpAWzFBdOPKOXvwiRVhNpGcwv+0sfxYqdEBOLMDUWNPzVOIzOUzChRyCzAKaXHBlxFSH
 oI/V1uGrm/Yh8mLgO91022yG4Tob6BYcKh8qogiw/qQ2Hdhc98Q7cbCHYIeAOxIH1iOs
 DRJvawJR9r2nok1T8XdxKQCnWleHTVhYJEAuS6HgsRlRIfdvD16TAnJ2A0yDCqj6fQlP
 YS0g==
X-Gm-Message-State: ANoB5pmmrfjD3cfrCSrvAG5eNlNo7YAf83WU001E4F7uJMfv9XyZeXgU
 0eANcSy0pfvrds5q0ucTxsOT+w==
X-Google-Smtp-Source: AA0mqf4I4nr7C18GgZjZywVz0pFfmRw151lDEA1ZdLvNYhmFL+Lm8B1w9wdAw4niSM9XIzKn6+2n5g==
X-Received: by 2002:a17:902:b210:b0:186:c544:8b38 with SMTP id
 t16-20020a170902b21000b00186c5448b38mr6269597plr.67.1670599751490; 
 Fri, 09 Dec 2022 07:29:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:29:10 -0800 (PST)
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
Subject: [PATCH v9 16/18] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano
 support
Date: Fri,  9 Dec 2022 20:53:41 +0530
Message-Id: <20221209152343.180139-17-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.

Add compatible and associated driver_data for it.

v9:
* none

v8:
* fix and update the comment

v7, v6:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v5:
* [mszyprow] rebased and adjusted to the new driver initialization
* drop quirk

v4:
* none

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4de1294f29b3..7ff10308a7ad 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -376,6 +376,24 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
+static const unsigned int imx8mm_dsim_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x26),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x08),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+};
+
 static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
@@ -437,6 +455,22 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_values = exynos5422_reg_values,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	/*
+	 * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/Nano/Plus
+	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
+	 */
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct samsung_dsim_driver_data *
 samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS3250] = &exynos3_dsi_driver_data,
@@ -444,6 +478,7 @@ samsung_dsim_types[SAMSUNG_DSIM_TYPE_COUNT] = {
 	[SAMSUNG_DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[SAMSUNG_DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[SAMSUNG_DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 };
 
 static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
@@ -1843,7 +1878,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops = {
 };
 EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
 
+static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata = {
+	.hw_type = SAMSUNG_DSIM_TYPE_IMX8MM,
+	.host_ops = &samsung_dsim_generic_host_ops,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
+	{
+		.compatible = "fsl,imx8mm-mipi-dsim",
+		.data = &samsung_dsim_imx8mm_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
-- 
2.25.1

