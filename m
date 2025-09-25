Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81AB9F7F3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4C910E925;
	Thu, 25 Sep 2025 13:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LeLdhSJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA210E924
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:18:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F6654070F;
 Thu, 25 Sep 2025 13:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C8AC4CEF0;
 Thu, 25 Sep 2025 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758806329;
 bh=zowH1OUef1vijrfUt/VMnvnpjJAgrGRYmdoRVaN/ufQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LeLdhSJzTPyKuawpr1Ogyun5PsDEujgdpes2x3sF7Q2hdgP6+/C0ykdzyLVk8BW17
 +zNlF5HOhxmkzIKcrAv+NlGrHsDf6UXSUlKKpukta8Q6Njomni/lrGrdq38v58zqpx
 twp63dLxXV28b9MIgm+4D+sm5Uv9TwGtkVBL0JuDkfnTAPo95x3pHbKOvSVobiE+0S
 yX3cz2NH7sXcsmG0yd7XC7xtVSMyByxZs3YCBmc+zBTpf5w/tvXPGPMvqhmee5EboM
 Of0Zgel4TF6IiKxtPt5mcchnWsifnyHQx3LRfvhVNiv2u2BE4Q/EJKZPVIiYOAtsUr
 H3aCqzL1mDdWw==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Date: Thu, 25 Sep 2025 16:14:31 +0300
Message-ID: <db592ba6c35fa44898224649222d6c666d44af0b.1758804980.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758804980.git.leon@kernel.org>
References: <cover.1758804980.git.leon@kernel.org>
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

This separation allows subsystems like VFIO to use only the core P2P
mapping functionality without the overhead of memory allocation features
they don't need. The core functionality is now available through the
new pcim_p2pdma_provider() function that returns a p2pdma_provider
structure.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/pci/p2pdma.c       | 140 ++++++++++++++++++++++++++++---------
 include/linux/pci-p2pdma.h |   6 ++
 2 files changed, 112 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 176a99232fdca..76496a5ab82e0 100644
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
@@ -227,44 +228,97 @@ static void pci_p2pdma_release(void *data)
 
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
+ * pcim_p2pdma_provider - Get peer-to-peer DMA provider
+ * @pdev: The PCI device to enable P2PDMA for
+ * @bar: BAR index to get provider
+ *
+ * This function gets peer-to-peer DMA provider  and initializes
+ * the peer-to-peer DMA infrastructure for a PCI device. It allocates
+ * and sets up the necessary data structures to support P2PDMA operations,
+ * including mapping type tracking.
+ */
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
 {
-	int error = -ENOMEM;
 	struct pci_p2pdma *p2p;
+	int i, ret;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return NULL;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (p2p)
+		/* PCI device was already initialized */
+		return &p2p->mem[bar];
 
 	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
 	if (!p2p)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
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
+	return &p2p->mem[bar];
+
+out_p2p:
+	devm_kfree(&pdev->dev, p2p);
+	return ERR_PTR(ret);
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
@@ -276,7 +330,7 @@ static void pci_p2pdma_unmap_mappings(void *data)
 	 * unmap_mapping_range() on the inode, teardown any existing userspace
 	 * mappings and prevent new ones from being created.
 	 */
-	sysfs_remove_file_from_group(&p2p_pgmap->mem.owner->kobj,
+	sysfs_remove_file_from_group(&p2p_pgmap->mem->owner->kobj,
 				     &p2pmem_alloc_attr.attr,
 				     p2pmem_group.name);
 }
@@ -295,6 +349,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 			    u64 offset)
 {
 	struct pci_p2pdma_pagemap *p2p_pgmap;
+	struct p2pdma_provider *mem;
 	struct dev_pagemap *pgmap;
 	struct pci_p2pdma *p2pdma;
 	void *addr;
@@ -312,15 +367,32 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	if (size + offset > pci_resource_len(pdev, bar))
 		return -EINVAL;
 
-	if (!pdev->p2pdma) {
-		error = pci_p2pdma_setup(pdev);
+	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (!p2pdma) {
+		mem = pcim_p2pdma_provider(pdev, bar);
+		if (IS_ERR(mem))
+			return PTR_ERR(mem);
+
+		/*
+		 * We checked validity of BAR prior to call
+		 * to pcim_p2pdma_provider. It should never return NULL.
+		 */
+		if (WARN_ON(!mem))
+			return -EINVAL;
+
+		error = pci_p2pdma_setup_pool(pdev);
 		if (error)
 			return error;
-	}
+
+		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
+	} else
+		mem = &p2pdma->mem[bar];
 
 	p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
-	if (!p2p_pgmap)
-		return -ENOMEM;
+	if (!p2p_pgmap) {
+		error = -ENOMEM;
+		goto free_pool;
+	}
 
 	pgmap = &p2p_pgmap->pgmap;
 	pgmap->range.start = pci_resource_start(pdev, bar) + offset;
@@ -328,9 +400,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	pgmap->nr_range = 1;
 	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
 	pgmap->ops = &p2pdma_pgmap_ops;
-	p2p_pgmap->mem.owner = &pdev->dev;
-	p2p_pgmap->mem.bus_offset =
-		pci_bus_address(pdev, bar) - pci_resource_start(pdev, bar);
+	p2p_pgmap->mem = mem;
 
 	addr = devm_memremap_pages(&pdev->dev, pgmap);
 	if (IS_ERR(addr)) {
@@ -343,7 +413,6 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	if (error)
 		goto pages_free;
 
-	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
 	error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
 			pci_bus_address(pdev, bar) + offset,
 			range_len(&pgmap->range), dev_to_node(&pdev->dev),
@@ -359,7 +428,10 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 pages_free:
 	devm_memunmap_pages(&pdev->dev, pgmap);
 pgmap_free:
-	devm_kfree(&pdev->dev, pgmap);
+	devm_kfree(&pdev->dev, p2p_pgmap);
+free_pool:
+	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
+	gen_pool_destroy(p2pdma->pool);
 	return error;
 }
 EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
@@ -1008,11 +1080,11 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
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
index eef96636c67e6..476650ae8d4d8 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -27,6 +27,7 @@ struct p2pdma_provider {
 };
 
 #ifdef CONFIG_PCI_P2PDMA
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar);
 int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 		u64 offset);
 int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
@@ -45,6 +46,11 @@ int pci_p2pdma_enable_store(const char *page, struct pci_dev **p2p_dev,
 ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
 			       bool use_p2pdma);
 #else /* CONFIG_PCI_P2PDMA */
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

