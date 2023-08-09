Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5ED77670D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 20:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899F10E487;
	Wed,  9 Aug 2023 18:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4610E483
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 18:15:34 +0000 (UTC)
X-UUID: b832827c36e011ee9cb5633481061a41-20230810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dovbjljOnKwVBcqLRanyr8KNL6npC8MdfFck53L7WIk=; 
 b=AdXVE/0PdVQMhuM/dMZsP9FDvbWhuVXa63RAr3QPkWwYfZ+dQ5x9Ne5v2iJQnVKyo7bD3ZH2wuyUzf0a3OaAm28u5UNftJZB+SW7enxxeZcOs0tiCqIWkVqhz1B94r/nltPrWAFosNlOG+ZKGz1jMVyPvhcPq0zOfHzeMREMy6g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:dc9c858e-7e27-4922-9b6b-b0d5e65a67eb, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:0ad78a4, CLOUDID:b1af9512-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: b832827c36e011ee9cb5633481061a41-20230810
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 848885322; Thu, 10 Aug 2023 02:15:28 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Aug 2023 02:15:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 10 Aug 2023 02:15:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Eugen Hristev
 <eugen.hristev@collabora.com>
Subject: [PATCH v9 7/7] drm/mediatek: Support DSI on MT8188 VDOSYS0
Date: Thu, 10 Aug 2023 02:15:25 +0800
Message-ID: <20230809181525.7561-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSI as a main display output selection on MT8188 VDOSYS0.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9900007667a2..fb7909b21bfa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -189,6 +189,7 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 
 static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, DDP_COMPONENT_DP_INTF0},
+	{0, DDP_COMPONENT_DSI0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
-- 
2.18.0

