Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86B1F3501
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1341F6E9F5;
	Tue,  9 Jun 2020 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE476E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 01:26:12 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id b7so463146pju.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kM+saEeI+cRldgjHjkqk1hs/NOOmTVprCQO84ItXNs=;
 b=OwgtI2was10q7BxoS/IulWRSR2FsEnR4eUkAGlHVWwE4H2CHRz6synxarF7nM9bm90
 bMnZh9TDAIos+6VMAtFpv3fAgTLjoN0YcB+bJInY3W+o56o3N0xO4Ks56DXVYluS1evk
 MDm23EG3MADzLbHCxId4G3bP0q6VHz+EIS8bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kM+saEeI+cRldgjHjkqk1hs/NOOmTVprCQO84ItXNs=;
 b=E1GUhayWoZm4z+SnzHSg0STOyU0jXOBxstQXohvr0jWlVzwHl3MsBHZcd4PkIP12pH
 QMJ2Z0th1MkDoGaL3sriGPvXZNPPE7O+oDkQXcg5ToIfZrUfzHmsp/xj+XEfZE/LH07N
 MyfNWULm58mVfBDqt1dXYbWtNZFRwbFjw3XOhOlh6KLJRjpZG+wBi6X4kICJWlBmF2qd
 Fw8xcYHcWLM7Avq2LQJSlOVieez/SsHoZs1Wz8n3+Hl4SJxgZzZDvNj/pBCY+8gpnqiB
 ar8yJszybyxIAgoNHx+3jTF8lEkKtFtyPiHkVYnV6KvnWz90A3l9DmqHDHwXMDs4TF18
 Blag==
X-Gm-Message-State: AOAM533vk5LooT/KCK229JS6kl3aR8ymLSf8Irki2yqnkNdxK9AaPO6E
 dZ64ZeXkWKEavwGgiy+2h6fG/Q==
X-Google-Smtp-Source: ABdhPJw6Ap9uFmQEEEyjVROCKBsnbBR1vnTnXhgnkpNIbOoKEbTImq1jK9LEqGAmsQv/Hl4kmsma1g==
X-Received: by 2002:a17:902:7e4e:: with SMTP id
 a14mr1175083pln.329.1591665972205; 
 Mon, 08 Jun 2020 18:26:12 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id 71sm8259384pfb.20.2020.06.08.18.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 18:26:11 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 3/3] drm/virtio: Support virtgpu exported resources
Date: Tue,  9 Jun 2020 10:25:18 +0900
Message-Id: <20200609012518.198908-4-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: virtio-dev@lists.oasis-open.org, dri-devel@lists.freedesktop.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
index 49bebdee6d91..39dc907aa805 100644
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
@@ -335,6 +345,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
+int
+virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_array *objs);
+
 /* virtgpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
@@ -366,6 +380,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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
index 023a030ca7b9..7bcd0c75effa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -125,6 +125,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	vgdev->dev = dev->dev;
 
 	spin_lock_init(&vgdev->display_info_lock);
+	spin_lock_init(&vgdev->resource_export_lock);
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
@@ -153,6 +154,9 @@ int virtio_gpu_init(struct drm_device *dev)
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
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
