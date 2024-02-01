Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039884582E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 13:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6613E10ED6D;
	Thu,  1 Feb 2024 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eYf4a29f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77E010ED6F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706791991;
 bh=AiYqxfdfmN8jEke9jGAUzoN6GSbkaeqahTRB/bnjbXA=;
 h=From:To:Cc:Subject:Date:From;
 b=eYf4a29fl7BlgqPMXrORpEyZup6lT/KKme8ccW3IGZkpZ2xSBehBh8MFFv09N7mh9
 JwPXb3xTHwmkcHVYo7LY6fQexTrliD0QAvcJQCFC3I+6C1RfpchwQNa2icK2HCQh+O
 mUFmWV9cXvYPybkckWot0cjw47IEiXUEQzuPkzTJv5kaK4MmxAhjtH0iy2vRJu9Pxj
 0ORfdgPpePj8pFFCUepfGUBOkTh64idLcx12YHp/5oCAcbx008BelXX3DadZd8IuIy
 BSUuVa2jc/bk3kTdU1rj3UwE5HnJsKNrvOTA5xZM64Jn8B7qujwW8JKXtogEroim5f
 Ml5HwSh5mWcVg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6D44378047F;
 Thu,  1 Feb 2024 12:53:10 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, nancy.lin@mediatek.com, nathan.lu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
Subject: [PATCH 0/3] drm/mediatek: Fixes for DDP component search/destroy
Date: Thu,  1 Feb 2024 13:53:01 +0100
Message-ID: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
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

This series performs some cleanups for DDP component CRTC search and
correctly iounmaps the previously of_iomap() calls from drm_ddp_comp.

Tested on MT8195 Cherry Tomato

AngeloGioacchino Del Regno (3):
  drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
  drm/mediatek: Perform iounmap on simple DDP component destruction
  drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal
    helper

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 113 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 3 files changed, 80 insertions(+), 38 deletions(-)

-- 
2.43.0

