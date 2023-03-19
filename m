Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3C6C0308
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56DE10E51F;
	Sun, 19 Mar 2023 16:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E510E177
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 16:11:03 +0000 (UTC)
Received: from workpc.. (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B50816602EAB;
 Sun, 19 Mar 2023 16:11:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679242261;
 bh=Zv1jEXbnASRrh5znXd1WMvKMLFmizfqTBHbw5rjkR5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GyfUQaFvd6LAGdfv+dbz/I54l6OaL4dRcTrJoHiZKyth34EejnadP4Odn/SnMlSI2
 Jf1t2jPonQs8d2LX/fnnxZA+q++wX2l0ZGa7UbnXhNJtU/GhZn2uSI+NN1v3RJWJXx
 UY5+491kczgvPPtDyiydb3qE15h0jpYOeuuFAOVdk+WUrwrLTe5rTB65Q4k3Q8nojz
 QnYyT3XVQjAPyFzued2sGv6NMNMSbUGEx2gP7e4hC/TaW6guJZmZ4CyfC2HUQCaBlh
 H51mIycF5a25ncKd/AT0Ayc1inNj6uqf0rBn5r2hkyAIAjrhwrzAzn/UQi4HLCrQwV
 syUYLVG8FnsJQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 1/2] drm/virtio: Refactor job submission code path
Date: Sun, 19 Mar 2023 19:08:01 +0300
Message-Id: <20230319160802.3297643-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319160802.3297643-1-dmitry.osipenko@collabora.com>
References: <20230319160802.3297643-1-dmitry.osipenko@collabora.com>
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

Move virtio_gpu_execbuffer_ioctl() into separate virtgpu_submit.c file
and refactor the code along the way to ease addition of new features to
the ioctl.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/Makefile         |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 ---------------
 drivers/gpu/drm/virtio/virtgpu_submit.c | 298 ++++++++++++++++++++++++
 4 files changed, 303 insertions(+), 183 deletions(-)
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
index 000000000000..a96f9d3285c7
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -0,0 +1,298 @@
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
+	struct drm_file *file;
+	uint64_t fence_ctx;
+	uint32_t ring_idx;
+	int out_fence_fd;
+	void *buf;
+};
+
+static int virtio_gpu_do_fence_wait(struct virtio_gpu_submit *submit,
+				    struct dma_fence *dma_fence)
+{
+	uint32_t context = submit->fence_ctx + submit->ring_idx;
+
+	if (dma_fence_match_context(dma_fence, context))
+		return 0;
+
+	return dma_fence_wait(dma_fence, true);
+}
+
+static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
+				     struct dma_fence *fence)
+{
+	struct dma_fence *itr;
+	int idx, err;
+
+	dma_fence_array_for_each(itr, idx, fence) {
+		err = virtio_gpu_do_fence_wait(submit, itr);
+		if (err)
+			return err;
+	}
+
+	return 0;
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
+	bo_handles = kvmalloc_array(exbuf->num_bo_handles, sizeof(uint32_t),
+				    GFP_KERNEL);
+	if (!bo_handles)
+		return -ENOMEM;
+
+	if (copy_from_user(bo_handles, u64_to_user_ptr(exbuf->bo_handles),
+			   exbuf->num_bo_handles * sizeof(uint32_t))) {
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
+}
+
+static void virtio_gpu_submit(struct virtio_gpu_submit *submit)
+{
+	virtio_gpu_cmd_submit(submit->vgdev, submit->buf, submit->exbuf->size,
+			      submit->vfpriv->ctx_id, submit->buflist,
+			      submit->out_fence);
+	virtio_gpu_notify(submit->vgdev);
+
+	submit->buf = NULL;
+	submit->buflist = NULL;
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
+static int virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *submit)
+{
+	if (submit->out_fence_fd >= 0) {
+		struct sync_file *sync_file =
+					sync_file_create(&submit->out_fence->f);
+		if (!sync_file)
+			return -ENOMEM;
+
+		submit->exbuf->fence_fd = submit->out_fence_fd;
+		fd_install(submit->out_fence_fd, sync_file->file);
+	}
+
+	return 0;
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
+/*
+ * Usage of execbuffer:
+ * Relocations need to take into account the full VIRTIO_GPUDrawable size.
+ * However, the command as passed from user space must *not* contain the initial
+ * VIRTIO_GPUReleaseInfo struct (first XXX bytes)
+ */
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
+	if (vgdev->has_virgl_3d == false)
+		return -ENOSYS;
+
+	if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
+		return ret;
+
+	if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
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
+	ret = virtio_gpu_wait_in_fence(&submit);
+	if (ret)
+		goto cleanup;
+
+	ret = virtio_gpu_install_out_fence_fd(&submit);
+	if (ret)
+		goto cleanup;
+
+	ret = virtio_gpu_lock_buflist(&submit);
+	if (ret)
+		goto cleanup;
+
+	virtio_gpu_submit(&submit);
+cleanup:
+	virtio_gpu_cleanup_submit(&submit);
+
+	return ret;
+}
-- 
2.39.2

