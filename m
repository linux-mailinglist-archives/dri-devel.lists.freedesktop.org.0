Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37A9D49E4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF1310E8C2;
	Thu, 21 Nov 2024 09:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="2aUhvYyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0DB10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1732181022; x=1763717022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nxKf5QOaOvMz6pxHfw4grQb5c34JrR+fnuNyXv/1n9E=;
 b=2aUhvYyliBtTMIKSglJDr25cYQipIYbRSMk8mgxGgPIMUaGeDzlGKdeD
 ctkXWRGAUKMaz9lNdBIzFOOezZRkJDDVI/kaowU5XY2zYtkfg3kyrv0Et
 ae72gBHjWN4RFRnUwFoE3i1LE2Y1DIOtg4zzcZyP0nP8u9K6AzR5luMD+
 KRbrlU6ScT770ZUo/BD2qWR1fzqRfVNlsWNiDJ8+tvsnEYc6qnoRch/ss
 +VGDvDAmJzCOYvhI1fPzUYb9Skb/bOz/qvPJHKEd2qsCQ3N3QcIPeTih+
 3mGH5/v42CJ0JKkvXpbmUeL3vR+eJQlCvs5N81Fvsh/KZD+JyOW39cr79 Q==;
X-CSE-ConnectionGUID: wS72ZE3TTRmRyzdG8hxnTQ==
X-CSE-MsgGUID: NcTGc9clQXmwz210lj1F0Q==
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="202047029"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2024 02:23:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Nov 2024 02:23:15 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 21 Nov 2024 02:23:11 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>
Subject: [PATCH 3/3] drm: atmel-hlcdc: set LVDS PLL clock rate for LVDS
 Displays
Date: Thu, 21 Nov 2024 14:53:08 +0530
Message-ID: <20241121092308.130328-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121092308.130328-1-manikandan.m@microchip.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dharma Balasubiramani <dharma.b@microchip.com>

The LVDS PLL clock is 7x the Panel Pixel clock.
When using LVDS displays, the LVDS PLL clock rate is set using the
panel pixel clock, this skips the usage of 'assigned-clock-rates'
DT property for lvds_pll_clk clock for LCD node.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 0e709047369a..d11040d5cc5f 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -99,9 +99,15 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		drm_connector_list_iter_end(&iter);
 	}
 
-	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
-	if (ret)
-		return;
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+		if (ret)
+			return;
+	} else {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+		if (ret)
+			return;
+	}
 
 	vm.vfront_porch = adj->crtc_vsync_start - adj->crtc_vdisplay;
 	vm.vback_porch = adj->crtc_vtotal - adj->crtc_vsync_end;
@@ -186,7 +192,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 }
 
 static enum drm_mode_status
@@ -242,7 +251,11 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 				    10, 1000))
 		dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+
 	pinctrl_pm_select_sleep_state(dev->dev);
 
 	pm_runtime_allow(dev->dev);
@@ -255,15 +268,38 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 {
 	struct drm_device *dev = c->dev;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
+	struct drm_display_mode *adj = &c->state->adjusted_mode;
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
+	int ret;
 
 	pm_runtime_get_sync(dev->dev);
 
 	pm_runtime_forbid(dev->dev);
 
 	pinctrl_pm_select_default_state(dev->dev);
-	clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		/*
+		 * When using LVDS displays, fetch the pixel clock from the panel
+		 * and set the LVDS PLL clock rate.
+		 * As per the datasheet, LVDS PLL clock is 7x the pixel clock.
+		 */
+		ret = clk_set_rate(crtc->dc->hlcdc->lvds_pll_clk,
+				   (adj->clock * 7 * 1000));
+		if (ret) {
+			dev_err(dev->dev, "Failed to set LVDS PLL clk rate: %d\n", ret);
+			return;
+		}
+
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+		if (ret)
+			return;
+	} else {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+		if (ret)
+			return;
+	}
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_PIXEL_CLK);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
-- 
2.25.1

