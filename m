Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2771570E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1E10E360;
	Tue, 30 May 2023 07:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6734A10E358
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ad99fa586so3827065f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432305; x=1688024305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nVirsR1zx1llPOHECGyQ0rl8FFDf0ssyzSbaS0M5c+k=;
 b=PDnyoPMfxWPshci+BRzIukMT8bCt4tlpGSda6vq63dl0sRFU6JSv5RtJqIKyOOZ8hp
 iolJdj7Yt8hygcIaLd/FVKpFWWlr2Log+3jDP22pRUNmBSKCJdzyTJ9UFKLipEQ6Bjv1
 ODA1ZuXD5YiSbIYIrKzP18sopSUilqw4sH/iENPOlHFpMuLk6FZSoGkXS0gzz6wMOA6t
 ydPeWZafayZUEG87gmfLZlCMH8+qFnz/Hfrc8z4t42mury5n+9dYhzSZcIshWoCWwQmp
 NLUDyIaqEZ7dz+G0djIvr5ZY21diokD6bEc5esLkAMnBgix/i1vtjCj2wkLST4w42w/T
 luWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432305; x=1688024305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVirsR1zx1llPOHECGyQ0rl8FFDf0ssyzSbaS0M5c+k=;
 b=atoFzoy8ga14hvsMU89qK+IlFyDOvA2MJEi6Zcdb8rkPggn9FKrMUTiQzkVgca09VA
 uPqtdEanniYi6LAQ1wpoNxCGtGvvzlbIJQlJzDDh+zOtyvoDdsUs48hKKptaBd1V+TSH
 jfaKtSLc7qsIny/p9DWGqcdNceBOJ+cgHKmCqZl78U+i3N9h150f9Tu81L/N0AaNmmir
 C7zUgts+FsFZLOzMeqwiq1kUN5CKUdCVB6v4eupZKmna0am1l8ltOQRh+6cGSuNnjaYn
 bexCi6r1KZRTEJIRK7W95YbYrRa5fpWh8t3PITE6uU7aNyIP9zlzgf7Ed4DxY2dsmGyM
 noWg==
X-Gm-Message-State: AC+VfDzRsTCqdM0e/XhG9++jOMpjStCSR5YabDgiMD0Zf+zi6jBCUfGH
 PjW/9YDUdH2l79Mh3YOwx+YbZQ==
X-Google-Smtp-Source: ACHHUZ4qWSFlQ3Ehp8JZk+bnvwY46xayGXVIicnFbJbe2ydjNcTpVqRYQTuEMaJfh5kgSnsCDGloJg==
X-Received: by 2002:a5d:5011:0:b0:306:3911:dff0 with SMTP id
 e17-20020a5d5011000000b003063911dff0mr835703wrt.4.1685432305368; 
 Tue, 30 May 2023 00:38:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:11 +0200
Subject: [PATCH v5 10/17] drm/meson: venc: add ENCL encoder setup for
 MIPI-DSI output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-10-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15394;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PLav+7Gd57z4CzaoRTYbs8F3lsWO01D4ELXIlOs+1aE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafhYlIyfhrjnMjMpZGXz3V2LZQnR2nSCRorITPd
 AuxwZA6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4QAKCRB33NvayMhJ0T0zEA
 CPEYFd0yzsl8U3HWRKcyhZ0gfjdAzW0Ql/S0oyzNAvHJXEKLhw4IYJsdekOmGbQ7nrGRfoFblqs3WB
 5fVibgnFKDs4c8KdDhNXlqr/Wz52kDVzMim95D7uYhYiHlfLM3QpjAsXUKl9w4q5aRACSwQF9EzH7V
 qJRFz1E7d/eyLAWlexMAKy9NAMTnXfVNZwAMzhQSnJsFKrMQygmIQo+n9gUoxtwgJVbIiFl/hTG7lR
 UvOBbJbhSTvc0Nl7FSImuge7nWGJk++cPnoUbn7cH5pVgUz1ZgfJpeQ8PCmaHemTOfyOkUfAL9cS3d
 XYq202YtwB3oHqyX1LOeJ9F3ts8Hg0bd99V4y/S0PqtSuzqqAct3gCgIGEFGSgjYw2lVSQsH7TkZ8Z
 72BOTifejZg/ne/KWtXrGw7VCjw2UCrx6UQ7jZHhZxNKN7NEYGs8KOLnYOWupmbIu1Zm+PrW3FhVVr
 g7BF3V3SgmfIGbUqOiiQIGJDKn9YOHU3IxEGagejbLSkfYOl6n0J9XWcfEjWp3k/Bnw0HozuQwj8dW
 mG79erm1b0FBKm64I6ZmOACeKv2vvS/H2E6ANgEoplk7DU87armEFN90r1U1dJa7xZoFKkX0G5hiCP
 PAPYvcueKytxS1ZwO03s21248MU5atm7TzJzhG9WwzQQlIPBiQaQUnM1dbsg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
Amlogic AXG, G12A, G12B & SM1 SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_registers.h |  25 ++++
 drivers/gpu/drm/meson/meson_venc.c      | 211 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_venc.h      |   6 +
 drivers/gpu/drm/meson/meson_vpp.h       |   2 +
 4 files changed, 242 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 0f3cafab8860..3d73d00a1f4c 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -812,6 +812,7 @@
 #define VENC_STATA 0x1b6d
 #define VENC_INTCTRL 0x1b6e
 #define		VENC_INTCTRL_ENCI_LNRST_INT_EN  BIT(1)
+#define		VENC_INTCTRL_ENCP_LNRST_INT_EN  BIT(9)
 #define VENC_INTFLAG 0x1b6f
 #define VENC_VIDEO_TST_EN 0x1b70
 #define VENC_VIDEO_TST_MDSEL 0x1b71
@@ -1192,7 +1193,11 @@
 #define ENCL_VIDEO_PB_OFFST 0x1ca5
 #define ENCL_VIDEO_PR_OFFST 0x1ca6
 #define ENCL_VIDEO_MODE 0x1ca7
+#define		ENCL_PX_LN_CNT_SHADOW_EN	BIT(15)
 #define ENCL_VIDEO_MODE_ADV 0x1ca8
+#define		ENCL_VIDEO_MODE_ADV_VFIFO_EN	BIT(3)
+#define		ENCL_VIDEO_MODE_ADV_GAIN_HDTV	BIT(4)
+#define		ENCL_SEL_GAMMA_RGB_IN		BIT(10)
 #define ENCL_DBG_PX_RST 0x1ca9
 #define ENCL_DBG_LN_RST 0x1caa
 #define ENCL_DBG_PX_INT 0x1cab
@@ -1219,11 +1224,14 @@
 #define ENCL_VIDEO_VOFFST 0x1cc0
 #define ENCL_VIDEO_RGB_CTRL 0x1cc1
 #define ENCL_VIDEO_FILT_CTRL 0x1cc2
+#define		ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER	BIT(12)
 #define ENCL_VIDEO_OFLD_VPEQ_OFST 0x1cc3
 #define ENCL_VIDEO_OFLD_VOAV_OFST 0x1cc4
 #define ENCL_VIDEO_MATRIX_CB 0x1cc5
 #define ENCL_VIDEO_MATRIX_CR 0x1cc6
 #define ENCL_VIDEO_RGBIN_CTRL 0x1cc7
+#define		ENCL_VIDEO_RGBIN_RGB	BIT(0)
+#define		ENCL_VIDEO_RGBIN_ZBLK	BIT(1)
 #define ENCL_MAX_LINE_SWITCH_POINT 0x1cc8
 #define ENCL_DACSEL_0 0x1cc9
 #define ENCL_DACSEL_1 0x1cca
@@ -1300,13 +1308,28 @@
 #define RDMA_STATUS2 0x1116
 #define RDMA_STATUS3 0x1117
 #define L_GAMMA_CNTL_PORT 0x1400
+#define		L_GAMMA_CNTL_PORT_VCOM_POL	BIT(7)	/* RW */
+#define		L_GAMMA_CNTL_PORT_RVS_OUT	BIT(6)	/* RW */
+#define		L_GAMMA_CNTL_PORT_ADR_RDY	BIT(5)	/* Read Only */
+#define		L_GAMMA_CNTL_PORT_WR_RDY	BIT(4)	/* Read Only */
+#define		L_GAMMA_CNTL_PORT_RD_RDY	BIT(3)	/* Read Only */
+#define		L_GAMMA_CNTL_PORT_TR		BIT(2)	/* RW */
+#define		L_GAMMA_CNTL_PORT_SET		BIT(1)	/* RW */
+#define		L_GAMMA_CNTL_PORT_EN		BIT(0)	/* RW */
 #define L_GAMMA_DATA_PORT 0x1401
 #define L_GAMMA_ADDR_PORT 0x1402
+#define		L_GAMMA_ADDR_PORT_RD		BIT(12)
+#define		L_GAMMA_ADDR_PORT_AUTO_INC	BIT(11)
+#define		L_GAMMA_ADDR_PORT_SEL_R		BIT(10)
+#define		L_GAMMA_ADDR_PORT_SEL_G		BIT(9)
+#define		L_GAMMA_ADDR_PORT_SEL_B		BIT(8)
+#define		L_GAMMA_ADDR_PORT_ADDR		GENMASK(7, 0)
 #define L_GAMMA_VCOM_HSWITCH_ADDR 0x1403
 #define L_RGB_BASE_ADDR 0x1405
 #define L_RGB_COEFF_ADDR 0x1406
 #define L_POL_CNTL_ADDR 0x1407
 #define L_DITH_CNTL_ADDR 0x1408
+#define		L_DITH_CNTL_DITH10_EN	BIT(10)
 #define L_GAMMA_PROBE_CTRL 0x1409
 #define L_GAMMA_PROBE_COLOR_L 0x140a
 #define L_GAMMA_PROBE_COLOR_H 0x140b
@@ -1363,6 +1386,8 @@
 #define L_LCD_PWM1_HI_ADDR 0x143f
 #define L_INV_CNT_ADDR 0x1440
 #define L_TCON_MISC_SEL_ADDR 0x1441
+#define		L_TCON_MISC_SEL_STV1	BIT(4)
+#define		L_TCON_MISC_SEL_STV2	BIT(5)
 #define L_DUAL_PORT_CNTL_ADDR 0x1442
 #define MLVDS_CLK_CTL1_HI 0x1443
 #define MLVDS_CLK_CTL1_LO 0x1444
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 27ef9f88e4ff..2bdc2855e249 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_modes.h>
 
@@ -1557,6 +1558,205 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 }
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_mode_set);
 
+static unsigned short meson_encl_gamma_table[256] = {
+	0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60,
+	64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124,
+	128, 132, 136, 140, 144, 148, 152, 156, 160, 164, 168, 172, 176, 180, 184, 188,
+	192, 196, 200, 204, 208, 212, 216, 220, 224, 228, 232, 236, 240, 244, 248, 252,
+	256, 260, 264, 268, 272, 276, 280, 284, 288, 292, 296, 300, 304, 308, 312, 316,
+	320, 324, 328, 332, 336, 340, 344, 348, 352, 356, 360, 364, 368, 372, 376, 380,
+	384, 388, 392, 396, 400, 404, 408, 412, 416, 420, 424, 428, 432, 436, 440, 444,
+	448, 452, 456, 460, 464, 468, 472, 476, 480, 484, 488, 492, 496, 500, 504, 508,
+	512, 516, 520, 524, 528, 532, 536, 540, 544, 548, 552, 556, 560, 564, 568, 572,
+	576, 580, 584, 588, 592, 596, 600, 604, 608, 612, 616, 620, 624, 628, 632, 636,
+	640, 644, 648, 652, 656, 660, 664, 668, 672, 676, 680, 684, 688, 692, 696, 700,
+	704, 708, 712, 716, 720, 724, 728, 732, 736, 740, 744, 748, 752, 756, 760, 764,
+	768, 772, 776, 780, 784, 788, 792, 796, 800, 804, 808, 812, 816, 820, 824, 828,
+	832, 836, 840, 844, 848, 852, 856, 860, 864, 868, 872, 876, 880, 884, 888, 892,
+	896, 900, 904, 908, 912, 916, 920, 924, 928, 932, 936, 940, 944, 948, 952, 956,
+	960, 964, 968, 972, 976, 980, 984, 988, 992, 996, 1000, 1004, 1008, 1012, 1016, 1020,
+};
+
+static void meson_encl_set_gamma_table(struct meson_drm *priv, u16 *data,
+				       u32 rgb_mask)
+{
+	int i, ret;
+	u32 reg;
+
+	writel_bits_relaxed(L_GAMMA_CNTL_PORT_EN, 0,
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+
+	ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
+		       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+
+	for (i = 0; i < 256; i++) {
+		ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
+						 reg, reg & L_GAMMA_CNTL_PORT_WR_RDY,
+						 10, 10000);
+		if (ret)
+			pr_warn_once("%s: GAMMA WR_RDY timeout\n", __func__);
+
+		writel_relaxed(data[i], priv->io_base + _REG(L_GAMMA_DATA_PORT));
+	}
+
+	ret = readl_relaxed_poll_timeout(priv->io_base + _REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & L_GAMMA_CNTL_PORT_ADR_RDY, 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(L_GAMMA_ADDR_PORT_AUTO_INC | rgb_mask |
+		       FIELD_PREP(L_GAMMA_ADDR_PORT_ADDR, 0x23),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+}
+
+void meson_encl_load_gamma(struct meson_drm *priv)
+{
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_R);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_G);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, L_GAMMA_ADDR_PORT_SEL_B);
+
+	writel_bits_relaxed(L_GAMMA_CNTL_PORT_EN, L_GAMMA_CNTL_PORT_EN,
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+}
+
+void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
+				  const struct drm_display_mode *mode)
+{
+	unsigned int max_pxcnt;
+	unsigned int max_lncnt;
+	unsigned int havon_begin;
+	unsigned int havon_end;
+	unsigned int vavon_bline;
+	unsigned int vavon_eline;
+	unsigned int hso_begin;
+	unsigned int hso_end;
+	unsigned int vso_begin;
+	unsigned int vso_end;
+	unsigned int vso_bline;
+	unsigned int vso_eline;
+
+	max_pxcnt = mode->htotal - 1;
+	max_lncnt = mode->vtotal - 1;
+	havon_begin = mode->htotal - mode->hsync_start;
+	havon_end = havon_begin + mode->hdisplay - 1;
+	vavon_bline = mode->vtotal - mode->vsync_start;
+	vavon_eline = vavon_bline + mode->vdisplay - 1;
+	hso_begin = 0;
+	hso_end = mode->hsync_end - mode->hsync_start;
+	vso_begin = 0;
+	vso_end = 0;
+	vso_bline = 0;
+	vso_eline = mode->vsync_end - mode->vsync_start;
+
+	meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCL);
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_relaxed(ENCL_PX_LN_CNT_SHADOW_EN, priv->io_base + _REG(ENCL_VIDEO_MODE));
+	writel_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN |
+		       ENCL_VIDEO_MODE_ADV_GAIN_HDTV |
+		       ENCL_SEL_GAMMA_RGB_IN, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER,
+		       priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
+	writel_relaxed(max_pxcnt, priv->io_base + _REG(ENCL_VIDEO_MAX_PXCNT));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(ENCL_VIDEO_MAX_LNCNT));
+	writel_relaxed(havon_begin, priv->io_base + _REG(ENCL_VIDEO_HAVON_BEGIN));
+	writel_relaxed(havon_end, priv->io_base + _REG(ENCL_VIDEO_HAVON_END));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(ENCL_VIDEO_VAVON_BLINE));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(ENCL_VIDEO_VAVON_ELINE));
+
+	writel_relaxed(hso_begin, priv->io_base + _REG(ENCL_VIDEO_HSO_BEGIN));
+	writel_relaxed(hso_end, priv->io_base + _REG(ENCL_VIDEO_HSO_END));
+	writel_relaxed(vso_begin, priv->io_base + _REG(ENCL_VIDEO_VSO_BEGIN));
+	writel_relaxed(vso_end, priv->io_base + _REG(ENCL_VIDEO_VSO_END));
+	writel_relaxed(vso_bline, priv->io_base + _REG(ENCL_VIDEO_VSO_BLINE));
+	writel_relaxed(vso_eline, priv->io_base + _REG(ENCL_VIDEO_VSO_ELINE));
+	writel_relaxed(ENCL_VIDEO_RGBIN_RGB | ENCL_VIDEO_RGBIN_ZBLK,
+		       priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
+
+	/* default black pattern */
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
+	writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
+	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, 0,
+			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
+	writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR)); /* Magic value */
+
+	writel_relaxed(L_DITH_CNTL_DITH10_EN, priv->io_base + _REG(L_DITH_CNTL_ADDR));
+
+	/* DE signal for TTL */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_OEH_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEH_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEH_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEH_VE_ADDR));
+
+	/* DE signal for TTL */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_OEV1_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_OEV1_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_OEV1_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_OEV1_VE_ADDR));
+
+	/* Hsync signal for TTL */
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC) {
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HE_ADDR));
+	} else {
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HE_ADDR));
+	}
+	writel_relaxed(0, priv->io_base + _REG(L_STH1_VS_ADDR));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(L_STH1_VE_ADDR));
+
+	/* Vsync signal for TTL */
+	writel_relaxed(vso_begin, priv->io_base + _REG(L_STV1_HS_ADDR));
+	writel_relaxed(vso_end, priv->io_base + _REG(L_STV1_HE_ADDR));
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VE_ADDR));
+	} else {
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VE_ADDR));
+	}
+
+	/* DE signal */
+	writel_relaxed(havon_begin, priv->io_base + _REG(L_DE_HS_ADDR));
+	writel_relaxed(havon_end + 1, priv->io_base + _REG(L_DE_HE_ADDR));
+	writel_relaxed(vavon_bline, priv->io_base + _REG(L_DE_VS_ADDR));
+	writel_relaxed(vavon_eline, priv->io_base + _REG(L_DE_VE_ADDR));
+
+	/* Hsync signal */
+	writel_relaxed(hso_begin, priv->io_base + _REG(L_HSYNC_HS_ADDR));
+	writel_relaxed(hso_end, priv->io_base + _REG(L_HSYNC_HE_ADDR));
+	writel_relaxed(0, priv->io_base + _REG(L_HSYNC_VS_ADDR));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(L_HSYNC_VE_ADDR));
+
+	/* Vsync signal */
+	writel_relaxed(vso_begin, priv->io_base + _REG(L_VSYNC_HS_ADDR));
+	writel_relaxed(vso_end, priv->io_base + _REG(L_VSYNC_HE_ADDR));
+	writel_relaxed(vso_bline, priv->io_base + _REG(L_VSYNC_VS_ADDR));
+	writel_relaxed(vso_eline, priv->io_base + _REG(L_VSYNC_VE_ADDR));
+
+	writel_relaxed(0, priv->io_base + _REG(L_INV_CNT_ADDR));
+	writel_relaxed(L_TCON_MISC_SEL_STV1 | L_TCON_MISC_SEL_STV2,
+		       priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
+
+	priv->venc.current_mode = MESON_VENC_MODE_MIPI_DSI;
+}
+EXPORT_SYMBOL_GPL(meson_venc_mipi_dsi_mode_set);
+
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode)
 {
@@ -1747,8 +1947,15 @@ unsigned int meson_venci_get_field(struct meson_drm *priv)
 
 void meson_venc_enable_vsync(struct meson_drm *priv)
 {
-	writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
-		       priv->io_base + _REG(VENC_INTCTRL));
+	switch (priv->venc.current_mode) {
+	case MESON_VENC_MODE_MIPI_DSI:
+		writel_relaxed(VENC_INTCTRL_ENCP_LNRST_INT_EN,
+			       priv->io_base + _REG(VENC_INTCTRL));
+		break;
+	default:
+		writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
+			       priv->io_base + _REG(VENC_INTCTRL));
+	}
 	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
 }
 
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 9138255ffc9e..0f59adb1c6db 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -21,6 +21,7 @@ enum {
 	MESON_VENC_MODE_CVBS_PAL,
 	MESON_VENC_MODE_CVBS_NTSC,
 	MESON_VENC_MODE_HDMI,
+	MESON_VENC_MODE_MIPI_DSI,
 };
 
 struct meson_cvbs_enci_mode {
@@ -47,6 +48,9 @@ struct meson_cvbs_enci_mode {
 	unsigned int analog_sync_adj;
 };
 
+/* LCD Encoder gamma setup */
+void meson_encl_load_gamma(struct meson_drm *priv);
+
 /* HDMI Clock parameters */
 enum drm_mode_status
 meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode);
@@ -63,6 +67,8 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 			      unsigned int ycrcb_map,
 			      bool yuv420_mode,
 			      const struct drm_display_mode *mode);
+void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
+				  const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
diff --git a/drivers/gpu/drm/meson/meson_vpp.h b/drivers/gpu/drm/meson/meson_vpp.h
index afc9553ed8d3..b790042a1650 100644
--- a/drivers/gpu/drm/meson/meson_vpp.h
+++ b/drivers/gpu/drm/meson/meson_vpp.h
@@ -12,6 +12,8 @@
 struct drm_rect;
 struct meson_drm;
 
+/* Mux VIU/VPP to ENCL */
+#define MESON_VIU_VPP_MUX_ENCL	0x0
 /* Mux VIU/VPP to ENCI */
 #define MESON_VIU_VPP_MUX_ENCI	0x5
 /* Mux VIU/VPP to ENCP */

-- 
2.34.1

