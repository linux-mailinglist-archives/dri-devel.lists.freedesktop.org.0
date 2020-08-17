Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8284247FE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E8F89D4D;
	Tue, 18 Aug 2020 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rnd-relay.smtp.broadcom.com (rnd-relay.smtp.broadcom.com
 [192.19.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F36389F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 21:54:00 +0000 (UTC)
Received: from mail-irv-17.broadcom.com (mail-irv-17.lvn.broadcom.net
 [10.75.242.48])
 by rnd-relay.smtp.broadcom.com (Postfix) with ESMTP id B44DA30C20B;
 Mon, 17 Aug 2020 14:51:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 rnd-relay.smtp.broadcom.com B44DA30C20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1597701096;
 bh=Wn6pDcFAGyCOh7XVgAWUa/cgkzaQjcCKxnZFHQATb5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=prbFmfIoi1fDPdCfAjyjkpVt1C8/71MtuUFMw9aaaP05r3xmrr1kAqnzeRN+UsRLJ
 NPPVW+mbccYV0NBQCUhhP8Lnemf9Dgt7JvDW7+Ylj05Kk5f7Kk5wCSQjNZiiYVrIZp
 5lIP345VY+8C0BCTGlLo9qI6jvUtVmeU5QHmosaU=
Received: from stbsrv-and-01.and.broadcom.net (stbsrv-and-01.and.broadcom.net
 [10.28.16.211])
 by mail-irv-17.broadcom.com (Postfix) with ESMTP id 40A35140069;
 Mon, 17 Aug 2020 14:53:54 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, james.quinlan@broadcom.com
Subject: [PATCH RESEND v10 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
Date: Mon, 17 Aug 2020 17:53:09 -0400
Message-Id: <20200817215326.30912-8-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817215326.30912-1-james.quinlan@broadcom.com>
References: <20200817215326.30912-1-james.quinlan@broadcom.com>
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new field 'dma_range_map' in struct device is used to facilitate the
use of single or multiple offsets between mapping regions of cpu addrs and
dma addrs.  It subsumes the role of "dev->dma_pfn_offset" which was only
capable of holding a single uniform offset and had no region bounds
checking.

The function of_dma_get_range() has been modified so that it takes a single
argument -- the device node -- and returns a map, NULL, or an error code.
The map is an array that holds the information regarding the DMA regions.
Each range entry contains the address offset, the cpu_start address, the
dma_start address, and the size of the region.

of_dma_configure() is the typical manner to set range offsets but there are
a number of ad hoc assignments to "dev->dma_pfn_offset" in the kernel
driver code.  These cases now invoke the function
dma_attach_offset_range(dev, cpu_addr, dma_addr, size).

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 arch/arm/include/asm/dma-mapping.h            | 10 +--
 arch/arm/mach-keystone/keystone.c             | 17 +++--
 arch/sh/drivers/pci/pcie-sh7786.c             |  9 +--
 arch/sh/kernel/dma-coherent.c                 | 15 ++--
 arch/x86/pci/sta2x11-fixup.c                  |  7 +-
 drivers/acpi/arm64/iort.c                     |  5 +-
 drivers/base/core.c                           |  2 +
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  5 +-
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  4 +-
 drivers/of/address.c                          | 72 +++++++++----------
 drivers/of/device.c                           | 43 ++++++-----
 drivers/of/of_private.h                       | 10 +--
 drivers/of/unittest.c                         | 31 +++++---
 drivers/remoteproc/remoteproc_core.c          |  8 ++-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
 drivers/usb/core/message.c                    |  9 ++-
 drivers/usb/core/usb.c                        |  7 +-
 include/linux/device.h                        |  4 +-
 include/linux/dma-direct.h                    |  8 +--
 include/linux/dma-mapping.h                   | 36 ++++++++++
 kernel/dma/coherent.c                         | 10 +--
 kernel/dma/mapping.c                          | 65 +++++++++++++++++
 24 files changed, 269 insertions(+), 122 deletions(-)

diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index bdd80ddbca34..2405afeb7957 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -35,8 +35,11 @@ static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
 #ifndef __arch_pfn_to_dma
 static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
 {
-	if (dev)
-		pfn -= dev->dma_pfn_offset;
+	if (dev) {
+		phys_addr_t paddr = PFN_PHYS(pfn);
+
+		pfn -= (dma_offset_from_phys_addr(dev, paddr) >> PAGE_SHIFT);
+	}
 	return (dma_addr_t)__pfn_to_bus(pfn);
 }
 
@@ -45,8 +48,7 @@ static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
 	unsigned long pfn = __bus_to_pfn(addr);
 
 	if (dev)
-		pfn += dev->dma_pfn_offset;
-
+		pfn += (dma_offset_from_dma_addr(dev, addr) >> PAGE_SHIFT);
 	return pfn;
 }
 
diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index 638808c4e122..78808942ad1c 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -8,6 +8,7 @@
  */
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/dma-mapping.h>
 #include <linux/init.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
@@ -24,8 +25,6 @@
 
 #include "keystone.h"
 
-static unsigned long keystone_dma_pfn_offset __read_mostly;
-
 static int keystone_platform_notifier(struct notifier_block *nb,
 				      unsigned long event, void *data)
 {
@@ -38,9 +37,12 @@ static int keystone_platform_notifier(struct notifier_block *nb,
 		return NOTIFY_BAD;
 
 	if (!dev->of_node) {
-		dev->dma_pfn_offset = keystone_dma_pfn_offset;
-		dev_err(dev, "set dma_pfn_offset%08lx\n",
-			dev->dma_pfn_offset);
+		int ret = dma_set_offset_range(dev, KEYSTONE_HIGH_PHYS_START,
+					       KEYSTONE_LOW_PHYS_START,
+					       KEYSTONE_HIGH_PHYS_SIZE);
+		dev_err(dev, "set dma_offset%08llx%s\n",
+			KEYSTONE_HIGH_PHYS_START - KEYSTONE_LOW_PHYS_START,
+			ret ? " failed" : "");
 	}
 	return NOTIFY_OK;
 }
@@ -51,11 +53,8 @@ static struct notifier_block platform_nb = {
 
 static void __init keystone_init(void)
 {
-	if (PHYS_OFFSET >= KEYSTONE_HIGH_PHYS_START) {
-		keystone_dma_pfn_offset = PFN_DOWN(KEYSTONE_HIGH_PHYS_START -
-						   KEYSTONE_LOW_PHYS_START);
+	if (PHYS_OFFSET >= KEYSTONE_HIGH_PHYS_START)
 		bus_register_notifier(&platform_bus_type, &platform_nb);
-	}
 	keystone_pm_runtime_init();
 }
 
diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie-sh7786.c
index e0b568aaa701..e929f85c5038 100644
--- a/arch/sh/drivers/pci/pcie-sh7786.c
+++ b/arch/sh/drivers/pci/pcie-sh7786.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/async.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/sh_clk.h>
@@ -31,6 +32,8 @@ struct sh7786_pcie_port {
 static struct sh7786_pcie_port *sh7786_pcie_ports;
 static unsigned int nr_ports;
 static unsigned long dma_pfn_offset;
+size_t memsize;
+u64 memstart;
 
 static struct sh7786_pcie_hwops {
 	int (*core_init)(void);
@@ -301,7 +304,6 @@ static int __init pcie_init(struct sh7786_pcie_port *port)
 	struct pci_channel *chan = port->hose;
 	unsigned int data;
 	phys_addr_t memstart, memend;
-	size_t memsize;
 	int ret, i, win;
 
 	/* Begin initialization */
@@ -368,8 +370,6 @@ static int __init pcie_init(struct sh7786_pcie_port *port)
 	memstart = ALIGN_DOWN(memstart, memsize);
 	memsize = roundup_pow_of_two(memend - memstart);
 
-	dma_pfn_offset = memstart >> PAGE_SHIFT;
-
 	/*
 	 * If there's more than 512MB of memory, we need to roll over to
 	 * LAR1/LAMR1.
@@ -487,7 +487,8 @@ int pcibios_map_platform_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
 
 void pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	pdev->dev.dma_pfn_offset = dma_pfn_offset;
+	dma_set_offset_range(&pdev->dev, __pa(memory_start),
+			     __pa(memory_start) - memstart, memsize);
 }
 
 static int __init sh7786_pcie_core_init(void)
diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
index d4811691b93c..003a91719b37 100644
--- a/arch/sh/kernel/dma-coherent.c
+++ b/arch/sh/kernel/dma-coherent.c
@@ -14,6 +14,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 {
 	void *ret, *ret_nocache;
 	int order = get_order(size);
+	phys_addr_t phys;
 
 	gfp |= __GFP_ZERO;
 
@@ -34,12 +35,10 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		return NULL;
 	}
 
-	split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
-
-	*dma_handle = virt_to_phys(ret);
-	if (!WARN_ON(!dev))
-		*dma_handle -= PFN_PHYS(dev->dma_pfn_offset);
+	phys = virt_to_phys(ret);
+	split_page(pfn_to_page(PHYS_PFN(phys)), order);
 
+	*dma_handle = (dma_addr_t)phys - dma_offset_from_phys_addr(dev, phys);
 	return ret_nocache;
 }
 
@@ -47,12 +46,10 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
 	int order = get_order(size);
-	unsigned long pfn = (dma_handle >> PAGE_SHIFT);
+	unsigned long pfn;
 	int k;
 
-	if (!WARN_ON(!dev))
-		pfn += dev->dma_pfn_offset;
-
+	pfn = PHYS_PFN(dma_handle + dma_offset_from_dma_addr(dev, dma_handle));
 	for (k = 0; k < (1 << order); k++)
 		__free_pages(pfn_to_page(pfn + k), 0);
 
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c313d784efab..ea3a58323f81 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/list.h>
 #include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
 #include <asm/iommu.h>
 
 #define STA2X11_SWIOTLB_SIZE (4*1024*1024)
@@ -133,7 +134,7 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
 	struct sta2x11_instance *instance = sta2x11_pdev_to_instance(pdev);
 	struct device *dev = &pdev->dev;
 	u32 amba_base, max_amba_addr;
-	int i;
+	int i, ret;
 
 	if (!instance)
 		return;
@@ -141,7 +142,9 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
 	pci_read_config_dword(pdev, AHB_BASE(0), &amba_base);
 	max_amba_addr = amba_base + STA2X11_AMBA_SIZE - 1;
 
-	dev->dma_pfn_offset = PFN_DOWN(-amba_base);
+	ret = dma_set_offset_range(dev, 0, amba_base, STA2X11_AMBA_SIZE);
+	if (ret)
+		dev_err(dev, "sta2x11: could not set DMA offset\n");
 
 	dev->bus_dma_limit = max_amba_addr;
 	pci_set_consistent_dma_mask(pdev, max_amba_addr);
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 28a6b387e80e..a3e04c003a21 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1142,8 +1142,9 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size)
 	*dma_addr = dmaaddr;
 	*dma_size = size;
 
-	dev->dma_pfn_offset = PFN_DOWN(offset);
-	dev_dbg(dev, "dma_pfn_offset(%#08llx)\n", offset);
+	ret = dma_set_offset_range(dev, dmaaddr + offset, dmaaddr, size);
+
+	dev_dbg(dev, "dma_offset(%#08llx)%s\n", offset, ret ? " failed!" : "");
 }
 
 static void __init acpi_iort_register_irq(int hwirq, const char *name,
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 05d414e9e8a4..5bd935187b9b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1571,6 +1571,8 @@ static void device_release(struct kobject *kobj)
 	 */
 	devres_release_all(dev);
 
+	kfree(dev->dma_range_map);
+
 	if (dev->release)
 		dev->release(dev);
 	else if (dev->type && dev->type->release)
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 072ea113e6be..48a4adf1f04e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		 * on our device since the RAM mapping is at 0 for the DMA bus,
 		 * unlike the CPU.
 		 */
-		drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+		ret = dma_set_offset_range(drm->dev, PHYS_OFFSET, 0, SZ_4G);
+		if (ret)
+			return ret;
 	}
 
 	backend->engine.node = dev->of_node;
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 04fbd4bf0ff9..d5542df9aacc 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -754,7 +754,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset) {
+	if (!selftest_running && cfg->iommu_dev->dma_range_map) {
 		dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU page tables\n");
 		return NULL;
 	}
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index eff34ded6305..d6eda02fd3fc 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -183,7 +184,9 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 			return ret;
 	} else {
 #ifdef PHYS_PFN_OFFSET
-		csi->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+		ret = dma_set_offset_range(csi->dev, PHYS_OFFSET, 0, SZ_4G);
+		if (ret)
+			return ret;
 #endif
 	}
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..450fce6cd8d2 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -898,7 +898,9 @@ static int sun6i_csi_probe(struct platform_device *pdev)
 
 	sdev->dev = &pdev->dev;
 	/* The DMA bus has the memory mapped at 0 */
-	sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
+	ret = dma_set_offset_range(sdev->dev, PHYS_OFFSET, 0, SZ_4G);
+	if (ret)
+		return ret;
 
 	ret = sun6i_csi_resource_request(sdev, pdev);
 	if (ret)
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8eea3f6e29a4..18d20d2c2f4d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -918,33 +918,33 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
 }
 EXPORT_SYMBOL(of_io_request_and_map);
 
+#ifdef CONFIG_HAS_DMA
 /**
- * of_dma_get_range - Get DMA range info
+ * of_dma_get_range - Get DMA range info and put it into a map array
  * @np:		device node to get DMA range info
- * @dma_addr:	pointer to store initial DMA address of DMA range
- * @paddr:	pointer to store initial CPU address of DMA range
- * @size:	pointer to store size of DMA range
+ * @map:	dma range structure to return
  *
  * Look in bottom up direction for the first "dma-ranges" property
- * and parse it.
- *  dma-ranges format:
+ * and parse it.  Put the information into a DMA offset map array.
+ *
+ * dma-ranges format:
  *	DMA addr (dma_addr)	: naddr cells
  *	CPU addr (phys_addr_t)	: pna cells
  *	size			: nsize cells
  *
- * It returns -ENODEV if "dma-ranges" property was not found
- * for this device in DT.
+ * It returns -ENODEV if "dma-ranges" property was not found for this
+ * device in the DT.
  */
-int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
+int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 {
 	struct device_node *node = of_node_get(np);
 	const __be32 *ranges = NULL;
-	int len;
-	int ret = 0;
 	bool found_dma_ranges = false;
 	struct of_range_parser parser;
 	struct of_range range;
-	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
+	struct bus_dma_region *r;
+	int len, num_ranges = 0;
+	int ret;
 
 	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
@@ -970,44 +970,36 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	}
 
 	of_dma_range_parser_init(&parser, node);
+	for_each_of_range(&parser, &range)
+		num_ranges++;
+
+	of_dma_range_parser_init(&parser, node);
+
+	ret = -ENOMEM;
+	r = kcalloc(num_ranges + 1, sizeof(*r), GFP_KERNEL);
+	if (!r)
+		goto out;
 
+	/*
+	 * Record all info in the generic DMA ranges array for struct device.
+	 */
+	*map = r;
 	for_each_of_range(&parser, &range) {
 		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 			 range.bus_addr, range.cpu_addr, range.size);
-
-		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
-			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
-			/* Don't error out as we'd break some existing DTs */
-			continue;
-		}
-		dma_offset = range.cpu_addr - range.bus_addr;
-
-		/* Take lower and upper limits */
-		if (range.bus_addr < dma_start)
-			dma_start = range.bus_addr;
-		if (range.bus_addr + range.size > dma_end)
-			dma_end = range.bus_addr + range.size;
-	}
-
-	if (dma_start >= dma_end) {
-		ret = -EINVAL;
-		pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
-			 node);
-		goto out;
+		r->cpu_start = range.cpu_addr;
+		r->dma_start = range.bus_addr;
+		r->size = range.size;
+		r->offset = (u64)range.cpu_addr - (u64)range.bus_addr;
+		r++;
 	}
-
-	*dma_addr = dma_start;
-	*size = dma_end - dma_start;
-	*paddr = dma_start + dma_offset;
-
-	pr_debug("final: dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
-		 *dma_addr, *paddr, *size);
+	ret = 0;
 
 out:
 	of_node_put(node);
-
 	return ret;
 }
+#endif
 
 /**
  * of_dma_is_coherent - Check if device is coherent
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 27203bfd0b22..0c84f42a23e4 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -88,14 +88,14 @@ int of_device_add(struct platform_device *ofdev)
  */
 int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 {
-	u64 dma_addr, paddr, size = 0;
-	int ret;
-	bool coherent;
-	unsigned long offset;
 	const struct iommu_ops *iommu;
-	u64 mask, end;
+	const struct bus_dma_region *map = NULL;
+	dma_addr_t dma_start = 0;
+	u64 mask, end, size = 0;
+	bool coherent;
+	int ret;
 
-	ret = of_dma_get_range(np, &dma_addr, &paddr, &size);
+	ret = of_dma_get_range(np, &map);
 	if (ret < 0) {
 		/*
 		 * For legacy reasons, we have to assume some devices need
@@ -104,26 +104,34 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 		 */
 		if (!force_dma)
 			return ret == -ENODEV ? 0 : ret;
-
-		dma_addr = offset = 0;
 	} else {
-		offset = PFN_DOWN(paddr - dma_addr);
+		const struct bus_dma_region *r = map;
+		dma_addr_t dma_end = 0;
+
+		/* Determine the overall bounds of all DMA regions */
+		for (dma_start = ~(dma_addr_t)0; r->size; r++) {
+			/* Take lower and upper limits */
+			if (r->dma_start < dma_start)
+				dma_start = r->dma_start;
+			if (r->dma_start + r->size > dma_end)
+				dma_end = r->dma_start + r->size;
+		}
+		size = dma_end - dma_start;
 
 		/*
 		 * Add a work around to treat the size as mask + 1 in case
 		 * it is defined in DT as a mask.
 		 */
 		if (size & 1) {
-			dev_warn(dev, "Invalid size 0x%llx for dma-range\n",
-				 size);
+			dev_warn(dev, "Invalid size 0x%llx for dma-range(s)\n", size);
 			size = size + 1;
 		}
 
 		if (!size) {
 			dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
+			kfree(map);
 			return -EINVAL;
 		}
-		dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
 	}
 
 	/*
@@ -142,13 +150,11 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 	else if (!size)
 		size = 1ULL << 32;
 
-	dev->dma_pfn_offset = offset;
-
 	/*
 	 * Limit coherent and dma mask based on size and default mask
 	 * set by the driver.
 	 */
-	end = dma_addr + size - 1;
+	end = dma_start + size - 1;
 	mask = DMA_BIT_MASK(ilog2(end) + 1);
 	dev->coherent_dma_mask &= mask;
 	*dev->dma_mask &= mask;
@@ -161,14 +167,17 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 		coherent ? " " : " not ");
 
 	iommu = of_iommu_configure(dev, np);
-	if (PTR_ERR(iommu) == -EPROBE_DEFER)
+	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
+		kfree(map);
 		return -EPROBE_DEFER;
+	}
 
 	dev_dbg(dev, "device is%sbehind an iommu\n",
 		iommu ? " " : " not ");
 
-	arch_setup_dma_ops(dev, dma_addr, size, iommu, coherent);
+	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
+	dev->dma_range_map = map;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index edc682249c00..5c13485a4ad1 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -157,12 +157,12 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 extern int of_bus_n_addr_cells(struct device_node *np);
 extern int of_bus_n_size_cells(struct device_node *np);
 
-#ifdef CONFIG_OF_ADDRESS
-extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-			    u64 *paddr, u64 *size);
+struct bus_dma_region;
+#if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
+int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map);
 #else
-static inline int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-				   u64 *paddr, u64 *size)
+static inline int of_dma_get_range(struct device_node *np,
+		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 398de04fd19c..52a448932874 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -7,6 +7,7 @@
 
 #include <linux/memblock.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/hashtable.h>
@@ -869,10 +870,10 @@ static void __init of_unittest_changeset(void)
 }
 
 static void __init of_unittest_dma_ranges_one(const char *path,
-		u64 expect_dma_addr, u64 expect_paddr, u64 expect_size)
+		u64 expect_dma_addr, u64 expect_paddr)
 {
 	struct device_node *np;
-	u64 dma_addr, paddr, size;
+	const struct bus_dma_region *map = NULL;
 	int rc;
 
 	np = of_find_node_by_path(path);
@@ -881,16 +882,27 @@ static void __init of_unittest_dma_ranges_one(const char *path,
 		return;
 	}
 
-	rc = of_dma_get_range(np, &dma_addr, &paddr, &size);
+	rc = of_dma_get_range(np, &map);
 
 	unittest(!rc, "of_dma_get_range failed on node %pOF rc=%i\n", np, rc);
+
 	if (!rc) {
-		unittest(size == expect_size,
-			 "of_dma_get_range wrong size on node %pOF size=%llx\n", np, size);
+		phys_addr_t	paddr;
+		dma_addr_t	dma_addr;
+		struct device	dev_bogus;
+
+		dev_bogus.dma_range_map = map;
+		paddr = (phys_addr_t)expect_dma_addr +
+			dma_offset_from_dma_addr(&dev_bogus, expect_dma_addr);
+		dma_addr = (dma_addr_t)expect_paddr -
+			dma_offset_from_phys_addr(&dev_bogus, expect_paddr);
+
 		unittest(paddr == expect_paddr,
 			 "of_dma_get_range wrong phys addr (%llx) on node %pOF", paddr, np);
 		unittest(dma_addr == expect_dma_addr,
 			 "of_dma_get_range wrong DMA addr (%llx) on node %pOF", dma_addr, np);
+
+		kfree(map);
 	}
 	of_node_put(np);
 }
@@ -898,11 +910,14 @@ static void __init of_unittest_dma_ranges_one(const char *path,
 static void __init of_unittest_parse_dma_ranges(void)
 {
 	of_unittest_dma_ranges_one("/testcase-data/address-tests/device@70000000",
-		0x0, 0x20000000, 0x40000000);
+		0x0, 0x20000000);
 	of_unittest_dma_ranges_one("/testcase-data/address-tests/bus@80000000/device@1000",
-		0x10000000, 0x20000000, 0x40000000);
+		0x10000000, 0x20000000);
+	/* pci@90000000 has two ranges in the dma-range property */
+	of_unittest_dma_ranges_one("/testcase-data/address-tests/pci@90000000",
+		0x80000000, 0x20000000);
 	of_unittest_dma_ranges_one("/testcase-data/address-tests/pci@90000000",
-		0x80000000, 0x20000000, 0x10000000);
+		0xc0000000, 0x40000000);
 }
 
 static void __init of_unittest_pci_dma_ranges(void)
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9f04c30c4aaf..8c6b06795eb3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -519,7 +519,13 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = &rproc->dev;
-	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
+	if (rproc->dev.parent->dma_range_map) {
+		const struct bus_dma_region *map =
+			dma_copy_dma_range_map(rproc->dev.parent->dma_range_map);
+		if (!map)
+			return -ENOMEM;
+		rvdev->dev.dma_range_map = map;
+	}
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 1744e6fcc999..249e4bddaa40 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -230,8 +230,11 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	 */
 
 #ifdef PHYS_PFN_OFFSET
-	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET))
-		dev->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET)) {
+		ret = dma_set_offset_range(dev->dev, PHYS_OFFSET, 0, SZ_4G);
+		if (ret)
+			return ret;
+	}
 #endif
 
 	ret = of_reserved_mem_device_init(dev->dev);
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6197938dcc2d..c6ccc7b04a7b 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1956,10 +1956,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->dev.groups = usb_interface_groups;
 		/*
 		 * Please refer to usb_alloc_dev() to see why we set
-		 * dma_mask and dma_pfn_offset.
+		 * dma_mask and dma_range_map.
 		 */
 		intf->dev.dma_mask = dev->dev.dma_mask;
-		intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
+		if (dev->dev.dma_range_map) {
+			intf->dev.dma_range_map =
+				dma_copy_dma_range_map(dev->dev.dma_range_map);
+			if (!intf->dev.dma_range_map)
+				dev_err(&dev->dev, "failed to copy DMA map\n");
+		}
 		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
 		intf->minor = -1;
 		device_initialize(&intf->dev);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index f16c26dc079d..becde341c05c 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -611,7 +611,12 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	 * mask for the entire HCD, so don't do that.
 	 */
 	dev->dev.dma_mask = bus->sysdev->dma_mask;
-	dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
+	if (bus->sysdev->dma_range_map) {
+		dev->dev.dma_range_map =
+			dma_copy_dma_range_map(bus->sysdev->dma_range_map);
+		if (!dev->dev.dma_range_map)
+			dev_err(&dev->dev, "failed to copy DMA map\n");
+	}
 	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
diff --git a/include/linux/device.h b/include/linux/device.h
index 5efed864b387..003d4be4cba9 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -493,7 +493,7 @@ struct dev_links_info {
  * 		such descriptors.
  * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
  *		DMA limit than the device itself supports.
- * @dma_pfn_offset: offset of DMA memory range relatively of RAM
+ * @dma_range_map: map for DMA memory ranges relative to that of RAM
  * @dma_parms:	A low level driver may set these to teach IOMMU code about
  * 		segment limitations.
  * @dma_pools:	Dma pools (if dma'ble device).
@@ -578,7 +578,7 @@ struct device {
 					     64 bit addresses for consistent
 					     allocations such descriptors. */
 	u64		bus_dma_limit;	/* upstream dma constraint */
-	unsigned long	dma_pfn_offset;
+	const struct bus_dma_region *dma_range_map;
 
 	struct device_dma_parameters *dma_parms;
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index ab2e20cba951..ac9fc6b1d5ff 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -13,16 +13,12 @@ extern unsigned int zone_dma_bits;
 #else
 static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
-	dma_addr_t dev_addr = (dma_addr_t)paddr;
-
-	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	return (dma_addr_t)paddr - dma_offset_from_phys_addr(dev, paddr);
 }
 
 static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
-	phys_addr_t paddr = (phys_addr_t)dev_addr;
-
-	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	return (phys_addr_t)dev_addr + dma_offset_from_dma_addr(dev, dev_addr);
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index a33ed3954ed4..ac43a8f61683 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -255,7 +255,38 @@ static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
 
 size_t dma_direct_max_mapping_size(struct device *dev);
 
+struct bus_dma_region {
+	phys_addr_t	cpu_start;
+	dma_addr_t	dma_start;
+	u64		size;
+	u64		offset;
+};
+
 #ifdef CONFIG_HAS_DMA
+static inline u64 dma_offset_from_dma_addr(struct device *dev, dma_addr_t dma_addr)
+{
+	const struct bus_dma_region *m = dev->dma_range_map;
+
+	if (!m)
+		return 0;
+	for (; m->size; m++)
+		if (dma_addr >= m->dma_start && dma_addr - m->dma_start < m->size)
+			return m->offset;
+	return 0;
+}
+
+static inline u64 dma_offset_from_phys_addr(struct device *dev, phys_addr_t paddr)
+{
+	const struct bus_dma_region *m = dev->dma_range_map;
+
+	if (!m)
+		return 0;
+	for (; m->size; m++)
+		if (paddr >= m->cpu_start && paddr - m->cpu_start < m->size)
+			return m->offset;
+	return 0;
+}
+
 #include <asm/dma-mapping.h>
 
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
@@ -801,6 +832,11 @@ static inline void arch_teardown_dma_ops(struct device *dev)
 }
 #endif /* CONFIG_ARCH_HAS_TEARDOWN_DMA_OPS */
 
+int dma_set_offset_range(struct device *dev, phys_addr_t cpu_start,
+		dma_addr_t dma_start, u64 size);
+
+void *dma_copy_dma_range_map(const struct bus_dma_region *map);
+
 static inline unsigned int dma_get_max_seg_size(struct device *dev)
 {
 	if (dev->dma_parms && dev->dma_parms->max_segment_size)
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a0c4985f38e..2e0fd783e08f 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -31,10 +31,12 @@ static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *de
 static inline dma_addr_t dma_get_device_base(struct device *dev,
 					     struct dma_coherent_mem * mem)
 {
-	if (mem->use_dev_dma_pfn_offset)
-		return (mem->pfn_base - dev->dma_pfn_offset) << PAGE_SHIFT;
-	else
-		return mem->device_base;
+	if (mem->use_dev_dma_pfn_offset) {
+		u64 base_addr = (u64)mem->pfn_base << PAGE_SHIFT;
+
+		return base_addr - dma_offset_from_phys_addr(dev, base_addr);
+	}
+	return mem->device_base;
 }
 
 static int dma_init_coherent_memory(phys_addr_t phys_addr,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index a8c18c9a796f..acd1fa60f774 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -11,6 +11,7 @@
 #include <linux/dma-noncoherent.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
+#include <linux/limits.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -417,3 +418,67 @@ unsigned long dma_get_merge_boundary(struct device *dev)
 	return ops->get_merge_boundary(dev);
 }
 EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
+
+/**
+ * dma_set_offset_range - Assign scalar offset for a single DMA range.
+ * @dev:	device pointer; needed to "own" the alloced memory.
+ * @cpu_start:  beginning of memory region covered by this offset.
+ * @dma_start:  beginning of DMA/PCI region covered by this offset.
+ * @size:	size of the region.
+ *
+ * This is for the simple case of a uniform offset which cannot
+ * be discovered by "dma-ranges".
+ *
+ * It returns -ENOMEM if out of memory, 0 otherwise.
+ */
+int dma_set_offset_range(struct device *dev, phys_addr_t cpu_start,
+			 dma_addr_t dma_start, u64 size)
+{
+	struct bus_dma_region *map;
+	u64 offset = (u64)cpu_start - (u64)dma_start;
+
+	if (!offset)
+		return 0;
+
+	if (dev->dma_range_map) {
+		dev_err(dev, "attempt to add DMA range to existing map\n");
+		return -EINVAL;
+	}
+
+	map = kcalloc(2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+	map[0].cpu_start = cpu_start;
+	map[0].dma_start = dma_start;
+	map[0].offset = offset;
+	map[0].size = size;
+	dev->dma_range_map = map;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_set_offset_range);
+
+/**
+ * dma_copy_dma_range_map - Copy the dma_range map using kcalloc.
+ * @map:	source to copy.
+ *
+ * A dma range map array consists of N + 1 elements; N acutal ranges
+ * and a zero element trailer.
+ *
+ * It returns NULL if the kcalloc fails.
+ */
+void *dma_copy_dma_range_map(const struct bus_dma_region *map)
+{
+	int num_ranges;
+	struct bus_dma_region *new_map;
+	const struct bus_dma_region *r = map;
+
+	for (num_ranges = 0; r->size; num_ranges++)
+		r++;
+	new_map = kcalloc(num_ranges + 1, sizeof(*map), GFP_KERNEL);
+	if (new_map)
+		memcpy(new_map, map, sizeof(*map) * num_ranges);
+
+	return new_map;
+}
+EXPORT_SYMBOL_GPL(dma_copy_dma_range_map);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
