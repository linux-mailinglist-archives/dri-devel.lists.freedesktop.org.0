Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B946CB45B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 04:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EFD10E071;
	Tue, 28 Mar 2023 02:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8238210E071
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 02:51:37 +0000 (UTC)
X-UUID: 7031d432cd1311edb6b9f13eb10bd0fe-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aGcuqdiUvNo6pp+ENjACxdjleHMQhfuTa1fyNvY/7ic=; 
 b=DJnrCZB7QhRfDVsfzn9m4NSSrQa0YbJ7A5rfcGm1La7OXVtdwhpy2j9bELOpr2q6xszplpAqSPOoUrt/6LuvMTkZmqYuT8KSmo7667jyUdh6y7TRpaHeYYusnLYO4fsA+Dvo7idd8FlpjQZqe1FDsHN64f8AqKwP6apMO8Svjls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:7c4a3bc1-b868-46b1-aa32-ce96c7daad93, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.22, REQID:7c4a3bc1-b868-46b1-aa32-ce96c7daad93, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:120426c, CLOUDID:4e861cf7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:230328105130FP070L4I,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7031d432cd1311edb6b9f13eb10bd0fe-20230328
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2102705985; Tue, 28 Mar 2023 10:51:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 10:51:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 10:51:27 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: Add ovl_adaptor get format function
Date: Tue, 28 Mar 2023 10:51:26 +0800
Message-ID: <20230328025126.30341-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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

Add ovl_adaptor get_format and get_num_formats component function.
The two functions are need for getting the supported format in
mtk_plane_init().

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Change-Id: Ia8e9f6cabcc71b262155a022b103ae81d1616b8f
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 ++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 24 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 0d28b2e2069c..da2de17b84e9 100644
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
index 046217828ab3..b5d28c392c57 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -25,6 +25,20 @@
 #define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
 #define MTK_OVL_ADAPTOR_LAYER_NUM 4
 
+static const u32 formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 enum mtk_ovl_adaptor_comp_type {
 	OVL_ADAPTOR_TYPE_RDMA = 0,
 	OVL_ADAPTOR_TYPE_MERGE,
@@ -297,6 +311,16 @@ void mtk_ovl_adaptor_disable_vblank(struct device *dev)
 	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
 }
 
+const u32 *mtk_ovl_adaptor_get_formats(struct device *dev)
+{
+	return formats;
+}
+
+size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
+{
+	return ARRAY_SIZE(formats);
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

