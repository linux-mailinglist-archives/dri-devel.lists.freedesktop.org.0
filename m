Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED1377FF1
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6186E479;
	Mon, 10 May 2021 09:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C256E479
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:51:14 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id gj14so9441706pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N3P9GLK7vHKhYVQQtJseEAxm9BpujcOrU5/c0rsEVEk=;
 b=Y7aOu5/1TjGJ39Q6KlGygdgKwH9kbvC5j2KTJY6W4XTdOExKpGYjoeXyBJiXgd/KYk
 KzSpnP+ON6ZMnZKtG68AQfgatZrpSEM8rt3qhHBX67wSb4snRTMym5W+JAqIFz3C1rDu
 rEn+A4sHCgc1HrIPZtrVf2hBqqnA1o60c7EF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N3P9GLK7vHKhYVQQtJseEAxm9BpujcOrU5/c0rsEVEk=;
 b=POA/wy8aM+W8K993Yi7b7T6HrDIn5XUGuVf93ZaFl+/n3beatVJrznb3ZA6vzzGBhV
 p0/bffG73Z8GJ6MP+RoZbBFwHSw/VgMIRJOj3WmA5SgVUOQ9j2ljG7+no/lHhGHbOXvh
 gbl0Yvzw7maiJZET77xYuiGUcDDkzla7sisFpVrN33kDzJ5udfE5J/+BBBfZTxBO9fzt
 +oD2z2j7qGpjtw0Om1cZgJcqRUsGJYkDrORaz7Unn1ikfILbvmEIlRg0frzwf0D0YDqV
 sOnWYAtxdPoB6Sf2iwZ3GcYuKjOZzpqgpE6ArUwo41EXhM4UdvPWBb10yRSGUQfcXB0A
 6ZeA==
X-Gm-Message-State: AOAM532Xl+dTqB3B3xTFlFPPlNSYrhC+naGjWP8ep29D7Ln8XRa0uKuu
 rjU4SRxk1od4h/7J9aV6BE09Ug==
X-Google-Smtp-Source: ABdhPJx/+mqX+1PPw1d6WrMopD8tcfP0qxrVaW6dh7H0TOwQsbO/ZVrG7imWQ0Lmzh0hiACiE2GhCg==
X-Received: by 2002:a17:902:f203:b029:ee:e32f:2a28 with SMTP id
 m3-20020a170902f203b02900eee32f2a28mr22959818plc.45.1620640274038; 
 Mon, 10 May 2021 02:51:14 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id 85sm10570175pge.92.2021.05.10.02.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:51:13 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 04/15] swiotlb: Add restricted DMA pool initialization
Date: Mon, 10 May 2021 17:50:15 +0800
Message-Id: <20210510095026.3477496-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510095026.3477496-1-tientzu@chromium.org>
References: <20210510095026.3477496-1-tientzu@chromium.org>
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
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the initialization function to create restricted DMA pools from
matching reserved-memory nodes.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/device.h  |  4 +++
 include/linux/swiotlb.h |  3 +-
 kernel/dma/swiotlb.c    | 79 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 38a2071cf776..4987608ea4ff 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -416,6 +416,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
+ * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -521,6 +522,9 @@ struct device {
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
+#endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	struct io_tlb_mem *dma_io_tlb_mem;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 216854a5e513..03ad6e3b4056 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
  *		range check to see if the memory was in fact allocated by this
  *		API.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
- *		@end. This is command line adjustable via setup_io_tlb_npages.
+ *		@end. For default swiotlb, this is command line adjustable via
+ *		setup_io_tlb_npages.
  * @used:	The number of used IO TLB block.
  * @list:	The free list describing the number of free entries available
  *		from each index.
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 858475bd6923..4ea027b75013 100644
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
@@ -687,3 +694,75 @@ static int __init swiotlb_create_default_debugfs(void)
 late_initcall(swiotlb_create_default_debugfs);
 
 #endif
+
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct io_tlb_mem *mem = rmem->priv;
+	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+
+	if (dev->dma_io_tlb_mem)
+		return 0;
+
+	/* Since multiple devices can share the same pool, the private data,
+	 * io_tlb_mem struct, will be initialized by the first device attached
+	 * to it.
+	 */
+	if (!mem) {
+		mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
+		if (!mem)
+			return -ENOMEM;
+#ifdef CONFIG_ARM
+		if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
+			kfree(mem);
+			return -EINVAL;
+		}
+#endif /* CONFIG_ARM */
+		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
+
+		rmem->priv = mem;
+
+#ifdef CONFIG_DEBUG_FS
+		if (!debugfs_dir)
+			debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+
+		swiotlb_create_debugfs(mem, rmem->name, debugfs_dir);
+#endif /* CONFIG_DEBUG_FS */
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
+	if (dev)
+		dev->dma_io_tlb_mem = NULL;
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
+	rmem->ops = &rmem_swiotlb_ops;
+	pr_info("Reserved memory: created device swiotlb memory pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
-- 
2.31.1.607.g51e8a6a459-goog

