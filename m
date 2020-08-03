Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE9239ED7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9086E204;
	Mon,  3 Aug 2020 05:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C682C6E204
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:20:16 +0000 (UTC)
IronPort-SDR: Lgnaqav3+oGaLnXReIGSnLJyYLCG5F6t8UUeSEe+seZwRVLhs8MQ9msQSH69Sm1sCDdHspyklQ
 Hg2V7ZSlI0Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139998273"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="139998273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:16 -0700
IronPort-SDR: oOgco5RWVEM4VDwJhMDPua7+aQZx/pxCE8EVfz/x6BeKSrKMU1PXipf40idlkwYg7NIwD17g8p
 2d+jFxlxEkkQ==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="291927829"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:16 -0700
Subject: [PATCH v4 17/23] mm/memremap_pages: Support multiple ranges per
 invocation
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:03:57 -0700
Message-ID: <159643103789.4062302.18426128170217903785.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
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
Cc: Dave Jiang <dave.jiang@intel.com>, linux-acpi@vger.kernel.org,
 ard.biesheuvel@linaro.org, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@ozlabs.org>, peterz@infradead.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 vishal.l.verma@intel.com, joao.m.martins@oracle.com,
 Ira Weiny <ira.weiny@intel.com>, linux-mm@kvack.org, linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In support of device-dax growing the ability to front physically
dis-contiguous ranges of memory, update devm_memremap_pages() to track
multiple ranges with a single reference counter and devm instance.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |    1 
 drivers/dax/device.c                   |    1 
 drivers/gpu/drm/nouveau/nouveau_dmem.c |    1 
 drivers/nvdimm/pfn_devs.c              |    1 
 drivers/nvdimm/pmem.c                  |    1 
 drivers/pci/p2pdma.c                   |    1 
 include/linux/memremap.h               |   10 +
 lib/test_hmm.c                         |    1 
 mm/memremap.c                          |  258 +++++++++++++++++++-------------
 9 files changed, 165 insertions(+), 110 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 29ec555055c2..84e5a2dc8be5 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -1172,6 +1172,7 @@ int kvmppc_uvmem_init(void)
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
 	kvmppc_uvmem_pgmap.range.start = res->start;
 	kvmppc_uvmem_pgmap.range.end = res->end;
+	kvmppc_uvmem_pgmap.nr_range = 1;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
 	/* just one global instance: */
 	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index fffc54ce0911..f3755df4ae29 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -417,6 +417,7 @@ int dev_dax_probe(struct dev_dax *dev_dax)
 		if (!pgmap)
 			return -ENOMEM;
 		pgmap->range = *range;
+		pgmap->nr_range = 1;
 	}
 	pgmap->type = MEMORY_DEVICE_DEVDAX;
 	addr = devm_memremap_pages(dev, pgmap);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 25811ed7e274..a13c6215bba8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -251,6 +251,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	chunk->pagemap.range.start = res->start;
 	chunk->pagemap.range.end = res->end;
+	chunk->pagemap.nr_range = 1;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 3c4787b92a6a..b499df630d4d 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -693,6 +693,7 @@ static int __nvdimm_setup_pfn(struct nd_pfn *nd_pfn, struct dev_pagemap *pgmap)
 		.start = nsio->res.start + start_pad,
 		.end = nsio->res.end - end_trunc,
 	};
+	pgmap->nr_range = 1;
 	if (nd_pfn->mode == PFN_MODE_RAM) {
 		if (offset < reserve)
 			return -EINVAL;
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 69cc0e783709..1f45af363a94 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -442,6 +442,7 @@ static int pmem_attach_disk(struct device *dev,
 	} else if (pmem_should_map_pages(dev)) {
 		pmem->pgmap.range.start = res->start;
 		pmem->pgmap.range.end = res->end;
+		pmem->pgmap.nr_range = 1;
 		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
 		pmem->pgmap.ops = &fsdax_pagemap_ops;
 		addr = devm_memremap_pages(dev, &pmem->pgmap);
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index dd6b0d51a50c..403304785561 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -187,6 +187,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 	pgmap = &p2p_pgmap->pgmap;
 	pgmap->range.start = pci_resource_start(pdev, bar) + offset;
 	pgmap->range.end = pgmap->range.start + size - 1;
+	pgmap->nr_range = 1;
 	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
 
 	p2p_pgmap->provider = pdev;
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 6c21951bdb16..4e9c738f4b31 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -95,7 +95,6 @@ struct dev_pagemap_ops {
 /**
  * struct dev_pagemap - metadata for ZONE_DEVICE mappings
  * @altmap: pre-allocated/reserved memory for vmemmap allocations
- * @range: physical address range covered by @ref
  * @ref: reference count that pins the devm_memremap_pages() mapping
  * @internal_ref: internal reference if @ref is not provided by the caller
  * @done: completion for @internal_ref
@@ -105,10 +104,12 @@ struct dev_pagemap_ops {
  * @owner: an opaque pointer identifying the entity that manages this
  *	instance.  Used by various helpers to make sure that no
  *	foreign ZONE_DEVICE memory is accessed.
+ * @nr_range: number of ranges to be mapped
+ * @range: range to be mapped when nr_range == 1
+ * @ranges: array of ranges to be mapped when nr_range > 1
  */
 struct dev_pagemap {
 	struct vmem_altmap altmap;
-	struct range range;
 	struct percpu_ref *ref;
 	struct percpu_ref internal_ref;
 	struct completion done;
@@ -116,6 +117,11 @@ struct dev_pagemap {
 	unsigned int flags;
 	const struct dev_pagemap_ops *ops;
 	void *owner;
+	int nr_range;
+	union {
+		struct range range;
+		struct range ranges[0];
+	};
 };
 
 static inline struct vmem_altmap *pgmap_altmap(struct dev_pagemap *pgmap)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 5b4521991621..e3065d6123f0 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -489,6 +489,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
+	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
 
diff --git a/mm/memremap.c b/mm/memremap.c
index 9979891fec78..a7346638a09f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -77,15 +77,19 @@ static void pgmap_array_delete(struct range *range)
 	synchronize_rcu();
 }
 
-static unsigned long pfn_first(struct dev_pagemap *pgmap)
+static unsigned long pfn_first(struct dev_pagemap *pgmap, int range_id)
 {
-	return PHYS_PFN(pgmap->range.start) +
-		vmem_altmap_offset(pgmap_altmap(pgmap));
+	struct range *range = &pgmap->ranges[range_id];
+	unsigned long pfn = PHYS_PFN(range->start);
+
+	if (range_id)
+		return pfn;
+	return pfn + vmem_altmap_offset(pgmap_altmap(pgmap));
 }
 
-static unsigned long pfn_end(struct dev_pagemap *pgmap)
+static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
 {
-	const struct range *range = &pgmap->range;
+	const struct range *range = &pgmap->ranges[range_id];
 
 	return (range->start + range_len(range)) >> PAGE_SHIFT;
 }
@@ -117,8 +121,8 @@ bool pfn_zone_device_reserved(unsigned long pfn)
 	return ret;
 }
 
-#define for_each_device_pfn(pfn, map) \
-	for (pfn = pfn_first(map); pfn < pfn_end(map); pfn = pfn_next(pfn))
+#define for_each_device_pfn(pfn, map, i) \
+	for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
 
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
@@ -144,20 +148,14 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
 		pgmap->ref = NULL;
 }
 
-void memunmap_pages(struct dev_pagemap *pgmap)
+static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 {
-	struct range *range = &pgmap->range;
+	struct range *range = &pgmap->ranges[range_id];
 	struct page *first_page;
-	unsigned long pfn;
 	int nid;
 
-	dev_pagemap_kill(pgmap);
-	for_each_device_pfn(pfn, pgmap)
-		put_page(pfn_to_page(pfn));
-	dev_pagemap_cleanup(pgmap);
-
 	/* make sure to access a memmap that was actually initialized */
-	first_page = pfn_to_page(pfn_first(pgmap));
+	first_page = pfn_to_page(pfn_first(pgmap, range_id));
 
 	/* pages are dead and unused, undo the arch mapping */
 	nid = page_to_nid(first_page);
@@ -177,6 +175,22 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 
 	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
 	pgmap_array_delete(range);
+}
+
+void memunmap_pages(struct dev_pagemap *pgmap)
+{
+	unsigned long pfn;
+	int i;
+
+	dev_pagemap_kill(pgmap);
+	for (i = 0; i < pgmap->nr_range; i++)
+		for_each_device_pfn(pfn, pgmap, i)
+			put_page(pfn_to_page(pfn));
+	dev_pagemap_cleanup(pgmap);
+
+	for (i = 0; i < pgmap->nr_range; i++)
+		pageunmap_range(pgmap, i);
+
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
 	devmap_managed_enable_put();
 }
@@ -195,96 +209,29 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
 	complete(&pgmap->done);
 }
 
-/*
- * Not device managed version of dev_memremap_pages, undone by
- * memunmap_pages().  Please use dev_memremap_pages if you have a struct
- * device available.
- */
-void *memremap_pages(struct dev_pagemap *pgmap, int nid)
+static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
+		int range_id, int nid)
 {
-	struct range *range = &pgmap->range;
+	struct range *range = &pgmap->ranges[range_id];
 	struct dev_pagemap *conflict_pgmap;
-	struct mhp_params params = {
-		/*
-		 * We do not want any optional features only our own memmap
-		 */
-		.altmap = pgmap_altmap(pgmap),
-		.pgprot = PAGE_KERNEL,
-	};
 	int error, is_ram;
-	bool need_devmap_managed = true;
 
-	switch (pgmap->type) {
-	case MEMORY_DEVICE_PRIVATE:
-		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
-			WARN(1, "Device private memory not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
-			WARN(1, "Missing migrate_to_ram method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->owner) {
-			WARN(1, "Missing owner\n");
-			return ERR_PTR(-EINVAL);
-		}
-		break;
-	case MEMORY_DEVICE_FS_DAX:
-		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
-		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
-			WARN(1, "File system DAX not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		break;
-	case MEMORY_DEVICE_DEVDAX:
-		need_devmap_managed = false;
-		break;
-	case MEMORY_DEVICE_PCI_P2PDMA:
-		params.pgprot = pgprot_noncached(params.pgprot);
-		need_devmap_managed = false;
-		break;
-	default:
-		WARN(1, "Invalid pgmap type %d\n", pgmap->type);
-		break;
-	}
-
-	if (!pgmap->ref) {
-		if (pgmap->ops && (pgmap->ops->kill || pgmap->ops->cleanup))
-			return ERR_PTR(-EINVAL);
-
-		init_completion(&pgmap->done);
-		error = percpu_ref_init(&pgmap->internal_ref,
-				dev_pagemap_percpu_release, 0, GFP_KERNEL);
-		if (error)
-			return ERR_PTR(error);
-		pgmap->ref = &pgmap->internal_ref;
-	} else {
-		if (!pgmap->ops || !pgmap->ops->kill || !pgmap->ops->cleanup) {
-			WARN(1, "Missing reference count teardown definition\n");
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	if (need_devmap_managed) {
-		error = devmap_managed_enable_get(pgmap);
-		if (error)
-			return ERR_PTR(error);
-	}
+	if (WARN_ONCE(pgmap_altmap(pgmap) && range_id > 0,
+				"altmap not supported for multiple ranges\n"))
+		return -EINVAL;
 
 	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->start), NULL);
 	if (conflict_pgmap) {
 		WARN(1, "Conflicting mapping in same section\n");
 		put_dev_pagemap(conflict_pgmap);
-		error = -ENOMEM;
-		goto err_array;
+		return -ENOMEM;
 	}
 
 	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->end), NULL);
 	if (conflict_pgmap) {
 		WARN(1, "Conflicting mapping in same section\n");
 		put_dev_pagemap(conflict_pgmap);
-		error = -ENOMEM;
-		goto err_array;
+		return -ENOMEM;
 	}
 
 	is_ram = region_intersects(range->start, range_len(range),
@@ -294,19 +241,18 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		WARN_ONCE(1, "attempted on %s region %#llx-%#llx\n",
 				is_ram == REGION_MIXED ? "mixed" : "ram",
 				range->start, range->end);
-		error = -ENXIO;
-		goto err_array;
+		return -ENXIO;
 	}
 
 	error = xa_err(xa_store_range(&pgmap_array, PHYS_PFN(range->start),
 				PHYS_PFN(range->end), pgmap, GFP_KERNEL));
 	if (error)
-		goto err_array;
+		return error;
 
 	if (nid < 0)
 		nid = numa_mem_id();
 
-	error = track_pfn_remap(NULL, &params.pgprot, PHYS_PFN(range->start), 0,
+	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
 			range_len(range));
 	if (error)
 		goto err_pfn_remap;
@@ -326,7 +272,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 	 */
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
 		error = add_pages(nid, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), &params);
+				PHYS_PFN(range_len(range)), params);
 	} else {
 		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
 		if (error) {
@@ -335,7 +281,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 
 		error = arch_add_memory(nid, range->start, range_len(range),
-					&params);
+					params);
 	}
 
 	if (!error) {
@@ -343,7 +289,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
 		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), params.altmap);
+				PHYS_PFN(range_len(range)), params->altmap);
 	}
 
 	mem_hotplug_done();
@@ -357,20 +303,116 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 	memmap_init_zone_device(&NODE_DATA(nid)->node_zones[ZONE_DEVICE],
 				PHYS_PFN(range->start),
 				PHYS_PFN(range_len(range)), pgmap);
-	percpu_ref_get_many(pgmap->ref, pfn_end(pgmap) - pfn_first(pgmap));
-	return __va(range->start);
+	percpu_ref_get_many(pgmap->ref, pfn_end(pgmap, range_id)
+			- pfn_first(pgmap, range_id));
+	return 0;
 
- err_add_memory:
+err_add_memory:
 	kasan_remove_zero_shadow(__va(range->start), range_len(range));
- err_kasan:
+err_kasan:
 	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
- err_pfn_remap:
+err_pfn_remap:
 	pgmap_array_delete(range);
- err_array:
-	dev_pagemap_kill(pgmap);
-	dev_pagemap_cleanup(pgmap);
-	devmap_managed_enable_put();
-	return ERR_PTR(error);
+	return error;
+}
+
+
+/*
+ * Not device managed version of dev_memremap_pages, undone by
+ * memunmap_pages().  Please use dev_memremap_pages if you have a struct
+ * device available.
+ */
+void *memremap_pages(struct dev_pagemap *pgmap, int nid)
+{
+	struct mhp_params params = {
+		.altmap = pgmap_altmap(pgmap),
+		.pgprot = PAGE_KERNEL,
+	};
+	const int nr_range = pgmap->nr_range;
+	bool need_devmap_managed = true;
+	int error, i;
+
+	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
+		return ERR_PTR(-EINVAL);
+
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+			WARN(1, "Device private memory not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
+		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
+			WARN(1, "Missing migrate_to_ram method\n");
+			return ERR_PTR(-EINVAL);
+		}
+		if (!pgmap->owner) {
+			WARN(1, "Missing owner\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
+	case MEMORY_DEVICE_FS_DAX:
+		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
+		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
+			WARN(1, "File system DAX not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
+	case MEMORY_DEVICE_DEVDAX:
+		need_devmap_managed = false;
+		break;
+	case MEMORY_DEVICE_PCI_P2PDMA:
+		params.pgprot = pgprot_noncached(params.pgprot);
+		need_devmap_managed = false;
+		break;
+	default:
+		WARN(1, "Invalid pgmap type %d\n", pgmap->type);
+		break;
+	}
+
+	if (!pgmap->ref) {
+		if (pgmap->ops && (pgmap->ops->kill || pgmap->ops->cleanup))
+			return ERR_PTR(-EINVAL);
+
+		init_completion(&pgmap->done);
+		error = percpu_ref_init(&pgmap->internal_ref,
+				dev_pagemap_percpu_release, 0, GFP_KERNEL);
+		if (error)
+			return ERR_PTR(error);
+		pgmap->ref = &pgmap->internal_ref;
+	} else {
+		if (!pgmap->ops || !pgmap->ops->kill || !pgmap->ops->cleanup) {
+			WARN(1, "Missing reference count teardown definition\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	if (need_devmap_managed) {
+		error = devmap_managed_enable_get(pgmap);
+		if (error)
+			return ERR_PTR(error);
+	}
+
+	/*
+	 * Clear the pgmap nr_range as it will be incremented for each
+	 * successfully processed range. This communicates how many
+	 * regions to unwind in the abort case.
+	 */
+	pgmap->nr_range = 0;
+	error = 0;
+	for (i = 0; i < nr_range; i++) {
+		error = pagemap_range(pgmap, &params, i, nid);
+		if (error)
+			break;
+		pgmap->nr_range++;
+	}
+
+	if (i < nr_range) {
+		memunmap_pages(pgmap);
+		pgmap->nr_range = nr_range;
+		return ERR_PTR(error);
+	}
+
+	return __va(pgmap->ranges[0].start);
 }
 EXPORT_SYMBOL_GPL(memremap_pages);
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
