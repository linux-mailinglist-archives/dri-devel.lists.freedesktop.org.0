Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B56D91B1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B92D10EB24;
	Thu,  6 Apr 2023 08:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980B010EB1B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:32:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79AB921FDE;
 Thu,  6 Apr 2023 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680769964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PH78YwG3Pg5iRbmDVhx2aBy6aWQaeKxD64LfoEiYvRw=;
 b=y+ymM8rmkQLw3TseXG/tT4RcVfzjY+lQBN/wBzR5jBDL+gmSaodet01emguqhGb4pIrCOR
 dyeb7VHxKErrrgmjnD/Ddv69u8oJ6U2ArtT7ALhGtkgdTRnUD6R40eVmZe6hZbUUO5cr98
 pU6UlEOgrqmsAqcThUw7TMm7ypnZukk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680769964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PH78YwG3Pg5iRbmDVhx2aBy6aWQaeKxD64LfoEiYvRw=;
 b=2KV1GNU8jLf5kdVXJxqGHBi+tFTRMok4d7Ifq8tfvesbErdwYcls/54aGl/ohoSkwIt9Dr
 hCbHk2oua6hf7UAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54B1C133E5;
 Thu,  6 Apr 2023 08:32:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2FDIE6yDLmQZZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:32:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v4 9/9] video/aperture: Provide a VGA helper for gma500 and
 internal use
Date: Thu,  6 Apr 2023 10:32:40 +0200
Message-Id: <20230406083240.14031-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406083240.14031-1-tzimmermann@suse.de>
References: <20230406083240.14031-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware for gma500 is different from the rest, as it uses stolen
framebuffer memory that is not available via PCI BAR. The regular PCI
removal helper cannot detect the framebuffer, while the non-PCI helper
misses possible conflicting VGA devices (i.e., a framebuffer or text
console).

Gma500 therefore calls both helpers to catch all cases. It's confusing
as it implies that there's something about the PCI device that requires
ownership management. The relationship between the PCI device and the
VGA devices is non-obvious. At worst, readers might assume that calling
two functions for clearing aperture ownership is a bug in the driver.

Hence, move the PCI removal helper's code for VGA functionality into
a separate function and call this function from gma500. Documents the
purpose of each call to aperture helpers. The change contains comments
and example code form the discussion at [1].

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20230404201842.567344-1-daniel.vetter@ffwll.ch/ # 1
---
 drivers/gpu/drm/gma500/psb_drv.c | 48 ++++++++++++++++++--------
 drivers/video/aperture.c         | 58 ++++++++++++++++++++++----------
 include/linux/aperture.h         |  7 ++++
 3 files changed, 81 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 4bb06a89e48d..f50a9a58a2db 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -7,6 +7,7 @@
  *
  **************************************************************************/
 
+#include <linux/aperture.h>
 #include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
@@ -19,7 +20,6 @@
 #include <acpi/video.h>
 
 #include <drm/drm.h>
-#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -414,25 +414,45 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	return ret;
 }
 
-static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+/*
+ * Hardware for gma500 is a hybrid device, which both acts as a PCI
+ * device (for legacy vga functionality) but also more like an
+ * integrated display on a SoC where the framebuffer simply
+ * resides in main memory and not in a special PCI bar (that
+ * internally redirects to a stolen range of main memory) like all
+ * other integrated PCI display devices have.
+ *
+ * To catch all cases we need to remove conflicting firmware devices
+ * for the stolen system memory and for the VGA functionality. As we
+ * currently cannot easily find the framebuffer's location in stolen
+ * memory, we remove all framebuffers here.
+ *
+ * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
+ *       we might be able to read the framebuffer range from the
+ *       device.
+ */
+static int gma_remove_conflicting_framebuffers(struct pci_dev *pdev,
+					       const struct drm_driver *req_driver)
 {
-	struct drm_psb_private *dev_priv;
-	struct drm_device *dev;
+	resource_size_t base = 0;
+	resource_size_t size = U32_MAX; /* 4 GiB HW limit */
+	const char *name = req_driver->name;
 	int ret;
 
-	/*
-	 * We cannot yet easily find the framebuffer's location in memory. So
-	 * remove all framebuffers here. Note that we still want the pci special
-	 * handling to kick out vgacon.
-	 *
-	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
-	 *       might be able to read the framebuffer range from the device.
-	 */
-	ret = drm_aperture_remove_framebuffers(&driver);
+	ret = aperture_remove_conflicting_devices(base, size, name);
 	if (ret)
 		return ret;
 
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
+	return __aperture_remove_legacy_vga_devices(pdev);
+}
+
+static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct drm_psb_private *dev_priv;
+	struct drm_device *dev;
+	int ret;
+
+	ret = gma_remove_conflicting_framebuffers(pdev, &driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index e4091688b5eb..2824345e87ef 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -301,6 +301,37 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_devices);
 
+/**
+ * __aperture_remove_legacy_vga_devices - remove legacy VGA devices of a PCI devices
+ * @pdev: PCI device
+ *
+ * This function removes VGA devices provided by @pdev, such as a VGA
+ * framebuffer or a console. This is useful if you have a VGA-compatible
+ * PCI graphics device with framebuffers in non-BAR locations. Drivers
+ * should acquire ownership of those memory areas and afterwards call
+ * this helper to release remaining VGA devices.
+ *
+ * If your hardware has its framebuffers accessible via PCI BARS, use
+ * aperture_remove_conflicting_pci_devices() instead. The function will
+ * release any VGA devices automatically.
+ *
+ * WARNING: Apparently we must remove graphics drivers before calling
+ *          this helper. Otherwise the vga fbdev driver falls over if
+ *          we have vgacon configured.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
+{
+	/* VGA framebuffer */
+	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
+
+	/* VGA textmode console */
+	return vga_remove_vgacon(pdev);
+}
+EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
+
 /**
  * aperture_remove_conflicting_pci_devices - remove existing framebuffers for PCI devices
  * @pdev: PCI device
@@ -317,7 +348,7 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 {
 	bool primary = false;
 	resource_size_t base, size;
-	int bar, ret;
+	int bar, ret = 0;
 
 	if (pdev == vga_default_device())
 		primary = true;
@@ -334,24 +365,15 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 		aperture_detach_devices(base, size);
 	}
 
-	if (primary) {
-		/*
-		 * If this is the primary adapter, there could be a VGA device
-		 * that consumes the VGA framebuffer I/O range. Remove this
-		 * device as well.
-		 */
-		aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
-
-		/*
-		 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-		 * otherwise the vga fbdev driver falls over.
-		 */
-		ret = vga_remove_vgacon(pdev);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * If this is the primary adapter, there could be a VGA device
+	 * that consumes the VGA framebuffer I/O range. Remove this
+	 * device as well.
+	 */
+	if (primary)
+		ret = __aperture_remove_legacy_vga_devices(pdev);
 
-	return 0;
+	return ret;
 
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_pci_devices);
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
index 7248727753be..1a9a88b11584 100644
--- a/include/linux/aperture.h
+++ b/include/linux/aperture.h
@@ -16,6 +16,8 @@ int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
 int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
 					const char *name);
 
+int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
+
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
 #else
 static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
@@ -31,6 +33,11 @@ static inline int aperture_remove_conflicting_devices(resource_size_t base, reso
 	return 0;
 }
 
+static inline int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
+{
+	return 0;
+}
+
 static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
 {
 	return 0;
-- 
2.40.0

