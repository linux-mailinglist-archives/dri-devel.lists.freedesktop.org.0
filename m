Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60397FBEAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2951910E57F;
	Tue, 28 Nov 2023 15:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0059210E515;
 Tue, 28 Nov 2023 13:07:15 +0000 (UTC)
Received: from kwepemm000018.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Sfj3X4tZmzvRGs;
 Tue, 28 Nov 2023 20:50:16 +0800 (CST)
Received: from DESKTOP-RAUQ1L5.china.huawei.com (10.174.179.172) by
 kwepemm000018.china.huawei.com (7.193.23.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 20:50:45 +0800
From: Weixi Zhu <weixi.zhu@huawei.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <akpm@linux-foundation.org>
Subject: [RFC PATCH 4/6] mm/gmem: add new syscall hmadvise() to issue memory
 hints for heterogeneous NUMA nodes
Date: Tue, 28 Nov 2023 20:50:23 +0800
Message-ID: <20231128125025.4449-5-weixi.zhu@huawei.com>
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

This patch adds a new syscall, hmadvise(), to issue memory hints for
heterogeneous NUMA nodes. The new syscall effectively extends madvise()
with one additional argument that indicates the NUMA id of a heterogeneous
device, which is not necessarily accessible by the CPU.

The implemented memory hint is MADV_PREFETCH, which guarantees that the
physical data of the given VMA [VA, VA+size) is migrated to a designated
NUMA id, so subsequent accesses from the corresponding device can obtain
local memory access speed. This prefetch hint is internally parallized with
multiple workqueue threads, allowing the page table management to be
overlapped. In a test with Huawei's Ascend NPU card, the MADV_PREFETCH is
able to saturate the host-device bandwidth if the given VMA size is larger
than 16MB.

Signed-off-by: Weixi Zhu <weixi.zhu@huawei.com>
---
 arch/arm64/include/asm/unistd.h         |   2 +-
 arch/arm64/include/asm/unistd32.h       |   2 +
 include/linux/gmem.h                    |   9 +
 include/uapi/asm-generic/mman-common.h  |   3 +
 include/uapi/asm-generic/unistd.h       |   5 +-
 kernel/sys_ni.c                         |   2 +
 mm/gmem.c                               | 222 ++++++++++++++++++++++++
 tools/include/uapi/asm-generic/unistd.h |   5 +-
 8 files changed, 247 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 531effca5f1f..298313d2e0af 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -39,7 +39,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 
-#define __NR_compat_syscalls		457
+#define __NR_compat_syscalls		458
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index 9f7c1bf99526..0d44383b98be 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -919,6 +919,8 @@ __SYSCALL(__NR_futex_wake, sys_futex_wake)
 __SYSCALL(__NR_futex_wait, sys_futex_wait)
 #define __NR_futex_requeue 456
 __SYSCALL(__NR_futex_requeue, sys_futex_requeue)
+#define __NR_hmadvise 457
+__SYSCALL(__NR_hmadvise, sys_hmadvise)
 
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/include/linux/gmem.h b/include/linux/gmem.h
index f424225daa03..97186f29638d 100644
--- a/include/linux/gmem.h
+++ b/include/linux/gmem.h
@@ -22,6 +22,11 @@ static inline bool gmem_is_enabled(void)
 	return static_branch_likely(&gmem_status);
 }
 
+static inline bool vma_is_peer_shared(struct vm_area_struct *vma)
+{
+	return false;
+}
+
 struct gm_dev {
 	int id;
 
@@ -280,6 +285,10 @@ int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
 		 bool activate, struct gm_context **out_ctx);
 #else
 static inline bool gmem_is_enabled(void) { return false; }
+static inline bool vma_is_peer_shared(struct vm_area_struct *vma)
+{
+	return false;
+}
 static inline void hnuma_init(void) {}
 static inline void __init vm_object_init(void)
 {
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..49b22a497c5d 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -79,6 +79,9 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
+/* for hmadvise */
+#define MADV_PREFETCH	26		/* prefetch pages for hNUMA node */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 756b013fb832..a0773d4f7fa5 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -829,8 +829,11 @@ __SYSCALL(__NR_futex_wait, sys_futex_wait)
 #define __NR_futex_requeue 456
 __SYSCALL(__NR_futex_requeue, sys_futex_requeue)
 
+#define __NR_hmadvise 453
+__SYSCALL(__NR_hmadvise, sys_hmadvise)
+
 #undef __NR_syscalls
-#define __NR_syscalls 457
+#define __NR_syscalls 458
 
 /*
  * 32 bit systems traditionally used different
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index e1a6e3c675c0..73bc1b35b8c6 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -374,3 +374,5 @@ COND_SYSCALL(setuid16);
 
 /* restartable sequence */
 COND_SYSCALL(rseq);
+
+COND_SYSCALL(hmadvise);
diff --git a/mm/gmem.c b/mm/gmem.c
index b95b6b42ed6d..4eb522026a0d 100644
--- a/mm/gmem.c
+++ b/mm/gmem.c
@@ -9,6 +9,8 @@
 #include <linux/mm.h>
 #include <linux/gmem.h>
 #include <linux/dma-mapping.h>
+#include <linux/syscalls.h>
+#include <linux/mman.h>
 
 DEFINE_STATIC_KEY_FALSE(gmem_status);
 EXPORT_SYMBOL_GPL(gmem_status);
@@ -484,3 +486,223 @@ int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
 	return GM_RET_SUCCESS;
 }
 EXPORT_SYMBOL_GPL(gm_as_attach);
+
+struct prefetch_data {
+	struct mm_struct *mm;
+	struct gm_dev *dev;
+	unsigned long addr;
+	size_t size;
+	struct work_struct work;
+	int *res;
+};
+
+static void prefetch_work_cb(struct work_struct *work)
+{
+	struct prefetch_data *d =
+		container_of(work, struct prefetch_data, work);
+	unsigned long addr = d->addr, end = d->addr + d->size;
+	int page_size = HPAGE_SIZE;
+	int ret;
+
+	do {
+		/*
+		 * Pass a hint to tell gm_dev_fault() to invoke peer_map anyways
+		 * and implicitly mark the mapped physical page as recently-used.
+		 */
+		ret = gm_dev_fault(d->mm, addr, d->dev, GM_FAULT_HINT_MARK_HOT);
+		if (ret == GM_RET_PAGE_EXIST) {
+			pr_info("%s: device has done page fault, ignore prefetch\n", __func__);
+		} else if (ret != GM_RET_SUCCESS) {
+			*d->res = -EFAULT;
+			pr_err("%s: call dev fault error %d\n", __func__, ret);
+		}
+	} while (addr += page_size, addr != end);
+
+	kfree(d);
+}
+
+static int hmadvise_do_prefetch(struct gm_dev *dev, unsigned long addr, size_t size)
+{
+	unsigned long start, end, per_size;
+	int page_size = HPAGE_SIZE;
+	struct prefetch_data *data;
+	struct vm_area_struct *vma;
+	int res = GM_RET_SUCCESS;
+
+	end = round_up(addr + size, page_size);
+	start = round_down(addr, page_size);
+	size = end - start;
+
+	mmap_read_lock(current->mm);
+	vma = find_vma(current->mm, start);
+	if (!vma || start < vma->vm_start || end > vma->vm_end) {
+		mmap_read_unlock(current->mm);
+		return GM_RET_FAILURE_UNKNOWN;
+	}
+	mmap_read_unlock(current->mm);
+
+	per_size = (size / GM_WORK_CONCURRENCY) & ~(page_size - 1);
+
+	while (start < end) {
+		data = kzalloc(sizeof(struct prefetch_data), GFP_KERNEL);
+		if (!data) {
+			flush_workqueue(prefetch_wq);
+			return GM_RET_NOMEM;
+		}
+
+		INIT_WORK(&data->work, prefetch_work_cb);
+		data->mm = current->mm;
+		data->dev = dev;
+		data->addr = start;
+		data->res = &res;
+		if (per_size == 0)
+			data->size = size;
+		else
+			data->size = (end - start < 2 * per_size) ? (end - start) : per_size;
+		queue_work(prefetch_wq, &data->work);
+		start += data->size;
+	}
+
+	flush_workqueue(prefetch_wq);
+	return res;
+}
+
+static int gm_unmap_page_range(struct vm_area_struct *vma, unsigned long start,
+			       unsigned long end, int page_size)
+{
+	struct gm_fault_t gmf = {
+		.mm = current->mm,
+		.size = page_size,
+		.copy = false,
+	};
+	struct gm_mapping *gm_mapping;
+	struct vm_object *obj;
+	int ret;
+
+	obj = current->mm->vm_obj;
+	if (!obj) {
+		pr_err("gmem: peer-shared vma should have vm_object\n");
+		return -EINVAL;
+	}
+
+	for (; start < end; start += page_size) {
+		xa_lock(obj->logical_page_table);
+		gm_mapping = vm_object_lookup(obj, start);
+		if (!gm_mapping) {
+			xa_unlock(obj->logical_page_table);
+			continue;
+		}
+		xa_unlock(obj->logical_page_table);
+		mutex_lock(&gm_mapping->lock);
+		if (gm_mapping_nomap(gm_mapping)) {
+			mutex_unlock(&gm_mapping->lock);
+			continue;
+		} else if (gm_mapping_cpu(gm_mapping)) {
+			zap_page_range_single(vma, start, page_size, NULL);
+		} else {
+			gmf.va = start;
+			gmf.dev = gm_mapping->dev;
+			ret = gm_mapping->dev->mmu->peer_unmap(&gmf);
+			if (ret) {
+				pr_err("gmem: peer_unmap failed. ret %d\n",
+				       ret);
+				mutex_unlock(&gm_mapping->lock);
+				continue;
+			}
+		}
+		gm_mapping_flags_set(gm_mapping, GM_PAGE_NOMAP);
+		mutex_unlock(&gm_mapping->lock);
+	}
+
+	return 0;
+}
+
+static int hmadvise_do_eagerfree(unsigned long addr, size_t size)
+{
+	unsigned long start, end, i_start, i_end;
+	int page_size = HPAGE_SIZE;
+	struct vm_area_struct *vma;
+	int ret = GM_RET_SUCCESS;
+	unsigned long old_start;
+
+	if (check_add_overflow(addr, size, &end))
+		return -EINVAL;
+
+	old_start = addr;
+
+	end = round_down(addr + size, page_size);
+	start = round_up(addr, page_size);
+	if (start >= end)
+		return ret;
+
+	mmap_read_lock(current->mm);
+	do {
+		vma = find_vma_intersection(current->mm, start, end);
+		if (!vma) {
+			pr_info("gmem: there is no valid vma\n");
+			break;
+		}
+
+		if (!vma_is_peer_shared(vma)) {
+			pr_debug("gmem: not peer-shared vma, skip dontneed\n");
+			start = vma->vm_end;
+			continue;
+		}
+
+		i_start = start > vma->vm_start ? start : vma->vm_start;
+		i_end = end < vma->vm_end ? end : vma->vm_end;
+		ret = gm_unmap_page_range(vma, i_start, i_end, page_size);
+		if (ret)
+			break;
+
+		start = vma->vm_end;
+	} while (start < end);
+
+	mmap_read_unlock(current->mm);
+	return ret;
+}
+
+static bool check_hmadvise_behavior(int behavior)
+{
+	return behavior == MADV_DONTNEED;
+}
+
+SYSCALL_DEFINE4(hmadvise, int, hnid, unsigned long, start, size_t, len_in, int, behavior)
+{
+	int error = -EINVAL;
+	struct hnode *node;
+
+	if (hnid == -1) {
+		if (check_hmadvise_behavior(behavior)) {
+			goto no_hnid;
+		} else {
+			pr_err("hmadvise: behavior %d need hnid or is invalid\n",
+				behavior);
+			return error;
+		}
+	}
+
+	if (hnid < 0)
+		return error;
+
+	if (!is_hnode(hnid) || !is_hnode_allowed(hnid))
+		return error;
+
+	node = get_hnode(hnid);
+	if (!node) {
+		pr_err("hmadvise: hnode id %d is invalid\n", hnid);
+		return error;
+	}
+
+no_hnid:
+	switch (behavior) {
+	case MADV_PREFETCH:
+		return hmadvise_do_prefetch(node->dev, start, len_in);
+	case MADV_DONTNEED:
+		return hmadvise_do_eagerfree(start, len_in);
+	default:
+		pr_err("hmadvise: unsupported behavior %d\n", behavior);
+	}
+
+	return error;
+}
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 76d946445391..6d28d7a4096c 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -823,8 +823,11 @@ __SYSCALL(__NR_cachestat, sys_cachestat)
 #define __NR_fchmodat2 452
 __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
 
+#define __NR_hmadvise 453
+__SYSCALL(__NR_hmadvise, sys_hmadvise)
+
 #undef __NR_syscalls
-#define __NR_syscalls 453
+#define __NR_syscalls 454
 
 /*
  * 32 bit systems traditionally used different
-- 
2.25.1

