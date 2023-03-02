Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA296A8D1A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061D510E5A6;
	Thu,  2 Mar 2023 23:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E929510E5A6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 23:35:10 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so1065206pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 15:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677800110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnV2ysdoyXjUrpdCQrmBC3MJoS1QGa+/4VTCaLwr/IA=;
 b=qvB8+mQ7h8uVjZUKQZNws288ccBV67GzNbaXTofx1wjqf/ytIzrKPz5QQdqZYqsFi/
 AelK9a55XpRrVOwEWJ+nnb6SmhWCPQCQTY3cBXWdOWcy3gl1q4H5Pqjfi6xwnH07nqsR
 pvln3kskVtJuNKo7BaqDeddbxpKKvEVfW8oGStUkcq3WGVZlun1tuohDf6va4HiW6wN3
 3IazJc/3JM53RG+o/U+kb+NuEftsu27B82UHV8F3RppK93bcXJUXAUbA4lBzqf8ozfJD
 Jf/qq8k/EDTEmpT0GbtATGh9Uw+5SNpNzcoaKk4YL1cwcI5/tCiOTUekx08liz1q1cXI
 b2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677800110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZnV2ysdoyXjUrpdCQrmBC3MJoS1QGa+/4VTCaLwr/IA=;
 b=im63qlwctV+izVgW5JYtGWpmBIY+n8BwE4A5gpYVTH68/Dq+0Npu1Jtoul+N6NaYYq
 LqQT0+N0GtxKk1aOPsQhtDb346DApdDWl39dUn++0zGksnvvG9pOZcslz7L9meFroPbl
 5tgiFEDMrvAAaGQqLZ5fM0WQ7yC8P0Szs/gEjrg6ykBN+h22kfHwIw8QxQR4GSTP7G+0
 ea+5UMb6Onx70sGG9zv6kFdxLi2Q6LBnGboaUN01BLwHqKZK0AayCG46PVHxoBhao1m8
 xdFJRw4DvEUwIwT4e/JEVaoPCViuOQeb8sx17cO/CklOoJ0ly0zDDi3oSpiyDwC0UK0s
 o42w==
X-Gm-Message-State: AO0yUKWDbc7JE9RcpDKZdvuOYiNgPbT/ci8XIasZkCYMka0BY8bRdhA1
 zXtWmaTsx4liAbtX10VkFE+KmP5EVsQ=
X-Google-Smtp-Source: AK7set+HbCU3T+T1xaEIiSVN0/+3rkeq32UaXybOuDXMEFmJIbxsCV9TGLNQfT2TYo3D79CM++aLhA==
X-Received: by 2002:a17:902:ec85:b0:19d:1dfe:eab4 with SMTP id
 x5-20020a170902ec8500b0019d1dfeeab4mr14789303plg.41.1677800110089; 
 Thu, 02 Mar 2023 15:35:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 kb8-20020a170903338800b00194d14d8e54sm213616plb.96.2023.03.02.15.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:35:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6] drm/virtio: Add option to disable KMS support
Date: Thu,  2 Mar 2023 15:35:06 -0800
Message-Id: <20230302233506.3146290-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a build option to disable modesetting support.  This is useful in
cases where the guest only needs to use the GPU in a headless mode, or
(such as in the CrOS usage) window surfaces are proxied to a host
compositor.

As the modesetting ioctls are a big surface area for potential security
bugs to be found (it's happened in the past, we should assume it will
again in the future), it makes sense to have a build option to disable
those ioctls in cases where they serve no legitimate purpose.

v2: Use more if (IS_ENABLED(...))
v3: Also permit the host to advertise no scanouts
v4: Spiff out commit msg
v5: Make num_scanouts==0 and DRM_VIRTIO_GPU_KMS=n behave the same
v6: Drop conditionally building virtgpu_display.c and early-out of
    it's init/fini fxns instead

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/virtio/Kconfig           | 11 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_display.c |  6 ++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  4 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 23 ++++++++++++++---------
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index 51ec7c3240c9..ea06ff2aa4b4 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -11,3 +11,14 @@ config DRM_VIRTIO_GPU
 	   QEMU based VMMs (like KVM or Xen).
 
 	   If unsure say M.
+
+config DRM_VIRTIO_GPU_KMS
+	bool "Virtio GPU driver modesetting support"
+	depends on DRM_VIRTIO_GPU
+	default y
+	help
+	   Enable modesetting support for virtio GPU driver.  This can be
+	   disabled in cases where only "headless" usage of the GPU is
+	   required.
+
+	   If unsure, say Y.
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 9ea7611a9e0f..ad924a8502e9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -336,6 +336,9 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 {
 	int i, ret;
 
+	if (!vgdev->num_scanouts)
+		return 0;
+
 	ret = drmm_mode_config_init(vgdev->ddev);
 	if (ret)
 		return ret;
@@ -362,6 +365,9 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
 {
 	int i;
 
+	if (!vgdev->num_scanouts)
+		return;
+
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		kfree(vgdev->outputs[i].edid);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ae97b98750b6..add075681e18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,6 +172,10 @@ MODULE_AUTHOR("Alon Levy");
 DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
 static const struct drm_driver driver = {
+	/*
+	 * If KMS is disabled DRIVER_MODESET and DRIVER_ATOMIC are masked
+	 * out via drm_device::driver_features:
+	 */
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..02e5c18c2c75 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -223,12 +223,15 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 			num_scanouts, &num_scanouts);
 	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
 				    VIRTIO_GPU_MAX_SCANOUTS);
-	if (!vgdev->num_scanouts) {
-		DRM_ERROR("num_scanouts is zero\n");
-		ret = -EINVAL;
-		goto err_scanouts;
+
+	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {
+		DRM_INFO("KMS disabled\n");
+		vgdev->num_scanouts = 0;
+		vgdev->has_edid = false;
+		dev->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+	} else {
+		DRM_INFO("number of scanouts: %d\n", num_scanouts);
 	}
-	DRM_INFO("number of scanouts: %d\n", num_scanouts);
 
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
 			num_capsets, &num_capsets);
@@ -246,10 +249,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		virtio_gpu_get_capsets(vgdev, num_capsets);
 	if (vgdev->has_edid)
 		virtio_gpu_cmd_get_edids(vgdev);
-	virtio_gpu_cmd_get_display_info(vgdev);
-	virtio_gpu_notify(vgdev);
-	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
-			   5 * HZ);
+	if (vgdev->num_scanouts) {
+		virtio_gpu_cmd_get_display_info(vgdev);
+		virtio_gpu_notify(vgdev);
+		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
+				   5 * HZ);
+	}
 	return 0;
 
 err_scanouts:
-- 
2.39.1

