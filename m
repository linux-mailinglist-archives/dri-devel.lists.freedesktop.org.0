Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1753604FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FBA6E9FE;
	Thu, 15 Apr 2021 08:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665E6E9FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:53:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5FFEB1E6;
 Thu, 15 Apr 2021 08:53:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v3 3/9] drm/aperture: Add infrastructure for aperture ownership
Date: Thu, 15 Apr 2021 10:53:20 +0200
Message-Id: <20210415085326.8824-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415085326.8824-1-tzimmermann@suse.de>
References: <20210415085326.8824-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
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

v3:
	* rebase onto existing aperture infrastructure
	* release aperture from list during detach; fix dangling apertures
	* don't export struct drm_aperture
	* document struct drm_aperture_funcs
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/drm_aperture.c | 216 ++++++++++++++++++++++++++++++++-
 include/drm/drm_aperture.h     |  36 +++---
 2 files changed, 232 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index e034dd7f9b09..aeddf125d2b4 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -1,9 +1,17 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/device.h>
 #include <linux/fb.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/vgaarb.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: overview
@@ -62,8 +70,196 @@
  * framebuffer apertures automatically. Device drivers without knowledge of
  * the framebuffer's location shall call drm_aperture_remove_framebuffers(),
  * which removes all drivers for known framebuffer.
+ *
+ * Drivers that are susceptible to being removed by other drivers, such as
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
  */
 
+/*
+ * struct drm_aperture - Represents a DRM framebuffer aperture
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
+	if (detached)
+		return;
+
+	mutex_lock(&drm_apertures_lock);
+	list_del(&ap->lh);
+	mutex_unlock(&drm_apertures_lock);
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
+ * drm_aperture_remove_conflicting_framebuffers() et al. before calling this
+ * function. Acquired apertures are released automatically if the underlying
+ * device goes away.
+ *
+ * Returns:
+ * An instance of struct &drm_aperture on success, or a pointer-encoded
+ * errno value otherwise.
+ */
+int devm_aperture_acquire(struct drm_device *dev, resource_size_t base, resource_size_t size,
+			  const struct drm_aperture_funcs *funcs)
+{
+	size_t end = base + size;
+	struct list_head *pos;
+	struct drm_aperture *ap;
+
+	mutex_lock(&drm_apertures_lock);
+
+	list_for_each(pos, &drm_apertures) {
+		ap = container_of(pos, struct drm_aperture, lh);
+		if (overlap(base, end, ap->base, ap->base + ap->size))
+			return -EBUSY;
+	}
+
+	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap)
+		return -ENOMEM;
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
+	return devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
+}
+EXPORT_SYMBOL(devm_aperture_acquire);
+
+static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
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
+		if (WARN_ON_ONCE(!dev))
+			continue;
+
+		if (!overlap(base, end, ap->base, ap->base + ap->size))
+			continue;
+
+		ap->dev = NULL; /* detach from device */
+		list_del(&ap->lh);
+
+		if (drm_WARN_ON(dev, !ap->funcs->detach))
+			continue;
+		ap->funcs->detach(dev, ap->base, ap->size);
+	}
+
+	mutex_unlock(&drm_apertures_lock);
+}
+
 /**
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
  * @base: the aperture's base address in physical memory
@@ -94,10 +290,13 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 	ret = remove_conflicting_framebuffers(a, name, primary);
 	kfree(a);
 
-	return ret;
-#else
-	return 0;
+	if (ret)
+		return ret;
 #endif
+
+	drm_aperture_detach_drivers(base, size);
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
@@ -115,7 +314,16 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  */
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
 {
-	int ret = 0;
+	resource_size_t base, size;
+	int bar, ret = 0;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		drm_aperture_detach_drivers(base, size);
+	}
 
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 23cc01647ed3..19743240fac3 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -5,27 +5,31 @@
 
 #include <linux/types.h>
 
+struct drm_device;
 struct pci_dev;
 
+/**
+ * drm_aperture_funcs - Callback functions for aperture ownership
+ */
+struct drm_aperture_funcs {
+	/**
+	 * @detach:
+	 *
+	 * Informs the aperture owner to detach itself from the memory range. Called
+	 * when another driver requrests ownership. The driver should release itself
+	 * from the device and maybe unregister the device itself.
+	 *
+	 * See drm_dev_unplug().
+	 */
+	void (*detach)(struct drm_device *dev, resource_size_t base, resource_size_t size);
+};
+
+int devm_aperture_acquire(struct drm_device *dev, resource_size_t base, resource_size_t size,
+			  const struct drm_aperture_funcs *funcs);
+
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const char *name);
 
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name);
 
-/**
- * drm_aperture_remove_framebuffers - remove all existing framebuffers
- * @primary: also kick vga16fb if present
- * @name: requesting driver name
- *
- * This function removes all graphics device drivers. Use this function on systems
- * that can have their framebuffer located anywhere in memory.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise
- */
-static inline int drm_aperture_remove_framebuffers(bool primary, const char *name)
-{
-	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary, name);
-}
-
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
