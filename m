Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB46A5C6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8A910E4CE;
	Tue, 28 Feb 2023 15:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26510E4CE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 15:54:11 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u5so7511332plq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xw2WUA8mFvMCKalxYRCZJO97ik9Rv3lPc280o9Y+fdQ=;
 b=NY9SP6qpNOYZLx9fij86g1bqzs4xbAG2fso2og2T3wxOd34OfdmRoXb95G6vCllXGL
 PObC2iguXamZOrzALd1IOlMkgb3UfOcm1SSJ8ixJnSIWP6HQEkRVEI8MdO3Lp3C/7Jgm
 hGLePAqnPzXMproE9miOH26dz4ePn9+5Jnz3Ial8doyAlkztj6ckSy2F6gxf7S+yKag3
 J9jG9+Of9x6z8c5PelYhQNyvLhQh8BSv6HGO/oa0vCPfcVM9MdleizR68DLRfycXp2lv
 ig0Zr7nlUZrhcXfz6ySzd8C5JPjWvCXvVhwGQUHzqvIqukIiwzLR6XI47A0+64gX8XmK
 WlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xw2WUA8mFvMCKalxYRCZJO97ik9Rv3lPc280o9Y+fdQ=;
 b=KuXuyFvy4f1zX+fHDURd+M52Pg2IFixLwhy70cDI5+yCfwQW0vzP+vhjg5XrTWTAEU
 KkYC/BN+rP9n2E5usITfgVaUMamp82qs8LaTy4F6GmNpiRbxjY7jDS2Irt8yfLADKu3Q
 A9E0SRI3l1yDXbXUQ/mZO9VCDYxSjp3avMPfSFeXXZxB+N6wYQhhd+xQaGqqKpcjq1nD
 hAergPWeSuzNy2WeKXnJXGKJbgB+gImJESp3HnDv4iTk/ysxTk5Zso9bgHmN3nL6cVvI
 szENTBcMDN6+kqx1SnOF5s3I7gg9MtbxFGDudNgk1tsZkb+6mgoQKHfGv7Dh1dylsEyU
 UzGg==
X-Gm-Message-State: AO0yUKWYG3E2HNTkTEcc2UNK96b1w0z9yI5M3ANhDNxilOBrhs51Kbyu
 6XBZzVote4ufJbF22nhS+oeshzVPG7g=
X-Google-Smtp-Source: AK7set9Jgq9ZQhTADHjg3H6EfnFAKDeu0hMzuI3+D+kLEzZBWjL7xvRjyA9i1WiIEXsFG+bOs7CMjA==
X-Received: by 2002:a05:6a20:3d11:b0:cd:3f69:e15 with SMTP id
 y17-20020a056a203d1100b000cd3f690e15mr4215843pzi.11.1677599650629; 
 Tue, 28 Feb 2023 07:54:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u1-20020aa78381000000b005cd81a74821sm6190301pfm.152.2023.02.28.07.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:54:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/virtio: Add option to disable KMS support
Date: Tue, 28 Feb 2023 07:54:05 -0800
Message-Id: <20230228155406.2881252-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/Kconfig       | 11 +++++++
 drivers/gpu/drm/virtio/Makefile      |  5 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.c |  6 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.h | 10 +++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 44 ++++++++++++++++++----------
 5 files changed, 59 insertions(+), 17 deletions(-)

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
diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index b99fa4a73b68..24c7ebe87032 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -4,8 +4,11 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
-	virtgpu_display.o virtgpu_vq.o \
+	virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
 	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
 
+virtio-gpu-$(CONFIG_DRM_VIRTIO_GPU_KMS) += \
+	virtgpu_display.o
+
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ae97b98750b6..9cb7d6dd3da6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,7 +172,11 @@ MODULE_AUTHOR("Alon Levy");
 DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
 static const struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features =
+#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
+			DRIVER_MODESET | DRIVER_ATOMIC |
+#endif
+			DRIVER_GEM | DRIVER_RENDER,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af6ffb696086..ffe8faf67247 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -426,8 +426,18 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				uint32_t x, uint32_t y);
 
 /* virtgpu_display.c */
+#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
+#else
+static inline int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
+{
+	return 0;
+}
+static inline void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
+{
+}
+#endif
 
 /* virtgpu_plane.c */
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..1d888e309d6b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -161,7 +161,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
 		vgdev->has_virgl_3d = true;
 #endif
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
+	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) &&
+	    virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
 		vgdev->has_edid = true;
 	}
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
@@ -218,17 +219,28 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		goto err_vbufs;
 	}
 
-	/* get display info */
-	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
-			num_scanouts, &num_scanouts);
-	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
-				    VIRTIO_GPU_MAX_SCANOUTS);
-	if (!vgdev->num_scanouts) {
-		DRM_ERROR("num_scanouts is zero\n");
-		ret = -EINVAL;
-		goto err_scanouts;
+	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
+		/* get display info */
+		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+				num_scanouts, &num_scanouts);
+		vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
+					    VIRTIO_GPU_MAX_SCANOUTS);
+		if (!vgdev->num_scanouts) {
+			/*
+			 * Having an EDID but no scanouts is non-sensical,
+			 * but it is permitted to have no scanouts and no
+			 * EDID (in which case DRIVER_MODESET and
+			 * DRIVER_ATOMIC are not advertised)
+			 */
+			if (vgdev->has_edid) {
+				DRM_ERROR("num_scanouts is zero\n");
+				ret = -EINVAL;
+				goto err_scanouts;
+			}
+			dev->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+		}
+		DRM_INFO("number of scanouts: %d\n", num_scanouts);
 	}
-	DRM_INFO("number of scanouts: %d\n", num_scanouts);
 
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
 			num_capsets, &num_capsets);
@@ -246,10 +258,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		virtio_gpu_get_capsets(vgdev, num_capsets);
 	if (vgdev->has_edid)
 		virtio_gpu_cmd_get_edids(vgdev);
-	virtio_gpu_cmd_get_display_info(vgdev);
-	virtio_gpu_notify(vgdev);
-	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
-			   5 * HZ);
+	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) && vgdev->num_scanouts) {
+		virtio_gpu_cmd_get_display_info(vgdev);
+		virtio_gpu_notify(vgdev);
+		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
+				   5 * HZ);
+	}
 	return 0;
 
 err_scanouts:
-- 
2.39.1

