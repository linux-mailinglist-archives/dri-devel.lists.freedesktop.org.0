Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F21A38819
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DD910E51A;
	Mon, 17 Feb 2025 15:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gg2r9hrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6782510E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739807367;
 bh=ILRG7JLcjLGUI329ImFMsEOeEnrgM3T3qZx9A4pBXUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gg2r9hrhUhSyL5I7Egeze6OAy+POXJVEeNylA9jB80Ioj+/4Rb2goIycS13k1c2ep
 gA+IAOafOcNWTYdAmOWMIyRzGp2fsMlw+L3gPEEUvRGg19wFilWfk/bnNYxXsqhhDv
 oY0I6Xle5Fp7W6ajqhanIPb56XhAllIBC2LxmQFu+maNiYij+SCei9AtukUnzXSBl+
 TwAJMhWERip7EZJpUaGlX40AQVV3DQn43aJh/k0HDUbGWCOgHPMSl1goSCCx+zo89f
 exnhFNLat88gW/s7o6lTZadebxJGuAlCW5WioWjXmXUFTq2Sx12eVBhaGTWpICBQUu
 ddcxJWQlTFiEA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D75D417E1568;
 Mon, 17 Feb 2025 16:49:25 +0100 (CET)
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
Subject: [PATCH v7 07/43] drm/mediatek: mtk_dpi: Add support for DPI input
 clock from HDMI
Date: Mon, 17 Feb 2025 16:48:00 +0100
Message-ID: <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
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

On some SoCs, like MT8195 and MT8188, the DPI instance that is
reserved to the HDMI Transmitter uses a different clock topology.

In this case, the DPI is clocked by the HDMI IP, and this outputs
its clock to the MM input of dpi_pixel_clk, which is essential to
enable register access to the DPI IP.

Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
it to avoid enabling the DPI clocks in the mediatek-drm internal
.start() callback (and avoid disabing in the .stop() component
callback): this will make sure that the clock configuration
sequence is respected during display pipeline setup by following
the bridge ops between DPI and HDMI, where the HDMI driver is
expected to enable the clocks in the bridge's pre_enable(), and
DPI in the enable() cb.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9a6c0f75f764..9f83e82437dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -145,6 +145,8 @@ struct mtk_dpi_factor {
                      If present, implies that the feature must be enabled.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
+ * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
+ *		     for DPI registers access.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -165,6 +167,7 @@ struct mtk_dpi_conf {
 	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
+	bool clocked_by_hdmi;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -585,7 +588,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	struct videomode vm = { 0 };
 
 	drm_display_mode_to_videomode(mode, &vm);
-	mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
+
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
@@ -920,14 +925,16 @@ void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_on(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_on(dpi);
 }
 
 void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_off(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_off(dpi);
 }
 
 unsigned int mtk_dpi_encoder_index(struct device *dev)
-- 
2.48.1

