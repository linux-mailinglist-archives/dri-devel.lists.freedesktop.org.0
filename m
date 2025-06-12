Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD9AD7A42
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C71510E12D;
	Thu, 12 Jun 2025 18:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="C/DpYOMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE84B10E138
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754756; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CBOIvPdpnwhgCTvwe5sFBAfTEl1njLX0zXVDFaCppVlhfCyypgYpxxtSL3MvGguVqa3MorehB9fHEzAFJsLfUEZAJq2jpS1vD1N4F1QKdQnxnagxaceUz7COQxdmypk5mv9yuu2Rq9Yx3Ys2hPTBmJ6dP9HjsDGSX3g02WSVO7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754756;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9ZnQKAbaT78Eae/Xd9b9B4optwHktbrLeo53MJUOU8A=; 
 b=aMfnfFNSgMbenS1kxLhqaMWkxoPMTW+BVRIClzu6DFZyNd6JjIInsKLevQitKO08vbcMwwHWL334pYCMMlimP8GzqCo7p8gizC9MGrMsvOpcW+9xilv5qieCw73p6jlT2qyz5d6H5B0D7NmUyG3qDxisYnwiIefflkzjFUrW4jI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754756; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=9ZnQKAbaT78Eae/Xd9b9B4optwHktbrLeo53MJUOU8A=;
 b=C/DpYOMmh2lAuNT39xKgRN55s5SBB3h6AmIl9sB2Uyc9N6Ul3a5MVrS7R+GVeSnB
 v6XXSviAvelQwebESxh2ezJayYI7HFwDVsQQFaGAUXrmNSurxCFly9jTRLCpqoh/ull
 PEjGdNqFU4mkz5VpswIWL9s4I7LntUy3PmDjl3eQ=
Received: by mx.zohomail.com with SMTPS id 1749754755002991.4213948311354;
 Thu, 12 Jun 2025 11:59:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:15 +0200
Subject: [PATCH 13/20] drm/rockchip: dw_hdmi: switch to HWORD_UPDATE*
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-13-f4afb8f6313f@collabora.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

Remove this driver's very own HIWORD_UPDATE macro, and replace all
instances of it with equivalent instantiations of HWORD_UPDATE or
HWORD_UPDATE_CONST, depending on whether it's in an initializer.

This gives us better error checking, and a centrally agreed upon
signature for this macro, to ease in code comprehension.

Because HWORD_UPDATE/HWORD_UPDATE_CONST shifts the value to the mask
(like FIELD_PREP et al do), a lot of macro instantiations get easier to
read.

This was tested on an RK3568 ODROID M1, as well as an RK3399 ROCKPro64.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 80 +++++++++++++----------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index f737e7d46e667f2411a77aa8d1004637c50fbc5c..e8cb7fae6c22903db32f498459b22372a131963d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -54,8 +55,6 @@
 #define RK3568_HDMI_SDAIN_MSK		BIT(15)
 #define RK3568_HDMI_SCLIN_MSK		BIT(14)
 
-#define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
-
 /**
  * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
  * @lcdsel_grf_reg: grf register offset of lcdc select
@@ -359,17 +358,14 @@ static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 
 	dw_hdmi_phy_setup_hpd(dw_hdmi, data);
 
-	regmap_write(hdmi->regmap,
-		RK3228_GRF_SOC_CON6,
-		HIWORD_UPDATE(RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
-			      RK3228_HDMI_SCL_VSEL,
-			      RK3228_HDMI_HPD_VSEL | RK3228_HDMI_SDA_VSEL |
-			      RK3228_HDMI_SCL_VSEL));
-
-	regmap_write(hdmi->regmap,
-		RK3228_GRF_SOC_CON2,
-		HIWORD_UPDATE(RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK,
-			      RK3228_HDMI_SDAIN_MSK | RK3228_HDMI_SCLIN_MSK));
+	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON6,
+		     HWORD_UPDATE(RK3228_HDMI_HPD_VSEL, 1) |
+		     HWORD_UPDATE(RK3228_HDMI_SDA_VSEL, 1) |
+		     HWORD_UPDATE(RK3228_HDMI_SCL_VSEL, 1));
+
+	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON2,
+		     HWORD_UPDATE(RK3228_HDMI_SDAIN_MSK, 1) |
+		     HWORD_UPDATE(RK3328_HDMI_SCLIN_MSK, 1));
 }
 
 static enum drm_connector_status
@@ -381,15 +377,13 @@ dw_hdmi_rk3328_read_hpd(struct dw_hdmi *dw_hdmi, void *data)
 	status = dw_hdmi_phy_read_hpd(dw_hdmi, data);
 
 	if (status == connector_status_connected)
-		regmap_write(hdmi->regmap,
-			RK3328_GRF_SOC_CON4,
-			HIWORD_UPDATE(RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V,
-				      RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V));
+		regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+			     HWORD_UPDATE(RK3328_HDMI_SDA_5V, 1) |
+			     HWORD_UPDATE(RK3328_HDMI_SCL_5V, 1));
 	else
-		regmap_write(hdmi->regmap,
-			RK3328_GRF_SOC_CON4,
-			HIWORD_UPDATE(0, RK3328_HDMI_SDA_5V |
-					 RK3328_HDMI_SCL_5V));
+		regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+			     HWORD_UPDATE(RK3328_HDMI_SDA_5V, 0) |
+			     HWORD_UPDATE(RK3328_HDMI_SCL_5V, 0));
 	return status;
 }
 
@@ -400,21 +394,21 @@ static void dw_hdmi_rk3328_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 	dw_hdmi_phy_setup_hpd(dw_hdmi, data);
 
 	/* Enable and map pins to 3V grf-controlled io-voltage */
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON4,
-		HIWORD_UPDATE(0, RK3328_HDMI_HPD_SARADC | RK3328_HDMI_CEC_5V |
-				 RK3328_HDMI_SDA_5V | RK3328_HDMI_SCL_5V |
-				 RK3328_HDMI_HPD_5V));
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON3,
-		HIWORD_UPDATE(0, RK3328_HDMI_SDA5V_GRF | RK3328_HDMI_SCL5V_GRF |
-				 RK3328_HDMI_HPD5V_GRF |
-				 RK3328_HDMI_CEC5V_GRF));
-	regmap_write(hdmi->regmap,
-		RK3328_GRF_SOC_CON2,
-		HIWORD_UPDATE(RK3328_HDMI_SDAIN_MSK | RK3328_HDMI_SCLIN_MSK,
-			      RK3328_HDMI_SDAIN_MSK | RK3328_HDMI_SCLIN_MSK |
-			      RK3328_HDMI_HPD_IOE));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON4,
+		     HWORD_UPDATE(RK3328_HDMI_HPD_SARADC, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_CEC_5V, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_SDA_5V, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_SCL_5V, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_HPD_5V, 0));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON3,
+		     HWORD_UPDATE(RK3328_HDMI_SDA5V_GRF, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_SCL5V_GRF, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_HPD5V_GRF, 0) |
+		     HWORD_UPDATE(RK3328_HDMI_CEC5V_GRF, 0));
+	regmap_write(hdmi->regmap, RK3328_GRF_SOC_CON2,
+		     HWORD_UPDATE(RK3328_HDMI_SDAIN_MSK, 1) |
+		     HWORD_UPDATE(RK3328_HDMI_SCLIN_MSK, 1) |
+		     HWORD_UPDATE(RK3328_HDMI_HPD_IOE, 0));
 
 	dw_hdmi_rk3328_read_hpd(dw_hdmi, data);
 }
@@ -442,8 +436,8 @@ static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3288_chip_data = {
 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3288_HDMI_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3288_HDMI_LCDC_SEL, RK3288_HDMI_LCDC_SEL),
+	.lcdsel_big = HWORD_UPDATE_CONST(RK3288_HDMI_LCDC_SEL, 0),
+	.lcdsel_lit = HWORD_UPDATE_CONST(RK3288_HDMI_LCDC_SEL, 1),
 	.max_tmds_clock = 340000,
 };
 
@@ -479,8 +473,8 @@ static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3399_HDMI_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3399_HDMI_LCDC_SEL, RK3399_HDMI_LCDC_SEL),
+	.lcdsel_big = HWORD_UPDATE_CONST(RK3399_HDMI_LCDC_SEL, 0),
+	.lcdsel_lit = HWORD_UPDATE_CONST(RK3399_HDMI_LCDC_SEL, 1),
 	.max_tmds_clock = 594000,
 };
 
@@ -597,10 +591,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
-			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
-					   RK3568_HDMI_SCLIN_MSK,
-					   RK3568_HDMI_SDAIN_MSK |
-					   RK3568_HDMI_SCLIN_MSK));
+			     HWORD_UPDATE(RK3568_HDMI_SDAIN_MSK, 1) |
+			     HWORD_UPDATE(RK3568_HDMI_SCLIN_MSK, 1));
 	}
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);

-- 
2.49.0

