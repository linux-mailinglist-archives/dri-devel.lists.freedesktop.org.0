Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C26215CE94
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED866E42A;
	Thu, 13 Feb 2020 23:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065326E429
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b9so3790841pgk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mhIUUIeRYJgh3PajhzrPLDYE4S2JY+chXfVcanDuT1M=;
 b=QHCd4st3dCDAmkSJYJ3+wHm7eVd12/CWYFEw8VRT8oKTtsXJnJET+Wrsl6XGaFqwNP
 UlrSBHiuRVhvPKkmiRi9L5OhX6XKd81DueJNLapjWXp/bEk9mPKebG0TAZqhMizTW6ii
 0W5/S3AsVTSSBsNGkyyJSkH3RvR1vBDanptIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mhIUUIeRYJgh3PajhzrPLDYE4S2JY+chXfVcanDuT1M=;
 b=j0NqM6D8MCGuJtYcygxj6AxZVUkSoGtqSVCSt3ES6glSikEdbcLSDVUveGxbi0Xy1e
 tMRx5Q1ROeRNbmSxILZZQKN43spudsCS0/DuBDNTvpuGxIjf4Ded6zF6CIkXaB2jAKh6
 oriG+QWNFWhcs2+slVxj0dO7nvDBwyCO48ZSQA+AdvMof2G+m74gmsIkWbUug0M8Gq4d
 P0LvL5KtmfnKC7HokkPzmaUdmsAhrjYZSjewnFAr9Sxt35rwwYct17qpO78AjBvUMNsL
 tbXs08KC2YKSe+IzL1vfy9Ewzq6WXQHMWTiKfBRW8bYDahrv931JQuOsUWuF0K/0HDOD
 zylQ==
X-Gm-Message-State: APjAAAX79kQl000lZzJbl6OBOP3iQOatKXRqCy9bQFzMfs6sIkeJTbA7
 ihb9Z6yNdip3KT7Rr/XvcFVU1OvIKyA=
X-Google-Smtp-Source: APXvYqwKmxe0DZTVu8c5ETIXBUDk8GKnTupNRmmUoT1iFA7TiHPrm05fNgi364/Uo9t5yXJN31ZCCA==
X-Received: by 2002:aa7:9359:: with SMTP id 25mr225751pfn.188.1581635908010;
 Thu, 13 Feb 2020 15:18:28 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:27 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/virtio: enqueue virtio_gpu_create_context after the
 first 3D ioctl
Date: Thu, 13 Feb 2020 15:18:04 -0800
Message-Id: <20200213231805.622-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213231805.622-1-gurchetansingh@chromium.org>
References: <20200213231805.622-1-gurchetansingh@chromium.org>
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

v2: staticify virtio_gpu_create_context

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 --
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 +++++++--
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index ca505984f8ab..4de0741da454 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -215,8 +215,6 @@ struct virtio_gpu_fpriv {
 /* virtio_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
-void virtio_gpu_create_context(struct drm_device *dev,
-			       struct drm_file *file);
 
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index a98884462944..d2f17778bdc4 100644
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
@@ -93,6 +93,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
+	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -243,6 +244,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	virtio_gpu_create_context(dev, file);
 	params.format = rc->format;
 	params.width = rc->width;
 	params.height = rc->height;
@@ -316,6 +318,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
+	virtio_gpu_create_context(dev, file);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -363,6 +366,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
+		virtio_gpu_create_context(dev, file);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -463,6 +467,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
+	virtio_gpu_create_context(dev, file);
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 25248bad3fc4..f84f2cb7546a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -265,7 +265,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	vfpriv->ctx_id = handle + 1;
 	atomic_set(&vfpriv->context_initiated, 0);
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
