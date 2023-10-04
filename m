Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EC7B76A4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777210E324;
	Wed,  4 Oct 2023 02:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D2F10E084
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:40:22 +0000 (UTC)
X-UUID: 59ff225a625f11ee8051498923ad61e6-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KMxn+WVizjmYY6Ut3cxVQcDYe3FAgydr3Np6TZ8oI8A=; 
 b=hq9NwfCUOIwNvTT61gu2+1p54ZxN04krkr8Ej7tRF2B5mFMTEywG4U6wEi511w9JXgzY6q6U2i1SfT6wtuZ1uAvUAGeHTcWb8GkTy2Njls1Cwu5hTXsZciq2I7t2m8zoVQC3gCts3KVmHJHxNQ2wZ57zZp4RcjR7WPTzlr6X3tc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:4f558ae9-3fa9-42f1-8c87-779311fb5df6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:6ddb6af0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 59ff225a625f11ee8051498923ad61e6-20231004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1694434171; Wed, 04 Oct 2023 10:40:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11 3/9] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Date: Wed, 4 Oct 2023 10:40:07 +0800
Message-ID: <20231004024013.18956-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.036500-8.000000
X-TMASE-MatchedRID: IDRSBkmySF1GlhjnipkGEGwjJ4TFeU1uYpovC7zX5q/Npr24oOS4xkfp
 kQx2u0KsbDDGr42tgBMSqo3ZUfrHh5Coy9iDotiwFYJUGv4DL3wHQj6IJQ7jncRbUf2aWQ/nJET
 WX/pKcs46hUOcTonr9IAy6p60ZV62fJ5/bZ6npdiyO81X3yak8wZbZpuKmuxzNli+eDT2tDyGJo
 dZodTf/LorMSFXg3vW4Ts9Wri8gIl+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.036500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 41CEC5A55D489F33C93B4909D693A2B44F859C2386C62EEF1B9628DB7F09C8322000:8
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

According to mtk_drm_kms_init(), the all_drm_private array in each
drm private data stores all drm private data in display path order.

In mtk_drm_get_all_drm_priv(), each element in all_drm_priv should have one
display path private data, such as:
all_drm_priv[CRTC_MAIN] should only have main_path data
all_drm_priv[CRTC_EXT] should only have ext_path data
all_drm_priv[CRTC_THIRD] should only have third_path data

So we need to add the length checking for each display path before
assigning their drm private data into all_drm_priv array.

Then the all_drm_private array in each drm private data needs to be
assigned in their display path order.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index efe36eace8f0..bf4a04c1156b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -352,6 +352,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
 	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
 	struct device_node *node;
@@ -371,11 +372,21 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
-		if (!drm_dev || !dev_get_drvdata(drm_dev))
+		if (!drm_dev)
 			continue;
 
-		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
-		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
+		temp_drm_priv = dev_get_drvdata(drm_dev);
+		if (!temp_drm_priv)
+			continue;
+
+		if (temp_drm_priv->data->main_len)
+			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
+		else if (temp_drm_priv->data->ext_len)
+			all_drm_priv[CRTC_EXT] = temp_drm_priv;
+		else if (temp_drm_priv->data->third_len)
+			all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+
+		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
 		if (cnt == MAX_CRTC)
-- 
2.18.0

