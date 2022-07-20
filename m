Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD957BAE8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D18F779;
	Wed, 20 Jul 2022 15:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE90B8F7CB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:54:03 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id w7so15337781ply.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6jxRQ9Oop0f01LfNyCcXEkFGJrvZaC01iuAVK7jrGE=;
 b=Kvepmg+8gfLb9h4wngqSZ/l3IJFRZfWuKsbiIwYgXc+d5H3cSK3+vxuwXwYPJvRcBP
 BwbmU+yPwIIqAAIAS2CiJtj7sSJs+g/u6gvhZ5GI3lJmHE0ZXHo0ozVZjpVoHYW9IUwa
 uZgdC1MKZ6/X9vGmMdhEtOfU6IHEmP/uKn9cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6jxRQ9Oop0f01LfNyCcXEkFGJrvZaC01iuAVK7jrGE=;
 b=dlSf62Si8SmTqNRLhchOQw9MZIkBsHyHfSlLxeWt0pTRvsrCkd8HlbxM535VyyHm0a
 EbqW+arvKOmKQipKHqWsi12T7moLV2VCM/mVQA44whn4AyG3Utq5Bf8qmRBtB2FFBAAp
 pAK6ueG2reP2pTH0Cc6idm+3AM7lxBPFm9GkCL3IhQIzBdIVYAsQg8qGkdwILZjS3yxK
 QfjGePsim9VzqKMKJ0umYXmRUTdLN29YvKybW4e8GPIS5gqjDC4Y0eqj9k7JML3SY48J
 CvvPA67c2QrGTdgW4NRmXoPnpgfe1suKbb34gFZqFZgJa8FCKgg28NXy57//Bdl0EdXK
 39fw==
X-Gm-Message-State: AJIora+DTqdSv26DAi0bgAj/9DIgIGsMauJjUN/8YHqNShyobUE2rSeF
 +gUkyUw1vdcQkCkSSXWnZoAzsg==
X-Google-Smtp-Source: AGRyM1t1awHfi+gMFM9GmRgMsXqaxnj5Fs4l1OQDPqzIY6vvAaaw4r3/6XI1IXXHl3FjpkGisim9Xw==
X-Received: by 2002:a17:903:11c9:b0:16b:8293:c599 with SMTP id
 q9-20020a17090311c900b0016b8293c599mr38384479plh.136.1658332443279; 
 Wed, 20 Jul 2022 08:54:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:54:02 -0700 (PDT)
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
Subject: [PATCH v3 13/13] drm: bridge: samsung-dsim: Add i.MX8MM support
Date: Wed, 20 Jul 2022 21:22:10 +0530
Message-Id: <20220720155210.365977-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

v3:
* enable DSIM_QUIRK_FIXUP_SYNC_POL quirk

v2:
* collect Laurent r-b

v1:
* none

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ef439b49f2b8..3b859b61f493 100644
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
@@ -426,6 +444,19 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.quirks = DSIM_QUIRK_PLAT_DATA,
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
+	.quirks = DSIM_QUIRK_FIXUP_SYNC_POL,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -447,6 +478,10 @@ static const struct of_device_id samsung_dsim_of_match[] = {
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

