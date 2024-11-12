Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91D9C54C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957A10E279;
	Tue, 12 Nov 2024 10:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="huGsx0N+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E0F10E279
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731408634;
 bh=d0rkJCXmARckOR0ApqbLV71XuCQ8/P+BmXaLUyM+hZI=;
 h=From:To:Cc:Subject:Date:From;
 b=huGsx0N+QXnHFkB+EPH2jUGLA8Dq53UwS++PogGrliWtn0fp5bAnf+l52ny29gc6t
 pCB/zf3krpIjPf+REG+5i4lrLMduo+9Y8iWqpa1NrCqypuwN7E7NR1u50hh/O5BBT0
 Mu3RX7NmQEFUhbB7f8Ix6iIXGSat05fSepWEV1HKa1/JDYSw8ypJetGS/Eq1/Wunhm
 KyyasO+Ssr0QYjlRKFu6XrlHkQ/A2iimAsmC1q/K3iAuxEGKfGvlmi91kPAbE2uz2n
 M1uFDusJpU4xDWVhZY09qgAOlikC27855i5ND+UUrtA43eW5aAjNBJnjYhA98V3ymG
 YOtWfZ79+B1Aw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 108C517E35F0;
 Tue, 12 Nov 2024 11:50:34 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sui.jingfeng@linux.dev, ck.hu@mediatek.com, amergnat@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dan.carpenter@linaro.org
Subject: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
Date: Tue, 12 Nov 2024 11:50:30 +0100
Message-ID: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
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

The struct device_node *next pointer is not initialized, and it is
used in an error path in which it may have never been modified by
function mtk_drm_of_get_ddp_ep_cid().

Since the error path is relying on that pointer being NULL for the
OVL Adaptor and/or invalid component check and since said pointer
is being used in prints for %pOF, in the case that it points to a
bogus address, the print may cause a KP.

To resolve that, initialize the *next pointer to NULL before usage.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;
-- 
2.47.0

