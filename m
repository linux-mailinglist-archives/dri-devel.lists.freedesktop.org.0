Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A001EDDC4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788506E28A;
	Thu,  4 Jun 2020 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rnd-relay.smtp.broadcom.com (rnd-relay.smtp.broadcom.com
 [192.19.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BB989B00
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 19:30:38 +0000 (UTC)
Received: from mail-irv-17.broadcom.com (mail-irv-17.lvn.broadcom.net
 [10.75.242.48])
 by rnd-relay.smtp.broadcom.com (Postfix) with ESMTP id 10C8430DED8;
 Wed,  3 Jun 2020 12:21:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 rnd-relay.smtp.broadcom.com 10C8430DED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1591212105;
 bh=oypZvFkJaSrMh/q7az5pacTsbM2toSujbBQt62Ym0ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QAFXrTl+7QaAnmqkAPjZBz1Ll2SV23J0BX8uYCPsIYPJXklukUt/2LBctgSpB289X
 /2qPb6dLo4DYKBzYitK3/IZMtif9Sp1N+FJSYYR5RY5Njjqiy4fzw9q8VJK04pJ1MQ
 kJSkb22NwGrgK+KjgxYs+6pTqmpWHvS0XPSh5DqQ=
Received: from stbsrv-and-01.and.broadcom.net (stbsrv-and-01.and.broadcom.net
 [10.28.16.211])
 by mail-irv-17.broadcom.com (Postfix) with ESMTP id 65C73140069;
 Wed,  3 Jun 2020 12:21:39 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, james.quinlan@broadcom.com
Subject: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
Date: Wed,  3 Jun 2020 15:20:41 -0400
Message-Id: <20200603192058.35296-10-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603192058.35296-1-james.quinlan@broadcom.com>
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
 Alan Stern <stern@rowland.harvard.edu>,
 David Kershner <david.kershner@unisys.com>, Len Brown <lenb@kernel.org>,
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
the use of multiple pfn offsets between cpu addrs and dma addrs.  It
subsumes the role of dev->dma_pfn_offset -- a uniform offset -- and
designates the single offset a special case.

of_dma_configure() is the typical manner to set pfn offsets but there
are a number of ad hoc assignments to dev->dma_pfn_offset in the
kernel code.  These cases now invoke the function
attach_uniform_dma_pfn_offset(dev, pfn_offset).

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 arch/arm/include/asm/dma-mapping.h            |  9 +-
 arch/arm/mach-keystone/keystone.c             |  9 +-
 arch/sh/drivers/pci/pcie-sh7786.c             |  3 +-
 arch/sh/kernel/dma-coherent.c                 | 17 ++--
 arch/x86/pci/sta2x11-fixup.c                  |  7 +-
 drivers/acpi/arm64/iort.c                     |  5 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  7 +-
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  5 +-
 drivers/of/address.c                          | 93 +++++++++++++++++--
 drivers/of/device.c                           |  8 +-
 drivers/remoteproc/remoteproc_core.c          |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
 drivers/usb/core/message.c                    |  4 +-
 drivers/usb/core/usb.c                        |  2 +-
 include/linux/device.h                        |  4 +-
 include/linux/dma-direct.h                    | 16 +++-
 include/linux/dma-mapping.h                   | 45 +++++++++
 kernel/dma/coherent.c                         | 11 ++-
 20 files changed, 210 insertions(+), 51 deletions(-)

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
index 638808c4e122..e7d3ee6e9cb5 100644
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
+		int ret = attach_uniform_dma_pfn_offset
+				(dev, keystone_dma_pfn_offset);
+
+		dev_err(dev, "set dma_pfn_offset%08lx%s\n",
+			dev->dma_pfn_offset, ret ? " failed" : "");
 	}
 	return NOTIFY_OK;
 }
diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie-sh7786.c
index e0b568aaa701..2e832a5c58c1 100644
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
+	attach_uniform_dma_pfn_offset(&pdev->dev, dma_pfn_offset);
 }
 
 static int __init sh7786_pcie_core_init(void)
diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
index d4811691b93c..5fc9e358b6c7 100644
--- a/arch/sh/kernel/dma-coherent.c
+++ b/arch/sh/kernel/dma-coherent.c
@@ -14,6 +14,8 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 {
 	void *ret, *ret_nocache;
 	int order = get_order(size);
+	unsigned long pfn;
+	phys_addr_t phys;
 
 	gfp |= __GFP_ZERO;
 
@@ -34,11 +36,14 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		return NULL;
 	}
 
-	split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
+	phys = virt_to_phys(ret);
+	pfn =  phys >> PAGE_SHIFT;
+	split_page(pfn_to_page(pfn), order);
 
-	*dma_handle = virt_to_phys(ret);
-	if (!WARN_ON(!dev))
-		*dma_handle -= PFN_PHYS(dev->dma_pfn_offset);
+	*dma_handle = (dma_addr_t)phys;
+	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
+		*dma_handle -= PFN_PHYS(
+			dma_pfn_offset_from_phys_addr(dev, phys));
 
 	return ret_nocache;
 }
@@ -50,8 +55,8 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 	unsigned long pfn = (dma_handle >> PAGE_SHIFT);
 	int k;
 
-	if (!WARN_ON(!dev))
-		pfn += dev->dma_pfn_offset;
+	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
+		pfn += dma_pfn_offset_from_dma_addr(dev, dma_handle);
 
 	for (k = 0; k < (1 << order); k++)
 		__free_pages(pfn_to_page(pfn + k), 0);
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c313d784efab..4cdeca9f69b6 100644
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
+	ret = attach_uniform_dma_pfn_offset(dev, PFN_DOWN(-amba_base));
+	if (ret)
+		dev_err(dev, "sta2x11: could not set PFN offset\n");
 
 	dev->bus_dma_limit = max_amba_addr;
 	pci_set_consistent_dma_mask(pdev, max_amba_addr);
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 28a6b387e80e..153661ddc74b 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1142,8 +1142,9 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *dma_size)
 	*dma_addr = dmaaddr;
 	*dma_size = size;
 
-	dev->dma_pfn_offset = PFN_DOWN(offset);
-	dev_dbg(dev, "dma_pfn_offset(%#08llx)\n", offset);
+	ret = attach_uniform_dma_pfn_offset(dev, PFN_DOWN(offset));
+	dev_dbg(dev, "dma_pfn_offset(%#08llx)%s\n",
+		offset, ret ? " failed!" : "");
 }
 
 static void __init acpi_iort_register_irq(int hwirq, const char *name,
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 072ea113e6be..3d41dfc7d178 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -786,7 +787,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	const struct sun4i_backend_quirks *quirks;
 	struct resource *res;
 	void __iomem *regs;
-	int i, ret;
+	int i, ret = 0;
 
 	backend = devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
 	if (!backend)
@@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		 * on our device since the RAM mapping is at 0 for the DMA bus,
 		 * unlike the CPU.
 		 */
-		drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+		ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
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
index eff34ded6305..7212da5e1076 100644
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
+		ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
+		if (ret)
+			return ret;
 #endif
 	}
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..2d66d415b6c3 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_device *pdev)
 
 	sdev->dev = &pdev->dev;
 	/* The DMA bus has the memory mapped at 0 */
-	sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
+	ret = attach_uniform_dma_pfn_offset(sdev->dev,
+					    PHYS_OFFSET >> PAGE_SHIFT);
+	if (ret)
+		return ret;
 
 	ret = sun6i_csi_resource_request(sdev, pdev);
 	if (ret)
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 96d8cfb14a60..c89333b0a5fb 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
 }
 EXPORT_SYMBOL(of_io_request_and_map);
 
+static int attach_dma_pfn_offset_map(struct device *dev,
+				     struct device_node *node, int num_ranges)
+{
+	struct of_range_parser parser;
+	struct of_range range;
+	struct dma_pfn_offset_region *r;
+
+	r = devm_kcalloc(dev, num_ranges + 1,
+			 sizeof(struct dma_pfn_offset_region), GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+	dev->dma_pfn_offset_map = r;
+	of_dma_range_parser_init(&parser, node);
+
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
+
+
+/**
+ * attach_dma_pfn_offset - Assign scalar offset for all addresses.
+ * @dev:	device pointer; only needed for a corner case.
+ * @dma_pfn_offset:	offset to apply when converting from phys addr
+ *			to dma addr and vice versa.
+ *
+ * It returns -ENOMEM if out of memory, otherwise 0.
+ */
+int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long pfn_offset)
+{
+	struct dma_pfn_offset_region *r;
+
+	if (!dev)
+		return -ENODEV;
+
+	if (!pfn_offset)
+		return 0;
+
+	r = devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
+			 GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+
+	r->uniform_offset = true;
+	r->pfn_offset = pfn_offset;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
+
 /**
  * of_dma_get_range - Get DMA range info
  * @dev:	device pointer; only needed for a corner case.
@@ -933,7 +997,7 @@ EXPORT_SYMBOL(of_io_request_and_map);
  *	CPU addr (phys_addr_t)	: pna cells
  *	size			: nsize cells
  *
- * It returns -ENODEV if "dma-ranges" property was not found
+ * It returns -ENODEV if !dev or "dma-ranges" property was not found
  * for this device in DT.
  */
 int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
@@ -946,7 +1010,13 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
 	bool found_dma_ranges = false;
 	struct of_range_parser parser;
 	struct of_range range;
+	phys_addr_t cpu_start = ~(phys_addr_t)0;
 	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
+	bool dma_multi_pfn_offset = false;
+	int num_ranges = 0;
+
+	if (!dev)
+		return -ENODEV;
 
 	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
@@ -977,11 +1047,10 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
 		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 			 range.bus_addr, range.cpu_addr, range.size);
 
-		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
-			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
-			/* Don't error out as we'd break some existing DTs */
-			continue;
-		}
+		num_ranges++;
+		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset)
+			dma_multi_pfn_offset = true;
+
 		dma_offset = range.cpu_addr - range.bus_addr;
 
 		/* Take lower and upper limits */
@@ -989,6 +1058,8 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
 			dma_start = range.bus_addr;
 		if (range.bus_addr + range.size > dma_end)
 			dma_end = range.bus_addr + range.size;
+		if (range.cpu_addr < cpu_start)
+			cpu_start = range.cpu_addr;
 	}
 
 	if (dma_start >= dma_end) {
@@ -998,9 +1069,17 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
 		goto out;
 	}
 
+	if (dma_multi_pfn_offset)
+		ret = attach_dma_pfn_offset_map(dev, node, num_ranges);
+	else if (dma_offset)
+		ret = attach_uniform_dma_pfn_offset(dev, PFN_DOWN(dma_offset));
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
index ef6a741f9f0b..91c50f40a82e 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -91,7 +91,6 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 	u64 dma_addr, paddr, size = 0;
 	int ret;
 	bool coherent;
-	unsigned long offset;
 	const struct iommu_ops *iommu;
 	u64 mask, end;
 
@@ -105,10 +104,8 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 		if (!force_dma)
 			return ret == -ENODEV ? 0 : ret;
 
-		dma_addr = offset = 0;
+		dma_addr = 0;
 	} else {
-		offset = PFN_DOWN(paddr - dma_addr);
-
 		/*
 		 * Add a work around to treat the size as mask + 1 in case
 		 * it is defined in DT as a mask.
@@ -123,7 +120,6 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 			dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
 			return -EINVAL;
 		}
-		dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
 	}
 
 	/*
@@ -142,8 +138,6 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 	else if (!size)
 		size = 1ULL << 32;
 
-	dev->dma_pfn_offset = offset;
-
 	/*
 	 * Limit coherent and dma mask based on size and default mask
 	 * set by the driver.
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
index daf5f244f93b..29217e6e4153 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -171,8 +171,11 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	 */
 
 #ifdef PHYS_PFN_OFFSET
-	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET))
-		dev->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET)) {
+		ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
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
index ac8e37cd716a..9c079643ff54 100644
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
+	struct dma_pfn_offset_region *dma_pfn_offset_map;
 
 	struct device_dma_parameters *dma_parms;
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..3c3363a3925e 100644
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
+		dev_addr -= ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
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
+		paddr += ((phys_addr_t)dma_pfn_offset << PAGE_SHIFT);
+	}
+	return paddr;
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58fbf4d..e0c2ec07c00a 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -256,6 +256,46 @@ static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
 size_t dma_direct_max_mapping_size(struct device *dev);
 
 #ifdef CONFIG_HAS_DMA
+struct dma_pfn_offset_region {
+	bool		uniform_offset;
+	phys_addr_t	cpu_start;
+	phys_addr_t	cpu_end;
+	dma_addr_t	dma_start;
+	dma_addr_t	dma_end;
+	unsigned long	pfn_offset;
+};
+
+int attach_uniform_dma_pfn_offset(struct device *dev,
+				  unsigned long dma_pfn_offset);
+
+static inline unsigned long dma_pfn_offset_from_dma_addr(struct device *dev,
+							 dma_addr_t dma_addr)
+{
+	const struct dma_pfn_offset_region *m = dev->dma_pfn_offset_map;
+
+	if (m->uniform_offset)
+		return m->pfn_offset;
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
+	const struct dma_pfn_offset_region *m = dev->dma_pfn_offset_map;
+
+	if (m->uniform_offset)
+		return m->pfn_offset;
+
+	for (; m->cpu_end; m++)
+		if (paddr >= m->cpu_start && paddr <= m->cpu_end)
+			return m->pfn_offset;
+	return 0;
+}
+
 #include <asm/dma-mapping.h>
 
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
@@ -463,6 +503,11 @@ u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
 unsigned long dma_get_merge_boundary(struct device *dev);
 #else /* CONFIG_HAS_DMA */
+static inline int attach_uniform_dma_pfn_offset(struct device *dev,
+						unsigned long dma_pfn_offset)
+{
+	return -EIO;
+}
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a0c4985f38e..20fc48d0b9d7 100644
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
+		return (mem->pfn_base - dma_pfn_offset) << PAGE_SHIFT;
+	}
+	return mem->device_base;
 }
 
 static int dma_init_coherent_memory(phys_addr_t phys_addr,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
