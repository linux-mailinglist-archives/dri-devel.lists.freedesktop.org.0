Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAD721A13
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE53010E0FD;
	Sun,  4 Jun 2023 20:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id D161610E0E6;
 Sun,  4 Jun 2023 20:58:40 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:47878.118806016
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B96AD10029F;
 Mon,  5 Jun 2023 04:58:36 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 b5b118ae41ab49e0a154bdb74caa128c for alexander.deucher@amd.com; 
 Mon, 05 Jun 2023 04:58:39 CST
X-Transaction-ID: b5b118ae41ab49e0a154bdb74caa128c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Li Yi <liyi@loongson.cn>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Abhishek Sahu <abhsahu@nvidia.com>,
 Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v2 2/2] vgaarb: introduce is_boot_device callback function to
 vga_client_register
Date: Mon,  5 Jun 2023 04:58:31 +0800
Message-Id: <20230604205831.3357596-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230604205831.3357596-1-15330273260@189.cn>
References: <20230604205831.3357596-1-15330273260@189.cn>
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The vga_is_firmware_default() function is arch-dependent, which dosen't
sound right. At least, It also works on Mips and LoongArch platform with
the drm/AMDGPU and drm/radeon driver. However, it's difficult to enumerate
all Arch-driver combination. I'm wrong if there are only one exception.

With the observation that device drivers typically has better knowledge
about which PCI bar contains the firmware framebuffer, Which could helps
to avoids the need to iterate all of the PCI BARs. But As a PCI core
function at pci/vgaarb.c, vga_is_firmware_default funciton is embarrasing
to make optimization for a specific device.

There also has PCI display controller don't has a dedicated VRAM bar in
the world, this function will lost the effectiveness on such a case.

Luckily, device driver can do the accurate workaround. We add a callback
then, to let the device driver make the decision. Device drivers know what
archs it could works, device driver also can shipping this decision to
whatever arch its device can reach, not only the X86 and IA64.

Also honor the comment: "Clients have two callback mechanisms they can use"

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c   |  3 +--
 drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
 drivers/pci/vgaarb.c                       | 22 ++++++++++++++++++----
 drivers/vfio/pci/vfio_pci_core.c           |  2 +-
 include/linux/vgaarb.h                     |  8 +++++---
 7 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5c7d40873ee2..7a096f2d5c16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3960,7 +3960,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
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
index e40e6e5e5f03..4576c4197551 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -53,6 +53,7 @@ struct vga_device {
 	bool bridge_has_one_vga;
 	bool is_firmware_default;	/* device selected by firmware */
 	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
+	bool (*is_boot_device)(struct pci_dev *pdev);
 };
 
 static LIST_HEAD(vga_list);
@@ -615,10 +616,17 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	if (boot_vga && boot_vga->is_firmware_default)
 		return false;
 
-	if (vga_is_firmware_default(pdev)) {
-		vgadev->is_firmware_default = true;
+	/*
+	 * Ask the device driver first, if registered. Fallback to the
+	 * default implement if the callback is non-exist.
+	 */
+	if (vgadev->is_boot_device)
+		vgadev->is_firmware_default = vgadev->is_boot_device(pdev);
+	else
+		vgadev->is_firmware_default = vga_is_firmware_default(pdev);
+
+	if (vgadev->is_firmware_default)
 		return true;
-	}
 
 	/*
 	 * A legacy VGA device has MEM and IO enabled and any bridges
@@ -958,6 +966,10 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
+ * @is_boot_device: callback to the device driver, query if a client is the
+ * default boot device, as the device driver typically has better knowledge
+ * if specific device is the boot device. But this callback is optional.
+ *
  * Rationale: we cannot disable VGA decode resources unconditionally, some
  * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
  * to control things like backlights etc. Hopefully newer multi-GPU laptops do
@@ -973,7 +985,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * Returns: 0 on success, -1 on failure
  */
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
+		bool (*is_boot_device)(struct pci_dev *pdev))
 {
 	int ret = -ENODEV;
 	struct vga_device *vgadev;
@@ -985,6 +998,7 @@ int vga_client_register(struct pci_dev *pdev,
 		goto bail;
 
 	vgadev->set_decode = set_decode;
+	vgadev->is_boot_device = is_boot_device;
 	ret = 0;
 
 bail:
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a5ab416cf476..2a8873a330ba 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2067,7 +2067,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
 	if (ret)
 		return ret;
 
-	ret = vga_client_register(pdev, vfio_pci_set_decode);
+	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
 	if (ret)
 		return ret;
 	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index d36225c582ee..66fe80ffad76 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -50,7 +50,8 @@ struct pci_dev *vga_default_device(void);
 void vga_set_default_device(struct pci_dev *pdev);
 int vga_remove_vgacon(struct pci_dev *pdev);
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*is_boot_device)(struct pci_dev *pdev));
 #else /* CONFIG_VGA_ARB */
 static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
 		unsigned int decodes)
@@ -76,7 +77,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
 	return 0;
 }
 static inline int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*is_boot_device)(struct pci_dev *pdev))
 {
 	return 0;
 }
@@ -114,7 +116,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 
 static inline void vga_client_unregister(struct pci_dev *pdev)
 {
-	vga_client_register(pdev, NULL);
+	vga_client_register(pdev, NULL, NULL);
 }
 
 #endif /* LINUX_VGA_H */
-- 
2.25.1

