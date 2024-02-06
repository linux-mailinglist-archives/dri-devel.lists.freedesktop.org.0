Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8384B478
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B98112B1F;
	Tue,  6 Feb 2024 12:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ovKTn1GK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE7112B19
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707221281;
 bh=VDX7AhydHRhOSNhBFLKBelqucKRnbrmvRDj7DrUlgD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovKTn1GKOsdkDSM+//FcNhut09sz3Y7AB4VMOlss3fZuDyOJlgSLR7BO0W31sAuaf
 /HRQf1sKvXb/0Pcgfgz6zPapjGDbA4gAXZjJBe+hBdosMqJ0tXXWwS+olIZ3xvvjqV
 SiWZ0XcpY+Ekt1+ImYNbsUW8onjPDewkEF4ynIHvpQkIF2TcnkZi/aZW3UeFS1cOa/
 L2r7FSNTkn5WG+8jiPanSXTWS5VuHkQSa7x2MkkjjFunxk0vtqBOYo7924Ec2G89kQ
 7/5rmw0XDsx0vphhDY+9ybiU8fk2A1esKbiB6EQu7IFrvNADy1XmqvdUNLLtJHzKIW
 myMD7PJXK4bow==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DEAB63781F8E;
 Tue,  6 Feb 2024 12:08:00 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v4 9/9] drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp()
 helper function
Date: Tue,  6 Feb 2024 13:07:48 +0100
Message-ID: <20240206120748.136610-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
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

Instead of open coding, use the mipi_dsi_pixel_format_to_bpp() helper
function from drm_mipi_dsi.h in mtk_dsi_poweron() and for validation
in mtk_dsi_bridge_mode_valid().

Note that this function changes the behavior of this driver: previously,
in case of unknown formats, it would (wrongly) assume that it should
account for a 24-bits format - now it will return an error and refuse
to set clocks and/or enable the DSI.

This is done because setting the wrong data rate will only produce a
garbage output that the display will misinterpret both because this
driver doesn't actually provide any extra-spec format support and/or
because the data rate (hence, the HS clock) will be wrong.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 545c5cc071d9..d844a0500e2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -598,19 +598,12 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	if (++dsi->refcount != 1)
 		return 0;
 
-	switch (dsi->format) {
-	case MIPI_DSI_FMT_RGB565:
-		bit_per_pixel = 16;
-		break;
-	case MIPI_DSI_FMT_RGB666_PACKED:
-		bit_per_pixel = 18;
-		break;
-	case MIPI_DSI_FMT_RGB666:
-	case MIPI_DSI_FMT_RGB888:
-	default:
-		bit_per_pixel = 24;
-		break;
+	ret = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (ret < 0) {
+		dev_err(dev, "Unknown MIPI DSI format %d\n", dsi->format);
+		return ret;
 	}
+	bit_per_pixel = ret;
 
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
@@ -793,12 +786,11 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-	u32 bpp;
+	int bpp;
 
-	if (dsi->format == MIPI_DSI_FMT_RGB565)
-		bpp = 16;
-	else
-		bpp = 24;
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0)
+		return MODE_ERROR;
 
 	if (mode->clock * bpp / dsi->lanes > 1500000)
 		return MODE_CLOCK_HIGH;
-- 
2.43.0

