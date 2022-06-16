Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A454EB54
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 22:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8410E220;
	Thu, 16 Jun 2022 20:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5A10E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655411931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcpyeeRyWN8W13ymKwH8KavJLNM6NbDkcW1tw/B8CUk=;
 b=fHNUqo9E3G2Ci7F4mR3dTDtVib1HZhgdP1DrDuTtsWSUehX4kJaAB1UwdoXpEEMGz7Gmzr
 WrjfbcoYcgWTfDL402gLOwnaNKyatzexyu65+Bys6KFkeHE01F9ZfDK+u+/V1GvZPdR0M6
 YwhA7hXDkuKxp4b61zGCDOiU/dwEfY8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-CAoZQWMlO_uIpKJfmR7miQ-1; Thu, 16 Jun 2022 16:38:48 -0400
X-MC-Unique: CAoZQWMlO_uIpKJfmR7miQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CE8F3C10221;
 Thu, 16 Jun 2022 20:38:47 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.35.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD1C1121314;
 Thu, 16 Jun 2022 20:38:46 +0000 (UTC)
Subject: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
From: Alex Williamson <alex.williamson@redhat.com>
To: corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 gregkh@linuxfoundation.org
Date: Thu, 16 Jun 2022 14:38:46 -0600
Message-ID: <165541192621.1955826.6848784198896919390.stgit@omen>
In-Reply-To: <165541020563.1955826.16350888595945658159.stgit@omen>
References: <165541020563.1955826.16350888595945658159.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Implement DRM's aperture helpers under video/ for sharing with other
sub-systems. Remove DRM-isms from the interface. The helpers track
the ownership of framebuffer apertures and provide hand-over from
firmware, such as EFI and VESA, to native graphics drivers.

Other subsystems, such as fbdev and vfio, also have to maintain ownership
of framebuffer apertures. Moving DRM's aperture helpers to a more public
location allows all subsystems to interact with each other and share a
common implementation.

The aperture helpers are selected by the various firmware drivers within
DRM and fbdev, and the VGA text-console driver.

The original DRM interface is kept in place for use by DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 Documentation/driver-api/aperture.rst |   13 +
 Documentation/driver-api/index.rst    |    1 
 drivers/gpu/drm/drm_aperture.c        |  174 +----------------
 drivers/gpu/drm/tiny/Kconfig          |    1 
 drivers/video/Kconfig                 |    6 +
 drivers/video/Makefile                |    2 
 drivers/video/aperture.c              |  340 +++++++++++++++++++++++++++++++++
 drivers/video/console/Kconfig         |    1 
 drivers/video/fbdev/Kconfig           |    7 +
 include/linux/aperture.h              |   56 +++++
 10 files changed, 435 insertions(+), 166 deletions(-)
 create mode 100644 Documentation/driver-api/aperture.rst
 create mode 100644 drivers/video/aperture.c
 create mode 100644 include/linux/aperture.h

diff --git a/Documentation/driver-api/aperture.rst b/Documentation/driver-api/aperture.rst
new file mode 100644
index 000000000000..d173f4e7a7d9
--- /dev/null
+++ b/Documentation/driver-api/aperture.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Managing Ownership of the Framebuffer Aperture
+==============================================
+
+.. kernel-doc:: drivers/video/aperture.c
+   :doc: overview
+
+.. kernel-doc:: include/linux/aperture.h
+   :internal:
+
+.. kernel-doc:: drivers/video/aperture.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index a6d525cd9fc4..d3a58f77328e 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -27,6 +27,7 @@ available subsections can be seen below.
    component
    message-based
    infiniband
+   aperture
    frame-buffer
    regulator
    reset
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 74bd4a76b253..388a205bd023 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -1,14 +1,7 @@
 // SPDX-License-Identifier: MIT
 
-#include <linux/device.h>
-#include <linux/fb.h>
-#include <linux/list.h>
-#include <linux/mutex.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h> /* for firmware helpers */
-#include <linux/slab.h>
-#include <linux/types.h>
-#include <linux/vgaarb.h>
+#include <linux/aperture.h>
+#include <linux/platform_device.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
@@ -126,92 +119,6 @@
  * afterwards.
  */
 
-struct drm_aperture {
-	struct drm_device *dev;
-	resource_size_t base;
-	resource_size_t size;
-	struct list_head lh;
-	void (*detach)(struct drm_device *dev);
-};
-
-static LIST_HEAD(drm_apertures);
-static DEFINE_MUTEX(drm_apertures_lock);
-
-static bool overlap(resource_size_t base1, resource_size_t end1,
-		    resource_size_t base2, resource_size_t end2)
-{
-	return (base1 < end2) && (end1 > base2);
-}
-
-static void devm_aperture_acquire_release(void *data)
-{
-	struct drm_aperture *ap = data;
-	bool detached = !ap->dev;
-
-	if (detached)
-		return;
-
-	mutex_lock(&drm_apertures_lock);
-	list_del(&ap->lh);
-	mutex_unlock(&drm_apertures_lock);
-}
-
-static int devm_aperture_acquire(struct drm_device *dev,
-				 resource_size_t base, resource_size_t size,
-				 void (*detach)(struct drm_device *))
-{
-	size_t end = base + size;
-	struct list_head *pos;
-	struct drm_aperture *ap;
-
-	mutex_lock(&drm_apertures_lock);
-
-	list_for_each(pos, &drm_apertures) {
-		ap = container_of(pos, struct drm_aperture, lh);
-		if (overlap(base, end, ap->base, ap->base + ap->size)) {
-			mutex_unlock(&drm_apertures_lock);
-			return -EBUSY;
-		}
-	}
-
-	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
-	if (!ap) {
-		mutex_unlock(&drm_apertures_lock);
-		return -ENOMEM;
-	}
-
-	ap->dev = dev;
-	ap->base = base;
-	ap->size = size;
-	ap->detach = detach;
-	INIT_LIST_HEAD(&ap->lh);
-
-	list_add(&ap->lh, &drm_apertures);
-
-	mutex_unlock(&drm_apertures_lock);
-
-	return devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
-}
-
-static void drm_aperture_detach_firmware(struct drm_device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev->dev);
-
-	/*
-	 * Remove the device from the device hierarchy. This is the right thing
-	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
-	 * the new driver takes over the hardware, the firmware device's state
-	 * will be lost.
-	 *
-	 * For non-platform devices, a new callback would be required.
-	 *
-	 * If the aperture helpers ever need to handle native drivers, this call
-	 * would only have to unplug the DRM device, so that the hardware device
-	 * stays around after detachment.
-	 */
-	platform_device_unregister(pdev);
-}
-
 /**
  * devm_aperture_acquire_from_firmware - Acquires ownership of a firmware framebuffer
  *                                       on behalf of a DRM driver.
@@ -239,39 +146,16 @@ static void drm_aperture_detach_firmware(struct drm_device *dev)
 int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
 					resource_size_t size)
 {
+	struct platform_device *pdev;
+
 	if (drm_WARN_ON(dev, !dev_is_platform(dev->dev)))
 		return -EINVAL;
 
-	return devm_aperture_acquire(dev, base, size, drm_aperture_detach_firmware);
-}
-EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
-
-static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
-{
-	resource_size_t end = base + size;
-	struct list_head *pos, *n;
-
-	mutex_lock(&drm_apertures_lock);
-
-	list_for_each_safe(pos, n, &drm_apertures) {
-		struct drm_aperture *ap =
-			container_of(pos, struct drm_aperture, lh);
-		struct drm_device *dev = ap->dev;
-
-		if (WARN_ON_ONCE(!dev))
-			continue;
-
-		if (!overlap(base, end, ap->base, ap->base + ap->size))
-			continue;
+	pdev = to_platform_device(dev->dev);
 
-		ap->dev = NULL; /* detach from device */
-		list_del(&ap->lh);
-
-		ap->detach(dev);
-	}
-
-	mutex_unlock(&drm_apertures_lock);
+	return devm_acquire_aperture_of_platform_device(pdev, base, size);
 }
+EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
 
 /**
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
@@ -289,27 +173,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const struct drm_driver *req_driver)
 {
-#if IS_REACHABLE(CONFIG_FB)
-	struct apertures_struct *a;
-	int ret;
-
-	a = alloc_apertures(1);
-	if (!a)
-		return -ENOMEM;
-
-	a->ranges[0].base = base;
-	a->ranges[0].size = size;
-
-	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
-	kfree(a);
-
-	if (ret)
-		return ret;
-#endif
-
-	drm_aperture_detach_drivers(base, size);
-
-	return 0;
+	return remove_conflicting_devices(base, size, primary, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
@@ -328,26 +192,6 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver)
 {
-	resource_size_t base, size;
-	int bar, ret = 0;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
-		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-			continue;
-		base = pci_resource_start(pdev, bar);
-		size = pci_resource_len(pdev, bar);
-		drm_aperture_detach_drivers(base, size);
-	}
-
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
-#endif
-	if (ret == 0)
-		ret = vga_remove_vgacon(pdev);
-	return ret;
+	return remove_conflicting_pci_devices(pdev, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 627d637a1e7e..027cd87c3d0d 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -69,6 +69,7 @@ config DRM_PANEL_MIPI_DBI
 config DRM_SIMPLEDRM
 	tristate "Simple framebuffer driver"
 	depends on DRM && MMU
+	select APERTURE_HELPERS
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 427a993c7f57..c69b45f8c427 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -5,6 +5,12 @@
 
 menu "Graphics support"
 
+config APERTURE_HELPERS
+	bool
+	help
+	  Support tracking and hand-over of aperture ownership. Required
+	  for firmware graphics drivers.
+
 if HAS_IOMEM
 
 config HAVE_FB_ATMEL
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index df7650adede9..5bb6b452cc83 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
new file mode 100644
index 000000000000..f0b877e9c256
--- /dev/null
+++ b/drivers/video/aperture.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/aperture.h>
+#include <linux/device.h>
+#include <linux/fb.h> /* for old fbdev helpers */
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vgaarb.h>
+
+/**
+ * DOC: overview
+ *
+ * A graphics device might be supported by different drivers, but only one
+ * driver can be active at any given time. Many systems load a generic
+ * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
+ * During later boot stages, they replace the generic driver with a dedicated,
+ * hardware-specific driver. To take over the device the dedicated driver
+ * first has to remove the generic driver. Aperture functions manage
+ * ownership of framebuffer memory and hand-over between drivers.
+ *
+ * Graphics drivers should call remove_conflicting_devices()
+ * at the top of their probe function. The function removes any generic
+ * driver that is currently associated with the given framebuffer memory.
+ * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
+ * example given below. The cod assumes a DRM driver.
+ *
+ * .. code-block:: c
+ *
+ *	static const struct drm_driver example_driver = {
+ *		.name = "exampledrm",
+ *		...
+ *	};
+ *
+ *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
+ *	{
+ *		bool primary = false;
+ *		resource_size_t base, size;
+ *		int ret;
+ *
+ *		base = pci_resource_start(pdev, 0);
+ *		size = pci_resource_len(pdev, 0);
+ *	#ifdef CONFIG_X86
+ *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
+ *	#endif
+ *
+ *		return remove_conflicting_devices(base, size, primary, &example_driver->name);
+ *	}
+ *
+ *	static int probe(struct pci_dev *pdev)
+ *	{
+ *		int ret;
+ *
+ *		// Remove any generic drivers...
+ *		ret = remove_conflicting_framebuffers(pdev);
+ *		if (ret)
+ *			return ret;
+ *
+ *		// ... and initialize the hardware.
+ *		...
+ *
+ *		drm_dev_register();
+ *
+ *		return 0;
+ *	}
+ *
+ * PCI device drivers can also call remove_conflicting_pci_devices() and let the
+ * function detect the apertures automatically. Device drivers without knowledge of
+ * the framebuffer's location shall call remove_all_conflicting_devices(),
+ * which removes all known devices.
+ *
+ * Drivers that are susceptible to being removed by other drivers, such as
+ * generic EFI or VESA drivers, have to register themselves as owners of their
+ * framebuffer apertures. Ownership of the framebuffer memory is achieved
+ * by calling devm_acquire_aperture_of_platform_device(). On success, the driver
+ * is the owner of the framebuffer range. The function fails if the
+ * framebuffer is already owned by another driver. See below for an example.
+ *
+ * .. code-block:: c
+ *
+ *	static int acquire_framebuffers(struct drm_device *dev, struct platform_device *pdev)
+ *	{
+ *		resource_size_t base, size;
+ *
+ *		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ *		if (!mem)
+ *			return -EINVAL;
+ *		base = mem->start;
+ *		size = resource_size(mem);
+ *
+ *		return devm_acquire_aperture_of_platform_device(pdev, base, size);
+ *	}
+ *
+ *	static int probe(struct platform_device *pdev)
+ *	{
+ *		struct drm_device *dev;
+ *		int ret;
+ *
+ *		// ... Initialize the device...
+ *		dev = devm_drm_dev_alloc();
+ *		...
+ *
+ *		// ... and acquire ownership of the framebuffer.
+ *		ret = acquire_framebuffers(dev, pdev);
+ *		if (ret)
+ *			return ret;
+ *
+ *		drm_dev_register(dev, 0);
+ *
+ *		return 0;
+ *	}
+ *
+ * The generic driver is now subject to forced removal by other drivers. This
+ * only works for platform drivers that support hot unplugging.
+ * When a driver calls remove_conflicting_devices() et al
+ * for the registered framebuffer range, the aperture helpers call
+ * platform_device_unregister() and the generic driver unloads itself. It
+ * may not access the device's registers, framebuffer memory, ROM, etc
+ * afterwards.
+ */
+
+struct dev_aperture {
+	struct device *dev;
+	resource_size_t base;
+	resource_size_t size;
+	struct list_head lh;
+	void (*detach)(struct device *dev);
+};
+
+static LIST_HEAD(apertures);
+static DEFINE_MUTEX(apertures_lock);
+
+static bool overlap(resource_size_t base1, resource_size_t end1,
+		    resource_size_t base2, resource_size_t end2)
+{
+	return (base1 < end2) && (end1 > base2);
+}
+
+static void devm_aperture_acquire_release(void *data)
+{
+	struct dev_aperture *ap = data;
+	bool detached = !ap->dev;
+
+	if (detached)
+		return;
+
+	mutex_lock(&apertures_lock);
+	list_del(&ap->lh);
+	mutex_unlock(&apertures_lock);
+}
+
+static int devm_aperture_acquire(struct device *dev,
+				 resource_size_t base, resource_size_t size,
+				 void (*detach)(struct device *))
+{
+	size_t end = base + size;
+	struct list_head *pos;
+	struct dev_aperture *ap;
+
+	mutex_lock(&apertures_lock);
+
+	list_for_each(pos, &apertures) {
+		ap = container_of(pos, struct dev_aperture, lh);
+		if (overlap(base, end, ap->base, ap->base + ap->size)) {
+			mutex_unlock(&apertures_lock);
+			return -EBUSY;
+		}
+	}
+
+	ap = devm_kzalloc(dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap) {
+		mutex_unlock(&apertures_lock);
+		return -ENOMEM;
+	}
+
+	ap->dev = dev;
+	ap->base = base;
+	ap->size = size;
+	ap->detach = detach;
+	INIT_LIST_HEAD(&ap->lh);
+
+	list_add(&ap->lh, &apertures);
+
+	mutex_unlock(&apertures_lock);
+
+	return devm_add_action_or_reset(dev, devm_aperture_acquire_release, ap);
+}
+
+static void detach_platform_device(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	/*
+	 * Remove the device from the device hierarchy. This is the right thing
+	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
+	 * the new driver takes over the hardware, the firmware device's state
+	 * will be lost.
+	 *
+	 * For non-platform devices, a new callback would be required.
+	 *
+	 * If the aperture helpers ever need to handle native drivers, this call
+	 * would only have to unplug the DRM device, so that the hardware device
+	 * stays around after detachment.
+	 */
+	platform_device_unregister(pdev);
+}
+
+/**
+ * devm_acquire_aperture_of_platform_device - Acquires ownership of an aperture
+ *                                            on behalf of a platform device.
+ * @pdev:	the platform device to own the aperture
+ * @base:	the aperture's byte offset in physical memory
+ * @size:	the aperture size in bytes
+ *
+ * Installs the given device as the new owner of the aperture. The function
+ * expects the aperture to be provided by a platform device. If another
+ * driver takes over ownership of the aperture, aperture helpers will then
+ * unregister the platform device automatically. All acquired apertures are
+ * released automatically when the underlying device goes away.
+ *
+ * The function fails if the aperture, or parts of it, is currently
+ * owned by another device. To evict current owners, callers should use
+ * remove_conflicting_devices() et al. before calling this function.
+ *
+ * Returns:
+ * 0 on success, or a negative errno value otherwise.
+ */
+int devm_acquire_aperture_of_platform_device(struct platform_device *pdev,
+					     resource_size_t base,
+					     resource_size_t size)
+{
+	return devm_aperture_acquire(&pdev->dev, base, size, detach_platform_device);
+}
+EXPORT_SYMBOL(devm_acquire_aperture_of_platform_device);
+
+static void detach_devices(resource_size_t base, resource_size_t size)
+{
+	resource_size_t end = base + size;
+	struct list_head *pos, *n;
+
+	mutex_lock(&apertures_lock);
+
+	list_for_each_safe(pos, n, &apertures) {
+		struct dev_aperture *ap = container_of(pos, struct dev_aperture, lh);
+		struct device *dev = ap->dev;
+
+		if (WARN_ON_ONCE(!dev))
+			continue;
+
+		if (!overlap(base, end, ap->base, ap->base + ap->size))
+			continue;
+
+		ap->dev = NULL; /* detach from device */
+		list_del(&ap->lh);
+
+		ap->detach(dev);
+	}
+
+	mutex_unlock(&apertures_lock);
+}
+
+/**
+ * remove_conflicting_devices - remove devices in the given range
+ * @base: the aperture's base address in physical memory
+ * @size: aperture size in bytes
+ * @primary: also kick vga16fb if present; only relevant for VGA devices
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes devices that own apertures within @base and @size.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int remove_conflicting_devices(resource_size_t base, resource_size_t size, bool primary,
+			       const char *name)
+{
+#if IS_REACHABLE(CONFIG_FB)
+	struct apertures_struct *a;
+	int ret;
+
+	a = alloc_apertures(1);
+	if (!a)
+		return -ENOMEM;
+
+	a->ranges[0].base = base;
+	a->ranges[0].size = size;
+
+	ret = remove_conflicting_framebuffers(a, name, primary);
+	kfree(a);
+
+	if (ret)
+		return ret;
+#endif
+
+	detach_devices(base, size);
+
+	return 0;
+}
+EXPORT_SYMBOL(remove_conflicting_devices);
+
+/**
+ * remove_conflicting_pci_devices - remove existing framebuffers for PCI devices
+ * @pdev: PCI device
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes devices that own apertures within any of @pdev's
+ * memory bars. The function assumes that PCI device with shadowed ROM
+ * drives a primary display and therefore kicks out vga16fb as well.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
+{
+	resource_size_t base, size;
+	int bar, ret = 0;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		detach_devices(base, size);
+	}
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, name);
+#endif
+	if (ret == 0)
+		ret = vga_remove_vgacon(pdev);
+	return ret;
+}
+EXPORT_SYMBOL(remove_conflicting_pci_devices);
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 40c50fa2dd70..22cea5082ac4 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -10,6 +10,7 @@ config VGA_CONSOLE
 	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
 	default y
 	help
 	  Saying Y here will allow you to use Linux in text mode through a
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f2a6b81e45c4..cfc55273dc5d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -455,6 +455,7 @@ config FB_ATARI
 config FB_OF
 	bool "Open Firmware frame buffer device support"
 	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -527,6 +528,7 @@ config FB_IMSTT
 config FB_VGA16
 	tristate "VGA 16-color graphics support"
 	depends on FB && (X86 || PPC)
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -551,7 +553,7 @@ config FB_STI
 	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
 	  Enabling this option will implement the linux framebuffer device
 	  using calls to the STI BIOS routines for initialisation.
-	
+
 	  If you enable this option, you will get a planar framebuffer device
 	  /dev/fb which will work on the most common HP graphic cards of the
 	  NGLE family, including the artist chips (in the 7xx and Bxxx series),
@@ -617,6 +619,7 @@ config FB_UVESA
 config FB_VESA
 	bool "VESA VGA graphics support"
 	depends on (FB = y) && X86
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -630,6 +633,7 @@ config FB_VESA
 config FB_EFI
 	bool "EFI-based Framebuffer Support"
 	depends on (FB = y) && !IA64 && EFI
+	select APERTURE_HELPERS
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -2190,6 +2194,7 @@ config FB_SIMPLE
 	tristate "Simple framebuffer support"
 	depends on FB
 	depends on !DRM_SIMPLEDRM
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
new file mode 100644
index 000000000000..0a206cdce606
--- /dev/null
+++ b/include/linux/aperture.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _LINUX_APERTURE_H_
+#define _LINUX_APERTURE_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct platform_device;
+
+#if defined(CONFIG_APERTURE_HELPERS)
+int devm_acquire_aperture_of_platform_device(struct platform_device *pdev,
+					     resource_size_t base,
+					     resource_size_t size);
+
+int remove_conflicting_devices(resource_size_t base, resource_size_t size,
+			       bool primary, const char *name);
+
+int remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
+#else
+static inline int devm_acquire_aperture_of_platform_device(struct platform_device *pdev,
+							   resource_size_t base,
+							   resource_size_t size)
+{
+	return 0;
+}
+
+static inline int remove_conflicting_devices(resource_size_t base, resource_size_t size,
+					     bool primary, const char *name)
+{
+	return 0;
+}
+
+static inline int remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
+{
+	return 0;
+}
+#endif
+
+/**
+ * remove_all_conflicting_devices - remove all existing framebuffers
+ * @primary: also kick vga16fb if present; only relevant for VGA devices
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes all graphics device drivers. Use this function on systems
+ * that can have their framebuffer located anywhere in memory.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+static inline int remove_all_conflicting_devices(bool primary, const char *name)
+{
+	return remove_conflicting_devices(0, (resource_size_t)-1, primary, name);
+}
+
+#endif


