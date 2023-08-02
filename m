Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD676D080
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20810E202;
	Wed,  2 Aug 2023 14:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65DF10E20F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:48:13 +0000 (UTC)
X-UUID: 968c4f1a314311eeb20a276fd37b9834-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aUhX4vm7/YwxpZ4R5IgDTC1j/2pYbB/emjeIzE3ZJpI=; 
 b=nNRmNcLJnezH5Xo4YW8VLPowU8hYB+6Bodr8/H/TcUhQMd6V1tYNR+GUcmrJo32Tz0VKNmC9O7xpR/JLGQHCh82ZxWs9zd4ksWmPvTtABEZUFBaM2nSzDME3liWbXC4zza+rSTaeZALAU92lkIWdJ30cXGtha0/9J5MDUKtTzw4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:b9325386-0f6c-42a5-9503-85a4e0edbf76, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.30, REQID:b9325386-0f6c-42a5-9503-85a4e0edbf76, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8, CLOUDID:551f9dd2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:2308022248067SK72J6U,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM, TF_CID_SPAM_ASC, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 968c4f1a314311eeb20a276fd37b9834-20230802
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1426893558; Wed, 02 Aug 2023 22:48:05 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Eugen Hristev
 <eugen.hristev@collabora.com>
Subject: [PATCH v8 3/8] drm/mediatek: Fix using wrong drm private data to bind
 mediatek-drm
Date: Wed, 2 Aug 2023 22:47:57 +0800
Message-ID: <20230802144802.751-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230802144802.751-1-jason-jh.lin@mediatek.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
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

In mtk_drm_kms_init(), each element in all_drm_priv should has one
display path private data only, such as:
all_drm_priv[CRTC_MAIN] should has main_path data only
all_drm_priv[CRTC_EXT] should has ext_path data only
all_drm_priv[CRTC_THIRD] should has third_path data only

So we need to add the length checking for each display path before
assigning their drm private data into all_drm_priv array.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 89a38561ba27..c12886f31e54 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -351,6 +351,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
 	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct device_node *node;
@@ -373,9 +374,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (!drm_dev || !dev_get_drvdata(drm_dev))
 			continue;
 
-		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
-		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
-			cnt++;
+		temp_drm_priv = dev_get_drvdata(drm_dev);
+		if (temp_drm_priv) {
+			if (temp_drm_priv->mtk_drm_bound)
+				cnt++;
+
+			if (temp_drm_priv->data->main_len)
+				all_drm_priv[CRTC_MAIN] = temp_drm_priv;
+			else if (temp_drm_priv->data->ext_len)
+				all_drm_priv[CRTC_EXT] = temp_drm_priv;
+			else if (temp_drm_priv->data->third_len)
+				all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.18.0

