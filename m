Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0415CE92
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17C36E027;
	Thu, 13 Feb 2020 23:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635586E425
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 70so3918622pgf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQxu+IIoe5xi2um76QACcOIx6minXqqqvbsYqyoO+Q0=;
 b=GI/gCn/uEGCQ1EF1NZMNjE7tWl6JXS8EWPWBciUD2elsV7ayvNRwoL3hkC0Wj7StVJ
 1fHuFUxrfz1N/sELY7rkuv8YyEIg47X2WOPNXaM9EPbz0pB4aYVbeDWJWACMJxaxaeFw
 zAqvobjcjOJ4WifQzk2JLqQgv1elBeMWMDWAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQxu+IIoe5xi2um76QACcOIx6minXqqqvbsYqyoO+Q0=;
 b=pN/aLOwTmKYiU8tYVJArR8a7HpZ6CU2DSWdYjIQdXh+SJTwHxUxPtxOquANXyeEJQk
 VVkpYPGeCDMirJisCjh/cePyZD1wpPqlWkB1hPFORH5qeBqvAxIYFRfs2f21MBZ8qNuK
 XJCt8njAdpLoDWA766I31W0CD1o/qMI3e8SXbkP/sutpd8WSIrKLUT7gCjXxXXLDWCpj
 8dsMO+WsoOJC+SOHi/dZpVSVGnbrbtW01yogQdZDSg9MFsCoMLeNrbp4n3d7PXtqAwRh
 FNV5o8ATzHxw7rKY/1uxM1sDCvRmESxKpY+cozLzp4pZ6QT6Oifz/Pi3DY+1Lf9jNPii
 0dKA==
X-Gm-Message-State: APjAAAX4JtynDBJPC5liGz14LDv67tIEvRCZt0se57vYIfqtk5uZlooP
 E/sNFT3KnzTtLk+p6E87wskobNELxQE=
X-Google-Smtp-Source: APXvYqxCVz6JZ1qNRBuGU2PB3zT++7rsslJhITm7pC2NFzZor2njVQ6oSf1jr1BeheEd/bLpypNJJw==
X-Received: by 2002:a63:e954:: with SMTP id q20mr341095pgj.204.1581635903472; 
 Thu, 13 Feb 2020 15:18:23 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:22 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/virtio: factor out context create hyercall
Date: Thu, 13 Feb 2020 15:18:02 -0800
Message-Id: <20200213231805.622-3-gurchetansingh@chromium.org>
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

We currently create an OpenGL context when opening the DRM fd
if 3D is available.

We may need other context types (VK,..) in the future, and the plan
is to have explicit initialization for that.

For explicit initialization to work, we need to factor out
virtio_gpu_create_context from driver initialization.

v2: Move context handle initialization too (@olv)

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 25 ++++++-------------------
 3 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 2f6c4ccbfd14..72c1d9b59dfe 100644
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
index b0edf1ca095f..896c3f419a6d 100644
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
index 8fd7acef960f..282558576527 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -52,18 +52,6 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		      events_clear, &events_clear);
 }
 
-static int virtio_gpu_context_create(struct virtio_gpu_device *vgdev,
-				      uint32_t nlen, const char *name)
-{
-	int handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
-
-	if (handle < 0)
-		return handle;
-	handle += 1;
-	virtio_gpu_cmd_context_create(vgdev, handle, nlen, name);
-	return handle;
-}
-
 static void virtio_gpu_context_destroy(struct virtio_gpu_device *vgdev,
 				      uint32_t ctx_id)
 {
@@ -257,8 +245,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv;
-	int id;
-	char dbgname[TASK_COMM_LEN];
+	int handle;
 
 	/* can't create contexts without 3d renderer */
 	if (!vgdev->has_virgl_3d)
@@ -269,15 +256,15 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!vfpriv)
 		return -ENOMEM;
 
-	get_task_comm(dbgname, current);
-	id = virtio_gpu_context_create(vgdev, strlen(dbgname), dbgname);
-	if (id < 0) {
+	handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
+	if (handle < 0) {
 		kfree(vfpriv);
-		return id;
+		return handle;
 	}
 
-	vfpriv->ctx_id = id;
+	vfpriv->ctx_id = handle + 1;
 	file->driver_priv = vfpriv;
+	virtio_gpu_create_context(dev, file);
 	return 0;
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
