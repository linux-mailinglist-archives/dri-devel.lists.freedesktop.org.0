Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF101BBDE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C456E395;
	Tue, 28 Apr 2020 12:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7864A89FF9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 20:05:17 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id f11so20662409qkk.16
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:subject:from:to:cc;
 bh=OBW8i+RNKoL73dhC0nXhVqUBxzG9EWBL6hn/JVV2KPQ=;
 b=XRlglDarSBty1CVMGGEc+WDunXeO7UYbFqB1T/P/TB25kBVPDw49tsclDlcC5UATiZ
 m+qURPtcf8fa4GVi6MQb8VJAzulwVIggYFUphjS/fO9RiaODZBlmPi83LC/6+n2UPbEX
 nR3C9w4fhfm8yeJFRwx9uQWNkdNI78+qBhAkq2vC7cfNESiF8VfrrhMOVk0ezAE5bHWR
 M5xJPIhu4/98thRHcN+rRTv0XItP1mN8+0xUN3ygw7QBJyHvqlJm5/1FBo3lUySXgzcF
 euOTkOKk/XWbd9fND1eGMvkLGFp58bXGziQZSBuur6BY7gP1P11gyCeZCKWaGkFyXDIn
 qYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version:subject
 :from:to:cc;
 bh=OBW8i+RNKoL73dhC0nXhVqUBxzG9EWBL6hn/JVV2KPQ=;
 b=UGetDGuF9JFbFq97Xf65llSfxWQjlrkLM0jfFg6RT4jPQLs/rNkgrIuenwmtD2JbM0
 V3HGgR3rQahW0Sd6WiHvPUrq+gyo0LbwkFikSWeRx5iuzLW8gqUPwMb3LLPJXDEouY6K
 cA0GPAsZWGLLLPKhuVotX5hXVv9Znn4/XVpAvNCAw0qAmdUtmt2NtIho+/a4Lef5sFQS
 Uij3sKVci2E+gQuDrhMHjNxEeFqYxBPsQudmzev3Oxial1o7MorsSgUoUWCd4tpEsWQl
 ZIvKsveNFTtL5vFVPOUjk47dTpuXvebig57ViiQpv4SAcyyxm6ocurgEEjS/JFItv4Il
 7gSQ==
X-Gm-Message-State: AGi0PuYoglI2FAcPzLkEgRAsZ2M4MpNJbXACRJeWWxsNd1kDTOw0phv9
 AdYdg4yCoWmjENdfDniCltIIwqY=
X-Google-Smtp-Source: APiQypL7pQ/DgxMaO4klQfg5hoa7OS1t6sDPimRGSjGc9JGii1svUlw73OvXFJJHtLjorYPTMs5FXNk=
X-Received: by 2002:a0c:e786:: with SMTP id x6mr24981107qvn.11.1588017916240; 
 Mon, 27 Apr 2020 13:05:16 -0700 (PDT)
Date: Mon, 27 Apr 2020 13:05:13 -0700
In-Reply-To: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
Message-Id: <20200427200513.36328-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH] drm: enable render nodes wherever buffer sharing is supported
From: Peter Collingbourne <pcc@google.com>
To: Eric Anholt <eric@anholt.net>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Peter Collingbourne <pcc@google.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Render nodes are not just useful for devices supporting GPU hardware
acceleration. Even on devices that only support dumb frame buffers,
they are useful in situations where composition (using software
rasterization) and KMS are done in different processes with buffer
sharing being used to send frame buffers between them. This is the
situation on Android, where surfaceflinger is the compositor and the
composer HAL uses KMS to display the buffers. Thus it is beneficial
to expose render nodes on all devices that support buffer sharing.

Because all drivers that currently support render nodes also support
buffer sharing, the DRIVER_RENDER flag is no longer necessary to mark
devices as supporting render nodes, so remove it and just rely on
the presence of a prime_handle_to_fd function pointer to determine
whether buffer sharing is supported.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 Documentation/gpu/drm-uapi.rst          | 9 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 drivers/gpu/drm/drm_drv.c               | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.c         | 2 +-
 drivers/gpu/drm/lima/lima_drv.c         | 2 +-
 drivers/gpu/drm/msm/msm_drv.c           | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c      | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 drivers/gpu/drm/radeon/radeon_drv.c     | 3 +--
 drivers/gpu/drm/tegra/drm.c             | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.c           | 1 -
 drivers/gpu/drm/vc4/vc4_drv.c           | 8 --------
 drivers/gpu/drm/vgem/vgem_drv.c         | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 2 +-
 include/drm/drm_drv.h                   | 7 -------
 19 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..2769714ae75a 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -129,10 +129,11 @@ authenticate to a DRM-Master prior to getting GPU access. To avoid this
 step and to grant clients GPU access without authenticating, render
 nodes were introduced. Render nodes solely serve render clients, that
 is, no modesetting or privileged ioctls can be issued on render nodes.
-Only non-global rendering commands are allowed. If a driver supports
-render nodes, it must advertise it via the DRIVER_RENDER DRM driver
-capability. If not supported, the primary node must be used for render
-clients together with the legacy drmAuth authentication procedure.
+Only non-global rendering commands are allowed. Drivers that support
+:ref:`PRIME buffer sharing <prime_buffer_sharing>` automatically
+support render nodes. If a driver does not support render nodes,
+the primary node must be used for render clients together with the
+legacy drmAuth authentication procedure.
 
 If a driver advertises render node support, DRM core will create a
 separate render node called renderD<num>. There will be one render node
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8ea86ffdea0d..46460620bc37 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1426,7 +1426,7 @@ static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_ATOMIC |
 	    DRIVER_GEM |
-	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ |
+	    DRIVER_MODESET | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b1a628d1f6e..8861a30920e5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -651,7 +651,7 @@ int drm_dev_init(struct drm_device *dev,
 		goto err_free;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
+	if (driver->prime_handle_to_fd) {
 		ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
 		if (ret)
 			goto err_minors;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a8685b2e1803..abfb143334ac 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -497,7 +497,7 @@ static const struct file_operations fops = {
 };
 
 static struct drm_driver etnaviv_drm_driver = {
-	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
+	.driver_features    = DRIVER_GEM,
 	.open               = etnaviv_open,
 	.postclose           = etnaviv_postclose,
 	.gem_free_object_unlocked = etnaviv_gem_free_object,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 57defeb44522..834eb5713fe4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -121,7 +121,7 @@ static const struct file_operations exynos_drm_driver_fops = {
 
 static struct drm_driver exynos_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM
-				  | DRIVER_ATOMIC | DRIVER_RENDER,
+				  | DRIVER_ATOMIC,
 	.open			= exynos_drm_open,
 	.lastclose		= drm_fb_helper_lastclose,
 	.postclose		= exynos_drm_postclose,
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 81a4621853db..b028a32fcac5 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1834,7 +1834,7 @@ static struct drm_driver driver = {
 	 */
 	.driver_features =
 	    DRIVER_GEM |
-	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ,
+	    DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
 	.lastclose = i915_driver_lastclose,
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 2daac64d8955..bd8b6ad25ac0 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -252,7 +252,7 @@ DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
  */
 
 static struct drm_driver lima_drm_driver = {
-	.driver_features    = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open               = lima_drm_driver_open,
 	.postclose          = lima_drm_driver_postclose,
 	.ioctls             = lima_drm_driver_ioctls,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 29295dee2a2e..061e62d4b691 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1000,7 +1000,6 @@ static const struct file_operations fops = {
 
 static struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
-				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET,
 	.open               = msm_open,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ca4087f5a15b..3ba8c9789292 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1169,7 +1169,7 @@ nouveau_driver_fops = {
 static struct drm_driver
 driver_stub = {
 	.driver_features =
-		DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER
+		DRIVER_GEM | DRIVER_MODESET
 #if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
 		| DRIVER_KMS_LEGACY_CONTEXT
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index cdafd7ef1c32..fe25b352a755 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -558,7 +558,7 @@ static const struct file_operations omapdriver_fops = {
 
 static struct drm_driver omap_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM  |
-		DRIVER_ATOMIC | DRIVER_RENDER,
+		DRIVER_ATOMIC,
 	.open = dev_open,
 	.lastclose = drm_fb_helper_lastclose,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 882fecc33fdb..058765d5d5d5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -550,7 +550,7 @@ DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
  * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
  */
 static struct drm_driver panfrost_drm_driver = {
-	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
+	.driver_features	= DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open			= panfrost_open,
 	.postclose		= panfrost_postclose,
 	.ioctls			= panfrost_drm_driver_ioctls,
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 59f8186a2415..9457b2f8f81e 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -600,8 +600,7 @@ static const struct file_operations radeon_driver_kms_fops = {
 };
 
 static struct drm_driver kms_driver = {
-	.driver_features =
-	    DRIVER_GEM | DRIVER_RENDER,
+	.driver_features = DRIVER_GEM,
 	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..55190c582946 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -849,7 +849,7 @@ static int tegra_debugfs_init(struct drm_minor *minor)
 
 static struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM |
-			   DRIVER_ATOMIC | DRIVER_RENDER,
+			   DRIVER_ATOMIC,
 	.open = tegra_drm_open,
 	.postclose = tegra_drm_postclose,
 	.lastclose = drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index eaa8e9682373..96db702fd648 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -195,7 +195,6 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 
 static struct drm_driver v3d_drm_driver = {
 	.driver_features = (DRIVER_GEM |
-			    DRIVER_RENDER |
 			    DRIVER_SYNCOBJ),
 
 	.open = v3d_open,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 76f93b662766..bf143d1e0d2e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -181,7 +181,6 @@ static struct drm_driver vc4_drm_driver = {
 	.driver_features = (DRIVER_MODESET |
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM |
-			    DRIVER_RENDER |
 			    DRIVER_SYNCOBJ),
 	.open = vc4_open,
 	.postclose = vc4_close,
@@ -251,7 +250,6 @@ static int vc4_drm_bind(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
-	struct device_node *node;
 	int ret = 0;
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
@@ -260,12 +258,6 @@ static int vc4_drm_bind(struct device *dev)
 	if (!vc4)
 		return -ENOMEM;
 
-	/* If VC4 V3D is missing, don't advertise render nodes. */
-	node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
-	if (!node || !of_device_is_available(node))
-		vc4_drm_driver.driver_features &= ~DRIVER_RENDER;
-	of_node_put(node);
-
 	drm = drm_dev_alloc(&vc4_drm_driver, dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 909eba43664a..abc7345a2e96 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -437,7 +437,7 @@ static void vgem_release(struct drm_device *dev)
 }
 
 static struct drm_driver vgem_driver = {
-	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
+	.driver_features		= DRIVER_GEM,
 	.release			= vgem_release,
 	.open				= vgem_open,
 	.postclose			= vgem_postclose,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ab4bed78e656..22195e008f0d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -189,7 +189,7 @@ MODULE_AUTHOR("Alon Levy");
 DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index c2247a893ed4..415c3f8ea907 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1435,7 +1435,7 @@ static const struct file_operations vmwgfx_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
+	DRIVER_MODESET | DRIVER_ATOMIC,
 	.ioctls = vmw_ioctls,
 	.num_ioctls = ARRAY_SIZE(vmw_ioctls),
 	.master_set = vmw_master_set,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 97109df5beac..f0277d3f89fe 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -61,13 +61,6 @@ enum drm_driver_feature {
 	 * Driver supports mode setting interfaces (KMS).
 	 */
 	DRIVER_MODESET			= BIT(1),
-	/**
-	 * @DRIVER_RENDER:
-	 *
-	 * Driver supports dedicated render nodes. See also the :ref:`section on
-	 * render nodes <drm_render_node>` for details.
-	 */
-	DRIVER_RENDER			= BIT(3),
 	/**
 	 * @DRIVER_ATOMIC:
 	 *
-- 
2.26.2.303.gf8c07b1a785-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
