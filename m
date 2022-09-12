Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80A35B527A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0677C10E12B;
	Mon, 12 Sep 2022 01:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC0110E110
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:30:16 +0000 (UTC)
X-UUID: 4bf7a78eee9049b6a57c1ce89f2790e3-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FArvZRmhdBvQysQdV1ORcIphRl/jyjsmb1ylCr+tMuo=; 
 b=ckMkSobBWPVCLk+o1+FH1PSzsvUA/9alMnCdoedY1dfbZPg4eHjKuyx8tGLMjdgiYszxPCnbaTsFVULBWUWIeaIcjQ1UYtdKWBYsbWvdh9CFZedwlqyoRnbkcYHFOa/zXzu0KWi6LvCraTEoS4fKDlukLZjMJhvuE6RMyLQGpio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:9b416025-460c-4ec8-aec6-b63619b917b7, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:f5d00dec-2856-4fce-b125-09d4c7ebe045,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4bf7a78eee9049b6a57c1ce89f2790e3-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 339601864; Mon, 12 Sep 2022 09:30:12 +0800
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
Subject: [PATCH RESEND v3 5/9] drm/mediatek: Add gamma support different
 lut_bits for other SoC
Date: Mon, 12 Sep 2022 09:30:02 +0800
Message-ID: <20220912013006.27541-6-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add lut_bits in gamma driver data for each SoC and adjust the usage
of lut_bits in mtk_drm_gamma_set_common().

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 0a1022032b71..be82d15a5204 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -25,11 +25,14 @@
 
 #define LUT_10BIT_MASK				0x03ff
 #define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
+#define LUT_BITS_DEFAULT			10
+#define LUT_INPUT_BITS				16 /* input lut bit from application */
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	bool lut_diff = false;
 	u16 lut_size = LUT_SIZE_DEFAULT;
+	u8 lut_bits = LUT_BITS_DEFAULT;
+	u8 shift_bits;
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	u32 word;
+	u32 word, mask;
 	u32 diff[3] = {0};
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
 		lut_size = gamma->data->lut_size;
+		lut_bits = gamma->data->lut_bits;
 	}
 
+	shift_bits = LUT_INPUT_BITS - lut_bits;
+	mask = GENMASK(lut_bits - 1, 0);
+
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
@@ -92,17 +101,20 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		for (i = 0; i < lut_size; i++) {
 
 			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-					(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-					((lut[i].blue >> 6) & LUT_10BIT_MASK);
+				word = (((lut[i].red >> shift_bits) & mask) << 20) +
+					(((lut[i].green >> shift_bits) & mask) << 10) +
+					((lut[i].blue >> shift_bits) & mask);
 			} else {
-				diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-				diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-				diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
-
-				word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-					((diff[1] & LUT_10BIT_MASK) << 10) +
-					(diff[2] & LUT_10BIT_MASK);
+				diff[0] = (lut[i].red >> shift_bits) -
+					  (lut[i - 1].red >> shift_bits);
+				diff[1] = (lut[i].green >> shift_bits) -
+					  (lut[i - 1].green >> shift_bits);
+				diff[2] = (lut[i].blue >> shift_bits) -
+					  (lut[i - 1].blue >> shift_bits);
+
+				word = ((diff[0] & mask) << 20) +
+					((diff[1] & mask) << 10) +
+					(diff[2] & mask);
 			}
 			writel(word, (lut_base + i * 4));
 		}
@@ -209,11 +221,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
 	.lut_size = 512,
+	.lut_bits = 10,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
 	.lut_size = 512,
+	.lut_bits = 10,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-- 
2.18.0

