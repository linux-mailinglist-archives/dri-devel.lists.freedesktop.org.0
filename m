Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28250244332
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F876EADA;
	Fri, 14 Aug 2020 02:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0F6EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:32 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id i92so5032591pje.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03TM0eEr5e4EPUyQFXHUGoZTKUsQHLH1U7uiugri8wc=;
 b=gpjD3YjddgqqhZQIobJbWabpRgdsILZez7eUlqak/CHYYZ+DwRS6Nh+7F6Esx/CjLd
 /6TUGgdieJIILyjvAmptFZw8XLDBcVNtqwYr4UqrJshS9LyQw6NXTtmqEnOhWIEsob9G
 GjAq6v0ezxPTbr6ojpkOx9X2AubzYSzWSY0Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03TM0eEr5e4EPUyQFXHUGoZTKUsQHLH1U7uiugri8wc=;
 b=dtfTD33nyG0/3yuqiIVXX7KIH0dPjHt/Z+YuOLBt4usks8MiLLwu/sYPxE/KvQAelx
 VxHVyeD3xwZ3y/3Y/3nADOgO3tsY9I8Nb6GUydnIpRYzSSUNjDWKId32xp8gzf8t+KsR
 0z0bb002u/cIyHdgXguM5+z0RFnZKXXIuoZWOTVV2NUcltCOQmn7nkcCU+RwuDKu0DYN
 6e8FFddeYjwW52apac+8E4nk8F8pa1fOiKPUBIcD8imJbkL8bLfmWl1zsP0nF0HuBa92
 Aa7XI0KzkP8e67B1BiO8+mG510mqCWEx2Avm7TYBYe/jImskc7ZGdmooi9Od09FeZAPN
 gKRg==
X-Gm-Message-State: AOAM531GP1YaMKuZmYbQEQXUv1VkyKepX5jf5FuHpySpYjxKowTAhWwl
 lzPJM8OnOgXMTbLl8FWlg/Zmfa986bI=
X-Google-Smtp-Source: ABdhPJxSfZP9vXscVW3OPAaA4PjsHi7fyCIFrkVAlKBiPeQat+594gtz184Qwt83u3KD+FFNCYwZUQ==
X-Received: by 2002:a17:902:bd85:: with SMTP id q5mr516384pls.99.1597372831523; 
 Thu, 13 Aug 2020 19:40:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 23/24] drm/virtio: implement blob resources: resource create
 blob ioctl
Date: Thu, 13 Aug 2020 19:39:59 -0700
Message-Id: <20200814024000.2485-24-gurchetansingh@chromium.org>
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

From: Gerd Hoffmann <kraxel@redhat.com>

Implement resource create blob as specified.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 136 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c |   5 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c   |   2 +
 4 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 444b65c8d4ee..3e9ec5b1fb63 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -255,8 +255,8 @@ struct virtio_gpu_fpriv {
 	struct mutex context_lock;
 };
 
-/* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 10
+/* virtio_ioctl.c */
+#define DRM_VIRTIO_NUM_IOCTLS 11
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 7dbe24248a20..47ac32b7031a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -34,6 +34,10 @@
 
 #include "virtgpu_drv.h"
 
+#define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
+				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
+				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
+
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -520,6 +524,134 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	return 0;
 }
 
+static int verify_blob(struct virtio_gpu_device *vgdev,
+		       struct virtio_gpu_fpriv *vfpriv,
+		       struct virtio_gpu_object_params *params,
+		       struct drm_virtgpu_resource_create_blob *rc_blob,
+		       bool *guest_blob, bool *host3d_blob)
+{
+	if (!vgdev->has_resource_blob)
+		return -EINVAL;
+
+	if ((rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK) ||
+	    !rc_blob->blob_flags)
+		return -EINVAL;
+
+	if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
+		if (!vgdev->has_resource_assign_uuid)
+			return -EINVAL;
+	}
+
+	switch (rc_blob->blob_mem) {
+	case VIRTGPU_BLOB_MEM_GUEST:
+		*guest_blob = true;
+		break;
+	case VIRTGPU_BLOB_MEM_HOST3D_GUEST:
+		*guest_blob = true;
+		fallthrough;
+	case VIRTGPU_BLOB_MEM_HOST3D:
+		*host3d_blob = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (*host3d_blob) {
+		if (!vgdev->has_virgl_3d)
+			return -EINVAL;
+
+		/* Must be dword aligned. */
+		if ((rc_blob->cmd_size) % 4 != 0)
+			return -EINVAL;
+
+		params->ctx_id = vfpriv->ctx_id;
+		params->blob_id = rc_blob->blob_id;
+	} else {
+		if (rc_blob->blob_id != 0)
+			return -EINVAL;
+
+		if (rc_blob->cmd_size != 0)
+			return -EINVAL;
+	}
+
+	params->blob_mem = rc_blob->blob_mem;
+	params->size = rc_blob->size;
+	params->blob = true;
+	params->blob_flags = rc_blob->blob_flags;
+	return 0;
+}
+
+static int virtio_gpu_resource_create_blob(struct drm_device *dev,
+					   void *data, struct drm_file *file)
+{
+	int ret = 0;
+	uint32_t handle = 0;
+	struct drm_gem_object *obj;
+	struct virtio_gpu_object *bo;
+	bool host3d_blob, guest_blob;
+	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct drm_virtgpu_resource_create_blob *rc_blob = data;
+
+	guest_blob = host3d_blob = false;
+	if (verify_blob(vgdev, vfpriv, &params, rc_blob,
+			&guest_blob, &host3d_blob))
+		return -EINVAL;
+
+	if (vgdev->has_virgl_3d)
+		virtio_gpu_create_context(dev, file);
+
+	if (rc_blob->cmd_size) {
+		void *buf;
+
+		buf = memdup_user(u64_to_user_ptr(rc_blob->cmd),
+				  rc_blob->cmd_size);
+
+		if (IS_ERR(buf))
+			return PTR_ERR(buf);
+
+		virtio_gpu_cmd_submit(vgdev, buf, rc_blob->cmd_size,
+				      vfpriv->ctx_id, NULL, NULL);
+	}
+
+	if (guest_blob)
+		ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
+	else if (!guest_blob && host3d_blob)
+		ret = virtio_gpu_vram_create(vgdev, &params, &bo);
+	else
+		return -EINVAL;
+
+	if (ret < 0)
+		return ret;
+
+	bo->guest_blob = guest_blob;
+	bo->host3d_blob = host3d_blob;
+	bo->blob_mem = rc_blob->blob_mem;
+	bo->blob_flags = rc_blob->blob_flags;
+
+	obj = &bo->base.base;
+	if (params.blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
+		ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
+		if (ret) {
+			drm_gem_object_release(obj);
+			return ret;
+		}
+	}
+
+	ret = drm_gem_handle_create(file, obj, &handle);
+	if (ret) {
+		drm_gem_object_release(obj);
+		return ret;
+	}
+	drm_gem_object_put(obj);
+
+	rc_blob->res_handle = bo->hw_res_handle;
+	rc_blob->bo_handle = handle;
+
+	return 0;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -552,4 +684,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
+			  virtio_gpu_resource_create_blob,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 432b9985ef2e..43f383946a7d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -244,7 +244,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	if (params->virgl) {
+	if (params->blob) {
+		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
+						    ents, nents);
+	} else if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 3e7e29e56781..d8ea11bd07fe 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -149,6 +149,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
+	virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, NULL,
+					    0);
 	if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
 		ret = virtio_gpu_vram_map(&vram->base);
 		if (ret) {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
