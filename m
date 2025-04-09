Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3EA825A8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AE210E891;
	Wed,  9 Apr 2025 13:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e50j5eX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497CD10E88F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204393;
 bh=gv/6AiDijBd6gkSOSp+4FGoCW0Yre06suda1+c6HY/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e50j5eX2hKm9wWpetsGKUlhD+hBnvlEGRbi63E9U+64jKCA68ogjnsPuyo0TWIzpC
 5B7+EcQi83k5bVSP0I0M771pFyTcNjIyz9Qw6KrH4/NbCjdonXTiZ1eVJzsnfjllL1
 byG4nUrVhnVhy5ynpOnGiBoIx830ruuaZzUJw4F0GVFhGSngnkFBCIcrDP4+fxyDK5
 EufFyCXF06BIazjixQjj/W/xhNV52XlNb+y7pmqceWm400qiAPbFqKKZ1EAMPXEgmk
 LAY0kef2QNNWRJIMpMTIzy093FYTpXgNOPE5w2xqr3bsz9ZakQM9nDsun7xjqIowp9
 3PC+oOCANwfgw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D132E17E0809;
 Wed,  9 Apr 2025 15:13:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: [PATCH v1 1/5] drm/mediatek: mtk_dpi: Use switch in
 mtk_dpi_config_color_format()
Date: Wed,  9 Apr 2025 15:13:02 +0200
Message-ID: <20250409131306.108635-2-angelogioacchino.delregno@collabora.com>
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

In preparation for adding support for an additional color format,
convert the format conditional in mtk_dpi_config_color_format()
to a switch.
This also makes the concept of RGB being the default color format
a little more human readable.

This commit brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0fd13e6dd3f1..d735398e97f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -452,7 +452,8 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 {
 	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 
-	if (format == MTK_DPI_COLOR_FORMAT_YCBCR_422) {
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
 
@@ -463,11 +464,14 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		mtk_dpi_mask(dpi, DPI_MATRIX_SET, dpi->mode.hdisplay <= 720 ?
 			     MATRIX_SEL_RGB_TO_BT601 : MATRIX_SEL_RGB_TO_JPEG,
 			     INT_MATRIX_SEL_MASK);
-	} else {
+		break;
+	default:
+	case MTK_DPI_COLOR_FORMAT_RGB:
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
+		break;
 	}
 }
 
-- 
2.49.0

