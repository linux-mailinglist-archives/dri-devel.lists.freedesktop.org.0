Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC0775FF8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 14:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD3810E434;
	Wed,  9 Aug 2023 12:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58D10E434
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 12:57:30 +0000 (UTC)
X-UUID: 49800d9e36b411eeb20a276fd37b9834-20230809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tUAdq6qOe+qPma/xEq15GohiXDJcb0SQ+x6lWLDvhxo=; 
 b=pSCLNdBE6Nqpogb6V0YO/n+5eSllUPiYnZQsVpxxQ3cRB2g7lM/8kKZgpUz8OdqVWKstAQyq+ejEr3YiYBooWLuCPA/MkFrq23RywCbkkJ01W1sQcLRqAiUO0t6YxmAIITyhXZPGWOJ9bskFcPj5cz6EHltDSKr+Wy6NWMuWv1g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:faf4ce3c-d51b-4700-88c6-3e1af07b1c2c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:df4956ee-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 49800d9e36b411eeb20a276fd37b9834-20230809
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1105248641; Wed, 09 Aug 2023 20:57:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Aug 2023 20:57:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Aug 2023 20:57:24 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v5 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Date: Wed, 9 Aug 2023 20:57:22 +0800
Message-ID: <20230809125722.24112-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230809125722.24112-1-jason-jh.lin@mediatek.com>
References: <20230809125722.24112-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The difference between drm_atomic_helper_commit_tail() and
drm_atomic_helper_commit_tail_rpm() is
drm_atomic_helper_commit_tail() will commit plane first and
then enable crtc, drm_atomic_helper_commit_tail_rpm() will
enable crtc first and then commit plane.

Before mediatek-drm enables crtc, the power and clk required
by OVL have not been turned on, so the commit plane cannot be
committed before crtc is enabled. That means OVL layer should
not be enabled before crtc is enabled.
Therefore, the atomic_commit_tail of mediatek-drm is hooked with
drm_atomic_helper_commit_tail_rpm().

Another reason is that the plane_state of drm_atomic_state is not
synchronized with the plane_state stored in mtk_crtc during crtc enablng,
so just set all planes to disabled.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..51d10e65004e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -410,6 +410,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		unsigned int local_layer;
 
 		plane_state = to_mtk_plane_state(plane->state);
+
+		/* should not enable layer before crtc enabled */
+		plane_state->pending.enable = false;
 		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
-- 
2.18.0

