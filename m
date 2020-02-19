Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99B163EE0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13766EB20;
	Wed, 19 Feb 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B3F6E454
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:08:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z7so12322163pgk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSzKK8BCwkD8FHkSBucU8yQR6HsfuagTE5XZBCrw2mU=;
 b=VyM3x9pLDGqI3CLYa+8cazQnE/LRT0AOwME3pbequOvWAMFaurQXnVUno6cbTgCW8Q
 dJdVtY0fJHs8R5rtr0W1/ehvAPKdjr6i8Xf0HBu6zglMuD9MM6QXTQ/4oIR7AIhsURyQ
 gkZwMpguNQG/2buSFnbPQ+Bu8DGA7YpC5QJvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSzKK8BCwkD8FHkSBucU8yQR6HsfuagTE5XZBCrw2mU=;
 b=JxndDpkQ8A0vpfDzZQ/PsqMnzddbLvw5pM0RSvotID8qjSelfNBEztQ1VDz784AHYE
 LDFiTGB5rorkhtw1eNK8e+rbzGF1Mml+7J7571M+ibGiJBtrTqRq7aq8ByP7z0Skp8bF
 +O6S3N3lIHl+hcbSYCHWwol0esn4RPek87hkTuuQsy6lJ5EVNByRl5hgl7lGo43RN8eX
 tuXO+6EmlXwOQUBi3Zu1J7+upI6GYWy7aTPD4k3ATujPX3fpoWI7tPlBIdR/IOsTdj0J
 UVYdfVSk86ztAyrArYhvbh0V+HKpbah5q62PL7NYKCFRvBetFtKa20mHtzyLkVXcuZPi
 pkDA==
X-Gm-Message-State: APjAAAVvfOTwurbuaK5o0Thr/oW1jChn5BxiJO+j1NkhXzIUh0zfqByl
 C6WqDnSz/mGdapxf2ZJInN9CRg==
X-Google-Smtp-Source: APXvYqzHJJjmqguqEsvEtwKu3vJPAlUT0KaWBUmaezck/HbJI8icSJsLZ98sRnYTF7udeBsGbtFtpg==
X-Received: by 2002:a63:646:: with SMTP id 67mr26499922pgg.376.1582099711987; 
 Wed, 19 Feb 2020 00:08:31 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
 by smtp.gmail.com with ESMTPSA id iq22sm1474388pjb.9.2020.02.19.00.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 00:08:31 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 2/2] drm/virtio: Support virtgpu exported resources
Date: Wed, 19 Feb 2020 17:06:37 +0900
Message-Id: <20200219080637.61312-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200219080637.61312-1-stevensd@chromium.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for exported resources to virtgpu. This includes adding
support for the new virtgpu command as well as well as switching from
regular prime dma-bufs to virtio dma-bufs.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   |   3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  21 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |   4 +
 drivers/gpu/drm/virtio/virtgpu_prime.c | 109 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  58 +++++++++++++
 include/uapi/linux/virtio_gpu.h        |  19 +++++
 6 files changed, 211 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ab4bed78e656..538ed981fea9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -165,6 +165,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_VIRGL,
 #endif
 	VIRTIO_GPU_F_EDID,
+	VIRTIO_GPU_F_CROSS_DEVICE,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
@@ -201,6 +202,8 @@ static struct drm_driver driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.gem_prime_export = virtgpu_gem_prime_export,
+	.gem_prime_import = virtgpu_gem_prime_import,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af9403e1cf78..0d272fc26bf2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -27,6 +27,7 @@
 #define VIRTIO_DRV_H
 
 #include <linux/virtio.h>
+#include <linux/virtio_dma_buf.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_gpu.h>
@@ -49,6 +50,11 @@
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
+#define UUID_NOT_INITIALIZED 0
+#define UUID_INITIALIZING 1
+#define UUID_INITIALIZED 2
+#define UUID_INITIALIZATION_FAILED 3
+
 struct virtio_gpu_object_params {
 	uint32_t format;
 	uint32_t width;
@@ -75,6 +81,9 @@ struct virtio_gpu_object {
 
 	bool dumb;
 	bool created;
+
+	int uuid_state;
+	uuid_t uuid;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -196,6 +205,7 @@ struct virtio_gpu_device {
 	bool has_virgl_3d;
 	bool has_edid;
 	bool has_indirect;
+	bool has_resource_assign_uuid;
 
 	struct work_struct config_changed_work;
 
@@ -206,6 +216,8 @@ struct virtio_gpu_device {
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
 	struct list_head cap_cache;
+
+	spinlock_t resource_export_lock;
 };
 
 struct virtio_gpu_fpriv {
@@ -338,6 +350,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
 void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
 
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
+
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
@@ -366,6 +382,11 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 /* virtgpu_prime.c */
+extern const struct virtio_dma_buf_ops virtgpu_dmabuf_ops;
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags);
+struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
+						struct dma_buf *buf);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 4009c2f97d08..be9719fb457b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -134,6 +134,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	vgdev->dev = dev->dev;
 
 	spin_lock_init(&vgdev->display_info_lock);
+	spin_lock_init(&vgdev->resource_export_lock);
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
@@ -159,6 +160,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
 		vgdev->has_edid = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CROSS_DEVICE)) {
+		vgdev->has_resource_assign_uuid = true;
+	}
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		vgdev->has_indirect = true;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 050d24c39a8f..667cd4e45bfd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -22,13 +22,116 @@
  * Authors: Andreas Pokorny
  */
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
+#include <linux/dma-buf.h>
+#include <linux/virtio_dma_buf.h>
+
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
+	if (bo->uuid_state == UUID_NOT_INITIALIZED)
+		return -ENODEV;
+
+	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
+	if (bo->uuid_state == UUID_INITIALIZATION_FAILED)
+		return -ENODEV;
+
+	uuid_copy(uuid, &bo->uuid);
+
+	return 0;
+}
+
+int virtgpu_virtio_attach(struct dma_buf *buf,
+			  struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = buf->priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	bool needs_init = false;
+	int ret = 0;
+
+	if (!vgdev->has_resource_assign_uuid)
+		return 0;
+
+	spin_lock(&vgdev->resource_export_lock);
+	if (bo->uuid_state == UUID_NOT_INITIALIZED) {
+		bo->uuid_state = UUID_INITIALIZING;
+		needs_init = true;
+	}
+	spin_unlock(&vgdev->resource_export_lock);
+
+	if (needs_init)
+		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);
+	return ret;
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
+	.virtio_attach = virtgpu_virtio_attach,
+	.device_attach = drm_gem_map_attach,
+	.get_uuid = virtgpu_virtio_get_uuid,
+};
+
+struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
+					 int flags)
+{
+	struct dma_buf *buf;
+	struct drm_device *dev = obj->dev;
+	DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(exp_info);
+
+	exp_info.ops = &virtgpu_dmabuf_ops;
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
index cfe9c54f87a3..e9e7b1f885f6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1111,3 +1111,61 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
 	virtio_gpu_queue_cursor(vgdev, vbuf);
 }
+
+static void virtio_gpu_cmd_resource_assign_uuid_cb(struct virtio_gpu_device *vgdev,
+						   struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_resp_resource_assign_uuid *resp =
+		(struct virtio_gpu_resp_resource_assign_uuid *)vbuf->resp_buf;
+	struct virtio_gpu_object *obj =
+		(struct virtio_gpu_object *)vbuf->data_buf;
+	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
+
+	/*
+	 * Keeps the data_buf, which points to this virtio_gpu_object, from
+	 * getting kfree'd after this cb returns.
+	 */
+	vbuf->data_buf = NULL;
+
+	spin_lock(&vgdev->resource_export_lock);
+	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
+
+	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID &&
+			obj->uuid_state == UUID_INITIALIZING) {
+		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
+		obj->uuid_state = UUID_INITIALIZED;
+	} else {
+		obj->uuid_state = UUID_INITIALIZATION_FAILED;
+	}
+	spin_unlock(&vgdev->resource_export_lock);
+
+	drm_gem_object_put_unlocked(&obj->base.base);
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_resource_assign_uuid *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	struct virtio_gpu_resp_resource_assign_uuid *resp_buf;
+
+	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
+		virtio_gpu_cmd_resource_assign_uuid_cb, &vbuf, sizeof(*cmd_p),
+		sizeof(struct virtio_gpu_resp_resource_assign_uuid), resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	/* Reuse the data_buf pointer for the object pointer. */
+	vbuf->data_buf = bo;
+	drm_gem_object_get(&bo->base.base);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0c85914d9369..9c428ef03060 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -50,6 +50,10 @@
  * VIRTIO_GPU_CMD_GET_EDID
  */
 #define VIRTIO_GPU_F_EDID                1
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID
+ */
+#define VIRTIO_GPU_F_CROSS_DEVICE        2
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -66,6 +70,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_GET_CAPSET_INFO,
 	VIRTIO_GPU_CMD_GET_CAPSET,
 	VIRTIO_GPU_CMD_GET_EDID,
+	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -87,6 +92,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_CAPSET_INFO,
 	VIRTIO_GPU_RESP_OK_CAPSET,
 	VIRTIO_GPU_RESP_OK_EDID,
+	VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -340,4 +346,17 @@ enum virtio_gpu_formats {
 	VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM  = 134,
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID */
+struct virtio_gpu_resource_assign_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+};
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID */
+struct virtio_gpu_resp_resource_assign_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u8 uuid[16];
+};
+
 #endif
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
