Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292805B5280
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F3A10E14F;
	Mon, 12 Sep 2022 01:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A757C10E113
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:30:19 +0000 (UTC)
X-UUID: 4d517b8fd4084367bdc079351f799332-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XX+6IlsuNzsukc8x0DXrCumu5LusvDOqqRkIbc2DxN4=; 
 b=YhWQrotJ1d+Z2shXOhu0ixNrBT4A73uwb8+phSrE9FZci3WKomPTmy2u/9MOe78aCnOXww2mmMqA1VZ9Uhy9fmoiBRo4gkIdg6s9EE0N+X+dMjB2XMw+yyFfdquFeDAc3BZc2yXeo/ci4RDFoMy6ZGqIDO0rBRDGT2+BHZNnYLw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:ee9e0d0c-fdbf-4419-9ca7-0ce2b0c82812, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:16d0455d-5ed4-4e28-8b00-66ed9f042fbd,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4d517b8fd4084367bdc079351f799332-20220912
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1460845864; Mon, 12 Sep 2022 09:30:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 09:30:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v3 6/9] drm/mediatek: Add gamma support different
 bank_size for other SoC
Date: Mon, 12 Sep 2022 09:30:03 +0800
Message-ID: <20220912013006.27541-7-jason-jh.lin@mediatek.com>
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

Add multiple bank support for mt8195.
If bank size is 0 which means no bank support.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 +++++++++++++----------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index be82d15a5204..45da2b6206c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -21,6 +21,7 @@
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_LUT				0x0700
 
 #define LUT_10BIT_MASK				0x03ff
@@ -33,6 +34,7 @@ struct mtk_disp_gamma_data {
 	bool lut_diff;
 	u16 lut_size;
 	u8 lut_bits;
+	u16 bank_size;
 };
 
 /*
@@ -75,9 +77,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	bool lut_diff = false;
 	u16 lut_size = LUT_SIZE_DEFAULT;
+	u16 bank_size = lut_size;
 	u8 lut_bits = LUT_BITS_DEFAULT;
 	u8 shift_bits;
-	unsigned int i, reg;
+	unsigned int i, j, reg, bank_num;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	u32 word, mask;
@@ -87,8 +90,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		lut_diff = gamma->data->lut_diff;
 		lut_size = gamma->data->lut_size;
 		lut_bits = gamma->data->lut_bits;
+		bank_size = gamma->data->bank_size;
 	}
 
+	bank_num = lut_size / bank_size;
 	shift_bits = LUT_INPUT_BITS - lut_bits;
 	mask = GENMASK(lut_bits - 1, 0);
 
@@ -98,25 +103,27 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
 		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < lut_size; i++) {
-
-			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> shift_bits) & mask) << 20) +
-					(((lut[i].green >> shift_bits) & mask) << 10) +
-					((lut[i].blue >> shift_bits) & mask);
-			} else {
-				diff[0] = (lut[i].red >> shift_bits) -
-					  (lut[i - 1].red >> shift_bits);
-				diff[1] = (lut[i].green >> shift_bits) -
-					  (lut[i - 1].green >> shift_bits);
-				diff[2] = (lut[i].blue >> shift_bits) -
-					  (lut[i - 1].blue >> shift_bits);
-
-				word = ((diff[0] & mask) << 20) +
-					((diff[1] & mask) << 10) +
-					(diff[2] & mask);
+		for (j = 0; j < bank_num; j++) {
+			writel(j, regs + DISP_GAMMA_BANK);
+			for (i = 0; i < bank_size; i++) {
+				if (!lut_diff || (i % 2 == 0)) {
+					word = (((lut[i].red >> shift_bits) & mask) << 20) +
+						(((lut[i].green >> shift_bits) & mask) << 10) +
+						((lut[i].blue >> shift_bits) & mask);
+				} else {
+					diff[0] = (lut[i].red >> shift_bits) -
+						  (lut[i - 1].red >> shift_bits);
+					diff[1] = (lut[i].green >> shift_bits) -
+						  (lut[i - 1].green >> shift_bits);
+					diff[2] = (lut[i].blue >> shift_bits) -
+						  (lut[i - 1].blue >> shift_bits);
+
+					word = ((diff[0] & mask) << 20) +
+						((diff[1] & mask) << 10) +
+						(diff[2] & mask);
+				}
+				writel(word, (lut_base + i * 4));
 			}
-			writel(word, (lut_base + i * 4));
 		}
 	}
 }
-- 
2.18.0

