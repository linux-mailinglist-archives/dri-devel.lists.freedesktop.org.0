Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A41C28AE1
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 09:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FE410E1AD;
	Sun,  2 Nov 2025 08:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QhaM8Kp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3010E1AD
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 08:01:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 206694495F;
 Sun,  2 Nov 2025 08:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5747BC4AF09;
 Sun,  2 Nov 2025 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762070477;
 bh=CbHyK/nmKQWQPg7oBWsXwLhFfhbE3UnGevoa2oCRXLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QhaM8Kp1h2hSqS8VbC6XMZBn/tfsxbkWNQH3+DNTXMTTppIjs8U3kuMX3plfEAhS2
 JswxsyFZ6V/3QfqbKoAQsaSWpW61DEOqFltNsSrwfdm8BfEgMX3ZlsDB5uHZvg3hT/
 WdQcXC35x59j8Bn0IHWuISlSXqjRgX/0Wrb8o30S5EfY3pusT+0QO96zii/KI7J6OV
 kFe8VtCuuwgQsdNm+G8agHDDAqhcB476tuPhvbCdxH17Rmu8WkosZwjSUb0ExTcQUp
 JWkzJn57+6NcOvUx6oWbBfVPH71lPrklpN0q0oBHhRaJtymoCBGakyHSm1uj0GP13p
 RJFeI5XfZqs1g==
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v6 03/11] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Date: Sun,  2 Nov 2025 10:00:51 +0200
Message-ID: <20251102-dmabuf-vfio-v6-3-d773cff0db9f@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
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

From: Leon Romanovsky <leonro@nvidia.com>

Refactor the PCI P2PDMA subsystem to separate the core peer-to-peer DMA
functionality from the optional memory allocation layer. This creates a
two-tier architecture:

The core layer provides P2P mapping functionality for physical addresses
based on PCI device MMIO BARs and integrates with the DMA API for
mapping operations. This layer is required for all P2PDMA users.

The optional upper layer provides memory allocation capabilities
including gen_pool allocator, struct page support, and sysfs interface
for user space access.

This separation allows subsystems like DMABUF to use only the core P2P
mapping functionality without the overhead of memory allocation features
they don't need. The core functionality is now available through the
new pcim_p2pdma_provider() function that returns a p2pdma_provider
structure.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/pci/p2pdma.c       | 147 +++++++++++++++++++++++++++++++++++----------
 include/linux/pci-p2pdma.h |  11 ++++
 2 files changed, 127 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 59cd6fb40e83..664ea3272d73 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -25,11 +25,12 @@ struct pci_p2pdma {
 	struct gen_pool *pool;
 	bool p2pmem_published;
 	struct xarray map_types;
+	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
 };
 
 struct pci_p2pdma_pagemap {
 	struct dev_pagemap pgmap;
-	struct p2pdma_provider mem;
+	struct p2pdma_provider *mem;
 };
 
 static struct pci_p2pdma_pagemap *to_p2p_pgmap(struct dev_pagemap *pgmap)
@@ -204,7 +205,7 @@ static void p2pdma_page_free(struct page *page)
 	struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page_pgmap(page));
 	/* safe to dereference while a reference is held to the percpu ref */
 	struct pci_p2pdma *p2pdma = rcu_dereference_protected(
-		to_pci_dev(pgmap->mem.owner)->p2pdma, 1);
+		to_pci_dev(pgmap->mem->owner)->p2pdma, 1);
 	struct percpu_ref *ref;
 
 	gen_pool_free_owner(p2pdma->pool, (uintptr_t)page_to_virt(page),
@@ -227,44 +228,119 @@ static void pci_p2pdma_release(void *data)
 
 	/* Flush and disable pci_alloc_p2p_mem() */
 	pdev->p2pdma = NULL;
-	synchronize_rcu();
+	if (p2pdma->pool)
+		synchronize_rcu();
+	xa_destroy(&p2pdma->map_types);
+
+	if (!p2pdma->pool)
+		return;
 
 	gen_pool_destroy(p2pdma->pool);
 	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
-	xa_destroy(&p2pdma->map_types);
 }
 
-static int pci_p2pdma_setup(struct pci_dev *pdev)
+/**
+ * pcim_p2pdma_init - Initialise peer-to-peer DMA providers
+ * @pdev: The PCI device to enable P2PDMA for
+ *
+ * This function initializes the peer-to-peer DMA infrastructure
+ * for a PCI device. It allocates and sets up the necessary data
+ * structures to support P2PDMA operations, including mapping type
+ * tracking.
+ */
+int pcim_p2pdma_init(struct pci_dev *pdev)
 {
-	int error = -ENOMEM;
 	struct pci_p2pdma *p2p;
+	int i, ret;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (p2p)
+		return 0;
 
 	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
 	if (!p2p)
 		return -ENOMEM;
 
 	xa_init(&p2p->map_types);
+	/*
+	 * Iterate over all standard PCI BARs and record only those that
+	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
+	 * port BARs) since they cannot be used for peer-to-peer (P2P)
+	 * transactions.
+	 */
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
+			continue;
 
-	p2p->pool = gen_pool_create(PAGE_SHIFT, dev_to_node(&pdev->dev));
-	if (!p2p->pool)
-		goto out;
+		p2p->mem[i].owner = &pdev->dev;
+		p2p->mem[i].bus_offset =
+			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
+	}
 
-	error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
-	if (error)
-		goto out_pool_destroy;
+	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
+	if (ret)
+		goto out_p2p;
 
-	error = sysfs_create_group(&pdev->dev.kobj, &p2pmem_group);
-	if (error)
+	rcu_assign_pointer(pdev->p2pdma, p2p);
+	return 0;
+
+out_p2p:
+	devm_kfree(&pdev->dev, p2p);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_init);
+
+/**
+ * pcim_p2pdma_provider - Get peer-to-peer DMA provider
+ * @pdev: The PCI device to enable P2PDMA for
+ * @bar: BAR index to get provider
+ *
+ * This function gets peer-to-peer DMA provider for a PCI device. The lifetime
+ * of the provider (and of course the MMIO) is bound to the lifetime of the
+ * driver. A driver calling this function must ensure that all references to the
+ * provider, and any DMA mappings created for any MMIO, are all cleaned up
+ * before the driver remove() completes.
+ *
+ * Since P2P is almost always shared with a second driver this means some system
+ * to notify, invalidate and revoke the MMIO's DMA must be in place to use this
+ * function. For example a revoke can be built using DMABUF.
+ */
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
+{
+	struct pci_p2pdma *p2p;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return NULL;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	return &p2p->mem[bar];
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
+
+static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
+{
+	struct pci_p2pdma *p2pdma;
+	int ret;
+
+	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (p2pdma->pool)
+		/* We already setup pools, do nothing, */
+		return 0;
+
+	p2pdma->pool = gen_pool_create(PAGE_SHIFT, dev_to_node(&pdev->dev));
+	if (!p2pdma->pool)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &p2pmem_group);
+	if (ret)
 		goto out_pool_destroy;
 
-	rcu_assign_pointer(pdev->p2pdma, p2p);
 	return 0;
 
 out_pool_destroy:
-	gen_pool_destroy(p2p->pool);
-out:
-	devm_kfree(&pdev->dev, p2p);
-	return error;
+	gen_pool_destroy(p2pdma->pool);
+	p2pdma->pool = NULL;
+	return ret;
 }
 
 static void pci_p2pdma_unmap_mappings(void *data)
@@ -276,7 +352,7 @@ static void pci_p2pdma_unmap_mappings(void *data)
 	 * unmap_mapping_range() on the inode, teardown any existing userspace
 	 * mappings and prevent new ones from being created.
 	 */
-	sysfs_remove_file_from_group(&p2p_pgmap->mem.owner->kobj,
+	sysfs_remove_file_from_group(&p2p_pgmap->mem->owner->kobj,
 				     &p2pmem_alloc_attr.attr,
 				     p2pmem_group.name);
 }
@@ -295,6 +371,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 			    u64 offset)
 {
 	struct pci_p2pdma_pagemap *p2p_pgmap;
+	struct p2pdma_provider *mem;
 	struct dev_pagemap *pgmap;
 	struct pci_p2pdma *p2pdma;
 	void *addr;
@@ -312,11 +389,21 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	if (size + offset > pci_resource_len(pdev, bar))
 		return -EINVAL;
 
-	if (!pdev->p2pdma) {
-		error = pci_p2pdma_setup(pdev);
-		if (error)
-			return error;
-	}
+	error = pcim_p2pdma_init(pdev);
+	if (error)
+		return error;
+
+	error = pci_p2pdma_setup_pool(pdev);
+	if (error)
+		return error;
+
+	mem = pcim_p2pdma_provider(pdev, bar);
+	/*
+	 * We checked validity of BAR prior to call
+	 * to pcim_p2pdma_provider. It should never return NULL.
+	 */
+	if (WARN_ON(!mem))
+		return -EINVAL;
 
 	p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
 	if (!p2p_pgmap)
@@ -328,9 +415,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	pgmap->nr_range = 1;
 	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
 	pgmap->ops = &p2pdma_pgmap_ops;
-	p2p_pgmap->mem.owner = &pdev->dev;
-	p2p_pgmap->mem.bus_offset =
-		pci_bus_address(pdev, bar) - pci_resource_start(pdev, bar);
+	p2p_pgmap->mem = mem;
 
 	addr = devm_memremap_pages(&pdev->dev, pgmap);
 	if (IS_ERR(addr)) {
@@ -1007,11 +1092,11 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
 {
 	struct pci_p2pdma_pagemap *p2p_pgmap = to_p2p_pgmap(page_pgmap(page));
 
-	if (state->mem == &p2p_pgmap->mem)
+	if (state->mem == p2p_pgmap->mem)
 		return;
 
-	state->mem = &p2p_pgmap->mem;
-	state->map = pci_p2pdma_map_type(&p2p_pgmap->mem, dev);
+	state->mem = p2p_pgmap->mem;
+	state->map = pci_p2pdma_map_type(p2p_pgmap->mem, dev);
 }
 
 /**
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 9516ef97b17a..e307c9380d46 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -27,6 +27,8 @@ struct p2pdma_provider {
 };
 
 #ifdef CONFIG_PCI_P2PDMA
+int pcim_p2pdma_init(struct pci_dev *pdev);
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar);
 int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 		u64 offset);
 int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
@@ -44,6 +46,15 @@ int pci_p2pdma_enable_store(const char *page, struct pci_dev **p2p_dev,
 ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
 			       bool use_p2pdma);
 #else /* CONFIG_PCI_P2PDMA */
+static inline int pcim_p2pdma_init(struct pci_dev *pdev)
+{
+	return -EOPNOTSUPP;
+}
+static inline struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev,
+							   int bar)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
 static inline int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar,
 		size_t size, u64 offset)
 {

-- 
2.51.0

