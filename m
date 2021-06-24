Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CA3B3333
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B646EC62;
	Thu, 24 Jun 2021 15:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE98D6EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:57:09 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i4so3166805plt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WbwCPwkWNsZyfDNcMOTWOtrRGSDB7ukqN5rFm3/fcqM=;
 b=ST6t0XkrMRO5f6HAim2SUwLoqEUtVKc7/G35fun8pnEgrYgmaoy7jqM/CzM5ROKScW
 CaGs/CYeApWd6boKyliYyHZkZ8m75hN3AsFBcdHAPE4h8DeZNWtiFC9jFlW6gHYxntTL
 /JewURtKdZPaJv0dBLRhrI68g5ieBdJUAcjT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WbwCPwkWNsZyfDNcMOTWOtrRGSDB7ukqN5rFm3/fcqM=;
 b=OdAMu2wIR+p0mUwMQvN4rmoKSoyVO/Z9UNlTuukU/sGvkk6zZDDAo+CXczuug8F1NA
 PeSRRskjxCvpBBF77dXXtVlNbhiF7vQm/q1Ibi12WWmWPzgBACvEIhEG0tEwdf+25No8
 L0WXC0GM+o7ZuS7nhpkfrnOoCsNd0HSx4ok/qPK7ISoGYQt0A6/o0e5R5h/NiLstaE6Y
 WQhT4O4Ni6QMT5vTK6QlkNCxD1nHi4HizT5xfX/IcNGOnJWp5oxLKGqB4/JOcrkV40x8
 4fZOnxHbpYXJjw3HJgbyRkbaJnTzvq4n9vehqD+UHaKrhwTywmHsmhzjUvVmQEqL0DfC
 TMhw==
X-Gm-Message-State: AOAM531Np+X+EL+e5hy8hAEmoMIDEEkIUCNQbCis1al2NJhnRdq0Y9RP
 0V1cjTOjJAYtdF2WU002tc9rhg==
X-Google-Smtp-Source: ABdhPJwI7EWsoc2ppnuqnW/9yjxiTzSeTHN60zP/WQgGph69JaVmO4yY57xwR4157oqtL7lcnhpfUA==
X-Received: by 2002:a17:903:1043:b029:11e:7489:9bad with SMTP id
 f3-20020a1709031043b029011e74899badmr5076690plc.34.1624550229453; 
 Thu, 24 Jun 2021 08:57:09 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id x143sm3365707pfc.6.2021.06.24.08.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:57:09 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
Date: Thu, 24 Jun 2021 23:55:24 +0800
Message-Id: <20210624155526.2775863-11-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
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
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, thomas.lendacky@amd.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the initialization function to create restricted DMA pools from
matching reserved-memory nodes.

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 include/linux/swiotlb.h |  3 +-
 kernel/dma/Kconfig      | 14 ++++++++
 kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3b9454d1e498..39284ff2a6cd 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
  *		range check to see if the memory was in fact allocated by this
  *		API.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
- *		@end. This is command line adjustable via setup_io_tlb_npages.
+ *		@end. For default swiotlb, this is command line adjustable via
+ *		setup_io_tlb_npages.
  * @used:	The number of used IO TLB block.
  * @list:	The free list describing the number of free entries available
  *		from each index.
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..3e961dc39634 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -80,6 +80,20 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config DMA_RESTRICTED_POOL
+	bool "DMA Restricted Pool"
+	depends on OF && OF_RESERVED_MEM
+	select SWIOTLB
+	help
+	  This enables support for restricted DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/swiotlb.c>.
+	  If unsure, say "n".
+
 #
 # Should be selected if we can mmap non-coherent mappings to userspace.
 # The only thing that is really required is a way to set an uncached bit
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 6a7c6e30eb4b..3baf49c9b766 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -39,6 +39,13 @@
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#endif
 
 #include <asm/io.h>
 #include <asm/dma.h>
@@ -737,4 +744,73 @@ bool swiotlb_free(struct device *dev, struct page *page, size_t size)
 	return true;
 }
 
+static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct io_tlb_mem *mem = rmem->priv;
+	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+
+	/*
+	 * Since multiple devices can share the same pool, the private data,
+	 * io_tlb_mem struct, will be initialized by the first device attached
+	 * to it.
+	 */
+	if (!mem) {
+		mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
+		if (!mem)
+			return -ENOMEM;
+
+		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
+				     rmem->size >> PAGE_SHIFT);
+		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
+		mem->force_bounce = true;
+		mem->for_alloc = true;
+
+		rmem->priv = mem;
+
+		if (IS_ENABLED(CONFIG_DEBUG_FS)) {
+			mem->debugfs =
+				debugfs_create_dir(rmem->name, debugfs_dir);
+			swiotlb_create_debugfs_files(mem);
+		}
+	}
+
+	dev->dma_io_tlb_mem = mem;
+
+	return 0;
+}
+
+static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
+					struct device *dev)
+{
+	dev->dma_io_tlb_mem = io_tlb_default_mem;
+}
+
+static const struct reserved_mem_ops rmem_swiotlb_ops = {
+	.device_init = rmem_swiotlb_device_init,
+	.device_release = rmem_swiotlb_device_release,
+};
+
+static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+
+	if (of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
+		pr_err("Restricted DMA pool must be accessible within the linear mapping.");
+		return -EINVAL;
+	}
+
+	rmem->ops = &rmem_swiotlb_ops;
+	pr_info("Reserved memory: created restricted DMA pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
 #endif /* CONFIG_DMA_RESTRICTED_POOL */
-- 
2.32.0.288.g62a8d224e6-goog

