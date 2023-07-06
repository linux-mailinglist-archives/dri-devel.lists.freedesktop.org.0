Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59195749BC4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858F10E3EA;
	Thu,  6 Jul 2023 12:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0CA10E447
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:30:38 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D2FED6606FC4;
 Thu,  6 Jul 2023 13:30:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688646637;
 bh=ZoMduMOyhFGLpq32e7smW1OgDxFAiDhe86tDwqNFVyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZbJh7Objy5rebfeCtn91lhCxvUHElbhzTrM64pU1PV1nJIzAN9coGciR1/BRWjYTG
 9j8yHLRMp4nBWT8YJgSYl37SZ+NEyQbGyghhECgjmutitaLpikGwq3eQljBmCOFPoF
 h++L+P5mOGlAmCBZBDgvP42+8Rm9b71zkNKzFeYm1R8F96Bn65D4tZoN2ss1QogaWy
 VZmIF+DBm0Gx0XGHGXhYqrF2By58+LBhU3P2uP3uVHwP8NdgmjTEJEnJ/TKKZ02deK
 y1XXoNualdeUyJEYJK0DI2fm67tbZQxMkXZYjgoX9gl2bxdyO0Dhoe+/VyXrn02dsu
 6swOpVmjeynWQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v4 8/9] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Date: Thu,  6 Jul 2023 14:30:24 +0200
Message-Id: <20230706123025.208408-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
to function mtk_dp_initialize_aux_settings(), as this is effectively
part of the DPTX AUX setup sequence.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 6bc620aded45..2ad836fbb7c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1011,6 +1011,11 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_37C8,
 			   MTK_ATOP_EN_AUX_TX_P0,
 			   MTK_ATOP_EN_AUX_TX_P0);
+
+	/* Set complete reply mode for AUX */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0,
+			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0);
 }
 
 static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
@@ -1823,10 +1828,6 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_initialize_settings(mtk_dp);
 	mtk_dp_initialize_aux_settings(mtk_dp);
 	mtk_dp_initialize_digital_settings(mtk_dp);
-
-	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
-			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0,
-			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0);
 	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
 
 	mtk_dp_digital_sw_reset(mtk_dp);
-- 
2.40.1

