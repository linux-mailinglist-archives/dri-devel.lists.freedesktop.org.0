Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB714042C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE3E6E419;
	Thu,  9 Sep 2021 01:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF55D6E40D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:25 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 8so171138pga.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvKjwE2JKDtBjlXrlI3btFMr/4QdycYBRwP/KpaICnA=;
 b=kOohLhFugmOW1NwUAPaWK8hpR2utL6IL7FZgg8wtToXPv0m0ocSMMM/4hMP7Xbz1Q0
 z0i/J14GeS0HTrDx9iEd9CKpmxXK0lZ3hsyY+2aDFKNEgit7LzfIxouyRqSxcV4hgzbi
 piXgVtgzAl/u0zcd/VvlbXOZ0OThE16EthunI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvKjwE2JKDtBjlXrlI3btFMr/4QdycYBRwP/KpaICnA=;
 b=NsiGfYQGg+igWDChxyJfgLoxDYy51+C/1NgWVr+IC7fifAHiDuCsdysnIzQThPYpO6
 hUBQ/1YSoy9DT4eoqP4xrcoNX+rukT7ORwZdls2Q2aYqOcO5KJtFIn6eGUzKJk+Kfnhi
 rVSrptKO++YRallwp61+G1F+7yoB6mYpdmbg24+vJcgq13VQsyC6LMQ92O+DoWn3xdIi
 umIXPcyJJIcxsaiS2Eda4BRE2BCp/12D9YtyfLEp6672sB01mHyZRvwY59poFZyE4wsN
 x6TnaMZoobieuECzXeU7/niMmcRaIeaxMfYmAW5eNVwZPsJA/Us8q00ab4Bec7dY1JWG
 43rQ==
X-Gm-Message-State: AOAM533qPTesoRT8NU0fH/DCxmgjI69Pz5B002zapPHvHILuMGLwD7yi
 pELVlFUUWdGbgqvnO0u095mg+o9Ftcyu7scK
X-Google-Smtp-Source: ABdhPJxt0NDmUxZmXdl+8uLqNrNjdHRwMiord4tUG+lI/ZoEDvqQcOMrZTgP5bYqxybD5gSQ28ic3g==
X-Received: by 2002:a63:d205:: with SMTP id a5mr360888pgg.30.1631151444629;
 Wed, 08 Sep 2021 18:37:24 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:24 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 05/12] drm/virtio: implement context init: support init
 ioctl
Date: Wed,  8 Sep 2021 18:37:10 -0700
Message-Id: <20210909013717.861-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
index 2e71e91278b4..496f8ce4cd41 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -917,7 +917,8 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 }
 
 void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
-				   uint32_t nlen, const char *name)
+				   uint32_t context_init, uint32_t nlen,
+				   const char *name)
 {
 	struct virtio_gpu_ctx_create *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -928,6 +929,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_CREATE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	cmd_p->nlen = cpu_to_le32(nlen);
+	cmd_p->context_init = cpu_to_le32(context_init);
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-- 
2.33.0.153.gba50c8fa24-goog

