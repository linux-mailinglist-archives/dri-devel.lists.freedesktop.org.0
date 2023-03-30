Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27656CF98C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3F110ECCC;
	Thu, 30 Mar 2023 03:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EE710ECC8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:26:21 +0000 (UTC)
X-UUID: a1d485dcceaa11eda9a90f0bb45854f4-20230330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8txU63jjzRypJDVX5TtyLkcA9uojIR0mdQRPVNmgVu8=; 
 b=Nvoa6vDQfBrN4FK5621MQZcBWM/PCEPAIQa5W2UAr1iXKt7bQ4UmQY7pCPaCZql6yJuc34WCipopR/i5m5Y/oaAWj9FbJUTwCE8AEACxn4KT4e4ypS4Y0jfdEezxPud6Awjqd8OFLu39j5ql4UDH1LI1Jhmz6RhnEU44D0DWFgk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:4cc091f3-32e3-4be1-9c8a-b70de1ab83c9, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:120426c, CLOUDID:d1545af7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a1d485dcceaa11eda9a90f0bb45854f4-20230330
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 424146303; Thu, 30 Mar 2023 11:26:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 11:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 11:26:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/2] drm/mediatek: Add ovl_adaptor get format function
Date: Thu, 30 Mar 2023 11:26:14 +0800
Message-ID: <20230330032614.18837-3-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230330032614.18837-1-nancy.lin@mediatek.com>
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
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
Cc: shawn.sung@mediatek.com, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Add ovl_adaptor get_format and get_num_formats component function.
The two functions are needed for getting the supported format in
mtk_plane_init().
2. Get supported format from the ovl_adaptor's rdma engine - mdp_rdma.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h         |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 14 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 17b169530beb..2254038519e1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -124,6 +124,8 @@ void mtk_ovl_adaptor_start(struct device *dev);
 void mtk_ovl_adaptor_stop(struct device *dev);
 unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
+const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
+size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 046217828ab3..c0a38f5217ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -297,6 +297,20 @@ void mtk_ovl_adaptor_disable_vblank(struct device *dev)
 	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
 }
 
+const u32 *mtk_ovl_adaptor_get_formats(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_mdp_rdma_get_formats(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0]);
+}
+
+size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_mdp_rdma_get_num_formats(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0]);
+}
+
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 {
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1a0c4f7e352a..f114da4d36a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -410,6 +410,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.disconnect = mtk_ovl_adaptor_disconnect,
 	.add = mtk_ovl_adaptor_add_comp,
 	.remove = mtk_ovl_adaptor_remove_comp,
+	.get_formats = mtk_ovl_adaptor_get_formats,
+	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
-- 
2.18.0

