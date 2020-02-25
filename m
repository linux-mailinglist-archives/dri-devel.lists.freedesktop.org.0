Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159716B643
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E026E9C1;
	Tue, 25 Feb 2020 00:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9843E6E9C2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:08:10 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id dw13so463298pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djrV6/mlxPxF3du+fRnW76R/1ZroxLWP4F2UXLHZojI=;
 b=IEKHRHIRnxX1lPpCsU+xpvGcHyCmRIy5lST9ASjoZffuV5i+Sa3vJEjg+61r77xflj
 sRsPl6TFxdpmtofhZnUGB3qy96SmDA5dYc2bSa+o6R3DfcxeiD5s1Fw8v1TDKOdYexcD
 lbY7VFhwL64KK++B5uhUdrYKS5JtW8dssS4G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djrV6/mlxPxF3du+fRnW76R/1ZroxLWP4F2UXLHZojI=;
 b=hE7CcDqia2Fswo7agDCsnefrxId9ad1jHa5iyymPJ0RHfoxHixsc+FM2Dt6J2Rdqxj
 HyY6aUMM/RjIiKJFjn/ikJxOnGrBW4dJ6mRhXDxFbcbicg11FamNY+710kWTtJeHAAhR
 0asCXLkSbMgTrxItMiKRPXT3Z0DCTXSsBa+tFK6GTqdA7FKJFG/RSF57E8FL6ATyp0KL
 I+njm+Dj/BbrU2AVsz8UHs2dRQTAGQIpWKwr8jfJD00BR1RBFtbycNB+p5fpUfm5qZtj
 dfZQv80FM0lpI6nqWBeijIoMP54pjkZEzekxDJV+ogmnq/21rgCPk+nLi+9bzMJ0UtXi
 M2xg==
X-Gm-Message-State: APjAAAWmQ1N1RRFfMhZcIgS1my/YHyGAbz3VQ7Sov803aID6C2S5AV7a
 ukFr2LQIzKCNeqnnmCkv5rK6zzc42jc=
X-Google-Smtp-Source: APXvYqwUntihImRRWNmMqb6WPZ46RMGoIPaDNMnLakBLSTsKDbyUdv4fLygbxZpUQJDaKb9SjKDTDQ==
X-Received: by 2002:a17:90a:c691:: with SMTP id
 n17mr1861086pjt.41.1582589289687; 
 Mon, 24 Feb 2020 16:08:09 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 18sm14501512pfj.20.2020.02.24.16.08.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Feb 2020 16:08:09 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/4] drm/virtio: factor out context create hypercall
Date: Mon, 24 Feb 2020 16:07:58 -0800
Message-Id: <20200225000800.2966-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225000800.2966-1-gurchetansingh@chromium.org>
References: <20200225000800.2966-1-gurchetansingh@chromium.org>
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
Cc: emil.l.velikov@gmail.com, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org,
 Emil Velikov <emil.velikov@collabora.com>
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

v2: Move context handle initialization too (olv)
v6: Remove redundant 3D check (emil.velikov)

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 13 +++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 26 ++++++--------------------
 3 files changed, 21 insertions(+), 20 deletions(-)

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
index baad7e1c9505..00ef9fd3fbf6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,6 +33,19 @@
 
 #include "virtgpu_drv.h"
 
+void virtio_gpu_create_context(struct drm_device *dev,
+			       struct drm_file *file)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	char dbgname[TASK_COMM_LEN];
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
