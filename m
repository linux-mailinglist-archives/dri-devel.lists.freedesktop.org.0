Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFF6DBFD8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 14:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F263010E150;
	Sun,  9 Apr 2023 12:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C010E150
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 12:40:42 +0000 (UTC)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 254E86602121;
 Sun,  9 Apr 2023 13:40:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681044041;
 bh=Dqt1qPCyNAm+pzI2PR7p+dMbN8uYY/iGfGXor/s1034=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPffNBPxOr7arTmM+ZM4eXO9nJNXcrlULOl7salNPM6n2EEDJd0JnQ9XFkV68nEg5
 sUm65qOtymBSxhrWGEwJg/cAkeTcDe2D9fdGzOmHNb0HvL81+zVh7W527nzMJfFaTB
 Lv/xdGHK1ZCVwlcRs6p/jT4AIYESfQJa3qU9OO4byS1225ck4/mb/6ZFMlhOMJJT5K
 kWEqwNy6b602giHgbleGq3P3toh0Y9q7u4G23txYbxTH3bEnRyjKmVzRVMm9eIL2I9
 M6ihpUel1xbgTeE4rLEr0yNRVGZxic7lc4rR31jJ4fT1lejLr8atgomE6HnQruP1Xz
 A2daCH3aNIfZg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v5 1/3] drm/virtio: Refactor and optimize job submission code
 path
Date: Sun,  9 Apr 2023 15:39:55 +0300
Message-Id: <20230409123957.29553-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409123957.29553-1-dmitry.osipenko@collabora.com>
References: <20230409123957.29553-1-dmitry.osipenko@collabora.com>
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

Move virtio_gpu_execbuffer_ioctl() into separate virtgpu_submit.c file,
refactoring and optimizing the code along the way to ease addition of new
features to the ioctl.

The optimization is done by using optimal ordering of the job's submission
steps, reducing code path from the start of the ioctl to the point of
pushing job to virtio queue. Job's initialization is now performed before
in-fence is awaited and out-fence setup is made after sending out job to
virtio.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/Makefile         |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 ---------------
 drivers/gpu/drm/virtio/virtgpu_submit.c | 295 ++++++++++++++++++++++++
 4 files changed, 300 insertions(+), 183 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index b99fa4a73b68..d2e1788a8227 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -6,6 +6,6 @@
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
 	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
-	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
+	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o virtgpu_submit.o
 
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af6ffb696086..4126c384286b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -486,4 +486,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir);
 
+/* virtgpu_submit.c */
+int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index da45215a933d..b24b11f25197 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -38,36 +38,6 @@
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
 
-static int virtio_gpu_fence_event_create(struct drm_device *dev,
-					 struct drm_file *file,
-					 struct virtio_gpu_fence *fence,
-					 uint32_t ring_idx)
-{
-	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_fence_event *e = NULL;
-	int ret;
-
-	if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
-		return 0;
-
-	e = kzalloc(sizeof(*e), GFP_KERNEL);
-	if (!e)
-		return -ENOMEM;
-
-	e->event.type = VIRTGPU_EVENT_FENCE_SIGNALED;
-	e->event.length = sizeof(e->event);
-
-	ret = drm_event_reserve_init(dev, file, &e->base, &e->event);
-	if (ret)
-		goto free;
-
-	fence->e = e;
-	return 0;
-free:
-	kfree(e);
-	return ret;
-}
-
 /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
 static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
 					     struct virtio_gpu_fpriv *vfpriv)
@@ -108,158 +78,6 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 					 &virtio_gpu_map->offset);
 }
 
-/*
- * Usage of execbuffer:
- * Relocations need to take into account the full VIRTIO_GPUDrawable size.
- * However, the command as passed from user space must *not* contain the initial
- * VIRTIO_GPUReleaseInfo struct (first XXX bytes)
- */
-static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file)
-{
-	struct drm_virtgpu_execbuffer *exbuf = data;
-	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_fence *out_fence;
-	int ret;
-	uint32_t *bo_handles = NULL;
-	void __user *user_bo_handles = NULL;
-	struct virtio_gpu_object_array *buflist = NULL;
-	struct sync_file *sync_file;
-	int out_fence_fd = -1;
-	void *buf;
-	uint64_t fence_ctx;
-	uint32_t ring_idx;
-
-	fence_ctx = vgdev->fence_drv.context;
-	ring_idx = 0;
-
-	if (vgdev->has_virgl_3d == false)
-		return -ENOSYS;
-
-	if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
-		return -EINVAL;
-
-	if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
-		if (exbuf->ring_idx >= vfpriv->num_rings)
-			return -EINVAL;
-
-		if (!vfpriv->base_fence_ctx)
-			return -EINVAL;
-
-		fence_ctx = vfpriv->base_fence_ctx;
-		ring_idx = exbuf->ring_idx;
-	}
-
-	virtio_gpu_create_context(dev, file);
-	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
-		struct dma_fence *in_fence;
-
-		in_fence = sync_file_get_fence(exbuf->fence_fd);
-
-		if (!in_fence)
-			return -EINVAL;
-
-		/*
-		 * Wait if the fence is from a foreign context, or if the fence
-		 * array contains any fence from a foreign context.
-		 */
-		ret = 0;
-		if (!dma_fence_match_context(in_fence, fence_ctx + ring_idx))
-			ret = dma_fence_wait(in_fence, true);
-
-		dma_fence_put(in_fence);
-		if (ret)
-			return ret;
-	}
-
-	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
-		if (out_fence_fd < 0)
-			return out_fence_fd;
-	}
-
-	if (exbuf->num_bo_handles) {
-		bo_handles = kvmalloc_array(exbuf->num_bo_handles,
-					    sizeof(uint32_t), GFP_KERNEL);
-		if (!bo_handles) {
-			ret = -ENOMEM;
-			goto out_unused_fd;
-		}
-
-		user_bo_handles = u64_to_user_ptr(exbuf->bo_handles);
-		if (copy_from_user(bo_handles, user_bo_handles,
-				   exbuf->num_bo_handles * sizeof(uint32_t))) {
-			ret = -EFAULT;
-			goto out_unused_fd;
-		}
-
-		buflist = virtio_gpu_array_from_handles(file, bo_handles,
-							exbuf->num_bo_handles);
-		if (!buflist) {
-			ret = -ENOENT;
-			goto out_unused_fd;
-		}
-		kvfree(bo_handles);
-		bo_handles = NULL;
-	}
-
-	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
-	if (IS_ERR(buf)) {
-		ret = PTR_ERR(buf);
-		goto out_unused_fd;
-	}
-
-	if (buflist) {
-		ret = virtio_gpu_array_lock_resv(buflist);
-		if (ret)
-			goto out_memdup;
-	}
-
-	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
-	if(!out_fence) {
-		ret = -ENOMEM;
-		goto out_unresv;
-	}
-
-	ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
-	if (ret)
-		goto out_unresv;
-
-	if (out_fence_fd >= 0) {
-		sync_file = sync_file_create(&out_fence->f);
-		if (!sync_file) {
-			dma_fence_put(&out_fence->f);
-			ret = -ENOMEM;
-			goto out_unresv;
-		}
-
-		exbuf->fence_fd = out_fence_fd;
-		fd_install(out_fence_fd, sync_file->file);
-	}
-
-	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
-			      vfpriv->ctx_id, buflist, out_fence);
-	dma_fence_put(&out_fence->f);
-	virtio_gpu_notify(vgdev);
-	return 0;
-
-out_unresv:
-	if (buflist)
-		virtio_gpu_array_unlock_resv(buflist);
-out_memdup:
-	kvfree(buf);
-out_unused_fd:
-	kvfree(bo_handles);
-	if (buflist)
-		virtio_gpu_array_put_free(buflist);
-
-	if (out_fence_fd >= 0)
-		put_unused_fd(out_fence_fd);
-
-	return ret;
-}
-
 static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
new file mode 100644
index 000000000000..902734778d1b
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2015 Red Hat, Inc.
+ * All Rights Reserved.
+ *
+ * Authors:
+ *    Dave Airlie
+ *    Alon Levy
+ */
+
+#include <linux/dma-fence-unwrap.h>
+#include <linux/file.h>
+#include <linux/sync_file.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_file.h>
+#include <drm/virtgpu_drm.h>
+
+#include "virtgpu_drv.h"
+
+struct virtio_gpu_submit {
+	struct virtio_gpu_object_array *buflist;
+	struct drm_virtgpu_execbuffer *exbuf;
+	struct virtio_gpu_fence *out_fence;
+	struct virtio_gpu_fpriv *vfpriv;
+	struct virtio_gpu_device *vgdev;
+	struct sync_file *sync_file;
+	struct drm_file *file;
+	uint64_t fence_ctx;
+	uint32_t ring_idx;
+	int out_fence_fd;
+	void *buf;
+};
+
+static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
+				     struct dma_fence *in_fence)
+{
+	uint32_t context = submit->fence_ctx + submit->ring_idx;
+
+	if (dma_fence_match_context(in_fence, context))
+		return 0;
+
+	return dma_fence_wait(in_fence, true);
+}
+
+static int virtio_gpu_fence_event_create(struct drm_device *dev,
+					 struct drm_file *file,
+					 struct virtio_gpu_fence *fence,
+					 uint32_t ring_idx)
+{
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct virtio_gpu_fence_event *e = NULL;
+	int ret;
+
+	if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
+		return 0;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return -ENOMEM;
+
+	e->event.type = VIRTGPU_EVENT_FENCE_SIGNALED;
+	e->event.length = sizeof(e->event);
+
+	ret = drm_event_reserve_init(dev, file, &e->base, &e->event);
+	if (ret) {
+		kfree(e);
+		return ret;
+	}
+
+	fence->e = e;
+
+	return 0;
+}
+
+static int virtio_gpu_init_submit_buflist(struct virtio_gpu_submit *submit)
+{
+	struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
+	uint32_t *bo_handles;
+
+	if (!exbuf->num_bo_handles)
+		return 0;
+
+	bo_handles = kvmalloc_array(exbuf->num_bo_handles, sizeof(*bo_handles),
+				    GFP_KERNEL);
+	if (!bo_handles)
+		return -ENOMEM;
+
+	if (copy_from_user(bo_handles, u64_to_user_ptr(exbuf->bo_handles),
+			   exbuf->num_bo_handles * sizeof(*bo_handles))) {
+		kvfree(bo_handles);
+		return -EFAULT;
+	}
+
+	submit->buflist = virtio_gpu_array_from_handles(submit->file, bo_handles,
+							exbuf->num_bo_handles);
+	if (!submit->buflist) {
+		kvfree(bo_handles);
+		return -ENOENT;
+	}
+
+	kvfree(bo_handles);
+
+	return 0;
+}
+
+static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
+{
+	if (!IS_ERR(submit->buf))
+		kvfree(submit->buf);
+
+	if (submit->buflist)
+		virtio_gpu_array_put_free(submit->buflist);
+
+	if (submit->out_fence_fd >= 0)
+		put_unused_fd(submit->out_fence_fd);
+
+	if (submit->out_fence)
+		dma_fence_put(&submit->out_fence->f);
+
+	if (submit->sync_file)
+		fput(submit->sync_file->file);
+}
+
+static void virtio_gpu_submit(struct virtio_gpu_submit *submit)
+{
+	virtio_gpu_cmd_submit(submit->vgdev, submit->buf, submit->exbuf->size,
+			      submit->vfpriv->ctx_id, submit->buflist,
+			      submit->out_fence);
+	virtio_gpu_notify(submit->vgdev);
+}
+
+static void virtio_gpu_complete_submit(struct virtio_gpu_submit *submit)
+{
+	submit->buf = NULL;
+	submit->buflist = NULL;
+	submit->sync_file = NULL;
+	submit->out_fence = NULL;
+	submit->out_fence_fd = -1;
+}
+
+static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
+				  struct drm_virtgpu_execbuffer *exbuf,
+				  struct drm_device *dev,
+				  struct drm_file *file,
+				  uint64_t fence_ctx, uint32_t ring_idx)
+{
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fence *out_fence;
+	int err;
+
+	memset(submit, 0, sizeof(*submit));
+
+	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
+	if (!out_fence)
+		return -ENOMEM;
+
+	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
+	if (err) {
+		dma_fence_put(&out_fence->f);
+		return err;
+	}
+
+	submit->out_fence = out_fence;
+	submit->fence_ctx = fence_ctx;
+	submit->ring_idx = ring_idx;
+	submit->out_fence_fd = -1;
+	submit->vfpriv = vfpriv;
+	submit->vgdev = vgdev;
+	submit->exbuf = exbuf;
+	submit->file = file;
+
+	err = virtio_gpu_init_submit_buflist(submit);
+	if (err)
+		return err;
+
+	submit->buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
+	if (IS_ERR(submit->buf))
+		return PTR_ERR(submit->buf);
+
+	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
+		err = get_unused_fd_flags(O_CLOEXEC);
+		if (err < 0)
+			return err;
+
+		submit->out_fence_fd = err;
+
+		submit->sync_file = sync_file_create(&out_fence->f);
+		if (!submit->sync_file)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int virtio_gpu_wait_in_fence(struct virtio_gpu_submit *submit)
+{
+	int ret = 0;
+
+	if (submit->exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
+		struct dma_fence *in_fence =
+				sync_file_get_fence(submit->exbuf->fence_fd);
+		if (!in_fence)
+			return -EINVAL;
+
+		/*
+		 * Wait if the fence is from a foreign context, or if the fence
+		 * array contains any fence from a foreign context.
+		 */
+		ret = virtio_gpu_dma_fence_wait(submit, in_fence);
+
+		dma_fence_put(in_fence);
+	}
+
+	return ret;
+}
+
+static void virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *submit)
+{
+	if (submit->sync_file) {
+		submit->exbuf->fence_fd = submit->out_fence_fd;
+		fd_install(submit->out_fence_fd, submit->sync_file->file);
+	}
+}
+
+static int virtio_gpu_lock_buflist(struct virtio_gpu_submit *submit)
+{
+	if (submit->buflist)
+		return virtio_gpu_array_lock_resv(submit->buflist);
+
+	return 0;
+}
+
+int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	uint64_t fence_ctx = vgdev->fence_drv.context;
+	struct drm_virtgpu_execbuffer *exbuf = data;
+	struct virtio_gpu_submit submit;
+	uint32_t ring_idx = 0;
+	int ret = -EINVAL;
+
+	if (!vgdev->has_virgl_3d)
+		return -ENOSYS;
+
+	if (exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS)
+		return ret;
+
+	if (exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) {
+		if (exbuf->ring_idx >= vfpriv->num_rings)
+			return ret;
+
+		if (!vfpriv->base_fence_ctx)
+			return ret;
+
+		fence_ctx = vfpriv->base_fence_ctx;
+		ring_idx = exbuf->ring_idx;
+	}
+
+	virtio_gpu_create_context(dev, file);
+
+	ret = virtio_gpu_init_submit(&submit, exbuf, dev, file,
+				     fence_ctx, ring_idx);
+	if (ret)
+		goto cleanup;
+
+	/*
+	 * Await in-fences in the end of the job submission path to
+	 * optimize the path by proceeding directly to the submission
+	 * to virtio after the waits.
+	 */
+	ret = virtio_gpu_wait_in_fence(&submit);
+	if (ret)
+		goto cleanup;
+
+	ret = virtio_gpu_lock_buflist(&submit);
+	if (ret)
+		goto cleanup;
+
+	virtio_gpu_submit(&submit);
+
+	/*
+	 * Set up usr-out data after submitting the job to optimize
+	 * the job submission path.
+	 */
+	virtio_gpu_install_out_fence_fd(&submit);
+	virtio_gpu_complete_submit(&submit);
+cleanup:
+	virtio_gpu_cleanup_submit(&submit);
+
+	return ret;
+}
-- 
2.39.2

