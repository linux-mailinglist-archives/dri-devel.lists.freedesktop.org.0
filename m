Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020DF164D1A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF346EC63;
	Wed, 19 Feb 2020 17:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9DC6E850
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:56:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 2so420168pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdiR20VC6vkGJDAO7FccoI0GxIBtkf3Z1Z674w/ao6Y=;
 b=WniLRnDH+Gv1Cp4FvsmUSnkhLC8h6uptFQB6u/chSHq7p1DQsikEoXpR6gxk9Cj/yh
 nn7+qkt8zajwlkZTguX9esSA5PkMeTxvLO0wij6/869m62S/w1LyseznJTolWzUmw6xx
 5YBgjBlHABPEDdk3+hFJ3ql5CGIukt/Ic99NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdiR20VC6vkGJDAO7FccoI0GxIBtkf3Z1Z674w/ao6Y=;
 b=UxZv+RVLQLLA1Rh5LD/WVvPnRaJ/Djg8PdcrvbnZj5OmROqrGklKJzN/Xr00wvHDdV
 epzkFE83ESVEEoJ8Kl5QzxyJ5h1XhdBCosVPdRrlCCM2v+md9DiP4xfImw73v8H+26/U
 RRdcU9mfx+4hcteelQuLfVVWH/cvTb1HfbqkV8Ou6n3wGmHebjE0XJEBLLUG3JwOblf1
 WSz+HLfImQbkesMcnuyfzVVOjrfTVKH01BK0eShfAxOax3DmemR3KCQvmNjXLpFivLYR
 0aMeEpG8wqINWLtTxu1T/psLQQ7Mqsdy2I2+Fn1m091nBHY/PgKJJNKrEiAQXblDHIC2
 SzwQ==
X-Gm-Message-State: APjAAAXMRMuBKRK/BwYV8zDg8lfRl7C/nLAfULNCvx9vOGuFd0aW+Z4m
 7JQQNhyfjq7xmsbxkQxQBpZgIWh0+/k=
X-Google-Smtp-Source: APXvYqyY1q9RH3SKpWegQOudR5LSF1Ee7ZGcJGnomT2/Vl1baeZqJ1za5OPW1ODZHI4CbZiqa2HV2w==
X-Received: by 2002:a63:6607:: with SMTP id a7mr29929940pgc.310.1582135014905; 
 Wed, 19 Feb 2020 09:56:54 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id b6sm286930pfg.17.2020.02.19.09.56.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:56:54 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5 v5] drm/virtio: enqueue virtio_gpu_create_context after
 the first 3D ioctl
Date: Wed, 19 Feb 2020 09:56:39 -0800
Message-Id: <20200219175640.809-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219175640.809-1-gurchetansingh@chromium.org>
References: <20200219175640.809-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
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
index 0596d9618554..9fdc3b4cef48 100644
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
index c1a6cb4ec375..2c182922ec78 100644
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
