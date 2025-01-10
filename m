Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE0A0869C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A78E10EFA6;
	Fri, 10 Jan 2025 05:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d2Qk3eO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E179710EF9F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:39:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5228CA41507;
 Fri, 10 Jan 2025 05:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 324BCC4CED6;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736487596;
 bh=A4KxmvopAA+Hm/kYNJV9mPMn0fwfIEGmJrGcIKh2zkI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=d2Qk3eO1hUR2UYk8mN/k52zAtcs6G4Fud5/iQ0jM2KOEMEl5HofUHpjTWZDpTRYax
 IFjzxq7vAn3fF4CdW4g/a8Qab9W18XwfTmo8CR+BFI7bbZBHKSwABEvfS6egPqByXO
 R9rrPZ0qSc85x1PVKcgJeiuEgMzd96vZntQ0s0xjX3Jbs5H+Ur18KY7hTZMxvOWeQz
 JKJqc8i1kHyJwmxbnFMc7IIAXo2h0eB4y9ZDe6H+c1ETzhE2uJckOzI16DftzVc4nD
 XyCGWnHxq0lbispcACobtjadg1GjHznOyNvBftd2ZpXx9z00Ha5H1Fy4pWyBQXyJp+
 ouuPVMa1sW36Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB8EE7719D;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:59 +0800
Subject: [PATCH 09/11] drm: meson: add vpu clk setting for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-9-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=43875;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=f6o59xzgL5AIXyJBq/G+Mt5LS+R9oNyy1GZNtQlTZRg=;
 b=2Hn5s539SFAvUsFAS1lBuCgh2BvSs3dZcYAgI/uf1nyd/4PNtzejCxAe81oJGmSnaps+MJmXv
 wz8gCF/dFUqCVUDsmlgMi8Qehr434Q8crDwbrpxjT0QSp6GGmFg+fIT
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
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
Reply-To: ao.xu@amlogic.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ao Xu <ao.xu@amlogic.com>

The S4-series splits the HIU into `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
Introduce VPU clock settings specific to the Amlogic S4 SoC,
which differ from the configurations used for G12.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 1018 +++++++++++++++++++++++++-----------
 1 file changed, 720 insertions(+), 298 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc23561ec26a54139b27acf8009ccb..b2707af2a5283874936658d2749cecb4ef86beb5 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -87,8 +87,11 @@
 #define CTS_VDAC_EN		BIT(4)
 #define HDMI_TX_PIXEL_EN	BIT(5)
 #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 offset in data sheet */
-#define HDMI_TX_PIXEL_SEL_MASK	(0xf << 16)
+#define HDMI_TX_PIXEL_SEL_MASK	GENMASK(19, 16)
 #define HDMI_TX_PIXEL_SEL_SHIFT	16
+
+#define HDMI_TX_FE_SEL_MASK	GENMASK(23, 20)
+#define HDMI_TX_FE_SEL_SHIFT	20
 #define CTS_HDMI_SYS_SEL_MASK	(0x7 << 9)
 #define CTS_HDMI_SYS_DIV_MASK	(0x7f)
 #define CTS_HDMI_SYS_EN		BIT(8)
@@ -110,6 +113,30 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
+/* ANA Registers */
+/* REG_BASE:  REGISTER_BASE_ADDR = 0xfe000000 */
+#define CLKCTRL_VID_CLK_CTRL	0x0c0 /* 0x30 offset in data sheet */
+#define CLKCTRL_VID_CLK_CTRL2	0x0c4 /* 0x31 offset in data sheet */
+#define CLKCTRL_VID_CLK_DIV	0x0c8 /* 0x32 offset in data sheet */
+#define CLKCTRL_VIID_CLK_DIV	0x0cc /* 0x33 offset in data sheet */
+#define CLKCTRL_VIID_CLK_CTRL	0x0d0 /* 0x34 offset in data sheet */
+
+#define CLKCTRL_VID_PLL_CLK_DIV	0x0e4 /* 0x39 offset in data sheet */
+#define CLKCTRL_HDMI_CLK_CTRL	0x0e0  /* 0x38 */
+
+/* REG_BASE:  REGISTER_BASE_ADDR = 0xfe008000 */
+#define ANACTRL_HDMIPLL_CTRL0	0x1c0 /* 0x70 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL1	0x1c4 /* 0x71 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL2	0x1c8 /* 0x72 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL3	0x1cc /* 0x73 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL4	0x1d0 /* 0x74 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL5	0x1d4 /* 0x75 offset in data sheet */
+#define ANACTRL_HDMIPLL_CTRL6	0x1d8 /* 0x76 offset in data sheet */
+#define ANACTRL_HDMIPLL_STS	0x1dc /* 0x77 offset in data sheet */
+#define ANACTRL_HDMIPLL_VLOCK	0x1e4 /* 0x79 offset in data sheet */
+#define HDMI_PLL_RESET_S4	BIT(29)
+#define HDMI_PLL_LOCK_S4	(3 << 30)
+
 #define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST(_freq * 1000, 1001)
 
 /* VID PLL Dividers */
@@ -137,8 +164,13 @@ static void meson_vid_pll_set(struct meson_drm *priv, unsigned int div)
 	unsigned int shift_sel = 0;
 
 	/* Disable vid_pll output clock */
-	regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV, VID_PLL_EN, 0);
-	regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV, VID_PLL_PRESET, 0);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV, VID_PLL_EN, 0);
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV, VID_PLL_PRESET, 0);
+	} else {
+		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV, VID_PLL_EN, 0);
+		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV, VID_PLL_PRESET, 0);
+	}
 
 	switch (div) {
 	case VID_PLL_DIV_2:
@@ -199,37 +231,71 @@ static void meson_vid_pll_set(struct meson_drm *priv, unsigned int div)
 		break;
 	}
 
-	if (div == VID_PLL_DIV_1)
-		/* Enable vid_pll bypass to HDMI pll */
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   VID_PLL_BYPASS, VID_PLL_BYPASS);
-	else {
-		/* Disable Bypass */
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   VID_PLL_BYPASS, 0);
-		/* Clear sel */
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   3 << 16, 0);
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   VID_PLL_PRESET, 0);
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   0x7fff, 0);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		if (div == VID_PLL_DIV_1) {
+			/* Enable vid_pll bypass to HDMI pll */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   VID_PLL_BYPASS, VID_PLL_BYPASS);
+		} else {
+			/* Disable Bypass */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   VID_PLL_BYPASS, 0);
+			/* Clear sel */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   3 << 16, 0);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, 0);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   0x7fff, 0);
+
+			/* Setup sel and val */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   3 << 16, shift_sel << 16);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, VID_PLL_PRESET);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   0x7fff, shift_val);
+
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, 0);
+		}
 
-		/* Setup sel and val */
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   3 << 16, shift_sel << 16);
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   VID_PLL_PRESET, VID_PLL_PRESET);
-		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   0x7fff, shift_val);
+		/* Enable the vid_pll output clock */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_PLL_CLK_DIV,
+					VID_PLL_EN, VID_PLL_EN);
+	} else {
+		if (div == VID_PLL_DIV_1) {
+			/* Enable vid_pll bypass to HDMI pll */
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   VID_PLL_BYPASS, VID_PLL_BYPASS);
+		} else {
+			/* Disable Bypass */
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   VID_PLL_BYPASS, 0);
+			/* Clear sel */
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   3 << 16, 0);
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, 0);
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   0x7fff, 0);
+
+			/* Setup sel and val */
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   3 << 16, shift_sel << 16);
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, VID_PLL_PRESET);
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   0x7fff, shift_val);
+
+			regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
+					   VID_PLL_PRESET, 0);
+		}
 
+		/* Enable the vid_pll output clock */
 		regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				   VID_PLL_PRESET, 0);
+					VID_PLL_EN, VID_PLL_EN);
 	}
-
-	/* Enable the vid_pll output clock */
-	regmap_update_bits(priv->hhi, HHI_VID_PLL_CLK_DIV,
-				VID_PLL_EN, VID_PLL_EN);
 }
 
 /*
@@ -287,56 +353,117 @@ static void meson_venci_cvbs_clock_config(struct meson_drm *priv)
 		regmap_read_poll_timeout(priv->hhi, HHI_HDMI_PLL_CNTL, val,
 			((val & HDMI_PLL_LOCK_G12A) == HDMI_PLL_LOCK_G12A),
 			10, 0);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL0, 0x3b01047b);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL1, 0x00018000);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL2, 0x00000000);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL3, 0x0a691c00);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL4, 0x33771290);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL5, 0x39270000);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL6, 0x50540000);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL0, 0x1b01047b);
+
+		/* Poll for lock bit */
+		regmap_read_poll_timeout(priv->hhi, ANACTRL_HDMIPLL_CTRL0, val,
+			((val & HDMI_PLL_LOCK) == HDMI_PLL_LOCK),
+			10, 0);
 	}
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		/* Disable VCLK2 */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL, VCLK2_EN, 0);
 
-	/* Disable VCLK2 */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+		/* Setup vid_pll to /1 */
+		meson_vid_pll_set(priv, VID_PLL_DIV_1);
 
-	/* Setup vid_pll to /1 */
-	meson_vid_pll_set(priv, VID_PLL_DIV_1);
+		/* Setup the VCLK2 divider value to achieve 27MHz */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_DIV,
+					VCLK2_DIV_MASK, (55 - 1));
 
-	/* Setup the VCLK2 divider value to achieve 27MHz */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
-				VCLK2_DIV_MASK, (55 - 1));
+		/* select vid_pll for vclk2 */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL,
+					VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
 
-	/* select vid_pll for vclk2 */
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		/* enable vclk2 gate */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL, VCLK2_EN, VCLK2_EN);
+
+		/* select vclk_div1 for enci */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, (8 << CTS_ENCI_SEL_SHIFT));
+		/* select vclk_div1 for vdac */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_DIV,
+					CTS_VDAC_SEL_MASK, (8 << CTS_VDAC_SEL_SHIFT));
+
+		/* release vclk2_div_reset and enable vclk2_div */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_DIV,
+					VCLK2_DIV_EN | VCLK2_DIV_RESET, VCLK2_DIV_EN);
+
+		/* enable vclk2_div1 gate */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL,
+					VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+		/* reset vclk2 */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL,
+					VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VIID_CLK_CTRL,
+					VCLK2_SOFT_RESET, 0);
+
+		/* enable enci_clk */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL2,
+					CTS_ENCI_EN, CTS_ENCI_EN);
+		/* enable vdac_clk */
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL2,
+					CTS_VDAC_EN, CTS_VDAC_EN);
+
+	} else {
+		/* Disable VCLK2 */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+		/* Setup vid_pll to /1 */
+		meson_vid_pll_set(priv, VID_PLL_DIV_1);
+
+		/* Setup the VCLK2 divider value to achieve 27MHz */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+					VCLK2_DIV_MASK, (55 - 1));
+
+		/* select vid_pll for vclk2 */
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+			regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+						VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
+		else
+			regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+						VCLK2_SEL_MASK, (4 << VCLK2_SEL_SHIFT));
+
+		/* enable vclk2 gate */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+		/* select vclk_div1 for enci */
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, (8 << CTS_ENCI_SEL_SHIFT));
+		/* select vclk_div1 for vdac */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+					CTS_VDAC_SEL_MASK, (8 << CTS_VDAC_SEL_SHIFT));
+
+		/* release vclk2_div_reset and enable vclk2_div */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+					VCLK2_DIV_EN | VCLK2_DIV_RESET, VCLK2_DIV_EN);
+
+		/* enable vclk2_div1 gate */
 		regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
-					VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
-	else
+					VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+		/* reset vclk2 */
+		regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+					VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
 		regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
-					VCLK2_SEL_MASK, (4 << VCLK2_SEL_SHIFT));
-
-	/* enable vclk2 gate */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
-
-	/* select vclk_div1 for enci */
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCI_SEL_MASK, (8 << CTS_ENCI_SEL_SHIFT));
-	/* select vclk_div1 for vdac */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
-				CTS_VDAC_SEL_MASK, (8 << CTS_VDAC_SEL_SHIFT));
-
-	/* release vclk2_div_reset and enable vclk2_div */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
-				VCLK2_DIV_EN | VCLK2_DIV_RESET, VCLK2_DIV_EN);
-
-	/* enable vclk2_div1 gate */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
-				VCLK2_DIV1_EN, VCLK2_DIV1_EN);
-
-	/* reset vclk2 */
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
-				VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
-	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
-				VCLK2_SOFT_RESET, 0);
-
-	/* enable enci_clk */
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
-				CTS_ENCI_EN, CTS_ENCI_EN);
-	/* enable vdac_clk */
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
-				CTS_VDAC_EN, CTS_VDAC_EN);
+					VCLK2_SOFT_RESET, 0);
+
+		/* enable enci_clk */
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
+					CTS_ENCI_EN, CTS_ENCI_EN);
+		/* enable vdac_clk */
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
+					CTS_VDAC_EN, CTS_VDAC_EN);
+	}
 }
 
 enum {
@@ -357,6 +484,8 @@ enum {
 	MESON_VCLK_HDMI_594000,
 /* 2970 /1 /1 /1 /5 /1  => /1 /2 */
 	MESON_VCLK_HDMI_594000_YUV420,
+/* 4320 /4 /4 /1 /5 /1  => /2 /2 */
+	MESON_VCLK_HDMI_27000,
 };
 
 struct meson_vclk_params {
@@ -467,6 +596,18 @@ struct meson_vclk_params {
 		.vid_pll_div = VID_PLL_DIV_5,
 		.vclk_div = 1,
 	},
+	[MESON_VCLK_HDMI_27000] = {
+		.pll_freq = 4320000,
+		.phy_freq = 270000,
+		.vclk_freq = 54000,
+		.venc_freq = 27000,
+		.pixel_freq = 27000,
+		.pll_od1 = 4,
+		.pll_od2 = 4,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
 	{ /* sentinel */ },
 };
 
@@ -487,136 +628,226 @@ static inline unsigned int pll_od_to_reg(unsigned int od)
 	return 0;
 }
 
-static void meson_hdmi_pll_set_params(struct meson_drm *priv, unsigned int m,
+static void gxbb_pll_set_params(struct meson_drm *priv, unsigned int m,
 				      unsigned int frac, unsigned int od1,
 				      unsigned int od2, unsigned int od3)
 {
 	unsigned int val;
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x58000200 | m);
-		if (frac)
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2,
-				     0x00004000 | frac);
-		else
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2,
-				     0x00000000);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x0d5c5091);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x801da72c);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x71486980);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x00000e55);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x58000200 | m);
+	if (frac)
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2,
+			     0x00004000 | frac);
+	else
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2,
+			     0x00000000);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x0d5c5091);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x801da72c);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x71486980);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x00000e55);
+
+	/* Enable and unreset */
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+			   0x7 << 28, HHI_HDMI_PLL_CNTL_EN);
+
+	/* Poll for lock bit */
+	regmap_read_poll_timeout(priv->hhi, HHI_HDMI_PLL_CNTL,
+				 val, (val & HDMI_PLL_LOCK), 10, 0);
+
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
+				3 << 16, pll_od_to_reg(od1) << 16);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
+				3 << 22, pll_od_to_reg(od2) << 22);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
+				3 << 18, pll_od_to_reg(od3) << 18);
+}
 
-		/* Enable and unreset */
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				   0x7 << 28, HHI_HDMI_PLL_CNTL_EN);
+static void gxm_pll_set_params(struct meson_drm *priv, unsigned int m,
+				      unsigned int frac, unsigned int od1,
+				      unsigned int od2, unsigned int od3)
+{
+	unsigned int val;
 
-		/* Poll for lock bit */
-		regmap_read_poll_timeout(priv->hhi, HHI_HDMI_PLL_CNTL,
-					 val, (val & HDMI_PLL_LOCK), 10, 0);
-	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x40000200 | m);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, 0x800cb000 | frac);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x860f30c4);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x0c8e0000);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x001fa729);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x01a31500);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x40000200 | m);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, 0x800cb000 | frac);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x860f30c4);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x0c8e0000);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x001fa729);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x01a31500);
 
-		/* Reset PLL */
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				HDMI_PLL_RESET, HDMI_PLL_RESET);
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				HDMI_PLL_RESET, 0);
+	/* Reset PLL */
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+			HDMI_PLL_RESET, HDMI_PLL_RESET);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+			HDMI_PLL_RESET, 0);
 
-		/* Poll for lock bit */
-		regmap_read_poll_timeout(priv->hhi, HHI_HDMI_PLL_CNTL, val,
-				(val & HDMI_PLL_LOCK), 10, 0);
-	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x0b3a0400 | m);
+	/* Poll for lock bit */
+	regmap_read_poll_timeout(priv->hhi, HHI_HDMI_PLL_CNTL, val,
+			(val & HDMI_PLL_LOCK), 10, 0);
 
-		/* Enable and reset */
-		/* TODO: add specific macro for g12a here */
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				   0x3 << 28, 0x3 << 28);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
+				3 << 21, pll_od_to_reg(od1) << 21);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
+				3 << 23, pll_od_to_reg(od2) << 23);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
+				3 << 19, pll_od_to_reg(od3) << 19);
+}
 
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, frac);
-		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x00000000);
+static void g12a_pll_set_params(struct meson_drm *priv, unsigned int m,
+				      unsigned int frac, unsigned int od1,
+				      unsigned int od2, unsigned int od3)
+{
+	unsigned int val;
+
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x0b3a0400 | m);
+
+	/* Enable and reset */
+	/* TODO: add specific macro for g12a here */
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+			   0x3 << 28, 0x3 << 28);
 
-		/* G12A HDMI PLL Needs specific parameters for 5.4GHz */
-		if (m >= 0xf7) {
-			if (frac < 0x10000) {
-				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
-							0x6a685c00);
-				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
-							0x11551293);
-			} else {
-				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
-							0xea68dc00);
-				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
-							0x65771290);
-			}
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x39272000);
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL7, 0x55540000);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, frac);
+	regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x00000000);
+
+	/* G12A HDMI PLL Needs specific parameters for 5.4GHz */
+	if (m >= 0xf7) {
+		if (frac < 0x10000) {
+			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
+						0x6a685c00);
+			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
+						0x11551293);
 		} else {
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x0a691c00);
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x33771290);
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x39270000);
-			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL7, 0x50540000);
+			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
+						0xea68dc00);
+			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
+						0x65771290);
 		}
-
-		do {
-			/* Reset PLL */
-			regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-					HDMI_PLL_RESET_G12A, HDMI_PLL_RESET_G12A);
-
-			/* UN-Reset PLL */
-			regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-					HDMI_PLL_RESET_G12A, 0);
-
-			/* Poll for lock bits */
-			if (!regmap_read_poll_timeout(priv->hhi,
-						      HHI_HDMI_PLL_CNTL, val,
-						      ((val & HDMI_PLL_LOCK_G12A)
-						        == HDMI_PLL_LOCK_G12A),
-						      10, 100))
-				break;
-		} while(1);
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x39272000);
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL7, 0x55540000);
+	} else {
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x0a691c00);
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x33771290);
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x39270000);
+		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL7, 0x50540000);
 	}
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
-				3 << 16, pll_od_to_reg(od1) << 16);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
-				3 << 21, pll_od_to_reg(od1) << 21);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+	do {
+		/* Reset PLL */
 		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				3 << 16, pll_od_to_reg(od1) << 16);
+				HDMI_PLL_RESET_G12A, HDMI_PLL_RESET_G12A);
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
-				3 << 22, pll_od_to_reg(od2) << 22);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
-				3 << 23, pll_od_to_reg(od2) << 23);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		/* UN-Reset PLL */
 		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
-				3 << 18, pll_od_to_reg(od2) << 18);
+				HDMI_PLL_RESET_G12A, 0);
+
+		/* Poll for lock bits */
+		if (!regmap_read_poll_timeout(priv->hhi,
+					      HHI_HDMI_PLL_CNTL, val,
+					      ((val & HDMI_PLL_LOCK_G12A)
+					      == HDMI_PLL_LOCK_G12A),
+					      10, 100))
+			break;
+	} while (1);
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL2,
-				3 << 18, pll_od_to_reg(od3) << 18);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL3,
-				3 << 19, pll_od_to_reg(od3) << 19);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+				3 << 16, pll_od_to_reg(od1) << 16);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+					3 << 18, pll_od_to_reg(od2) << 18);
+	regmap_update_bits(priv->hhi, HHI_HDMI_PLL_CNTL,
+				3 << 20, pll_od_to_reg(od3) << 20);
+}
+
+static void s4_pll_set_params(struct meson_drm *priv, unsigned int m,
+				      unsigned int frac, unsigned int od1,
+				      unsigned int od2, unsigned int od3)
+{
+	unsigned int val;
+
+	DRM_DEBUG_DRIVER("%s: m = %d, frac = %d, od1 = %d, od2 = %d, od3 = %d\n",
+			__func__, m, frac, od1, od2, od3);
+
+	regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL0, 0x0b3a0400 | m);
+
+	/* Enable and reset */
+	/* TODO: add specific macro for g12a here */
+	regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
+			   0x3 << 28, 0x3 << 28);
+
+	regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL1, frac);
+	regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL2, 0x00000000);
+
+	/* S4 HDMI PLL Needs specific parameters for 5.4GHz */
+	if (m >= 0xf7) {
+		if (frac < 0x10000) {
+			regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL3,
+						0x6a685c00);
+			regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL4,
+						0x11551293);
+		} else {
+			regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL3,
+						0x6a685c00);
+			regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL4,
+						0x44331290);
+		}
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL5, 0x39272008);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL6, 0x56540000);
+	} else {
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL3, 0x6a68dc00);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL4, 0x65771290);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL5, 0x39272008);
+		regmap_write(priv->hhi, ANACTRL_HDMIPLL_CTRL6, 0x56540000);
+	}
+
+	do {
+		//todo, need confir rst and lock bit
+		/* Reset PLL */
+		regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
+				HDMI_PLL_RESET_S4, HDMI_PLL_RESET_S4);
+
+		/* UN-Reset PLL */
+		regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
+				HDMI_PLL_RESET_S4, 0);
+
+		/* Poll for lock bits */
+		if (!regmap_read_poll_timeout(priv->hhi,
+					      ANACTRL_HDMIPLL_CTRL0, val,
+					      ((val & HDMI_PLL_LOCK_S4)
+					      == HDMI_PLL_LOCK_S4),
+					      10, 100))
+			break;
+	} while (1);
+
+	regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
+				3 << 16, pll_od_to_reg(od1) << 16);
+	regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
+					3 << 18, pll_od_to_reg(od2) << 18);
+	regmap_update_bits(priv->hhi, ANACTRL_HDMIPLL_CTRL0,
 				3 << 20, pll_od_to_reg(od3) << 20);
 }
 
+static void meson_hdmi_pll_set_params(struct meson_drm *priv, unsigned int m,
+				      unsigned int frac, unsigned int od1,
+				      unsigned int od2, unsigned int od3)
+{
+	switch (priv->compat) {
+	case VPU_COMPATIBLE_GXBB:
+		gxbb_pll_set_params(priv, m, frac, od1, od2, od3);
+		break;
+	case VPU_COMPATIBLE_GXM:
+	case VPU_COMPATIBLE_GXL:
+		gxm_pll_set_params(priv, m, frac, od1, od2, od3);
+		break;
+	case VPU_COMPATIBLE_G12A:
+		g12a_pll_set_params(priv, m, frac, od1, od2, od3);
+		break;
+	case VPU_COMPATIBLE_S4:
+		s4_pll_set_params(priv, m, frac, od1, od2, od3);
+		break;
+	default:
+		break;
+	}
+}
+
 #define XTAL_FREQ 24000
 
 static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
@@ -632,6 +863,7 @@ static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
 #define HDMI_FRAC_MAX_GXBB	4096
 #define HDMI_FRAC_MAX_GXL	1024
 #define HDMI_FRAC_MAX_G12A	131072
+#define HDMI_FRAC_MAX_S4	131072
 
 static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 					    unsigned int m,
@@ -651,6 +883,9 @@ static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		frac_max = HDMI_FRAC_MAX_G12A;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		frac_max = HDMI_FRAC_MAX_S4;
+
 	/* We can have a perfect match !*/
 	if (pll_freq / m == parent_freq &&
 	    pll_freq % m == 0)
@@ -688,6 +923,12 @@ static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
 			return false;
 		if (frac >= HDMI_FRAC_MAX_G12A)
 			return false;
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		/* Empiric supported min/max dividers */
+		if (m < 106 || m > 247)
+			return false;
+		if (frac >= HDMI_FRAC_MAX_S4)
+			return false;
 	}
 
 	return true;
@@ -813,14 +1054,22 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 {
 	unsigned int m = 0, frac = 0;
 
-	/* Set HDMI-TX sys clock */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_SEL_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_DIV_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
-
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				CTS_HDMI_SYS_SEL_MASK, 0);
+		regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				   CTS_HDMI_SYS_DIV_MASK, 0);
+		regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
+	} else {
+		/* Set HDMI-TX sys clock */
+		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				   CTS_HDMI_SYS_SEL_MASK, 0);
+		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				   CTS_HDMI_SYS_DIV_MASK, 0);
+		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
+	}
 	/* Set HDMI PLL rate */
 	if (!od1 && !od2 && !od3) {
 		meson_hdmi_pll_generic_set(priv, pll_base_freq);
@@ -875,6 +1124,22 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 			break;
 		}
 
+		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		switch (pll_base_freq) {
+		case 2970000:
+			m = 0x7b;
+			frac = vic_alternate_clock ? 0x140b4 : 0x18000;
+			break;
+		case 4320000:
+			m = vic_alternate_clock ? 0xb3 : 0xb4;
+			frac = vic_alternate_clock ? 0x1a3ee : 0;
+			break;
+		case 5940000:
+			m = 0xf7;
+			frac = vic_alternate_clock ? 0x8148 : 0x10000;
+			break;
+		}
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
 	}
 
@@ -882,146 +1147,303 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	meson_vid_pll_set(priv, vid_pll_div);
 
 	/* Set VCLK div */
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-			   VCLK_SEL_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-			   VCLK_DIV_MASK, vclk_div - 1);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+				   VCLK_SEL_MASK, 0);
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+				   VCLK_DIV_MASK, vclk_div - 1);
+	} else {
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+				   VCLK_SEL_MASK, 0);
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+				   VCLK_DIV_MASK, vclk_div - 1);
+	}
 
 	/* Set HDMI-TX source */
 	switch (hdmi_tx_div) {
 	case 1:
-		/* enable vclk_div1 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV1_EN, VCLK_DIV1_EN);
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			/* enable vclk_div1 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV1_EN, VCLK_DIV1_EN);
+
+			/* select vclk_div1 for HDMI-TX */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+					   HDMI_TX_PIXEL_SEL_MASK, 0);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+						HDMI_TX_FE_SEL_MASK, 0);
+		} else {
+			/* enable vclk_div1 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV1_EN, VCLK_DIV1_EN);
 
-		/* select vclk_div1 for HDMI-TX */
-		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-				   HDMI_TX_PIXEL_SEL_MASK, 0);
+			/* select vclk_div1 for HDMI-TX */
+			regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+					   HDMI_TX_PIXEL_SEL_MASK, 0);
+		}
 		break;
 	case 2:
-		/* enable vclk_div2 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV2_EN, VCLK_DIV2_EN);
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			/* enable vclk_div2 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV2_EN, VCLK_DIV2_EN);
+
+			/* select vclk_div2 for HDMI-TX */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_PIXEL_SEL_MASK, 1 << HDMI_TX_PIXEL_SEL_SHIFT);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_FE_SEL_MASK, 1 << HDMI_TX_FE_SEL_SHIFT);
+		} else {
+			/* enable vclk_div2 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV2_EN, VCLK_DIV2_EN);
 
-		/* select vclk_div2 for HDMI-TX */
-		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			HDMI_TX_PIXEL_SEL_MASK, 1 << HDMI_TX_PIXEL_SEL_SHIFT);
+			/* select vclk_div2 for HDMI-TX */
+			regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK, 1 << HDMI_TX_PIXEL_SEL_SHIFT);
+		}
 		break;
 	case 4:
-		/* enable vclk_div4 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV4_EN, VCLK_DIV4_EN);
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			/* enable vclk_div4 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV4_EN, VCLK_DIV4_EN);
+
+			/* select vclk_div4 for HDMI-TX */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_PIXEL_SEL_MASK, 2 << HDMI_TX_PIXEL_SEL_SHIFT);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_FE_SEL_MASK, 2 << HDMI_TX_FE_SEL_SHIFT);
+		} else {
+			/* enable vclk_div4 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV4_EN, VCLK_DIV4_EN);
 
-		/* select vclk_div4 for HDMI-TX */
-		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			HDMI_TX_PIXEL_SEL_MASK, 2 << HDMI_TX_PIXEL_SEL_SHIFT);
+			/* select vclk_div4 for HDMI-TX */
+			regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK, 2 << HDMI_TX_PIXEL_SEL_SHIFT);
+		}
 		break;
 	case 6:
-		/* enable vclk_div6 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV6_EN, VCLK_DIV6_EN);
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			/* enable vclk_div6 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV6_EN, VCLK_DIV6_EN);
+
+			/* select vclk_div6 for HDMI-TX */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_PIXEL_SEL_MASK, 3 << HDMI_TX_PIXEL_SEL_SHIFT);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_FE_SEL_MASK, 3 << HDMI_TX_FE_SEL_SHIFT);
+		} else {
+			/* enable vclk_div6 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV6_EN, VCLK_DIV6_EN);
 
-		/* select vclk_div6 for HDMI-TX */
-		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			HDMI_TX_PIXEL_SEL_MASK, 3 << HDMI_TX_PIXEL_SEL_SHIFT);
+			/* select vclk_div6 for HDMI-TX */
+			regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK, 3 << HDMI_TX_PIXEL_SEL_SHIFT);
+		}
 		break;
 	case 12:
-		/* enable vclk_div12 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV12_EN, VCLK_DIV12_EN);
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			/* enable vclk_div12 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV12_EN, VCLK_DIV12_EN);
+
+			/* select vclk_div12 for HDMI-TX */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_PIXEL_SEL_MASK, 4 << HDMI_TX_PIXEL_SEL_SHIFT);
+			regmap_update_bits(priv->clkctrl, CLKCTRL_HDMI_CLK_CTRL,
+				HDMI_TX_FE_SEL_MASK, 4 << HDMI_TX_FE_SEL_SHIFT);
+		} else {
+			/* enable vclk_div12 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV12_EN, VCLK_DIV12_EN);
 
-		/* select vclk_div12 for HDMI-TX */
-		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			HDMI_TX_PIXEL_SEL_MASK, 4 << HDMI_TX_PIXEL_SEL_SHIFT);
+			/* select vclk_div12 for HDMI-TX */
+			regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK, 4 << HDMI_TX_PIXEL_SEL_SHIFT);
+		}
 		break;
 	}
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL2,
+				   HDMI_TX_PIXEL_EN, HDMI_TX_PIXEL_EN);
+	else
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
 				   HDMI_TX_PIXEL_EN, HDMI_TX_PIXEL_EN);
 
 	/* Set ENCI/ENCP Source */
-	switch (venc_div) {
-	case 1:
-		/* enable vclk_div1 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV1_EN, VCLK_DIV1_EN);
-
-		if (hdmi_use_enci)
-			/* select vclk_div1 for enci */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-					   CTS_ENCI_SEL_MASK, 0);
-		else
-			/* select vclk_div1 for encp */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-					   CTS_ENCP_SEL_MASK, 0);
-		break;
-	case 2:
-		/* enable vclk_div2 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV2_EN, VCLK_DIV2_EN);
-
-		if (hdmi_use_enci)
-			/* select vclk_div2 for enci */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCI_SEL_MASK, 1 << CTS_ENCI_SEL_SHIFT);
-		else
-			/* select vclk_div2 for encp */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCP_SEL_MASK, 1 << CTS_ENCP_SEL_SHIFT);
-		break;
-	case 4:
-		/* enable vclk_div4 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV4_EN, VCLK_DIV4_EN);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		switch (venc_div) {
+		case 1:
+			/* enable vclk_div1 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV1_EN, VCLK_DIV1_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div1 for enci */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+						   CTS_ENCI_SEL_MASK, 0);
+			else
+				/* select vclk_div1 for encp */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+						   CTS_ENCP_SEL_MASK, 0);
+			break;
+		case 2:
+			/* enable vclk_div2 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV2_EN, VCLK_DIV2_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div2 for enci */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, 1 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div2 for encp */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK, 1 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 4:
+			/* enable vclk_div4 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV4_EN, VCLK_DIV4_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div4 for enci */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, 2 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div4 for encp */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK, 2 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 6:
+			/* enable vclk_div6 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV6_EN, VCLK_DIV6_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div6 for enci */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, 3 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div6 for encp */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK, 3 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 12:
+			/* enable vclk_div12 gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL,
+					   VCLK_DIV12_EN, VCLK_DIV12_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div12 for enci */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, 4 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div12 for encp */
+				regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK, 4 << CTS_ENCP_SEL_SHIFT);
+			break;
+		}
 
 		if (hdmi_use_enci)
-			/* select vclk_div4 for enci */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCI_SEL_MASK, 2 << CTS_ENCI_SEL_SHIFT);
+			/* Enable ENCI clock gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL2,
+					   CTS_ENCI_EN, CTS_ENCI_EN);
 		else
-			/* select vclk_div4 for encp */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCP_SEL_MASK, 2 << CTS_ENCP_SEL_SHIFT);
-		break;
-	case 6:
-		/* enable vclk_div6 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV6_EN, VCLK_DIV6_EN);
+			/* Enable ENCP clock gate */
+			regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL2,
+					   CTS_ENCP_EN, CTS_ENCP_EN);
+
+		regmap_update_bits(priv->clkctrl, CLKCTRL_VID_CLK_CTRL, VCLK_EN, VCLK_EN);
+	} else {
+		switch (venc_div) {
+		case 1:
+			/* enable vclk_div1 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV1_EN, VCLK_DIV1_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div1 for enci */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						   CTS_ENCI_SEL_MASK, 0);
+			else
+				/* select vclk_div1 for encp */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						   CTS_ENCP_SEL_MASK, 0);
+			break;
+		case 2:
+			/* enable vclk_div2 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV2_EN, VCLK_DIV2_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div2 for enci */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCI_SEL_MASK, 1 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div2 for encp */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCP_SEL_MASK, 1 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 4:
+			/* enable vclk_div4 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV4_EN, VCLK_DIV4_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div4 for enci */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCI_SEL_MASK, 2 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div4 for encp */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCP_SEL_MASK, 2 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 6:
+			/* enable vclk_div6 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV6_EN, VCLK_DIV6_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div6 for enci */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCI_SEL_MASK, 3 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div6 for encp */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCP_SEL_MASK, 3 << CTS_ENCP_SEL_SHIFT);
+			break;
+		case 12:
+			/* enable vclk_div12 gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
+					   VCLK_DIV12_EN, VCLK_DIV12_EN);
+
+			if (hdmi_use_enci)
+				/* select vclk_div12 for enci */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCI_SEL_MASK, 4 << CTS_ENCI_SEL_SHIFT);
+			else
+				/* select vclk_div12 for encp */
+				regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
+						CTS_ENCP_SEL_MASK, 4 << CTS_ENCP_SEL_SHIFT);
+			break;
+		}
 
 		if (hdmi_use_enci)
-			/* select vclk_div6 for enci */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCI_SEL_MASK, 3 << CTS_ENCI_SEL_SHIFT);
+			/* Enable ENCI clock gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
+					   CTS_ENCI_EN, CTS_ENCI_EN);
 		else
-			/* select vclk_div6 for encp */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCP_SEL_MASK, 3 << CTS_ENCP_SEL_SHIFT);
-		break;
-	case 12:
-		/* enable vclk_div12 gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL,
-				   VCLK_DIV12_EN, VCLK_DIV12_EN);
+			/* Enable ENCP clock gate */
+			regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
+					   CTS_ENCP_EN, CTS_ENCP_EN);
 
-		if (hdmi_use_enci)
-			/* select vclk_div12 for enci */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCI_SEL_MASK, 4 << CTS_ENCI_SEL_SHIFT);
-		else
-			/* select vclk_div12 for encp */
-			regmap_update_bits(priv->hhi, HHI_VID_CLK_DIV,
-				CTS_ENCP_SEL_MASK, 4 << CTS_ENCP_SEL_SHIFT);
-		break;
+		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 	}
-
-	if (hdmi_use_enci)
-		/* Enable ENCI clock gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
-				   CTS_ENCI_EN, CTS_ENCI_EN);
-	else
-		/* Enable ENCP clock gate */
-		regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2,
-				   CTS_ENCP_EN, CTS_ENCP_EN);
-
-	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 }
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,

-- 
2.43.0


