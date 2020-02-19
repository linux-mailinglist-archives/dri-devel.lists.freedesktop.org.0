Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB71639C6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 03:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480E6EAFA;
	Wed, 19 Feb 2020 02:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA76EAFA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:03:09 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 6so11914653pgk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdtSg4I83FV4TfRtEYBqKUl/YbqEjTde4tXPeXzE12E=;
 b=U0SyoHYIVdNKB59W01s1RrmJHk6A+CleIAdt9bLIIA6/rLqRpBugDAV31Ba8DpHN3G
 Osj2DqkvPm+Ij8np/wyMsGF0IOGq17VyWWo6zk9bTOC4YoUGgNCRHBSOETN7Sn0le4Gu
 maZ4cdbmGtTFBzf+cfj1i5O1ZicJBNt5bCGvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdtSg4I83FV4TfRtEYBqKUl/YbqEjTde4tXPeXzE12E=;
 b=oNTggrxD8labu32W1Vjb88IqCAbblcArBIHWMy4U7G3D2TFM4C4I2QP0TG/eFDPyER
 04KHHnCkebTCtvA3N03/WTkWi0Obsmzd/F2ot4ih0EP9vZbEDsaVIEhwR7TX+rC1LFlJ
 D2v+JwoHm/e7N8qWTm5thKNMFlTQ96Gayccw66iwqr3MModOHljby8AJywqjXeXL/6jU
 ey9RqINnUYn7mhG8xuMmtyH2S433UKKq1XyVhYVdxF4nA/xvJ6n3yuHd1Bf17EiY3ln0
 VEMSUQ4CiElOwM1k97C9stM8Acrd0f4zmbngDLFTrgoNBvXNn5jLx/MXaoW1hscxFs3K
 ICQQ==
X-Gm-Message-State: APjAAAUREXmsTLiq+EXyNxbSCj1flwDydmGp8Jh9WKRSW+EG3qlHemdb
 hmBmdMBMzGbOVvQYNci6pXGPbQRqXw4=
X-Google-Smtp-Source: APXvYqxfW1AAaXLgP/Owhe7+RgXYD6dlXmrzI83CseaiKTQ94dtgZENTK/H9xpHtWpRz9lpu/73r0w==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr25184578pgm.389.1582077788973; 
 Tue, 18 Feb 2020 18:03:08 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 3sm216430pjg.27.2020.02.18.18.03.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 18:03:08 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5 v3] drm/virtio: factor out context create hyercall
Date: Tue, 18 Feb 2020 18:02:58 -0800
Message-Id: <20200219020301.1424-2-gurchetansingh@chromium.org>
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
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 17 +++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 26 ++++++--------------------
 3 files changed, 25 insertions(+), 20 deletions(-)

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
index baad7e1c9505..de04f80f737d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,6 +33,23 @@
 
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
+	virtio_gpu_notify(vgdev);
+}
+
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index ad3b673f5796..f7e3712502ca 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -52,19 +52,6 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
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
-	virtio_gpu_notify(vgdev);
-	return handle;
-}
-
 static void virtio_gpu_context_destroy(struct virtio_gpu_device *vgdev,
 				      uint32_t ctx_id)
 {
@@ -260,8 +247,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv;
-	int id;
-	char dbgname[TASK_COMM_LEN];
+	int handle;
 
 	/* can't create contexts without 3d renderer */
 	if (!vgdev->has_virgl_3d)
@@ -272,15 +258,15 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
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
