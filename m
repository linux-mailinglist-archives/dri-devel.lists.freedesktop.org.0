Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D666A1CE83
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 21:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ED010E196;
	Sun, 26 Jan 2025 20:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OFkV1SzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E870710E196
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 20:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737924191; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l777d6OcriSjXUtiJXGcuYLZM81jfizOB4OST4XmXWq9M2v/ww1Igo2KNFDq0w8vAp4i7MXZGB/aWoq/jn1Psamp/EbmCbN6OTffJSR8D+RPYQgdrL7MInl2lHJy0yftZg8KAHYiOKzw9Q1mpG2qb0oMhJInuOm4Ndm16/JgpnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737924191;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xEnBSKU8pnmvFJgSinvIT748Q11VxHBZbgkAD3qC4/s=; 
 b=Xi8JMhT+qHL76BCTak6XS22qw4iDJzS7WM2BPKBx3h2/RJ/nfeMQd5awo5HWTJLyNevjx8gFxOHX0BVNuLoYGOuv8eDXPvB1oUqrT9ekAYegKS3jyXyBRp5JE+QrXkke/SVHn8GEUDGGKO516Mlctn71z7r0B7Nq3uVbzPq6jm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737924190; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=xEnBSKU8pnmvFJgSinvIT748Q11VxHBZbgkAD3qC4/s=;
 b=OFkV1SzKmrSJ8ydyfdkeKRLA+cr0oCTYLJTEozi39l2lea5wDTRDwPx9vGkqFHXb
 TXJQdcc/UA3GnJcInUKYubJncTLGERyDoKZYfTUHkPIz5Zk17nSbdp5md9e1KmKhIUY
 oEpPrjum4cZbFeAhL2G6jzWreWHUL2F/S2Wd1RNI=
Received: by mx.zohomail.com with SMTPS id 173792418632813.028427511580276;
 Sun, 26 Jan 2025 12:43:06 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v1] drm/virtio: Extend blob UAPI with deferred-mapping hinting
Date: Sun, 26 Jan 2025 23:42:39 +0300
Message-ID: <20250126204239.474847-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

If userspace never maps GEM object, then BO wastes hostmem space
because VirtIO-GPU driver maps VRAM BO at the BO's creating time.

Make mappings on-demand by adding new RESOURCE_CREATE_BLOB IOCTL/UAPI
hinting flag telling that host mapping should be deferred until first
mapping is made when the flag is set by userspace.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_gem.c   |  9 ++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_vram.c  | 30 +++++++++++++++++++++-----
 include/uapi/drm/virtgpu_drm.h         |  4 ++++
 5 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..e5db91a3e8ba 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -85,6 +85,7 @@ struct virtio_gpu_object_params {
 	uint32_t blob_mem;
 	uint32_t blob_flags;
 	uint64_t blob_id;
+	uint32_t blob_hints;
 };
 
 struct virtio_gpu_object {
@@ -483,6 +484,7 @@ struct sg_table *virtio_gpu_vram_map_dma_buf(struct virtio_gpu_object *bo,
 void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir);
+void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram);
 
 /* virtgpu_submit.c */
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..c902b68cc25a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -103,12 +103,21 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      uint32_t handle, uint64_t *offset_p)
 {
+	struct virtio_gpu_object_vram *vram;
+	struct virtio_gpu_object *bo;
 	struct drm_gem_object *gobj;
 
 	BUG_ON(!offset_p);
 	gobj = drm_gem_object_lookup(file_priv, handle);
 	if (gobj == NULL)
 		return -ENOENT;
+
+	bo = gem_to_virtio_gpu_obj(gobj);
+	if (virtio_gpu_is_vram(bo)) {
+		vram = to_virtio_gpu_vram(bo);
+		virtio_gpu_vram_map_deferred(vram);
+	}
+
 	*offset_p = drm_vma_node_offset_addr(&gobj->vma_node);
 	drm_gem_object_put(gobj);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index e4f76f315550..51544ee8d3c3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -489,6 +489,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	params->size = rc_blob->size;
 	params->blob = true;
 	params->blob_flags = rc_blob->blob_flags;
+	params->blob_hints = rc_blob->blob_hints;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 25df81c02783..d72c93e06a4a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -41,6 +41,11 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 	if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
 		return -EINVAL;
 
+	virtio_gpu_vram_map_deferred(vram);
+
+	if (vram->map_state == STATE_INITIALIZING)
+		virtio_gpu_notify(vgdev);
+
 	wait_event(vgdev->resp_wq, vram->map_state != STATE_INITIALIZING);
 	if (vram->map_state != STATE_OK)
 		return -EINVAL;
@@ -215,14 +220,29 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, NULL,
 					    0);
-	if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
-		ret = virtio_gpu_vram_map(&vram->base);
-		if (ret) {
-			virtio_gpu_vram_free(obj);
-			return ret;
+	if (!(params->blob_hints & DRM_VIRTGPU_BLOB_FLAG_HINT_DEFER_MAPPING)) {
+		if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
+			ret = virtio_gpu_vram_map(&vram->base);
+			if (ret) {
+				virtio_gpu_vram_free(obj);
+				return ret;
+			}
 		}
 	}
 
 	*bo_ptr = &vram->base;
 	return 0;
 }
+
+void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram)
+{
+	static DEFINE_MUTEX(map_lock);
+
+	if (!(vram->base.blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
+		return;
+
+	mutex_lock(&map_lock);
+	if (!drm_mm_node_allocated(&vram->vram_node))
+		virtio_gpu_vram_map(&vram->base);
+	mutex_unlock(&map_lock);
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9b..3004a1d08570 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -194,6 +194,10 @@ struct drm_virtgpu_resource_create_blob {
 	__u32 cmd_size;
 	__u64 cmd;
 	__u64 blob_id;
+
+#define DRM_VIRTGPU_BLOB_FLAG_HINT_DEFER_MAPPING        0x0001
+	__u32 blob_hints;
+	__u32 pad2;
 };
 
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
-- 
2.47.1

