Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86580760BD4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF6510E3B0;
	Tue, 25 Jul 2023 07:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EB110E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:32:52 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B60C6606FD7;
 Tue, 25 Jul 2023 08:32:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690270371;
 bh=hHqJCxhzA0NOhvW3sNvZ11fAVEceLOVkRCjEEye+yKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=npAYi+z4wql40aD1QROYJmcM6oHeg8AUjTxpZzqZpdYN0AP4TA99xgNx3d+AmkgHE
 /2RIRRrcLBrz6aYmi6CzHDfVFo1D1anRp9WAE9U3cjRqi07ksFICzqCLY//tpEFRXX
 RH5RGXVTfNZC5cvNIA1rnIwlg1fVW2u8/Htbd6PFcaZQ+/juM06VYKukci3xfqYetl
 dwGQjcjbjgvPaoidOQHbgTbxYzWtErnseCUBYgDZ7PFjPgd5KKxxJ1bUwmCQ2tP9AG
 8pL2LcGhozsJR+XmLF4AdDoPWVT5DIqHk+G/snsa+gtT4JHfUoUnRUnzTo4keEaNeG
 sDZVbEJaXM6bg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v7 05/11] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Date: Tue, 25 Jul 2023 09:32:28 +0200
Message-ID: <20230725073234.55892-6-angelogioacchino.delregno@collabora.com>
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

Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
to function mtk_dp_initialize_aux_settings(), as this is effectively
part of the DPTX AUX setup sequence.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fc6cabf5370b..e8d3bf310608 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1009,6 +1009,11 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
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
@@ -1826,10 +1831,6 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
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
2.41.0

