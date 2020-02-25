Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FD16B645
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E37B6E9C2;
	Tue, 25 Feb 2020 00:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002636E9C1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:08:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id j15so5970725pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKo54uIGCYr6V00a80ytyzT05QE3gUEhjxBjN5SKagA=;
 b=D0yDl9CMrT8OGcSIc6YYQPOWn6dfGIK4WkSHnXypbrHC/1HEMnRnmgBIyn3hdg8w+h
 UddE0gLJFSrgktslpVpa3FaDhkNTamPnwjUHXaDBcNx8lXYWa6ftxjYCq2h4pLnYSpg2
 eJG/mtvrF972Ye7b/KR5KqJIiX2oz8IyPg1i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKo54uIGCYr6V00a80ytyzT05QE3gUEhjxBjN5SKagA=;
 b=H0mctxwMEB6yprRUy1Hz6TYCQm54AaNhPT2F0RseJ5LeNYG55WLc2EYw/CsP5GG4IM
 B5GtOtneUzyuHvg7FT/xIia+qezJe79fQaJ+VgcbO00TOc9hGIDA2zMeU2qm5RheYgNK
 5tI8ZxZw0Pz5ysM4J89A4Wax9PtkGXsiXwQ/P1YMyNYQCioi0JqfAiyxlN7aMLYBpUQW
 AHwxw0MbdXJyypyIZ23JSjeVkApEloDeFh2X943P53GbnTrVxIkPfgJ/K4t/QdRl+MhT
 n0FkgX1aK1ry7b+Q6WVAAg84WgnvtqXmurfh768UWRrX4hEkfFKyyTgXW3NrA+K/uEnZ
 Id3A==
X-Gm-Message-State: APjAAAXflnFN/o+gq0pKn5zcliuSNNhaXGmeYOkv/W06RPzVwm6HV0jJ
 QtQFmmj4abHJuMrvhFMhYM3hTkDS0I8=
X-Google-Smtp-Source: APXvYqwj8PinLw1HhSMUo2IZegnoI1ptJJdLb8D/m4u9foDZ2Wjq9aqES1WbWDKk/rpwo4K7QLg3jQ==
X-Received: by 2002:a63:7783:: with SMTP id
 s125mr35172114pgc.214.1582589291306; 
 Mon, 24 Feb 2020 16:08:11 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 18sm14501512pfj.20.2020.02.24.16.08.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Feb 2020 16:08:10 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 3/4] drm/virtio: track whether or not a context has been
 initiated
Date: Mon, 24 Feb 2020 16:07:59 -0800
Message-Id: <20200225000800.2966-3-gurchetansingh@chromium.org>
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

Use an boolean variable to track whether a context has been
initiated.

v5: Fix possible race and sleep via mutex (olv)

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 72c1d9b59dfe..76b7b7c30e10 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,8 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	bool context_created;
+	struct mutex context_lock;
 };
 
 /* virtio_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 00ef9fd3fbf6..ec38cf5573aa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -40,10 +40,18 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	char dbgname[TASK_COMM_LEN];
 
+	mutex_lock(&vfpriv->context_lock);
+	if (vfpriv->context_created)
+		goto out_unlock;
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
 	virtio_gpu_notify(vgdev);
+	vfpriv->context_created = true;
+
+out_unlock:
+	mutex_unlock(&vfpriv->context_lock);
 }
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f7e3712502ca..424729cb81d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -258,6 +258,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!vfpriv)
 		return -ENOMEM;
 
+	mutex_init(&vfpriv->context_lock);
+
 	handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
 	if (handle < 0) {
 		kfree(vfpriv);
@@ -281,6 +283,7 @@ void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
 	vfpriv = file->driver_priv;
 
 	virtio_gpu_context_destroy(vgdev, vfpriv->ctx_id);
+	mutex_destroy(&vfpriv->context_lock);
 	kfree(vfpriv);
 	file->driver_priv = NULL;
 }
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
