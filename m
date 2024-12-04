Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1E9E3CBB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C510E4B2;
	Wed,  4 Dec 2024 14:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D710E340;
 Wed,  4 Dec 2024 14:31:18 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2.1 1/1] kernel/cgroup: Add "dmem" memory accounting cgroup
Date: Wed,  4 Dec 2024 15:31:11 +0100
Message-ID: <20241204143112.1250983-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204134410.1161769-2-dev@lankhorst.se>
References: <20241204134410.1161769-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This code is based on the RDMA and misc cgroup initially, but now
uses page_counter. It uses the same min/low/max semantics as the memory
cgroup as a result.

There's a small mismatch as TTM uses u64, and page_counter long pages.
In practice it's not a problem. 32-bits systems don't really come with
>=4GB cards and as long as we're consistently wrong with units, it's
fine. The device page size may not be in the same units as kernel page
size, and each region might also have a different page size (VRAM vs GART
for example).

The interface is simple:
- Call dmem_cgroup_register_region()
- Use dmem_cgroup_try_charge to check if you can allocate a chunk of memory,
  use dmem_cgroup__uncharge when freeing it. This may return an error code,
  or -EAGAIN when the cgroup limit is reached. In that case a reference
  to the limiting pool is returned.
- The limiting cs can be used as compare function for
  dmem_cgroup_state_evict_valuable.
- After having evicted enough, drop reference to limiting cs with
  dmem_cgroup_pool_state_put.

This API allows you to limit device resources with cgroups.
You can see the supported cards in /sys/fs/cgroup/dmem.capacity
You need to echo +dmem to cgroup.subtree_control, and then you can
partition device memory.

Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
Co-developed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
I completely messed up the !CONFIG_CGROUP_DMEM path. Resending just this patch to compile cleanly without CONFIG_CGROUP_DMEM enabled.

 Documentation/admin-guide/cgroup-v2.rst |  58 +-
 Documentation/core-api/cgroup.rst       |   9 +
 Documentation/core-api/index.rst        |   1 +
 Documentation/gpu/drm-compute.rst       |  54 ++
 include/linux/cgroup_dmem.h             |  66 ++
 include/linux/cgroup_subsys.h           |   4 +
 include/linux/page_counter.h            |   2 +-
 init/Kconfig                            |  10 +
 kernel/cgroup/Makefile                  |   1 +
 kernel/cgroup/dmem.c                    | 861 ++++++++++++++++++++++++
 mm/page_counter.c                       |   4 +-
 11 files changed, 1060 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dmem.h
 create mode 100644 kernel/cgroup/dmem.c

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 315ede811c9d0..cb1b4e759b7e2 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -64,13 +64,14 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
      5-6. Device
      5-7. RDMA
        5-7-1. RDMA Interface Files
-     5-8. HugeTLB
-       5.8-1. HugeTLB Interface Files
-     5-9. Misc
-       5.9-1 Miscellaneous cgroup Interface Files
-       5.9-2 Migration and Ownership
-     5-10. Others
-       5-10-1. perf_event
+     5-8. DMEM
+     5-9. HugeTLB
+       5.9-1. HugeTLB Interface Files
+     5-10. Misc
+       5.10-1 Miscellaneous cgroup Interface Files
+       5.10-2 Migration and Ownership
+     5-11. Others
+       5-11-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2626,6 +2627,49 @@ RDMA Interface Files
 	  mlx4_0 hca_handle=1 hca_object=20
 	  ocrdma1 hca_handle=1 hca_object=23
 
+DMEM
+----
+
+The "dmem" controller regulates the distribution and accounting of
+device memory regions. Because each memory region may have its own page size,
+which does not have to be equal to the system page size, the units are always bytes.
+
+DMEM Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+  dmem.max, dmem.min, dmem.low
+	A readwrite nested-keyed file that exists for all the cgroups
+	except root that describes current configured resource limit
+	for a region.
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0/vram0 1073741824
+	  drm/0000:03:00.0/stolen max
+
+	The semantics are the same as for the memory cgroup controller, and are
+	calculated in the same way.
+
+  dmem.capacity
+	A read-only file that describes maximum region capacity.
+	It only exists on the root cgroup. Not all memory can be
+	allocated by cgroups, as the kernel reserves some for
+	internal use.
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0/vram0 8514437120
+	  drm/0000:03:00.0/stolen 67108864
+
+  dmem.current
+	A read-only file that describes current resource usage.
+	It exists for all the cgroup except root.
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0/vram0 12550144
+	  drm/0000:03:00.0/stolen 8650752
+
 HugeTLB
 -------
 
diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/cgroup.rst
new file mode 100644
index 0000000000000..8696e9513f511
--- /dev/null
+++ b/Documentation/core-api/cgroup.rst
@@ -0,0 +1,9 @@
+==================
+Cgroup Kernel APIs
+==================
+
+Device Memory Cgroup API (dmemcg)
+=========================
+.. kernel-doc:: kernel/cgroup/dmem.c
+   :export:
+
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 563b8fc0002f7..913d91feaf760 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -109,6 +109,7 @@ more memory-management documentation in Documentation/mm/index.rst.
    dma-isa-lpc
    swiotlb
    mm-api
+   cgroup
    genalloc
    pin_user_pages
    boot-time-mm
diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-compute.rst
new file mode 100644
index 0000000000000..f90c3e63aa9e5
--- /dev/null
+++ b/Documentation/gpu/drm-compute.rst
@@ -0,0 +1,54 @@
+==================================
+Long running workloads and compute
+==================================
+
+Long running workloads (compute) are workloads that will not complete in 10
+seconds. (The time let the user wait before he reaches for the power button).
+This means that other techniques need to be used to manage those workloads,
+that cannot use fences.
+
+Some hardware may schedule compute jobs, and have no way to pre-empt them, or
+have their memory swapped out from them. Or they simply want their workload
+not to be preempted or swapped out at all.
+
+This means that it differs from what is described in driver-api/dma-buf.rst.
+
+As with normal compute jobs, dma-fence may not be used at all. In this case,
+not even to force preemption. The driver with is simply forced to unmap a BO
+from the long compute job's address space on unbind immediately, not even
+waiting for the workload to complete. Effectively this terminates the workload
+when there is no hardware support to recover.
+
+Since this is undesirable, there need to be mitigations to prevent a workload
+from being terminated. There are several possible approach, all with their
+advantages and drawbacks.
+
+The first approach you will likely try is to pin all buffers used by compute.
+This guarantees that the job will run uninterrupted, but also allows a very
+denial of service attack by pinning as much memory as possible, hogging the
+all GPU memory, and possibly a huge chunk of CPU memory.
+
+A second approach that will work slightly better on its own is adding an option
+not to evict when creating a new job (any kind). If all of userspace opts in
+to this flag, it would prevent cooperating userspace from forced terminating
+older compute jobs to start a new one.
+
+If job preemption and recoverable pagefaults are not available, those are the
+only approaches possible. So even with those, you want a separate way of
+controlling resources. The standard kernel way of doing so is cgroups.
+
+This creates a third option, using cgroups to prevent eviction. Both GPU and
+driver-allocated CPU memory would be accounted to the correct cgroup, and
+eviction would be made cgroup aware. This allows the GPU to be partitioned
+into cgroups, that will allow jobs to run next to each other without
+interference.
+
+The interface to the cgroup would be similar to the current CPU memory
+interface, with similar semantics for min/low/high/max, if eviction can
+be made cgroup aware.
+
+What should be noted is that each memory region (tiled memory for example)
+should have its own accounting.
+
+The key is set to the regionid set by the driver, for example "tile0".
+For the value of $card, we use drmGetUnique().
diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
new file mode 100644
index 0000000000000..dd4869f1d736e
--- /dev/null
+++ b/include/linux/cgroup_dmem.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _CGROUP_DMEM_H
+#define _CGROUP_DMEM_H
+
+#include <linux/types.h>
+#include <linux/llist.h>
+
+struct dmem_cgroup_pool_state;
+
+/* Opaque definition of a cgroup region, used internally */
+struct dmem_cgroup_region;
+
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *dmem_cgroup_register_region(u64 size, const char *name_fmt, ...) __printf(2,3);
+void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region);
+int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
+			   struct dmem_cgroup_pool_state **ret_pool,
+			   struct dmem_cgroup_pool_state **ret_limit_pool);
+void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size);
+bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
+				      struct dmem_cgroup_pool_state *test_pool,
+				      bool ignore_low, bool *ret_hit_low);
+
+void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
+#else
+static inline __printf(2,3) struct dmem_cgroup_region *
+dmem_cgroup_register_region(u64 size, const char *name_fmt, ...)
+{
+	return NULL;
+}
+
+static inline void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
+{ }
+
+static inline int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
+					 struct dmem_cgroup_pool_state **ret_pool,
+					 struct dmem_cgroup_pool_state **ret_limit_pool)
+{
+	*ret_pool = NULL;
+
+	if (ret_limit_pool)
+		*ret_limit_pool = NULL;
+
+	return 0;
+}
+
+static inline void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
+{ }
+
+static inline
+bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
+				      struct dmem_cgroup_pool_state *test_pool,
+				      bool ignore_low, bool *ret_hit_low)
+{
+	return true;
+}
+
+static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
+{ }
+
+#endif
+#endif	/* _CGROUP_DMEM_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index 4452354872307..3fd0bcbf30803 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -65,6 +65,10 @@ SUBSYS(rdma)
 SUBSYS(misc)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+SUBSYS(dmem)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 79dbd8bc35a72..46406f3fe34d0 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -96,7 +96,7 @@ static inline void page_counter_reset_watermark(struct page_counter *counter)
 	counter->watermark = usage;
 }
 
-#ifdef CONFIG_MEMCG
+#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DMEM)
 void page_counter_calculate_protection(struct page_counter *root,
 				       struct page_counter *counter,
 				       bool recursive_protection);
diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0fb..61f50cafa8151 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1128,6 +1128,7 @@ config CGROUP_PIDS
 
 config CGROUP_RDMA
 	bool "RDMA controller"
+	select PAGE_COUNTER
 	help
 	  Provides enforcement of RDMA resources defined by IB stack.
 	  It is fairly easy for consumers to exhaust RDMA resources, which
@@ -1136,6 +1137,15 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
+config CGROUP_DMEM
+	bool "Device memory controller (DMEM)"
+	help
+	  The DMEM controller allows compatible devices to restrict device
+	  memory usage based on the cgroup hierarchy.
+
+	  As an example, it allows you to restrict VRAM usage for applications
+	  in the DRM subsystem.
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index a5c9359d516f8..ede31601a363a 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_CGROUP_RDMA) += rdma.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CPUSETS_V1) += cpuset-v1.o
 obj-$(CONFIG_CGROUP_MISC) += misc.o
+obj-$(CONFIG_CGROUP_DMEM) += dmem.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
new file mode 100644
index 0000000000000..52736ef0ccf25
--- /dev/null
+++ b/kernel/cgroup/dmem.c
@@ -0,0 +1,861 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023-2024 Intel Corporation (Maarten Lankhorst <dev@lankhorst.se>)
+ * Copyright 2024 Red Hat (Maxime Ripard <mripard@kernel.org>)
+ * Partially based on the rdma and misc controllers, which bear the following copyrights:
+ *
+ * Copyright 2020 Google LLC
+ * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
+ */
+
+#include <linux/cgroup.h>
+#include <linux/cgroup_dmem.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/page_counter.h>
+#include <linux/parser.h>
+#include <linux/slab.h>
+
+struct dmem_cgroup_region {
+	/**
+	 * @ref: References keeping the region alive.
+	 * Keeps the region reference alive after a succesful RCU lookup.
+	 */
+	struct kref ref;
+
+	/** @rcu: RCU head for freeing */
+	struct rcu_head rcu;
+
+	/**
+	 * @region_node: Linked into &dmem_cgroup_regions list.
+	 * Protected by RCU and global spinlock.
+	 */
+	struct list_head region_node;
+
+	/**
+	 * @pools: List of pools linked to this region.
+	 * Protected by global spinlock only
+	 */
+	struct list_head pools;
+
+	/** @size: Size of region, in bytes */
+	u64 size;
+
+	/** @name: Name describing the node, set by dmem_cgroup_register_region */
+	char *name;
+
+	/**
+	 * @unregistered: Whether the region is unregistered by its caller.
+	 * No new pools should be added to the region afterwards.
+	 */
+	bool unregistered;
+};
+
+struct dmemcg_state {
+	struct cgroup_subsys_state css;
+
+	struct list_head pools;
+};
+
+struct dmem_cgroup_pool_state {
+	struct dmem_cgroup_region *region;
+	struct dmemcg_state *cs;
+
+	/* css node, RCU protected against region teardown */
+	struct list_head	css_node;
+
+	/* dev node, no RCU protection required */
+	struct list_head	region_node;
+
+	struct rcu_head rcu;
+
+	struct page_counter cnt;
+
+	bool inited;
+};
+
+/*
+ * 3 operations require locking protection:
+ * - Registering and unregistering region to/from list, requires global lock.
+ * - Adding a dmem_cgroup_pool_state to a CSS, removing when CSS is freed.
+ * - Adding a dmem_cgroup_pool_state to a region list.
+ *
+ * Since for the most common operations RCU provides enough protection, I
+ * do not think more granular locking makes sense. Most protection is offered
+ * by RCU and the lockless operating page_counter.
+ */
+static DEFINE_SPINLOCK(dmemcg_lock);
+static LIST_HEAD(dmem_cgroup_regions);
+
+static inline struct dmemcg_state *
+css_to_dmemcs(struct cgroup_subsys_state *css)
+{
+	return container_of(css, struct dmemcg_state, css);
+}
+
+static inline struct dmemcg_state *get_current_dmemcs(void)
+{
+	return css_to_dmemcs(task_get_css(current, dmem_cgrp_id));
+}
+
+static struct dmemcg_state *parent_dmemcs(struct dmemcg_state *cg)
+{
+	return cg->css.parent ? css_to_dmemcs(cg->css.parent) : NULL;
+}
+
+static void free_cg_pool(struct dmem_cgroup_pool_state *pool)
+{
+	list_del(&pool->region_node);
+	kfree(pool);
+}
+
+static void
+set_resource_min(struct dmem_cgroup_pool_state *pool, u64 val)
+{
+	page_counter_set_min(&pool->cnt, val);
+}
+
+static void
+set_resource_low(struct dmem_cgroup_pool_state *pool, u64 val)
+{
+	page_counter_set_low(&pool->cnt, val);
+}
+
+static void
+set_resource_max(struct dmem_cgroup_pool_state *pool, u64 val)
+{
+	page_counter_set_max(&pool->cnt, val);
+}
+
+static u64 get_resource_low(struct dmem_cgroup_pool_state *pool)
+{
+	return pool ? READ_ONCE(pool->cnt.low) : 0;
+}
+
+static u64 get_resource_min(struct dmem_cgroup_pool_state *pool)
+{
+	return pool ? READ_ONCE(pool->cnt.min) : 0;
+}
+
+static u64 get_resource_max(struct dmem_cgroup_pool_state *pool)
+{
+	return pool ? READ_ONCE(pool->cnt.max) : PAGE_COUNTER_MAX;
+}
+
+static u64 get_resource_current(struct dmem_cgroup_pool_state *pool)
+{
+	return pool ? page_counter_read(&pool->cnt) : 0;
+}
+
+static void reset_all_resource_limits(struct dmem_cgroup_pool_state *rpool)
+{
+	set_resource_min(rpool, 0);
+	set_resource_low(rpool, 0);
+	set_resource_max(rpool, PAGE_COUNTER_MAX);
+}
+
+static void dmemcs_offline(struct cgroup_subsys_state *css)
+{
+	struct dmemcg_state *dmemcs = css_to_dmemcs(css);
+	struct dmem_cgroup_pool_state *pool;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(pool, &dmemcs->pools, css_node)
+		reset_all_resource_limits(pool);
+	rcu_read_unlock();
+}
+
+static void dmemcs_free(struct cgroup_subsys_state *css)
+{
+	struct dmemcg_state *dmemcs = css_to_dmemcs(css);
+	struct dmem_cgroup_pool_state *pool, *next;
+
+	spin_lock(&dmemcg_lock);
+	list_for_each_entry_safe(pool, next, &dmemcs->pools, css_node) {
+		/*
+		 *The pool is dead and all references are 0,
+		 * no need for RCU protection with list_del_rcu or freeing.
+		 */
+		list_del(&pool->css_node);
+		free_cg_pool(pool);
+	}
+	spin_unlock(&dmemcg_lock);
+
+	kfree(dmemcs);
+}
+
+static struct cgroup_subsys_state *
+dmemcs_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct dmemcg_state *dmemcs = kzalloc(sizeof(*dmemcs), GFP_KERNEL);
+	if (!dmemcs)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&dmemcs->pools);
+	return &dmemcs->css;
+}
+
+static struct dmem_cgroup_pool_state *
+find_cg_pool_locked(struct dmemcg_state *dmemcs, struct dmem_cgroup_region *region)
+{
+	struct dmem_cgroup_pool_state *pool;
+
+	list_for_each_entry_rcu(pool, &dmemcs->pools, css_node, spin_is_locked(&dmemcg_lock))
+		if (pool->region == region)
+			return pool;
+
+	return NULL;
+}
+
+static struct dmem_cgroup_pool_state *pool_parent(struct dmem_cgroup_pool_state *pool)
+{
+	if (!pool->cnt.parent)
+		return NULL;
+
+	return container_of(pool->cnt.parent, typeof(*pool), cnt);
+}
+
+static void
+dmem_cgroup_calculate_protection(struct dmem_cgroup_pool_state *limit_pool,
+				 struct dmem_cgroup_pool_state *test_pool)
+{
+	struct page_counter *climit;
+	struct cgroup_subsys_state *css, *next_css;
+	struct dmemcg_state *dmemcg_iter;
+	struct dmem_cgroup_pool_state *pool, *parent_pool;
+	bool found_descendant;
+
+	climit = &limit_pool->cnt;
+
+	rcu_read_lock();
+	parent_pool = pool = limit_pool;
+	css = &limit_pool->cs->css;
+
+	/*
+	 * This logic is roughly equivalent to css_foreach_descendant_pre,
+	 * except we also track the parent pool to find out which pool we need
+	 * to calculate protection values for.
+	 *
+	 * We can stop the traversal once we find test_pool among the
+	 * descendants since we don't really care about any others.
+	 */
+	while (pool != test_pool) {
+		next_css = css_next_child(NULL, css);
+		if (next_css) {
+			parent_pool = pool;
+		} else {
+			while (css != &limit_pool->cs->css) {
+				next_css = css_next_child(css, css->parent);
+				if (next_css)
+					break;
+				css = css->parent;
+				parent_pool = pool_parent(parent_pool);
+			}
+			/*
+			 * We can only hit this when test_pool is not a
+			 * descendant of limit_pool.
+			 */
+			if (WARN_ON_ONCE(css == &limit_pool->cs->css))
+				break;
+		}
+		css = next_css;
+
+		found_descendant = false;
+		dmemcg_iter = container_of(css, struct dmemcg_state, css);
+
+		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
+			if (pool_parent(pool) == parent_pool) {
+				found_descendant = true;
+				break;
+			}
+		}
+		if (!found_descendant)
+			continue;
+
+		page_counter_calculate_protection(
+			climit, &pool->cnt, true);
+	}
+	rcu_read_unlock();
+}
+
+/**
+ * dmem_cgroup_state_evict_valuable() - Check if we should evict from test_pool
+ * @dev: &dmem_cgroup_region
+ * @index: The index number of the region being tested.
+ * @limit_pool: The pool for which we hit limits
+ * @test_pool: The pool for which to test
+ * @ignore_low: Whether we have to respect low watermarks.
+ * @ret_hit_low: Pointer to whether it makes sense to consider low watermark.
+ *
+ * This function returns true if we can evict from @test_pool, false if not.
+ * When returning false and @ignore_low is false, @ret_hit_low may
+ * be set to true to indicate this function can be retried with @ignore_low
+ * set to true.
+ *
+ * Return: bool
+ */
+bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
+				      struct dmem_cgroup_pool_state *test_pool,
+				      bool ignore_low, bool *ret_hit_low)
+{
+	struct dmem_cgroup_pool_state *pool = test_pool;
+	struct page_counter *climit, *ctest;
+	u64 used, min, low;
+
+	/* Can always evict from current pool, despite limits */
+	if (limit_pool == test_pool)
+		return true;
+
+	if (limit_pool) {
+		if (!parent_dmemcs(limit_pool->cs))
+			return true;
+
+		for (pool = test_pool; pool && limit_pool != pool; pool = pool_parent(pool))
+			{}
+
+		if (!pool)
+			return false;
+	} else {
+		/*
+		 * If there is no cgroup limiting memory usage, use the root
+		 * cgroup instead for limit calculations.
+		 */
+		for (limit_pool = test_pool; pool_parent(limit_pool); limit_pool = pool_parent(limit_pool))
+			{}
+	}
+
+	climit = &limit_pool->cnt;
+	ctest = &test_pool->cnt;
+
+	dmem_cgroup_calculate_protection(limit_pool, test_pool);
+
+	used = page_counter_read(ctest);
+	min = READ_ONCE(ctest->emin);
+
+	if (used <= min)
+		return false;
+
+	if (!ignore_low) {
+		low = READ_ONCE(ctest->elow);
+		if (used > low)
+			return true;
+
+		*ret_hit_low = true;
+		return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_state_evict_valuable);
+
+static struct dmem_cgroup_pool_state *
+alloc_pool_single(struct dmemcg_state *dmemcs, struct dmem_cgroup_region *region,
+		  struct dmem_cgroup_pool_state **allocpool)
+{
+	struct dmemcg_state *parent = parent_dmemcs(dmemcs);
+	struct dmem_cgroup_pool_state *pool, *ppool = NULL;
+
+	if (!*allocpool) {
+		pool = kzalloc(sizeof(*pool), GFP_NOWAIT);
+		if (!pool)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		pool = *allocpool;
+		*allocpool = NULL;
+	}
+
+	pool->region = region;
+	pool->cs = dmemcs;
+
+	if (parent)
+		ppool = find_cg_pool_locked(parent, region);
+
+	page_counter_init(&pool->cnt,
+			  ppool ? &ppool->cnt : NULL, true);
+	reset_all_resource_limits(pool);
+
+	list_add_tail_rcu(&pool->css_node, &dmemcs->pools);
+	list_add_tail(&pool->region_node, &region->pools);
+
+	if (!parent)
+		pool->inited = true;
+	else
+		pool->inited = ppool ? ppool->inited : false;
+	return pool;
+}
+
+static struct dmem_cgroup_pool_state *
+get_cg_pool_locked(struct dmemcg_state *dmemcs, struct dmem_cgroup_region *region,
+		   struct dmem_cgroup_pool_state **allocpool)
+{
+	struct dmem_cgroup_pool_state *pool, *ppool, *retpool;
+	struct dmemcg_state *p, *pp;
+
+	/*
+	 * Recursively create pool, we may not initialize yet on
+	 * recursion, this is done as a separate step.
+	 */
+	for (p = dmemcs; p; p = parent_dmemcs(p)) {
+		pool = find_cg_pool_locked(p, region);
+		if (!pool)
+			pool = alloc_pool_single(p, region, allocpool);
+
+		if (IS_ERR(pool))
+			return pool;
+
+		if (p == dmemcs && pool->inited)
+			return pool;
+
+		if (pool->inited)
+			break;
+	}
+
+	retpool = pool = find_cg_pool_locked(dmemcs, region);
+	for (p = dmemcs, pp = parent_dmemcs(dmemcs); pp; p = pp, pp = parent_dmemcs(p)) {
+		if (pool->inited)
+			break;
+
+		/* ppool was created if it didn't exist by above loop. */
+		ppool = find_cg_pool_locked(pp, region);
+
+		/* Fix up parent links, mark as inited. */
+		pool->cnt.parent = &ppool->cnt;
+		pool->inited = true;
+
+		pool = ppool;
+	}
+
+	return retpool;
+}
+
+static void dmemcg_free_rcu(struct rcu_head *rcu)
+{
+	struct dmem_cgroup_region *region = container_of(rcu, typeof(*region), rcu);
+	struct dmem_cgroup_pool_state *pool, *next;
+
+	list_for_each_entry_safe(pool, next, &region->pools, region_node)
+		free_cg_pool(pool);
+	kfree(region->name);
+	kfree(region);
+}
+
+static void dmemcg_free_region(struct kref *ref)
+{
+	struct dmem_cgroup_region *cgregion = container_of(ref, typeof(*cgregion), ref);
+
+	call_rcu(&cgregion->rcu, dmemcg_free_rcu);
+}
+
+/**
+ * dmem_cgroup_unregister_region() - Unregister a previously registered region.
+ * @region: The region to unregister.
+ *
+ * This function undoes dmem_cgroup_register_region.
+ */
+void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
+{
+	struct list_head *entry;
+
+	if (!region)
+		return;
+
+	spin_lock(&dmemcg_lock);
+
+	/* Remove from global region list */
+	list_del_rcu(&region->region_node);
+
+	list_for_each_rcu(entry, &region->pools) {
+		struct dmem_cgroup_pool_state *pool =
+			container_of(entry, typeof(*pool), region_node);
+
+		list_del_rcu(&pool->css_node);
+	}
+
+	/*
+	 * Ensure any RCU based lookups fail. Additionally,
+	 * no new pools should be added to the dead region
+	 * by get_cg_pool_unlocked.
+	 */
+	region->unregistered = true;
+	spin_unlock(&dmemcg_lock);
+
+	kref_put(&region->ref, dmemcg_free_region);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_unregister_region);
+
+/**
+ * dmem_cgroup_register_region() - Register a regions for dev cgroup.
+ * @size: Size of region to register, in bytes.
+ * @fmt: Region parameters to register
+ *
+ * This function registers a node in the dmem cgroup with the
+ * name given. After calling this function, the region can be
+ * used for allocations.
+ *
+ * Return: NULL or a struct on success, PTR_ERR on failure.
+ */
+struct dmem_cgroup_region *dmem_cgroup_register_region(u64 size, const char *fmt, ...)
+{
+	struct dmem_cgroup_region *ret;
+	char *region_name;
+	va_list ap;
+
+	if (!size)
+		return NULL;
+
+	va_start(ap, fmt);
+	region_name = kvasprintf(GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!region_name)
+		return ERR_PTR(-ENOMEM);
+
+	ret = kzalloc(sizeof(*ret), GFP_KERNEL);
+	if (!ret) {
+		kfree(region_name);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_LIST_HEAD(&ret->pools);
+	ret->name = region_name;
+	ret->size = size;
+	kref_init(&ret->ref);
+
+	spin_lock(&dmemcg_lock);
+	list_add_tail_rcu(&ret->region_node, &dmem_cgroup_regions);
+	spin_unlock(&dmemcg_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_register_region);
+
+static struct dmem_cgroup_region *dmemcg_get_region_by_name(const char *name)
+{
+	struct dmem_cgroup_region *region;
+
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node, spin_is_locked(&dmemcg_lock))
+		if (!strcmp(name, region->name) &&
+		    kref_get_unless_zero(&region->ref))
+			return region;
+
+	return NULL;
+}
+
+/**
+ * dmem_cgroup_pool_state_put() - Drop a reference to a dmem_cgroup_pool_state
+ * @pool: &dmem_cgroup_pool_state
+ *
+ * Called to drop a reference to the limiting pool returned by
+ * dmem_cgroup_try_charge().
+ */
+void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
+{
+	if (pool)
+		css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_pool_state_put);
+
+static struct dmem_cgroup_pool_state *
+get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
+{
+	struct dmem_cgroup_pool_state *pool, *allocpool = NULL;
+
+	/* fastpath lookup? */
+	rcu_read_lock();
+	pool = find_cg_pool_locked(cg, region);
+	if (pool && !READ_ONCE(pool->inited))
+		pool = NULL;
+	rcu_read_unlock();
+
+	while (!pool) {
+		spin_lock(&dmemcg_lock);
+		if (!region->unregistered)
+			pool = get_cg_pool_locked(cg, region, &allocpool);
+		else
+			pool = ERR_PTR(-ENODEV);
+		spin_unlock(&dmemcg_lock);
+
+		if (pool == ERR_PTR(-ENOMEM)) {
+			pool = NULL;
+			if (WARN_ON(allocpool))
+				continue;
+
+			allocpool = kzalloc(sizeof(*allocpool), GFP_KERNEL);
+			if (allocpool) {
+				pool = NULL;
+				continue;
+			}
+		}
+	}
+
+	kfree(allocpool);
+	return pool;
+}
+
+/**
+ * dmem_cgroup_uncharge() - Uncharge a pool.
+ * @pool: Pool to uncharge.
+ * @size: Size to uncharge.
+ *
+ * Undoes the effects of dmem_cgroup_try_charge.
+ * Must be called with the returned pool as argument,
+ * and same @index and @size.
+ */
+void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
+{
+	if (!pool)
+		return;
+
+	page_counter_uncharge(&pool->cnt, size);
+	css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_uncharge);
+
+/**
+ * dmem_cgroup_try_charge() - Try charging a new allocation to a region.
+ * @dev: Device to charge
+ * @size: Size (in bytes) to charge.
+ * @ret_pool: On succesfull allocation, the pool that is charged.
+ * @ret_limit_pool: On a failed allocation, the limiting pool.
+ *
+ * This function charges the current pool for @dev with region at @index for a
+ * size of @size bytes.
+ *
+ * If the function succeeds, @ret_pool is set, which must be passed to
+ * dmem_cgroup_uncharge() when undoing the allocation.
+ *
+ * When this function fails with -EAGAIN and @ret_limit_pool is non-null, it
+ * will be set to the pool for which the limit is hit. This can be used for
+ * eviction as argument to dmem_cgroup_evict_valuable(). This reference must be freed
+ * with @dmem_cgroup_pool_state_put().
+ *
+ * Return: 0 on success, -EAGAIN on hitting a limit, or a negative errno on failure.
+ */
+int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
+			  struct dmem_cgroup_pool_state **ret_pool,
+			  struct dmem_cgroup_pool_state **ret_limit_pool)
+{
+	struct dmemcg_state *cg;
+	struct dmem_cgroup_pool_state *pool;
+	struct page_counter *fail;
+	int ret;
+
+	*ret_pool = NULL;
+	if (ret_limit_pool)
+		*ret_limit_pool = NULL;
+
+	/*
+	 * hold on to css, as cgroup can be removed but resource
+	 * accounting happens on css.
+	 */
+	cg = get_current_dmemcs();
+
+	pool = get_cg_pool_unlocked(cg, region);
+	if (IS_ERR(pool)) {
+		ret = PTR_ERR(pool);
+		goto err;
+	}
+
+	if (!page_counter_try_charge(&pool->cnt, size, &fail)) {
+		if (ret_limit_pool) {
+			*ret_limit_pool = container_of(fail, struct dmem_cgroup_pool_state, cnt);
+			css_get(&(*ret_limit_pool)->cs->css);
+		}
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	/* On success, reference from get_current_dmemcs is transferred to *ret_pool */
+	*ret_pool = pool;
+	return 0;
+
+err:
+	css_put(&cg->css);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_try_charge);
+
+static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
+{
+	struct dmem_cgroup_region *region;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node) {
+		seq_puts(sf, region->name);
+		seq_printf(sf, " %llu\n", region->size);
+	}
+	rcu_read_unlock();
+	return 0;
+}
+
+static int dmemcg_parse_limit(char *options, struct dmem_cgroup_region *region,
+			      u64 *new_limit)
+{
+	char *end;
+
+	if (!strcmp(options, "max")) {
+		*new_limit = PAGE_COUNTER_MAX;
+		return 0;
+	}
+
+	*new_limit = memparse(options, &end);
+	if (*end != '\0')
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
+				 char *buf, size_t nbytes, loff_t off,
+				 void (*apply)(struct dmem_cgroup_pool_state *, u64))
+{
+	struct dmemcg_state *dmemcs = css_to_dmemcs(of_css(of));
+	int err = 0;
+
+	while (buf && !err) {
+		struct dmem_cgroup_pool_state *pool = NULL;
+		char *options, *region_name;
+		struct dmem_cgroup_region *region;
+		u64 new_limit;
+
+		options = buf;
+		buf = strchr(buf, '\n');
+		if (buf)
+			*buf++ = '\0';
+
+		options = strstrip(options);
+
+		/* eat empty lines */
+		if (!options[0])
+			continue;
+
+		region_name = strsep(&options, " \t");
+		if (!region_name[0])
+			continue;
+
+		rcu_read_lock();
+		region = dmemcg_get_region_by_name(region_name);
+		rcu_read_unlock();
+
+		if (!region)
+			return -EINVAL;
+
+		err = dmemcg_parse_limit(options, region, &new_limit);
+		if (err < 0)
+			goto out_put;
+
+		pool = get_cg_pool_unlocked(dmemcs, region);
+		if (IS_ERR(pool)) {
+			err = PTR_ERR(pool);
+			goto out_put;
+		}
+
+		/* And commit */
+		apply(pool, new_limit);
+
+out_put:
+		kref_put(&region->ref, dmemcg_free_region);
+	}
+
+
+	return err ?: nbytes;
+}
+
+static int dmemcg_limit_show(struct seq_file *sf, void *v,
+			    u64 (*fn)(struct dmem_cgroup_pool_state *))
+{
+	struct dmemcg_state *dmemcs = css_to_dmemcs(seq_css(sf));
+	struct dmem_cgroup_region *region;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node) {
+		struct dmem_cgroup_pool_state *pool = find_cg_pool_locked(dmemcs, region);
+		u64 val;
+
+		seq_puts(sf, region->name);
+
+		val = fn(pool);
+		if (val < PAGE_COUNTER_MAX)
+			seq_printf(sf, " %lld\n", val);
+		else
+			seq_puts(sf, " max\n");
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+
+static int dmem_cgroup_region_current_show(struct seq_file *sf, void *v)
+{
+	return dmemcg_limit_show(sf, v, get_resource_current);
+}
+
+static int dmem_cgroup_region_min_show(struct seq_file *sf, void *v)
+{
+	return dmemcg_limit_show(sf, v, get_resource_min);
+}
+
+static ssize_t dmem_cgroup_region_min_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return dmemcg_limit_write(of, buf, nbytes, off, set_resource_min);
+}
+
+static int dmem_cgroup_region_low_show(struct seq_file *sf, void *v)
+{
+	return dmemcg_limit_show(sf, v, get_resource_low);
+}
+
+static ssize_t dmem_cgroup_region_low_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return dmemcg_limit_write(of, buf, nbytes, off, set_resource_low);
+}
+
+static int dmem_cgroup_region_max_show(struct seq_file *sf, void *v)
+{
+	return dmemcg_limit_show(sf, v, get_resource_max);
+}
+
+static ssize_t dmem_cgroup_region_max_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return dmemcg_limit_write(of, buf, nbytes, off, set_resource_max);
+}
+
+static struct cftype files[] = {
+	{
+		.name = "capacity",
+		.seq_show = dmem_cgroup_region_capacity_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+	{
+		.name = "current",
+		.seq_show = dmem_cgroup_region_current_show,
+	},
+	{
+		.name = "min",
+		.write = dmem_cgroup_region_min_write,
+		.seq_show = dmem_cgroup_region_min_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "low",
+		.write = dmem_cgroup_region_low_write,
+		.seq_show = dmem_cgroup_region_low_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "max",
+		.write = dmem_cgroup_region_max_write,
+		.seq_show = dmem_cgroup_region_max_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{ } /* Zero entry terminates. */
+};
+
+struct cgroup_subsys dmem_cgrp_subsys = {
+	.css_alloc	= dmemcs_alloc,
+	.css_free	= dmemcs_free,
+	.css_offline	= dmemcs_offline,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
diff --git a/mm/page_counter.c b/mm/page_counter.c
index b249d15af9dd8..af23f927611b7 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -288,7 +288,7 @@ int page_counter_memparse(const char *buf, const char *max,
 }
 
 
-#ifdef CONFIG_MEMCG
+#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DMEM)
 /*
  * This function calculates an individual page counter's effective
  * protection which is derived from its own memory.min/low, its
@@ -460,4 +460,4 @@ void page_counter_calculate_protection(struct page_counter *root,
 			atomic_long_read(&parent->children_low_usage),
 			recursive_protection));
 }
-#endif /* CONFIG_MEMCG */
+#endif /* CONFIG_MEMCG || CONFIG_CGROUP_DMEM */
-- 
2.43.0

