Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C36F9212
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 14:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4458110E28E;
	Sat,  6 May 2023 12:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BBD10E27C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 12:36:03 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 214DA66057AD;
 Sat,  6 May 2023 13:36:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683376561;
 bh=hppJFlJD76NAZKE1AkmAFF4KLxcEFT3STZIl+hIWzZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mzlfd3EWe+2ovBR/ZLbGwok5Lba4bIvw+DzT/YJziSFUEjmFCEl7FFTjBfg/dDFCi
 W7iux28+Crb1HE7fTKVLHfo7a8wg8g+lfgb3DS003uzTYVju/OPrpLn5lM3klYjg6E
 35mYhfEkdiCxFEkcl2mgosOD3ftawaxPkj9mpW6weg6NjFcvvHZL7VoAaE+myTKt/J
 AH6z2GVRMCQYR9Z6/2VPo78IOuf4GWDEeXXc78TBsiph4v/doCJQquYC464YLGHSs5
 NPJCR9i4jL+8ppBCf5j5xOd1Gra2HTbdLonDq4AsG+b6R1x/JEOMV3Y6qB9xg3JS+H
 9VRS+ydMRC7IQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 08/11] drm/mediatek: gamma: Support multi-bank gamma LUT
Date: Sat,  6 May 2023 14:35:46 +0200
Message-Id: <20230506123549.101727-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
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

Newer Gamma IP have got multiple LUT banks: support specifying the
size of the LUT banks and handle bank-switching before programming
the LUT in mtk_gamma_set_common() in preparation for adding support
for MT8195 and newer SoCs.

Suggested-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Refactored original commit]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 78 +++++++++++++++--------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 62e1e50d2671..b374dfc610ae 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -25,6 +25,8 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
+#define DISP_GAMMA_BANK				0x0100
+#define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
 #define DISP_GAMMA_LUT				0x0700
 
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
@@ -38,6 +40,7 @@
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_bank_size;
 	u16 lut_size;
 	u8 lut_bits;
 };
@@ -84,9 +87,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
-	u16 lut_size;
+	u16 lut_bank_size, lut_size;
 	u8 lut_bits;
-	u32 cfg_val, word;
+	u32 cfg_val, lbank_val, word;
+	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -94,43 +98,61 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
+		lut_bank_size = gamma->data->lut_bank_size;
 		lut_bits = gamma->data->lut_bits;
 		lut_size = gamma->data->lut_size;
 	} else {
 		lut_diff = false;
+		lut_bank_size = LUT_SIZE_DEFAULT;
 		lut_bits = LUT_BITS_DEFAULT;
 		lut_size = LUT_SIZE_DEFAULT;
 	}
 
+	if (lut_bank_size)
+		num_lut_banks = lut_size / lut_bank_size;
+	else
+		num_lut_banks = 1;
+
 	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < lut_size; i++) {
-		struct drm_color_lut diff, hwlut;
-
-		hwlut.red = drm_color_lut_extract(lut[i].red, lut_bits);
-		hwlut.green = drm_color_lut_extract(lut[i].green, lut_bits);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, lut_bits);
-
-		if (!lut_diff || (i % 2 == 0)) {
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
-		} else {
-			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, lut_bits);
-
-			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, lut_bits);
-
-			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
-
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+
+	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
+
+		/* Switch gamma bank and set data mode before writing LUT */
+		if (num_lut_banks > 1) {
+			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			writel(lbank_val, regs + DISP_GAMMA_BANK);
+		}
+
+		for (i = 0; i < lut_bank_size; i++) {
+			int n = (cur_bank * lut_bank_size) + i;
+			struct drm_color_lut diff, hwlut;
+
+			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
+			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
+
+			if (!lut_diff || (i % 2 == 0)) {
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+			} else {
+				diff.red = lut[n].red - lut[n - 1].red;
+				diff.red = drm_color_lut_extract(diff.red, lut_bits);
+
+				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = drm_color_lut_extract(diff.green, lut_bits);
+
+				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
+
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+			}
+			writel(word, (lut_base + i * 4));
 		}
-		writel(word, (lut_base + i * 4));
 	}
 
 	/* Enable the gamma table */
@@ -241,11 +263,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bank_size = 256,
 	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bank_size = 256,
 	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
-- 
2.40.1

