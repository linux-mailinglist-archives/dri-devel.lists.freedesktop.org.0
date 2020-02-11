Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38861159DBD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03E66F45D;
	Tue, 11 Feb 2020 23:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27AE6F45A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:56:51 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b35so76961pgm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=so6FpOtCSORirIXhpIDnv9Uz2ayvCltwYBKqzevADcM=;
 b=eeuoTCtb/S2LT3P4iKDPHxSvOgxzI9QWzrPcZXwehfTgouOeqq15nqdlQXdRV8Hesn
 SIEBETVO3h5TTxjRgkAoSrWPrwjpbiHt9TdGE8NNqG7ayOPdBGypV1SxXHzd4yyULQyy
 3vbC8DLhWbOJnFbyh7uu/yWDaL1+jlFQKLYhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=so6FpOtCSORirIXhpIDnv9Uz2ayvCltwYBKqzevADcM=;
 b=tGgH4Kk+tcx1TbXL1zqKAzhDm2R+qxqyAYFvdvxvQWLHYSsn5doujTz9NqudwE7wfB
 AcZD83e/8IWk3ZBsR8MrmUZiD4snb85OyC8wvZvLh2NIYwWrZWkwdeXPqfhvoSVuO6Dp
 RWo52q8HuxwsKpvZke0mxdIlQGZj7xfliAT0Rh83CkTuwXa5Onz0KDoSHFO+B25a0kJS
 eoa37X9s7zl9tPuNgrbdQbuz41ryYOa5fFZYxjRy6AEmSulsk/UlvBI9xQQIG+jLgbv8
 GtqA+VL12tR2y9069FFYnkLZKRmDjP8h/wLwUUgem6M/H+Dxi0ai3SyUnsKpPQpltnla
 JHew==
X-Gm-Message-State: APjAAAXiWE2H/PTJum4Ve+PmbCyQYQjnGyZlXVNgFQ/nr88upmCxZXuT
 zEl9Hy7X8/YjraVulfkjg6QURjvRiiFM5w==
X-Google-Smtp-Source: APXvYqy9whlSMKgLB5YGoqDvNNtiixNZh2tmg6LOZxh3S2fQR20idMptBA5D90+okIsAkDbCUvfUSg==
X-Received: by 2002:a63:3754:: with SMTP id g20mr9056335pgn.384.1581465410951; 
 Tue, 11 Feb 2020 15:56:50 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id a13sm5816291pfg.65.2020.02.11.15.56.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Feb 2020 15:56:49 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/virtio: factor out context create cmd
Date: Tue, 11 Feb 2020 15:56:33 -0800
Message-Id: <20200211235635.488-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211235635.488-1-gurchetansingh@chromium.org>
References: <20200211235635.488-1-gurchetansingh@chromium.org>
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

We currently do it when open the DRM fd, let's delay it. First step,
remove the hyercall from initialization.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 10 ++++------
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 28aeac8717e1..edaa7b8224a8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -214,6 +214,8 @@ struct virtio_gpu_fpriv {
 /* virtio_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
+void virtio_gpu_create_context(struct drm_device *dev,
+			       struct drm_file *file);
 
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 89d90e95900f..f1afabaa3a08 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,6 +33,22 @@
 
 #include "virtgpu_drv.h"
 
+void virtio_gpu_create_context(struct drm_device *dev,
+			       struct drm_file *file)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	char dbgname[TASK_COMM_LEN];
+
+	/* can't create contexts without 3d renderer */
+	if (!vgdev->has_virgl_3d)
+		return;
+
+	get_task_comm(dbgname, current);
+	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+				      strlen(dbgname), dbgname);
+}
+
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 44e4c07d0162..e1e1c0821a35 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -52,15 +52,13 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		      events_clear, &events_clear);
 }
 
-static int virtio_gpu_context_create(struct virtio_gpu_device *vgdev,
-				      uint32_t nlen, const char *name)
+static int virtio_gpu_context_handle(struct virtio_gpu_device *vgdev)
 {
 	int handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
 
 	if (handle < 0)
 		return handle;
 	handle += 1;
-	virtio_gpu_cmd_context_create(vgdev, handle, nlen, name);
 	return handle;
 }
 
@@ -256,7 +254,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv;
 	int id;
-	char dbgname[TASK_COMM_LEN];
 
 	/* can't create contexts without 3d renderer */
 	if (!vgdev->has_virgl_3d)
@@ -267,8 +264,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!vfpriv)
 		return -ENOMEM;
 
-	get_task_comm(dbgname, current);
-	id = virtio_gpu_context_create(vgdev, strlen(dbgname), dbgname);
+	id = virtio_gpu_context_handle(vgdev);
 	if (id < 0) {
 		kfree(vfpriv);
 		return id;
@@ -276,6 +272,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 
 	vfpriv->ctx_id = id;
 	file->driver_priv = vfpriv;
+	virtio_gpu_create_context(dev, file);
+
 	return 0;
 }
 
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
