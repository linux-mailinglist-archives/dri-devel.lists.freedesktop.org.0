Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FE9D3AE5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493310E74A;
	Wed, 20 Nov 2024 12:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MNvVip2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D9D10E743
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732106679;
 bh=T7IOQ+7l/mtswWClwEG6ojzsVDbWhMYo3HEeYKoABqU=;
 h=From:To:Cc:Subject:Date:From;
 b=MNvVip2wFXvEdhkx/l5AuIYHV1wP/iI1G7wAOuMv8kp1doEWfu74YbZ4Eb+k3WIuO
 cXQW0OSkTWetcV7sOJEmdOF2Cu8Zq0zbK8SeOFwANITa4QJO9k60C67cvGu+H7eseu
 1mvi7trEyqlVHP2WBzRdWa8NB4B07VaKneMq5FFuWD6+IxCp7RVdE03aqksDLRxO2B
 FjyeKLbtujpWTQsth+ybP2zUIbGCyC+bepGsImg+KN6d3ZRePBpBfUS67FtAmhMznq
 q/uezROC7WHcLGgnnh8Hu3lHAjFlcDt7NShHirZyk1FvXqCPeHAo8AOZVms60Q3Ye3
 h0LSuLFAH3+0g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 61C2117E3661;
 Wed, 20 Nov 2024 13:44:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v1 0/6] drm/mediatek: dpi: Add support for MT8195/8188 and
 Pattern Generator
Date: Wed, 20 Nov 2024 13:44:14 +0100
Message-ID: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
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

Add support for the direct connection DPI found in MT8195 and MT8188 SoCs.

Bonus in this series is the addition of support for the Pattern Generator
found in the DPI HW: since I needed this for debugging during development,
I had to code in the actual support bits and it looked like a waste of
time to just remove it.
I instead decided to clean it up and upstream it, as this will anyway come
handy for multiple things, of which the most important (imo) are:
 - Adding support for new SoCs in the future will be less time consuming
   as this driver already has the pattern generator in;
 - CI Testing might be able to make use of this to validate that the
   data that comes out is not garbled (so, to help testing display
   support in an automated manner).

AngeloGioacchino Del Regno (6):
  dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
  drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
  drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
  drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
  drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
  drm/mediatek: Add support for MT8195 Digital Parallel Interface

 .../display/mediatek/mediatek,dpi.yaml        |   5 +
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 311 +++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 4 files changed, 252 insertions(+), 76 deletions(-)

-- 
2.47.0

