Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7E719B8F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134CC10E546;
	Thu,  1 Jun 2023 12:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782410E537
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:10:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 320E46606EC8;
 Thu,  1 Jun 2023 13:10:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685621432;
 bh=3I8Rjj9QMcA+JJ4/+HINgDnaxJetoJetOg2mGldS5tI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lNvJVaw9Qg3hqwhe1jvPK/WEIfm2kNdvIY/f4JRPTftAwjL/ymp5xhyfWhwG+PYks
 jYddPx5C2kplfkij6My/voJMbPudzafbN2eWdxL66kaC3llR/9DRKZxn2LP36BKCDJ
 nRbqsV2iPLvpKkIwUO0+YF6Gl4YWysPtC6pCpRQOoayp0ECBKI5TH+d1ZD/WlQRyMl
 bAHIIAvexEBNJBmx9+IVNHrPK3uNAF5GItnf5+oUkPvX7e0n2lWbhS7h+6DU3y8j/p
 O9nbZdoSBo0ZK493WH3Hrfxv20LGPBiCs0BgdCldopuIfl3f0M6JIGcLsF7A8ZOv8r
 i92a+xKvl1VWw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 06/11] drm/mediatek: gamma: Use bitfield macros
Date: Thu,  1 Jun 2023 14:10:17 +0200
Message-Id: <20230601121022.2401844-7-angelogioacchino.delregno@collabora.com>
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

Make the code more robust and improve readability by using bitfield
macros instead of open coding bit operations.
While at it, also add a definition for LUT_BITS_DEFAULT.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 41 ++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index b75a77af5205..f4bf5b37992c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
@@ -22,9 +23,16 @@
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
+#define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_GAMMA_LUT				0x0700
 
+#define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
+#define DISP_GAMMA_LUT_10BIT_G			GENMASK(19, 10)
+#define DISP_GAMMA_LUT_10BIT_B			GENMASK(9, 0)
+
 #define LUT_10BIT_MASK				0x03ff
+#define LUT_BITS_DEFAULT			10
 #define LUT_SIZE_DEFAULT			512
 
 struct mtk_disp_gamma_data {
@@ -96,33 +104,33 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	for (i = 0; i < lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
-		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
-		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
+		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
+		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
 
 		if (!lut_diff || (i % 2 == 0)) {
-			word = hwlut.red << 20 +
-			       hwlut.green << 10 +
-			       hwlut.red;
+			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 		} else {
 			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, 10);
+			diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
 
 			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, 10);
+			diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
 
 			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, 10);
+			diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
 
-			word = diff.blue << 20 +
-			       diff.green << 10 +
-			       diff.red;
+			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
 		}
 		writel(word, (lut_base + i * 4));
 	}
 
 	/* Enable the gamma table */
-	cfg_val = cfg_val | GAMMA_LUT_EN;
+	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
 	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
@@ -139,9 +147,12 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+	u32 sz;
+
+	sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
+	sz |= FIELD_PREP(DISP_GAMMA_SIZE_VSIZE, h);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
-		      DISP_GAMMA_SIZE);
+	mtk_ddp_write(cmdq_pkt, sz, &gamma->cmdq_reg, gamma->regs, DISP_GAMMA_SIZE);
 	if (gamma->data && gamma->data->has_dither)
 		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc,
 				      DISP_GAMMA_CFG, GAMMA_DITHERING, cmdq_pkt);
-- 
2.40.1

