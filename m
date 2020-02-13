Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7315CE95
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0433A6E42F;
	Thu, 13 Feb 2020 23:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CEE6E429
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:33 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w21so3922131pgl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3IqDiSJ16U0AO3K2pvZtPfoQrE3E9ga9QugheOmYSY=;
 b=HGhYY+221j0kTDh1S6CwlCIlAHAn4vACqqalQBxU3ZNBJjwJr5glBuODyj2m7x2C35
 MEYdDn9kLQRzYTCnExBwUAHtX5NRXh+8ST/rPyw7EeIyFwY8O5VCNdN7+SbDgD4wlRgh
 2EHAuKE+9mBG38e+qv+WYxaWyr3KX8/aTrwZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3IqDiSJ16U0AO3K2pvZtPfoQrE3E9ga9QugheOmYSY=;
 b=udEEkaNU4XFio69++T+7oeS42A5W76H24wwYAdJhz/L3kp23is/+A4LSW0wgXn4dS4
 LNGZS5B2QUp0hnQOBUYIgwEGFEEJ8SRUJvGNBLzaA2o4NbsHjoIa90d1M8C/LPc08YJc
 3LjlfcZKhYKXcPwjd4+TjqUnATgwXKXGhHa2ERxm5/33/aFfSIQCY4DIR7PA/FGQRwCe
 gEEaei2zbTKg58WtCRLts/Ip6WEucR1nWou16BWOxOPrklwLEBjkM+NvBHs6Z9vIbJMm
 jjtTTgDr9pqjT1n5bKkJQFSeWv0HGo2/HTnFGrwZda4auWQ360a2oQe64BRnDCk2qezS
 nWbA==
X-Gm-Message-State: APjAAAXoLbXb8JnT25wa3Ef5nJeqK9Abu6m6KxuAQm6doha4qBMZgXXO
 9+Q9sjunMHQ34orq+S6vLkX0nmb2A3Y=
X-Google-Smtp-Source: APXvYqzoFR3B41278BoSQG5V1c2SabcpK8BIsHfrtj04RHzKIUcVH5+m3L5eSX2Q9o9EA8NtDd6W1g==
X-Received: by 2002:a63:1926:: with SMTP id z38mr268495pgl.303.1581635911869; 
 Thu, 13 Feb 2020 15:18:31 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:31 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/virtio: add virtio_gpu_context_type
Date: Thu, 13 Feb 2020 15:18:05 -0800
Message-Id: <20200213231805.622-6-gurchetansingh@chromium.org>
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

We'll have to do something like this eventually, and this
conveys we want a Virgl context by default.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index d2f17778bdc4..f3be29d3f103 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,8 +33,14 @@
 
 #include "virtgpu_drv.h"
 
+/* TODO: add more context types */
+enum virtio_gpu_context_type {
+	virtio_gpu_virgl_context,
+};
+
 static void virtio_gpu_create_context(struct drm_device *dev,
-				      struct drm_file *file)
+				      struct drm_file *file,
+				      enum virtio_gpu_context_type type)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
@@ -47,6 +53,11 @@ static void virtio_gpu_create_context(struct drm_device *dev,
 	if (!atomic_add_unless(&vfpriv->context_initiated, 1, 1))
 		return;
 
+	if (type != virtio_gpu_virgl_context) {
+		DRM_ERROR("Unsupported context type: %u\n", type);
+		return;
+	}
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
@@ -93,7 +104,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -244,7 +255,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	params.format = rc->format;
 	params.width = rc->width;
 	params.height = rc->height;
@@ -318,7 +329,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -366,7 +377,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
-		virtio_gpu_create_context(dev, file);
+		virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -467,7 +478,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
