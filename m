Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1270DABF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 12:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1B210E04E;
	Tue, 23 May 2023 10:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCCE10E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:42:42 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 55C266606E75;
 Tue, 23 May 2023 11:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684838559;
 bh=k5mp+NPuC3+C8fsMCLAcwWhJ5WFcu3o02Q0hZe0dwhM=;
 h=From:To:Cc:Subject:Date:From;
 b=kh9Nd6T/8k3VroYVDmlTaX9A4m+npPH+O9zAx3WHJpRFbk+pgK0L0UUpGM3/Fs4Kn
 OTjzxp0TjpGa0DEVfUchWsh+VDDnBlpQoTHdufvsnfQLl8MaRs/cSywPTY067VrSwe
 GeFKVBhciJSweTohL+O2FGr8iZYTziU0eqXZPZoPl0DqH2+vTTKEf9/EyTCbQ8SA1X
 6NPgp4cGiXEiivriAE7wy6TuQTLRzw1hFpf55St20SMQvlFwbfB6aR2BUu1bqEpMkp
 /FNhW68+w8IHtHpiYTEI37DjUfqtpA8k4smcp820azJ9sKU/YSNIr52QYtwiTTBvE+
 ZWpAw39yMbftQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
Date: Tue, 23 May 2023 12:42:34 +0200
Message-Id: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
later calculation for horizontal sync-active (HSA), back (HBP) and
front (HFP) porches got incorrect due to the logic being inverted.

This means that a number of settings were wrong because....:
 - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
   set in order to disable the End of Transmission packet;
 - Horizontal Sync and Back/Front porches: The delta used to
   calculate all of HSA, HBP and HFP should account for the
   additional EOT packet.

Before this change...
 - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
 - For HSA/HBP/HFP delta... all three were wrong, as words were
   added when EOT disabled, instead of when EOT packet enabled!

Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
MediaTek DSI driver to fix the aforementioned issues.

Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..b0ab38e59db9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		tmp_reg |= HSTX_CKLP_EN;
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
@@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
-	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
+	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
 
 	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
 	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
-- 
2.40.1

