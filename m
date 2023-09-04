Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C1791DE6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 21:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86210E3E4;
	Mon,  4 Sep 2023 19:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-227.mta1.migadu.com (out-227.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43010E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 19:57:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693857458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcmG12mmWiMHQssRNKwGSMzorFeF7+pAcaQIVBtY3KU=;
 b=Umc5L5nksLtIUADB5XoXaVOKwwgwfgU/GIOj+4XCQLNTz0mvoFjDIp/jmf3nc7NzaoqPb2
 n2s7xkPFZx919FUwVXLGsNjMQi7OOnbsmlJ9JX9QRgvBM1COB7+xNpO8kgn51VOj6kbWzL
 GXfNbDGpzPsfxMmC33vtxKIDur1mSdA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [RFC, drm-misc-next v4 1/9] PCI/VGA: Allowing the user to select the
 primary video adapter at boot time
Date: Tue,  5 Sep 2023 03:57:16 +0800
Message-Id: <20230904195724.633404-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

On a machine with multiple GPUs, a Linux user has no control over which
one is primary at boot time. This series tries to solve above mentioned
problem by introduced the ->be_primary() function stub. The specific
device drivers can provide an implementation to hook up with this stub by
calling the vga_client_register() function.

Once the driver bound the device successfully, VGAARB will call back to
the device driver. To query if the device drivers want to be primary or
not. Device drivers can just pass NULL if have no such needs.

Acked-by: Jani Nikula <jani.nikula@intel.com> # i915
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c   |  3 +-
 drivers/gpu/drm/loongson/lsdc_drv.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
 drivers/pci/vgaarb.c                       | 43 +++++++++++++++++++---
 drivers/vfio/pci/vfio_pci_core.c           |  2 +-
 include/linux/vgaarb.h                     |  8 ++--
 8 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e77f048c99d8..ecc4564ceac0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3916,7 +3916,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * ignore it
 	 */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
+		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
 
 	px = amdgpu_device_supports_px(ddev);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 286a0bdd28c6..98d7d4dffe9f 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -115,7 +115,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 
 int intel_vga_register(struct drm_i915_private *i915)
 {
-
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int ret;
 
@@ -127,7 +126,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 	 * then we do not take part in VGA arbitration and the
 	 * vga_client_register() fails with -ENODEV.
 	 */
-	ret = vga_client_register(pdev, intel_vga_set_decode);
+	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
 	if (ret && ret != -ENODEV)
 		return ret;
 
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 188ec82afcfb..d10a28c2c494 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -289,7 +289,7 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, ddev);
 
-	vga_client_register(pdev, lsdc_vga_set_decode);
+	vga_client_register(pdev, lsdc_vga_set_decode, NULL);
 
 	drm_kms_helper_poll_init(ddev);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index f8bf0ec26844..162b4f4676c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -92,7 +92,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 		return;
 	pdev = to_pci_dev(dev->dev);
 
-	vga_client_register(pdev, nouveau_vga_set_decode);
+	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
 
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
 	if (pci_is_thunderbolt_attached(pdev))
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..71f2ff39d6a1 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1425,7 +1425,7 @@ int radeon_device_init(struct radeon_device *rdev,
 	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
-	vga_client_register(rdev->pdev, radeon_vga_set_decode);
+	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..552ac7df10ee 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -53,6 +53,7 @@ struct vga_device {
 	bool bridge_has_one_vga;
 	bool is_firmware_default;	/* device selected by firmware */
 	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
+	bool (*be_primary)(struct pci_dev *pdev);
 };
 
 static LIST_HEAD(vga_list);
@@ -956,6 +957,10 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
+ * @be_primary callback: Callback to the device driver, query if a device
+ * want to be the primary display. This callback is optional, device drivers
+ * who have no special needs can simply pass a NULL.
+ *
  * Rationale: we cannot disable VGA decode resources unconditionally some single
  * GPU laptops seem to require ACPI or BIOS access to the VGA registers to
  * control things like backlights etc.  Hopefully newer multi-GPU laptops do
@@ -971,7 +976,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * Returns: 0 on success, -1 on failure
  */
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
+		bool (*be_primary)(struct pci_dev *pdev))
 {
 	int ret = -ENODEV;
 	struct vga_device *vgadev;
@@ -983,6 +989,7 @@ int vga_client_register(struct pci_dev *pdev,
 		goto bail;
 
 	vgadev->set_decode = set_decode;
+	vgadev->be_primary = be_primary;
 	ret = 0;
 
 bail:
@@ -1493,6 +1500,21 @@ static void vga_arbiter_notify_clients(void)
 	spin_unlock_irqrestore(&vga_lock, flags);
 }
 
+static void vga_arbiter_do_arbitration(struct pci_dev *pdev)
+{
+	struct vga_device *vgadev;
+
+	if (pdev == vga_default_device())
+		return;
+
+	vgadev = vgadev_find(pdev);
+	if (vgadev && vgadev->be_primary && vgadev->be_primary(pdev)) {
+		vga_set_default_device(pdev);
+
+		vgaarb_info(&pdev->dev, "Override as primary by driver\n");
+	}
+}
+
 static int pci_notify(struct notifier_block *nb, unsigned long action,
 		      void *data)
 {
@@ -1505,13 +1527,24 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 	/* For now we're only intereted in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
 	 * cases of hotplugable vga cards. */
-	if (action == BUS_NOTIFY_ADD_DEVICE)
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
 		notify = vga_arbiter_add_pci_device(pdev);
-	else if (action == BUS_NOTIFY_DEL_DEVICE)
+		if (notify)
+			vga_arbiter_notify_clients();
+		break;
+	case BUS_NOTIFY_DEL_DEVICE:
 		notify = vga_arbiter_del_pci_device(pdev);
+		if (notify)
+			vga_arbiter_notify_clients();
+		break;
+	case BUS_NOTIFY_BOUND_DRIVER:
+		vga_arbiter_do_arbitration(pdev);
+		break;
+	default:
+		break;
+	}
 
-	if (notify)
-		vga_arbiter_notify_clients();
 	return 0;
 }
 
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 20d7b69ea6ff..531c4d8ef26e 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2108,7 +2108,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
 	if (ret)
 		return ret;
 
-	ret = vga_client_register(pdev, vfio_pci_set_decode);
+	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
 	if (ret)
 		return ret;
 	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index b4b9137f9792..291d82b9f05a 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -52,7 +52,8 @@ struct pci_dev *vga_default_device(void);
 void vga_set_default_device(struct pci_dev *pdev);
 int vga_remove_vgacon(struct pci_dev *pdev);
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*be_primary)(struct pci_dev *pdev));
 #else /* CONFIG_VGA_ARB */
 static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
 		unsigned int decodes)
@@ -78,7 +79,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
 	return 0;
 }
 static inline int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*be_primary)(struct pci_dev *pdev))
 {
 	return 0;
 }
@@ -116,7 +118,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 
 static inline void vga_client_unregister(struct pci_dev *pdev)
 {
-	vga_client_register(pdev, NULL);
+	vga_client_register(pdev, NULL, NULL);
 }
 
 #endif /* LINUX_VGA_H */
-- 
2.34.1

