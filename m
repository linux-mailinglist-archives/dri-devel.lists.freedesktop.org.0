Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322B5B527C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4198E10E12C;
	Mon, 12 Sep 2022 01:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D25410E110
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:30:15 +0000 (UTC)
X-UUID: 26250b0e0498408288448aee5ef523d7-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pTz2eHm0DjlsjF28qkAXm/7jChpbjOisAJJNn9oimMI=; 
 b=Ln/UtI3ehYhVLuINI1+FnWxN8cu6DE8NW/BnL70dLuXOfAsffwukGj20i8LboJm7qslkTMrVU92fZc4pzXZARxuHpPb5bUDe3rVO5H9A53CgjXPYqaylH3C1YYZ/64Eq6tcrB7ufG9Y6SMa4jEAseaFnNK2aj2aG4hjThqIC2NI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:77de4471-aba9-4f26-9509-ac33ace16667, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:24d0455d-5ed4-4e28-8b00-66ed9f042fbd,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 26250b0e0498408288448aee5ef523d7-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 166792273; Mon, 12 Sep 2022 09:30:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 12 Sep 2022 09:30:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v3 7/9] drm/mediatek: Add gamma lut support for mt8195
Date: Mon, 12 Sep 2022 09:30:04 +0800
Message-ID: <20220912013006.27541-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>

Since the previous gamma_set_common() function is designed for
9bit-to-10bit conversion, which is not feasible for the
10bit-to-12bit conversion in mt8195.

1. Update the function to fit the need of mt8195.
2. Add gamma driver data for mt8195.

Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 57 ++++++++++++++++-------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 45da2b6206c8..d706f76fd30e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -23,6 +23,7 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_LUT				0x0700
+#define DISP_GAMMA_LUT1				0x0b00
 
 #define LUT_10BIT_MASK				0x03ff
 #define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
@@ -82,9 +83,8 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	u8 shift_bits;
 	unsigned int i, j, reg, bank_num;
 	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 word, mask;
-	u32 diff[3] = {0};
+	void __iomem *lut_base, *lut1_base;
+	u32 word, word1, mask;
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
@@ -102,27 +102,41 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		reg = reg | GAMMA_LUT_EN;
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
+		lut1_base = regs + DISP_GAMMA_LUT1;
 		lut = (struct drm_color_lut *)state->gamma_lut->data;
 		for (j = 0; j < bank_num; j++) {
 			writel(j, regs + DISP_GAMMA_BANK);
 			for (i = 0; i < bank_size; i++) {
-				if (!lut_diff || (i % 2 == 0)) {
-					word = (((lut[i].red >> shift_bits) & mask) << 20) +
-						(((lut[i].green >> shift_bits) & mask) << 10) +
-						((lut[i].blue >> shift_bits) & mask);
+				struct drm_color_lut input;
+
+				input.red = (lut[i].red >> shift_bits) & mask;
+				input.green = (lut[i].green >> shift_bits) & mask;
+				input.blue = (lut[i].blue >> shift_bits) & mask;
+				if (!lut_diff || i % 2 == 0) {
+					word = (lut_bits == 12) ?
+					       (input.red + (input.green << 12)) :
+					       ((input.red << 20) + (input.green << 10) +
+						input.blue);
+					word1 = input.blue;
 				} else {
-					diff[0] = (lut[i].red >> shift_bits) -
-						  (lut[i - 1].red >> shift_bits);
-					diff[1] = (lut[i].green >> shift_bits) -
-						  (lut[i - 1].green >> shift_bits);
-					diff[2] = (lut[i].blue >> shift_bits) -
-						  (lut[i - 1].blue >> shift_bits);
-
-					word = ((diff[0] & mask) << 20) +
-						((diff[1] & mask) << 10) +
-						(diff[2] & mask);
+					struct drm_color_lut diff;
+
+					diff.red = input.red  -
+						   ((lut[i - 1].red >> shift_bits) & mask);
+					diff.green = input.green -
+						     ((lut[i - 1].green >> shift_bits & mask));
+					diff.blue = input.blue -
+						    ((lut[i - 1].blue >> shift_bits) & mask);
+
+					word = (lut_bits == 12) ?
+					       (input.red + (input.green << 12)) :
+					       (diff.red << 20) + (diff.green << 10) + diff.blue;
+					word1 = input.blue;
 				}
+
 				writel(word, (lut_base + i * 4));
+				if (lut_bits == 12)
+					writel(word1, (lut1_base + i * 4));
 			}
 		}
 	}
@@ -237,11 +251,20 @@ static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_bits = 10,
 };
 
+static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
+	.lut_diff = true,
+	.lut_size = 512,
+	.lut_bits = 10,
+	.bank_size = 256,
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
2.18.0

