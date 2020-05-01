Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040341C1D6E
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE006ED2E;
	Fri,  1 May 2020 18:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B806ED2E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:56:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t11so4935236pgg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s1EsMbTEf6j/ZHzUaKkn1YFI/ZhYtkll4VtOXEGE/Qo=;
 b=Os+O8K60E50v0xl6uXOkcptoSwydFdR2qi7gODSBjOMXhO7RuAcjzOWglTPhN51zNQ
 dy67gSKdv/JYm5z9unltIK2YeMXFkO7dWQPa1HC05Z7AY7OkU+/ynNHvm4oXJS/2na1s
 JuvOPJSiNjLwSp8zNRb8qOsrdwOR9s54uaWfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s1EsMbTEf6j/ZHzUaKkn1YFI/ZhYtkll4VtOXEGE/Qo=;
 b=CguS4dGrFucJQHQsZ4ut9v+NptvdBoQesYHWBwPCH13X3OP0s1iGpOO53iMR+BGygc
 gUvmsYCznYpcmkJUygw/MF+jqeNQ4ucCmJY3uitQyEMS04KdliSOYiuukkU+mu7Hv7+y
 m7hnAY+mDOlePV/CpMrtDZL2xG5PrOi0U9NxHk5Tx3lO+aUWqDtnEpMLfWQkpnO/5XoT
 O0CZYeKrFpc7AlgrICSPGwu7wsZQgJURlJbttlA/kvSR018uSsYtAp84tLdhkbrFIlBA
 piYWHGdA196AckkbGy7P0rd1vqijYddSzXo1t+g4SmaL1sFBjK5dB9vO8ciwm+HzEwSP
 oBvw==
X-Gm-Message-State: AGi0PuZETStCn0SiZUpFgy59FzKC/vgaCNL48bQh4Oqz9kmXXnW7B84k
 RNhbQje3YURFlnzOx04TkD9vtFmCeKw=
X-Google-Smtp-Source: APiQypIYjR3mEYucKfOhFUVZEb7UtqlLlGZYVPCzqnX9y3N1FjTBO/41sZb+dX/Xcyt67b8wm9atOg==
X-Received: by 2002:a62:15d8:: with SMTP id 207mr5184635pfv.140.1588359361019; 
 Fri, 01 May 2020 11:56:01 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id t12sm2586135pgm.37.2020.05.01.11.55.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 May 2020 11:56:00 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: create context before RESOURCE_CREATE_2D in 3D
 mode
Date: Fri,  1 May 2020 11:55:57 -0700
Message-Id: <20200501185557.740-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If 3D is enabled, but userspace requests a dumb buffer, we will
call CTX_ATTACH_RESOURCE before actually creating the context.

Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context
                      after the first 3D ioctl")
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 3 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 49bebdee6d91..9ff9f4ac0522 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -221,6 +221,7 @@ struct virtio_gpu_fpriv {
 /* virtgpu_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
+void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 1025658be4df..d6cb350ae52a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -39,6 +39,9 @@ static int virtio_gpu_gem_create(struct drm_file *file,
 	int ret;
 	u32 handle;
 
+	if (vgdev->has_virgl_3d)
+		virtio_gpu_create_context(dev, file);
+
 	ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 867c5e239d55..6c7619c13277 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,8 +33,7 @@
 
 #include "virtgpu_drv.h"
 
-static void virtio_gpu_create_context(struct drm_device *dev,
-				      struct drm_file *file)
+void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-- 
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
