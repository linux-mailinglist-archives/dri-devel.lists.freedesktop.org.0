Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1C2FA0F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 14:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23966E20E;
	Mon, 18 Jan 2021 13:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFE789994;
 Mon, 18 Jan 2021 13:14:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7985B992;
 Mon, 18 Jan 2021 13:14:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, sroland@vmware.com, zackr@vmware.com
Subject: [PATCH v4 1/6] drm: Upcast struct drm_device.dev to struct pci_device;
 replace pdev
Date: Mon, 18 Jan 2021 14:14:15 +0100
Message-Id: <20210118131420.15874-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118131420.15874-1-tzimmermann@suse.de>
References: <20210118131420.15874-1-tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Lavr <andy.lavr@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have DRM drivers based on USB, SPI and platform devices. All of them
are fine with storing their device reference in struct drm_device.dev.
PCI devices should be no exception. Therefore struct drm_device.pdev is
deprecated.

Instead upcast from struct drm_device.dev with to_pci_dev(). PCI-specific
code can use dev_is_pci() to test for a PCI device. This patch changes
the DRM core code and documentation accordingly.

v4:
	* split-off pdev deprecation into separate patch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Andy Lavr <andy.lavr@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_agpsupport.c |  9 ++++++---
 drivers/gpu/drm/drm_bufs.c       |  4 ++--
 drivers/gpu/drm/drm_edid.c       |  7 ++++++-
 drivers/gpu/drm/drm_irq.c        | 12 +++++++-----
 drivers/gpu/drm/drm_pci.c        | 26 +++++++++++++++-----------
 drivers/gpu/drm/drm_vm.c         |  2 +-
 6 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 8b690ef306de..7e765cb0efee 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -103,11 +103,13 @@ int drm_agp_info_ioctl(struct drm_device *dev, void *data,
  */
 int drm_agp_acquire(struct drm_device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
 	if (!dev->agp)
 		return -ENODEV;
 	if (dev->agp->acquired)
 		return -EBUSY;
-	dev->agp->bridge = agp_backend_acquire(dev->pdev);
+	dev->agp->bridge = agp_backend_acquire(pdev);
 	if (!dev->agp->bridge)
 		return -ENODEV;
 	dev->agp->acquired = 1;
@@ -402,14 +404,15 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
  */
 struct drm_agp_head *drm_agp_init(struct drm_device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_agp_head *head = NULL;
 
 	head = kzalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
 		return NULL;
-	head->bridge = agp_find_bridge(dev->pdev);
+	head->bridge = agp_find_bridge(pdev);
 	if (!head->bridge) {
-		head->bridge = agp_backend_acquire(dev->pdev);
+		head->bridge = agp_backend_acquire(pdev);
 		if (!head->bridge) {
 			kfree(head);
 			return NULL;
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index aeb1327e3077..e3d77dfefb0a 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -326,7 +326,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		 * As we're limiting the address to 2^32-1 (or less),
 		 * casting it down to 32 bits is no problem, but we
 		 * need to point to a 64bit variable first. */
-		map->handle = dma_alloc_coherent(&dev->pdev->dev,
+		map->handle = dma_alloc_coherent(dev->dev,
 						 map->size,
 						 &map->offset,
 						 GFP_KERNEL);
@@ -556,7 +556,7 @@ int drm_legacy_rmmap_locked(struct drm_device *dev, struct drm_local_map *map)
 	case _DRM_SCATTER_GATHER:
 		break;
 	case _DRM_CONSISTENT:
-		dma_free_coherent(&dev->pdev->dev,
+		dma_free_coherent(dev->dev,
 				  map->size,
 				  map->handle,
 				  map->offset);
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 394cc55b3214..c2bbe7bee7b6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
@@ -2075,9 +2076,13 @@ EXPORT_SYMBOL(drm_get_edid);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter)
 {
-	struct pci_dev *pdev = connector->dev->pdev;
+	struct drm_device *dev = connector->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct edid *edid;
 
+	if (drm_WARN_ON_ONCE(dev, !dev_is_pci(dev->dev)))
+		return NULL;
+
 	vga_switcheroo_lock_ddc(pdev);
 	edid = drm_get_edid(connector, adapter);
 	vga_switcheroo_unlock_ddc(pdev);
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 803af4bbd214..c3bd664ea733 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -122,7 +122,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
 		dev->driver->irq_preinstall(dev);
 
 	/* PCI devices require shared interrupts. */
-	if (dev->pdev)
+	if (dev_is_pci(dev->dev))
 		sh_flags = IRQF_SHARED;
 
 	ret = request_irq(irq, dev->driver->irq_handler,
@@ -140,7 +140,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0) {
 		dev->irq_enabled = false;
 		if (drm_core_check_feature(dev, DRIVER_LEGACY))
-			vga_client_register(dev->pdev, NULL, NULL, NULL);
+			vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
 		free_irq(irq, dev);
 	} else {
 		dev->irq = irq;
@@ -203,7 +203,7 @@ int drm_irq_uninstall(struct drm_device *dev)
 	DRM_DEBUG("irq=%d\n", dev->irq);
 
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		vga_client_register(dev->pdev, NULL, NULL, NULL);
+		vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
 
 	if (dev->driver->irq_uninstall)
 		dev->driver->irq_uninstall(dev);
@@ -252,6 +252,7 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 {
 	struct drm_control *ctl = data;
 	int ret = 0, irq;
+	struct pci_dev *pdev;
 
 	/* if we haven't irq we fallback for compatibility reasons -
 	 * this used to be a separate function in drm_dma.h
@@ -262,12 +263,13 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 		return 0;
 	/* UMS was only ever supported on pci devices. */
-	if (WARN_ON(!dev->pdev))
+	if (WARN_ON(!dev_is_pci(dev->dev)))
 		return -EINVAL;
 
 	switch (ctl->func) {
 	case DRM_INST_HANDLER:
-		irq = dev->pdev->irq;
+		pdev = to_pci_dev(dev->dev);
+		irq = pdev->irq;
 
 		if (dev->if_version < DRM_IF_VERSION(1, 2) &&
 		    ctl->irq != irq)
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 5370e6b492fd..2294a1580d35 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -70,7 +70,7 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
 		return NULL;
 
 	dmah->size = size;
-	dmah->vaddr = dma_alloc_coherent(&dev->pdev->dev, size,
+	dmah->vaddr = dma_alloc_coherent(dev->dev, size,
 					 &dmah->busaddr,
 					 GFP_KERNEL);
 
@@ -93,7 +93,7 @@ EXPORT_SYMBOL(drm_pci_alloc);
  */
 void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
 {
-	dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
+	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr,
 			  dmah->busaddr);
 	kfree(dmah);
 }
@@ -112,16 +112,18 @@ static int drm_get_pci_domain(struct drm_device *dev)
 		return 0;
 #endif /* __alpha__ */
 
-	return pci_domain_nr(dev->pdev->bus);
+	return pci_domain_nr(to_pci_dev(dev->dev)->bus);
 }
 
 int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
 	master->unique = kasprintf(GFP_KERNEL, "pci:%04x:%02x:%02x.%d",
 					drm_get_pci_domain(dev),
-					dev->pdev->bus->number,
-					PCI_SLOT(dev->pdev->devfn),
-					PCI_FUNC(dev->pdev->devfn));
+					pdev->bus->number,
+					PCI_SLOT(pdev->devfn),
+					PCI_FUNC(pdev->devfn));
 	if (!master->unique)
 		return -ENOMEM;
 
@@ -131,12 +133,14 @@ int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
 
 static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
 	if ((p->busnum >> 8) != drm_get_pci_domain(dev) ||
-	    (p->busnum & 0xff) != dev->pdev->bus->number ||
-	    p->devnum != PCI_SLOT(dev->pdev->devfn) || p->funcnum != PCI_FUNC(dev->pdev->devfn))
+	    (p->busnum & 0xff) != pdev->bus->number ||
+	    p->devnum != PCI_SLOT(pdev->devfn) || p->funcnum != PCI_FUNC(pdev->devfn))
 		return -EINVAL;
 
-	p->irq = dev->pdev->irq;
+	p->irq = pdev->irq;
 
 	DRM_DEBUG("%d:%d:%d => IRQ %d\n", p->busnum, p->devnum, p->funcnum,
 		  p->irq);
@@ -164,7 +168,7 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 		return -EOPNOTSUPP;
 
 	/* UMS was only ever support on PCI devices. */
-	if (WARN_ON(!dev->pdev))
+	if (WARN_ON(!dev_is_pci(dev->dev)))
 		return -EINVAL;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
@@ -188,7 +192,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
 static void drm_pci_agp_init(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
-		if (pci_find_capability(dev->pdev, PCI_CAP_ID_AGP))
+		if (pci_find_capability(to_pci_dev(dev->dev), PCI_CAP_ID_AGP))
 			dev->agp = drm_agp_init(dev);
 		if (dev->agp) {
 			dev->agp->agp_mtrr = arch_phys_wc_add(
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 6d5a03b32238..9b3b989d7cad 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -278,7 +278,7 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
 			case _DRM_SCATTER_GATHER:
 				break;
 			case _DRM_CONSISTENT:
-				dma_free_coherent(&dev->pdev->dev,
+				dma_free_coherent(dev->dev,
 						  map->size,
 						  map->handle,
 						  map->offset);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
