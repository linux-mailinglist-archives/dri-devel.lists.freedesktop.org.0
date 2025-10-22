Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20583BFB235
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FE310E71C;
	Wed, 22 Oct 2025 09:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="pA3itjLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38BF10E71C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1761124908; x=1792660908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7pxWw6uBCFsv70rXCaVqS+CUBebxIbPCXR25o/IlmM=;
 b=pA3itjLBbh86wwGd0Z9w6Ld0nCXpAWdP9wpT86SxhwMIbTTtsVV0DtyX
 L5QzHiNcZe1gfhi5kHS8xkn/+6Y0yikIlNvo6W+mMtdrGAH0j6f6AQEB1
 vfWlh7i1wUu3H0j/78W5BrZZr56wqpb9ij9FlskhwcjuDfaLnSb5xG/69
 QPaH9BSwI6oTztLqNTndIAtJ1G20158H4VGkcyzRK17fVvvEr+9j1MZok
 aL9/19kxLpnQV+7M2IxqznUnZR1BGmVTIhtUV7IpGKywei1tUnhZbMBpX
 EytdXLnpvsY6PAi8lEavMLDt8cm+AneTTn6toQSPcm/mje6ZbiCi87kYi g==;
X-CSE-ConnectionGUID: 44o3miGgTiO24jOPrvPsAw==
X-CSE-MsgGUID: DyNUS5EQQ+y63oB8Tbd8NQ==
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="48611281"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2025 02:14:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 22 Oct 2025 02:14:14 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 22 Oct 2025 02:14:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, <dharma.b@microchip.com>
Subject: [PATCH v2 RESEND 3/3] drm: atmel-hlcdc: set LVDS PLL clock rate for
 LVDS Displays
Date: Wed, 22 Oct 2025 14:43:51 +0530
Message-ID: <20251022091351.472331-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022091351.472331-1-manikandan.m@microchip.com>
References: <20251022091351.472331-1-manikandan.m@microchip.com>
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

The LVDS PLL clock runs at 7 times the panel pixel clock.
For LVDS displays, the PLL clock rate is set based on the
panel pixel clock, eliminating the need for the assigned-clock-rates
Device Tree property for lvds_pll_clk in the LCD node.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v2:
- Rephrase commit message and comment block
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index beb825fc4d5d..67860947c466 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -100,9 +100,15 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
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
@@ -187,7 +193,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 }
 
 static enum drm_mode_status
@@ -243,7 +252,11 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 				    10, 1000))
 		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+
 	pinctrl_pm_select_sleep_state(dev->dev);
 
 	pm_runtime_allow(dev->dev);
@@ -256,15 +269,38 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
+		 * For LVDS displays, retrieve the pixel clock from the panel
+		 * and set the LVDS PLL clock rate accordingly.
+		 * According to the datasheet,the LVDS PLL clock is 7 times the pixel clock.
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

