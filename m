Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DB4C41CD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1410E39F;
	Fri, 25 Feb 2022 09:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E5210E370
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:54:08 +0000 (UTC)
X-UUID: b6ddab556d1f422484d9e515e4cee17e-20220225
X-UUID: b6ddab556d1f422484d9e515e4cee17e-20220225
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068206144; Fri, 25 Feb 2022 17:54:04 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 25 Feb 2022 17:54:03 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Feb 2022 17:54:02 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 25 Feb 2022 17:54:01 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v1,2/3] drm/mediatek: Add TOPCKGEN select mux control dpi_clk
Date: Fri, 25 Feb 2022 17:53:52 +0800
Message-ID: <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Dpi_clk is controlled by the mux selected
by TOPCKGEN and APMIXEDSYS can support small resolution.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 38 ++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4554e2de1430..bad686817e29 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
 };
 
+enum TVDPLL_CLK {
+	TVDPLL_PLL = 0,
+	TVDPLL_D2 = 2,
+	TVDPLL_D4 = 4,
+	TVDPLL_D8 = 8,
+	TVDPLL_D16 = 16,
+};
+
 struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -73,6 +81,7 @@ struct mtk_dpi {
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
+	struct clk *pclk_src[5];
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -459,6 +468,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	struct videomode vm = { 0 };
 	unsigned long pll_rate;
 	unsigned int factor;
+	struct clk *clksrc = NULL;
 
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
 	factor = dpi->conf->cal_factor(mode->clock);
@@ -473,11 +483,26 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 
 	vm.pixelclock = pll_rate / factor;
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
-	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
-	else
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
+		if (factor == 8)
+			clksrc = dpi->pclk_src[2];
+		else if (factor == 4)
+			clksrc = dpi->pclk_src[1];
+		else
+			clksrc = dpi->pclk_src[1];
+		}
+	else {
+		if (factor == 8)
+			clksrc = dpi->pclk_src[3];
+		else if (factor == 4)
+			clksrc = dpi->pclk_src[2];
+		else
+			clksrc = dpi->pclk_src[2];
+	}
 
+	clk_prepare_enable(dpi->pixel_clk);
+	clk_set_parent(dpi->pixel_clk, clksrc);
+	clk_disable_unprepare(dpi->pixel_clk);
 
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
@@ -893,6 +918,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->pclk_src[1] = devm_clk_get_optional(dev, "tvdpll_d2");
+	dpi->pclk_src[2] = devm_clk_get_optional(dev, "tvdpll_d4");
+	dpi->pclk_src[3] = devm_clk_get_optional(dev, "tvdpll_d8");
+	dpi->pclk_src[4] = devm_clk_get_optional(dev, "tvdpll_d16");
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
-- 
2.18.0

