Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423F7C6A21
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8509310E48E;
	Thu, 12 Oct 2023 09:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF63710E48A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:57:53 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE70166071A3;
 Thu, 12 Oct 2023 10:57:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697104672;
 bh=OKxW0Teq4t4s0TFxFYrNU/LGHfTxhMGulUaNeRmnmIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kZvW+8sG6P3xYBl4DtKIBSjG4k02Lm4Opv2Ee5PgT/1+ZTVB2z1RH8dSD6ydoRxH5
 5a/HLfoyC/r3OFFnqshOi+uG1aZD3k+JSrzX81rwPCxmPO4qh7ro9dP0nnqRuVHsLx
 GOn5E7MEKzJjKUpZjAqjq98Ah1N9CcFEw8dO09DIFuSMMvS9KjsbKLM/nIsigL1Icu
 hJVVcg9IFcpgdFt83RZjGP/fvt6tV/Q+/tv5kjX/v3Fz1hjP1WdPytPsQpBNy6qhbh
 S4F8Ia4jY7NnWHnrLYb1L8W68iuM1HztZSK0cFLCJnhu5o+PyuF7ThJYZseeJ68iR/
 /f2wKIogdxgyQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v11 10/16] drm/mediatek: gamma: Add support for 12-bit LUT
Date: Thu, 12 Oct 2023 11:57:30 +0200
Message-ID: <20231012095736.100784-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New SoCs, like MT8195, not only may support bigger lookup tables, but
have got a different register layout to support bigger precision:
support specifying the number of `lut_bits` for each SoC and use it
in mtk_gamma_set_common() to perform the right calculations and add
support for 12-bit gamma lookup tables.

While at it, also reorder the variables in mtk_gamma_set_common()
and rename `lut_base` to `lut0_base` to improve readability.

Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 83 +++++++++++++++++------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 911468984ad5..6305cd95e6d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -26,17 +26,26 @@
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
+#define DISP_GAMMA_BANK_DATA_MODE			BIT(2)
 #define DISP_GAMMA_LUT				0x0700
+#define DISP_GAMMA_LUT1				0x0b00
 
+/* For 10 bit LUT layout, R/G/B are in the same register */
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
 #define DISP_GAMMA_LUT_10BIT_G			GENMASK(19, 10)
 #define DISP_GAMMA_LUT_10BIT_B			GENMASK(9, 0)
 
+/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
+#define DISP_GAMMA_LUT_12BIT_R			GENMASK(11, 0)
+#define DISP_GAMMA_LUT_12BIT_G			GENMASK(23, 12)
+#define DISP_GAMMA_LUT_12BIT_B			GENMASK(11, 0)
+
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_bank_size;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -72,28 +81,48 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
+/*
+ * SoCs supporting 12-bits LUTs are using a new register layout that does
+ * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
+ * ignore the support for 10-bits in this driver and always use 12-bits.
+ *
+ * Summarizing:
+ * - SoC HW support 9/10-bits LUT only
+ *   - Old register layout
+ *     - 10-bits LUT supported
+ *     - 9-bits LUT not supported
+ * - SoC HW support both 10/12bits LUT
+ *   - New register layout
+ *     - 12-bits LUT supported
+ *     - 10-its LUT not supported
+ */
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	unsigned int i;
-	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 cfg_val, lbank_val, word;
+	void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
+	void __iomem *lut1_base = gamma->regs + DISP_GAMMA_LUT1;
+	u32 cfg_val, data_mode, lbank_val, word[2];
+	u8 lut_bits = gamma->data->lut_bits;
 	int cur_bank, num_lut_banks;
+	struct drm_color_lut *lut;
+	unsigned int i;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
 	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
-	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 
+	/* Switch to 12 bits data mode if supported */
+	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
+
 	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
 
 		/* Switch gamma bank and set data mode before writing LUT */
 		if (num_lut_banks > 1) {
 			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			lbank_val |= data_mode;
 			writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
 		}
 
@@ -101,29 +130,43 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 			int n = cur_bank * gamma->data->lut_bank_size + i;
 			struct drm_color_lut diff, hwlut;
 
-			hwlut.red = drm_color_lut_extract(lut[n].red, 10);
-			hwlut.green = drm_color_lut_extract(lut[n].green, 10);
-			hwlut.blue = drm_color_lut_extract(lut[n].blue, 10);
+			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
+			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
 
 			if (!gamma->data->lut_diff || (i % 2 == 0)) {
-				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+				if (lut_bits == 12) {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
+					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
+				} else {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+				}
 			} else {
 				diff.red = lut[n].red - lut[n - 1].red;
-				diff.red = drm_color_lut_extract(diff.red, 10);
+				diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
 				diff.green = lut[n].green - lut[n - 1].green;
-				diff.green = drm_color_lut_extract(diff.green, 10);
+				diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
 				diff.blue = lut[n].blue - lut[n - 1].blue;
-				diff.blue = drm_color_lut_extract(diff.blue, 10);
-
-				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
+
+				if (lut_bits == 12) {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
+					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
+				} else {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+				}
 			}
-			writel(word, lut_base + i * 4);
+			writel(word[0], lut0_base + i * 4);
+			if (lut_bits == 12)
+				writel(word[1], lut1_base + i * 4);
 		}
 	}
 
@@ -225,11 +268,13 @@ static void mtk_disp_gamma_remove(struct platform_device *pdev)
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
 	.lut_bank_size = 512,
+	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_bank_size = 512,
+	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.42.0

