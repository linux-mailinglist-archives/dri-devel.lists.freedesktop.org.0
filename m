Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A5519E43
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F910F9E3;
	Wed,  4 May 2022 11:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA02710F9E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:42:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so4943566pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVMCRacZCx0pOFgSAXyCugFOs6e7iXb5CCX+AZorTUs=;
 b=klRpm+bnZHvWeZwrFYyfY4LbwN4k4OUygMUb5wlcCe4oCYM914hV5mjujI6rJGHiE0
 VEU5jCES1LsPVweaDUF7Y56h023FST9Kcy9tfMerGABwnCdUWaKRgrwWUqUJySg/T3zJ
 qSgY2864wrGGKDENx3hxyDDY7pqaNeTAJ/nB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVMCRacZCx0pOFgSAXyCugFOs6e7iXb5CCX+AZorTUs=;
 b=V/l+WyNmNX8aRRgiu5bbiuZc4t32MkryOrvF9u2yDxOm5KhSLxo03OEzYBuphEFmvd
 WpG8ni1YHaSgarG80p4b8h1rXH7W20E7sB5u7rXdu2kWu5H/mi1Csez4nluVxb9GyZ58
 eSL0R8I/CIYxDoe9neBGA83jGu4tY905EFSGUT2YvxygX2G2G+6Roggu6Yj1LoBaAtbG
 DLVxeYyiTFnE1SkAoloYZXuEn2LQ0M4dVydxHaS0ya4YUhMmZipjikdd2qHBRz1Vl8yU
 OOmsBxOeMFhuTUBzEFWAkR1XvnNdzv/QMEOkLd7vCy1WkOUuWvFFEhActNzyKXChxSLp
 LvPQ==
X-Gm-Message-State: AOAM533kjYQ6w9HUyJbbcVQF5PVivrJszuM3okMZHRSORTV4GTByHyHR
 qs0dH3jfoaO4hOIkXwcS6aEE1g==
X-Google-Smtp-Source: ABdhPJygOQUvQ2PEcTsHzZAi9PASaMzc7CNkHNnA7gxnMtopmXvM7jmtXKfRcp5aGgFytBAVY1prxw==
X-Received: by 2002:a17:90a:d593:b0:1d9:2bc9:f1a6 with SMTP id
 v19-20020a17090ad59300b001d92bc9f1a6mr9770441pju.207.1651664529532; 
 Wed, 04 May 2022 04:42:09 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:42:09 -0700 (PDT)
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
Subject: [PATCH v2 12/12] drm: bridge: samsung-dsim: Add i.MX8MM support
Date: Wed,  4 May 2022 17:10:21 +0530
Message-Id: <20220504114021.33265-13-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM master can also be found in i.MX8MM SoC.

Add compatible and associated driver_data for it.

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 28ed6b096fd0..138323dec0eb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -360,6 +360,24 @@ static const unsigned int exynos5433_reg_values[] = {
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
@@ -426,6 +444,18 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.platform_init = true,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.pll_p_offset = 14,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -447,6 +477,10 @@ static const struct of_device_id samsung_dsim_of_match[] = {
 		.compatible = "samsung,exynos5433-mipi-dsi",
 		.data = &exynos5433_dsi_driver_data
 	},
+	{
+		.compatible = "fsl,imx8mm-mipi-dsim",
+		.data = &imx8mm_dsi_driver_data
+	},
 	{ /* sentinel. */ }
 };
 
-- 
2.25.1

