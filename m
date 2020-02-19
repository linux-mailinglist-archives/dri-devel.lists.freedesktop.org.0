Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72588164D1C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C706EC67;
	Wed, 19 Feb 2020 17:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC36EC63
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:56:57 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep11so385176pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/JEnLcAtGIG219i09XqvTRNx8kXp3LRiom3JHmmcaKE=;
 b=KO8v/tmMVMykzr0OvT2E/OfoZUWCqBNEXSs4WIj0c5OUB5I8kJnkfPMJUg26LUu0ly
 6wPRN/5r5M0dIumNjOAB47sXYJc8t9EtchfA90bEdIe90x1Q/OPKEsD3JqeWGg4PfwSM
 fixulgSOA7iH/W6ytmlhC/RmK8BwmlSlnzolA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JEnLcAtGIG219i09XqvTRNx8kXp3LRiom3JHmmcaKE=;
 b=tjzMimUal5JXKJjwYlyHL3ZUqiX85i6AJdctzAKjxo9qTZWRo15yRk3nR+3FlIlN/r
 B1HrvUm/NU5WsGZZNxt9L5ngqPQJOxGT3SthoMy585gmEj5L7TY66EXjU6r9AFuKsiqm
 N1JMOEi+HvwTQbTC7JaoJuwxODTzLNNSDSZhlVywvmxdskFtyOADyJZJ1o4CgP0eDZFq
 0tcc/PFnFdtMUZUlJGpAo7pDaI0UH9xdKIlc7xhNVnyI1/iV+GXbG7wt5BJMiMT0iWic
 5xqeLrfAWX4pBU8SNuQpBnF29zA/CFVXErrybaW9y7o7xWA28avgY/xdx0sgnMbNLyUL
 Psnw==
X-Gm-Message-State: APjAAAWLWrRcBKMyR+2O83tt7Os8Jg13xxVCAtfHhqdi1IW+DAoWjbOB
 iEHXL4CznpFRE9GLC0PhO9SWFN+UyRE=
X-Google-Smtp-Source: APXvYqw3UwaGkqnYvPWkE9xBKLXHt+SvvC1QeGxDc4maQJnK7lua5z0EW1Ec6ArtRo5RGlD1mXzKcQ==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr26861113pla.17.1582135016620; 
 Wed, 19 Feb 2020 09:56:56 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id b6sm286930pfg.17.2020.02.19.09.56.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:56:56 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5 v5] drm/virtio: add virtio_gpu_context_type
Date: Wed, 19 Feb 2020 09:56:40 -0800
Message-Id: <20200219175640.809-5-gurchetansingh@chromium.org>
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

We'll have to do something like this eventually, and this
conveys we want a Virgl context by default.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 2c182922ec78..c3358eedd3ab 100644
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
@@ -44,6 +50,11 @@ static void virtio_gpu_create_context(struct drm_device *dev,
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	if (type != virtio_gpu_virgl_context) {
+		DRM_ERROR("Unsupported context type: %u\n", type);
+		return;
+	}
+
 	mutex_lock(&vfpriv->context_lock);
 	if (vfpriv->context_initiated)
 		goto out_unlock;
@@ -98,7 +109,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -250,7 +261,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	params.format = rc->format;
 	params.width = rc->width;
 	params.height = rc->height;
@@ -324,7 +335,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -373,7 +384,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
-		virtio_gpu_create_context(dev, file);
+		virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -474,7 +485,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
-	virtio_gpu_create_context(dev, file);
+	virtio_gpu_create_context(dev, file, virtio_gpu_virgl_context);
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 	virtio_gpu_notify(vgdev);
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
