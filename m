Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49EBA7DB58
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 12:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107D010E42B;
	Mon,  7 Apr 2025 10:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LKRetri4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1409E10E42A;
 Mon,  7 Apr 2025 10:40:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73A545C5C55;
 Mon,  7 Apr 2025 10:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD93C4CEDD;
 Mon,  7 Apr 2025 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744022442;
 bh=BYjYcWf1Fwu1NDLwGvJl+jn1B5UgPV0rzCyGrbDLcAE=;
 h=From:To:Cc:Subject:Date:From;
 b=LKRetri4hSGmLUKA5I/tzu/0D6DE5Bm3a1NKfGfMR4fPbE/VTcfsHpe430PssNYts
 JYQkPZxBkthyxX2QC5ccS4qlP9CSzaZWBbIJ1PS/GcT1gRvG2FKSw9DxntCGXnV95J
 R0Da3pX6hgIh8VgHVsNRZVc4QVTHzMZV8YGmhUbv0LjOENBn6yhDifkeib7twfqdca
 F/EKN5aTk3UmM1iEEVZTkJYTkDJkCdYTvzel7wSJnobx4vNFlE4WhGFOXoM1Gmdeqw
 KW81ah3yRxSjcA1idP4S8FhW4UhMZ921U6ET3Rn1BsTZUODghOHDijZ4PAxhQE1YoY
 iCyi2FI+cj4zQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Saurav Kashyap <skashyap@marvell.com>,
 Javed Hasan <jhasan@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Lijo Lazar <lijo.lazar@amd.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, kvm@vger.kernel.org
Subject: [RFC] PCI: add CONFIG_MMU dependency
Date: Mon,  7 Apr 2025 12:38:14 +0200
Message-Id: <20250407104025.3421624-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

It turns out that there are no platforms that have PCI but don't have an MMU,
so adding a Kconfig dependency on CONFIG_PCI simplifies build testing kernels
for those platforms a lot, and avoids a lot of inadvertent build regressions.

Add a dependency for CONFIG_PCI and remove all the ones for PCI specific
device drivers that are currently marked not having it.

Link: https://lore.kernel.org/lkml/a41f1b20-a76c-43d8-8c36-f12744327a54@app.fastmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/qaic/Kconfig              | 1 -
 drivers/firewire/Kconfig                | 2 +-
 drivers/gpu/drm/Kconfig                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 3 +--
 drivers/gpu/drm/ast/Kconfig             | 2 +-
 drivers/gpu/drm/gma500/Kconfig          | 2 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 1 -
 drivers/gpu/drm/loongson/Kconfig        | 2 +-
 drivers/gpu/drm/mgag200/Kconfig         | 2 +-
 drivers/gpu/drm/nouveau/Kconfig         | 3 +--
 drivers/gpu/drm/qxl/Kconfig             | 2 +-
 drivers/gpu/drm/radeon/Kconfig          | 2 +-
 drivers/gpu/drm/tiny/Kconfig            | 2 +-
 drivers/gpu/drm/vmwgfx/Kconfig          | 2 +-
 drivers/gpu/drm/xe/Kconfig              | 2 +-
 drivers/net/ethernet/broadcom/Kconfig   | 1 -
 drivers/pci/Kconfig                     | 1 +
 drivers/pci/pci.c                       | 4 ++--
 drivers/scsi/bnx2fc/Kconfig             | 1 -
 drivers/scsi/bnx2i/Kconfig              | 1 -
 drivers/vfio/pci/Kconfig                | 2 +-
 21 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index a9f866230058..5e405a19c157 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,7 +8,6 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
-	depends on MMU
 	select CRC32
 	help
 	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
diff --git a/drivers/firewire/Kconfig b/drivers/firewire/Kconfig
index 905c82e26ce7..a5f5e250223a 100644
--- a/drivers/firewire/Kconfig
+++ b/drivers/firewire/Kconfig
@@ -83,7 +83,7 @@ config FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST
 
 config FIREWIRE_OHCI
 	tristate "OHCI-1394 controllers"
-	depends on PCI && FIREWIRE && MMU
+	depends on PCI && FIREWIRE
 	help
 	  Enable this driver if you have a FireWire controller based
 	  on the OHCI specification.  For all practical purposes, this
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..6e95d204597e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -462,7 +462,7 @@ source "drivers/gpu/drm/imagination/Kconfig"
 
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
-	depends on DRM && PCI && MMU && HYPERV
+	depends on DRM && PCI && HYPERV
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 1a11cab741ac..058e3b3ad520 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -2,7 +2,7 @@
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	depends on !UML
 	select FW_LOADER
 	select DRM_CLIENT
@@ -68,7 +68,6 @@ config DRM_AMDGPU_CIK
 config DRM_AMDGPU_USERPTR
 	bool "Always enable userptr write support"
 	depends on DRM_AMDGPU
-	depends on MMU
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	help
diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index da0663542e8a..242fbccdf844 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_AST
 	tristate "AST server chips"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index aa2ea128aa2f..a2acaa699dd5 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
-	depends on DRM && PCI && X86 && MMU && HAS_IOPORT
+	depends on DRM && PCI && X86 && HAS_IOPORT
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 98d77d74999d..d1f3f5793f34 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -2,7 +2,6 @@
 config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
 	depends on DRM && PCI
-	depends on MMU
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
index 552edfec7afb..d739d51cf54c 100644
--- a/drivers/gpu/drm/loongson/Kconfig
+++ b/drivers/gpu/drm/loongson/Kconfig
@@ -2,7 +2,7 @@
 
 config DRM_LOONGSON
 	tristate "DRM support for Loongson Graphics"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	depends on LOONGARCH || MIPS || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 412dcbea0e2d..a962ae564a75 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_MGAG200
 	tristate "Matrox G200"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 7b3e979c51ec..d1587639ebb0 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	select IOMMU_API
 	select FW_LOADER
 	select FW_CACHE if PM_SLEEP
@@ -94,7 +94,6 @@ config DRM_NOUVEAU_SVM
 	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
 	depends on DEVICE_PRIVATE
 	depends on DRM_NOUVEAU
-	depends on MMU
 	depends on STAGING
 	select HMM_MIRROR
 	select MMU_NOTIFIER
diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index 69427eb8bed2..d8f24bcae34b 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_QXL
 	tristate "QXL virtual GPU"
-	depends on DRM && PCI && MMU && HAS_IOPORT
+	depends on DRM && PCI && HAS_IOPORT
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index f51bace9555d..c479f0c0dd5c 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -2,7 +2,7 @@
 
 config DRM_RADEON
 	tristate "ATI Radeon"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	depends on AGP || !AGP
 	select FW_LOADER
 	select DRM_CLIENT_SELECTION
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 54c84c9801c1..6ca12fe7f57a 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -37,7 +37,7 @@ config DRM_BOCHS
 
 config DRM_CIRRUS_QEMU
 	tristate "Cirrus driver for QEMU emulated device"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index 6c3c2922ae8b..aab646b91ca9 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI
 	depends on (X86 && HYPERVISOR_GUEST) || ARM64
 	select DRM_CLIENT_SELECTION
 	select DRM_TTM
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 5c2f459a2925..2dec62737ff6 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
+	depends on DRM && PCI && (m || (y && KUNIT=y))
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
index eeec8bf17cf4..aa43984a05cf 100644
--- a/drivers/net/ethernet/broadcom/Kconfig
+++ b/drivers/net/ethernet/broadcom/Kconfig
@@ -96,7 +96,6 @@ config BNX2
 config CNIC
 	tristate "QLogic CNIC support"
 	depends on PCI && (IPV6 || IPV6=n)
-	depends on MMU
 	select BNX2
 	select UIO
 	help
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index da28295b4aac..9c0e4aaf4e8c 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -21,6 +21,7 @@ config GENERIC_PCI_IOMAP
 menuconfig PCI
 	bool "PCI support"
 	depends on HAVE_PCI
+	depends on MMU
 	help
 	  This option enables support for the PCI local bus, including
 	  support for PCI-X and the foundations for PCI Express support.
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24..60a20a0ac41f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4257,7 +4257,7 @@ unsigned long __weak pci_address_to_pio(phys_addr_t address)
 #ifndef pci_remap_iospace
 int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
 {
-#if defined(PCI_IOBASE) && defined(CONFIG_MMU)
+#if defined(PCI_IOBASE)
 	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
 
 	if (!(res->flags & IORESOURCE_IO))
@@ -4290,7 +4290,7 @@ EXPORT_SYMBOL(pci_remap_iospace);
  */
 void pci_unmap_iospace(struct resource *res)
 {
-#if defined(PCI_IOBASE) && defined(CONFIG_MMU)
+#if defined(PCI_IOBASE)
 	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
 
 	vunmap_range(vaddr, vaddr + resource_size(res));
diff --git a/drivers/scsi/bnx2fc/Kconfig b/drivers/scsi/bnx2fc/Kconfig
index ecdc0f0f4f4e..3cf7e08df809 100644
--- a/drivers/scsi/bnx2fc/Kconfig
+++ b/drivers/scsi/bnx2fc/Kconfig
@@ -5,7 +5,6 @@ config SCSI_BNX2X_FCOE
 	depends on (IPV6 || IPV6=n)
 	depends on LIBFC
 	depends on LIBFCOE
-	depends on MMU
 	select NETDEVICES
 	select ETHERNET
 	select NET_VENDOR_BROADCOM
diff --git a/drivers/scsi/bnx2i/Kconfig b/drivers/scsi/bnx2i/Kconfig
index 0cc06c2ce0b8..75ace2302fed 100644
--- a/drivers/scsi/bnx2i/Kconfig
+++ b/drivers/scsi/bnx2i/Kconfig
@@ -4,7 +4,6 @@ config SCSI_BNX2_ISCSI
 	depends on NET
 	depends on PCI
 	depends on (IPV6 || IPV6=n)
-	depends on MMU
 	select SCSI_ISCSI_ATTRS
 	select NETDEVICES
 	select ETHERNET
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index c3bcb6911c53..2b0172f54665 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "VFIO support for PCI devices"
-	depends on PCI && MMU
+	depends on PCI
 
 config VFIO_PCI_CORE
 	tristate
-- 
2.39.5

