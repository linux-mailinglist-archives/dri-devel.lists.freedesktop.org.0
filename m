Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987B494996
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9110E8C7;
	Thu, 20 Jan 2022 08:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4839710E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:34:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p18so10327661wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=yBGdk3+Q7BYOSGSDI0t2AG/UJBZL/qlkFH+jjr1Bt0vyN6Qq6sD+c1/0547xCrG6jk
 gVP608s9fYjpgF2UkELkjlXsqBIFMOW5QSk5tamgfU7TxbswNSr0qEHSG5Rtwic7pjO9
 FUX0AmysGCvgwCEIwOeyYb5/uSCchTA47SA/tth1LDl0rAUu4t6+23YUmZPWFUGPYIq9
 +MxxvkL6dfdO//y+Tfb8qDx/uhbBnX3uKSrtuaneqFHvQ0SbEOT33kXvF+tAgUbyDExp
 Dog/zJmifgRliDnXcgTQJBvaE8tDuaF+FduAUv/fKPs4dvYAkjw1B3fTVvk+sIPv1yus
 XE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=4gVOOSIRfhrAMnopIw1yMYncB9fI5lV/GSDZiM+Y64Nnao8Y/Ps/aFMbHuWoucB1T9
 vgNzjJ+hSoaVgOu/bAYEdb+fRF7N2xhdxb9WccNoj2eyy4ri8TVCYCmDXx+Hf1CTajgJ
 vpKTKFydFOZXtv2uJ731MFNZl7Ggu9i1CGdUVqZQKyYDYXT787n6rdYGOtnBU9iWjTys
 m1XarHj+IDFfPj/0J1Tf0TKBixnX3bkwjkcn07blIhHoY5q6qlStlAfvxBPr66v/dl4A
 Jxz25Ch7es+QatY9oe+6YWQBKAK4T8DBUvCmjoUg7J5CtgTYgkXCEAiUX2CWnEcsC1ZA
 0IaQ==
X-Gm-Message-State: AOAM532wwxgqDvXX7Kq1GuOhxMIZKsl4QFy/auirWRRwqU9F6Psazgms
 81mq4HUx+/4Xkk/wVwzqI0AFXQsxtTRZxw==
X-Google-Smtp-Source: ABdhPJzsnaFCxa8hp12/nAutMdcxwUpcSaVnbnRz5F3konWFpkrG5p93YfmF6iLCrup9/L3KjUG8Gw==
X-Received: by 2002:a05:6000:11:: with SMTP id
 h17mr32198830wrx.368.1642667662387; 
 Thu, 20 Jan 2022 00:34:22 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:20 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] drm/meson: vclk: add DSI clock config
Date: Thu, 20 Jan 2022 09:33:55 +0100
Message-Id: <20220120083357.1541262-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; h=from:subject;
 bh=wVEu88z9Tki+VwSbbtWc3B9clOhCXc+ZkFmWDGthpuw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2IS/tyPj3lnnn7HteF8IVQnViij4BcDf57V2+t
 0uJANG6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdiAAKCRB33NvayMhJ0QWJEA
 CRdbVH6lVqLnL0grmQX9iq0ZMAXzBN+s8nPLgbrBJ+PkqF2atqxt8YVXDt4WhvC3myyxsFXdRMqHAV
 K0ITKK+qJc32NTuIyjw2ELSSwFmYbHJkPJY8lDyBSJfLqK2ECjVldc0xGOc4s5/vY34eGCfksVMSq2
 Og2f1L08CbZ6lNhxLv1xCt9ynlUtnkZ9lVbnBZ/vfQ1F/Ltzn0xiUB1mB15SjYC99UyyQS1TQvb2lx
 SoUkjJr5lGqvyyBDqslBiV50AtJh5BvjrXSiWgHlCtAJjN20q8zkrrWJCuLeI+f5gptO4bJ007vm9B
 PFp+/CIu/BTUwFBufkOJycBAwYKxtNW69lFVpstvvmhd6ovMkMLO1Nl6Sf4oxA7mdeBqqtVgDLl8OQ
 TWXB/LaHCr2C0l4pgKcyHin/BwnRJ5XpRA6AaBcVBWBwW6COZGo9c4G90hPfDBlyxGsJpyrvs4as1d
 m79AKY5G3p1U3TOCnWet6RAt3a6x6L2BlBp/uE7pyyYezRSvUmDw4btOP272yiT3zDCYa8BwQTr/a8
 6F3EVOsY1jcQopOnx6yyQpQeD+JZuMvSVsvjMWrRxjxHXcnCL4UUDN5JBDuPJ33jMxbuHBAfXHAbf0
 A1VUFBHCAha3F6vb3Ghd4GcyMhIxd9fLCxelydvLdQStA+ExKH32/hpRa4Cg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI path used the ENCL pixel encoder, thus this adds a clock
config using the HDMI PLL in order to feed the ENCL encoder via the
VCLK2 path and the CTS_ENCL clock output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 47 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..5e4d982be1c8 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -55,6 +55,8 @@
 #define VCLK2_DIV_MASK		0xff
 #define VCLK2_DIV_EN		BIT(16)
 #define VCLK2_DIV_RESET		BIT(17)
+#define CTS_ENCL_SEL_MASK	(0xf << 12)
+#define CTS_ENCL_SEL_SHIFT	12
 #define CTS_VDAC_SEL_MASK	(0xf << 28)
 #define CTS_VDAC_SEL_SHIFT	28
 #define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
@@ -83,6 +85,7 @@
 #define VCLK_DIV12_EN		BIT(4)
 #define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
 #define CTS_ENCI_EN		BIT(0)
+#define CTS_ENCL_EN		BIT(3)
 #define CTS_ENCP_EN		BIT(2)
 #define CTS_VDAC_EN		BIT(4)
 #define HDMI_TX_PIXEL_EN	BIT(5)
@@ -1024,6 +1027,47 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 }
 
+static void meson_dsi_clock_config(struct meson_drm *priv, unsigned int freq)
+{
+	meson_hdmi_pll_generic_set(priv, freq * 10);
+
+	/* Setup vid_pll divider value /5 */
+	meson_vid_pll_set(priv, VID_PLL_DIV_5);
+
+	/* Disable VCLK2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+	/* Setup the VCLK2 divider value /2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_MASK, 2 - 1);
+
+	/* select vid_pll for vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+			   VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
+
+	/* enable vclk2 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+	/* select vclk2_div1 for encl */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+			   CTS_ENCL_SEL_MASK, (8 << CTS_ENCL_SEL_SHIFT));
+
+	/* release vclk2_div_reset and enable vclk2_div */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_EN | VCLK2_DIV_RESET,
+			   VCLK2_DIV_EN);
+
+	/* enable vclk2_div1 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+	/* reset vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, 0);
+
+	/* enable encl_clk */
+	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2, CTS_ENCL_EN, CTS_ENCL_EN);
+
+	usleep_range(10000, 11000);
+}
+
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		      unsigned int phy_freq, unsigned int vclk_freq,
 		      unsigned int venc_freq, unsigned int dac_freq,
@@ -1050,6 +1094,9 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
+	} else if (target == MESON_VCLK_TARGET_DSI) {
+		meson_dsi_clock_config(priv, phy_freq);
+		return;
 	}
 
 	hdmi_tx_div = vclk_freq / dac_freq;
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..1152b3af8d2e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -17,6 +17,7 @@ enum {
 	MESON_VCLK_TARGET_CVBS = 0,
 	MESON_VCLK_TARGET_HDMI = 1,
 	MESON_VCLK_TARGET_DMT = 2,
+	MESON_VCLK_TARGET_DSI = 3,
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-- 
2.25.1

