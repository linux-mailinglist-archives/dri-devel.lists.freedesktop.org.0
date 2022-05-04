Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D1519E37
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4C10F8E1;
	Wed,  4 May 2022 11:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D0010F801
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:25 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so4932637pjv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnxPwikYcR/jRiJl0SfLW9jDFUFDEElKVltkxR/q3qU=;
 b=rMeI6li5cSb5bfYuFxYii7uXpogq73tD95HMSXX3ah4VSllZwn/xt036BLc1+TUI6f
 jbVkxmIsx3s6srnnnbK135jj0jJ9vroya9ZIEYfn4NWqeEy/D7cpN1IL6O6lzXZaIbn2
 CDKSZSsAFWO9n3pLwogdozlLBBPn/gPlTzZ9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnxPwikYcR/jRiJl0SfLW9jDFUFDEElKVltkxR/q3qU=;
 b=iMzJc+Mt8+z4hgOMlqNXDaVLiL2ruVQKml8yN68FUi+xN8wUPP3/VOrrY0WCKGDlgM
 VZMRy/iCjODMWhE/M5gD8GcXHhWSx4FNkv5jkFqQGq22q7B3Dwr/BJJEvchD2xrknfdE
 l70qmQmmmsKrsd+SzABRZYl72RCiYkMQx7JKANjCv5kmAom8faHN+YQWysnSxGQziKMz
 VT0E1EJBWDTLeHaqp/3TDxKIfGkRGpx65rNSjUH42ih6Xgcvp/0AFPvyKA25E1vesZGL
 g7Spe2aorcjcfHC/hAQjEqtGMSD0Ebh9chjGYRsC63fvpA3pDCxiowK72srxsKlTOP4/
 B6Jg==
X-Gm-Message-State: AOAM533sej0yDPTtUyQ8VQA+Jg5doXOj4OmRjU1rdXTYJC3Iy7KwlQWJ
 nAvgNnxDFTWyP8rCwXBYTrlC8Q==
X-Google-Smtp-Source: ABdhPJwC3qfBwE1O4Eo41xPVk7grFlNFz3ubLdcJAaZ4//IGYIF9K66D9EFDJIo7sUUwQBT7EdCDNQ==
X-Received: by 2002:a17:90a:7acb:b0:1d9:85a5:e1e3 with SMTP id
 b11-20020a17090a7acb00b001d985a5e1e3mr9731041pjl.172.1651664485044; 
 Wed, 04 May 2022 04:41:25 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:24 -0700 (PDT)
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
Subject: [PATCH v2 06/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
Date: Wed,  4 May 2022 17:10:15 +0530
Message-Id: <20220504114021.33265-7-jagan@amarulasolutions.com>
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

The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
range from BIT[18-13] and the upstream driver is using the same offset.

However, offset 13 is not working on i.MX8M Mini platforms but downstream
NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.

Not sure about whether it is reference manual documentation or something
else but this patch trusts the downstream code and fixes the PLL_P offset.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

v2:
* none

v1:
* updated commit message
* add downstream driver link

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b9361af5ef2d..8f9ae16d45bc 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -169,7 +169,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -369,6 +369,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -382,6 +383,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -393,6 +395,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.platform_init = true,
 };
@@ -405,6 +408,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.platform_init = true,
 };
@@ -417,6 +421,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.platform_init = true,
 };
@@ -564,7 +569,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 70224d20414b..e5291e105227 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -40,6 +40,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	bool platform_init;
 };
-- 
2.25.1

