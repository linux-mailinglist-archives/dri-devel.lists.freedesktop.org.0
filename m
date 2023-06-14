Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9E719B92
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C41410E558;
	Thu,  1 Jun 2023 12:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E831D10E543
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:10:36 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 142326606ED3;
 Thu,  1 Jun 2023 13:10:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685621435;
 bh=LhMeyPcFgIwAH9sbt0vvYI5UK8ayi4irA8hzAUP7wm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIIZHEytxK1WsKnJkVU0KtGHZI92lgmP/8gwzfH/W+nI9I2w6lX+KdS7Mzm8/eImR
 XoUSYknhyR/wux72T5m8eciLDPh5k8nVUDFQbOjXoaoMEDTTxpFzBV8WSwxuPv7mln
 VPh4hCkeIa4m9PcJHzNMSfkFugtYrJRyvRPrMmnfS3EqNbITCTjr2s8melIqvrm7+L
 DnCzgWk0RT9okpE7cno0HCCBDYA3VRHE/d9UAO7GccKMFxzGnrOWHpgEXbHfcBQPYr
 rHbPaTCepnDuuw+UL6oWhgcpKuPBZI8MqTVW2zhU3CX6763Ez9/j2jHzcvQHsGMzwd
 T/g5h4ctV7cKg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 09/11] drm/mediatek: gamma: Add support for 12-bit LUT and
 MT8195
Date: Thu,  1 Jun 2023 14:10:20 +0200
Message-Id: <20230601121022.2401844-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
References: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for 12-bit gamma lookup tables and introduce the first
user for it: MT8195.
While at it, also reorder the variables in mtk_gamma_set_common()
and rename `lut_base` to `lut0_base` to improve readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 61 ++++++++++++++++++-----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index f1a0b18b6c1a..e0e2d2bdbf59 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -27,12 +27,20 @@
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
 #define LUT_10BIT_MASK				0x03ff
 #define LUT_BITS_DEFAULT			10
 #define LUT_SIZE_DEFAULT			512
@@ -83,14 +91,15 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	unsigned int i;
+	void __iomem *lut0_base = regs + DISP_GAMMA_LUT;
+	void __iomem *lut1_base = regs + DISP_GAMMA_LUT1;
+	u32 cfg_val, data_mode, lbank_val, word[2];
+	int cur_bank, num_lut_banks;
+	u16 lut_bank_size, lut_size;
 	struct drm_color_lut *lut;
-	void __iomem *lut_base;
+	unsigned int i;
 	bool lut_diff;
-	u16 lut_bank_size, lut_size;
 	u8 lut_bits;
-	u32 cfg_val, lbank_val, word;
-	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -110,14 +119,17 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	num_lut_banks = lut_size / lut_bank_size;
 
 	cfg_val = readl(regs + DISP_GAMMA_CFG);
-	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 
+	/* Switch to 12 bits data mode if supported */
+	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
+
 	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
 
 		/* Switch gamma bank and set data mode before writing LUT */
 		if (num_lut_banks > 1) {
 			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			lbank_val |= data_mode;
 			writel(lbank_val, regs + DISP_GAMMA_BANK);
 		}
 
@@ -130,9 +142,15 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
 
 			if (!lut_diff || (i % 2 == 0)) {
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
 				diff.red = drm_color_lut_extract(diff.red, lut_bits);
@@ -143,11 +161,19 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 				diff.blue = lut[n].blue - lut[n - 1].blue;
 				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
 
-				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
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
-			writel(word, (lut_base + i * 4));
+			writel(word[0], (lut0_base + i * 4));
+			if (lut_bits == 12)
+				writel(word[1], (lut1_base + i * 4));
 		}
 	}
 
@@ -271,11 +297,20 @@ static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_size = 512,
 };
 
+static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
+	.lut_bank_size = 256,
+	.lut_bits = 12,
+	.lut_diff = true,
+	.lut_size = 1024,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = &mt8173_gamma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = &mt8183_gamma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-gamma",
+	  .data = &mt8195_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.40.1

