Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93711753709
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BE610E845;
	Fri, 14 Jul 2023 09:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56910E845
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:49:15 +0000 (UTC)
X-UUID: af2af25a222b11eeb20a276fd37b9834-20230714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TdyadZRWvTu8+ggDo9V2420WyUO1/XgpBs1YHBnH5aE=; 
 b=lmidLV+1uGepNS2I70PHmkiTED6x6PuNbT246T4Af0L+KXs0Fu3Toj82I/UAhXwiM0H8G6sujwn19Z+44NmpGeT4Ajeu6ZTfGZ5A2Cna3aXtcm0geJ6GLldYNaRTzKebRhx5xLskm4OrPkMO9pjNx5QTNWHlb/tyjl/MffWaMIM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:c2dc1f53-3779-4e99-b5c9-9b9538ec1c8d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.28, REQID:c2dc1f53-3779-4e99-b5c9-9b9538ec1c8d, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:176cd25, CLOUDID:f1c7a98e-7caa-48c2-8dbb-206f0389473c,
 B
 ulkID:2307141749115OJ5PI08,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: af2af25a222b11eeb20a276fd37b9834-20230714
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 260726211; Fri, 14 Jul 2023 17:49:11 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jul 2023 17:49:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jul 2023 17:49:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow in
 multiplying different types
Date: Fri, 14 Jul 2023 17:49:07 +0800
Message-ID: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Instead of multiplying 2 variable of different types. Change to
assign a value of one variable and then multiply the other variable.

2. Add a int variable for multiplier calculation instead of calculating
different types multiplier with dma_addr_t variable directly.

Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 22 +++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index a25b28d3ee90..da087d74612d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -121,7 +121,8 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	int ret;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = args->pitch;
+	args->size *= args->height;
 
 	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..1cd41454d545 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -145,6 +145,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	dma_addr_t addr;
 	dma_addr_t hdr_addr = 0;
 	unsigned int hdr_pitch = 0;
+	int offset;
 
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
@@ -154,8 +155,10 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	modifier = fb->modifier;
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
-		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-		addr += (new_state->src.y1 >> 16) * pitch;
+		offset = (new_state->src.x1 >> 16) * fb->format->cpp[0];
+		addr += offset;
+		offset = (new_state->src.y1 >> 16) * pitch;
+		addr += offset;
 	} else {
 		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
 				      / AFBC_DATA_BLOCK_WIDTH;
@@ -163,21 +166,22 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 				       / AFBC_DATA_BLOCK_HEIGHT;
 		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
 		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
-		int hdr_size;
+		int hdr_size, hdr_offset;
 
 		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
 		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
 			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
 
 		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
+		hdr_offset = hdr_pitch * y_offset_in_blocks +
+			AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
+		hdr_addr = addr + hdr_offset;
 
-		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
-			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
 		/* The data plane is offset by 1 additional block. */
-		addr = addr + hdr_size +
-		       pitch * y_offset_in_blocks +
-		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		offset = pitch * y_offset_in_blocks +
+			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
+			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		addr = addr + hdr_size + offset;
 	}
 
 	mtk_plane_state->pending.enable = true;
-- 
2.18.0

