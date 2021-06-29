Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A23B739B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 15:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111B3898ED;
	Tue, 29 Jun 2021 13:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D989885;
 Tue, 29 Jun 2021 13:58:36 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 354AB21F44;
 Tue, 29 Jun 2021 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624975115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=czyn8Ol6WmjBIbWhgsw7YYkLk950NiTNopW4iRndWpU=;
 b=RQDIkZgkPbOAfNjIQQdyQ7vPDxl7MTUjI1AqEvTVYpQybouNFsTvFjWEALeallLT0fQ4WC
 1lqYv+HJCivaPtOqzgwSE862U9o1TmDtDwkwJ58EahPu4pvJUrI0WRxphqktflQlim1EM2
 py8A6Z3I1Ny6G2Z9SZFYKwnErIKzrXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624975115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=czyn8Ol6WmjBIbWhgsw7YYkLk950NiTNopW4iRndWpU=;
 b=xa5RRJY2dV8xhxoEWNWboErj85NCZ3IJSzw6EKC1UfhcarTHVOMsPynb6INmZZX0W954Tm
 xzgviKXAGzLnVYDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D733411906;
 Tue, 29 Jun 2021 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624975115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=czyn8Ol6WmjBIbWhgsw7YYkLk950NiTNopW4iRndWpU=;
 b=RQDIkZgkPbOAfNjIQQdyQ7vPDxl7MTUjI1AqEvTVYpQybouNFsTvFjWEALeallLT0fQ4WC
 1lqYv+HJCivaPtOqzgwSE862U9o1TmDtDwkwJ58EahPu4pvJUrI0WRxphqktflQlim1EM2
 py8A6Z3I1Ny6G2Z9SZFYKwnErIKzrXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624975115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=czyn8Ol6WmjBIbWhgsw7YYkLk950NiTNopW4iRndWpU=;
 b=xa5RRJY2dV8xhxoEWNWboErj85NCZ3IJSzw6EKC1UfhcarTHVOMsPynb6INmZZX0W954Tm
 xzgviKXAGzLnVYDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 74CmMwon22CidAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Jun 2021 13:58:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com
Subject: [PATCH] drm/aperture: Pass DRM driver structure instead of driver name
Date: Tue, 29 Jun 2021 15:58:33 +0200
Message-Id: <20210629135833.22679-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-hyperv@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 spice-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print the name of the DRM driver when taking over fbdev devices. Makes
the output to dmesg more consistent. Note that the driver name is only
used for printing a string to the kernel log. No UAPI is affected by this
change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 drivers/gpu/drm/armada/armada_drv.c           |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/bochs/bochs_drv.c             |  2 +-
 drivers/gpu/drm/drm_aperture.c                | 19 ++++++++++++-------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  4 ++--
 drivers/gpu/drm/i915/i915_drv.c               |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  2 +-
 include/drm/drm_aperture.h                    | 14 +++++++++-----
 23 files changed, 43 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6f30c525caac..accf9c1b967a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1278,7 +1278,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 #endif
 
 	/* Get rid of things like offb */
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index dab0a1f0983b..31925ae3ab72 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -95,7 +95,7 @@ static int armada_drm_bind(struct device *dev)
 	}
 
 	/* Remove early framebuffers */
-	ret = drm_aperture_remove_framebuffers(false, "armada-drm-fb");
+	ret = drm_aperture_remove_framebuffers(false, &armada_drm_driver);
 	if (ret) {
 		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
 			__func__, ret);
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 5aa452b4efe6..86d5cd7b6318 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -100,7 +100,7 @@ static int ast_remove_conflicting_framebuffers(struct pci_dev *pdev)
 	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
 #endif
 
-	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, "astdrmfb");
+	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, &ast_driver);
 }
 
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index c828cadbabff..0d232b44ecd7 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -110,7 +110,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 	}
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &bochs_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 9335d9d6cf9a..9ac39cf11694 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -33,6 +33,10 @@
  *
  * .. code-block:: c
  *
+ *	static const struct drm_driver example_driver = {
+ *		...
+ *	};
+ *
  *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
  *	{
  *		bool primary = false;
@@ -46,7 +50,7 @@
  *	#endif
  *
  *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
- *		                                                    "example driver");
+ *		                                                    &example_driver);
  *	}
  *
  *	static int probe(struct pci_dev *pdev)
@@ -274,7 +278,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
  * @base: the aperture's base address in physical memory
  * @size: aperture size in bytes
  * @primary: also kick vga16fb if present
- * @name: requesting driver name
+ * @req_driver: requesting DRM driver
  *
  * This function removes graphics device drivers which use memory range described by
  * @base and @size.
@@ -283,7 +287,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
  * 0 on success, or a negative errno code otherwise
  */
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const char *name)
+						 bool primary, const struct drm_driver *req_driver)
 {
 #if IS_REACHABLE(CONFIG_FB)
 	struct apertures_struct *a;
@@ -296,7 +300,7 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 	a->ranges[0].base = base;
 	a->ranges[0].size = size;
 
-	ret = remove_conflicting_framebuffers(a, name, primary);
+	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
 	kfree(a);
 
 	if (ret)
@@ -312,7 +316,7 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 /**
  * drm_aperture_remove_conflicting_pci_framebuffers - remove existing framebuffers for PCI devices
  * @pdev: PCI device
- * @name: requesting driver name
+ * @req_driver: requesting DRM driver
  *
  * This function removes graphics device drivers using memory range configured
  * for any of @pdev's memory bars. The function assumes that PCI device with
@@ -321,7 +325,8 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
-int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
+int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
+						     const struct drm_driver *req_driver)
 {
 	resource_size_t base, size;
 	int bar, ret = 0;
@@ -339,7 +344,7 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const
 	 * otherwise the vga fbdev driver falls over.
 	 */
 #if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, name);
+	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
 #endif
 	if (ret == 0)
 		ret = vga_remove_vgacon(pdev);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index f4bc5386574a..6f0297b854f2 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -314,7 +314,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	struct drm_device *dev;
 	int ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "hibmcdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hibmc_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index eb06c92c4bfd..cd818a629183 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -82,7 +82,7 @@ static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
 		return -ENODEV;
 	}
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "hypervdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
 	if (ret) {
 		drm_err(dev, "Not able to remove boot fb\n");
 		return ret;
@@ -127,7 +127,7 @@ static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
 	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
 						     screen_info.lfb_size,
 						     false,
-						     "hypervdrmfb");
+						     &hyperv_driver);
 
 	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 850b499c71c8..62327c15f457 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -562,7 +562,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_perf;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "inteldrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, dev_priv->drm.driver);
 	if (ret)
 		goto err_ggtt;
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index a7388bf7c838..3d0ccc7eef1b 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
 	 * located anywhere in RAM
 	 */
-	ret = drm_aperture_remove_framebuffers(false, "meson-drm-fb");
+	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
 	if (ret)
 		goto free_drm;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a701d9563257..36d1bfb3213f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -342,7 +342,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &mgag200_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 227404077e39..67fae60f2fa5 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -169,7 +169,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	}
 
 	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(false, "msm");
+	ret = drm_aperture_remove_framebuffers(false, dev->driver);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a616cf4573b8..df8a2d92f473 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -738,7 +738,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nvkm_device_del(&device);
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 854e6c5a563f..31f4c86ceb99 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -95,7 +95,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "qxl");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &qxl_driver);
 	if (ret)
 		goto disable_pci;
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 8cd135fa6dcd..82ee8244c9b3 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -330,7 +330,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 		return -EPROBE_DEFER;
 
 	/* Get rid of things like offb */
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &kms_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index b730b8d5d949..17a189bb6bbc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -116,7 +116,7 @@ static int rockchip_drm_bind(struct device *dev)
 	int ret;
 
 	/* Remove existing drivers that may own the framebuffer memory. */
-	ret = drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
+	ret = drm_aperture_remove_framebuffers(false, &rockchip_drm_driver);
 	if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "Failed to remove existing framebuffers - %d.\n",
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index af335f58bdfc..6bc1c8d6d43b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -100,7 +100,7 @@ static int sun4i_drv_bind(struct device *dev)
 	drm->irq_enabled = true;
 
 	/* Remove early framebuffers (ie. simplefb) */
-	ret = drm_aperture_remove_framebuffers(false, "sun4i-drm-fb");
+	ret = drm_aperture_remove_framebuffers(false, &sun4i_drv_driver);
 	if (ret)
 		goto cleanup_mode_config;
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f96c237b2242..2c8fc14bba1f 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1204,7 +1204,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(false, "tegradrmfb");
+	err = drm_aperture_remove_framebuffers(false, &tegra_drm_driver);
 	if (err < 0)
 		goto hub;
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 42611dacde88..a8b476a59c0d 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -550,7 +550,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	struct cirrus_device *cirrus;
 	int ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &cirrus_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 6d4b32da9866..879a2445cc44 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -43,7 +43,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!vbox_check_supported(VBE_DISPI_ID_HGSMI))
 		return -ENODEV;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 8a60fb8ad370..73335feb712f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -265,7 +265,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto unbind_all;
 
-	ret = drm_aperture_remove_framebuffers(false, "vc4drmfb");
+	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
 	if (ret)
 		goto unbind_all;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ca77edbc5ea0..ed85a7863256 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -57,7 +57,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
 		 vga ? "virtio-vga" : "virtio-gpu-pci",
 		 pname);
 	if (vga) {
-		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "virtiodrmfb");
+		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 086dc75e7b42..40864ce19ae1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1574,7 +1574,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct vmw_private *vmw;
 	int ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 6c148078780c..7096703c3949 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -6,20 +6,22 @@
 #include <linux/types.h>
 
 struct drm_device;
+struct drm_driver;
 struct pci_dev;
 
 int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
 					resource_size_t size);
 
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const char *name);
+						 bool primary, const struct drm_driver *req_driver);
 
-int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name);
+int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
+						     const struct drm_driver *req_driver);
 
 /**
  * drm_aperture_remove_framebuffers - remove all existing framebuffers
  * @primary: also kick vga16fb if present
- * @name: requesting driver name
+ * @req_driver: requesting DRM driver
  *
  * This function removes all graphics device drivers. Use this function on systems
  * that can have their framebuffer located anywhere in memory.
@@ -27,9 +29,11 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
-static inline int drm_aperture_remove_framebuffers(bool primary, const char *name)
+static inline int
+drm_aperture_remove_framebuffers(bool primary, const struct drm_driver *req_driver)
 {
-	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary, name);
+	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary,
+							    req_driver);
 }
 
 #endif
-- 
2.32.0

