Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B310BA38812
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755A10E513;
	Mon, 17 Feb 2025 15:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UcXQ+uPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398510E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739807362;
 bh=I77jDF1ziftcZjTwI5+7zt4jFbJECEtb5AHTmKIo4OM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UcXQ+uPnyz3eAORUhEshbrer6uDfF/1bXH6ybczx4K+lG5kANhJqt3idZkrHLKszL
 yrANT5ejOBtF/LhV9l2MRvqpI+KP2bUyxzTOHBbNa81wCiEi+vKz5ZXeSGycm/Cf8D
 bSHss8WGIsCPwAs47VFKxbVTd1cOcXesus0hJ2J2m0aNwHtvr/9VEQK9hrSIXUcrf9
 G65QaukbfjqMXkbBj3SVdNTtI0s5paaJI5OlFr6LBj2wz92vUQ8/0Yo/wNssTO9uEM
 OHnhp3mSPYiQu+07GoPDALR2Y5MvNdG/0GSTA66RMz73LfqIPGPNJEgVocBm9PJNir
 BTNmoXrTciwWw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BE7C17E154C;
 Mon, 17 Feb 2025 16:49:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v7 04/43] drm/mediatek: mtk_dpi: Move pixel clock setting flow
 to function
Date: Mon, 17 Feb 2025 16:47:57 +0100
Message-ID: <20250217154836.108895-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding support for the DPI IP found in MT8195
and in MT8188 used for HDMI, move the code flow for calculation
and setting of the DPI pixel clock to a separate function called
mtk_dpi_set_pixel_clk().

This was done because, on those platforms, the DPI instance that
is used for HDMI will get its pixel clock from the HDMI clock,
hence it is not necessary, nor desirable, to calculate or set
the pixel clock in DPI.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 43 +++++++++++++++++-------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 41fdc193891a..59c2e4f32a61 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -537,26 +537,17 @@ static unsigned int mtk_dpi_calculate_factor(struct mtk_dpi *dpi, int mode_clk)
 	return dpi_factor[dpi->conf->num_dpi_factor - 1].factor;
 }
 
-static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
-				    struct drm_display_mode *mode)
+static void mtk_dpi_set_pixel_clk(struct mtk_dpi *dpi, struct videomode *vm, int mode_clk)
 {
-	struct mtk_dpi_polarities dpi_pol;
-	struct mtk_dpi_sync_param hsync;
-	struct mtk_dpi_sync_param vsync_lodd = { 0 };
-	struct mtk_dpi_sync_param vsync_leven = { 0 };
-	struct mtk_dpi_sync_param vsync_rodd = { 0 };
-	struct mtk_dpi_sync_param vsync_reven = { 0 };
-	struct videomode vm = { 0 };
 	unsigned long pll_rate;
 	unsigned int factor;
 
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
 	factor = mtk_dpi_calculate_factor(dpi, mode_clk);
-	drm_display_mode_to_videomode(mode, &vm);
-	pll_rate = vm.pixelclock * factor;
+	pll_rate = vm->pixelclock * factor;
 
 	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
-		pll_rate, vm.pixelclock);
+		pll_rate, vm->pixelclock);
 
 	clk_set_rate(dpi->tvd_clk, pll_rate);
 	pll_rate = clk_get_rate(dpi->tvd_clk);
@@ -566,20 +557,34 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	 * pixels for each iteration: divide the clock by this number and
 	 * adjust the display porches accordingly.
 	 */
-	vm.pixelclock = pll_rate / factor;
-	vm.pixelclock /= dpi->conf->pixels_per_iter;
+	vm->pixelclock = pll_rate / factor;
+	vm->pixelclock /= dpi->conf->pixels_per_iter;
 
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
 	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
+		clk_set_rate(dpi->pixel_clk, vm->pixelclock * 2);
 	else
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+		clk_set_rate(dpi->pixel_clk, vm->pixelclock);
 
-
-	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
+	vm->pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
-		pll_rate, vm.pixelclock);
+		pll_rate, vm->pixelclock);
+}
+
+static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
+				    struct drm_display_mode *mode)
+{
+	struct mtk_dpi_polarities dpi_pol;
+	struct mtk_dpi_sync_param hsync;
+	struct mtk_dpi_sync_param vsync_lodd = { 0 };
+	struct mtk_dpi_sync_param vsync_leven = { 0 };
+	struct mtk_dpi_sync_param vsync_rodd = { 0 };
+	struct mtk_dpi_sync_param vsync_reven = { 0 };
+	struct videomode vm = { 0 };
+
+	drm_display_mode_to_videomode(mode, &vm);
+	mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
-- 
2.48.1

