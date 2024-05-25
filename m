Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C298CF22B
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2FF10E9E8;
	Sat, 25 May 2024 23:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="K/Rt7iQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFF310E386
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:29:40 +0000 (UTC)
X-UUID: a3d5e83a1aee11efbfff99f2466cf0b4-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FIgc95P0LFsWq8dY96d3Fluun5dhhpnGnJPt14WABDE=; 
 b=K/Rt7iQG/x0ebGbWglX7+vV0EXEbqBCoYHjpRc8kNqMoa9CyZNoSnyu3VQECKWEhhNg37AoY1ZdDNC7Kc/9E6THiNq2UUEvCzeS1tfcMxA0H7sKKHoz8H24WpD6+Pk7krHDPOR2wgVD+PDHbWIoHMUFNhWXogc37cj01fHrmRjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:e6427a10-d6e7-438b-a330-104173a2c13e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:67d53693-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a3d5e83a1aee11efbfff99f2466cf0b4-20240526
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 824009790; Sun, 26 May 2024 07:29:32 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:30 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>
Subject: [PATCH v6 3/7] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Date: Sun, 26 May 2024 07:29:24 +0800
Message-ID: <20240525232928.5524-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.374900-8.000000
X-TMASE-MatchedRID: ZCn+RolpoOMXSulpnju2HwNJ3EDwuUClKx5ICGp/WtFLgo8+IIHbcFFS
 bftPdDEZoeiq4rYt7pKGxGUv98m662cxJsW2zGmLwCZxkTHxcckRKRMYqsuVUKw26SKPp7rTBgH
 mCxujQvwZB0R4cFpbTeKOmN63egZIkKjL2IOi2LAVglQa/gMvfF7OZ6hrwwnzRi9INZ1ZpGG8l4
 J1PwHfQtaU6+nmai7Rg76TUEbY/o+jgTsRPYZdS47Su3QulAZ5/Hd4CUWIS/HOMdbgLsryf83+w
 mITvMn44vM1YF6AJbZ/Q8GCVf1zYgtuKBGekqUpI/NGWt0UYPDg2HVhKpGjzSemQbospQn1i4m8
 Ius6insfCKYorH/qEFrVflnGTvH9
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.374900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0135431C2B218892C2ADBEB833FCB3971EB1EC60AA0E18E66BC1269587605A012000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add secure buffer control flow to mtk_drm_gem.

When user space takes DRM_MTK_GEM_CREATE_RESTRICTED flag and size
to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
dma buffer from secure dma-heap and bind it to mtk_drm_gem object.

TODO:
1. Drop the mtk_gem_create_from_heap() after we change the ioctl to
   DMA_HEAP_IOCTL_ALLOC.
2. Checking the private data of dmabuf instead of strncmp the exp_name.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_gem.c     | 85 +++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_gem.h     |  4 ++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 11e1555e9aa4..ff40ca5dd2a0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -573,7 +573,7 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 
 static const struct drm_ioctl_desc mtk_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MTK_GEM_CREATE, mtk_gem_create_ioctl,
-			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index 91f6cfa3f1b7..118ea7f0a71c 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -5,6 +5,8 @@
 
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
+#include <linux/dma-heap.h>
+#include <uapi/linux/dma-heap.h>
 #include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
@@ -103,6 +105,81 @@ struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
+struct mtk_gem_obj *mtk_gem_create_from_heap(struct drm_device *dev,
+					     const char *heap, size_t size)
+{
+	struct mtk_drm_private *priv = dev->dev_private;
+	struct mtk_gem_obj *mtk_gem;
+	struct drm_gem_object *obj;
+	struct dma_heap *dma_heap;
+	struct dma_buf *dma_buf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct iosys_map map = {};
+	int ret;
+
+	mtk_gem = mtk_gem_init(dev, size);
+	if (IS_ERR(mtk_gem))
+		return ERR_CAST(mtk_gem);
+
+	obj = &mtk_gem->base;
+
+	dma_heap = dma_heap_find(heap);
+	if (!dma_heap) {
+		DRM_ERROR("heap find fail\n");
+		goto err_gem_free;
+	}
+	dma_buf = dma_heap_buffer_alloc(dma_heap, size,
+					O_RDWR | O_CLOEXEC, DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR(dma_buf)) {
+		DRM_ERROR("buffer alloc fail\n");
+		dma_heap_put(dma_heap);
+		goto err_gem_free;
+	}
+	dma_heap_put(dma_heap);
+
+	attach = dma_buf_attach(dma_buf, priv->dma_dev);
+	if (IS_ERR(attach)) {
+		DRM_ERROR("attach fail, return\n");
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		DRM_ERROR("map failed, detach and return\n");
+		dma_buf_detach(dma_buf, attach);
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+	obj->import_attach = attach;
+	mtk_gem->dma_addr = sg_dma_address(sgt->sgl);
+	mtk_gem->sg = sgt;
+	mtk_gem->size = dma_buf->size;
+
+	if (!strcmp(heap, "restricted_mtk_cm") || !strcmp(heap, "restricted_mtk_cma")) {
+		/* secure buffer can not be mapped */
+		mtk_gem->secure = true;
+	} else {
+		ret = dma_buf_vmap(dma_buf, &map);
+		mtk_gem->kvaddr = map.vaddr;
+		if (ret) {
+			DRM_ERROR("map failed, ret=%d\n", ret);
+			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+			dma_buf_detach(dma_buf, attach);
+			dma_buf_put(dma_buf);
+			mtk_gem->kvaddr = NULL;
+		}
+	}
+
+	return mtk_gem;
+
+err_gem_free:
+	drm_gem_object_release(obj);
+	kfree(mtk_gem);
+	return ERR_PTR(-ENOMEM);
+}
+
 void mtk_gem_free_object(struct drm_gem_object *obj)
 {
 	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
@@ -230,7 +307,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
+	mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted", 10));
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
+	mtk_gem->size = attach->dmabuf->size;
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
@@ -296,7 +375,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_mtk_gem_create *args = data;
 	int ret;
 
-	mtk_gem = mtk_gem_create(dev, args->size, false);
+	if (args->flags & DRM_MTK_GEM_CREATE_RESTRICTED)
+		mtk_gem = mtk_gem_create_from_heap(dev, "restricted_mtk_cma", args->size);
+	else
+		mtk_gem = mtk_gem_create(dev, args->size, false);
+
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index b71a7e7b405a..7f6b23b9875a 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_gem.h
@@ -27,9 +27,11 @@ struct mtk_gem_obj {
 	void			*cookie;
 	void			*kvaddr;
 	dma_addr_t		dma_addr;
+	size_t			size;
 	unsigned long		dma_attrs;
 	struct sg_table		*sg;
 	struct page		**pages;
+	bool			secure;
 };
 
 #define to_mtk_gem_obj(x) container_of(x, struct mtk_gem_obj, base)
@@ -37,6 +39,8 @@ struct mtk_gem_obj {
 void mtk_gem_free_object(struct drm_gem_object *gem);
 struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev, size_t size,
 				   bool alloc_kmap);
+struct mtk_gem_obj *mtk_gem_create_from_heap(struct drm_device *dev,
+					     const char *heap, size_t size);
 int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
-- 
2.18.0

