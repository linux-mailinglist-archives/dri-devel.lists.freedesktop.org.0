Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A884CD4F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BD2113293;
	Wed,  7 Feb 2024 14:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oF4PmVlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4821010EE99
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707317604;
 bh=t314JYLEkG/5o9HpK7I9qR3Mx0x17vEhEBxIxc/bWK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oF4PmVlLOMnmfRKhI8wyvjtZ3sH/fa/3SrHXuaP6e3Mt4yv/Q3OKS1J9GSOuywgM0
 vlsP197c+IMOPSCPdiQZGi+othum7S8Y+zr/jzNt+mc6SIYlp7LMCAFHrk4Uy72alm
 JNVaOwzNowWBeE4RtrbJ8MMMZl9ugfOBdLrh+USCt+AqLSk5DDw7OcZOBa80SuZeqQ
 m1oHMSMmts2NOcg+w5/igadWrpU/Wyt9JUnOrz6kve0ctieqPYyppGkvEqIICeG/T4
 sihnDa35bP8mRMYrRaCFF8b+AiP+ELenXwq5YKo4l0rNFPuMpZYVYZLSlIIOACS8rW
 OGAc9ncs4fqHA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4A925378207B;
 Wed,  7 Feb 2024 14:53:23 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 9/9] drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp()
 helper function
Date: Wed,  7 Feb 2024 15:53:07 +0100
Message-ID: <20240207145307.1626009-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
References: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b644505de98a..9501f4019199 100644
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

