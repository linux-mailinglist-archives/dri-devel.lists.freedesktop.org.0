Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58167B76A3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2910E331;
	Wed,  4 Oct 2023 02:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FC110E084
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:40:24 +0000 (UTC)
X-UUID: 5a883af4625f11eea33bb35ae8d461a2-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GLG0McDXD3RiSj25NXjkBPEr/Jx8+lcRk5C/BaVVWvs=; 
 b=JPRGvl0FyTzEaodFEzAHOLLR+NwMy7WHmz8Rua7uW3be5swTcdALVyi4YzScexnZfmozznyVcaqXXi3DGXR2TQ+9FGsj42p/Y8ZnxGkypMl6kfByWG8HgeYQG+3u09fq2zbZnzaqza7kuP6Bpoeh+YLnIwmdxoFVYcd7l4lS/iA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:5a70a21a-4704-4945-a41b-af4a59a414ee, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5f78ec9, CLOUDID:66708ebf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5a883af4625f11eea33bb35ae8d461a2-20231004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 793373240; Wed, 04 Oct 2023 10:40:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11 7/9] drm/mediatek: Support dynamic selection of DP_INTF0
 on MT8188 VDOSYS0
Date: Wed, 4 Oct 2023 10:40:11 +0800
Message-ID: <20231004024013.18956-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.967700-8.000000
X-TMASE-MatchedRID: QNCxZxSW5lrUbyut0lXeoED6z8N1m1ALnhD9A3Sa7pZcU0dNErOD+vlY
 oV6p/cSxNFCzr/YjTjM/j7zt48dCSZsYdIGP6PlZkDpLRKO9xhR9LQinZ4QefPcjNeVeWlqY+gt
 Hj7OwNO0UQCQtpNwWeuvXUIEHYfY0GmaFOppS/NxmzbyaB9t9FR3vvlo+MTGG
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.967700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 980030E620D8BDC97A45A00A4B4E7DB9D4760DABC8FF37A7B7D3A75158DF0FE02000:8
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

Move DDP_COMPONENT_DP_INTF0 from mt8188_mtk_ddp_main array to a
connector routes array called mt8188_mtk_ddp_main_routes to support
dynamic selection capability for mt8188.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5d2e191b4106..70c9501250a0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -186,7 +186,10 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 	DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_DITHER0,
-	DDP_COMPONENT_DP_INTF0,
+};
+
+static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
+	{0, DDP_COMPONENT_DP_INTF0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
@@ -288,6 +291,8 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.main_path = mt8188_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.conn_routes = mt8188_mtk_ddp_main_routes,
+	.num_conn_routes = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 1,
 };
 
-- 
2.18.0

