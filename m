Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7A3CB140
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 05:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881886E8EA;
	Fri, 16 Jul 2021 03:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0DE6E8EA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 03:55:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id v14so4645881plg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 20:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXr2IL73KqKSEhqzjtj2b2SQAFe1cnXxezkrG5GSZR4=;
 b=n0e6cNg4wOYQjjg4wSKUIo+aUss1pGYIQr+kh/cjQ6jWpuqvNAsZsrJbDzULT/YVfs
 KCSh785EaXNFUsrIx/tFa66Qf7XXRf3UFktUDfwoY0Zc0MGY3rnCn7/lLbROXU2JwbAI
 l+V5hpVYOxG4Pt4tA675gF0bKfKFPnmM1JF0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXr2IL73KqKSEhqzjtj2b2SQAFe1cnXxezkrG5GSZR4=;
 b=BH5XXFgWlS/hhi+euaoeA/6i/DQV5yOrYaI8BzvGem2IXKZxuLn49i5e1nHSwegt7c
 dsOlBhUpOoedYTV0X/45KOV0IntDG05yEmJKVCbkHTMsodJZPDbDCenujk9wiVhlJcea
 mDytwdi+53ybmTV7NRWi6prd7AFOEoOSwF5gD10cVKWLRB54KmsXMMsBCZZoAC2PnGJC
 cDQPA8Lc4R592iEof+4Phiiz6yP3p8EXW2WznGR1kfNpKQ6vaKGNGyHOMEqoKI99wJF/
 s5pvuBMi7xgVHgMhP6Dhdf7b7j/5y7oLRVKgf5BQcrk540hGs7QjS1UtFP+qD+HmAr2b
 pufw==
X-Gm-Message-State: AOAM53244ZODJY72Tnq/6CUBoxJsfGeSq0kZKkgddo869g/zjUKE9V3U
 r/Q+VnV6EaKctTmzw4YEJblp8g==
X-Google-Smtp-Source: ABdhPJywILfiQFJdS3vmyq763HMhOMCOgENKBWKRE+qCTIdRbbXSPe4ckgbhzrJlxLmSfHi9U2KMFQ==
X-Received: by 2002:a17:902:7c18:b029:117:e575:473e with SMTP id
 x24-20020a1709027c18b0290117e575473emr6162532pll.37.1626407728524; 
 Thu, 15 Jul 2021 20:55:28 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:3685:a3f6:891d:2a86])
 by smtp.gmail.com with UTF8SMTPSA id f11sm9167043pga.61.2021.07.15.20.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 20:55:28 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/virtio: support mapping exported vram
Date: Fri, 16 Jul 2021 12:55:01 +0900
Message-Id: <20210716035501.3099919-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement virtgpu specific map_dma_buf callback to support mapping
exported vram object dma-bufs. The dma-buf callback is used directly, as
vram objects don't have backing pages and thus can't implement the
drm_gem_object_funcs.get_sg_table callback.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  8 ++++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 30 ++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vram.c  | 61 ++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d4e610a44e12..0c4810982530 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -26,6 +26,7 @@
 #ifndef VIRTIO_DRV_H
 #define VIRTIO_DRV_H
 
+#include <linux/dma-direction.h>
 #include <linux/virtio.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
@@ -459,4 +460,11 @@ bool virtio_gpu_is_vram(struct virtio_gpu_object *bo);
 int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 			   struct virtio_gpu_object_params *params,
 			   struct virtio_gpu_object **bo_ptr);
+struct sg_table *virtio_gpu_vram_map_dma_buf(struct virtio_gpu_object *bo,
+					     struct device *dev,
+					     enum dma_data_direction dir);
+void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 807a27a16365..79efc878f508 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -43,13 +43,39 @@ static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 	return 0;
 }
 
+static struct sg_table *virtgpu_gem_map_dma_buf(
+		struct dma_buf_attachment *attach,
+		enum dma_data_direction dir)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+	if (virtio_gpu_is_vram(bo))
+		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
+
+	return drm_gem_map_dma_buf(attach, dir);
+}
+
+static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
+				      struct sg_table *sgt,
+				      enum dma_data_direction dir)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+	if (virtio_gpu_is_vram(bo))
+		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
+	else
+		drm_gem_unmap_dma_buf(attach, sgt, dir);
+}
+
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
 		.cache_sgt_mapping = true,
 		.attach = virtio_dma_buf_attach,
 		.detach = drm_gem_map_detach,
-		.map_dma_buf = drm_gem_map_dma_buf,
-		.unmap_dma_buf = drm_gem_unmap_dma_buf,
+		.map_dma_buf = virtgpu_gem_map_dma_buf,
+		.unmap_dma_buf = virtgpu_gem_unmap_dma_buf,
 		.release = drm_gem_dmabuf_release,
 		.mmap = drm_gem_dmabuf_mmap,
 		.vmap = drm_gem_dmabuf_vmap,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 5cc34e7330fa..6b45b0429fef 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "virtgpu_drv.h"
 
+#include <linux/dma-mapping.h>
+
 static void virtio_gpu_vram_free(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
@@ -64,6 +66,65 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 	return ret;
 }
 
+struct sg_table *virtio_gpu_vram_map_dma_buf(struct virtio_gpu_object *bo,
+					     struct device *dev,
+					     enum dma_data_direction dir)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+	struct sg_table *sgt;
+	dma_addr_t addr;
+	int ret;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE)) {
+		// Virtio devices can access the dma-buf via its UUID. Return a stub
+		// sg_table so the dma-buf API still works.
+		if (!is_virtio_device(dev) || !vgdev->has_resource_assign_uuid) {
+			ret = -EIO;
+			goto out;
+		}
+		return sgt;
+	}
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (ret)
+		goto out;
+
+	addr = dma_map_resource(dev, vram->vram_node.start,
+				vram->vram_node.size, dir,
+				DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_mapping_error(dev, addr);
+	if (ret)
+		goto out;
+
+	sg_set_page(sgt->sgl, NULL, vram->vram_node.size, 0);
+	sg_dma_address(sgt->sgl) = addr;
+	sg_dma_len(sgt->sgl) = vram->vram_node.size;
+
+	return sgt;
+out:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir)
+{
+	if (sgt->nents) {
+		dma_unmap_resource(dev, sg_dma_address(sgt->sgl),
+				   sg_dma_len(sgt->sgl), dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+	}
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_vram_funcs = {
 	.open = virtio_gpu_gem_object_open,
 	.close = virtio_gpu_gem_object_close,
-- 
2.32.0.402.g57bb445576-goog

