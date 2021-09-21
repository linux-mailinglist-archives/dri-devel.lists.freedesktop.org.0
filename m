Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01830413DF1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EE76E90A;
	Tue, 21 Sep 2021 23:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940C6E8FC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:33 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id n18so492234plp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F5qZvd/7vsQpebhiYzDOD8FlspZxFHEgqpo16c65n9U=;
 b=fBaD7mXFQbTkfgYf1ZuMw/VHoPlb/qu1RfYyoznv4M+oawkqI3qwhRhBtazYOGc351
 B6PRzLTbzr3BaepaBOGpnOhbmZFnvmcDqL4xC2z8M9UeV6Mqr457NU26UJNTwslAErcP
 ripq3LQVNVla69L7OHZ8ygaDW/Q7vZ3c47SOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5qZvd/7vsQpebhiYzDOD8FlspZxFHEgqpo16c65n9U=;
 b=6TtHhE7Qo6pDQGKg6jttujRyg/TvLouFdwEE8Q3EHaEFu4LjsPpENcOJCQOMyC1ipD
 jcboS2GkVYN2m7bfVbfpkkGQncWGikAf8KBJejQhsh22/ztjRj5L7kf8O4pfKxtAwB1T
 pbsvACAC7S8wDcOM2NwYDhPe+oFNNKMjKEWSAzyiQo1TTVcD2j02BYQDV51OjvLjCpMk
 /n19agqGxyFuRac3Gj/9PuJkKUM6t5qUnRJWf+vvvR6tXXETCo0jJXs975r3KkLoYy0l
 TV4We5gMpc9XvKI3rjLZl049V9B0/4MvQsyVCnoizVt5S9kd9iervI47LtGnkhyQqBQT
 yD0A==
X-Gm-Message-State: AOAM533gF8lUmyVhsuzl+FM53WAu7n4QakTn9W5MTRSapHD20MGZAmA/
 vTksuhVC9tmKOOS6PjhkzTJxsgBnXAS4tg==
X-Google-Smtp-Source: ABdhPJwfnNhs9CSZv8zWbZNCJ31fMDC0LVvrijl/SvrrPKf73gnyTKio9m0l9wHjmU+WTC0reavvmg==
X-Received: by 2002:a17:90a:578e:: with SMTP id
 g14mr8093111pji.184.1632266432176; 
 Tue, 21 Sep 2021 16:20:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 05/12] drm/virtio: implement context init: support init
 ioctl
Date: Tue, 21 Sep 2021 16:20:17 -0700
Message-Id: <20210921232024.817-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

This implements the context initialization ioctl.  A list of params
is passed in by userspace, and kernel driver validates them.  The
only currently supported param is VIRTGPU_CONTEXT_PARAM_CAPSET_ID.

If the context has already been initialized, -EEXIST is returned.
This happens after Linux userspace does dumb_create + followed by
opening the Mesa virgl driver with the same virtgpu instance.

However, for most applications, 3D contexts will be explicitly
initialized when the feature is available.

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 96 ++++++++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  4 +-
 3 files changed, 98 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5e1958a522ff..9996abf60e3a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -259,12 +259,13 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	uint32_t context_init;
 	bool context_created;
 	struct mutex context_lock;
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 11
+#define DRM_VIRTIO_NUM_IOCTLS 12
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -342,7 +343,8 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_drv_cap_cache **cache_p);
 int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
-				   uint32_t nlen, const char *name);
+				   uint32_t context_init, uint32_t nlen,
+				   const char *name);
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 				    uint32_t id);
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5c1ad1596889..f5281d1e30e1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -38,20 +38,30 @@
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
 
+/* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
+static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
+					     struct virtio_gpu_fpriv *vfpriv)
+{
+	char dbgname[TASK_COMM_LEN];
+
+	get_task_comm(dbgname, current);
+	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+				      vfpriv->context_init, strlen(dbgname),
+				      dbgname);
+
+	vfpriv->context_created = true;
+}
+
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	char dbgname[TASK_COMM_LEN];
 
 	mutex_lock(&vfpriv->context_lock);
 	if (vfpriv->context_created)
 		goto out_unlock;
 
-	get_task_comm(dbgname, current);
-	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
-				      strlen(dbgname), dbgname);
-	vfpriv->context_created = true;
+	virtio_gpu_create_context_locked(vgdev, vfpriv);
 
 out_unlock:
 	mutex_unlock(&vfpriv->context_lock);
@@ -662,6 +672,79 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 	return 0;
 }
 
+static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
+					 void *data, struct drm_file *file)
+{
+	int ret = 0;
+	uint32_t num_params, i, param, value;
+	size_t len;
+	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct drm_virtgpu_context_init *args = data;
+
+	num_params = args->num_params;
+	len = num_params * sizeof(struct drm_virtgpu_context_set_param);
+
+	if (!vgdev->has_context_init || !vgdev->has_virgl_3d)
+		return -EINVAL;
+
+	/* Number of unique parameters supported at this time. */
+	if (num_params > 1)
+		return -EINVAL;
+
+	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
+				     len);
+
+	if (IS_ERR(ctx_set_params))
+		return PTR_ERR(ctx_set_params);
+
+	mutex_lock(&vfpriv->context_lock);
+	if (vfpriv->context_created) {
+		ret = -EEXIST;
+		goto out_unlock;
+	}
+
+	for (i = 0; i < num_params; i++) {
+		param = ctx_set_params[i].param;
+		value = ctx_set_params[i].value;
+
+		switch (param) {
+		case VIRTGPU_CONTEXT_PARAM_CAPSET_ID:
+			if (value > MAX_CAPSET_ID) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			if ((vgdev->capset_id_mask & (1 << value)) == 0) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			/* Context capset ID already set */
+			if (vfpriv->context_init &
+			    VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			vfpriv->context_init |= value;
+			break;
+		default:
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
+
+	virtio_gpu_create_context_locked(vgdev, vfpriv);
+	virtio_gpu_notify(vgdev);
+
+out_unlock:
+	mutex_unlock(&vfpriv->context_lock);
+	kfree(ctx_set_params);
+	return ret;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -698,4 +781,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
 			  virtio_gpu_resource_create_blob_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 93a41d018dca..db7741549ab0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -911,7 +911,8 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 }
 
 void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
-				   uint32_t nlen, const char *name)
+				   uint32_t context_init, uint32_t nlen,
+				   const char *name)
 {
 	struct virtio_gpu_ctx_create *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -922,6 +923,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_CREATE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	cmd_p->nlen = cpu_to_le32(nlen);
+	cmd_p->context_init = cpu_to_le32(context_init);
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-- 
2.33.0.464.g1972c5931b-goog

