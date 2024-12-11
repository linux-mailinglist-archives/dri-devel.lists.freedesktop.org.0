Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC29EC565
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 08:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEB310E1EE;
	Wed, 11 Dec 2024 07:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFvVpFaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3DC10E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733901172; x=1765437172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KWGIyqOVYv+EGQom+zV3OBbUgJqR2TeXXZYELt/C9TQ=;
 b=AFvVpFaDMuRcQ73cIHtv0nzFfa7rBbgg4ikG84pKG6oLt8PVPpve7z8z
 9ckOwYdPNeY8PxnNtorbfwqZQ/ohuKGvoFv9cB8QWSBLlssnOWlugXrWR
 OPkB6C5fo2049Pr45G/UA7KrYAB4uNkdZeEfb48IdlG18Av1Fuvg/hwR4
 ipj3Wy4OCWc37O+le7fdKhanca4gahuw6SO+gWGZIKkad/580cdtIHSLY
 /Y9XBbkl5Q9Q6YOVSlUZtNVAsPI0ulE4PO/GN6DR3Q/SgLlQyZ3eazHGF
 fXJFwArUIeliYaSRaddgNQKGnuI6EDHyEnnGlASVI6b2SLs/Clg+flGWq w==;
X-CSE-ConnectionGUID: IZ0Egna8SyOlKksNRq86IQ==
X-CSE-MsgGUID: 1/DQzP3hQaaoNwFp2J5Lmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34408543"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="34408543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 23:12:52 -0800
X-CSE-ConnectionGUID: nTGnFpvCSt+As1J5rp7Sew==
X-CSE-MsgGUID: arfxdkz5Szir/peURveLrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126526305"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 23:12:51 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [PATCH] drm/virtio: Lock the VGA resources during initialization
Date: Tue, 10 Dec 2024 22:43:43 -0800
Message-ID: <20241211064343.550153-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If another driver for a VGA compatible GPU (that is passthrough'd)
locks the VGA resources (by calling vga_get()), then virtio_gpu
driver would encounter the following errors and fail to load during
probe and initialization:

Invalid read at addr 0x7200005014, size 1, region '(null)', reason: rejected
Invalid write at addr 0x7200005014, size 1, region '(null)', reason: rejected
virtio_gpu virtio0: virtio: device uses modern interface but does not have VIRTIO_F_VERSION_1
virtio_gpu virtio0: probe with driver virtio_gpu failed with error -22

This issue is only seen if virtio-gpu and the other GPU are on
different PCI buses, which can happen if the user includes an
additional PCIe port and associates the VGA compatible GPU with
it while launching Qemu:
qemu-system-x86_64...
-device virtio-vga,max_outputs=1,xres=1920,yres=1080,blob=true
-device pcie-root-port,id=pcie.1,bus=pcie.0,addr=1c.0,slot=1,chassis=1,multifunction=on
-device vfio-pci,host=03:00.0,bus=pcie.1,addr=00.0 ...

In the above example, the device 03:00.0 is an Intel DG2 card and
this issue is seen when both i915 driver and virtio_gpu driver are
loading (or initializing) concurrently or when i915 is loaded first.
Note that during initalization, i915 driver does the following in
intel_vga_reset_io_mem():
vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
outb(inb(VGA_MIS_R), VGA_MIS_W);
vga_put(pdev, VGA_RSRC_LEGACY_IO);

Although, virtio-gpu might own the VGA resources initially, the
above call (in i915) to vga_get_uninterruptible() would result in
these resources being taken away, which means that virtio-gpu would
not be able to decode VGA anymore. This happens in __vga_tryget()
when it calls
pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
where
pci_bits = PCI_COMMAND_MEMORY | PCI_COMMAND_IO
flags = PCI_VGA_STATE_CHANGE_DECODES | PCI_VGA_STATE_CHANGE_BRIDGE

Therefore, to solve this issue, virtio-gpu driver needs to call
vga_get() whenever it needs to reclaim and access VGA resources,
which is during initial probe and setup. After that, a call to
vga_put() would release the lock to allow other VGA compatible
devices to access these shared VGA resources.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 40 +++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 6a67c6297d58..d4309dba557b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -30,6 +30,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/poll.h>
+#include <linux/vgaarb.h>
 #include <linux/wait.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -41,6 +42,8 @@
 
 #include "virtgpu_drv.h"
 
+#define PCI_DEVICE_ID_VIRTIO_GPU 0x1050
+
 static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
@@ -162,7 +165,42 @@ static struct virtio_driver virtio_gpu_driver = {
 	.config_changed = virtio_gpu_config_changed
 };
 
-module_virtio_driver(virtio_gpu_driver);
+static int __init virtio_gpu_driver_init(void)
+{
+	struct pci_dev *pdev;
+	int ret;
+
+	pdev = pci_get_device(PCI_VENDOR_ID_REDHAT_QUMRANET,
+			      PCI_DEVICE_ID_VIRTIO_GPU,
+			      NULL);
+	if (!pdev)
+		return -ENODEV;
+
+	if (pci_is_vga(pdev)) {
+		ret = vga_get_interruptible(pdev,
+			VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
+		if (ret)
+			goto error;
+	}
+
+	ret = register_virtio_driver(&virtio_gpu_driver);
+
+	if (pci_is_vga(pdev))
+		vga_put(pdev, VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
+
+error:
+	pci_dev_put(pdev);
+
+	return ret;
+}
+
+static void __exit virtio_gpu_driver_exit(void)
+{
+	unregister_virtio_driver(&virtio_gpu_driver);
+}
+
+module_init(virtio_gpu_driver_init);
+module_exit(virtio_gpu_driver_exit);
 
 MODULE_DEVICE_TABLE(virtio, id_table);
 MODULE_DESCRIPTION("Virtio GPU driver");
-- 
2.47.1

