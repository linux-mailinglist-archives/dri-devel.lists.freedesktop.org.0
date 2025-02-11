Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A295A30A0C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6547510E683;
	Tue, 11 Feb 2025 11:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="plYKCo3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85010E680
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739273672;
 bh=J0oNWkSjU3esAvk60NT4VzP6xVGBmMzphYZ9wznRnJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=plYKCo3LNHyD62AMZjQgeeyvMS5aDOpslIFygPXtA2Gg4W9zxPG9CsIskKNuaANI8
 y+aYuLtLxyI+Fu7UNuxwf/7jMk570IcPqcl6OFRDEIjD169HNCo7o9ID8DoR48mwJb
 JdQctxk++UlE4y/odMjT3Np34BJ4Uv6XlIUXsQ0JWWzaMMW6h4YNQDqUuPnEr7vBbZ
 yOAeyILFfsu4TDb9ShwXebfeauRz19r3QuId8mDOuqWEW1hdqtiyq0hLlsaR3gaHdV
 AWfI/17PTC2bmBlmewvR8IAogo/cjZZx/D7Xbu9ugfaS6DAxs/F+NHMAlAckYA/mUl
 hjf3TESGx493w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F48F17E1551;
 Tue, 11 Feb 2025 12:34:31 +0100 (CET)
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
Subject: [PATCH v6 08/42] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and
 conversion
Date: Tue, 11 Feb 2025 12:33:35 +0100
Message-ID: <20250211113409.1517534-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
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

On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
(afifo) supports outputting either one or two pixels per round
regardless of the input being 1T1P or 1T2P.

Add a `output_1pixel` member to struct mtk_dpi_conf which, if
set, will enable outputting one pixel per clock.

In case the input is two pixel per clock (1T2P), the AFIFO HW
will automatically (and internally) convert it to 1T1P.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6493c7e2fae4..5c15c8935916 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -148,6 +148,8 @@ struct mtk_dpi_factor {
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
  *		     for DPI registers access.
+ * @output_1pixel: Enable outputting one pixel per round; if the input is two pixel per
+ *                 round, the DPI hardware will internally transform it to 1T1P.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -170,6 +172,7 @@ struct mtk_dpi_conf {
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
 	bool clocked_by_hdmi;
+	bool output_1pixel;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -655,7 +658,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	if (dpi->conf->support_direct_pin) {
 		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 		mtk_dpi_config_2n_h_fre(dpi);
-		mtk_dpi_dual_edge(dpi);
+
+		/* DPI can connect to either an external bridge or the internal HDMI encoder */
+		if (dpi->conf->output_1pixel)
+			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
+		else
+			mtk_dpi_dual_edge(dpi);
+
 		mtk_dpi_config_disable_edge(dpi);
 	}
 	if (dpi->conf->input_2p_en_bit && dpi->conf->input_2pixel) {
-- 
2.48.1

