Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D153A7F6E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 15:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE8F6E314;
	Tue, 15 Jun 2021 13:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB736E314
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 13:27:57 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id g4so11811636pjk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PL5BpOXQsaKo+GbzXNjJkzxAIqTXayil+SaEElw08ww=;
 b=gXf3FI+MKQU9QcRMF4+GEgHu9Yr6jqOOYhv/2BQubzcCzxA9yug58HjuKeTKJqpiIm
 xMh+J75/TSxDUNIZVLMAe9Xc3O6yu0HsySKJFmfbZ3ERdlsu5haZ2zNpnwIp0kTsy19X
 R0zXSGZvUZd7EQlrbLKK/nNYd0EAZ9VG3m5/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PL5BpOXQsaKo+GbzXNjJkzxAIqTXayil+SaEElw08ww=;
 b=QR3thBcRRwK/7usb/2p/KgfOKm4ettLk77PfyoOGnLqjioGSVTkrFT/JxAEHcTOnmK
 kmN/Zy00tMTisSstAZWBXNvPkcPER4l09qBMlsi6ac8cBMeoP0c5lZk/XnIeDq3noUAJ
 NikrPZaFHxZrCTEdHzC7g8yaC15TjRILdUNazCavSL9MvIIBV27WCPvbHWfGY9PQ0dTb
 31/UHCw7v6Gqb38szSkXC1/29+xw0CVhKailxjXpCbNBfHzo+eLKJ+EaBxdLhfIiBEKE
 dO26ceCKuFTMtrb+m2c+txOCyaPHeqU/h3c/hEabfXXqOF6EU8vAysfScTgyFKdOHUqO
 xGlg==
X-Gm-Message-State: AOAM5310dG9/+uylz3/AE+XhVL6vv64LFKDOTXIUZPzhT9qncZG+e+IH
 18+vcX6EZIjPv8JSizlb/n9kVw==
X-Google-Smtp-Source: ABdhPJxRaXtg70rcLF2bfdnN2wxG8oMnLK9/SnXHkatnp219vaood2+iHVkIasptG0LQd+cbZ0cLtQ==
X-Received: by 2002:a17:90b:4c52:: with SMTP id
 np18mr4976518pjb.186.1623763677411; 
 Tue, 15 Jun 2021 06:27:57 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:1846:5274:e444:139e])
 by smtp.gmail.com with UTF8SMTPSA id q4sm16299955pfh.18.2021.06.15.06.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:27:56 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v10 04/12] swiotlb: Update is_swiotlb_buffer to add a struct
 device argument
Date: Tue, 15 Jun 2021 21:27:03 +0800
Message-Id: <20210615132711.553451-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210615132711.553451-1-tientzu@chromium.org>
References: <20210615132711.553451-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update is_swiotlb_buffer to add a struct device argument. This will be
useful later to allow for different pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/iommu/dma-iommu.c | 12 ++++++------
 drivers/xen/swiotlb-xen.c |  2 +-
 include/linux/swiotlb.h   |  7 ++++---
 kernel/dma/direct.c       |  6 +++---
 kernel/dma/direct.h       |  6 +++---
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 5d96fcc45fec..1a6a08908245 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -506,7 +506,7 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
 
 	__iommu_dma_unmap(dev, dma_addr, size);
 
-	if (unlikely(is_swiotlb_buffer(phys)))
+	if (unlikely(is_swiotlb_buffer(dev, phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 
@@ -577,7 +577,7 @@ static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
 	}
 
 	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
-	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(phys))
+	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
 		swiotlb_tbl_unmap_single(dev, phys, org_size, dir, attrs);
 	return iova;
 }
@@ -783,7 +783,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu(phys, size, dir);
 
-	if (is_swiotlb_buffer(phys))
+	if (is_swiotlb_buffer(dev, phys))
 		swiotlb_sync_single_for_cpu(dev, phys, size, dir);
 }
 
@@ -796,7 +796,7 @@ static void iommu_dma_sync_single_for_device(struct device *dev,
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-	if (is_swiotlb_buffer(phys))
+	if (is_swiotlb_buffer(dev, phys))
 		swiotlb_sync_single_for_device(dev, phys, size, dir);
 
 	if (!dev_is_dma_coherent(dev))
@@ -817,7 +817,7 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
 
-		if (is_swiotlb_buffer(sg_phys(sg)))
+		if (is_swiotlb_buffer(dev, sg_phys(sg)))
 			swiotlb_sync_single_for_cpu(dev, sg_phys(sg),
 						    sg->length, dir);
 	}
@@ -834,7 +834,7 @@ static void iommu_dma_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sgl, sg, nelems, i) {
-		if (is_swiotlb_buffer(sg_phys(sg)))
+		if (is_swiotlb_buffer(dev, sg_phys(sg)))
 			swiotlb_sync_single_for_device(dev, sg_phys(sg),
 						       sg->length, dir);
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 24d11861ac7d..0c4fb34f11ab 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -100,7 +100,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
 	if (pfn_valid(PFN_DOWN(paddr)))
-		return is_swiotlb_buffer(paddr);
+		return is_swiotlb_buffer(dev, paddr);
 	return 0;
 }
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 216854a5e513..d1f3d95881cd 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_SWIOTLB_H
 #define __LINUX_SWIOTLB_H
 
+#include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -101,9 +102,9 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
-static inline bool is_swiotlb_buffer(phys_addr_t paddr)
+static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
@@ -115,7 +116,7 @@ bool is_swiotlb_active(void);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
-static inline bool is_swiotlb_buffer(phys_addr_t paddr)
+static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f737e3347059..84c9feb5474a 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -343,7 +343,7 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (unlikely(is_swiotlb_buffer(paddr)))
+		if (unlikely(is_swiotlb_buffer(dev, paddr)))
 			swiotlb_sync_single_for_device(dev, paddr, sg->length,
 						       dir);
 
@@ -369,7 +369,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
 
-		if (unlikely(is_swiotlb_buffer(paddr)))
+		if (unlikely(is_swiotlb_buffer(dev, paddr)))
 			swiotlb_sync_single_for_cpu(dev, paddr, sg->length,
 						    dir);
 
@@ -504,7 +504,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr)
 {
 	return !dev_is_dma_coherent(dev) ||
-		is_swiotlb_buffer(dma_to_phys(dev, dma_addr));
+	       is_swiotlb_buffer(dev, dma_to_phys(dev, dma_addr));
 }
 
 /**
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 50afc05b6f1d..13e9e7158d94 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -56,7 +56,7 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
-	if (unlikely(is_swiotlb_buffer(paddr)))
+	if (unlikely(is_swiotlb_buffer(dev, paddr)))
 		swiotlb_sync_single_for_device(dev, paddr, size, dir);
 
 	if (!dev_is_dma_coherent(dev))
@@ -73,7 +73,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		arch_sync_dma_for_cpu_all();
 	}
 
-	if (unlikely(is_swiotlb_buffer(paddr)))
+	if (unlikely(is_swiotlb_buffer(dev, paddr)))
 		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
 
 	if (dir == DMA_FROM_DEVICE)
@@ -113,7 +113,7 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
-	if (unlikely(is_swiotlb_buffer(phys)))
+	if (unlikely(is_swiotlb_buffer(dev, phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 #endif /* _KERNEL_DMA_DIRECT_H */
-- 
2.32.0.272.g935e593368-goog

