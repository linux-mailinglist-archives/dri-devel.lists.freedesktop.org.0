Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EDF2C9FD4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFF76E52F;
	Tue,  1 Dec 2020 10:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3786E8A1;
 Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B583BAD3F;
 Tue,  1 Dec 2020 10:36:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 17/20] drm/vboxvideo: Remove references to struct
 drm_device.pdev
Date: Tue,  1 Dec 2020 11:35:39 +0100
Message-Id: <20201201103542.2182-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert vboxvideo to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c  | 11 ++++++-----
 drivers/gpu/drm/vboxvideo/vbox_irq.c  |  4 +++-
 drivers/gpu/drm/vboxvideo/vbox_main.c |  8 ++++++--
 drivers/gpu/drm/vboxvideo/vbox_ttm.c  |  7 ++++---
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index f3eac72cb46e..e534896b6cfd 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -51,7 +51,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(vbox))
 		return PTR_ERR(vbox);
 
-	vbox->ddev.pdev = pdev;
 	pci_set_drvdata(pdev, vbox);
 	mutex_init(&vbox->hw_mutex);
 
@@ -109,15 +108,16 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 static int vbox_pm_suspend(struct device *dev)
 {
 	struct vbox_private *vbox = dev_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
 	int error;
 
 	error = drm_mode_config_helper_suspend(&vbox->ddev);
 	if (error)
 		return error;
 
-	pci_save_state(vbox->ddev.pdev);
-	pci_disable_device(vbox->ddev.pdev);
-	pci_set_power_state(vbox->ddev.pdev, PCI_D3hot);
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
 
 	return 0;
 }
@@ -125,8 +125,9 @@ static int vbox_pm_suspend(struct device *dev)
 static int vbox_pm_resume(struct device *dev)
 {
 	struct vbox_private *vbox = dev_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (pci_enable_device(vbox->ddev.pdev))
+	if (pci_enable_device(pdev))
 		return -EIO;
 
 	return drm_mode_config_helper_resume(&vbox->ddev);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
index 631657fa554f..b3ded68603ba 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
@@ -170,10 +170,12 @@ static void vbox_hotplug_worker(struct work_struct *work)
 
 int vbox_irq_init(struct vbox_private *vbox)
 {
+	struct pci_dev *pdev = to_pci_dev(vbox->ddev.dev);
+
 	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
 	vbox_update_mode_hints(vbox);
 
-	return drm_irq_install(&vbox->ddev, vbox->ddev.pdev->irq);
+	return drm_irq_install(&vbox->ddev, pdev->irq);
 }
 
 void vbox_irq_fini(struct vbox_private *vbox)
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index d68d9bad7674..f28779715ccd 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -8,7 +8,9 @@
  *          Hans de Goede <hdegoede@redhat.com>
  */
 
+#include <linux/pci.h>
 #include <linux/vbox_err.h>
+
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
@@ -30,6 +32,7 @@ void vbox_report_caps(struct vbox_private *vbox)
 
 static int vbox_accel_init(struct vbox_private *vbox)
 {
+	struct pci_dev *pdev = to_pci_dev(vbox->ddev.dev);
 	struct vbva_buffer *vbva;
 	unsigned int i;
 
@@ -41,7 +44,7 @@ static int vbox_accel_init(struct vbox_private *vbox)
 	/* Take a command buffer for each screen from the end of usable VRAM. */
 	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
 
-	vbox->vbva_buffers = pci_iomap_range(vbox->ddev.pdev, 0,
+	vbox->vbva_buffers = pci_iomap_range(pdev, 0,
 					     vbox->available_vram_size,
 					     vbox->num_crtcs *
 					     VBVA_MIN_BUFFER_SIZE);
@@ -106,6 +109,7 @@ bool vbox_check_supported(u16 id)
 
 int vbox_hw_init(struct vbox_private *vbox)
 {
+	struct pci_dev *pdev = to_pci_dev(vbox->ddev.dev);
 	int ret = -ENOMEM;
 
 	vbox->full_vram_size = inl(VBE_DISPI_IOPORT_DATA);
@@ -115,7 +119,7 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	/* Map guest-heap at end of vram */
 	vbox->guest_heap =
-	    pci_iomap_range(vbox->ddev.pdev, 0, GUEST_HEAP_OFFSET(vbox),
+	    pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
 			    GUEST_HEAP_SIZE);
 	if (!vbox->guest_heap)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index f5a06675da43..0066a3c1dfc9 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -15,8 +15,9 @@ int vbox_mm_init(struct vbox_private *vbox)
 	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = &vbox->ddev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
 				       vbox->available_vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
@@ -24,8 +25,8 @@ int vbox_mm_init(struct vbox_private *vbox)
 		return ret;
 	}
 
-	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
-					 pci_resource_len(dev->pdev, 0));
+	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(pdev, 0),
+					 pci_resource_len(pdev, 0));
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
