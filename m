Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015FA825A4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081610E88C;
	Wed,  9 Apr 2025 13:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oFDUDqXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EAE10E88C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204394;
 bh=pQbgxTHUSndGNceRAo7lyCtBFDwzO+1qKqjpMO19XNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oFDUDqXQGhUNRTx4Ub8V+URTI2v16LvKKB0f0CoaRT6KxgIucCSSzcoShvKWiOQSJ
 1WAbypQYkPBjcvXpcuMt7x4wlh8IVNTqG6zDsVkzXy6nzOH6+KBbmJr3amNgX4Bksq
 Ab/PEnipUeyPLPFI62WHk0uTC4fp74REV7W2t5IeZgsSrijZLus3UQo8VfmUlK2SXG
 wI+zM57t7CFi09YcbVzgINGWFrswop7vssaqfi+9F1D5S/EZzFv75C6FAAI63kDrBi
 5hpM42crND+tIiBG11xZO07azJjJ5RlIqW5typCSRLYbSUBhh05sOZnoVSKXfsMWhW
 hwQ22xxlGfY4A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CE23417E09BF;
 Wed,  9 Apr 2025 15:13:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: [PATCH v1 2/5] drm/mediatek: mtk_dpi: Add local helpers for bus
 format parameters
Date: Wed,  9 Apr 2025 15:13:03 +0200
Message-ID: <20250409131306.108635-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
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

In preparation for adding support for additional color formats,
add local helpers to map media bus format parameters to this
driver's bit_num, channel_swap and color_format.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 46 ++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d735398e97f8..5a66dfe3ad40 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -738,6 +738,43 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static unsigned int mtk_dpi_bus_fmt_bit_num(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_BIT_NUM_8BITS;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_channel_swap(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_color_format(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+		return MTK_DPI_COLOR_FORMAT_RGB;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_COLOR_FORMAT_YCBCR_422;
+	}
+}
+
 static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_bridge_state *bridge_state,
 				       struct drm_crtc_state *crtc_state,
@@ -757,13 +794,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->output_bus_cfg.format);
 
 	dpi->output_fmt = out_bus_format;
-	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
-	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	dpi->bit_num = mtk_dpi_bus_fmt_bit_num(out_bus_format);
+	dpi->channel_swap = mtk_dpi_bus_fmt_channel_swap(out_bus_format);
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422;
-	else
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	dpi->color_format = mtk_dpi_bus_fmt_color_format(out_bus_format);
 
 	return 0;
 }
-- 
2.49.0

