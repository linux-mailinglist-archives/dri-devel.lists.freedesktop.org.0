Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E059E760BCE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8225510E3AD;
	Tue, 25 Jul 2023 07:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7810E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:32:48 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE8106607105;
 Tue, 25 Jul 2023 08:32:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690270367;
 bh=UxJIucVDAWGMbZsVbKjD2E/6cJnPX0LdsT06i3DZxik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YW3anaAj7ptZfarIiyPRoDecQCMcNbYlxkGGh5CU4bz6SPe94Zao8/ciXWnBZ9ULd
 dByyJ/wHMOcMYtiuhM/cTo2Q0v74tvh15Dgvl35xTm5C3AQmo6jJlux/DqCDqiELWj
 Xl2mtdgPPmHrrc/xNKwqP2LmuMzpParND7W0GF/Mo9rp7zmyHtwu+TeXOiDL/Laaev
 JY18VzL4HiSypdUpc4gzpD+oNISP5HxwXmgb8T57QVeb9bSbef5/46wuYWl+dDUr5a
 Hw+nt0Cw97usTttpPQhBrRbXfXk3ND0qTzC6qdTvyPQOYsL9lGtzXmm4c+A0NXgQJp
 71CFG73YOthuw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v7 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Date: Tue, 25 Jul 2023 09:32:24 +0200
Message-ID: <20230725073234.55892-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If reading the RX capabilities fails the training pattern will be set
wrongly: add error checking for drm_dp_read_dpcd_caps() and return if
anything went wrong with it.

While at it, also add a less critical error check when writing to
clear the ESI0 IRQ vector.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..c58b775877a3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1588,7 +1588,9 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	u8 val;
 	ssize_t ret;
 
-	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
+	ret = drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
+	if (ret < 0)
+		return ret;
 
 	if (drm_dp_tps4_supported(mtk_dp->rx_cap))
 		mtk_dp->train_info.channel_eq_pattern = DP_TRAINING_PATTERN_4;
@@ -1615,10 +1617,13 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 			return ret == 0 ? -EIO : ret;
 		}
 
-		if (val)
-			drm_dp_dpcd_writeb(&mtk_dp->aux,
-					   DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
-					   val);
+		if (val) {
+			ret = drm_dp_dpcd_writeb(&mtk_dp->aux,
+						 DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
+						 val);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.41.0

