Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008673EAE05
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 02:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A4E6E49C;
	Fri, 13 Aug 2021 00:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6C86E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 00:54:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id a8so12797679pjk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 17:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pIAgH5iNdEGAdxjpcPugXg6tz8sXksm2M8tAPbCP6c=;
 b=oSIug5c++9SILz1jjm3IrMLuz/NB5xsP3mgFw/AGBTQw388zvv5QVA2CLtPc0EMK/B
 rO4eajV1doTithSfXvCxC1PUWhq8hsHcsHDcP74uZieFQLdzyTSYBjSTqmQivWqGgqF4
 fvzYSvK5if8b3JiMkLEUZptNImlwiOsYDNYJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pIAgH5iNdEGAdxjpcPugXg6tz8sXksm2M8tAPbCP6c=;
 b=TovVRLVOD9xku6H/DVdbcIctYRndP2vZqQrc6Qt2gtTK9sXFUFxcB9uh0ZFEb4zGkz
 ts3tQVrF/tvJr7h+0ASjCSt5rv2475wuISqNXZJrBRPcCfKKFDBlH5c05+4Wt/r6F19v
 PSuDwBYsHywxUzf2OPcz+2QjDg05xSrFg4TDuypc88N8jyX+lQTP7VYDqmabOjO9HMIr
 4KyPtKl0Q0In1PP+almAVGCFHJU7/FPggeMunOoHP4QwZfmizLf/RXVOhdTCQEYDaann
 mOfpnbrwgAkJkW9bkCM+OdwrXWftJKf590Kc5SqI6OC+EEMfXQ7Mz/W5z48xRdficRG3
 R21w==
X-Gm-Message-State: AOAM533N8ljP6fKm3nQh/7ZY4zeENdqvnQOg3mrgd4RV6XWWCl6XQcc3
 wdzYmhIRKBC20+irZ1il7zW+J3vV/50Inw==
X-Google-Smtp-Source: ABdhPJwHGas+Y13Ubeo2MTVKmglU6WDFOAqN/caZgWuAujZvTeeHimfeN76HXGxnsIKjawe8RRmSLw==
X-Received: by 2002:a63:e84c:: with SMTP id a12mr6370749pgk.48.1628816092660; 
 Thu, 12 Aug 2021 17:54:52 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:3628:a7e9:d10a:8ab1])
 by smtp.gmail.com with UTF8SMTPSA id r8sm46518pgp.30.2021.08.12.17.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 17:54:52 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	David Stevens <stevensd@chromium.org>
Subject: [PATCH v2] drm/virtio: support mapping exported vram
Date: Fri, 13 Aug 2021 09:54:41 +0900
Message-Id: <20210813005441.608293-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement virtgpu specific map_dma_buf callback to support mapping
exported vram object dma-bufs. The dma-buf callback is used directly, as
vram objects don't have backing pages and thus can't implement the
drm_gem_object_funcs.get_sg_table callback.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
v1 -> v2:
 - reflow line to fix strict checkpatch warning
 - replace else with return for consistency between functions
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  8 ++++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 32 +++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vram.c  | 61 ++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 2 deletions(-)

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
index 807a27a16365..7b940be3323f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -43,13 +43,41 @@ static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 	return 0;
 }
 
+static struct sg_table *
+virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
+			enum dma_data_direction dir)
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
+	if (virtio_gpu_is_vram(bo)) {
+		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
+		return;
+	}
+
+	drm_gem_unmap_dma_buf(attach, sgt, dir);
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
2.33.0.rc1.237.g0d66db33f3-goog

