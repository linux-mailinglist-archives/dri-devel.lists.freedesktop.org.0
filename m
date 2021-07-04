Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B873BAC63
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11B489DBC;
	Sun,  4 Jul 2021 09:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906B989DBC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id u14so15016598pga.11
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJdI93oojpMn0nmBw0byENsNpHTqetQ5XzeFD+Y1dMM=;
 b=HIC3CFFn0vS1e370h213jn3zDi+M3Ddrte2z3oq+x++llXbfE5O8YuH+JOxCOW3pU+
 THTYpqayA2z5pjwVuLKCoqE12PjvwU/fid5MqXEmJy3fgPMkbXRKY/pPkfWlBNc4UCpm
 JTyFApgkQ0OjHWnVnfnCMCNWucKivRLxFacPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJdI93oojpMn0nmBw0byENsNpHTqetQ5XzeFD+Y1dMM=;
 b=qm0CqNqfj7mkLZjd4ZlEsKgyWa4wDD87tlJuUY5h2e4eyHGPMjrB/aHC3oLzox59OF
 UJR26JL7TaeSwUNuiGNPdybXDC8ypioRWtVyO5ifuD2wZLwi4gWEp0lDlesd36X/thY0
 meMgt9bVOB1u0Kj59k1qTM6NPvNdCWp0VHK482D3ORlbLga/GLwDLEIt6bkogq3etNON
 kjr1Imb6Jl+9tYLx6F4JmLZ4Uh9/Hdg0BhSHYttvYnQxEulkBYO1bQ8KA1/uJzCrbos+
 ihbyHfSDmsG3kAIQRvZGGHt+ugt4YAuDiBdqhxdcEokT0At+3bkQ63t8Sd1FHRfbgdyn
 Jjxw==
X-Gm-Message-State: AOAM53140V57Gf53yJi4NK79KohKX5W5+xLRJ3dZbnmRCQs7j/fK4SZq
 cftqE+IYj4jTqKjGtHd5uT1+sA==
X-Google-Smtp-Source: ABdhPJyum/75t7uYJYVgJ+9CL9Ygq72rLafT9zJlpg7FjBTB4lGy3JyqiAgmnlU0OHd8ojPYrY1vdQ==
X-Received: by 2002:a62:7b8d:0:b029:30f:2089:25df with SMTP id
 w135-20020a627b8d0000b029030f208925dfmr8899915pfc.22.1625389548229; 
 Sun, 04 Jul 2021 02:05:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:47 -0700 (PDT)
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
Subject: [RFC PATCH 16/17] drm: bridge: samsung-dsim: Fix PLL_P offset
Date: Sun,  4 Jul 2021 14:32:29 +0530
Message-Id: <20210704090230.26489-17-jagan@amarulasolutions.com>
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

PMS_P offset value in existing driver is not compatible
with i.MX8MM.

However the i.MX8M Mini Application Reference manual shows
the PMS_P offset is the same in the driver, but the i.MX8MM
downstream driver uses a different one.

So, handle the PMS_P offset via driver_data and use the
offset value for i.MX8MM from the downstream driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 54767cbf231c..0ed218f5eefc 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -184,7 +184,7 @@
 /* DSIM_PLLCTRL */
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			(1 << 23)
-#define DSIM_PLL_P(x)			((x) << 13)
+#define DSIM_PLL_P(x, offset)		((x) << (offset))
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
@@ -259,6 +259,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	bool exynos_specific;
 };
@@ -487,6 +488,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.exynos_specific = true,
 };
@@ -500,6 +502,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.exynos_specific = true,
 };
@@ -511,6 +514,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.exynos_specific = true,
 };
@@ -523,6 +527,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.exynos_specific = true,
 };
@@ -535,6 +540,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.exynos_specific = true,
 };
@@ -547,6 +553,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.max_freq = 2100,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
 };
 
@@ -662,7 +669,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
-- 
2.25.1

