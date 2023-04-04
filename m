Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8716D5DFC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE95710E192;
	Tue,  4 Apr 2023 10:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7707510E659
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:48:13 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B47AF6603248;
 Tue,  4 Apr 2023 11:48:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680605292;
 bh=tcQ9BX88nK9YxCCQgMpPmnIGYL+QZroOMn+8gvsxyw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0haN/kimeW4Mcc5mvkbjr2J/kgNSrwZBhMOihrTSNAZrZNm0LRl8tk910dEGRAac
 28g3oneEz6gUiN3PnJmk8wUH0Uc9UGdE2yzib0fhlq/Tg8Ya63yzzS6vSU5k3WS+uL
 zoEWY5RCdreDJSjIf27zsJ2T+V63etk7zrkPYKc9Cx/8iL6XhX+Pyn7RjCSYGWGXqR
 MrECPvXM4Q2xmkOoFFXQfIv9MCf2O8xjYmySpe12giowJAVTET2ApLVOPEABDlgQLU
 dU03srC+DL9Lz1UepObT7rTDqPKIQEH5xZSQNAP/24K3PW0FFSwPqXquMyOETOcQPs
 DKuQGdyFB9bkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 8/9] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Date: Tue,  4 Apr 2023 12:47:59 +0200
Message-Id: <20230404104800.301150-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
to function mtk_dp_initialize_aux_settings(), as this is effectively
part of the DPTX AUX setup sequence.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 62d53c4b3feb..a67143c22024 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1012,6 +1012,11 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
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
@@ -1824,10 +1829,6 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
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
2.40.0

