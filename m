Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E58192D7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57910E24E;
	Tue, 19 Dec 2023 22:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF33E10E267
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52D77614E1;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79DABC116B2;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=UB1EWouMkPvbJXRw7Maaf3UmeM7vwSYlSrzpC90jDq8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=brfgQFpt+jxnTxK6GQpbXKutNle131V8tJZzA7e3bjKM8mjnD9YIVHewSdo2PHl0I
 ZjPJgn2ELJJ+b2gKhR2rxujXCB2YCvroPGL5A8LSxivVh2/++3qw+UbKPvC2W9PKTY
 4tIG6dNDmxbtjkH+q9QneFTm6/I0WtY+LDtb23Sl/d8kyrOl+1cLsUw2/BNE4C1GaY
 mxvkoinx6EP4ZgdmkIIDFPDrhNWtRH66f1mU08n3O86fw4l3RSvcXb8j/xRX1ix7FE
 w0WWQlDEziRNbYLq5KBj/95mEzzPZfgj0HXqInISdjMiJ5dliZ253mNok38CyK7TW4
 mKviq5RLHmPog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6A71FC46CD8;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:26 +0100
Subject: [PATCH 21/27] sparc32: Drop unused iommu support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-21-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=21784;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=PD7kaCb8qP6VRW5/Lnvuu2MI0m+xNGJym35Bpgc5CXI=; =?utf-8?q?b=3DO+TG5SrRJTL1?=
 =?utf-8?q?qnYo4kokm2BxcVRJvjN/NxIEx96zcmeX8Q+YiSV3tM1t5knEwxA9CeWREscMdZqn?=
 0tQ+gt2rB+n4k3fmP+9nmowGi6GYZkULiZ87wmX5ajzBSGJFgGtc
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

LEON do not have any iommu support - drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/iommu.h    |   2 -
 arch/sparc/include/asm/iommu_32.h | 122 -----------
 arch/sparc/kernel/ioport.c        |   1 -
 arch/sparc/mm/Makefile            |   2 +-
 arch/sparc/mm/iommu.c             | 420 --------------------------------------
 arch/sparc/mm/mm_32.h             |   3 -
 arch/sparc/mm/srmmu.c             |   3 -
 7 files changed, 1 insertion(+), 552 deletions(-)

diff --git a/arch/sparc/include/asm/iommu.h b/arch/sparc/include/asm/iommu.h
index 37935cb34865..ea07526ff476 100644
--- a/arch/sparc/include/asm/iommu.h
+++ b/arch/sparc/include/asm/iommu.h
@@ -3,7 +3,5 @@
 #define ___ASM_SPARC_IOMMU_H
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/iommu_64.h>
-#else
-#include <asm/iommu_32.h>
 #endif
 #endif
diff --git a/arch/sparc/include/asm/iommu_32.h b/arch/sparc/include/asm/iommu_32.h
deleted file mode 100644
index af51cd5ea3c1..000000000000
--- a/arch/sparc/include/asm/iommu_32.h
+++ /dev/null
@@ -1,122 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* iommu.h: Definitions for the sun4m IOMMU.
- *
- * Copyright (C) 1996 David S. Miller (davem@caip.rutgers.edu)
- */
-#ifndef _SPARC_IOMMU_H
-#define _SPARC_IOMMU_H
-
-#include <asm/page.h>
-#include <asm/bitext.h>
-
-/* The iommu handles all virtual to physical address translations
- * that occur between the SBUS and physical memory.  Access by
- * the cpu to IO registers and similar go over the mbus so are
- * translated by the on chip SRMMU.  The iommu and the srmmu do
- * not need to have the same translations at all, in fact most
- * of the time the translations they handle are a disjunct set.
- * Basically the iommu handles all dvma sbus activity.
- */
-
-/* The IOMMU registers occupy three pages in IO space. */
-struct iommu_regs {
-	/* First page */
-	volatile unsigned long control;    /* IOMMU control */
-	volatile unsigned long base;       /* Physical base of iopte page table */
-	volatile unsigned long _unused1[3];
-	volatile unsigned long tlbflush;   /* write only */
-	volatile unsigned long pageflush;  /* write only */
-	volatile unsigned long _unused2[1017];
-	/* Second page */
-	volatile unsigned long afsr;       /* Async-fault status register */
-	volatile unsigned long afar;       /* Async-fault physical address */
-	volatile unsigned long _unused3[2];
-	volatile unsigned long sbuscfg0;   /* SBUS configuration registers, per-slot */
-	volatile unsigned long sbuscfg1;
-	volatile unsigned long sbuscfg2;
-	volatile unsigned long sbuscfg3;
-	volatile unsigned long mfsr;       /* Memory-fault status register */
-	volatile unsigned long mfar;       /* Memory-fault physical address */
-	volatile unsigned long _unused4[1014];
-	/* Third page */
-	volatile unsigned long mid;        /* IOMMU module-id */
-};
-
-#define IOMMU_CTRL_IMPL     0xf0000000 /* Implementation */
-#define IOMMU_CTRL_VERS     0x0f000000 /* Version */
-#define IOMMU_CTRL_RNGE     0x0000001c /* Mapping RANGE */
-#define IOMMU_RNGE_16MB     0x00000000 /* 0xff000000 -> 0xffffffff */
-#define IOMMU_RNGE_32MB     0x00000004 /* 0xfe000000 -> 0xffffffff */
-#define IOMMU_RNGE_64MB     0x00000008 /* 0xfc000000 -> 0xffffffff */
-#define IOMMU_RNGE_128MB    0x0000000c /* 0xf8000000 -> 0xffffffff */
-#define IOMMU_RNGE_256MB    0x00000010 /* 0xf0000000 -> 0xffffffff */
-#define IOMMU_RNGE_512MB    0x00000014 /* 0xe0000000 -> 0xffffffff */
-#define IOMMU_RNGE_1GB      0x00000018 /* 0xc0000000 -> 0xffffffff */
-#define IOMMU_RNGE_2GB      0x0000001c /* 0x80000000 -> 0xffffffff */
-#define IOMMU_CTRL_ENAB     0x00000001 /* IOMMU Enable */
-
-#define IOMMU_AFSR_ERR      0x80000000 /* LE, TO, or BE asserted */
-#define IOMMU_AFSR_LE       0x40000000 /* SBUS reports error after transaction */
-#define IOMMU_AFSR_TO       0x20000000 /* Write access took more than 12.8 us. */
-#define IOMMU_AFSR_BE       0x10000000 /* Write access received error acknowledge */
-#define IOMMU_AFSR_SIZE     0x0e000000 /* Size of transaction causing error */
-#define IOMMU_AFSR_S        0x01000000 /* Sparc was in supervisor mode */
-#define IOMMU_AFSR_RESV     0x00f00000 /* Reserver, forced to 0x8 by hardware */
-#define IOMMU_AFSR_ME       0x00080000 /* Multiple errors occurred */
-#define IOMMU_AFSR_RD       0x00040000 /* A read operation was in progress */
-#define IOMMU_AFSR_FAV      0x00020000 /* IOMMU afar has valid contents */
-
-#define IOMMU_SBCFG_SAB30   0x00010000 /* Phys-address bit 30 when bypass enabled */
-#define IOMMU_SBCFG_BA16    0x00000004 /* Slave supports 16 byte bursts */
-#define IOMMU_SBCFG_BA8     0x00000002 /* Slave supports 8 byte bursts */
-#define IOMMU_SBCFG_BYPASS  0x00000001 /* Bypass IOMMU, treat all addresses
-					  produced by this device as pure
-					  physical. */
-
-#define IOMMU_MFSR_ERR      0x80000000 /* One or more of PERR1 or PERR0 */
-#define IOMMU_MFSR_S        0x01000000 /* Sparc was in supervisor mode */
-#define IOMMU_MFSR_CPU      0x00800000 /* CPU transaction caused parity error */
-#define IOMMU_MFSR_ME       0x00080000 /* Multiple parity errors occurred */
-#define IOMMU_MFSR_PERR     0x00006000 /* high bit indicates parity error occurred
-					  on the even word of the access, low bit
-					  indicated odd word caused the parity error */
-#define IOMMU_MFSR_BM       0x00001000 /* Error occurred while in boot mode */
-#define IOMMU_MFSR_C        0x00000800 /* Address causing error was marked cacheable */
-#define IOMMU_MFSR_RTYP     0x000000f0 /* Memory request transaction type */
-
-#define IOMMU_MID_SBAE      0x001f0000 /* SBus arbitration enable */
-#define IOMMU_MID_SE        0x00100000 /* Enables SCSI/ETHERNET arbitration */
-#define IOMMU_MID_SB3       0x00080000 /* Enable SBUS device 3 arbitration */
-#define IOMMU_MID_SB2       0x00040000 /* Enable SBUS device 2 arbitration */
-#define IOMMU_MID_SB1       0x00020000 /* Enable SBUS device 1 arbitration */
-#define IOMMU_MID_SB0       0x00010000 /* Enable SBUS device 0 arbitration */
-#define IOMMU_MID_MID       0x0000000f /* Module-id, hardcoded to 0x8 */
-
-/* The format of an iopte in the page tables */
-#define IOPTE_PAGE          0x07ffff00 /* Physical page number (PA[30:12]) */
-#define IOPTE_CACHE         0x00000080 /* Cached (in vme IOCACHE or Viking/MXCC) */
-#define IOPTE_WRITE         0x00000004 /* Writeable */
-#define IOPTE_VALID         0x00000002 /* IOPTE is valid */
-#define IOPTE_WAZ           0x00000001 /* Write as zeros */
-
-struct iommu_struct {
-	struct iommu_regs __iomem *regs;
-	iopte_t *page_table;
-	/* For convenience */
-	unsigned long start; /* First managed virtual address */
-	unsigned long end;   /* Last managed virtual address */
-
-	struct bit_map usemap;
-};
-
-static inline void iommu_invalidate(struct iommu_regs __iomem *regs)
-{
-	sbus_writel(0, &regs->tlbflush);
-}
-
-static inline void iommu_invalidate_page(struct iommu_regs __iomem *regs, unsigned long ba)
-{
-	sbus_writel(ba & PAGE_MASK, &regs->pageflush);
-}
-
-#endif /* !(_SPARC_IOMMU_H) */
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 745579a40785..9c4c72775274 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -48,7 +48,6 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/dma.h>
-#include <asm/iommu.h>
 #include <asm/leon.h>
 
 static void __iomem *_sparc_ioremap(struct resource *res, u32 bus, u32 pa, int sz);
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index ee33053b170a..b6252a3947c5 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -8,7 +8,7 @@ ccflags-y := -Werror
 obj-$(CONFIG_SPARC64)   += ultra.o tlb.o tsb.o
 obj-y                   += fault_$(BITS).o
 obj-y                   += init_$(BITS).o
-obj-$(CONFIG_SPARC32)   += srmmu.o iommu.o
+obj-$(CONFIG_SPARC32)   += srmmu.o
 obj-$(CONFIG_SPARC32)   += leon_mm.o
 
 # Only used by sparc64
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
deleted file mode 100644
index 482e08df7bad..000000000000
--- a/arch/sparc/mm/iommu.c
+++ /dev/null
@@ -1,420 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * iommu.c:  IOMMU specific routines for memory management.
- *
- * Copyright (C) 1995 David S. Miller  (davem@caip.rutgers.edu)
- * Copyright (C) 1995,2002 Pete Zaitcev     (zaitcev@yahoo.com)
- * Copyright (C) 1996 Eddie C. Dost    (ecd@skynet.be)
- * Copyright (C) 1997,1998 Jakub Jelinek    (jj@sunsite.mff.cuni.cz)
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/dma-map-ops.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
-
-#include <asm/io.h>
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
-#include <asm/bitext.h>
-#include <asm/iommu.h>
-#include <asm/dma.h>
-
-#include "mm_32.h"
-
-/*
- * This can be sized dynamically, but we will do this
- * only when we have a guidance about actual I/O pressures.
- */
-#define IOMMU_RNGE	IOMMU_RNGE_256MB
-#define IOMMU_START	0xF0000000
-#define IOMMU_WINSIZE	(256*1024*1024U)
-#define IOMMU_NPTES	(IOMMU_WINSIZE/PAGE_SIZE)	/* 64K PTEs, 256KB */
-#define IOMMU_ORDER	6				/* 4096 * (1<<6) */
-
-/*
- * Values precomputed according to CPU type.
- */
-static unsigned int ioperm_noc;		/* Consistent mapping iopte flags */
-static pgprot_t dvma_prot;		/* Consistent mapping pte flags */
-
-#define IOPERM        (IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID)
-#define MKIOPTE(pfn, perm) (((((pfn)<<8) & IOPTE_PAGE) | (perm)) & ~IOPTE_WAZ)
-
-static const struct dma_map_ops sbus_iommu_dma_gflush_ops;
-static const struct dma_map_ops sbus_iommu_dma_pflush_ops;
-
-static void __init sbus_iommu_init(struct platform_device *op)
-{
-	struct iommu_struct *iommu;
-	unsigned int impl, vers;
-	unsigned long *bitmap;
-	unsigned long control;
-	unsigned long base;
-	unsigned long tmp;
-
-	iommu = kmalloc(sizeof(struct iommu_struct), GFP_KERNEL);
-	if (!iommu) {
-		prom_printf("Unable to allocate iommu structure\n");
-		prom_halt();
-	}
-
-	iommu->regs = of_ioremap(&op->resource[0], 0, PAGE_SIZE * 3,
-				 "iommu_regs");
-	if (!iommu->regs) {
-		prom_printf("Cannot map IOMMU registers\n");
-		prom_halt();
-	}
-
-	control = sbus_readl(&iommu->regs->control);
-	impl = (control & IOMMU_CTRL_IMPL) >> 28;
-	vers = (control & IOMMU_CTRL_VERS) >> 24;
-	control &= ~(IOMMU_CTRL_RNGE);
-	control |= (IOMMU_RNGE_256MB | IOMMU_CTRL_ENAB);
-	sbus_writel(control, &iommu->regs->control);
-
-	iommu_invalidate(iommu->regs);
-	iommu->start = IOMMU_START;
-	iommu->end = 0xffffffff;
-
-	/* Allocate IOMMU page table */
-	/* Stupid alignment constraints give me a headache. 
-	   We need 256K or 512K or 1M or 2M area aligned to
-           its size and current gfp will fortunately give
-           it to us. */
-        tmp = __get_free_pages(GFP_KERNEL, IOMMU_ORDER);
-	if (!tmp) {
-		prom_printf("Unable to allocate iommu table [0x%lx]\n",
-			    IOMMU_NPTES * sizeof(iopte_t));
-		prom_halt();
-	}
-	iommu->page_table = (iopte_t *)tmp;
-
-	/* Initialize new table. */
-	memset(iommu->page_table, 0, IOMMU_NPTES*sizeof(iopte_t));
-	flush_cache_all();
-	flush_tlb_all();
-
-	base = __pa((unsigned long)iommu->page_table) >> 4;
-	sbus_writel(base, &iommu->regs->base);
-	iommu_invalidate(iommu->regs);
-
-	bitmap = kmalloc(IOMMU_NPTES>>3, GFP_KERNEL);
-	if (!bitmap) {
-		prom_printf("Unable to allocate iommu bitmap [%d]\n",
-			    (int)(IOMMU_NPTES>>3));
-		prom_halt();
-	}
-	bit_map_init(&iommu->usemap, bitmap, IOMMU_NPTES);
-	iommu->usemap.num_colors = 1;
-
-	printk(KERN_INFO "IOMMU: impl %d vers %d table 0x%p[%d B] map [%d b]\n",
-	       impl, vers, iommu->page_table,
-	       (int)(IOMMU_NPTES*sizeof(iopte_t)), (int)IOMMU_NPTES);
-
-	op->dev.archdata.iommu = iommu;
-
-	if (flush_page_for_dma_global)
-		op->dev.dma_ops = &sbus_iommu_dma_gflush_ops;
-	 else
-		op->dev.dma_ops = &sbus_iommu_dma_pflush_ops;
-}
-
-static int __init iommu_init(void)
-{
-	struct device_node *dp;
-
-	for_each_node_by_name(dp, "iommu") {
-		struct platform_device *op = of_find_device_by_node(dp);
-
-		sbus_iommu_init(op);
-		of_propagate_archdata(op);
-	}
-
-	return 0;
-}
-
-subsys_initcall(iommu_init);
-
-/* Flush the iotlb entries to ram. */
-/* This could be better if we didn't have to flush whole pages. */
-static void iommu_flush_iotlb(iopte_t *iopte, unsigned int niopte)
-{
-	unsigned long start;
-	unsigned long end;
-
-	start = (unsigned long)iopte;
-	end = PAGE_ALIGN(start + niopte*sizeof(iopte_t));
-	start &= PAGE_MASK;
-	while(start < end) {
-		__flush_page_to_ram(start);
-		start += PAGE_SIZE;
-	}
-}
-
-static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, bool per_page_flush)
-{
-	struct iommu_struct *iommu = dev->archdata.iommu;
-	phys_addr_t paddr = page_to_phys(page) + offset;
-	unsigned long off = paddr & ~PAGE_MASK;
-	unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
-	unsigned long pfn = __phys_to_pfn(paddr);
-	unsigned int busa, busa0;
-	iopte_t *iopte, *iopte0;
-	int ioptex, i;
-
-	/* XXX So what is maxphys for us and how do drivers know it? */
-	if (!len || len > 256 * 1024)
-		return DMA_MAPPING_ERROR;
-
-	/*
-	 * We expect unmapped highmem pages to be not in the cache.
-	 * XXX Is this a good assumption?
-	 * XXX What if someone else unmaps it here and races us?
-	 */
-	if (per_page_flush && !PageHighMem(page)) {
-		unsigned long vaddr, p;
-
-		vaddr = (unsigned long)page_address(page) + offset;
-		for (p = vaddr & PAGE_MASK; p < vaddr + len; p += PAGE_SIZE)
-			flush_page_for_dma(p);
-	}
-
-	/* page color = pfn of page */
-	ioptex = bit_map_string_get(&iommu->usemap, npages, pfn);
-	if (ioptex < 0)
-		panic("iommu out");
-	busa0 = iommu->start + (ioptex << PAGE_SHIFT);
-	iopte0 = &iommu->page_table[ioptex];
-
-	busa = busa0;
-	iopte = iopte0;
-	for (i = 0; i < npages; i++) {
-		iopte_val(*iopte) = MKIOPTE(pfn, IOPERM);
-		iommu_invalidate_page(iommu->regs, busa);
-		busa += PAGE_SIZE;
-		iopte++;
-		pfn++;
-	}
-
-	iommu_flush_iotlb(iopte0, npages);
-	return busa0 + off;
-}
-
-static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	flush_page_for_dma(0);
-	return __sbus_iommu_map_page(dev, page, offset, len, false);
-}
-
-static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	return __sbus_iommu_map_page(dev, page, offset, len, true);
-}
-
-static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs,
-		bool per_page_flush)
-{
-	struct scatterlist *sg;
-	int j;
-
-	for_each_sg(sgl, sg, nents, j) {
-		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, per_page_flush);
-		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return -EIO;
-		sg->dma_length = sg->length;
-	}
-
-	return nents;
-}
-
-static int sbus_iommu_map_sg_gflush(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	flush_page_for_dma(0);
-	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, false);
-}
-
-static int sbus_iommu_map_sg_pflush(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
-}
-
-static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_addr,
-		size_t len, enum dma_data_direction dir, unsigned long attrs)
-{
-	struct iommu_struct *iommu = dev->archdata.iommu;
-	unsigned int busa = dma_addr & PAGE_MASK;
-	unsigned long off = dma_addr & ~PAGE_MASK;
-	unsigned int npages = (off + len + PAGE_SIZE-1) >> PAGE_SHIFT;
-	unsigned int ioptex = (busa - iommu->start) >> PAGE_SHIFT;
-	unsigned int i;
-
-	BUG_ON(busa < iommu->start);
-	for (i = 0; i < npages; i++) {
-		iopte_val(iommu->page_table[ioptex + i]) = 0;
-		iommu_invalidate_page(iommu->regs, busa);
-		busa += PAGE_SIZE;
-	}
-	bit_map_clear(&iommu->usemap, ioptex, npages);
-}
-
-static void sbus_iommu_unmap_sg(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	struct scatterlist *sg;
-	int i;
-
-	for_each_sg(sgl, sg, nents, i) {
-		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
-				attrs);
-		sg->dma_address = 0x21212121;
-	}
-}
-
-#ifdef CONFIG_SBUS
-static void *sbus_iommu_alloc(struct device *dev, size_t len,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	struct iommu_struct *iommu = dev->archdata.iommu;
-	unsigned long va, addr, page, end, ret;
-	iopte_t *iopte = iommu->page_table;
-	iopte_t *first;
-	int ioptex;
-
-	/* XXX So what is maxphys for us and how do drivers know it? */
-	if (!len || len > 256 * 1024)
-		return NULL;
-
-	len = PAGE_ALIGN(len);
-	va = __get_free_pages(gfp | __GFP_ZERO, get_order(len));
-	if (va == 0)
-		return NULL;
-
-	addr = ret = sparc_dma_alloc_resource(dev, len);
-	if (!addr)
-		goto out_free_pages;
-
-	BUG_ON((va & ~PAGE_MASK) != 0);
-	BUG_ON((addr & ~PAGE_MASK) != 0);
-	BUG_ON((len & ~PAGE_MASK) != 0);
-
-	/* page color = physical address */
-	ioptex = bit_map_string_get(&iommu->usemap, len >> PAGE_SHIFT,
-		addr >> PAGE_SHIFT);
-	if (ioptex < 0)
-		panic("iommu out");
-
-	iopte += ioptex;
-	first = iopte;
-	end = addr + len;
-	while(addr < end) {
-		page = va;
-		{
-			pmd_t *pmdp;
-			pte_t *ptep;
-
-			__flush_page_to_ram(page);
-
-			pmdp = pmd_off_k(addr);
-			ptep = pte_offset_kernel(pmdp, addr);
-
-			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
-		}
-		iopte_val(*iopte++) =
-		    MKIOPTE(page_to_pfn(virt_to_page(page)), ioperm_noc);
-		addr += PAGE_SIZE;
-		va += PAGE_SIZE;
-	}
-	/* P3: why do we need this?
-	 *
-	 * DAVEM: Because there are several aspects, none of which
-	 *        are handled by a single interface.  Some cpus are
-	 *        completely not I/O DMA coherent, and some have
-	 *        virtually indexed caches.  The driver DMA flushing
-	 *        methods handle the former case, but here during
-	 *        IOMMU page table modifications, and usage of non-cacheable
-	 *        cpu mappings of pages potentially in the cpu caches, we have
-	 *        to handle the latter case as well.
-	 */
-	flush_cache_all();
-	iommu_flush_iotlb(first, len >> PAGE_SHIFT);
-	flush_tlb_all();
-	iommu_invalidate(iommu->regs);
-
-	*dma_handle = iommu->start + (ioptex << PAGE_SHIFT);
-	return (void *)ret;
-
-out_free_pages:
-	free_pages(va, get_order(len));
-	return NULL;
-}
-
-static void sbus_iommu_free(struct device *dev, size_t len, void *cpu_addr,
-			       dma_addr_t busa, unsigned long attrs)
-{
-	struct iommu_struct *iommu = dev->archdata.iommu;
-	iopte_t *iopte = iommu->page_table;
-	struct page *page = virt_to_page(cpu_addr);
-	int ioptex = (busa - iommu->start) >> PAGE_SHIFT;
-	unsigned long end;
-
-	if (!sparc_dma_free_resource(cpu_addr, len))
-		return;
-
-	BUG_ON((busa & ~PAGE_MASK) != 0);
-	BUG_ON((len & ~PAGE_MASK) != 0);
-
-	iopte += ioptex;
-	end = busa + len;
-	while (busa < end) {
-		iopte_val(*iopte++) = 0;
-		busa += PAGE_SIZE;
-	}
-	flush_tlb_all();
-	iommu_invalidate(iommu->regs);
-	bit_map_clear(&iommu->usemap, ioptex, len >> PAGE_SHIFT);
-
-	__free_pages(page, get_order(len));
-}
-#endif
-
-static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
-#ifdef CONFIG_SBUS
-	.alloc			= sbus_iommu_alloc,
-	.free			= sbus_iommu_free,
-#endif
-	.map_page		= sbus_iommu_map_page_gflush,
-	.unmap_page		= sbus_iommu_unmap_page,
-	.map_sg			= sbus_iommu_map_sg_gflush,
-	.unmap_sg		= sbus_iommu_unmap_sg,
-};
-
-static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
-#ifdef CONFIG_SBUS
-	.alloc			= sbus_iommu_alloc,
-	.free			= sbus_iommu_free,
-#endif
-	.map_page		= sbus_iommu_map_page_pflush,
-	.unmap_page		= sbus_iommu_unmap_page,
-	.map_sg			= sbus_iommu_map_sg_pflush,
-	.unmap_sg		= sbus_iommu_unmap_sg,
-};
-
-void __init ld_mmu_iommu(void)
-{
-	dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
-	ioperm_noc = IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID;
-}
diff --git a/arch/sparc/mm/mm_32.h b/arch/sparc/mm/mm_32.h
index 2c83b8ce742d..102e6a5162b0 100644
--- a/arch/sparc/mm/mm_32.h
+++ b/arch/sparc/mm/mm_32.h
@@ -14,6 +14,3 @@ extern int flush_page_for_dma_global;
 extern void (*poke_srmmu)(void);
 
 void __init srmmu_paging_init(void);
-
-/* iommu.c */
-void ld_mmu_iommu(void);
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 949247a6896b..dab71cd3fdb2 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1023,10 +1023,7 @@ void __init load_mmu(void)
 	/* It really is const after this point. */
 	sparc32_cachetlb_ops = (const struct sparc32_cachetlb_ops *)
 		&smp_cachetlb_ops;
-#endif
 
-	ld_mmu_iommu();
-#ifdef CONFIG_SMP
 	leon_init_smp();
 #endif
 }

-- 
2.34.1

