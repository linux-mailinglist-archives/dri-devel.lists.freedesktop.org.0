Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1408C6683BB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB210E35A;
	Thu, 12 Jan 2023 20:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F69710E1D9;
 Thu, 12 Jan 2023 20:12:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6581924EF8;
 Thu, 12 Jan 2023 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673554320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRPPFUJZq94336eF4l+2/nvNKYNY6L0enURMe8zyDOI=;
 b=wq4gW4NAePYAhU9pmFMS3PkR/bj7EL/bnf97jAduOg0w76/9+w8wV43tBhCqa0DCz70bGX
 EOIpUb2aZHBZS2qwZL5Epq9hu2z71zGOalqzHwPZrOL98l4vgNuWO4EeWJq0Zy2LERM58a
 foq+qY2kmiMBfEiyTQJNTqHpfho0Zkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673554320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRPPFUJZq94336eF4l+2/nvNKYNY6L0enURMe8zyDOI=;
 b=U5urOv3kg2O03YeGSztFEpPwp3ZzBk4mwzGxBcLQ6X5EA0PowUhKx3SlGa/UgKBfq15wPe
 rr06XfAxCe3XKeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 078F613585;
 Thu, 12 Jan 2023 20:12:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wNkPAZBpwGMGKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 20:12:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, evan.quan@amd.com, jose.souza@intel.com
Subject: [PATCH v2 3/3] drm: Call vga_switcheroo_process_delayed_switch() in
 drm_lastclose
Date: Thu, 12 Jan 2023 21:11:56 +0100
Message-Id: <20230112201156.26849-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112201156.26849-1-tzimmermann@suse.de>
References: <20230112201156.26849-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several lastclose helpers call vga_switcheroo_process_delayed_switch().
It's better to call the helper from drm_lastclose() after the kernel
client's screen has been restored. This way, all drivers can benefit
without having to implement their own lastclose helper. For drivers
without vga-switcheroo, vga_switcheroo_process_delayed_switch() does
nothing.

There was an earlier patchset to do something similar. [1]

v2:
	* handle vga_switcheroo_client_fb_set() in a separate patch
	* also update i915, nouveau and radeon
	* remove unnecessary include statements
	* update vga-switcheroo docs

Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://lore.kernel.org/amd-gfx/20221020143603.563929-1-alexander.deucher@amd.com/ # 1
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 -------------
 drivers/gpu/drm/drm_file.c              |  3 +++
 drivers/gpu/drm/i915/i915_driver.c      | 25 ++-----------------------
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c   |  7 -------
 drivers/gpu/drm/nouveau/nouveau_vga.h   |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.h     |  1 -
 drivers/gpu/drm/radeon/radeon_kms.c     | 18 ------------------
 drivers/gpu/vga/vga_switcheroo.c        |  4 ++--
 12 files changed, 8 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 63c921c55fb9..7120b9b6e580 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1330,7 +1330,6 @@ extern const int amdgpu_max_kms_ioctl;
 
 int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
 void amdgpu_driver_unload_kms(struct drm_device *dev);
-void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 1353ffd08988..783c1e284a22 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -34,7 +34,6 @@
 #include <drm/drm_pciids.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-#include <linux/vga_switcheroo.h>
 #include <drm/drm_probe_helper.h>
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
@@ -2785,7 +2784,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
-	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 7aa7e52ca784..a37be02fb2fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -34,7 +34,6 @@
 #include "amdgpu_vce.h"
 #include "atom.h"
 
-#include <linux/vga_switcheroo.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/pci.h>
@@ -1104,18 +1103,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 /*
  * Outdated mess for old drm with Xorg being in charge (void function now).
  */
-/**
- * amdgpu_driver_lastclose_kms - drm callback for last close
- *
- * @dev: drm dev pointer
- *
- * Switch vga_switcheroo state after last close (all asics).
- */
-void amdgpu_driver_lastclose_kms(struct drm_device *dev)
-{
-	drm_fb_helper_lastclose(dev);
-	vga_switcheroo_process_delayed_switch();
-}
 
 /**
  * amdgpu_driver_open_kms - drm callback for open
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a51ff8cee049..314c309db9a3 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
@@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
 		drm_legacy_dev_reinit(dev);
 
 	drm_client_dev_restore(dev);
+
+	vga_switcheroo_process_delayed_switch();
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 33e231b120c1..bf6ad8620970 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -29,6 +29,7 @@
 
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/fb.h> /* for FBINFO_STATE_ */
 #include <linux/module.h>
 #include <linux/oom.h>
 #include <linux/pci.h>
@@ -37,7 +38,6 @@
 #include <linux/pnp.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
-#include <linux/vga_switcheroo.h>
 #include <linux/vt.h>
 
 #include <drm/drm_aperture.h>
@@ -1057,27 +1057,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-/**
- * i915_driver_lastclose - clean up after all DRM clients have exited
- * @dev: DRM device
- *
- * Take care of cleaning up after all DRM clients have exited.  In the
- * mode setting case, we want to restore the kernel's initial mode (just
- * in case the last client left us in a bad state).
- *
- * Additionally, in the non-mode setting case, we'll tear down the GTT
- * and DMA structures, since the kernel won't be using them, and clea
- * up any GEM state.
- */
-static void i915_driver_lastclose(struct drm_device *dev)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-
-	intel_fbdev_restore_mode(dev);
-
-	vga_switcheroo_process_delayed_switch();
-}
-
 static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
@@ -1921,7 +1900,7 @@ static const struct drm_driver i915_drm_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
-	.lastclose = i915_driver_lastclose,
+	.lastclose = intel_fbdev_restore_mode,
 	.postclose = i915_driver_postclose,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 80f154b6adab..c3bd2a1d3d2e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1230,7 +1230,6 @@ driver_stub = {
 
 	.open = nouveau_drm_open,
 	.postclose = nouveau_drm_postclose,
-	.lastclose = nouveau_vga_lastclose,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = nouveau_drm_debugfs_init,
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 789393b94291..fc125e2247f7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -126,10 +126,3 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
 		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
 }
-
-
-void
-nouveau_vga_lastclose(struct drm_device *dev)
-{
-	vga_switcheroo_process_delayed_switch();
-}
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouveau/nouveau_vga.h
index 951a83f984dd..63be415d2a44 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.h
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
@@ -4,6 +4,5 @@
 
 void nouveau_vga_init(struct nouveau_drm *);
 void nouveau_vga_fini(struct nouveau_drm *);
-void nouveau_vga_lastclose(struct drm_device *dev);
 
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 6cbe1ab81aba..dbf85e1f0061 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -597,7 +597,7 @@ static const struct drm_driver kms_driver = {
 	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
-	.lastclose = radeon_driver_lastclose_kms,
+	.lastclose = drm_fb_helper_lastclose,
 	.unload = radeon_driver_unload_kms,
 	.ioctls = radeon_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
index ac7970919c4d..2ffe0975ee54 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.h
+++ b/drivers/gpu/drm/radeon/radeon_drv.h
@@ -120,7 +120,6 @@ long radeon_drm_ioctl(struct file *filp,
 
 int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
 void radeon_driver_unload_kms(struct drm_device *dev);
-void radeon_driver_lastclose_kms(struct drm_device *dev);
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void radeon_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 965161b8565b..e0214cf1b43b 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -32,7 +32,6 @@
 #include <linux/uaccess.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/radeon_drm.h>
@@ -622,23 +621,6 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 }
 
-
-/*
- * Outdated mess for old drm with Xorg being in charge (void function now).
- */
-/**
- * radeon_driver_lastclose_kms - drm callback for last close
- *
- * @dev: drm dev pointer
- *
- * Switch vga_switcheroo state after last close (all asics).
- */
-void radeon_driver_lastclose_kms(struct drm_device *dev)
-{
-	drm_fb_helper_lastclose(dev);
-	vga_switcheroo_process_delayed_switch();
-}
-
 /**
  * radeon_driver_open_kms - drm callback for open
  *
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 365e6ddbe90f..6a198cb80c12 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -926,8 +926,8 @@ static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
 /**
  * vga_switcheroo_process_delayed_switch() - helper for delayed switching
  *
- * Process a delayed switch if one is pending. DRM drivers should call this
- * from their ->lastclose callback.
+ * Process a delayed switch if one is pending. DRM automatically calls this
+ * at the end of its lastclose function.
  *
  * Return: 0 on success. -EINVAL if no delayed switch is pending, if the client
  * has unregistered in the meantime or if there are other clients blocking the
-- 
2.39.0

