Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74845896C4F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678BC1129A9;
	Wed,  3 Apr 2024 10:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="epcyXjzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C091129A0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:27:12 +0000 (UTC)
X-UUID: b6ade278f1a411eeb8927bc1f75efef4-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4lDY757TvdhBdVweLL8R40AiQq0CLs4BkWdV/XOzqqI=; 
 b=epcyXjzPJfI/mY+uBYKH6a/B7ttU3kv9efhqBNtQb9qcM0sHQ1lJnZ6ys7rU1W+SJ+u+EcdRZO6dhBOTds1NN7MTKrUCw4wR0qeUubRTVxBvJgdS2t87f0W9+LGw0As5a9amh775LOeQO46mOyhmx/Y+R9hhTUQF8N7JrzJ0gSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:16440507-ce68-47e1-8797-6f206819c251, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:5471aa00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6ade278f1a411eeb8927bc1f75efef4-20240403
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1260731026; Wed, 03 Apr 2024 18:27:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:02 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 2/9] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Date: Wed, 3 Apr 2024 18:26:54 +0800
Message-ID: <20240403102701.369-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add secure buffer control flow to mtk_drm_gem.

When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
dma buffer from secure dma-heap and bind it to mtk_drm_gem object.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_gem.c | 85 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_gem.h |  4 ++
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index e59e0727717b7..ec34d02c14377 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <uapi/linux/dma-heap.h>
 #include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
@@ -102,6 +104,81 @@ struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev,
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
+	if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
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
@@ -229,7 +306,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
+	mtk_gem->secure = !sg_page(sg->sgl);
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
+	mtk_gem->size = attach->dmabuf->size;
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
@@ -304,7 +383,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_mtk_gem_create *args = data;
 	int ret;
 
-	mtk_gem = mtk_gem_create(dev, args->size, false);
+	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
+		mtk_gem = mtk_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
+	else
+		mtk_gem = mtk_gem_create(dev, args->size, false);
+
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index 4d7598220ca8f..75cf50495abe0 100644
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

