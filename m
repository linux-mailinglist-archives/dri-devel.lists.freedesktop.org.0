Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E7566996
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AB911240E;
	Tue,  5 Jul 2022 11:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3350D10E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:25:39 +0000 (UTC)
X-UUID: d15fdab4606244ff822c8f542a7472f6-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:7f422703-0c95-4a9c-ba81-549e013d5603, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:a0a47563-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: d15fdab4606244ff822c8f542a7472f6-20220705
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1818336431; Tue, 05 Jul 2022 18:25:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 18:25:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 5 Jul 2022 18:25:33 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v16 4/5] drm/mediatek: dpi: Add pixels_per_iter config support
Date: Tue, 5 Jul 2022 18:25:29 +0800
Message-ID: <20220705102530.1344-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
References: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
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

The quantity of output for one iteration could be different for dpi and
dp_intf. For dp_intf, it's 4 pixels for one iteration it's 1 pixel for one
iteration for dpi. Therefore, we add a new config "pixels_per_iter" to
control quantity of transferred pixels per iteration.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a1dcb3089c3a..5f71a68c6a0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_yc_limit {
  * @channel_swap_shift: Shift value of channel swap.
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
+ * @pixels_per_iter: Quantity of transferred pixels per iteration.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -149,6 +150,7 @@ struct mtk_dpi_conf {
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
+	u32 pixels_per_iter;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -522,7 +524,14 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	clk_set_rate(dpi->tvd_clk, pll_rate);
 	pll_rate = clk_get_rate(dpi->tvd_clk);
 
+	/*
+	 * Depending on the IP version, we may output a different amount of
+	 * pixels for each iteration: divide the clock by this number and
+	 * adjust the display porches accordingly.
+	 */
 	vm.pixelclock = pll_rate / factor;
+	vm.pixelclock /= dpi->conf->pixels_per_iter;
+
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
 	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
@@ -541,9 +550,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
 	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
-	hsync.sync_width = vm.hsync_len;
-	hsync.back_porch = vm.hback_porch;
-	hsync.front_porch = vm.hfront_porch;
+
+	/*
+	 * Depending on the IP version, we may output a different amount of
+	 * pixels for each iteration: divide the clock by this number and
+	 * adjust the display porches accordingly.
+	 */
+	hsync.sync_width = vm.hsync_len / dpi->conf->pixels_per_iter;
+	hsync.back_porch = vm.hback_porch / dpi->conf->pixels_per_iter;
+	hsync.front_porch = vm.hfront_porch / dpi->conf->pixels_per_iter;
+
 	hsync.shift_half_line = false;
 	vsync_lodd.sync_width = vm.vsync_len;
 	vsync_lodd.back_porch = vm.vback_porch;
@@ -852,6 +868,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -869,6 +886,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -885,6 +903,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
@@ -901,6 +920,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.support_direct_pin = true,
-- 
2.18.0

