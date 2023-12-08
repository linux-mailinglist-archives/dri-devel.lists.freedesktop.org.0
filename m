Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39C80AFE2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0EA10EB51;
	Fri,  8 Dec 2023 22:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A89D10EB51
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 22:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iTwSrBS/psQWYmq0oJLKHMv2C9G6WtXP3GgAfwSGatU=; b=gza9M9EOhH7pw0bTgrrtTAVF96
 HovQnSj+0EpRHJ88ltnURTrwdHXobInuzWt9mgX4F8qiikHRaPFLbrvse+JwL9aVzxj+bR5EJ7nHJ
 d9eApY4/zCcwldLY3K06rJN6yPok8gFWR/ZjzgjSQMrwfYc68mIBvoMVXUdJizmuwrphQNTf9cIyc
 yR8qVQ43SI5cQK30TUgnodfGJbKh3tx3yxhbcD7VDMZdCVp7x+YWhRG7+0Fq8sYDdfYjSRK/ODAxp
 b6zoYSDvgeb2fCfIGFkwmFGDehdsQejg6bXOxICqlh3jsNN1AkEB1Em7XgmpXeBFjDn9BhZGS4Z2M
 r+14LTmQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rBjcf-006j5V-Ox; Fri, 08 Dec 2023 22:47:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fbdev@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: Remove support for Carillo Ranch driver
Date: Fri,  8 Dec 2023 22:47:03 +0000
Message-Id: <20231208224703.1603264-2-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231208224703.1603264-1-willy@infradead.org>
References: <20231208224703.1603264-1-willy@infradead.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Alan Hourihane <alanh@fairlite.co.uk>, Richard Weinberger <richard@nod.at>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andy Lowe <alowe@mvista.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As far as anybody can tell, this product never shipped.  If it did,
it shipped in 2007 and nobody has access to one any more.  Remove the
mtd NOR driver.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/mtd/maps/Kconfig        |   7 -
 drivers/mtd/maps/Makefile       |   1 -
 drivers/mtd/maps/intel_vr_nor.c | 265 --------------------------------
 3 files changed, 273 deletions(-)
 delete mode 100644 drivers/mtd/maps/intel_vr_nor.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index e098ae937ce8..8a8b19874e23 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -341,13 +341,6 @@ config MTD_UCLINUX
 	help
 	  Map driver to support image based filesystems for uClinux.
 
-config MTD_INTEL_VR_NOR
-	tristate "NOR flash on Intel Vermilion Range Expansion Bus CS0"
-	depends on PCI
-	help
-	  Map driver for a NOR flash bank located on the Expansion Bus of the
-	  Intel Vermilion Range chipset.
-
 config MTD_PLATRAM
 	tristate "Map driver for platform device RAM (mtd-ram)"
 	select MTD_RAM
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 094cfb244086..a9083c888e3b 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -40,6 +40,5 @@ obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
 obj-$(CONFIG_MTD_NETtel)	+= nettel.o
 obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
-obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_LANTIQ)	+= lantiq-flash.o
diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
deleted file mode 100644
index d67b845b0e89..000000000000
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ /dev/null
@@ -1,265 +0,0 @@
-/*
- * drivers/mtd/maps/intel_vr_nor.c
- *
- * An MTD map driver for a NOR flash bank on the Expansion Bus of the Intel
- * Vermilion Range chipset.
- *
- * The Vermilion Range Expansion Bus supports four chip selects, each of which
- * has 64MiB of address space.  The 2nd BAR of the Expansion Bus PCI Device
- * is a 256MiB memory region containing the address spaces for all four of the
- * chip selects, with start addresses hardcoded on 64MiB boundaries.
- *
- * This map driver only supports NOR flash on chip select 0.  The buswidth
- * (either 8 bits or 16 bits) is determined by reading the Expansion Bus Timing
- * and Control Register for Chip Select 0 (EXP_TIMING_CS0).  This driver does
- * not modify the value in the EXP_TIMING_CS0 register except to enable writing
- * and disable boot acceleration.  The timing parameters in the register are
- * assumed to have been properly initialized by the BIOS.  The reset default
- * timing parameters are maximally conservative (slow), so access to the flash
- * will be slower than it should be if the BIOS has not initialized the timing
- * parameters.
- *
- * Author: Andy Lowe <alowe@mvista.com>
- *
- * 2006 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/pci.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/cfi.h>
-#include <linux/mtd/flashchip.h>
-
-#define DRV_NAME "vr_nor"
-
-struct vr_nor_mtd {
-	void __iomem *csr_base;
-	struct map_info map;
-	struct mtd_info *info;
-	struct pci_dev *dev;
-};
-
-/* Expansion Bus Configuration and Status Registers are in BAR 0 */
-#define EXP_CSR_MBAR 0
-/* Expansion Bus Memory Window is BAR 1 */
-#define EXP_WIN_MBAR 1
-/* Maximum address space for Chip Select 0 is 64MiB */
-#define CS0_SIZE 0x04000000
-/* Chip Select 0 is at offset 0 in the Memory Window */
-#define CS0_START 0x0
-/* Chip Select 0 Timing Register is at offset 0 in CSR */
-#define EXP_TIMING_CS0 0x00
-#define TIMING_CS_EN		(1 << 31)	/* Chip Select Enable */
-#define TIMING_BOOT_ACCEL_DIS	(1 <<  8)	/* Boot Acceleration Disable */
-#define TIMING_WR_EN		(1 <<  1)	/* Write Enable */
-#define TIMING_BYTE_EN		(1 <<  0)	/* 8-bit vs 16-bit bus */
-#define TIMING_MASK		0x3FFF0000
-
-static void vr_nor_destroy_partitions(struct vr_nor_mtd *p)
-{
-	mtd_device_unregister(p->info);
-}
-
-static int vr_nor_init_partitions(struct vr_nor_mtd *p)
-{
-	/* register the flash bank */
-	/* partition the flash bank */
-	return mtd_device_register(p->info, NULL, 0);
-}
-
-static void vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
-{
-	map_destroy(p->info);
-}
-
-static int vr_nor_mtd_setup(struct vr_nor_mtd *p)
-{
-	static const char * const probe_types[] =
-	    { "cfi_probe", "jedec_probe", NULL };
-	const char * const *type;
-
-	for (type = probe_types; !p->info && *type; type++)
-		p->info = do_map_probe(*type, &p->map);
-	if (!p->info)
-		return -ENODEV;
-
-	p->info->dev.parent = &p->dev->dev;
-
-	return 0;
-}
-
-static void vr_nor_destroy_maps(struct vr_nor_mtd *p)
-{
-	unsigned int exp_timing_cs0;
-
-	/* write-protect the flash bank */
-	exp_timing_cs0 = readl(p->csr_base + EXP_TIMING_CS0);
-	exp_timing_cs0 &= ~TIMING_WR_EN;
-	writel(exp_timing_cs0, p->csr_base + EXP_TIMING_CS0);
-
-	/* unmap the flash window */
-	iounmap(p->map.virt);
-
-	/* unmap the csr window */
-	iounmap(p->csr_base);
-}
-
-/*
- * Initialize the map_info structure and map the flash.
- * Returns 0 on success, nonzero otherwise.
- */
-static int vr_nor_init_maps(struct vr_nor_mtd *p)
-{
-	unsigned long csr_phys, csr_len;
-	unsigned long win_phys, win_len;
-	unsigned int exp_timing_cs0;
-	int err;
-
-	csr_phys = pci_resource_start(p->dev, EXP_CSR_MBAR);
-	csr_len = pci_resource_len(p->dev, EXP_CSR_MBAR);
-	win_phys = pci_resource_start(p->dev, EXP_WIN_MBAR);
-	win_len = pci_resource_len(p->dev, EXP_WIN_MBAR);
-
-	if (!csr_phys || !csr_len || !win_phys || !win_len)
-		return -ENODEV;
-
-	if (win_len < (CS0_START + CS0_SIZE))
-		return -ENXIO;
-
-	p->csr_base = ioremap(csr_phys, csr_len);
-	if (!p->csr_base)
-		return -ENOMEM;
-
-	exp_timing_cs0 = readl(p->csr_base + EXP_TIMING_CS0);
-	if (!(exp_timing_cs0 & TIMING_CS_EN)) {
-		dev_warn(&p->dev->dev, "Expansion Bus Chip Select 0 "
-		       "is disabled.\n");
-		err = -ENODEV;
-		goto release;
-	}
-	if ((exp_timing_cs0 & TIMING_MASK) == TIMING_MASK) {
-		dev_warn(&p->dev->dev, "Expansion Bus Chip Select 0 "
-		       "is configured for maximally slow access times.\n");
-	}
-	p->map.name = DRV_NAME;
-	p->map.bankwidth = (exp_timing_cs0 & TIMING_BYTE_EN) ? 1 : 2;
-	p->map.phys = win_phys + CS0_START;
-	p->map.size = CS0_SIZE;
-	p->map.virt = ioremap(p->map.phys, p->map.size);
-	if (!p->map.virt) {
-		err = -ENOMEM;
-		goto release;
-	}
-	simple_map_init(&p->map);
-
-	/* Enable writes to flash bank */
-	exp_timing_cs0 |= TIMING_BOOT_ACCEL_DIS | TIMING_WR_EN;
-	writel(exp_timing_cs0, p->csr_base + EXP_TIMING_CS0);
-
-	return 0;
-
-      release:
-	iounmap(p->csr_base);
-	return err;
-}
-
-static const struct pci_device_id vr_nor_pci_ids[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x500D)},
-	{0,}
-};
-
-static void vr_nor_pci_remove(struct pci_dev *dev)
-{
-	struct vr_nor_mtd *p = pci_get_drvdata(dev);
-
-	vr_nor_destroy_partitions(p);
-	vr_nor_destroy_mtd_setup(p);
-	vr_nor_destroy_maps(p);
-	kfree(p);
-	pci_release_regions(dev);
-	pci_disable_device(dev);
-}
-
-static int vr_nor_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
-{
-	struct vr_nor_mtd *p = NULL;
-	unsigned int exp_timing_cs0;
-	int err;
-
-	err = pci_enable_device(dev);
-	if (err)
-		goto out;
-
-	err = pci_request_regions(dev, DRV_NAME);
-	if (err)
-		goto disable_dev;
-
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	err = -ENOMEM;
-	if (!p)
-		goto release;
-
-	p->dev = dev;
-
-	err = vr_nor_init_maps(p);
-	if (err)
-		goto release;
-
-	err = vr_nor_mtd_setup(p);
-	if (err)
-		goto destroy_maps;
-
-	err = vr_nor_init_partitions(p);
-	if (err)
-		goto destroy_mtd_setup;
-
-	pci_set_drvdata(dev, p);
-
-	return 0;
-
-      destroy_mtd_setup:
-	map_destroy(p->info);
-
-      destroy_maps:
-	/* write-protect the flash bank */
-	exp_timing_cs0 = readl(p->csr_base + EXP_TIMING_CS0);
-	exp_timing_cs0 &= ~TIMING_WR_EN;
-	writel(exp_timing_cs0, p->csr_base + EXP_TIMING_CS0);
-
-	/* unmap the flash window */
-	iounmap(p->map.virt);
-
-	/* unmap the csr window */
-	iounmap(p->csr_base);
-
-      release:
-	kfree(p);
-	pci_release_regions(dev);
-
-      disable_dev:
-	pci_disable_device(dev);
-
-      out:
-	return err;
-}
-
-static struct pci_driver vr_nor_pci_driver = {
-	.name = DRV_NAME,
-	.probe = vr_nor_pci_probe,
-	.remove = vr_nor_pci_remove,
-	.id_table = vr_nor_pci_ids,
-};
-
-module_pci_driver(vr_nor_pci_driver);
-
-MODULE_AUTHOR("Andy Lowe");
-MODULE_DESCRIPTION("MTD map driver for NOR flash on Intel Vermilion Range");
-MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(pci, vr_nor_pci_ids);
-- 
2.42.0

