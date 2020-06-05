Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF951F0F01
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4696E3D8;
	Sun,  7 Jun 2020 19:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rnd-relay.smtp.broadcom.com (rnd-relay.smtp.broadcom.com
 [192.19.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F11C6E112
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 21:27:43 +0000 (UTC)
Received: from mail-irv-17.broadcom.com (mail-irv-17.lvn.broadcom.net
 [10.75.242.48])
 by rnd-relay.smtp.broadcom.com (Postfix) with ESMTP id CFF4730D85D;
 Fri,  5 Jun 2020 14:27:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 rnd-relay.smtp.broadcom.com CFF4730D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1591392462;
 bh=fqq3+MmDPIfDMCYXzB9RDtnz5+7yqGVWuSUOQhZudyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mZioZxZLIiFTsun7GEVJmT4cVPLdhuVonmAnH4OxyJ6Bc4disI3527ABFJ0sDEbif
 AXktSdqI99Nf2VveGVWeBEa1XHPuHtJ3Wm8Qs+Zoq3A8iy6HzBWHKqv+9Z3MwjVwFF
 yTmU8NqIbhE23PqMuswLvJ33ojZy0nUK9tbF/2NA=
Received: from stbsrv-and-01.and.broadcom.net (stbsrv-and-01.and.broadcom.net
 [10.28.16.211])
 by mail-irv-17.broadcom.com (Postfix) with ESMTP id 8B7ED14008F;
 Fri,  5 Jun 2020 14:27:37 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, james.quinlan@broadcom.com
Subject: [PATCH v4 08/12] device core: Introduce multiple dma pfn offsets
Date: Fri,  5 Jun 2020 17:26:48 -0400
Message-Id: <20200605212706.7361-9-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605212706.7361-1-james.quinlan@broadcom.com>
References: <20200605212706.7361-1-james.quinlan@broadcom.com>
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new field in struct device 'dma_pfn_offset_map' is used to facilitate
the use of single or multiple pfn offsets between cpu addrs and dma addrs.
It subsumes the role of dev->dma_pfn_offset -- a uniform offset.

The function of_dma_get_range() has been modified to take two additional
arguments: the "map", which is an array that holds the information
regarding the pfn offset regions, and map_size, which is the size in bytes
of the map array.

of_dma_configure() is the typical manner to set pfn offsets but there are a
number of ad hoc assignments to dev->dma_pfn_offset in the kernel driver
code.  These cases now invoke the function
dma_attach_uniform_pfn_offset(dev, pfn_offset).

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 arch/arm/include/asm/dma-mapping.h            |  9 +--
 arch/arm/mach-keystone/keystone.c             |  9 ++-
 arch/sh/drivers/pci/pcie-sh7786.c             |  3 +-
 arch/sh/kernel/dma-coherent.c                 | 14 ++--
 arch/x86/pci/sta2x11-fixup.c                  |  7 +-
 drivers/acpi/arm64/iort.c                     |  5 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  5 +-
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  4 +-
 drivers/of/address.c                          | 72 ++++++++++++++++---
 drivers/of/device.c                           | 19 +++--
 drivers/of/of_private.h                       | 11 +--
 drivers/of/unittest.c                         |  8 ++-
 drivers/remoteproc/remoteproc_core.c          |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
 drivers/usb/core/message.c                    |  4 +-
 drivers/usb/core/usb.c                        |  2 +-
 include/linux/device.h                        |  4 +-
 include/linux/dma-direct.h                    | 16 ++++-
 include/linux/dma-mapping.h                   | 38 ++++++++++
 kernel/dma/coherent.c                         | 11 +--
 kernel/dma/mapping.c                          | 38 ++++++++++
 23 files changed, 235 insertions(+), 60 deletions(-)

diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index bdd80ddbca34..f1e72f99468b 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -35,8 +35,9 @@ static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
 #ifndef __arch_pfn_to_dma
 static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
 {
-	if (dev)
-		pfn -= dev->dma_pfn_offset;
+	if (dev && dev->dma_pfn_offset_map)
+		pfn -= dma_pfn_offset_from_phys_addr(dev, PFN_PHYS(pfn));
+
 	return (dma_addr_t)__pfn_to_bus(pfn);
 }
 
@@ -44,8 +45,8 @@ static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
 {
 	unsigned long pfn = __bus_to_pfn(addr);
 
-	if (dev)
-		pfn += dev->dma_pfn_offset;
+	if (dev && dev->dma_pfn_offset_map)
+		pfn += dma_pfn_offset_from_dma_addr(dev, addr);
 
 	return pfn;
 }
diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index 638808c4e122..dfb095b31534 100644
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
@@ -38,9 +39,11 @@ static int keystone_platform_notifier(struct notifier_block *nb,
 		return NOTIFY_BAD;
 
 	if (!dev->of_node) {
-		dev->dma_pfn_offset = keystone_dma_pfn_offset;
-		dev_err(dev, "set dma_pfn_offset%08lx\n",
-			dev->dma_pfn_offset);
+		int ret = dma_attach_uniform_pfn_offset
+				(dev, keystone_dma_pfn_offset);
+
+		dev_err(dev, "set dma_pfn_offset%08lx%s\n",
+			dev->dma_pfn_offset, ret ? " failed" : "");
 	}
 	return NOTIFY_OK;
 }
diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie-sh7786.c
index e0b568aaa701..3e63c6b6e070 100644
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
@@ -487,7 +488,7 @@ int pcibios_map_platform_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
 
 void pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	pdev->dev.dma_pfn_offset = dma_pfn_offset;
+	dma_attach_uniform_pfn_offset(&pdev->dev, dma_pfn_offset);
 }
 
 static int __init sh7786_pcie_core_init(void)
diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
index d4811691b93c..f4a092e74910 100644
--- a/arch/sh/kernel/dma-coherent.c
+++ b/arch/sh/kernel/dma-coherent.c
@@ -14,6 +14,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 {
 	void *ret, *ret_nocache;
 	int order = get_order(size);
+	phys_addr_t phys;
 
 	gfp |= __GFP_ZERO;
 
@@ -34,11 +35,12 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		return NULL;
 	}
 
-	split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
+	phys = virt_to_phys(ret);
+	split_page(pfn_to_page(PFN_DOWN(phys)), order);
 
-	*dma_handle = virt_to_phys(ret);
-	if (!WARN_ON(!dev))
-		*dma_handle -= PFN_PHYS(dev->dma_pfn_offset);
+	*dma_handle = (dma_addr_t)phys;
+	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
+		*dma_handle -= PFN_PHYS(dma_pfn_offset_from_phys_addr(dev, phys));
 
 	return ret_nocache;
 }
@@ -50,8 +52,8 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 	unsigned long pfn = (dma_handle >> PAGE_SHIFT);
 	int k;
 
-	if (!WARN_ON(!dev))
-		pfn += dev->dma_pfn_offset;
+	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
+		pfn += dma_pfn_offset_from_dma_addr(dev, dma_handle);
 
 	for (k = 0; k < (1 << order); k++)
 		__free_pages(pfn_to_page(pfn + k), 0);
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c313d784efab..7815af63f870 100644
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
+	ret = dma_attach_uniform_pfn_offset(dev, PFN_DOWN(-amba_base));
+	if (ret)
+		dev_err(dev, "sta2x11: could not set PFN offset\n");
 
 	dev->bus_dma_limit = max_amba_addr;
 	pci_set_consistent_dma_mask(pdev, max_amba_addr);
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 28a6b387e80e..56ab8b6ece77 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1142,8 +1142,9 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size)
 	*dma_addr = dmaaddr;
 	*dma_size = size;
 
-	dev->dma_pfn_offset = PFN_DOWN(offset);
-	dev_dbg(dev, "dma_pfn_offset(%#08llx)\n", offset);
+	ret = dma_attach_uniform_pfn_offset(dev, PFN_DOWN(offset));
+	dev_dbg(dev, "dma_pfn_offset(%#08llx)%s\n",
+		offset, ret ? " failed!" : "");
 }
 
 static void __init acpi_iort_register_irq(int hwirq, const char *name,
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 072ea113e6be..772e6cc74be8 100644
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
+		ret = dma_attach_uniform_pfn_offset(dev, PHYS_PFN_OFFSET);
+		if (ret)
+			return ret;
 	}
 
 	backend->engine.node = dev->of_node;
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 04fbd4bf0ff9..e9cc1c2d47cd 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -754,7 +754,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset) {
+	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset_map) {
 		dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU page tables\n");
 		return NULL;
 	}
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index eff34ded6305..d0d337ab9f1b 100644
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
+		ret = dma_attach_uniform_pfn_offset(dev, PHYS_PFN_OFFSET);
+		if (ret)
+			return ret;
 #endif
 	}
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..e91cc511f625 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -898,7 +898,9 @@ static int sun6i_csi_probe(struct platform_device *pdev)
 
 	sdev->dev = &pdev->dev;
 	/* The DMA bus has the memory mapped at 0 */
-	sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
+	ret = dma_attach_uniform_pfn_offset(sdev->dev, PFN_DOWN(PHYS_OFFSET));
+	if (ret)
+		return ret;
 
 	ret = sun6i_csi_resource_request(sdev, pdev);
 	if (ret)
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8eea3f6e29a4..9992e3e3c5f7 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -918,12 +918,49 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
 }
 EXPORT_SYMBOL(of_io_request_and_map);
 
+static int dma_attach_pfn_offset_map(struct device_node *node, int num_ranges,
+				     struct bus_dma_region **map, size_t *map_size)
+{
+	struct of_range_parser parser;
+	struct of_range range;
+	struct bus_dma_region *r;
+
+	*map_size = (num_ranges + 1) * sizeof(**map);
+	r = kzalloc(*map_size, GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+	*map = r;
+
+	of_dma_range_parser_init(&parser, node);
+	/*
+	 * Record all info for DMA ranges array.  We could
+	 * just use the of_range struct, but if we did that it
+	 * would require more calculations for phys_to_dma and
+	 * dma_to_phys conversions.
+	 */
+	for_each_of_range(&parser, &range) {
+		r->cpu_start = range.cpu_addr;
+		r->cpu_end = r->cpu_start + range.size - 1;
+		r->dma_start = range.bus_addr;
+		r->dma_end = r->dma_start + range.size - 1;
+		r->pfn_offset = PFN_DOWN(range.cpu_addr)
+			- PFN_DOWN(range.bus_addr);
+		r++;
+	}
+	return 0;
+}
+
 /**
  * of_dma_get_range - Get DMA range info
  * @np:		device node to get DMA range info
  * @dma_addr:	pointer to store initial DMA address of DMA range
  * @paddr:	pointer to store initial CPU address of DMA range
  * @size:	pointer to store size of DMA range
+ * @map:	pointer to a pointer of an array of structs.  This is updated
+ *		to point to NULL (no offsets needed) or kmalloc'd array of
+ *		structs.  In the latter case, it is the caller's obligation to
+ *		kfree the array in the case it is no longer in use.
+ * @map_size:	updated to be the size in bytes of memory allocated to the map
  *
  * Look in bottom up direction for the first "dma-ranges" property
  * and parse it.
@@ -932,10 +969,11 @@ EXPORT_SYMBOL(of_io_request_and_map);
  *	CPU addr (phys_addr_t)	: pna cells
  *	size			: nsize cells
  *
- * It returns -ENODEV if "dma-ranges" property was not found
- * for this device in DT.
+ * It returns -ENODEV if "dma-ranges" property was not found for this
+ * device in the DT.
  */
-int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
+int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr,
+		     u64 *size, struct bus_dma_region **map, size_t *map_size)
 {
 	struct device_node *node = of_node_get(np);
 	const __be32 *ranges = NULL;
@@ -944,7 +982,10 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	bool found_dma_ranges = false;
 	struct of_range_parser parser;
 	struct of_range range;
-	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
+	phys_addr_t cpu_start = ~(phys_addr_t)0;
+	u64 dma_start = U64_MAX, dma_end = 0;
+	bool offset_map_needed = false;
+	int num_ranges = 0;
 
 	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
@@ -975,18 +1016,17 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 			 range.bus_addr, range.cpu_addr, range.size);
 
-		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
-			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
-			/* Don't error out as we'd break some existing DTs */
-			continue;
-		}
-		dma_offset = range.cpu_addr - range.bus_addr;
+		num_ranges++;
+		if (range.cpu_addr - range.bus_addr)
+			offset_map_needed = true;
 
 		/* Take lower and upper limits */
 		if (range.bus_addr < dma_start)
 			dma_start = range.bus_addr;
 		if (range.bus_addr + range.size > dma_end)
 			dma_end = range.bus_addr + range.size;
+		if (range.cpu_addr < cpu_start)
+			cpu_start = range.cpu_addr;
 	}
 
 	if (dma_start >= dma_end) {
@@ -996,9 +1036,19 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		goto out;
 	}
 
+	if (offset_map_needed) {
+		ret = dma_attach_pfn_offset_map(node, num_ranges, map, map_size);
+	} else {
+		*map = NULL;
+		map_size = 0;
+	}
+
+	if (ret)
+		goto out;
+
 	*dma_addr = dma_start;
 	*size = dma_end - dma_start;
-	*paddr = dma_start + dma_offset;
+	*paddr = cpu_start;
 
 	pr_debug("final: dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 		 *dma_addr, *paddr, *size);
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 27203bfd0b22..1501d92589b8 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -91,11 +91,12 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 	u64 dma_addr, paddr, size = 0;
 	int ret;
 	bool coherent;
-	unsigned long offset;
 	const struct iommu_ops *iommu;
 	u64 mask, end;
+	size_t map_size;
+	struct bus_dma_region *map;
 
-	ret = of_dma_get_range(np, &dma_addr, &paddr, &size);
+	ret = of_dma_get_range(np, &dma_addr, &paddr, &size, &map, &map_size);
 	if (ret < 0) {
 		/*
 		 * For legacy reasons, we have to assume some devices need
@@ -105,9 +106,16 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 		if (!force_dma)
 			return ret == -ENODEV ? 0 : ret;
 
-		dma_addr = offset = 0;
+		dma_addr = 0;
 	} else {
-		offset = PFN_DOWN(paddr - dma_addr);
+		if (map) {
+			/* We want the offset map to be device-managed */
+			dev->dma_pfn_offset_map = devm_kzalloc(dev, map_size, GFP_KERNEL);
+			if (!dev->dma_pfn_offset_map)
+				return -ENOMEM;
+			memcpy(dev->dma_pfn_offset_map, map, map_size);
+			kfree(map);
+		}
 
 		/*
 		 * Add a work around to treat the size as mask + 1 in case
@@ -123,7 +131,6 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 			dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
 			return -EINVAL;
 		}
-		dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
 	}
 
 	/*
@@ -142,8 +149,6 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 	else if (!size)
 		size = 1ULL << 32;
 
-	dev->dma_pfn_offset = offset;
-
 	/*
 	 * Limit coherent and dma mask based on size and default mask
 	 * set by the driver.
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index edc682249c00..63bb7b0e94aa 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -157,12 +157,15 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 extern int of_bus_n_addr_cells(struct device_node *np);
 extern int of_bus_n_size_cells(struct device_node *np);
 
+struct bus_dma_region;
 #ifdef CONFIG_OF_ADDRESS
-extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-			    u64 *paddr, u64 *size);
+extern int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr,
+			    u64 *size, struct bus_dma_region **map,
+			    size_t *map_size);
 #else
-static inline int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-				   u64 *paddr, u64 *size)
+static inline int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr,
+				   u64 *size, struct bus_dma_region **map,
+				   size_t *map_size)
 {
 	return -ENODEV;
 }
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 398de04fd19c..33fa3947951f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -873,6 +873,8 @@ static void __init of_unittest_dma_ranges_one(const char *path,
 {
 	struct device_node *np;
 	u64 dma_addr, paddr, size;
+	size_t map_size;
+	struct bus_dma_region *map = NULL;
 	int rc;
 
 	np = of_find_node_by_path(path);
@@ -881,7 +883,7 @@ static void __init of_unittest_dma_ranges_one(const char *path,
 		return;
 	}
 
-	rc = of_dma_get_range(np, &dma_addr, &paddr, &size);
+	rc = of_dma_get_range(np, &dma_addr, &paddr, &size, &map, &map_size);
 
 	unittest(!rc, "of_dma_get_range failed on node %pOF rc=%i\n", np, rc);
 	if (!rc) {
@@ -891,6 +893,7 @@ static void __init of_unittest_dma_ranges_one(const char *path,
 			 "of_dma_get_range wrong phys addr (%llx) on node %pOF", paddr, np);
 		unittest(dma_addr == expect_dma_addr,
 			 "of_dma_get_range wrong DMA addr (%llx) on node %pOF", dma_addr, np);
+		kfree(map);
 	}
 	of_node_put(np);
 }
@@ -901,8 +904,9 @@ static void __init of_unittest_parse_dma_ranges(void)
 		0x0, 0x20000000, 0x40000000);
 	of_unittest_dma_ranges_one("/testcase-data/address-tests/bus@80000000/device@1000",
 		0x10000000, 0x20000000, 0x40000000);
+	/* This one has two ranges in the dma-range property */
 	of_unittest_dma_ranges_one("/testcase-data/address-tests/pci@90000000",
-		0x80000000, 0x20000000, 0x10000000);
+		0x80000000, 0x20000000, 0x50000000);
 }
 
 static void __init of_unittest_pci_dma_ranges(void)
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e12a54e67588..e49648f77261 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -518,7 +518,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = rproc->dev.parent;
-	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
+	rvdev->dev.dma_pfn_offset_map = rproc->dev.parent->dma_pfn_offset_map;
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index daf5f244f93b..b27130c16a8b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -171,8 +171,11 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	 */
 
 #ifdef PHYS_PFN_OFFSET
-	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET))
-		dev->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET)) {
+		ret = dma_attach_uniform_pfn_offset(dev->dev, PHYS_PFN_OFFSET);
+		if (ret)
+			return ret;
+	}
 #endif
 
 	ret = of_reserved_mem_device_init(dev->dev);
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6197938dcc2d..071856000428 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1956,10 +1956,10 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->dev.groups = usb_interface_groups;
 		/*
 		 * Please refer to usb_alloc_dev() to see why we set
-		 * dma_mask and dma_pfn_offset.
+		 * dma_mask and dma_pfn_offset_map.
 		 */
 		intf->dev.dma_mask = dev->dev.dma_mask;
-		intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
+		intf->dev.dma_pfn_offset_map = dev->dev.dma_pfn_offset_map;
 		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
 		intf->minor = -1;
 		device_initialize(&intf->dev);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index f16c26dc079d..3fbc0c06ce9c 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -611,7 +611,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	 * mask for the entire HCD, so don't do that.
 	 */
 	dev->dev.dma_mask = bus->sysdev->dma_mask;
-	dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
+	dev->dev.dma_pfn_offset_map = bus->sysdev->dma_pfn_offset_map;
 	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
diff --git a/include/linux/device.h b/include/linux/device.h
index ac8e37cd716a..b1e7e776c245 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -492,7 +492,7 @@ struct dev_links_info {
  * 		such descriptors.
  * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
  *		DMA limit than the device itself supports.
- * @dma_pfn_offset: offset of DMA memory range relatively of RAM
+ * @dma_pfn_offset_map: offset map for DMA memory range relatively of RAM
  * @dma_parms:	A low level driver may set these to teach IOMMU code about
  * 		segment limitations.
  * @dma_pools:	Dma pools (if dma'ble device).
@@ -577,7 +577,7 @@ struct device {
 					     64 bit addresses for consistent
 					     allocations such descriptors. */
 	u64		bus_dma_limit;	/* upstream dma constraint */
-	unsigned long	dma_pfn_offset;
+	struct bus_dma_region *dma_pfn_offset_map;
 
 	struct device_dma_parameters *dma_parms;
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..0f4db61a4e3f 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -15,14 +15,26 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	dma_addr_t dev_addr = (dma_addr_t)paddr;
 
-	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	if (dev->dma_pfn_offset_map) {
+		unsigned long dma_pfn_offset
+			= dma_pfn_offset_from_phys_addr(dev, paddr);
+
+		dev_addr -= PFN_PHYS((dma_addr_t)dma_pfn_offset);
+	}
+	return dev_addr;
 }
 
 static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
 	phys_addr_t paddr = (phys_addr_t)dev_addr;
 
-	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	if (dev->dma_pfn_offset_map) {
+		unsigned long dma_pfn_offset
+			= dma_pfn_offset_from_dma_addr(dev, dev_addr);
+
+		paddr += PFN_PHYS((phys_addr_t)dma_pfn_offset);
+	}
+	return paddr;
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58fbf4d..ce0c1c418054 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -256,6 +256,39 @@ static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
 size_t dma_direct_max_mapping_size(struct device *dev);
 
 #ifdef CONFIG_HAS_DMA
+struct bus_dma_region {
+	phys_addr_t	cpu_start;
+	phys_addr_t	cpu_end;
+	dma_addr_t	dma_start;
+	dma_addr_t	dma_end;
+	unsigned long	pfn_offset;
+};
+
+int dma_attach_uniform_pfn_offset(struct device *dev,
+				  unsigned long dma_pfn_offset);
+
+static inline unsigned long dma_pfn_offset_from_dma_addr(struct device *dev,
+							 dma_addr_t dma_addr)
+{
+	const struct bus_dma_region *m = dev->dma_pfn_offset_map;
+
+	for (; m->cpu_end; m++)
+		if (dma_addr >= m->dma_start && dma_addr <= m->dma_end)
+			return m->pfn_offset;
+	return 0;
+}
+
+static inline unsigned long dma_pfn_offset_from_phys_addr(struct device *dev,
+							  phys_addr_t paddr)
+{
+	const struct bus_dma_region *m = dev->dma_pfn_offset_map;
+
+	for (; m->cpu_end; m++)
+		if (paddr >= m->cpu_start && paddr <= m->cpu_end)
+			return m->pfn_offset;
+	return 0;
+}
+
 #include <asm/dma-mapping.h>
 
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
@@ -463,6 +496,11 @@ u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
 unsigned long dma_get_merge_boundary(struct device *dev);
 #else /* CONFIG_HAS_DMA */
+static inline int dma_attach_uniform_pfn_offset(struct device *dev,
+						unsigned long dma_pfn_offset)
+{
+	return -EIO;
+}
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a0c4985f38e..689849a77067 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -31,10 +31,13 @@ static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *de
 static inline dma_addr_t dma_get_device_base(struct device *dev,
 					     struct dma_coherent_mem * mem)
 {
-	if (mem->use_dev_dma_pfn_offset)
-		return (mem->pfn_base - dev->dma_pfn_offset) << PAGE_SHIFT;
-	else
-		return mem->device_base;
+	if (mem->use_dev_dma_pfn_offset && dev->dma_pfn_offset_map) {
+		unsigned long dma_pfn_offset = dma_pfn_offset_from_phys_addr
+			(dev, PFN_PHYS(mem->pfn_base));
+
+		return (dma_addr_t)PFN_PHYS(mem->pfn_base - dma_pfn_offset);
+	}
+	return mem->device_base;
 }
 
 static int dma_init_coherent_memory(phys_addr_t phys_addr,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 98e3d873792e..073cfdac48c8 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -407,3 +407,41 @@ unsigned long dma_get_merge_boundary(struct device *dev)
 	return ops->get_merge_boundary(dev);
 }
 EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
+
+/**
+ * dma_attach_uniform_pfn_offset - Assign scalar offset for all addresses.
+ * @dev:	device pointer; needed to "own" the alloced memory.
+ * @pfn_offset:	offset to apply when converting from phys addr
+ *		to dma addr and vice versa.
+ *
+ * This is for the simple case of a uniform offset which requires
+ * no bounds calculations for its use.  It is the equivalent the role
+ * of the former dev->dma_pfn_offset; ie it is just blindly added
+ * or subtracted in all cases.
+ *
+ * It returns -ENOMEM if out of memory, -ENODEV if dev == NULL, otherwise 0.
+ */
+int dma_attach_uniform_pfn_offset(struct device *dev, unsigned long pfn_offset)
+{
+	struct bus_dma_region *map;
+
+	if (!dev)
+		return -ENODEV;
+
+	if (!pfn_offset)
+		return 0;
+
+	map = devm_kcalloc(dev, 2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	map->pfn_offset = pfn_offset;
+	map->cpu_start = 0;
+	map->cpu_end = ~(phys_addr_t)0;
+	map->dma_start = 0;
+	map->dma_end = ~(dma_addr_t)0;
+	dev->dma_pfn_offset_map = map;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_attach_uniform_pfn_offset);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
