Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB072276524
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EFA6EA2A;
	Thu, 24 Sep 2020 00:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD756EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:35 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f18so736700pfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ov+uNTFyykfN8s/Ihlj9Oe3dnyFVG8aGLcJ922NpizE=;
 b=W5jCBw7t0MLz6v+Cnzz1o3TPNyBVDTUM0k4z1UFDYwJub85z6S6xwPe04fpspUFjc0
 BfvG8+Ppq8ulANNrgEr5zXhQcMFRIWC1CzDk7cTYxx3hIcD+UZ2KayB8CLKSHgLJcbeg
 S4/d8etNPVTQE0HEvPtikVhBO/KQtthfjyvLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ov+uNTFyykfN8s/Ihlj9Oe3dnyFVG8aGLcJ922NpizE=;
 b=nH4oMKjQ4BOeM/1Th/vv7fOpPEmYW5t9liQsSUXT+CJElHkjpj6oLZhT7pDX/A8HdZ
 QNt19OaoX+NofzsR/pKk1e74mD9X0I2GUrvP8CrDgbY6YEPWM+FOBvQQDAbyHkydF2lZ
 kUGKCZBghjElSwnnmiFLSl7LeVijEgGVS/UNP9B9NN8qF+3aARk751OMMYin3jjetxqG
 oPeidmaTKmvA23/t0leKKUc7xdg0W/7xxVoXMKknxKpe7or8NCgPd/2iC/KSzdjnMigh
 uD5VvKS/7HmZ0OuVeATS9WAB5RdPNLcXtyxmiXXKN43WvPY+P0b+Dz/LvaDzEAs5/OJf
 lApw==
X-Gm-Message-State: AOAM532nEflKTkjGy7cR1g4NXCMxY6dlOb7khg9n3ZPCTih9Z5h2A9Yi
 EuJc+NPowcHyM5sZzPedJAcSmL2TXnwb+g==
X-Google-Smtp-Source: ABdhPJyiRndd4/3/dxgE0ZQWIpIui+Zj408+i+bfYkXopbUCJyqSHLJDmvXJHaSZ9yKRrg6DtqWu4w==
X-Received: by 2002:a65:4641:: with SMTP id k1mr1819662pgr.133.1600907554619; 
 Wed, 23 Sep 2020 17:32:34 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:34 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/19] drm/virtio: implement blob resources: resource
 create blob ioctl
Date: Wed, 23 Sep 2020 17:32:13 -0700
Message-Id: <20200924003214.662-18-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
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
index ad16cef9a39b8..3c0e17212c336 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -257,8 +257,8 @@ struct virtio_gpu_fpriv {
 	struct mutex context_lock;
 };
 
-/* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 10
+/* virtio_ioctl.c */
+#define DRM_VIRTIO_NUM_IOCTLS 11
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b0c9dd171ad8a..3ede098c1d280 100644
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
@@ -521,6 +525,134 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
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
+		if (rc_blob->cmd_size % 4 != 0)
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
+	bool guest_blob = false;
+	bool host3d_blob = false;
+	struct drm_gem_object *obj;
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct drm_virtgpu_resource_create_blob *rc_blob = data;
+
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
@@ -553,4 +685,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
+			  virtio_gpu_resource_create_blob,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 099f10313815a..82250daae5ebd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -245,7 +245,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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
index 087945fcd230f..23c21bc4d01e2 100644
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
