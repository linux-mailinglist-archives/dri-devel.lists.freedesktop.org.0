Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA97FBEB1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F7110E588;
	Tue, 28 Nov 2023 15:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8810E518;
 Tue, 28 Nov 2023 13:07:56 +0000 (UTC)
Received: from kwepemm000018.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sfj3G6KwCzWhrR;
 Tue, 28 Nov 2023 20:50:02 +0800 (CST)
Received: from DESKTOP-RAUQ1L5.china.huawei.com (10.174.179.172) by
 kwepemm000018.china.huawei.com (7.193.23.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 20:50:43 +0800
From: Weixi Zhu <weixi.zhu@huawei.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <akpm@linux-foundation.org>
Subject: [RFC PATCH 3/6] mm/gmem: add GMEM (Generalized Memory Management)
 interface for external accelerators
Date: Tue, 28 Nov 2023 20:50:22 +0800
Message-ID: <20231128125025.4449-4-weixi.zhu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128125025.4449-1-weixi.zhu@huawei.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.172]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000018.china.huawei.com (7.193.23.4)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 28 Nov 2023 15:54:49 +0000
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
Cc: dri-devel@lists.freedesktop.org, leonro@nvidia.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, mgorman@suse.de, ziy@nvidia.com,
 zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, ogabbay@kernel.org,
 Weixi Zhu <weixi.zhu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accelerator driver developers are forced to reinvent external MM subsystems
case by case, introducing redundant code (14K~70K for each case). This is
because Linux core MM only considers host memory resources. At the same
time, application-level developers suffer from poor programmability -- they
must consider parallel address spaces and be careful about the limited
device DRAM capacity.

This patch adds GMEM interface to help accelerator drivers directly reuse
Linux core MM, preventing them from reinventing the wheel. Drivers which
utilize GMEM interface can directly support unified virtual address spaces
for application users -- memory allocated with malloc()/mmap() can be
directly used by either CPU and accelerators, providing a coherent view of
memory.

The GMEM device interface prefixed with "gm_dev" is used to decouple
accelerator-specific operations. Device drivers should invoke
gm_dev_create() to register a device instance at the device boot time. A
device-specific implementation of "struct gm_mmu" must be provided, so
Linux can invoke hardware-related functions at the right time. If the
driver wants Linux to take charge of the local DRAM of the accelerator,
then it should register a range of physical addresses to be managed by
gm_dev_register_physmem().

The GMEM address space interface prefixed with "gm_as" is used to connect a
device context with a CPU context, i.e. an mm_struct. Struct gm_as is
created as a unified address space that not only includes a CPU context,
but may also include one or more device contexts. Device driver should
utilize gm_as_attach() to include a device context to a created struct
gm_as. Then gm_dev_fault() can then serve as a generic device page fault
handler. It is important that a device driver invokes gm_as_attach() at the
beginning of a CPU program. This invocation can happen inside an ioctl()
call when a device context is initialized.

Signed-off-by: Weixi Zhu <weixi.zhu@huawei.com>
---
 include/linux/gmem.h     | 196 +++++++++++++++++++
 include/linux/mm_types.h |   1 +
 mm/gmem.c                | 408 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 605 insertions(+)

diff --git a/include/linux/gmem.h b/include/linux/gmem.h
index 529ff6755a99..f424225daa03 100644
--- a/include/linux/gmem.h
+++ b/include/linux/gmem.h
@@ -13,6 +13,35 @@
 
 #ifdef CONFIG_GMEM
 
+#define GMEM_MMAP_RETRY_TIMES 10 /* gmem retry times before OOM */
+
+DECLARE_STATIC_KEY_FALSE(gmem_status);
+
+static inline bool gmem_is_enabled(void)
+{
+	return static_branch_likely(&gmem_status);
+}
+
+struct gm_dev {
+	int id;
+
+	/*
+	 * TODO: define more device capabilities and consider different device
+	 * base page sizes
+	 */
+	unsigned long capability;
+	struct gm_mmu *mmu;
+	void *dev_data;
+	/* A device may support time-sliced context switch. */
+	struct gm_context *current_ctx;
+
+	struct list_head gm_ctx_list;
+
+	/* Add tracking of registered device local physical memory. */
+	nodemask_t registered_hnodes;
+	struct device *dma_dev;
+};
+
 #define GM_PAGE_CPU	0x10 /* Determines whether page is a pointer or a pfn number. */
 #define GM_PAGE_DEVICE	0x20
 #define GM_PAGE_NOMAP	0x40
@@ -96,7 +125,161 @@ void unmap_gm_mappings_range(struct vm_area_struct *vma, unsigned long start,
 			     unsigned long end);
 void munmap_in_peer_devices(struct mm_struct *mm, unsigned long start,
 			    unsigned long end);
+
+/* core gmem */
+enum gm_ret {
+	GM_RET_SUCCESS = 0,
+	GM_RET_NOMEM,
+	GM_RET_PAGE_EXIST,
+	GM_RET_MIGRATING,
+	GM_RET_FAILURE_UNKNOWN,
+};
+
+/**
+ * enum gm_mmu_mode - defines the method to share a physical page table.
+ *
+ * @GM_MMU_MODE_SHARE: Share a physical page table with another attached
+ * device's MMU, requiring one of the attached MMUs to be compatible. For
+ * example, the IOMMU is compatible with the CPU MMU on most modern machines.
+ * This mode requires the device physical memory to be cache-coherent.
+ * TODO: add MMU cookie to detect compatible MMUs.
+ *
+ * @GM_MMU_MODE_COHERENT_EXCLUSIVE: Maintain a coherent page table that holds
+ * exclusive mapping entries, so that device memory accesses can trigger
+ * fault-driven migration for automatic data locality optimizations.
+ * This mode does not require a cache-coherent link between the CPU and device.
+ *
+ * @GM_MMU_MODE_REPLICATE: Maintain a coherent page table that replicates
+ * physical mapping entries whenever a physical mapping is installed inside the
+ * address space, so that it may minimize the page faults to be triggered by
+ * this device.
+ * This mode requires the device physical memory to be cache-coherent.
+ */
+enum gm_mmu_mode {
+	GM_MMU_MODE_SHARE,
+	GM_MMU_MODE_COHERENT_EXCLUSIVE,
+	GM_MMU_MODE_REPLICATE,
+};
+
+enum gm_fault_hint {
+	GM_FAULT_HINT_MARK_HOT,
+	/*
+	 * TODO: introduce other fault hints, e.g. read-only duplication, map
+	 * remotely instead of migrating.
+	 */
+};
+
+/* Parameter list for peer_map/peer_unmap mmu functions. */
+struct gm_fault_t {
+	struct mm_struct *mm;
+	struct gm_dev *dev;
+	unsigned long va;
+	unsigned long size;
+	unsigned long prot;
+	bool copy;	/* Set dma_addr with a valid address if true */
+	dma_addr_t dma_addr;
+	enum gm_fault_hint hint;
+};
+
+/**
+ * This struct defines a series of MMU functions registered by a peripheral
+ * device that is to be invoked by GMEM.
+ *
+ * pmap is an opaque pointer that identifies a physical page table of a device.
+ * A physical page table holds the physical mappings that can be interpreted by
+ * the hardware MMU.
+ */
+struct gm_mmu {
+	/*
+	 * TODO: currently the device is assumed to support the same base page
+	 * size and huge page size as the host, which is not necessarily the
+	 * fact. Consider customized page sizes and add MMU cookie to identify
+	 * compatible MMUs which can share page tables.
+	 */
+
+	/* Synchronize VMA in a peer OS to interact with the host OS */
+	int (*peer_va_alloc_fixed)(struct mm_struct *mm, unsigned long va,
+				   unsigned long size, unsigned long prot);
+	int (*peer_va_free)(struct mm_struct *mm, unsigned long va,
+			    unsigned long size);
+
+	/* Create physical mappings on peer host.
+	 * If copy is set, copy data [dma_addr, dma_addr + size] to peer host
+	 */
+	int (*peer_map)(struct gm_fault_t *gmf);
+	/*
+	 * Destroy physical mappings on peer host.
+	 * If copy is set, copy data back to [dma_addr, dma_addr + size]
+	 */
+	int (*peer_unmap)(struct gm_fault_t *gmf);
+
+	/* Create or destroy a device's physical page table. */
+	int (*pmap_create)(struct gm_dev *dev, void **pmap);
+	int (*pmap_destroy)(void *pmap);
+
+	/* Create or destroy a physical mapping of a created physical page table */
+	int (*pmap_enter)(void *pmap, unsigned long va, unsigned long size,
+			  unsigned long pa, unsigned long prot);
+	int (*pmap_release)(void *pmap, unsigned long va, unsigned long size);
+
+	/* Change the protection of a virtual page */
+	int (*pmap_protect)(void *pmap, unsigned long va, unsigned long size,
+			    unsigned long new_prot);
+
+	/* Invalidation functions of the MMU TLB */
+	int (*tlb_invl)(void *pmap, unsigned long va, unsigned long size);
+	int (*tlb_invl_coalesced)(void *pmap, struct list_head *mappings);
+};
+
+/**
+ * gm dev cap defines a composable flag to describe the capabilities of a device.
+ *
+ * @GM_DEV_CAP_REPLAYABLE: Memory accesses can be replayed to recover page faults.
+ * @GM_DEV_CAP_PEER: The device has its own VMA/PA management, controlled by another peer OS
+ */
+#define GM_DEV_CAP_REPLAYABLE	0x00000001
+#define GM_DEV_CAP_PEER		0x00000010
+
+#define gm_dev_is_peer(dev) (((dev)->capability & GM_DEV_CAP_PEER) != 0)
+
+struct gm_context {
+	struct gm_as *as;
+	struct gm_dev *dev;
+	void *pmap;
+	/* List of device contexts with the same struct gm_dev */
+	struct list_head gm_dev_link;
+
+	/* List of device contexts within the same address space */
+	struct list_head gm_as_link;
+};
+
+vm_fault_t gm_host_fault_locked(struct vm_fault *vmf, unsigned int order);
+
+/* GMEM Device KPI */
+int gm_dev_create(struct gm_mmu *mmu, void *dev_data, unsigned long cap,
+		  struct gm_dev **new_dev);
+int gm_dev_destroy(struct gm_dev *dev);
+int gm_dev_register_physmem(struct gm_dev *dev, unsigned long begin,
+			    unsigned long end);
+int gm_dev_fault(struct mm_struct *mm, unsigned long addr, struct gm_dev *dev,
+		 enum gm_fault_hint hint);
+
+/* Defines an address space. */
+struct gm_as {
+	spinlock_t lock; /* spinlock of struct gm_as */
+	unsigned long start_va;
+	unsigned long end_va;
+
+	struct list_head gm_ctx_list; /* tracks device contexts attached to this va space, using gm_as_link */
+};
+
+/* GMEM address space KPI */
+int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as);
+int gm_as_destroy(struct gm_as *as);
+int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
+		 bool activate, struct gm_context **out_ctx);
 #else
+static inline bool gmem_is_enabled(void) { return false; }
 static inline void hnuma_init(void) {}
 static inline void __init vm_object_init(void)
 {
@@ -134,6 +317,19 @@ static inline void munmap_in_peer_devices(struct mm_struct *mm,
 					  unsigned long end)
 {
 }
+int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
+{
+	return 0;
+}
+int gm_as_destroy(struct gm_as *as)
+{
+	return 0;
+}
+int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
+		 bool activate, struct gm_context **out_ctx)
+{
+	return 0;
+}
 #endif
 
 #endif /* _GMEM_H */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 4e50dc019d75..ade2b6aee0f3 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -977,6 +977,7 @@ struct mm_struct {
 #endif /* CONFIG_LRU_GEN */
 #ifdef CONFIG_GMEM
 		struct vm_object *vm_obj;
+		struct gm_as *gm_as;
 #endif
 	} __randomize_layout;
 
diff --git a/mm/gmem.c b/mm/gmem.c
index 767eb070b22e..b95b6b42ed6d 100644
--- a/mm/gmem.c
+++ b/mm/gmem.c
@@ -8,6 +8,17 @@
  */
 #include <linux/mm.h>
 #include <linux/gmem.h>
+#include <linux/dma-mapping.h>
+
+DEFINE_STATIC_KEY_FALSE(gmem_status);
+EXPORT_SYMBOL_GPL(gmem_status);
+
+static struct kmem_cache *gm_as_cache;
+static struct kmem_cache *gm_dev_cache;
+static struct kmem_cache *gm_ctx_cache;
+static DEFINE_XARRAY_ALLOC(gm_dev_id_pool);
+
+static bool enable_gmem;
 
 DEFINE_SPINLOCK(hnode_lock);
 
@@ -66,6 +77,7 @@ static void hnode_init(struct hnode *hnode, unsigned int hnid,
 	hnodes[hnid] = hnode;
 	hnodes[hnid]->id = hnid;
 	hnodes[hnid]->dev = dev;
+	node_set(hnid, dev->registered_hnodes);
 	xa_init(&hnodes[hnid]->pages);
 }
 
@@ -73,6 +85,402 @@ static void hnode_deinit(unsigned int hnid, struct gm_dev *dev)
 {
 	hnodes[hnid]->id = 0;
 	hnodes[hnid]->dev = NULL;
+	node_clear(hnid, dev->registered_hnodes);
 	xa_destroy(&hnodes[hnid]->pages);
 	hnodes[hnid] = NULL;
 }
+
+static struct workqueue_struct *prefetch_wq;
+
+#define GM_WORK_CONCURRENCY 4
+
+static int __init gmem_init(void)
+{
+	int err = -ENOMEM;
+
+	if (!enable_gmem)
+		return 0;
+
+	gm_as_cache = KMEM_CACHE(gm_as, 0);
+	if (!gm_as_cache)
+		goto out;
+
+	gm_dev_cache = KMEM_CACHE(gm_dev, 0);
+	if (!gm_dev_cache)
+		goto free_as;
+
+	gm_ctx_cache = KMEM_CACHE(gm_context, 0);
+	if (!gm_ctx_cache)
+		goto free_dev;
+
+	err = vm_object_init();
+	if (err)
+		goto free_ctx;
+
+	prefetch_wq = alloc_workqueue("prefetch",
+				      __WQ_LEGACY | WQ_UNBOUND | WQ_HIGHPRI |
+					      WQ_CPU_INTENSIVE,
+				      GM_WORK_CONCURRENCY);
+	if (!prefetch_wq) {
+		pr_info("fail to alloc workqueue prefetch_wq\n");
+		err = -EFAULT;
+		goto free_ctx;
+	}
+
+	static_branch_enable(&gmem_status);
+
+	return 0;
+
+free_ctx:
+	kmem_cache_destroy(gm_ctx_cache);
+free_dev:
+	kmem_cache_destroy(gm_dev_cache);
+free_as:
+	kmem_cache_destroy(gm_as_cache);
+out:
+	return -ENOMEM;
+}
+subsys_initcall(gmem_init);
+
+static int __init setup_gmem(char *str)
+{
+	(void)kstrtobool(str, &enable_gmem);
+
+	return 1;
+}
+__setup("gmem=", setup_gmem);
+
+/*
+ * Create a GMEM device, register its MMU function and the page table.
+ * The returned device pointer will be passed by new_dev.
+ * A unique id will be assigned to the GMEM device, using Linux's xarray.
+ */
+int gm_dev_create(struct gm_mmu *mmu, void *dev_data, unsigned long cap,
+		  struct gm_dev **new_dev)
+{
+	struct gm_dev *dev;
+
+	if (!gmem_is_enabled())
+		return GM_RET_FAILURE_UNKNOWN;
+
+	dev = kmem_cache_alloc(gm_dev_cache, GFP_KERNEL);
+	if (!dev)
+		return GM_RET_NOMEM;
+
+	if (xa_alloc(&gm_dev_id_pool, &dev->id, dev, xa_limit_32b, GFP_KERNEL)) {
+		kmem_cache_free(gm_dev_cache, dev);
+		return GM_RET_NOMEM;
+	}
+
+	dev->capability = cap;
+	dev->mmu = mmu;
+	dev->dev_data = dev_data;
+	dev->current_ctx = NULL;
+	INIT_LIST_HEAD(&dev->gm_ctx_list);
+	*new_dev = dev;
+	nodes_clear(dev->registered_hnodes);
+	return GM_RET_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(gm_dev_create);
+
+int gm_dev_destroy(struct gm_dev *dev)
+{
+	/* TODO: implement it */
+	xa_erase(&gm_dev_id_pool, dev->id);
+	return GM_RET_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(gm_dev_destroy);
+
+int gm_dev_fault(struct mm_struct *mm, unsigned long addr, struct gm_dev *dev,
+		 enum gm_fault_hint hint)
+{
+	int ret = GM_RET_SUCCESS;
+	struct gm_mmu *mmu = dev->mmu;
+	struct device *dma_dev = dev->dma_dev;
+	struct vm_area_struct *vma;
+	struct vm_object *obj;
+	struct gm_mapping *gm_mapping;
+	unsigned long size = HPAGE_SIZE;
+	struct gm_fault_t gmf = {
+		.mm = mm,
+		.va = addr,
+		.dev = dev,
+		.size = size,
+		.copy = false,
+		.hint = hint
+	};
+	struct page *page = NULL;
+
+	mmap_read_lock(mm);
+	obj = mm->vm_obj;
+	if (!obj) {
+		pr_info("gmem: %s no vm_obj\n", __func__);
+		ret = GM_RET_FAILURE_UNKNOWN;
+		goto mmap_unlock;
+	}
+
+	vma = find_vma(mm, addr);
+	if (!vma) {
+		pr_info("gmem: %s no vma\n", __func__);
+		ret = GM_RET_FAILURE_UNKNOWN;
+		goto mmap_unlock;
+	}
+	obj = mm->vm_obj;
+	if (!obj) {
+		pr_info("gmem: %s no vm_obj\n", __func__);
+		ret = GM_RET_FAILURE_UNKNOWN;
+		goto mmap_unlock;
+	}
+
+	xa_lock(obj->logical_page_table);
+	gm_mapping = vm_object_lookup(obj, addr);
+	if (!gm_mapping) {
+		vm_object_mapping_create(obj, addr);
+		gm_mapping = vm_object_lookup(obj, addr);
+	}
+	xa_unlock(obj->logical_page_table);
+
+	mutex_lock(&gm_mapping->lock);
+	if (gm_mapping_nomap(gm_mapping)) {
+		goto peer_map;
+	} else if (gm_mapping_device(gm_mapping)) {
+		if (hint == GM_FAULT_HINT_MARK_HOT) {
+			goto peer_map;
+		} else {
+			ret = 0;
+			goto unlock;
+		}
+	} else if (gm_mapping_cpu(gm_mapping)) {
+		page = gm_mapping->page;
+		if (!page) {
+			pr_err("gmem: host gm_mapping page is NULL. Set nomap\n");
+			gm_mapping_flags_set(gm_mapping, GM_PAGE_NOMAP);
+			goto unlock;
+		}
+		get_page(page);
+		zap_page_range_single(vma, addr, size, NULL);
+		gmf.dma_addr = dma_map_page(dma_dev, page, 0, size, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(dma_dev, gmf.dma_addr))
+			pr_info("gmem: dma map failed\n");
+
+		gmf.copy = true;
+	}
+
+peer_map:
+	ret = mmu->peer_map(&gmf);
+	if (ret != GM_RET_SUCCESS) {
+		if (ret == GM_RET_MIGRATING) {
+			/*
+			 * gmem page is migrating due to overcommit.
+			 * update page to willneed and this will stop page evicting
+			 */
+			gm_mapping_flags_set(gm_mapping, GM_PAGE_WILLNEED);
+			ret = GM_RET_SUCCESS;
+		} else {
+			pr_err("gmem: peer map failed\n");
+			if (page) {
+				gm_mapping_flags_set(gm_mapping, GM_PAGE_NOMAP);
+				put_page(page);
+			}
+		}
+		goto unlock;
+	}
+
+	if (page) {
+		dma_unmap_page(dma_dev, gmf.dma_addr, size, DMA_BIDIRECTIONAL);
+		put_page(page);
+	}
+
+	gm_mapping_flags_set(gm_mapping, GM_PAGE_DEVICE);
+	gm_mapping->dev = dev;
+unlock:
+	mutex_unlock(&gm_mapping->lock);
+mmap_unlock:
+	mmap_read_unlock(mm);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gm_dev_fault);
+
+vm_fault_t gm_host_fault_locked(struct vm_fault *vmf, unsigned int order)
+{
+	vm_fault_t ret = 0;
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & ((1 << order) - 1);
+	struct vm_object *obj = vma->vm_mm->vm_obj;
+	struct gm_mapping *gm_mapping;
+	unsigned long size = HPAGE_SIZE;
+	struct gm_dev *dev;
+	struct device *dma_dev;
+	struct gm_fault_t gmf = {
+		.mm = vma->vm_mm,
+		.va = addr,
+		.size = size,
+		.copy = true,
+	};
+
+	gm_mapping = vm_object_lookup(obj, addr);
+	if (!gm_mapping) {
+		pr_err("gmem: host fault gm_mapping should not be NULL\n");
+		return VM_FAULT_SIGBUS;
+	}
+
+	dev = gm_mapping->dev;
+	gmf.dev = dev;
+	dma_dev = dev->dma_dev;
+	gmf.dma_addr = dma_map_page(dma_dev, vmf->page, 0, size, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(dma_dev, gmf.dma_addr)) {
+		pr_err("gmem: host fault dma mapping error\n");
+		return VM_FAULT_SIGBUS;
+	}
+	if (dev->mmu->peer_unmap(&gmf) != GM_RET_SUCCESS) {
+		pr_err("gmem: peer unmap failed\n");
+		dma_unmap_page(dma_dev, gmf.dma_addr, size, DMA_BIDIRECTIONAL);
+		return VM_FAULT_SIGBUS;
+	}
+
+	dma_unmap_page(dma_dev, gmf.dma_addr, size, DMA_BIDIRECTIONAL);
+	return ret;
+}
+
+int gm_dev_register_physmem(struct gm_dev *dev, unsigned long begin,
+			    unsigned long end)
+{
+	struct gm_mapping *mapping;
+	unsigned long addr = PAGE_ALIGN(begin);
+	unsigned int nid;
+	int i, page_num = (end - addr) >> PAGE_SHIFT;
+	struct hnode *hnode = kmalloc(sizeof(struct hnode), GFP_KERNEL);
+
+	if (!hnode)
+		goto err;
+
+	nid = alloc_hnode_id();
+	if (nid == MAX_NUMNODES)
+		goto free_hnode;
+	hnode_init(hnode, nid, dev);
+
+	/*
+	 * TODO: replace the xarray bookkeeping code with an isolated buddy
+	 * allocator here. Implement customized device page struct, which is
+	 * trimmed for application-level usage.
+	 */
+	mapping = kvmalloc(sizeof(struct gm_mapping) * page_num, GFP_KERNEL);
+	if (!mapping)
+		goto deinit_hnode;
+
+	for (i = 0; i < page_num; i++, addr += PAGE_SIZE) {
+		mapping[i].pfn = addr >> PAGE_SHIFT;
+		mapping[i].flag = 0;
+	}
+
+	xa_lock(&hnode->pages);
+	for (i = 0; i < page_num; i++) {
+		if (xa_err(__xa_store(&hnode->pages, i, mapping + i, GFP_KERNEL))) {
+			kvfree(mapping);
+			xa_unlock(&hnode->pages);
+			goto deinit_hnode;
+		}
+		__xa_set_mark(&hnode->pages, i, XA_MARK_0);
+	}
+	xa_unlock(&hnode->pages);
+
+	return GM_RET_SUCCESS;
+
+deinit_hnode:
+	hnode_deinit(nid, dev);
+	free_hnode_id(nid);
+free_hnode:
+	kfree(hnode);
+err:
+	return -ENOMEM;
+}
+EXPORT_SYMBOL_GPL(gm_dev_register_physmem);
+
+void gm_dev_unregister_physmem(struct gm_dev *dev, unsigned int nid)
+{
+	struct hnode *hnode = get_hnode(nid);
+	struct gm_mapping *mapping = xa_load(&hnode->pages, 0);
+
+	kvfree(mapping);
+	hnode_deinit(nid, dev);
+	free_hnode_id(nid);
+	kfree(hnode);
+}
+EXPORT_SYMBOL_GPL(gm_dev_unregister_physmem);
+
+/* GMEM Virtual Address Space API */
+int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
+{
+	struct gm_as *as;
+
+	if (!new_as)
+		return -EINVAL;
+
+	as = kmem_cache_alloc(gm_as_cache, GFP_ATOMIC);
+	if (!as)
+		return -ENOMEM;
+
+	spin_lock_init(&as->lock);
+	as->start_va = begin;
+	as->end_va = end;
+
+	INIT_LIST_HEAD(&as->gm_ctx_list);
+
+	*new_as = as;
+	return GM_RET_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(gm_as_create);
+
+int gm_as_destroy(struct gm_as *as)
+{
+	struct gm_context *ctx, *tmp_ctx;
+
+	list_for_each_entry_safe(ctx, tmp_ctx, &as->gm_ctx_list, gm_as_link)
+		kfree(ctx);
+
+	kmem_cache_free(gm_as_cache, as);
+
+	return GM_RET_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(gm_as_destroy);
+
+int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
+		 bool activate, struct gm_context **out_ctx)
+{
+	struct gm_context *ctx;
+	int nid;
+	int ret;
+
+	ctx = kmem_cache_alloc(gm_ctx_cache, GFP_KERNEL);
+	if (!ctx)
+		return GM_RET_NOMEM;
+
+	ctx->as = as;
+	ctx->dev = dev;
+	ctx->pmap = NULL;
+	ret = dev->mmu->pmap_create(dev, &ctx->pmap);
+	if (ret) {
+		kmem_cache_free(gm_ctx_cache, ctx);
+		return ret;
+	}
+
+	INIT_LIST_HEAD(&ctx->gm_dev_link);
+	INIT_LIST_HEAD(&ctx->gm_as_link);
+	list_add_tail(&dev->gm_ctx_list, &ctx->gm_dev_link);
+	list_add_tail(&ctx->gm_as_link, &as->gm_ctx_list);
+
+	if (activate) {
+		/*
+		 * Here we should really have a callback function to perform the context switch
+		 * for the hardware. E.g. in x86 this function is effectively flushing the CR3 value.
+		 * Currently we do not care time-sliced context switch, unless someone wants to support it.
+		 */
+		dev->current_ctx = ctx;
+	}
+	*out_ctx = ctx;
+
+	for_each_node_mask(nid, dev->registered_hnodes)
+		node_set(nid, current->mems_allowed);
+	return GM_RET_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(gm_as_attach);
-- 
2.25.1

