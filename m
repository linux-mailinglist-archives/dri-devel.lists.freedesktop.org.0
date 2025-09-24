Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB26B9971F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57410E6E4;
	Wed, 24 Sep 2025 10:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AFSWeblm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDEE10E147
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758710237;
 bh=VRbbyb2TqGZ2vmUel9UTJU8dUoPtOcrO+Q97F0QNAUo=;
 h=From:To:Cc:Subject:Date:From;
 b=AFSWeblmyZTvXqZuH6q9hrkH5s0gfXBar4a01bue57y1fGC/DaGtkp/t/DXQ9oinq
 unWnG4od1U54jaWI3EeirUBKNi+I4dUDE7u0niGG/l8I6CRA4A6mWKwSj3L9R5qap0
 sD6RjFW+xn0yj0IiVFV4IcRpro3VIqSa2XHkXviZcQ66byosgCmREcICEqwSwoV2DB
 EzaTUPnyY9yFhiZpLsq2FpKkU+kIXqwjrDpyVMAPZjQx0kMV5Yy4AiHYUu4DopJAEo
 9b37lkEqfLiYRvF6AEcOicEISkQcZmgLpYSkTTHqvsxa8Rymty8bR0XVP+yEGD7naX
 H4s655fSBrd8A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F0EA17E068C;
 Wed, 24 Sep 2025 12:37:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dmitry.osipenko@collabora.com, granquet@baylibre.com,
 rex-bc.chen@mediatek.com, ck.hu@mediatek.com, amergnat@baylibre.com,
 djkurtz@chromium.org, littlecvr@chromium.org, bibby.hsieh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH 0/3] drm/mediatek: Fixes: Stale pointer usage and device leak
Date: Wed, 24 Sep 2025 12:37:05 +0200
Message-ID: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
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

A while ago I've found some issues in drm/mediatek and fixed those
but then forgot to send all of the fixes as I was progressing on more.

For whatever reason, I couldn't continue with more fixes and eventually
forgot to send what I had.
Recent series reminded me about those, which we're carrying in the
Collabora MediaTek integration kernel since .. forever, and are tested
on all of the MTK boards that we have in the lab, including MT8173,
MT8183, MT8192, MT8195, MT8188, MT8186 Chromebooks and Genio boards.

The mtk_dp fix was sent months ago, but got ignored - it's included
in this series again anyway.

AngeloGioacchino Del Regno (3):
  drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
  drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
  drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 20 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_dp.c        | 30 ++++++++++++++++++---
 3 files changed, 59 insertions(+), 25 deletions(-)

-- 
2.51.0

