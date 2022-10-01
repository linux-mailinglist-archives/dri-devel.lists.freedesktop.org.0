Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E15F1ACF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924AB10E515;
	Sat,  1 Oct 2022 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B45D10E515
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:09:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 70so6068146pjo.4
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UdRum/NOsNc+q0b9g1DppGoBok9aodOHrcP30aJbUSo=;
 b=Ok5CPSQ6OeaY9s8wPGqDY3PMs6IrllTVYS8QnTFO7BhjybS9U0u8pzsbxRMK5RptvQ
 6FdgIivQxzIVIthF74nKaEIjTB2fSr1gmzyYS/gZu15Jk7Wj5T78dsNiZMFnA4nk0TgU
 DP/xcmFNiGoM54uErLtZaSZpUBXF0ONClzKGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UdRum/NOsNc+q0b9g1DppGoBok9aodOHrcP30aJbUSo=;
 b=dEyXO22KkISNc6mlVV8QzIX3dT6CyWaG5il+SQYtmTS5LLd6ZLVVHDTA5WCuUmi0zj
 Y/2LJql8u4hWXSOXGbnXJ8ULEr98B/vWZIvHAqFycEOhilej1BFyUDlFWmLz6oYf6ZT3
 squM8wxSm16OGi+dlwlx1Ay7F3dnNcN9qU31EHg9A8PQrFuxE1z7Vbw00yGeJ5npGRD8
 ukXJOLfU+R+0JlrRl9PMXtPiolSXgHRaW1YJiYDXq8CVWWey83sIW6Byamycxh192u8f
 RymtXZLjyEvfDWKjJKUiI8bQSVagJue4dMU1z1EoxLW/44qlpOThAOmZzzq9jLfAdSa5
 UVwQ==
X-Gm-Message-State: ACrzQf2bmklTTTlE75kiu6t2OEk4vtPkl+hKRRxfXk0Dmr4KpXanMf2R
 9ypk10+BsaFGkIY8U1CvgRDfVQ==
X-Google-Smtp-Source: AMsMyM7V7eJB8pKnH98KIj4JiE7sIIimU6+Haft2I08ssQ1XVKcesdYO3L6LHgYA8aHXpmtfGcRMxw==
X-Received: by 2002:a17:90a:8044:b0:20a:6412:3b8c with SMTP id
 e4-20020a17090a804400b0020a64123b8cmr2235484pjw.139.1664611742805; 
 Sat, 01 Oct 2022 01:09:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:09:02 -0700 (PDT)
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
Subject: [PATCH v6 06/10] drm: bridge: samsung-dsim: Add platform PLL_P
 (PMS_P) offset
Date: Sat,  1 Oct 2022 13:36:46 +0530
Message-Id: <20221001080650.1007043-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

Look like PLL PMS_P offset value varies between platforms that have
Samsung DSIM IP.

However, there is no clear evidence for it as both Exynos and i.MX
8M Mini Application Processor Reference Manual is still referring
the PMS_P offset as 13.

The offset 13 is not working for i.MX8M Mini SoCs but the downstream
NXP sec-dsim.c driver is using offset 14 for i.MX8M Mini SoC platforms
[1] [2].

PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
with offset 13 and then an additional offset of one bit added in
sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().

Not sure whether it is reference manual documentation or something else
but this patch trusts the downstream code and handle PLL_P offset via
platform driver data so-that imx8mm driver data shall use pll_p_offset
to 14.

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n210
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

v6:
* none

v5:
* updated clear commit message

v4, v3, v2:
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
index 90506be3f2dd..d0bb96a275fd 100644
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
 };
 
@@ -380,6 +381,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -390,6 +392,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.max_freq = 1000,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.pll_p_offset = 13,
 	.reg_values = reg_values,
 };
 
@@ -401,6 +404,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 };
 
@@ -412,6 +416,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.max_freq = 1500,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 };
 
@@ -543,7 +548,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 			dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
+	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 0c5a905f3de7..df3d030daec6 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -53,6 +53,7 @@ struct samsung_dsim_driver_data {
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 };
 
-- 
2.25.1

