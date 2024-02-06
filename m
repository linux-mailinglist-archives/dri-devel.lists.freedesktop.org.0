Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39C84B475
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31314112B18;
	Tue,  6 Feb 2024 12:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ORy0tUp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5D112B1B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707221272;
 bh=Mv6zf86XoMmKd7NcYaO5kG+cRiZYMBMgYxftUMxYBJE=;
 h=From:To:Cc:Subject:Date:From;
 b=ORy0tUp0WLvNg2y025fU0e1/OBcibOUv+i13OzSeb+EpmrAgEFen9ZCVyeHqx+cJP
 81dwl8H1W9dPWiOtLMAbuVC3bPH0sdv4MNAtfJ0XfLSBbZ0huLbvwDenbjz7U9vxxS
 10hrbxkb1qOFkOBKa17Y393/WEHrKHWTcMyU5E70DkAUugg01RKjQKt4KfE1kSom1t
 5+mtVQwQTuc4YnaIN55KJLyTdnm7TRkvaWgdy0s/lLob2D83ypjiJPV1Lsq2Vl2Rdg
 ApXKcBmTbyXw9ydDjUuBsdOuYCM8bF88ffDeFouow+OIZHPtrFcyEWyX9UF+gCdSr6
 SB/gZ3EIswHNA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBA4B3781F8E;
 Tue,  6 Feb 2024 12:07:51 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v4 0/9] MediaTek DRM - DSI driver cleanups
Date: Tue,  6 Feb 2024 13:07:39 +0100
Message-ID: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Changes in v4:
 - Added a fix for RGB666 formats setting and for wrong register
   definitions for packed vs loosely packed formats
 - Added a commit to make use of mipi_dsi_pixel_format_to_bpp() helper
   instead of open coding the same

Changes in v3:
 - Rebased over next-20240131
 - Added bitfield.h inclusion in patch 3
 - Added three more cleanup commits to the mix to simplify
   the probe function and remove gotos.

Changes in v2:
 - Rebased over next-20231213

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

AngeloGioacchino Del Regno (9):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
  drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
  drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
  drm/mediatek: dsi: Compress of_device_id entries and add sentinel
  drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function

 drivers/gpu/drm/mediatek/mtk_dsi.c | 310 ++++++++++++-----------------
 1 file changed, 126 insertions(+), 184 deletions(-)

-- 
2.43.0

