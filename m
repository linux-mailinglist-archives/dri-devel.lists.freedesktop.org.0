Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A165562A10
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668110F5E3;
	Fri,  1 Jul 2022 03:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8E010F452
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:58:56 +0000 (UTC)
X-UUID: 309504dc80324e1a914d7c71412a85f6-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:50566dfc-3289-4730-847a-1ae703e5dcc5, OB:10,
 L
 OB:10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:90
X-CID-INFO: VERSION:1.1.7, REQID:50566dfc-3289-4730-847a-1ae703e5dcc5, OB:10,
 LOB
 :10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:90
X-CID-META: VersionHash:87442a2, CLOUDID:f51751d6-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:608f0ff69aba,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 309504dc80324e1a914d7c71412a85f6-20220701
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674652968; Fri, 01 Jul 2022 11:58:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 11:58:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 11:58:48 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v15 13/16] drm/mediatek: dpi: Add YUV422 output support
Date: Fri, 1 Jul 2022 11:58:42 +0800
Message-ID: <20220701035845.16458-14-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
YUV422 output format is used for 4K resolution.

To support this, it is also needed to support color format transfer.
Color format transfer is a new feature for both dpi and dpintf of MT8195.

The input format could be RGB888 and output format for dp_intf should be
YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to update the
DPI_MATRIX_SET register depending on the color format.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 61 +++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  6 +++
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 3085033becbd..0a604bf68b1b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -54,7 +54,8 @@ enum mtk_dpi_out_channel_swap {
 };
 
 enum mtk_dpi_out_color_format {
-	MTK_DPI_COLOR_FORMAT_RGB
+	MTK_DPI_COLOR_FORMAT_RGB,
+	MTK_DPI_COLOR_FORMAT_YCBCR_422
 };
 
 struct mtk_dpi {
@@ -122,6 +123,7 @@ struct mtk_dpi_yc_limit {
  * @num_output_fmts: Quantity of supported output formats.
  * @is_ck_de_pol: Support CK/DE polarity.
  * @swap_input_support: Support input swap function.
+ * @color_fmt_trans_support: Enable color format transfer.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
  * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
@@ -138,6 +140,7 @@ struct mtk_dpi_conf {
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
 	bool swap_input_support;
+	bool color_fmt_trans_support;
 	u32 dimension_mask;
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
@@ -406,15 +409,54 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
+			       enum mtk_dpi_out_color_format format)
+{
+	u32 matrix_sel;
+
+	if (!dpi->conf->color_fmt_trans_support) {
+		dev_info(dpi->dev, "matrix_sel is not supported.\n");
+		return;
+	}
+
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
+		/*
+		 * If height is smaller than 720, we need to use RGB_TO_BT601
+		 * to transfer to yuv422. Otherwise, we use RGB_TO_JPEG.
+		 */
+		if (dpi->mode.hdisplay <= 720)
+			matrix_sel = MATRIX_SEL_RGB_TO_BT601;
+		else
+			matrix_sel = MATRIX_SEL_RGB_TO_JPEG;
+		break;
+	default:
+		matrix_sel = MATRIX_SEL_RGB_TO_JPEG;
+		break;
+	}
+	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
-	/* only support RGB888 */
-	mtk_dpi_config_yuv422_enable(dpi, false);
-	mtk_dpi_config_csc_enable(dpi, false);
-	if (dpi->conf->swap_input_support)
-		mtk_dpi_config_swap_input(dpi, false);
-	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
+	if (format == MTK_DPI_COLOR_FORMAT_YCBCR_422) {
+		mtk_dpi_config_yuv422_enable(dpi, true);
+		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, true);
+		else
+			dev_warn(dpi->dev,
+				 "Failed to swap input, hw is not supported.\n");
+		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
+	} else {
+		mtk_dpi_config_yuv422_enable(dpi, false);
+		mtk_dpi_config_csc_enable(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
+		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
+	}
 }
 
 static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
@@ -649,7 +691,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
 	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422;
+	else
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 3a02fabe1662..9ce300313f3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -217,4 +217,10 @@
 
 #define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
+
+#define DPI_MATRIX_SET		0xB4
+#define INT_MATRIX_SEL_MASK		GENMASK(4, 0)
+#define MATRIX_SEL_RGB_TO_JPEG		0
+#define MATRIX_SEL_RGB_TO_BT601		2
+
 #endif /* __MTK_DPI_REGS_H */
-- 
2.18.0

