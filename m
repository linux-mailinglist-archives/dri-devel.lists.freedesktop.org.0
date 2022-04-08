Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3264F9A8A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1910E57C;
	Fri,  8 Apr 2022 16:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844BD10E57C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:23:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id m16so8325146plx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BcGnOMSzwjZFrNXSVlFPVWXXS7lgriFVwZOMf5bb+Q=;
 b=We3vH+y0Mvp4vomDHy48uyUJfB57yiHGtFksV7jKt/RqNk13ogzyaOBhxM3TKa/UdX
 W/jTuE53ny3+jzqdozCu3JA/EnajIxxtSEBz288qV3N6dAWioF9i5yRnWsZZSiC8geWr
 aK6d60mZynTT1pJUpHGdZ8dMO3RzL14039dvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BcGnOMSzwjZFrNXSVlFPVWXXS7lgriFVwZOMf5bb+Q=;
 b=4TFpzEQStAEFA6jPtSZ2rJ1RRQ2amY9Wsv8fKnyA/FbjSz+p0tWEVyIuvPVDka7xpC
 KuHimsjME94r22DgxGPasc9l02AJjT9CM3jW3wAbPq92yiEhiFEdJ7VfNTQruurbHeGM
 1JVDqjvBJfGvJe23Qxu1HyVf1YUUHNQ+O4JpM/xt4oKWwmpLRPCyMtXSJSS2qABukC8/
 3XBAT2f722t5HxgkzUZ8m4/LSZbzpaGmJ/jvfblWxhB8X5NEaYbVPTVbvFp49z5Axw3R
 ZG83eJ76x/wtfIq6yUIVEqPtzlOlWz8DnP1gQgCxYKg7ijYON5sTAtKT9zJysDC1/y/p
 WA5Q==
X-Gm-Message-State: AOAM532Ggb2iOsjg++bojc/Eqjda/73C+RnpCR+VdxujkcHko8mHE42Q
 0KI07mKDgIpD47+5PPYs9hSziw==
X-Google-Smtp-Source: ABdhPJyY5V/jo6PLk4tqnezupCR3cG8rU+NwTCbFTj+TP9E+tVz7a4uK9wo6MO7hilmUa5Zedheelw==
X-Received: by 2002:a17:903:2352:b0:155:d4e8:12c6 with SMTP id
 c18-20020a170903235200b00155d4e812c6mr20780844plh.27.1649435018093; 
 Fri, 08 Apr 2022 09:23:38 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:23:37 -0700 (PDT)
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
Subject: [PATCH 11/11] drm: bridge: samsung-dsim: Add i.MX8MM support
Date: Fri,  8 Apr 2022 21:51:08 +0530
Message-Id: <20220408162108.184583-12-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM master can also be found in i.MX8MM SoC.

Add compatible and associated driver_data for it.

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 71bbaf19f530..d91510a51981 100644
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

