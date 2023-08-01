Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812A76B42E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464210E3EB;
	Tue,  1 Aug 2023 11:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0410E3E8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:59:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A2336607196;
 Tue,  1 Aug 2023 12:59:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690891147;
 bh=tL/kCW3UUslR/B9zGHpsH8N86YFjunPhWb7Siktjutk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZxvDr8zNsqO1r3ci3WrBGTx8eHfkYe1eh/B/Uzq9DS+eHXJn6sS6WrfmUGvC8BzRj
 GHTBnMOJK5NGtg+s259Em0+Qs3wsbyvzlWhr3O46W/jxYYle/A3ESPCGQvFJNZMIKp
 Pk5+rx97QmzPzSzOUGyNEphthul78k0JFTVkI8BaAYJoJU2+3iPSjxov974Dxb9y5d
 7bO5Qr0xt46wrudpmUHjgINKOvAHlqXkPtXe9agr4zNYzrUAbf3akg2yIS46FB47y4
 7qP7VpItLs5/dFEhRnK864tYB3r30k+ITL6jTCfA2uGpQO7Q1iE/Gn0KrKEQi8tPOy
 e045c4uwBRRjg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v8 07/13] drm/mediatek: gamma: Support specifying number of
 bits per LUT component
Date: Tue,  1 Aug 2023 13:58:48 +0200
Message-ID: <20230801115854.150346-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
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
in mtk_gamma_set_common() to perform the right calculation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 4f642fed432f..a6f7af1a9e8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -37,6 +37,7 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -78,6 +79,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
+	u8 lut_bits;
 	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
@@ -87,10 +89,13 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	/* If we're called from AAL, dev is NULL */
 	gamma = dev ? dev_get_drvdata(dev) : NULL;
 
-	if (gamma && gamma->data)
+	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
-	else
+		lut_bits = gamma->data->lut_bits;
+	} else {
 		lut_diff = false;
+		lut_bits = LUT_BITS_DEFAULT;
+	}
 
 	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
@@ -98,9 +103,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	for (i = 0; i < lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
-		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
-		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
+		hwlut.red = drm_color_lut_extract(lut[i].red, lut_bits);
+		hwlut.green = drm_color_lut_extract(lut[i].green, lut_bits);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, lut_bits);
 
 		if (!lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
@@ -108,13 +113,13 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 		} else {
 			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
+			diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
 			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
+			diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
 			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
+			diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
 
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
@@ -231,10 +236,12 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.41.0

