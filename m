Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E37FBEAF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0746010E581;
	Tue, 28 Nov 2023 15:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4110E066;
 Tue, 28 Nov 2023 13:09:20 +0000 (UTC)
Received: from kwepemm000018.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Sfhyb0vfNzMnS3;
 Tue, 28 Nov 2023 20:45:59 +0800 (CST)
Received: from DESKTOP-RAUQ1L5.china.huawei.com (10.174.179.172) by
 kwepemm000018.china.huawei.com (7.193.23.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 20:50:47 +0800
From: Weixi Zhu <weixi.zhu@huawei.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <akpm@linux-foundation.org>
Subject: [RFC PATCH 5/6] mm/gmem: resolve VMA conflicts for attached peer
 devices
Date: Tue, 28 Nov 2023 20:50:24 +0800
Message-ID: <20231128125025.4449-6-weixi.zhu@huawei.com>
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

This patch resolves potential VMA conflicts when
mmap(MAP_PRIVATE | MAP_PEER_SHARED) is invoked. Note that the semantic of
mmap(MAP_PRIVATE | MAP_PEER_SHARED) is to provide a coherent view of memory
through the allocated virtual addresses between the CPU and all attached
devices. However, an attached device may create its own computing context
that does not necessarily share the same address space layout with the CPU
process. Therefore, the mmap() syscall must return virtual addresses that
are guaranteed to be valid across all attached peer devices.

In current implementation, if a candidate VMA is detected to be
conflicting, it will be temporarily blacklisted. The mmap_region()
function will retry other VMA candidates for a predefined number of
iterations.

Signed-off-by: Weixi Zhu <weixi.zhu@huawei.com>
---
 fs/proc/task_mmu.c                     |  3 ++
 include/linux/gmem.h                   | 26 +++++++++++++++-
 include/linux/mm.h                     |  8 +++++
 include/uapi/asm-generic/mman-common.h |  1 +
 kernel/fork.c                          |  4 +++
 mm/gmem.c                              | 38 ++++++++++++++++++++++++
 mm/mempolicy.c                         |  4 +++
 mm/mmap.c                              | 38 ++++++++++++++++++++++--
 mm/vm_object.c                         | 41 ++++++++++++++++++++++++++
 9 files changed, 159 insertions(+), 4 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index ef2eb12906da..5af03d8f0319 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -701,6 +701,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_GMEM
+		[ilog2(VM_PEER_SHARED)]	= "ps",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/gmem.h b/include/linux/gmem.h
index 97186f29638d..82d88df5ce44 100644
--- a/include/linux/gmem.h
+++ b/include/linux/gmem.h
@@ -24,7 +24,10 @@ static inline bool gmem_is_enabled(void)
 
 static inline bool vma_is_peer_shared(struct vm_area_struct *vma)
 {
-	return false;
+	if (!gmem_is_enabled())
+		return false;
+
+	return !!(vma->vm_flags & VM_PEER_SHARED);
 }
 
 struct gm_dev {
@@ -130,6 +133,8 @@ void unmap_gm_mappings_range(struct vm_area_struct *vma, unsigned long start,
 			     unsigned long end);
 void munmap_in_peer_devices(struct mm_struct *mm, unsigned long start,
 			    unsigned long end);
+void gm_reserve_vma(struct vm_area_struct *value, struct list_head *head);
+void gm_release_vma(struct mm_struct *mm, struct list_head *head);
 
 /* core gmem */
 enum gm_ret {
@@ -283,6 +288,10 @@ int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as);
 int gm_as_destroy(struct gm_as *as);
 int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
 		 bool activate, struct gm_context **out_ctx);
+
+int gm_alloc_va_in_peer_devices(struct mm_struct *mm,
+				struct vm_area_struct *vma, unsigned long addr,
+				unsigned long len, vm_flags_t vm_flags);
 #else
 static inline bool gmem_is_enabled(void) { return false; }
 static inline bool vma_is_peer_shared(struct vm_area_struct *vma)
@@ -339,6 +348,21 @@ int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
 {
 	return 0;
 }
+static inline void gm_reserve_vma(struct vm_area_struct *value,
+				  struct list_head *head)
+{
+}
+static inline void gm_release_vma(struct mm_struct *mm, struct list_head *head)
+{
+}
+static inline int gm_alloc_va_in_peer_devices(struct mm_struct *mm,
+					      struct vm_area_struct *vma,
+					      unsigned long addr,
+					      unsigned long len,
+					      vm_flags_t vm_flags)
+{
+	return 0;
+}
 #endif
 
 #endif /* _GMEM_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..8837624e4c66 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -320,14 +320,22 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 #define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 #define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
 #define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
+#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
 #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 
+#ifdef CONFIG_GMEM
+#define VM_PEER_SHARED	VM_HIGH_ARCH_6
+#else
+#define VM_PEER_SHARED	VM_NONE
+#endif
+
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
 # define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 49b22a497c5d..eebdbb2375f8 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_PEER_SHARED		0x8000000	/* Coherent memory available for both CPU and attached devices. */
 
 /*
  * Flags for mlock
diff --git a/kernel/fork.c b/kernel/fork.c
index 10917c3e1f03..eab96cdb25a6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -99,6 +99,7 @@
 #include <linux/stackprotector.h>
 #include <linux/user_events.h>
 #include <linux/iommu.h>
+#include <linux/gmem.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -1692,6 +1693,9 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 	if (err)
 		goto free_pt;
 
+#ifdef CONFIG_GMEM
+	mm->vm_obj = NULL;
+#endif
 	mm->hiwater_rss = get_mm_rss(mm);
 	mm->hiwater_vm = mm->total_vm;
 
diff --git a/mm/gmem.c b/mm/gmem.c
index 4eb522026a0d..5f4f26030163 100644
--- a/mm/gmem.c
+++ b/mm/gmem.c
@@ -617,6 +617,44 @@ static int gm_unmap_page_range(struct vm_area_struct *vma, unsigned long start,
 	return 0;
 }
 
+int gm_alloc_va_in_peer_devices(struct mm_struct *mm,
+				struct vm_area_struct *vma, unsigned long addr,
+				unsigned long len, vm_flags_t vm_flags)
+{
+	struct gm_context *ctx, *tmp;
+	int ret;
+
+	pr_debug("gmem: start mmap, as %p\n", mm->gm_as);
+	if (!mm->gm_as)
+		return -ENODEV;
+
+	if (!mm->vm_obj)
+		mm->vm_obj = vm_object_create(mm);
+	if (!mm->vm_obj)
+		return -ENOMEM;
+	/*
+	 * TODO: solve the race condition if a device is concurrently attached
+	 * to mm->gm_as.
+	 */
+	list_for_each_entry_safe(ctx, tmp, &mm->gm_as->gm_ctx_list, gm_as_link) {
+		if (!gm_dev_is_peer(ctx->dev))
+			continue;
+
+		if (!ctx->dev->mmu->peer_va_alloc_fixed) {
+			pr_debug("gmem: mmu ops has no alloc_vma\n");
+			continue;
+		}
+
+		ret = ctx->dev->mmu->peer_va_alloc_fixed(mm, addr, len, vm_flags);
+		if (ret != GM_RET_SUCCESS) {
+			pr_debug("gmem: alloc_vma ret %d\n", ret);
+			return ret;
+		}
+	}
+
+	return GM_RET_SUCCESS;
+}
+
 static int hmadvise_do_eagerfree(unsigned long addr, size_t size)
 {
 	unsigned long start, end, i_start, i_end;
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 10a590ee1c89..9fc298480498 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1719,7 +1719,11 @@ SYSCALL_DEFINE5(get_mempolicy, int __user *, policy,
 
 bool vma_migratable(struct vm_area_struct *vma)
 {
+#ifdef CONFIG_GMEM
+	if (vma->vm_flags & (VM_IO | VM_PFNMAP | VM_PEER_SHARED))
+#else
 	if (vma->vm_flags & (VM_IO | VM_PFNMAP))
+#endif
 		return false;
 
 	/*
diff --git a/mm/mmap.c b/mm/mmap.c
index 1971bfffcc03..55d43763ea49 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -47,6 +47,7 @@
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
 #include <linux/ksm.h>
+#include <linux/gmem.h>
 
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
@@ -1376,6 +1377,9 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			vm_flags |= VM_NORESERVE;
 	}
 
+	if (gmem_is_enabled() && (flags & MAP_PEER_SHARED))
+		vm_flags |= VM_PEER_SHARED;
+
 	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
 	if (!IS_ERR_VALUE(addr) &&
 	    ((vm_flags & VM_LOCKED) ||
@@ -1832,6 +1836,7 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	}
 
 	addr = get_area(file, addr, len, pgoff, flags);
+
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -2756,7 +2761,10 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	pgoff_t vm_pgoff;
 	int error;
 	VMA_ITERATOR(vmi, mm, addr);
+	unsigned int retry_times = 0;
+	LIST_HEAD(reserve_list);
 
+retry:
 	/* Check against address space limit. */
 	if (!may_expand_vm(mm, vm_flags, len >> PAGE_SHIFT)) {
 		unsigned long nr_pages;
@@ -2768,21 +2776,27 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		nr_pages = count_vma_pages_range(mm, addr, end);
 
 		if (!may_expand_vm(mm, vm_flags,
-					(len >> PAGE_SHIFT) - nr_pages))
+					(len >> PAGE_SHIFT) - nr_pages)) {
+			gm_release_vma(mm, &reserve_list);
 			return -ENOMEM;
+		}
 	}
 
 	/* Unmap any existing mapping in the area */
-	if (do_vmi_munmap(&vmi, mm, addr, len, uf, false))
+	if (do_vmi_munmap(&vmi, mm, addr, len, uf, false)) {
+		gm_release_vma(mm, &reserve_list);
 		return -ENOMEM;
+	}
 
 	/*
 	 * Private writable mapping: check memory availability
 	 */
 	if (accountable_mapping(file, vm_flags)) {
 		charged = len >> PAGE_SHIFT;
-		if (security_vm_enough_memory_mm(mm, charged))
+		if (security_vm_enough_memory_mm(mm, charged)) {
+			gm_release_vma(mm, &reserve_list);
 			return -ENOMEM;
+		}
 		vm_flags |= VM_ACCOUNT;
 	}
 
@@ -2945,6 +2959,21 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	file = vma->vm_file;
 	ksm_add_vma(vma);
 expanded:
+	if (vma_is_peer_shared(vma)) {
+		int ret = gm_alloc_va_in_peer_devices(mm, vma, addr, len, vm_flags);
+
+		if (ret == GM_RET_NOMEM && retry_times < GMEM_MMAP_RETRY_TIMES) {
+			retry_times++;
+			addr = get_unmapped_area(file, addr, len, pgoff, 0);
+			gm_reserve_vma(vma, &reserve_list);
+			goto retry;
+		} else if (ret != GM_RET_SUCCESS) {
+			pr_debug("gmem: alloc_vma ret %d\n", ret);
+			error = -ENOMEM;
+			goto free_vma;
+		}
+		gm_release_vma(mm, &reserve_list);
+	}
 	perf_event_mmap(vma);
 
 	vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
@@ -2995,6 +3024,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 unacct_error:
 	if (charged)
 		vm_unacct_memory(charged);
+	gm_release_vma(mm, &reserve_list);
 	validate_mm(mm);
 	return error;
 }
@@ -3336,6 +3366,8 @@ void exit_mmap(struct mm_struct *mm)
 
 	BUG_ON(count != mm->map_count);
 
+	vm_object_drop_locked(mm);
+
 	trace_exit_mmap(mm);
 	__mt_destroy(&mm->mm_mt);
 	mmap_write_unlock(mm);
diff --git a/mm/vm_object.c b/mm/vm_object.c
index 4e76737e0ca1..5432930d1226 100644
--- a/mm/vm_object.c
+++ b/mm/vm_object.c
@@ -163,6 +163,9 @@ void unmap_gm_mappings_range(struct vm_area_struct *vma, unsigned long start,
 	struct gm_mapping *gm_mapping;
 	struct page *page = NULL;
 
+	if (!vma_is_peer_shared(vma))
+		return;
+
 	if (!vma->vm_mm->vm_obj)
 		return;
 
@@ -182,3 +185,41 @@ void unmap_gm_mappings_range(struct vm_area_struct *vma, unsigned long start,
 	}
 	xa_unlock(logical_page_table);
 }
+
+struct gm_vma_list {
+	struct vm_area_struct *vma;
+	struct list_head list;
+};
+
+void gm_reserve_vma(struct vm_area_struct *value, struct list_head *head)
+{
+	struct gm_vma_list *node;
+
+	if (!gmem_is_enabled())
+		return;
+
+	node = kmalloc(sizeof(struct gm_vma_list), GFP_KERNEL);
+	if (!node)
+		return;
+
+	node->vma = value;
+	list_add_tail(&node->list, head);
+}
+
+void gm_release_vma(struct mm_struct *mm, struct list_head *head)
+{
+	struct gm_vma_list *node, *next;
+
+	if (!gmem_is_enabled())
+		return;
+
+	list_for_each_entry_safe(node, next, head, list) {
+		struct vm_area_struct *vma = node->vma;
+
+		if (vma != NULL)
+			vm_area_free(vma);
+
+		list_del(&node->list);
+		kfree(node);
+	}
+}
-- 
2.25.1

