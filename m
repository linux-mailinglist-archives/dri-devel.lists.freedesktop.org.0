Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449D5BB1FA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 20:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC410ED84;
	Fri, 16 Sep 2022 18:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0110ED7D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 18:19:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id go6so17636880pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/hU4HRiScUW44wbIelmvAkcYgyCjCELEthv9SlsOnOg=;
 b=UQg0TSNCEznQTsptxEyRT4tlYmSkY3s8B44ecHlGjoJQ2Cl5dYIdtu+bUPFHjMSbKk
 CdM5Gyudok2hVIG5B0r3CK8xjCZhw7e0HKexe9C6BiO8uzRIUaYWCk57N2TZCRiv9vbH
 PoqaEey2Apl29NimPjodBI3POB2/cLC8lfc9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/hU4HRiScUW44wbIelmvAkcYgyCjCELEthv9SlsOnOg=;
 b=W4f9nQ6/Oj6cXxy4QVsywGaEKNeH7q0sxSe6jmhgTRMONBtOuJmHXFj00KD3Y53ThZ
 DXapB1Q1Srz1+t72mKCy7nt+nvkjY+gjvTidkhHOOoRmEzh9sfDHPl+LFTFZdL7GUArj
 13iuZhvWdsG/n0/nV5cwfBdBuyr7xgdH+dqNpJkl6Zn7Ql1IiL469IiZLZQdxSPwt9+n
 KPWlvPWH4iv6L7q5070FXVVcZFaC62AJUyPdI98l0z6Vc5wtanJjfl1sq6x6jbcqb9S2
 SeYmbWk4oHtXDNGpZpuTlZl7ROgJEB/tY3dc7x8jqaHAZJasrXgkf/XPb++1EcuU7+iE
 iK/g==
X-Gm-Message-State: ACrzQf1xSDAdLhq/6DoZfKQvohBEYrRBXJ5fnltuewiOFNnWIS8iNoGk
 DtFzSdvj3Yc0bLh3xX4lPkOmug==
X-Google-Smtp-Source: AMsMyM6NLTi/+OFyQcowtoFQV8Auo4ugFnbL3vRCHKKwmo6aBGW2DgOZFDW3oFDiIXt7m8fFu/fb3g==
X-Received: by 2002:a17:902:d512:b0:178:2898:8099 with SMTP id
 b18-20020a170902d51200b0017828988099mr1037241plg.131.1663352351541; 
 Fri, 16 Sep 2022 11:19:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:19:11 -0700 (PDT)
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
Subject: [PATCH v5 07/11] drm: bridge: samsung-dsim: Add platform PLL_P
 (PMS_P) offset
Date: Fri, 16 Sep 2022 23:47:27 +0530
Message-Id: <20220916181731.89764-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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
index 8abf89326424..60f22c506c0f 100644
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

