Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545276C73E3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 00:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2438910E13D;
	Thu, 23 Mar 2023 23:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC010E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 23:09:09 +0000 (UTC)
Received: from workpc.. (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 796756603105;
 Thu, 23 Mar 2023 23:09:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679612948;
 bh=XYVO4qL+BZk0tswR1nVz2i6B9bX936Liy6QwloPRSYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jxqVhjwd2ld4IVbDmOkMeYkgOYBraeNfFyVRTz8Klpm2ChjBd4z5PPDYMBNK6Ly4P
 QajC3LcibautpBFRW7lOCll3uXDuYDZ1KeDtHcqLTcMptiVatOWS+u1DV/WLwOfF96
 1aLDWAUa2cWIvkswAWy/t3Cw46xkIZbg3cYcoPuqo3rtlP0yMwTohofm5S8ZoP8M6a
 25KiIxRGcmW0j1/E2AKKDDq+DT2wTfVwo0OIGMlNNxDq2CedjQQhkyrxWPuxTI3YQC
 9l8YLewfYgACuj37q0EO/0/3lrFMdFO/2vd48IH88xr+3BR8rop0dVeA6e5QWuoWe6
 wrhcEIxdS0nBA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v4 2/2] drm/virtio: Support sync objects
Date: Fri, 24 Mar 2023 02:07:55 +0300
Message-Id: <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
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
for enabling a full-featured Vulkan fencing by Venus and native context
VirtIO-GPU Mesa drivers.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c | 219 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          |  16 +-
 3 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18..a22155577152 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -176,7 +176,8 @@ static const struct drm_driver driver = {
 	 * If KMS is disabled DRIVER_MODESET and DRIVER_ATOMIC are masked
 	 * out via drm_device::driver_features:
 	 */
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC |
+			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 42c79869f192..a18b21f9d07a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -14,11 +14,24 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_syncobj.h>
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
 
+struct virtio_gpu_submit_post_dep {
+	struct drm_syncobj *syncobj;
+	struct dma_fence_chain *chain;
+	uint64_t point;
+};
+
 struct virtio_gpu_submit {
+	struct virtio_gpu_submit_post_dep *post_deps;
+	unsigned int num_out_syncobjs;
+
+	struct drm_syncobj **in_syncobjs;
+	unsigned int num_in_syncobjs;
+
 	struct virtio_gpu_object_array *buflist;
 	struct drm_virtgpu_execbuffer *exbuf;
 	struct virtio_gpu_fence *out_fence;
@@ -58,6 +71,189 @@ static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
 	return 0;
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
+	kvfree(syncobjs);
+}
+
+static int
+virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
+{
+	struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
+	struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
+	size_t syncobj_stride = exbuf->syncobj_stride;
+	struct drm_syncobj **syncobjs;
+	int ret = 0, i;
+
+	if (!submit->num_in_syncobjs)
+		return 0;
+
+	syncobjs = kvcalloc(submit->num_in_syncobjs, sizeof(*syncobjs),
+			    GFP_KERNEL);
+	if (!syncobjs)
+		return -ENOMEM;
+
+	for (i = 0; i < submit->num_in_syncobjs; i++) {
+		uint64_t address = exbuf->in_syncobjs + i * syncobj_stride;
+		struct dma_fence *fence;
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
+		ret = drm_syncobj_find_fence(submit->file, syncobj_desc.handle,
+					     syncobj_desc.point, 0, &fence);
+		if (ret)
+			break;
+
+		ret = virtio_gpu_dma_fence_wait(submit, fence);
+
+		dma_fence_put(fence);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & VIRTGPU_EXECBUF_SYNCOBJ_RESET) {
+			syncobjs[i] =
+				drm_syncobj_find(submit->file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		virtio_gpu_free_syncobjs(syncobjs, i);
+		return ret;
+	}
+
+	submit->in_syncobjs = syncobjs;
+
+	return ret;
+}
+
+static void virtio_gpu_reset_syncobjs(struct drm_syncobj **syncobjs,
+				      uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; i < nr_syncobjs; i++) {
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
+	kvfree(post_deps);
+}
+
+static int virtio_gpu_parse_post_deps(struct virtio_gpu_submit *submit)
+{
+	struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
+	struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
+	struct virtio_gpu_submit_post_dep *post_deps;
+	size_t syncobj_stride = exbuf->syncobj_stride;
+	int ret = 0, i;
+
+	if (!submit->num_out_syncobjs)
+		return 0;
+
+	post_deps = kvcalloc(submit->num_out_syncobjs, sizeof(*post_deps),
+			     GFP_KERNEL);
+	if (!post_deps)
+		return -ENOMEM;
+
+	for (i = 0; i < submit->num_out_syncobjs; i++) {
+		uint64_t address = exbuf->out_syncobjs + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+				   u64_to_user_ptr(address),
+				   min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
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
+			drm_syncobj_find(submit->file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = -EINVAL;
+			break;
+		}
+	}
+
+	if (ret) {
+		virtio_gpu_free_post_deps(post_deps, i);
+		return ret;
+	}
+
+	submit->post_deps = post_deps;
+
+	return 0;
+}
+
+static void
+virtio_gpu_process_post_deps(struct virtio_gpu_submit *submit)
+{
+	struct virtio_gpu_submit_post_dep *post_deps = submit->post_deps;
+	struct dma_fence *fence = &submit->out_fence->f;
+	uint32_t i;
+
+	if (!post_deps)
+		return;
+
+	for (i = 0; i < submit->num_out_syncobjs; i++) {
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
 static int virtio_gpu_fence_event_create(struct drm_device *dev,
 					 struct drm_file *file,
 					 struct virtio_gpu_fence *fence,
@@ -121,6 +317,18 @@ static int virtio_gpu_init_submit_buflist(struct virtio_gpu_submit *submit)
 
 static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
 {
+	if (submit->in_syncobjs) {
+		virtio_gpu_reset_syncobjs(submit->in_syncobjs,
+					  submit->num_in_syncobjs);
+
+		virtio_gpu_free_syncobjs(submit->in_syncobjs,
+					 submit->num_in_syncobjs);
+	}
+
+	if (submit->post_deps)
+		virtio_gpu_free_post_deps(submit->post_deps,
+					  submit->num_out_syncobjs);
+
 	if (!IS_ERR(submit->buf))
 		kvfree(submit->buf);
 
@@ -173,6 +381,8 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 		return err;
 	}
 
+	submit->num_out_syncobjs = exbuf->num_out_syncobjs;
+	submit->num_in_syncobjs = exbuf->num_in_syncobjs;
 	submit->out_fence = out_fence;
 	submit->fence_ctx = fence_ctx;
 	submit->ring_idx = ring_idx;
@@ -285,6 +495,14 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto cleanup;
 
+	ret = virtio_gpu_parse_deps(&submit);
+	if (ret)
+		goto cleanup;
+
+	ret = virtio_gpu_parse_post_deps(&submit);
+	if (ret)
+		goto cleanup;
+
 	ret = virtio_gpu_install_out_fence_fd(&submit);
 	if (ret)
 		goto cleanup;
@@ -294,6 +512,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		goto cleanup;
 
 	virtio_gpu_submit(&submit);
+	virtio_gpu_process_post_deps(&submit);
 	virtio_gpu_complete_submit(&submit);
 cleanup:
 	virtio_gpu_cleanup_submit(&submit);
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 7b158fcb02b4..ce4948aacafd 100644
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
 /* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag is set. */
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
@@ -73,7 +83,11 @@ struct drm_virtgpu_execbuffer {
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
2.39.2

