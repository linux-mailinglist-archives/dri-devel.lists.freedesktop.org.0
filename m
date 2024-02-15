Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4297855CE2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946110E2E5;
	Thu, 15 Feb 2024 08:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RyN4iV6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6A610E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707987199;
 bh=gSl7FFAcyFkyZu86fmPgJX2VEBYzcNb/7gsEn+fDq54=;
 h=From:To:Cc:Subject:Date:From;
 b=RyN4iV6kEyFZUZDDqUO4zfb0Xu1xdQ2OGWpN3LWM5Vhl1h/PF1pPWYFYYDxyyUMjr
 qZyqHYtqOmcQ9y+ZJ+DR9RgpArK1ZI4oXnCIQHBn5eTwYDXamGZn1sT5mtGdnbHvqc
 H2neXE64sulCGzppMw/hejt50qtRNSMAztVuG+640OyJgbF+sdvebK9IcLXRFZ2Mzx
 mT9A+HlxzyQcqktgAPoObRiQU0Msj40xW7qvqmKjdL3SZApQGJ0e4DqDSC7WD/377l
 iXGSqrGbHQdIcR6kqVjpzmXOcMdGBhqBpYkqsDJE1QLCPz0HT9n2S271+mSSuCHA7t
 vzggWxfanXisw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E41AB37813FD;
 Thu, 15 Feb 2024 08:53:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v6 0/9] MediaTek DRM - DSI driver cleanups
Date: Thu, 15 Feb 2024 09:53:07 +0100
Message-ID: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
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

Changes in v6:
 - Moved default case from patch [4/9] to patch [3/9]

Changes in v5:
 - Changed patch 1 to not fix the DSI_PS_SEL mask for newer SoCs

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

