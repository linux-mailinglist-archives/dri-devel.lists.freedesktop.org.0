Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3C7C6A2D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A091A10E497;
	Thu, 12 Oct 2023 09:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BDC10E484
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:57:52 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B3E086607357;
 Thu, 12 Oct 2023 10:57:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697104671;
 bh=kzWS8tsbe1nOyVFfaonnwXcO2T4ziHZkSjWTS6xVov8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E66JZ8dOrCUxE2/SYtpRJbH14U9zxeCtWctgPPRHrgE+DQOBYyjFBjebV7wYVDzTZ
 goh9GrgXVwxxxfL3o3QiLJ1iP4bf1Vg6kPzM7DW7gxaiKkoEwaXFGmK9GtNY9XjJFY
 6ZDWO/KUTQYCyjUEsWqsL8v1kEO7BjCakmd/8dslBWH1k5gp8E2VLlbvFJYa5M1adn
 nd83GDOxKFcBQXj5WGHRUviKryHSnnDVO0zKnKeNk6Almz15b8nGSY0koqsiuv6gUj
 ZAwynXmDW7uwpQF3SOkxOxXEkW1MgRzpg7ldtjofpsmVTOZond779jA0OUfI/eukBe
 xiBhyLDFUMwiA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v11 09/16] drm/mediatek: gamma: Support multi-bank gamma LUT
Date: Thu, 12 Oct 2023 11:57:29 +0200
Message-ID: <20231012095736.100784-10-angelogioacchino.delregno@collabora.com>
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

Newer Gamma IP have got multiple LUT banks: support specifying the
size of the LUT banks and handle bank-switching before programming
the LUT in mtk_gamma_set_common() in preparation for adding support
for MT8195 and newer SoCs.

Suggested-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Refactored original commit]
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 70 ++++++++++++++---------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 0929f8830d6d..911468984ad5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -24,6 +24,8 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
+#define DISP_GAMMA_BANK				0x0100
+#define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
 #define DISP_GAMMA_LUT				0x0700
 
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
@@ -33,6 +35,7 @@
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_bank_size;
 	u16 lut_size;
 };
 
@@ -75,40 +78,53 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	u32 cfg_val, word;
+	u32 cfg_val, lbank_val, word;
+	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
+	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
 	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < gamma->data->lut_size; i++) {
-		struct drm_color_lut diff, hwlut;
-
-		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
-		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
-
-		if (!gamma->data->lut_diff || (i % 2 == 0)) {
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
-		} else {
-			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, 10);
-
-			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, 10);
-
-			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, 10);
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
+			writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
+		}
+
+		for (i = 0; i < gamma->data->lut_bank_size; i++) {
+			int n = cur_bank * gamma->data->lut_bank_size + i;
+			struct drm_color_lut diff, hwlut;
+
+			hwlut.red = drm_color_lut_extract(lut[n].red, 10);
+			hwlut.green = drm_color_lut_extract(lut[n].green, 10);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, 10);
+
+			if (!gamma->data->lut_diff || (i % 2 == 0)) {
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+			} else {
+				diff.red = lut[n].red - lut[n - 1].red;
+				diff.red = drm_color_lut_extract(diff.red, 10);
+
+				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = drm_color_lut_extract(diff.green, 10);
+
+				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = drm_color_lut_extract(diff.blue, 10);
+
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+			}
+			writel(word, lut_base + i * 4);
 		}
-		writel(word, (lut_base + i * 4));
 	}
 
 	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
@@ -208,10 +224,12 @@ static void mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bank_size = 512,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bank_size = 512,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.42.0

