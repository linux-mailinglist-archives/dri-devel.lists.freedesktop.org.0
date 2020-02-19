Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875A1639C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 03:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2559B6EAFD;
	Wed, 19 Feb 2020 02:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A056EAFB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:03:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id e8so8869983plt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahdVAUkVUgHixqa71A6SxY9pTnBs4SJbiLDM/LQMDSQ=;
 b=E/7hn6jmD1VwY+K0TQKwqrT087hqEx43qetazFFIKxJtCquG7ohtFsjiaL4L6Sm0q3
 kZDDwvUbOgpq5MYVDdrpoJ1Uj3+CDQQrxCMxAfUQ50hu84gdjITwzL7PFrBzHsKhzf9X
 0ckcILvz48HYQFP7ioAIZX0H4bI37vS68ujl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahdVAUkVUgHixqa71A6SxY9pTnBs4SJbiLDM/LQMDSQ=;
 b=Kg9kg/sTqromVlQgLtulc+iQSkGjI7c3ijQBqAo6bzKIxBKhOR4xRFWBPIzfo/NA9Y
 E3WsuVmJ/4wt/I4RFVdvXvGTJJnbBeGt5i/g39hIeLk1s+VT3tGJhJ6ZnhT4EbTLopsA
 kAcfd0Ntv3+VkUvqirZ4hxNOZNUxNVQ75YLl3OK56IbCSP1iUfAgHPE+3hJssZjZNBFW
 5xVyr1nrt0k/uojxjX92YLw1Wa5SVTjYSk43WGfr4Sx22QMiXoqBrzPOX9Kl4JOjk1Wr
 UaEoHd/yp+u611NrA6xFu0cgCAGSvbUOiS5r+s3O0ekDj6+zDqWni91Z0m8cDPhVQin9
 vWDw==
X-Gm-Message-State: APjAAAU0Bk+yzeJ0sLN2AhwHJNdiIXBNpfGQGpz/HvbgOB+fa3vyfCaq
 TNTW1VllRLS8zA0qs3rdclVB1kCmHT8=
X-Google-Smtp-Source: APXvYqzyX4si7/lruqgkJZJgbWUO5QizFZI4kZ+PJbWf9L2PWxqpjksk1z30Vcm+w+pCTbEcFM17jg==
X-Received: by 2002:a17:90a:d986:: with SMTP id
 d6mr6261816pjv.78.1582077792747; 
 Tue, 18 Feb 2020 18:03:12 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 3sm216430pjg.27.2020.02.18.18.03.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 18:03:12 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5 v3] drm/virtio: enqueue virtio_gpu_create_context after
 the first 3D ioctl
Date: Tue, 18 Feb 2020 18:03:00 -0800
Message-Id: <20200219020301.1424-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219020301.1424-1-gurchetansingh@chromium.org>
References: <20200219020301.1424-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For old userspace, initialization will still be implicit.

For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
the first 3D ioctl.

v3: staticify virtio_gpu_create_context
    remove notify to batch vm-exit

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 --
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 -
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 99d94a87c28b..b68ce046490f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -216,8 +216,6 @@ struct virtio_gpu_fpriv {
 /* virtio_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
-void virtio_gpu_create_context(struct drm_device *dev,
-			       struct drm_file *file);
 
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 82312664f2e4..835628e65f13 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,8 +33,8 @@
 
 #include "virtgpu_drv.h"
 
-void virtio_gpu_create_context(struct drm_device *dev,
-			       struct drm_file *file)
+static void virtio_gpu_create_context(struct drm_device *dev,
+				      struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
@@ -51,7 +51,6 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
-	virtio_gpu_notify(vgdev);
 	vfpriv->context_initiated = true;
 
 out_unlock:
@@ -99,6 +98,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
+	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -250,6 +250,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	virtio_gpu_create_context(dev, file);
 	params.format = rc->format;
 	params.width = rc->width;
 	params.height = rc->height;
@@ -323,6 +324,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
+	virtio_gpu_create_context(dev, file);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -371,6 +373,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
+		virtio_gpu_create_context(dev, file);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -471,6 +474,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
+	virtio_gpu_create_context(dev, file);
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 	virtio_gpu_notify(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f4a9aa0048d2..5b0e7d973336 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -268,7 +268,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 
 	vfpriv->ctx_id = handle + 1;
 	file->driver_priv = vfpriv;
-	virtio_gpu_create_context(dev, file);
 	return 0;
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
