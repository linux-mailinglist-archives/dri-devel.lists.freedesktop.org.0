Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F6494993
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A22C10E850;
	Thu, 20 Jan 2022 08:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836A110E895
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:34:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n8so10336841wmk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybCF5T/CLFgaH7RWPA37nRhcJtJfXOcwEBs3M4EXIIo=;
 b=gMjds0tEZxs70ULyfiNsVwvJSpTJytGtVBwt7RfZTSfhX/NoBw/3rIaMgv8xXT9mMn
 j5iXEA6sAd78VCyCRlwrY8O+6P+n7/JmW8SQQmf8gnpPJY/TF6tsxvH5YH1TX72gXgFP
 HR359wn/CTb+2+LU0KZ5RCAXCaZ9m9UIDC37+ga9rJUDChVfRngyBBx5JJ0XPedFoMaa
 D1ILVNOOqqJdBw5CucBiDxdx2elQ72E8QnUq74fhWb8QJm5U5X9otiHesnHBdNxPyiCO
 aSwcEwg8bl1SvmxmCASB9my9Fkz0katDugzG2T5NojBXLdH33qIw/qA91wX2mP1HdKix
 0Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybCF5T/CLFgaH7RWPA37nRhcJtJfXOcwEBs3M4EXIIo=;
 b=BFuBhJudSW9tfmTTS5Bp2ugpLj1WZXmDeKcM2dx9yoaTW9Fjwvra7QwhUKECnVPcsa
 A7WZG/T+gIRvIQpmEA+qdh03slaj2Bx+rxpidv3Jsm4RJt+NsKWDjvu90US8CQLAUqak
 AOX9FS4NRMes08DNw6EnKzwicWBXVcj1/OuXFm/xoQCxufRaDerIXpjcOdLxBJuVBn95
 mXjKbtgLBpMtM0Zpa88jfUIklH80oUxLGGDYm14WGeKI9DahwDo+POC2WUHnpEeIivJp
 LihGiZ9HuQWnhgyKa0BZOQ0AzffChKk+ItBbxGoB77RG/Mv0J8Kv9bXGNBz/2MaZfJq1
 NKeg==
X-Gm-Message-State: AOAM5335MMDp1oC5nsfYNpwABJoyIv7NlUjkG1ZMREyXSxJvfod1ubmN
 jFcdhueQgE0/BaZ9chUbtef/vaTZlNcqnQ==
X-Google-Smtp-Source: ABdhPJyYQQEKng/pf5sbVG3hVzE8qYvfmgAFzhaCl+3Ulq9/M+XCovrqDWf1fgDSHiLib5TSI+PXOQ==
X-Received: by 2002:a05:600c:1f17:: with SMTP id
 bd23mr7699927wmb.154.1642667660284; 
 Thu, 20 Jan 2022 00:34:20 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:17 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v2 3/6] drm/meson: venc: add ENCL encoder setup for MIPI-DSI
 output
Date: Thu, 20 Jan 2022 09:33:54 +0100
Message-Id: <20220120083357.1541262-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13702; h=from:subject;
 bh=sTGchEWhnSoScT9SmhjbKT3KGB43z1HixGlelW9o6FA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2IqRbo0hPIYxbt0iHKhrwDDtsyiztFJyHwwx1T
 CDY1LsuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdiAAKCRB33NvayMhJ0XDXEA
 C+g7v9KCaGz/BK5o5kLDY2odiDhSsOEzpM9K9MrVpQHRi4BuOYZrLXOPLEnukuFJyAkC9YWjW/CCNm
 Gi3vTyLnN9G7uAS/WsOKhrriN5E2Gs50LJiEXcy8ZmcdS4SeJD0t/BbFQQfRNzqTTtot2C3I5dOVga
 kLTy8ERQLyprRBMISFDtUVeOp8gjA7EjhQ+7Y3ZlD4XS7ty68jtpGqSPuhqrGLhSJQrhgBPVzSJFm8
 LGB1z2Xd//gvDkIorHpAmRshsGDuLGQYjdr8V9wtvftNSLSgxxNUx1lqvaWAQQTY5H3b4gO0+KX9YR
 b0izswrUmA/Qch3G0YQWOsbSbfDCIsPPjrf2D5Vbg33rfqgLs7JWvfe00Tf6PAGtADLjFiCA3bstXm
 v4yvRix7pg94F29i1AnpVFsJplNtqokBWynfKSA//WZNOydc7d0aq5muFFUTVWJrMNdzkIxmCPasvI
 O5zTwc1Yw+WqUJA5O7LBNw/d1ZR/QLyEtXx/5Q0Bx9nFr9zwO7Zvurhc7OvdX5nHmP+YzgwfOtbdY7
 0/9sajAhVk0n6cYsQt1jl6ZhoqlvvYXp7v/Lji8Bgjn1XRIu8gG3sZIlmGGvBYaRrqgL3yzPGhtwjm
 pL2lf6+b67HiFu5xWwtl7lKx/H9MV+MaaAaYCus1Cz3b5fcdOuuEjxr4tcOg==
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

This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
Amlogic AXG, G12A, G12B & SM1 SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h |  15 ++
 drivers/gpu/drm/meson/meson_venc.c      | 211 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_venc.h      |   6 +
 drivers/gpu/drm/meson/meson_vpp.h       |   2 +
 4 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 0f3cafab8860..a422a8df1641 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -1300,13 +1300,28 @@
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
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..eb2ac0549d46 100644
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
2.25.1

