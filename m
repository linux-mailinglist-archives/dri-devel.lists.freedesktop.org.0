Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C314534033C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383A06E8C9;
	Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD36E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:29:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06556AC75;
 Thu, 18 Mar 2021 10:29:27 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net
Subject: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Date: Thu, 18 Mar 2021 11:29:15 +0100
Message-Id: <20210318102921.21536-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform devices might operate on firmware framebuffers, such as VESA or
EFI. Before a native driver for the graphics hardware can take over the
device, it has to remove any platform driver that operates on the firmware
framebuffer. Aperture helpers provide the infrastructure for platform
drivers to acquire firmware framebuffers, and for native drivers to remove
them later on.

It works similar to the related fbdev mechanism. During initialization, the
platform driver acquires the firmware framebuffer's I/O memory and provides
a callback to be removed. The native driver later uses this information to
remove any platform driver for it's framebuffer I/O memory.

The aperture removal code is integrated into the existing code for removing
conflicting framebuffers, so native drivers use it automatically.

v2:
	* rename plaform helpers to aperture helpers
	* tie to device lifetime with devm_ functions
	* removed unsued remove() callback
	* rename kickout to detach
	* make struct drm_aperture private
	* rebase onto existing drm_aperture.h header file
	* use MIT license only for simplicity
	* documentation

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 Documentation/gpu/drm-internals.rst |   6 +
 drivers/gpu/drm/Kconfig             |   7 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/drm_aperture.c      | 287 ++++++++++++++++++++++++++++
 include/drm/drm_aperture.h          |  38 +++-
 5 files changed, 338 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_aperture.c

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 4c7642d2ca34..06af044c882f 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -78,9 +78,15 @@ DRM_IOCTL_VERSION ioctl.
 Managing Ownership of the Framebuffer Aperture
 ----------------------------------------------
 
+.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
+   :doc: overview
+
 .. kernel-doc:: include/drm/drm_aperture.h
    :internal:
 
+.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
+   :export:
+
 Device Instance and Driver Handling
 -----------------------------------
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1461652921be..b9d3fb91d22d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -221,6 +221,13 @@ config DRM_SCHED
 	tristate
 	depends on DRM
 
+config DRM_APERTURE
+	bool
+	depends on DRM
+	help
+	  Controls ownership of graphics apertures. Required to
+	  synchronize with firmware-based drivers.
+
 source "drivers/gpu/drm/i2c/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5eb5bf7c16e3..c9ecb02df0f3 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
+drm-$(CONFIG_DRM_APERTURE) += drm_aperture.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
new file mode 100644
index 000000000000..4b02b5fed0a1
--- /dev/null
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+/**
+ * DOC: overview
+ *
+ * A graphics device might be supported by different drivers, but only one
+ * driver can be active at any given time. Many systems load a generic
+ * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
+ * During later boot stages, they replace the generic driver with a dedicated,
+ * hardware-specific driver. To take over the device the dedicated driver
+ * first has to remove the generic driver. DRM aperture functions manage
+ * ownership of DRM framebuffer memory and hand-over between drivers.
+ *
+ * DRM drivers should call drm_fb_helper_remove_conflicting_framebuffers()
+ * at the top of their probe function. The function removes any generic
+ * driver that is currently associated with the given framebuffer memory.
+ * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
+ * example given below.
+ *
+ * .. code-block:: c
+ *
+ *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
+ *	{
+ *		struct apertures_struct *ap;
+ *		bool primary = false;
+ *		int ret;
+ *
+ *		ap = alloc_apertures(1);
+ *		if (!ap)
+ *			return -ENOMEM;
+ *
+ *		ap->ranges[0].base = pci_resource_start(pdev, 0);
+ *		ap->ranges[0].size = pci_resource_len(pdev, 0);
+ *
+ *	#ifdef CONFIG_X86
+ *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
+ *	#endif
+ *		ret = drm_fb_helper_remove_conflicting_framebuffers(ap, "example driver", primary);
+ *		kfree(ap);
+ *
+ *		return ret;
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
+ * For PCI devices it is often sufficient to use drm_fb_helper_remove_conflicting_pci_framebuffers()
+ * and let it detect the framebuffer apertures automatically.
+ *
+ * .. code-block:: c
+ *
+ *	static int probe(struct pci_dev *pdev)
+ *	{
+ *		int ret;
+ *
+ *		// Remove any generic drivers...
+ *		ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "example driver");
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
+ * Drivers that are susceptible to being removed be other drivers, such as
+ * generic EFI or VESA drivers, have to register themselves as owners of their
+ * given framebuffer memory. Ownership of the framebuffer memory is achived
+ * by calling devm_aperture_acquire(). On success, the driver is the owner
+ * of the framebuffer range. The function fails if the framebuffer is already
+ * by another driver. See below for an example.
+ *
+ * .. code-block:: c
+ *
+ *	static struct drm_aperture_funcs ap_funcs = {
+ *		.detach = ...
+ *	};
+ *
+ *	static int acquire_framebuffers(struct drm_device *dev, struct pci_dev *pdev)
+ *	{
+ *		resource_size_t start, len;
+ *		struct drm_aperture *ap;
+ *
+ *		base = pci_resource_start(pdev, 0);
+ *		size = pci_resource_len(pdev, 0);
+ *
+ *		ap = devm_acquire_aperture(dev, base, size, &ap_funcs);
+ *		if (IS_ERR(ap))
+ *			return PTR_ERR(ap);
+ *
+ *		return 0;
+ *	}
+ *
+ *	static int probe(struct pci_dev *pdev)
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
+ *		drm_dev_register();
+ *
+ *		return 0;
+ *	}
+ *
+ * The generic driver is now subject to forced removal by other drivers. This
+ * is when the detach function in struct &drm_aperture_funcs comes into play.
+ * When a driver calls drm_fb_helper_remove_conflicting_framebuffers() et al
+ * for the registered framebuffer range, the DRM core calls struct
+ * &drm_aperture_funcs.detach and the generic driver has to onload itself. It
+ * may not access the device's registers, framebuffer memory, ROM, etc after
+ * detach returned. If the driver supports hotplugging, detach can be treated
+ * like an unplug event.
+ *
+ * .. code-block:: c
+ *
+ *	static void detach_from_device(struct drm_device *dev,
+ *				       resource_size_t base,
+ *				       resource_size_t size)
+ *	{
+ *		// Signal unplug
+ *		drm_dev_unplug(dev);
+ *
+ *		// Maybe do other clean-up operations
+ *		...
+ *	}
+ *
+ *	static struct drm_aperture_funcs ap_funcs = {
+ *		.detach = detach_from_device,
+ *	};
+ */
+
+/**
+ * struct drm_aperture - Represents a DRM framebuffer aperture
+ *
+ * This structure has no public fields.
+ */
+struct drm_aperture {
+	struct drm_device *dev;
+	resource_size_t base;
+	resource_size_t size;
+
+	const struct drm_aperture_funcs *funcs;
+
+	struct list_head lh;
+};
+
+static LIST_HEAD(drm_apertures);
+
+static DEFINE_MUTEX(drm_apertures_lock);
+
+static bool overlap(resource_size_t base1, resource_size_t end1,
+		    resource_size_t base2, resource_size_t end2)
+{
+	return (base1 < end2) && (end1 > base2);
+}
+
+static void devm_aperture_acquire_release(void *data)
+{
+	struct drm_aperture *ap = data;
+	bool detached = !ap->dev;
+
+	if (!detached)
+		mutex_lock(&drm_apertures_lock);
+
+	list_del(&ap->lh);
+
+	if (!detached)
+		mutex_unlock(&drm_apertures_lock);
+}
+
+/**
+ * devm_aperture_acquire - Acquires ownership of a framebuffer on behalf of a DRM driver.
+ * @dev:	the DRM device to own the framebuffer memory
+ * @base:	the framebuffer's byte offset in physical memory
+ * @size:	the framebuffer size in bytes
+ * @funcs:	callback functions
+ *
+ * Installs the given device as the new owner. The function fails if the
+ * framebuffer range, or parts of it, is currently owned by another driver.
+ * To evict current owners, callers should use
+ * drm_fb_helper_remove_conflicting_framebuffers() et al. before calling this
+ * function. Acquired apertures are released automatically if the underlying
+ * device goes away.
+ *
+ * Returns:
+ * An instance of struct &drm_aperture on success, or a pointer-encoded
+ * errno value otherwise.
+ */
+struct drm_aperture *
+devm_aperture_acquire(struct drm_device *dev,
+		      resource_size_t base, resource_size_t size,
+		      const struct drm_aperture_funcs *funcs)
+{
+	size_t end = base + size;
+	struct list_head *pos;
+	struct drm_aperture *ap;
+	int ret;
+
+	mutex_lock(&drm_apertures_lock);
+
+	list_for_each(pos, &drm_apertures) {
+		ap = container_of(pos, struct drm_aperture, lh);
+		if (overlap(base, end, ap->base, ap->base + ap->size))
+			return ERR_PTR(-EBUSY);
+	}
+
+	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap)
+		return ERR_PTR(-ENOMEM);
+
+	ap->dev = dev;
+	ap->base = base;
+	ap->size = size;
+	ap->funcs = funcs;
+	INIT_LIST_HEAD(&ap->lh);
+
+	list_add(&ap->lh, &drm_apertures);
+
+	mutex_unlock(&drm_apertures_lock);
+
+	ret = devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return ap;
+}
+EXPORT_SYMBOL(devm_aperture_acquire);
+
+void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
+{
+	resource_size_t end = base + size;
+	struct list_head *pos, *n;
+
+	mutex_lock(&drm_apertures_lock);
+
+	list_for_each_safe(pos, n, &drm_apertures) {
+		struct drm_aperture *ap =
+			container_of(pos, struct drm_aperture, lh);
+		struct drm_device *dev = ap->dev;
+
+		if (!overlap(base, end, ap->base, ap->base + ap->size))
+			continue;
+
+		ap->dev = NULL; /* detach from device */
+		if (drm_WARN_ON(dev, !ap->funcs->detach))
+			continue;
+		ap->funcs->detach(dev, ap->base, ap->size);
+	}
+
+	mutex_unlock(&drm_apertures_lock);
+}
+EXPORT_SYMBOL(drm_aperture_detach_drivers);
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 13766efe9517..696cec75ef78 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -4,8 +4,30 @@
 #define _DRM_APERTURE_H_
 
 #include <linux/fb.h>
+#include <linux/pci.h>
 #include <linux/vgaarb.h>
 
+struct drm_aperture;
+struct drm_device;
+
+struct drm_aperture_funcs {
+	void (*detach)(struct drm_device *dev, resource_size_t base, resource_size_t size);
+};
+
+struct drm_aperture *
+devm_aperture_acquire(struct drm_device *dev,
+		      resource_size_t base, resource_size_t size,
+		      const struct drm_aperture_funcs *funcs);
+
+#if defined(CONFIG_DRM_APERTURE)
+void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size);
+#else
+static inline void
+drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
+{
+}
+#endif
+
 /**
  * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
  * @a: memory range, users of which are to be removed
@@ -20,6 +42,11 @@ static inline int
 drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
 					      const char *name, bool primary)
 {
+	int i;
+
+	for (i = 0; i < a->count; ++i)
+		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
+
 #if IS_REACHABLE(CONFIG_FB)
 	return remove_conflicting_framebuffers(a, name, primary);
 #else
@@ -43,7 +70,16 @@ static inline int
 drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						  const char *name)
 {
-	int ret = 0;
+	resource_size_t base, size;
+	int bar, ret = 0;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		drm_aperture_detach_drivers(base, size);
+	}
 
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
