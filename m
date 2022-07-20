Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F135857BADB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D6D8F18A;
	Wed, 20 Jul 2022 15:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348D8EEC3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so2681066pjl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxR6CUOwwWEjMcW3mif4HEJmZlAI1+6I4LruC075u5Y=;
 b=GkZXTRM+UVefP5k4OwsF140G9crKAV/V/JVCy2Ea1fAj3nc/qpJPSdSlyrit+okO4O
 cDf0UoGpzhh61Sxc57RaLxVpBAyiHRM1c/YDKfOTRkq2PyY3Gud5qmvFRDP0xtACn4sN
 O4S7HYNr9sGMN+Ntp8FF1FHFIrutVDHM6nUy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxR6CUOwwWEjMcW3mif4HEJmZlAI1+6I4LruC075u5Y=;
 b=aWDQX5wQEioromL7NsM9+54AD2FpEX9YpfTf0lX19eJuCXZ3Z0u5TUpZtaktsY7VHd
 y41MZ7PieFg6EtdIdAjhCLg3rnZwqwI2oSW2DoWgtuoPbC0HtKQ67SQtPD228TWE7Cu0
 NMXs5/x7zEmcwdkb5lcpPBE3g5X0ap62IDtosxxOwP2SAleiY0NwQjapLYVyRO9fp475
 bbOyw9lsbc75791tNigRaKFc0d2ghL/1GhxExmfeSaLS//Dn/uHaRzaZZteON7ZQgM5J
 HzdNuOoRTWN1MqEtXqZ0yAYqnP+DQG7xsHeXfqPAVquX8QxwkcyUzZoHu1Zr2N7vkBTM
 pFjQ==
X-Gm-Message-State: AJIora9aQkJwxA3QnfRQ9QkY1ztvZ3b3F2H+g/VfyyC0U64ZdGiogRu/
 l/jjWKC1bS+LzhhBjFC+ll+o7Q==
X-Google-Smtp-Source: AGRyM1uPiDP7h7UWMqmKKgE/5fBEmPp6YbpTJx1Z+Nc08lqFIzPL5n7tTSO6OAR87FzxpIcruqX2/g==
X-Received: by 2002:a17:90b:1e53:b0:1f0:2a08:e101 with SMTP id
 pi19-20020a17090b1e5300b001f02a08e101mr6356268pjb.208.1658332399980; 
 Wed, 20 Jul 2022 08:53:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:19 -0700 (PDT)
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
Subject: [PATCH v3 07/13] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
Date: Wed, 20 Jul 2022 21:22:04 +0530
Message-Id: <20220720155210.365977-8-jagan@amarulasolutions.com>
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

v3, v2:
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
index b07909a52f2d..5eb594ea0bdf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -168,7 +168,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -368,6 +368,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -404,6 +407,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -416,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.quirks = DSIM_QUIRK_PLAT_DATA,
 };
@@ -563,7 +568,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 97fdee5ef5df..c852d7b9981e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -46,6 +46,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	enum samsung_dsim_quirks quirks;
 };
-- 
2.25.1

