Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48A25F4D5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228F6E39B;
	Mon,  7 Sep 2020 08:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6288F6E39B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id a9so13296103wmm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQg2+Z+4Z9uoP0k4Ymx06ITa24flhw5hWYghDUJXUcc=;
 b=mHnwiHES/95d5fwmwj3syQIIfcHT2rU+zt6c44vokEPjZC8MH8VaJ3jJFhyksp5Z9Y
 bHD1XFEmqHEQnapBKvPGBrnhuzu0jrP+hzLtnyn+7j5fYoeFNqUF82O2g0bmDIiCSJxg
 s5oy9H0H8j7xjor/dauiwcwc+tyyTRt7CD1ulWZ0jnhXLhxQrUCQA46m327yoh3HM/5u
 LypNDlIQdmscbtyRoHTeNN6brTLXpJQoI13Q3QOx8qxlXVJ+GZeYvzDdxNylb4otks39
 TsHZByeOmJRG4BsfCE0JW7GtGMGAYH5NThY/nUKJQDC8fYXBY6MecG6mQeDGpmdXdaKI
 Uaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQg2+Z+4Z9uoP0k4Ymx06ITa24flhw5hWYghDUJXUcc=;
 b=uJfyIVR/+InOU1UbkAGJ+WsA0sMFdvjOtKTU/7DGIOeXk/Wqi65DytbTOeF1YaFxkj
 GqZa2wnNMy2fPmOaY2CNmoueCrk6Uta9I0q2jHxc/meSpUDOH4tfD0fZASJIE+SVfsRF
 fWVYv6/z+v0Ve1LLtJUADQc8CtNfZnNTGgNpPupbuBu1oPLpzO9I8zcpk3mbw8rNjw0q
 5GQGyQnU4oMgGEpQ8M0T1LimyPk2EL4TLQH5WbNU1XcSE1Z0/E/eUdxh37/4RgCUqEMZ
 Mo16xsZczEeyrkOgg7tFEFNQjrf/t/QAVFWUQ0z/AVu2j3W7yhXUUXqrL0CKcP9WLkE4
 YxJA==
X-Gm-Message-State: AOAM530gBdffMXx3ilfEvqdtzTU3l/O4+AogMmRzC7p6D7nuKZS1s2tE
 D85XgPYEfplQOUrCzuvPgp9Xxw==
X-Google-Smtp-Source: ABdhPJxfZ5V7YDJSl0elZl8O7bedUSaI/mdlUPSSpde69SuVvmXp/sHs2fN44ZK5WgqsTt2M/Nf+Ww==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr18975161wmm.2.1599466715849; 
 Mon, 07 Sep 2020 01:18:35 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 4/6] drm/meson: venc: add ENCL encoder setup for MIPI-DSI
 output
Date: Mon,  7 Sep 2020 10:18:23 +0200
Message-Id: <20200907081825.1654-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
Amlogic AXG SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 230 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_venc.h |   6 +
 drivers/gpu/drm/meson/meson_vpp.h  |   2 +
 3 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index f93c725b6f02..3090418deffb 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_modes.h>
 
@@ -1557,6 +1558,224 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
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
+#define GAMMA_VCOM_POL    7     /* RW */
+#define GAMMA_RVS_OUT     6     /* RW */
+#define ADR_RDY           5     /* Read Only */
+#define WR_RDY            4     /* Read Only */
+#define RD_RDY            3     /* Read Only */
+#define GAMMA_TR          2     /* RW */
+#define GAMMA_SET         1     /* RW */
+#define GAMMA_EN          0     /* RW */
+
+#define H_RD              12
+#define H_AUTO_INC        11
+#define H_SEL_R           10
+#define H_SEL_G           9
+#define H_SEL_B           8
+#define HADR_MSB          7            /* 7:0 */
+#define HADR              0            /* 7:0 */
+
+#define GAMMA_RETRY       1000
+
+static void meson_encl_set_gamma_table(struct meson_drm *priv, u16 *data,
+				       u32 rgb_mask)
+{
+	int i, ret;
+	u32 reg;
+
+	writel_bits_relaxed(BIT(GAMMA_EN), 0,
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+
+	ret = readl_relaxed_poll_timeout(priv->io_base +
+						_REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & BIT(ADR_RDY), 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(BIT(H_AUTO_INC) |
+		       BIT(rgb_mask) |
+		       (0 << HADR),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+
+	for (i = 0; i < 256; i++) {
+		ret = readl_relaxed_poll_timeout(priv->io_base +
+							_REG(L_GAMMA_CNTL_PORT),
+						 reg, reg & BIT(WR_RDY),
+						 10, 10000);
+		if (ret)
+			pr_warn_once("%s: GAMMA WR_RDY timeout\n", __func__);
+
+		writel_relaxed(data[i],
+			       priv->io_base + _REG(L_GAMMA_DATA_PORT));
+	}
+
+	ret = readl_relaxed_poll_timeout(priv->io_base +
+						_REG(L_GAMMA_CNTL_PORT),
+					 reg, reg & BIT(ADR_RDY), 10, 10000);
+	if (ret)
+		pr_warn("%s: GAMMA ADR_RDY timeout\n", __func__);
+
+	writel_relaxed(BIT(H_AUTO_INC) |
+		       BIT(rgb_mask) |
+		       (0x23 << HADR),
+		       priv->io_base + _REG(L_GAMMA_ADDR_PORT));
+}
+
+void meson_encl_load_gamma(struct meson_drm *priv)
+{
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_R);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_G);
+	meson_encl_set_gamma_table(priv, meson_encl_gamma_table, H_SEL_B);
+
+	writel_bits_relaxed(BIT(GAMMA_EN), BIT(GAMMA_EN),
+			    priv->io_base + _REG(L_GAMMA_CNTL_PORT));
+}
+
+void meson_venc_mipi_dsi_mode_set(struct meson_drm *priv,
+				  struct drm_display_mode *mode)
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
+	writel_relaxed(0x8000, priv->io_base + _REG(ENCL_VIDEO_MODE));
+	writel_relaxed(0x0418, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(0x1000, priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
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
+	writel_relaxed(3, priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
+
+	/* default black pattern */
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
+	writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
+	writel_bits_relaxed(BIT(3), 0, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+
+	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
+	writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR));
+	writel_relaxed(0x400, priv->io_base + _REG(L_DITH_CNTL_ADDR));
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
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HE_ADDR));
+	} else {
+		writel_relaxed(hso_begin, priv->io_base + _REG(L_STH1_HS_ADDR));
+		writel_relaxed(hso_end, priv->io_base + _REG(L_STH1_HE_ADDR));
+	}
+	writel_relaxed(0, priv->io_base + _REG(L_STH1_VS_ADDR));
+	writel_relaxed(max_lncnt, priv->io_base + _REG(L_STH1_VE_ADDR));
+
+	/* Vsync signal for TTL */
+	writel_relaxed(vso_begin, priv->io_base + _REG(L_STV1_HS_ADDR));
+	writel_relaxed(vso_end, priv->io_base + _REG(L_STV1_HE_ADDR));
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VE_ADDR));
+	} else {
+		writel_relaxed(vso_bline, priv->io_base + _REG(L_STV1_VS_ADDR));
+		writel_relaxed(vso_eline, priv->io_base + _REG(L_STV1_VE_ADDR));
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
+	writel_relaxed(BIT(4) | BIT(5),
+		       priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
+
+	priv->venc.current_mode = MESON_VENC_MODE_MIPI_DSI;
+}
+EXPORT_SYMBOL_GPL(meson_venc_mipi_dsi_mode_set);
+
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode)
 {
@@ -1747,8 +1966,15 @@ unsigned int meson_venci_get_field(struct meson_drm *priv)
 
 void meson_venc_enable_vsync(struct meson_drm *priv)
 {
-	writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
-		       priv->io_base + _REG(VENC_INTCTRL));
+	switch (priv->venc.current_mode) {
+	case MESON_VENC_MODE_MIPI_DSI:
+		writel_relaxed(0x200,
+			       priv->io_base + _REG(VENC_INTCTRL));
+		break;
+	default:
+		writel_relaxed(VENC_INTCTRL_ENCI_LNRST_INT_EN,
+			       priv->io_base + _REG(VENC_INTCTRL));
+	}
 	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
 }
 
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 9138255ffc9e..15f9a5effb40 100644
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
+				  struct drm_display_mode *mode);
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
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
