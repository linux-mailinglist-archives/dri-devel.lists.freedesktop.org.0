Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2CB3BAC5A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49989DA8;
	Sun,  4 Jul 2021 09:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8425B89DA8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b1so8442916pls.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bHcsvEUVCxZAmQsc7mXrBSFPs2QDRsjgJq87Ua6YvE0=;
 b=YIEo3EAzws95+IRORqWvpcXbV6x+MOJaaacvQr5+CIYnIbotgC1K01lc+0XQVzvVeP
 CDGnx5fLmmE0HtWWKwMK/Sl6wpQf2OdXOTh5NcDiDha/4hHoxnVscR7LM8hmgOg2N1A6
 ClLcDGFTXq3pNOiNo7IpjsbyLUUwzcC1t2Myk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHcsvEUVCxZAmQsc7mXrBSFPs2QDRsjgJq87Ua6YvE0=;
 b=LBRRncwXF9JwNHvpq+xz6uNSA1f6x54YfL7tLZKFt4GtBAxqekz3YjdWGvt6F48Xa/
 iMFAbPjM5fzvnDZ6r7Iqub2M1maz4kpx4DOTfVeCmT1kw6SThb3wyRNonWWu7vTUxXpD
 FvkYSNRYGwvXMS+rwHt5jMFIqPGu3NpqrPM3wrxOebliwqbQB16HAIRLm/SD5+cVVGuB
 XdwWfjZongXevaMvb340DSKUcsKn2ZRl/lrWP1Re4oRTb7xpAionDcsFkrAsg7/Q/tS8
 loaXuDJfvSR2XHsCYMqdpkQVxxrfDSLQ/RsiY1KsddK56+OmqOqAb981sPQE6PdOs3dZ
 5wLA==
X-Gm-Message-State: AOAM533z7Iz3Zxmsm1MEkH+g8dXjiDfazVbOLAU/J/dByUACEg0zs3Yq
 5/8Qr0z4YwowNjVVRE0rTi05Bw==
X-Google-Smtp-Source: ABdhPJwhx0sFvMYc5Td8Aj1SfnBuNMkOOb9TDo52OwhHAPrn9XOZK7rsA7ADAxUeClmDb8m2Ykg4Fw==
X-Received: by 2002:a17:902:f243:b029:129:5706:3c4b with SMTP id
 j3-20020a170902f243b029012957063c4bmr7357866plc.83.1625389530178; 
 Sun, 04 Jul 2021 02:05:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:29 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 13/17] drm: bridge: samsung-dsim: Add i.MX8MM support
Date: Sun,  4 Jul 2021 14:32:26 +0530
Message-Id: <20210704090230.26489-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add compatible and associated driver_data it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9a2df1212d0f..ea379cb0cc32 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -460,6 +460,24 @@ static const unsigned int exynos5433_reg_values[] = {
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
@@ -521,6 +539,17 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.reg_values = imx8mm_dsim_reg_values,
+};
+
 static const struct of_device_id samsung_dsim_of_match[] = {
 	{ .compatible = "samsung,exynos3250-mipi-dsi",
 	  .data = &exynos3_dsi_driver_data },
@@ -532,6 +561,8 @@ static const struct of_device_id samsung_dsim_of_match[] = {
 	  .data = &exynos5422_dsi_driver_data },
 	{ .compatible = "samsung,exynos5433-mipi-dsi",
 	  .data = &exynos5433_dsi_driver_data },
+	{ .compatible = "fsl,imx8mm-mipi-dsim",
+	  .data = &imx8mm_dsi_driver_data },
 	{ }
 };
 
-- 
2.25.1

