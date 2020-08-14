Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B296D244316
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBA96E593;
	Fri, 14 Aug 2020 02:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930476E593
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:08 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id l60so3716634pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6AefrnQTm7+Ftlk7R8O0rVOC1Cv+dYf4bls/sTp1t8=;
 b=Pq0XZBQO5SFZSIgY5GTHAkNUnQw8TjW/cdd2HGQJih/4TvxUDVX8hV2NgGumgvBF9y
 um5AE10R4AXJMNJOGejnXSjCVv2SLTSWUvmW3Sl3WJABMQopmfFeHf7gBuHsA/P1szWK
 d2LOu4zRuoDoBnAihkN8uEwxuJFxcNKlBu9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6AefrnQTm7+Ftlk7R8O0rVOC1Cv+dYf4bls/sTp1t8=;
 b=tpNf1I1e2xakT2OaufxKu14s0F6LyGpCV63w2YAo1BAvaLL7Anwsidlszti94QzXmB
 +QHhULmp+NKU6mvWWlrRbkH7duaZSDeCVxWiVQtJqaf1qEyffqZJ/ReaRduVkbLpUwB4
 QJrExKnWchcGE5KdHzpAeRYXYjUPEFzcXHt8RDryP8lvI5yPmgjrOiHxkCrufKGAdU/y
 e4brixkj3cCZr5DznvhFpiGLc4G/zjaJfLuqXnMcnNyHFwO3nrBhDz/KsfcOeafSl+OD
 gIO0OZBgVaWYONrVTVbY02MmUQXkeXjDUPRUxVsiJBwF5BblP1qd7IRgSB5XDVNI85/D
 fkcA==
X-Gm-Message-State: AOAM532IW3FOOJ/VkAgX3ht7imTp6g7rPStAk7nh9sEB1W9X0XFA9+x0
 Y6acgt3gpyXH9k9kTtbBr2+a15bFVl1PAw==
X-Google-Smtp-Source: ABdhPJxoOMZTYLkSbdPx99mNttHl4NkS90uP5H0yS0Jyp1ksRWemidmjX7w1k0rEU27cO3Th55J+og==
X-Received: by 2002:a17:90a:4709:: with SMTP id
 h9mr485390pjg.235.1597372807676; 
 Thu, 13 Aug 2020 19:40:07 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:07 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 04/24] drm/virtio: Support virtgpu exported resources
Date: Thu, 13 Aug 2020 19:39:40 -0700
Message-Id: <20200814024000.2485-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Add support for UUID-based resource sharing mechanism to virtgpu. This
implements the new virtgpu commands and hooks them up to dma-buf's
get_uuid callback.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 5 files changed, 175 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ab4bed78e656..b039f493bda9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -165,6 +165,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_VIRGL,
 #endif
 	VIRTIO_GPU_F_EDID,
+	VIRTIO_GPU_F_RESOURCE_UUID,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
@@ -202,6 +203,8 @@ static struct drm_driver driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_mmap = drm_gem_prime_mmap,
+	.gem_prime_export = virtgpu_gem_prime_export,
+	.gem_prime_import = virtgpu_gem_prime_import,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
 	.gem_create_object = virtio_gpu_create_object,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9ff9f4ac0522..fc84b4b526ff 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -49,6 +49,10 @@
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
+#define UUID_INITIALIZING 0
+#define UUID_INITIALIZED 1
+#define UUID_INITIALIZATION_FAILED 2
+
 struct virtio_gpu_object_params {
 	uint32_t format;
 	uint32_t width;
@@ -71,6 +75,9 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+
+	int uuid_state;
+	uuid_t uuid;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -200,6 +207,7 @@ struct virtio_gpu_device {
 	bool has_virgl_3d;
 	bool has_edid;
 	bool has_indirect;
+	bool has_resource_assign_uuid;
 
 	struct work_struct config_changed_work;
 
@@ -210,6 +218,8 @@ struct virtio_gpu_device {
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
 	struct list_head cap_cache;
+
+	spinlock_t resource_export_lock;
 };
 
 struct virtio_gpu_fpriv {
@@ -336,6 +346,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_array *objs);
+
 /* virtgpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
@@ -367,6 +381,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 /* virtgpu_prime.c */
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags);
+struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
+						struct dma_buf *buf);
+int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
+			       uuid_t *uuid);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 0a5c8cf409fb..bf060c69850f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -118,6 +118,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	vgdev->dev = dev->dev;
 
 	spin_lock_init(&vgdev->display_info_lock);
+	spin_lock_init(&vgdev->resource_export_lock);
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
@@ -146,6 +147,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		vgdev->has_indirect = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
+		vgdev->has_resource_assign_uuid = true;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid\n",
 		 vgdev->has_virgl_3d ? '+' : '-',
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 050d24c39a8f..acd14ef73d56 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -23,12 +23,102 @@
  */
 
 #include <drm/drm_prime.h>
+#include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
 
-/* Empty Implementations as there should not be any other driver for a virtual
- * device that might share buffers with virtgpu
- */
+static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
+				   uuid_t *uuid)
+{
+	struct drm_gem_object *obj = buf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+
+	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
+	if (bo->uuid_state != UUID_INITIALIZED)
+		return -ENODEV;
+
+	uuid_copy(uuid, &bo->uuid);
+
+	return 0;
+}
+
+const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
+	.ops = {
+		.cache_sgt_mapping = true,
+		.attach = virtio_dma_buf_attach,
+		.detach = drm_gem_map_detach,
+		.map_dma_buf = drm_gem_map_dma_buf,
+		.unmap_dma_buf = drm_gem_unmap_dma_buf,
+		.release = drm_gem_dmabuf_release,
+		.mmap = drm_gem_dmabuf_mmap,
+		.vmap = drm_gem_dmabuf_vmap,
+		.vunmap = drm_gem_dmabuf_vunmap,
+	},
+	.device_attach = drm_gem_map_attach,
+	.get_uuid = virtgpu_virtio_get_uuid,
+};
+
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags)
+{
+	struct dma_buf *buf;
+	struct drm_device *dev = obj->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_object_array *objs;
+	int ret = 0;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	if (vgdev->has_resource_assign_uuid) {
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return ERR_PTR(-ENOMEM);
+		virtio_gpu_array_add_obj(objs, &bo->base.base);
+
+		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
+		if (ret)
+			return ERR_PTR(ret);
+		virtio_gpu_notify(vgdev);
+	} else {
+		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+	}
+
+	exp_info.ops = &virtgpu_dmabuf_ops.ops;
+	exp_info.size = obj->size;
+	exp_info.flags = flags;
+	exp_info.priv = obj;
+	exp_info.resv = obj->resv;
+
+	buf = virtio_dma_buf_export(&exp_info);
+	if (IS_ERR(buf))
+		return buf;
+
+	drm_dev_get(dev);
+	drm_gem_object_get(obj);
+
+	return buf;
+}
+
+struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
+						struct dma_buf *buf)
+{
+	struct drm_gem_object *obj;
+
+	if (buf->ops == &virtgpu_dmabuf_ops.ops) {
+		obj = buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	return drm_gem_prime_import(dev, buf);
+}
 
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9e663a5d9952..55af6fc7bc7c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1107,3 +1107,58 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
 	virtio_gpu_queue_cursor(vgdev, vbuf);
 }
+
+static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
+					    struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_object *obj =
+		gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
+	struct virtio_gpu_resp_resource_uuid *resp =
+		(struct virtio_gpu_resp_resource_uuid *)vbuf->resp_buf;
+	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
+
+	spin_lock(&vgdev->resource_export_lock);
+	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
+
+	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
+			obj->uuid_state == UUID_INITIALIZING) {
+		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
+		obj->uuid_state = UUID_INITIALIZED;
+	} else {
+		obj->uuid_state = UUID_INITIALIZATION_FAILED;
+	}
+	spin_unlock(&vgdev->resource_export_lock);
+
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_array *objs)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_resource_assign_uuid *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	struct virtio_gpu_resp_resource_uuid *resp_buf;
+
+	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
+	if (!resp_buf) {
+		spin_lock(&vgdev->resource_export_lock);
+		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+		spin_unlock(&vgdev->resource_export_lock);
+		virtio_gpu_array_put_free(objs);
+		return -ENOMEM;
+	}
+
+	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
+		virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
+		sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	vbuf->objs = objs;
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
