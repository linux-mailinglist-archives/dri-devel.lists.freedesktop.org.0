Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952717B76A1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3AF10E084;
	Wed,  4 Oct 2023 02:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957EC10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:40:23 +0000 (UTC)
X-UUID: 5a8ea09c625f11ee8051498923ad61e6-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n4nlsGzz1ZqV81nQuh+DJxf/hX8kTL2Z/ED+1RuRfuo=; 
 b=S45G7mUZI8eTm8Kzllv4V7GMNx/ZGnEt5ax/NqcBwSsTXeEdc3la+gSVRYBSuWFtTxlgl2zlSrs0j9saGgg+p/iYLQMN8GwgL4C6DC6vLrvd6wFnM6XwberDzHAXZl73fHJblUOl2+ppeRWBSUiFEiRr7e6wWDPIsW0POUMsNnc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:b1ce4d2f-c7ac-4a5d-a2e8-1b3084ca6380, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:99db6af0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5a8ea09c625f11ee8051498923ad61e6-20231004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1672417227; Wed, 04 Oct 2023 10:40:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11 8/9] drm/mediatek: dsi: Support dynamic connector selection
Date: Wed, 4 Oct 2023 10:40:12 +0800
Message-ID: <20231004024013.18956-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.997200-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRIDh1tb/sWFHED6z8N1m1ALnhD9A3Sa7pYs/uUAk6xP7Nn7
 b/+Y15IvPtTFKpORzfsCp55PrRtAQA+/n/431GMS4pdq9sdj8LV9LQinZ4QefPcjNeVeWlqY+gt
 Hj7OwNO0JC+VZi2gQEWw8oFPNfB0IEA7FUQLpq3iW5tpLfOgF/MsfHfFE0RGVdZIJalioquyH6C
 /I34ughh4rW5UwSJDWGkAEd4pFaa4ujJ3f5a+ghHZrUbEZipAEiWT09mQz7szw9kH8zAy44aOuV
 Lnx3A74
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.997200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 98A27E5156AB5E7445298D72B083B3F10D3FF7C5BBA2D43A40F3EF3C208ACF742000:8
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

Add implementation of mtk_dsi_encoder_index to mtk_ddp_comp_func
to make mtk_dsi support dynamic connector selection.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 5f07037670e9..fdaa21b6a9da 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -48,6 +48,7 @@ unsigned int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
+unsigned int mtk_dsi_encoder_index(struct device *dev);
 
 int mtk_gamma_clk_enable(struct device *dev);
 void mtk_gamma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 601755925520..f3345af12cb8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -318,6 +318,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
 	.start = mtk_dsi_ddp_start,
 	.stop = mtk_dsi_ddp_stop,
+	.encoder_index = mtk_dsi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d8bfc2cce54d..124647a4d985 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -865,6 +865,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	return ret;
 }
 
+unsigned int mtk_dsi_encoder_index(struct device *dev)
+{
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	unsigned int encoder_index = drm_encoder_index(&dsi->encoder);
+
+	dev_dbg(dev, "encoder index:%d\n", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	int ret;
-- 
2.18.0

