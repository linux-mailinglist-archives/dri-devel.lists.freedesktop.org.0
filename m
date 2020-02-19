Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49A165296
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 23:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0926E87F;
	Wed, 19 Feb 2020 22:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346336E87F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 22:34:45 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id q39so694062pjc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLvrFdz2FagFkUHAk/zYulgKjE8HWj7Z696wPfBZkEY=;
 b=LXbA57QvWxvo7yY3+IxDKbyVO2rQ3ah+Rr3UIA8iFs29M2x1jR0Ny9ZG3qXsMeIdvu
 TkGdklImhi1RbTgNmTjQPwJx6odPhBglmMgQ4dsyf5YMZAHHHa2qaBu1ObDNAk6o1lli
 Xt9S6DEAiA21BNIR5Ut2wJnmRT4dneMr2eJqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLvrFdz2FagFkUHAk/zYulgKjE8HWj7Z696wPfBZkEY=;
 b=IOEqAuyhxpF5eizFHBDlDie7+Awahnt1Hh/tjg2PuB934qGM6u138z4u98CNv2IEzJ
 v46JkcRkmgzCt1tzhv64eHZzaP6pG9BuvENkbaI+YGAGELGHtglxBLYzP+X9bgsXBqDF
 jZImtkuId4eci/+FSYG5dqFajyr/gxqq76sDDzSZ8XDzJweBbVYkK1Nzysu6LkqfbgJq
 6UvmSm0hlNj1zeDh6lrXzZWqQWpk063xnxjDTP0OY9fApaUeS/94Xf5OMZKZCZ3o7vY1
 WFG3RG6gEY5cbbEfuizAkro5t/Z/Y0idEVpTYGHbwzSrFUYbx3BEP9HV7YsdxKG85Qn0
 NBFQ==
X-Gm-Message-State: APjAAAUQUnJAfLUw24aLPr/MAPvpFCtdhadf26HSjieAW+Td1mkl1axx
 IZqamUEa9HcpqUIBxe8dac+6Pwuh7YY=
X-Google-Smtp-Source: APXvYqw8SeT1mT35xPVbt3SCQVBAwsa+xlnlycGAyjuOMBq5FS3geNCE8hYantoJH6TaorY6GE/55g==
X-Received: by 2002:a17:902:d205:: with SMTP id
 t5mr28310951ply.138.1582151684421; 
 Wed, 19 Feb 2020 14:34:44 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 70sm626574pfw.140.2020.02.19.14.34.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 14:34:43 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context after
 the first 3D ioctl
Date: Wed, 19 Feb 2020 14:34:23 -0800
Message-Id: <20200219223423.53319-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219223423.53319-1-gurchetansingh@chromium.org>
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
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
Cc: Emil Velikov <emil.velikov@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, emil.l.velikov@gmail.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For old userspace, initialization will still be implicit.

For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
the first 3D ioctl.

v3: staticify virtio_gpu_create_context
    remove notify to batch vm-exit
v6: Remove nested 3D checks (emil.velikov):
      - unify 3D check in resource create
      - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
        3D check there.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 --
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 32 +++++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 -
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 76b7b7c30e10..95a7443baaba 100644
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
index ec38cf5573aa..c36faa572caa 100644
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
@@ -95,6 +95,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
+	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -233,7 +234,17 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle = 0;
 	struct virtio_gpu_object_params params = { 0 };
 
-	if (vgdev->has_virgl_3d == false) {
+	if (vgdev->has_virgl_3d) {
+		virtio_gpu_create_context(dev, file);
+		params.virgl = true;
+		params.target = rc->target;
+		params.bind = rc->bind;
+		params.depth = rc->depth;
+		params.array_size = rc->array_size;
+		params.last_level = rc->last_level;
+		params.nr_samples = rc->nr_samples;
+		params.flags = rc->flags;
+	} else {
 		if (rc->depth > 1)
 			return -EINVAL;
 		if (rc->nr_samples > 1)
@@ -250,16 +261,6 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	params.width = rc->width;
 	params.height = rc->height;
 	params.size = rc->size;
-	if (vgdev->has_virgl_3d) {
-		params.virgl = true;
-		params.target = rc->target;
-		params.bind = rc->bind;
-		params.depth = rc->depth;
-		params.array_size = rc->array_size;
-		params.last_level = rc->last_level;
-		params.nr_samples = rc->nr_samples;
-		params.flags = rc->flags;
-	}
 	/* allocate a single page size object */
 	if (params.size == 0)
 		params.size = PAGE_SIZE;
@@ -319,6 +320,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
+	virtio_gpu_create_context(dev, file);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -367,6 +369,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
+		virtio_gpu_create_context(dev, file);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -466,6 +469,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	}
 	spin_unlock(&vgdev->display_info_lock);
 
+	if (vgdev->has_virgl_3d)
+		virtio_gpu_create_context(dev, file);
+
 	/* not in cache - need to talk to hw */
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 424729cb81d1..023a030ca7b9 100644
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
