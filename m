Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB2672D96
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 01:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0978710E21B;
	Thu, 19 Jan 2023 00:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492C10E21F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 00:43:01 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5499E6600865;
 Thu, 19 Jan 2023 00:42:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674088980;
 bh=xfnnqQcw9i/KdRsB8TnEah6oz1OGMYOJqBiowsr3TBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hiGKrVISV+Hkv9kjKQQY95x8yAyycqW9hKk1TX2ELx4C3+JEVvZZBcqeA9j+5G9tU
 OPT/pNqAWRtPnxAbphGpFNYruZD5ihh0dLmeB0+Fz6w9wA4lnZoegVUL1Zg+f+3SFh
 sd0kYpXZvKGv3dWhynows3YvCu0m3asrdXM4xUNHujR/Lpo2R37M5RgbsWlhEP3T0A
 UdDcEfNoicY1hCDFZjpIomH/OXTePCEqD0tqBXXXpSUzcUexQHsyURNLPtLVKRrx23
 hjpbID1avg75k1wxUlvqQmeD6/ocLgProzaIf0Ze3BE7wTfWpvCmrrZ0gwONYUvJp4
 6GIawOpVTJ12g==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Subject: [PATCH v1 1/1] drm/virtio: Support sync objects
Date: Thu, 19 Jan 2023 03:41:43 +0300
Message-Id: <20230119004143.968942-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119004143.968942-1-dmitry.osipenko@collabora.com>
References: <20230119004143.968942-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add sync object DRM UAPI support to VirtIO-GPU driver. It's required
for enabling full-featured Vulkan fencing by Venus and native context
VirtIO-GPU Mesa drivers.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |   3 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 223 ++++++++++++++++++++++++-
 include/uapi/drm/virtgpu_drm.h         |  16 +-
 3 files changed, 239 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ae97b98750b6..af911f65f8a3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,7 +172,8 @@ MODULE_AUTHOR("Alon Levy");
 DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
 static const struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC |
+			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9f4a90493aea..b17822b833e1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -30,6 +30,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_syncobj.h>
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
@@ -38,6 +39,12 @@
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
 
+struct virtio_gpu_submit_post_dep {
+	struct drm_syncobj *syncobj;
+	struct dma_fence_chain *chain;
+	uint64_t point;
+};
+
 static int virtio_gpu_fence_event_create(struct drm_device *dev,
 					 struct drm_file *file,
 					 struct virtio_gpu_fence *fence,
@@ -108,6 +115,184 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 					 &virtio_gpu_map->offset);
 }
 
+static void virtio_gpu_free_syncobjs(struct drm_syncobj **syncobjs,
+				     uint32_t nr_syncobjs)
+{
+	uint32_t i = nr_syncobjs;
+
+	while (i--) {
+		if (syncobjs[i])
+			drm_syncobj_put(syncobjs[i]);
+	}
+
+	kfree(syncobjs);
+}
+
+static struct drm_syncobj **
+virtio_gpu_parse_deps(struct drm_file *file,
+		      uint64_t fence_ctx,
+		      uint32_t ring_idx,
+		      uint64_t in_syncobjs_addr,
+		      uint32_t nr_in_syncobjs,
+		      size_t syncobj_stride)
+{
+	struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
+	struct drm_syncobj **syncobjs = NULL;
+	int ret = 0;
+	uint32_t i;
+
+	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
+			   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!syncobjs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_in_syncobjs; i++) {
+		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
+		struct dma_fence *in_fence;
+
+		if (copy_from_user(&syncobj_desc,
+				   u64_to_user_ptr(address),
+				   min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (syncobj_desc.flags & ~VIRTGPU_EXECBUF_SYNCOBJ_FLAGS) {
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
+					     syncobj_desc.point, 0, &in_fence);
+		if (ret)
+			break;
+
+		if (!dma_fence_match_context(in_fence, fence_ctx + ring_idx))
+			ret = dma_fence_wait(in_fence, true);
+
+		dma_fence_put(in_fence);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & VIRTGPU_EXECBUF_SYNCOBJ_RESET) {
+			syncobjs[i] =
+				drm_syncobj_find(file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		virtio_gpu_free_syncobjs(syncobjs, i);
+		return ERR_PTR(ret);
+	}
+	return syncobjs;
+}
+
+static void virtio_gpu_reset_syncobjs(struct drm_syncobj **syncobjs,
+				      uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; syncobjs && i < nr_syncobjs; i++) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+static void
+virtio_gpu_free_post_deps(struct virtio_gpu_submit_post_dep *post_deps,
+			  uint32_t nr_syncobjs)
+{
+	uint32_t i = nr_syncobjs;
+
+	while (i--) {
+		kfree(post_deps[i].chain);
+		drm_syncobj_put(post_deps[i].syncobj);
+	}
+
+	kfree(post_deps);
+}
+
+static struct virtio_gpu_submit_post_dep *
+virtio_gpu_parse_post_deps(struct drm_file *file,
+			   uint64_t syncobjs_addr,
+			   uint32_t nr_syncobjs,
+			   size_t syncobj_stride)
+{
+	struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
+	struct virtio_gpu_submit_post_dep *post_deps;
+	int ret = 0;
+	uint32_t i;
+
+	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
+				  GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!post_deps)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_syncobjs; i++) {
+		uint64_t address = syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+				   u64_to_user_ptr(address),
+				   min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
+		post_deps[i].chain = NULL;
+
+		if (syncobj_desc.flags) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (syncobj_desc.point) {
+			post_deps[i].chain = dma_fence_chain_alloc();
+			if (!post_deps[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+
+		post_deps[i].syncobj =
+			drm_syncobj_find(file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = -EINVAL;
+			break;
+		}
+	}
+
+	if (ret) {
+		virtio_gpu_free_post_deps(post_deps, i);
+		return ERR_PTR(ret);
+	}
+
+	return post_deps;
+}
+
+static void
+virtio_gpu_process_post_deps(struct virtio_gpu_submit_post_dep *post_deps,
+			     uint32_t count,
+			     struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; post_deps && i < count; i++) {
+		if (post_deps[i].chain) {
+			drm_syncobj_add_point(post_deps[i].syncobj,
+					      post_deps[i].chain,
+					      fence, post_deps[i].point);
+			post_deps[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(post_deps[i].syncobj, fence);
+		}
+	}
+}
+
 /*
  * Usage of execbuffer:
  * Relocations need to take into account the full VIRTIO_GPUDrawable size.
@@ -118,6 +303,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file)
 {
 	struct drm_virtgpu_execbuffer *exbuf = data;
+	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct virtio_gpu_submit_post_dep *post_deps = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_fence *out_fence;
@@ -207,10 +394,33 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		bo_handles = NULL;
 	}
 
+	if (exbuf->num_in_syncobjs) {
+		syncobjs_to_reset = virtio_gpu_parse_deps(file,
+							  fence_ctx, ring_idx,
+							  exbuf->in_syncobjs,
+							  exbuf->num_in_syncobjs,
+							  exbuf->syncobj_stride);
+		if (IS_ERR(syncobjs_to_reset)) {
+			ret = PTR_ERR(syncobjs_to_reset);
+			goto out_unused_fd;
+		}
+	}
+
+	if (exbuf->num_out_syncobjs) {
+		post_deps = virtio_gpu_parse_post_deps(file,
+						       exbuf->out_syncobjs,
+						       exbuf->num_out_syncobjs,
+						       exbuf->syncobj_stride);
+		if (IS_ERR(post_deps)) {
+			ret = PTR_ERR(post_deps);
+			goto out_syncobjs;
+		}
+	}
+
 	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
-		goto out_unused_fd;
+		goto out_post_deps;
 	}
 
 	if (buflist) {
@@ -241,6 +451,13 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		fd_install(out_fence_fd, sync_file->file);
 	}
 
+	virtio_gpu_reset_syncobjs(syncobjs_to_reset, exbuf->num_in_syncobjs);
+	virtio_gpu_free_syncobjs(syncobjs_to_reset, exbuf->num_in_syncobjs);
+
+	virtio_gpu_process_post_deps(post_deps, exbuf->num_out_syncobjs,
+				     &out_fence->f);
+	virtio_gpu_free_post_deps(post_deps, exbuf->num_out_syncobjs);
+
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
 			      vfpriv->ctx_id, buflist, out_fence);
 	dma_fence_put(&out_fence->f);
@@ -252,6 +469,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		virtio_gpu_array_unlock_resv(buflist);
 out_memdup:
 	kvfree(buf);
+out_post_deps:
+	virtio_gpu_free_post_deps(post_deps, exbuf->num_out_syncobjs);
+out_syncobjs:
+	virtio_gpu_free_syncobjs(syncobjs_to_reset, exbuf->num_in_syncobjs);
 out_unused_fd:
 	kvfree(bo_handles);
 	if (buflist)
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..408a3237f3b4 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -64,6 +64,16 @@ struct drm_virtgpu_map {
 	__u32 pad;
 };
 
+#define VIRTGPU_EXECBUF_SYNCOBJ_RESET		0x01
+#define VIRTGPU_EXECBUF_SYNCOBJ_FLAGS ( \
+		VIRTGPU_EXECBUF_SYNCOBJ_RESET | \
+		0)
+struct drm_virtgpu_execbuffer_syncobj {
+	__u32 handle;
+	__u32 flags;
+	__u64 point;
+};
+
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
 	__u32 size;
@@ -72,7 +82,11 @@ struct drm_virtgpu_execbuffer {
 	__u32 num_bo_handles;
 	__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT) */
 	__u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_IDX) */
-	__u32 pad;
+	__u32 syncobj_stride;
+	__u32 num_in_syncobjs;
+	__u32 num_out_syncobjs;
+	__u64 in_syncobjs;
+	__u64 out_syncobjs;
 };
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
-- 
2.39.0

