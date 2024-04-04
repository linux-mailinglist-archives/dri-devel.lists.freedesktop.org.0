Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231289829C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24011329D;
	Thu,  4 Apr 2024 07:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0d8LCh7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2553710F91D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712217481;
 bh=91LD58avnRzxuTR+zgR6nRtCYpKIsz1H4g5/SZOkKwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0d8LCh7CqmqBKxae4zvzP7kHfKBt66Je/wOdytq86ZfN/ZU+QYUjnG9uBCm9DaedO
 2/ryyht8UR5L779RenbBXb/U4nhu4mQ4gj2xaUcmBAhaccXIH1XnblbNc11z4cpA/E
 CH4G+CcCtI55wdVim+Ao9rLEzG+3AQxloITitp5437x1av6QPW+Yw/thp+7u0n4vyO
 QkFmOXCJy0k/DuxaLTsOHFpILB1Ei5bwxXFod40AcybdjGXbsU18iGnt9/trJjnaO3
 BX31mPHMjR6JIqwIDmWJ2eUrHGaBBvdslslPpdnEUpN8LfI1ajeJsOErsEW9Y1UtmV
 UvwNLgh9o2qGw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2ACF3378212E;
 Thu,  4 Apr 2024 07:58:00 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, nancy.lin@mediatek.com, nathan.lu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
Subject: [PATCH v2 3/3] drm/mediatek: drm_ddp_comp: Add
 mtk_ddp_is_simple_comp() internal helper
Date: Thu,  4 Apr 2024 09:57:54 +0200
Message-ID: <20240404075754.83455-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
References: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
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

Move the simple component check to a new mtk_ddp_is_simple_comp()
internal helper to reduce code duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 +++++++++++----------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 477fc1950a0e..d760285761b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -576,6 +576,29 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
+static bool mtk_ddp_is_simple_comp(enum mtk_ddp_comp_type type)
+{
+	switch (type) {
+	case MTK_DISP_AAL:
+	case MTK_DISP_BLS:
+	case MTK_DISP_CCORR:
+	case MTK_DISP_COLOR:
+	case MTK_DISP_GAMMA:
+	case MTK_DISP_MERGE:
+	case MTK_DISP_OVL:
+	case MTK_DISP_OVL_2L:
+	case MTK_DISP_OVL_ADAPTOR:
+	case MTK_DISP_PWM:
+	case MTK_DISP_RDMA:
+	case MTK_DP_INTF:
+	case MTK_DPI:
+	case MTK_DSI:
+		return false;
+	default:
+		return true;
+	}
+}
+
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id)
 {
@@ -606,19 +629,13 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-	if (type == MTK_DISP_AAL ||
-	    type == MTK_DISP_BLS ||
-	    type == MTK_DISP_CCORR ||
-	    type == MTK_DISP_COLOR ||
-	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DISP_MERGE ||
-	    type == MTK_DISP_OVL ||
-	    type == MTK_DISP_OVL_2L ||
-	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DP_INTF ||
-	    type == MTK_DSI)
+	/*
+	 * Resources for simple components are retrieved here as those are
+	 * managed in here without the need of more complex drivers; for
+	 * the latter, their respective probe function will do the job, so
+	 * we must avoid getting their resources here.
+	 */
+	if (!mtk_ddp_is_simple_comp(type))
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
@@ -652,19 +669,7 @@ void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp)
 		return;
 
 	/* Complex components are destroyed with their own remove callback */
-	if (mtk_ddp_matches[comp->id].type == MTK_DISP_AAL ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_BLS ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_CCORR ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_COLOR ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_GAMMA ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_MERGE ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_OVL_2L ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_PWM ||
-	    mtk_ddp_matches[comp->id].type == MTK_DISP_RDMA ||
-	    mtk_ddp_matches[comp->id].type == MTK_DPI ||
-	    mtk_ddp_matches[comp->id].type == MTK_DP_INTF ||
-	    mtk_ddp_matches[comp->id].type == MTK_DSI)
+	if (!mtk_ddp_is_simple_comp(mtk_ddp_matches[comp->id].type))
 		return;
 
 	priv = dev_get_drvdata(comp->dev);
-- 
2.44.0

