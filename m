Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C085F573C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA20B10E644;
	Wed,  5 Oct 2022 15:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E54110E447
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:13:31 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id o65so2971358iof.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFWE05cUP5gYPfL1GvHSDjJECfaamqkGSDdNhylsilI=;
 b=B3IfNLsvsg49CN/wcewBNkYxeo3e9Yd1ztaNt8ePL3fL9ppDy2MViye0k3iCRSY4ta
 Chfqqu+E7YvyIVnyV+aIZK7yi88YQRXcmKzNaAhB0/ROUJTnek1U8p2RRm5himfm/5BE
 Rav9mtztU4Rr8TS86chLRD5YfkTWds2OLXegY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFWE05cUP5gYPfL1GvHSDjJECfaamqkGSDdNhylsilI=;
 b=enj1kYi1SrxeWn++tohH5f2q0Oy25bcoGQ8X8sPbW9XyvDDYIkPNS0GwwCnnGeWu6i
 tLiJ5Z0b/pe4G0kTVtsNh2AF+g/J7wH55hVvFb0Hr/0JEZEHod5KW7UeRh9o8G7ihi95
 AdCt2ooU3TfZZKqrNi9CgpDcloJP3s3moJ43ugrHcamCQ7nVfPZQLg9lT2RsC0tT7NoX
 7pynUR2gAyXa9c4tLQz+13cLu6LVxDj9+x8KXkNRLLHMXk9Kze2WOUrERD/2qAZ5P+r6
 UGBzrNpHU5+KiCoy/WIR24eIvwSHtnbG2pvphr2SymV6/GFTqjaV4gOjvqAfHiASOqCj
 qJ/w==
X-Gm-Message-State: ACrzQf1yB5Zk1vQSHP2xhBxrB8y0V3tuMvWkSiU2D/IeSml2HPy4c9SX
 7AFTruloExq2kPl2eNe5SdqcAw==
X-Google-Smtp-Source: AMsMyM56nOgg3npDfw5C65a4QIZJHPRv3L1xY9cAcrkxpcnDt/dgZvzI9Eq+OObzrzK1lJLpUZsMhQ==
X-Received: by 2002:a05:6602:121c:b0:6a5:1f4:4ab with SMTP id
 y28-20020a056602121c00b006a501f404abmr147259iot.187.1664982810375; 
 Wed, 05 Oct 2022 08:13:30 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:13:29 -0700 (PDT)
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
Subject: [PATCH v7 06/10] drm: bridge: samsung-dsim: Add platform PLL_P
 (PMS_P) offset
Date: Wed,  5 Oct 2022 20:43:05 +0530
Message-Id: <20221005151309.7278-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

v7, v6:
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
index b46346232c52..41970e794a7c 100644
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

