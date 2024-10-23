Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39609AC0E4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CF10E785;
	Wed, 23 Oct 2024 08:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44E010E77E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:00:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
Date: Wed, 23 Oct 2024 09:52:54 +0200
Message-ID: <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

The initial version was based roughly on the rdma and misc cgroup
controllers, with a lot of the accounting code borrowed from rdma.

The current version is a complete rewrite with page counter; it uses
the same min/low/max semantics as the memory cgroup as a result.

There's a small mismatch as TTM uses u64, and page_counter long pages.
In practice it's not a problem. 32-bits systems don't really come with
>=4GB cards and as long as we're consistently wrong with units, it's
fine. The device page size may not be in the same units as kernel page
size, and each region might also have a different page size (VRAM vs GART
for example).

The interface is simple:
- populate dev_cgroup_try_charge->regions[..] name and size for each active
  region, set num_regions accordingly.
- Call (dev,drmm)_cgroup_register_device()
- Use dev_cgroup_try_charge to check if you can allocate a chunk of memory,
  use dev_cgroup__uncharge when freeing it. This may return an error code,
  or -EAGAIN when the cgroup limit is reached. In that case a reference
  to the limiting pool is returned.
- The limiting cs can be used as compare function for
  dev_cgroup_state_evict_valuable.
- After having evicted enough, drop reference to limiting cs with
  dev_cgroup_pool_state_put.

This API allows you to limit device resources with cgroups.
You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
You need to echo +dev to cgroup.subtree_control, and then you can
partition memory.

Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
Co-developed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  51 ++
 Documentation/core-api/cgroup.rst       |   9 +
 Documentation/core-api/index.rst        |   1 +
 Documentation/gpu/drm-compute.rst       |  54 ++
 include/linux/cgroup_dev.h              |  91 +++
 include/linux/cgroup_subsys.h           |   4 +
 include/linux/page_counter.h            |   2 +-
 init/Kconfig                            |   7 +
 kernel/cgroup/Makefile                  |   1 +
 kernel/cgroup/dev.c                     | 893 ++++++++++++++++++++++++
 mm/page_counter.c                       |   4 +-
 11 files changed, 1114 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dev.h
 create mode 100644 kernel/cgroup/dev.c

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 69af2173555fb..e8fe79244af9c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2612,6 +2612,57 @@ RDMA Interface Files
 	  mlx4_0 hca_handle=1 hca_object=20
 	  ocrdma1 hca_handle=1 hca_object=23
 
+DEV
+----
+
+The "dev" controller regulates the distribution and accounting of
+device resources, currently only memory regions. Because each memory
+region may have its own page size, which does not have to be equal
+to the system page size. the units are in bytes.
+
+DEV Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+  dev.region.max, dev.region.min, dev.region.low
+	A readwrite nested-keyed file that exists for all the cgroups
+	except root that describes current configured resource limit
+	for a device.
+
+	Lines are keyed by device name and are not ordered.
+	Each line contains space separated resource name and its configured
+	limit that can be distributed.
+
+	The following nested keys are defined.
+
+	  ==========	=======================================================
+	  *	 	Maximum amount of bytes that allocatable in this region
+	  ==========	=======================================================
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0 vram0=1073741824 stolen=max
+
+	The semantics are the same as for the memory cgroup controller, and are
+	calculated in the same way.
+
+  dev.region.capacity
+	A read-only file that describes maximum region capacity.
+	It only exists on the root cgroup. Not all memory can be
+	allocated by cgroups, as the kernel reserves some for
+	internal use.
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0 vram0=8514437120 stolen=67108864
+
+  dev.region.current
+	A read-only file that describes current resource usage.
+	It exists for all the cgroup except root.
+
+	An example for xe follows::
+
+	  drm/0000:03:00.0 vram0=12550144 stolen=8650752
+
 HugeTLB
 -------
 
diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/cgroup.rst
new file mode 100644
index 0000000000000..475b32255bd68
--- /dev/null
+++ b/Documentation/core-api/cgroup.rst
@@ -0,0 +1,9 @@
+==================
+Cgroup Kernel APIs
+==================
+
+Device Cgroup API (devcg)
+=========================
+.. kernel-doc:: kernel/cgroup/dev.c
+   :export:
+
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 6a875743dd4b7..dbd6c4f9a6313 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -108,6 +108,7 @@ more memory-management documentation in Documentation/mm/index.rst.
    dma-isa-lpc
    swiotlb
    mm-api
+   cgroup
    genalloc
    pin_user_pages
    boot-time-mm
diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-compute.rst
new file mode 100644
index 0000000000000..116270976ef7a
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
+be made cgroup aware. For now only max is implemented.
+
+What should be noted is that each memory region (tiled memory for example)
+should have its own accounting, using $card key0 = value0 key1 = value1.
+
+The key is set to the regionid set by the driver, for example "tile0".
+For the value of $card, we use drmGetUnique().
diff --git a/include/linux/cgroup_dev.h b/include/linux/cgroup_dev.h
new file mode 100644
index 0000000000000..c6311d1d3ce48
--- /dev/null
+++ b/include/linux/cgroup_dev.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _CGROUP_DEV_H
+#define _CGROUP_DEV_H
+
+#include <linux/types.h>
+#include <linux/llist.h>
+
+struct dev_cgroup_pool_state;
+
+/*
+ * Use 8 as max, because of N^2 lookup when setting things, can be bumped if needed
+ * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
+ */
+#define DEVICE_CGROUP_MAX_REGIONS 8
+
+/* Public definition of cgroup device, should not be modified after _register() */
+struct dev_cgroup_device {
+	struct {
+		u64 size;
+		const char *name;
+	} regions[DEVICE_CGROUP_MAX_REGIONS];
+
+	int num_regions;
+
+	/* used by cgroups, do not use */
+	void *priv;
+};
+
+#if IS_ENABLED(CONFIG_CGROUP_DEV)
+int dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
+			       const char *name);
+void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev);
+int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
+			  u32 index, u64 size,
+			  struct dev_cgroup_pool_state **ret_pool,
+			  struct dev_cgroup_pool_state **ret_limit_pool);
+void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
+			 u32 index, u64 size);
+bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int index,
+				     struct dev_cgroup_pool_state *limit_pool,
+				     struct dev_cgroup_pool_state *test_pool,
+				     bool ignore_low, bool *ret_hit_low);
+
+void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool);
+#else
+static inline int
+dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
+			   const char *name)
+{
+	return 0;
+}
+
+static inline void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev)
+{
+}
+
+static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
+				     u32 index, u64 size,
+				     struct dev_cgroup_pool_state **ret_pool,
+				     struct dev_cgroup_pool_state **ret_limit_pool);
+{
+	*ret_pool = NULL;
+
+	if (ret_limit_pool)
+		*ret_limit_pool = NULL;
+
+	return 0;
+}
+
+static inline void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
+				       u32 index, u64 size)
+{ }
+
+static inline
+bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int index,
+				     struct dev_cgroup_pool_state *limit_pool,
+				     struct dev_cgroup_pool_state *test_pool,
+				     bool ignore_low, bool *ret_hit_low)
+{
+	return true;
+}
+
+static inline void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool)
+{ }
+
+#endif
+#endif	/* _CGROUP_DEV_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index 4452354872307..898340cfe5843 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -65,6 +65,10 @@ SUBSYS(rdma)
 SUBSYS(misc)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DEV)
+SUBSYS(dev)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 79dbd8bc35a72..d75376a1694ee 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -96,7 +96,7 @@ static inline void page_counter_reset_watermark(struct page_counter *counter)
 	counter->watermark = usage;
 }
 
-#ifdef CONFIG_MEMCG
+#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DEVICE)
 void page_counter_calculate_protection(struct page_counter *root,
 				       struct page_counter *counter,
 				       bool recursive_protection);
diff --git a/init/Kconfig b/init/Kconfig
index 530a382ee0feb..2da595facd97f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1123,6 +1123,13 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
+config CGROUP_DEV
+	bool "Device controller"
+	help
+	  Provides the device subsystem controller.
+
+	  ...
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index a5c9359d516f8..441d346fdc51f 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_CGROUP_RDMA) += rdma.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CPUSETS_V1) += cpuset-v1.o
 obj-$(CONFIG_CGROUP_MISC) += misc.o
+obj-$(CONFIG_CGROUP_DEV) += dev.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/dev.c b/kernel/cgroup/dev.c
new file mode 100644
index 0000000000000..e422ccbfbc444
--- /dev/null
+++ b/kernel/cgroup/dev.c
@@ -0,0 +1,893 @@
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
+#include <linux/cgroup_dev.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/page_counter.h>
+#include <linux/parser.h>
+#include <linux/slab.h>
+
+struct devcg_device {
+	/**
+	 * @ref: References keeping the device alive.
+	 * Keeps the device reference alive after a succesful RCU lookup.
+	 */
+	struct kref ref;
+
+	/** @rcu: RCU head for freeing */
+	struct rcu_head rcu;
+
+	/**
+	 * @dev_node: Linked into &devcg_devices list.
+	 * Protected by RCU and global spinlock.
+	 */
+	struct list_head dev_node;
+
+	/**
+	 * @pools: List of pools linked to this device.
+	 * Protected by global spinlock only
+	 */
+	struct list_head pools;
+
+	/**
+	 * @base: Copy of the struct passed on register.
+	 * A copy is made to prevent lifetime issues. devcg_device may
+	 * be kept alive when changing cgroups values concurrently through
+	 * rcu lookups.
+	 */
+	struct dev_cgroup_device base;
+
+	/** @name: Name describing the node, set by dev_cgroup_register_device */
+	const char *name;
+
+	/**
+	 * @unregistered: Whether the device is unregistered by its caller.
+	 * No new pools should be added to the device afterwards.
+	 */
+	bool unregistered;
+};
+
+struct devcg_state {
+	struct cgroup_subsys_state css;
+
+	struct list_head pools;
+};
+
+struct dev_cgroup_pool_state {
+	struct devcg_device *device;
+	struct devcg_state *cs;
+
+	/* css node, RCU protected against device teardown */
+	struct list_head	css_node;
+
+	/* dev node, no RCU protection required */
+	struct list_head	dev_node;
+
+	int num_res, inited;
+	struct rcu_head rcu;
+
+	struct devcg_pool_res {
+		struct page_counter cnt;
+	} resources[];
+};
+
+/*
+ * 3 operations require locking protection:
+ * - Registering and unregistering device to/from list, requires global lock.
+ * - Adding a dev_cgroup_pool_state to a CSS, removing when CSS is freed.
+ * - Adding a dev_cgroup_pool_state to a device list.
+ *
+ * Since for the most common operations RCU provides enough protection, I
+ * do not think more granular locking makes sense. Most protection is offered
+ * by RCU and the lockless operating page_counter.
+ */
+static DEFINE_SPINLOCK(devcg_lock);
+static LIST_HEAD(devcg_devices);
+
+static inline struct devcg_state *
+css_to_devcs(struct cgroup_subsys_state *css)
+{
+	return container_of(css, struct devcg_state, css);
+}
+
+static inline struct devcg_state *get_current_devcs(void)
+{
+	return css_to_devcs(task_get_css(current, dev_cgrp_id));
+}
+
+static struct devcg_state *parent_devcs(struct devcg_state *cg)
+{
+	return cg->css.parent ? css_to_devcs(cg->css.parent) : NULL;
+}
+
+static void free_cg_pool(struct dev_cgroup_pool_state *pool)
+{
+	list_del(&pool->dev_node);
+	kfree(pool);
+}
+
+static void
+set_resource_min(struct dev_cgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_min(&pool->resources[i].cnt, val);
+}
+
+static void
+set_resource_low(struct dev_cgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_low(&pool->resources[i].cnt, val);
+}
+
+static void
+set_resource_max(struct dev_cgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_max(&pool->resources[i].cnt, val);
+}
+
+static u64 get_resource_low(struct dev_cgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.low) : 0;
+}
+
+static u64 get_resource_min(struct dev_cgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.min) : 0;
+}
+
+static u64 get_resource_max(struct dev_cgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.max) : PAGE_COUNTER_MAX;
+}
+
+static u64 get_resource_current(struct dev_cgroup_pool_state *pool, int idx)
+{
+	return pool ? page_counter_read(&pool->resources[idx].cnt) : 0;
+}
+
+static void reset_all_resource_limits(struct dev_cgroup_pool_state *rpool)
+{
+	int i;
+
+	for (i = 0; i < rpool->num_res; i++) {
+		set_resource_min(rpool, i, 0);
+		set_resource_low(rpool, i, 0);
+		set_resource_max(rpool, i, PAGE_COUNTER_MAX);
+	}
+}
+
+static void devcs_offline(struct cgroup_subsys_state *css)
+{
+	struct devcg_state *devcs = css_to_devcs(css);
+	struct dev_cgroup_pool_state *pool;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(pool, &devcs->pools, css_node)
+		reset_all_resource_limits(pool);
+	rcu_read_unlock();
+}
+
+static void devcs_free(struct cgroup_subsys_state *css)
+{
+	struct devcg_state *devcs = css_to_devcs(css);
+	struct dev_cgroup_pool_state *pool, *next;
+
+	spin_lock(&devcg_lock);
+	list_for_each_entry_safe(pool, next, &devcs->pools, css_node) {
+		/*
+		 *The pool is dead and all references are 0,
+		 * no need for RCU protection with list_del_rcu or freeing.
+		 */
+		list_del(&pool->css_node);
+		free_cg_pool(pool);
+	}
+	spin_unlock(&devcg_lock);
+
+	kfree(devcs);
+}
+
+static struct cgroup_subsys_state *
+devcs_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct devcg_state *devcs = kzalloc(sizeof(*devcs), GFP_KERNEL);
+	if (!devcs)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&devcs->pools);
+	return &devcs->css;
+}
+
+static struct dev_cgroup_pool_state *
+find_cg_pool_locked(struct devcg_state *devcs, struct devcg_device *dev)
+{
+	struct dev_cgroup_pool_state *pool;
+
+	list_for_each_entry_rcu(pool, &devcs->pools, css_node, spin_is_locked(&devcg_lock))
+		if (pool->device == dev)
+			return pool;
+
+	return NULL;
+}
+
+static struct dev_cgroup_pool_state *pool_parent(struct dev_cgroup_pool_state *pool)
+{
+	if (!pool->resources[0].cnt.parent)
+		return NULL;
+
+	return container_of(pool->resources[0].cnt.parent, typeof(*pool), resources[0].cnt);
+}
+
+/**
+ * dev_cgroup_state_evict_valuable() - Check if we should evict from test_pool
+ * @dev: &dev_cgroup_device
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
+bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int index,
+				     struct dev_cgroup_pool_state *limit_pool,
+				     struct dev_cgroup_pool_state *test_pool,
+				     bool ignore_low, bool *ret_hit_low)
+{
+	struct dev_cgroup_pool_state *pool = test_pool;
+	struct page_counter *climit, *ctest;
+	u64 used, min, low;
+
+	/* Can always evict from current pool, despite limits */
+	if (limit_pool == test_pool)
+		return true;
+
+	if (limit_pool) {
+		if (!parent_devcs(limit_pool->cs))
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
+	climit = &limit_pool->resources[index].cnt;
+	ctest = &test_pool->resources[index].cnt;
+
+	page_counter_calculate_protection(climit, ctest, true);
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
+EXPORT_SYMBOL_GPL(dev_cgroup_state_evict_valuable);
+
+static struct dev_cgroup_pool_state *
+alloc_pool_single(struct devcg_state *devcs, struct devcg_device *dev,
+		  struct dev_cgroup_pool_state **allocpool)
+{
+	struct devcg_state *parent = parent_devcs(devcs);
+	struct dev_cgroup_pool_state *pool, *ppool = NULL;
+	int i;
+
+	if (!*allocpool) {
+		pool = kzalloc(offsetof(struct dev_cgroup_pool_state, resources[dev->base.num_regions]), GFP_NOWAIT);
+		if (!pool)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		pool = *allocpool;
+		*allocpool = NULL;
+	}
+
+	pool->device = dev;
+	pool->num_res = dev->base.num_regions;
+	pool->cs = devcs;
+
+	if (parent)
+		ppool = find_cg_pool_locked(parent, dev);
+
+	for (i = 0; i < pool->num_res; i++)
+		page_counter_init(&pool->resources[i].cnt,
+				  ppool ? &ppool->resources[i].cnt : NULL, true);
+	reset_all_resource_limits(pool);
+
+	list_add_tail_rcu(&pool->css_node, &devcs->pools);
+	list_add_tail(&pool->dev_node, &dev->pools);
+
+	if (!parent)
+		pool->inited = true;
+	else
+		pool->inited = ppool ? ppool->inited : false;
+	return pool;
+}
+
+static struct dev_cgroup_pool_state *
+get_cg_pool_locked(struct devcg_state *devcs, struct devcg_device *dev,
+		   struct dev_cgroup_pool_state **allocpool)
+{
+	struct dev_cgroup_pool_state *pool, *ppool, *retpool;
+	struct devcg_state *p, *pp;
+	int i;
+
+	/*
+	 * Recursively create pool, we may not initialize yet on
+	 * recursion, this is done as a separate step.
+	 */
+	for (p = devcs; p; p = parent_devcs(p)) {
+		pool = find_cg_pool_locked(p, dev);
+		if (!pool)
+			pool = alloc_pool_single(p, dev, allocpool);
+
+		if (IS_ERR(pool))
+			return pool;
+
+		if (p == devcs && pool->inited)
+			return pool;
+
+		if (pool->inited)
+			break;
+	}
+
+	retpool = pool = find_cg_pool_locked(devcs, dev);
+	for (p = devcs, pp = parent_devcs(devcs); pp; p = pp, pp = parent_devcs(p)) {
+		if (pool->inited)
+			break;
+
+		/* ppool was created if it didn't exist by above loop. */
+		ppool = find_cg_pool_locked(pp, dev);
+
+		/* Fix up parent links, mark as inited. */
+		for (i = 0; i < pool->num_res; i++)
+			pool->resources[i].cnt.parent = &ppool->resources[i].cnt;
+		pool->inited = true;
+
+		pool = ppool;
+	}
+
+	return retpool;
+}
+
+static void devcg_free_rcu(struct rcu_head *rcu)
+{
+	struct devcg_device *dev = container_of(rcu, typeof(*dev), rcu);
+	struct dev_cgroup_pool_state *pool, *next;
+
+	list_for_each_entry_safe(pool, next, &dev->pools, dev_node)
+		free_cg_pool(pool);
+	kfree(dev->name);
+	kfree(dev);
+}
+
+static void devcg_free_device(struct kref *ref)
+{
+	struct devcg_device *cgdev = container_of(ref, typeof(*cgdev), ref);
+
+	call_rcu(&cgdev->rcu, devcg_free_rcu);
+}
+
+/**
+ * dev_cgroup_unregister_device() - Unregister a previously registered device.
+ * @cgdev: The device to unregister.
+ *
+ * This function undoes dev_cgroup_register_device.
+ */
+void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev)
+{
+	struct devcg_device *dev;
+	struct list_head *entry;
+
+	if (!cgdev || !cgdev->priv)
+		return;
+
+	dev = cgdev->priv;
+	cgdev->priv = NULL;
+
+	spin_lock(&devcg_lock);
+
+	/* Remove from global device list */
+	list_del_rcu(&dev->dev_node);
+
+	list_for_each_rcu(entry, &dev->pools) {
+		struct dev_cgroup_pool_state *pool =
+			container_of(entry, typeof(*pool), dev_node);
+
+		list_del_rcu(&pool->css_node);
+	}
+
+	/*
+	 * Ensure any RCU based lookups fail. Additionally,
+	 * no new pools should be added to the dead device
+	 * by get_cg_pool_unlocked.
+	 */
+	dev->unregistered = true;
+	spin_unlock(&devcg_lock);
+
+	kref_put(&dev->ref, devcg_free_device);
+}
+EXPORT_SYMBOL_GPL(dev_cgroup_unregister_device);
+
+/**
+ * dev_cgroup_register_device() - Register a devices for dev cgroup.
+ * @cgdev: A filled &dev_cgroup_device structure.
+ * @name: A name for the device.
+ *
+ * This function registers a node in the dev cgroup with the
+ * name given. After calling this function, the device can be
+ * used for allocations.
+ *
+ * Return: 0 on success, -ERRNO on failure.
+ */
+int dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
+			       const char *name)
+{
+	struct devcg_device *dev;
+	char *dev_name;
+
+	cgdev->priv = NULL;
+	if (!cgdev->num_regions)
+		return 0;
+
+	cgdev->priv = dev = kzalloc(sizeof (*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev_name = kstrdup(name, GFP_KERNEL);
+	if (!dev_name) {
+		kfree(dev);
+		cgdev->priv = NULL;
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&dev->pools);
+	dev->name = dev_name;
+	dev->base = *cgdev;
+	kref_init(&dev->ref);
+
+	spin_lock(&devcg_lock);
+	list_add_tail_rcu(&dev->dev_node, &devcg_devices);
+	spin_unlock(&devcg_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_cgroup_register_device);
+
+static struct devcg_device *devcg_get_device_by_name(const char *name)
+{
+	struct devcg_device *dev;
+
+	list_for_each_entry_rcu(dev, &devcg_devices, dev_node, spin_is_locked(&devcg_lock))
+		if (!strcmp(name, dev->name) &&
+		    kref_get_unless_zero(&dev->ref))
+			return dev;
+
+	return NULL;
+}
+
+/**
+ * dev_cgroup_pool_state_put() - Drop a reference to a dev_cgroup_pool_state
+ * @pool: &dev_cgroup_pool_state
+ *
+ * Called to drop a reference to the limiting pool returned by
+ * dev_cgroup_try_charge().
+ */
+void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool)
+{
+	if (pool)
+		css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(dev_cgroup_pool_state_put);
+
+static struct dev_cgroup_pool_state *
+get_cg_pool_unlocked(struct devcg_state *cg, struct devcg_device *dev)
+{
+	struct dev_cgroup_pool_state *pool, *allocpool = NULL;
+
+	/* fastpath lookup? */
+	rcu_read_lock();
+	pool = find_cg_pool_locked(cg, dev);
+	if (pool && !READ_ONCE(pool->inited))
+		pool = NULL;
+	rcu_read_unlock();
+
+	while (!pool) {
+		spin_lock(&devcg_lock);
+		if (!dev->unregistered)
+			pool = get_cg_pool_locked(cg, dev, &allocpool);
+		else
+			pool = ERR_PTR(-ENODEV);
+		spin_unlock(&devcg_lock);
+
+		if (pool == ERR_PTR(-ENOMEM)) {
+			pool = NULL;
+			if (WARN_ON(allocpool))
+				continue;
+
+			allocpool = kzalloc(offsetof(struct dev_cgroup_pool_state, resources[dev->base.num_regions]), GFP_KERNEL);
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
+ * dev_cgroup_uncharge() - Uncharge a pool.
+ * @pool: Pool to uncharge.
+ * @index: Index of region to uncharge.
+ * @size: Size to uncharge.
+ *
+ * Undoes the effects of dev_cgroup_try_charge.
+ * Must be called with the returned pool as argument,
+ * and same @index and @size.
+ */
+void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
+			 u32 index, u64 size)
+{
+	struct dev_cgroup_device *cgdev;
+
+	if (!pool)
+		return;
+
+	cgdev = &pool->device->base;
+	if (index >= cgdev->num_regions)
+		return;
+
+	page_counter_uncharge(&pool->resources[index].cnt, size);
+	css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(dev_cgroup_uncharge);
+
+/**
+ * dev_cgroup_try_charge() - Try charging a new allocation to a region.
+ * @dev: Device to charge
+ * @index: Index of the region to charge
+ * @size: Size (in bytes) to charge.
+ * @ret_pool: On succesfull allocation, the pool that is charged.
+ * @ret_limit_pool: On a failed allocation, the limiting pool.
+ *
+ * This function charges the current pool for @dev with region at @index for a
+ * size of @size bytes.
+ *
+ * If the function succeeds, @ret_pool is set, which must be passed to
+ * dev_cgroup_uncharge() when undoing the allocation.
+ *
+ * When this function fails with -EAGAIN and @ret_limit_pool is non-null, it
+ * will be set to the pool for which the limit is hit. This can be used for
+ * eviction as argument to dev_cgroup_evict_valuable(). This reference must be freed
+ * with @dev_cgroup_pool_state_put().
+ *
+ * Return: 0 on success, -EAGAIN on hitting a limit, or a negative errno on failure.
+ */
+int dev_cgroup_try_charge(struct dev_cgroup_device *dev,
+			  u32 index, u64 size,
+			  struct dev_cgroup_pool_state **ret_pool,
+			  struct dev_cgroup_pool_state **ret_limit_pool)
+{
+	struct devcg_device *cgdev = dev->priv;
+	struct devcg_state *cg;
+	struct dev_cgroup_pool_state *pool;
+	struct page_counter *fail;
+	int ret;
+
+	*ret_pool = NULL;
+	if (ret_limit_pool)
+		*ret_limit_pool = NULL;
+
+	/* Early init or device unregistered */
+	if (!cgdev)
+		return 0;
+
+	if (index >= cgdev->base.num_regions)
+		return -EINVAL;
+
+	/*
+	 * hold on to css, as cgroup can be removed but resource
+	 * accounting happens on css.
+	 */
+	cg = get_current_devcs();
+
+	pool = get_cg_pool_unlocked(cg, cgdev);
+	if (IS_ERR(pool)) {
+		ret = PTR_ERR(pool);
+		goto err;
+	}
+
+	if (!page_counter_try_charge(&pool->resources[index].cnt, size, &fail)) {
+		if (ret_limit_pool) {
+			*ret_limit_pool = container_of(fail, struct dev_cgroup_pool_state, resources[index].cnt);
+			css_get(&(*ret_limit_pool)->cs->css);
+		}
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	/* On success, reference is transferred to *ret_pool */
+	*ret_pool = pool;
+	return 0;
+
+err:
+	css_put(&cg->css);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_cgroup_try_charge);
+
+static int devcg_region_capacity_show(struct seq_file *sf, void *v)
+{
+	struct devcg_device *dev;
+	int i;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(dev, &devcg_devices, dev_node) {
+		seq_puts(sf, dev->name);
+		for (i = 0; i < dev->base.num_regions; i++)
+			seq_printf(sf, " %s=%llu",
+				   dev->base.regions[i].name,
+				   dev->base.regions[i].size);
+		seq_putc(sf, '\n');
+	}
+	rcu_read_unlock();
+	return 0;
+}
+
+static s64 parse_resource(char *c, char **retname)
+{
+	substring_t argstr;
+	char *name, *value = c;
+	size_t len;
+	int ret;
+	u64 retval;
+
+	name = strsep(&value, "=");
+	if (!name || !value)
+		return -EINVAL;
+
+	*retname = name;
+	len = strlen(value);
+
+	argstr.from = value;
+	argstr.to = value + len;
+
+	ret = match_u64(&argstr, &retval);
+	if (ret >= 0) {
+		if (retval > S64_MAX)
+			return -EINVAL;
+		if (retval > PAGE_COUNTER_MAX)
+			return PAGE_COUNTER_MAX;
+		return retval;
+	}
+	if (!strncmp(value, "max", len))
+		return PAGE_COUNTER_MAX;
+
+	/* Not u64 or max, error */
+	return -EINVAL;
+}
+
+static int devcg_parse_limits(char *options, struct devcg_device *dev,
+			      u64 *new_limits, unsigned long *set_mask)
+{
+	char *c, *region;
+
+	/* parse resource options */
+	while ((c = strsep(&options, " \t")) != NULL) {
+		s64 limit;
+		int i;
+
+		limit = parse_resource(c, &region);
+		if (limit < 0)
+			return limit;
+
+
+		for (i = 0; i < dev->base.num_regions; i++)
+			if (!strcmp(dev->base.regions[i].name, region))
+				break;
+
+		if (i == dev->base.num_regions)
+			return -EINVAL;
+
+		new_limits[i] = limit;
+		*set_mask |= BIT(i);
+	}
+	return 0;
+}
+
+static ssize_t devcg_limit_write(struct kernfs_open_file *of,
+				 char *buf, size_t nbytes, loff_t off,
+				 void (*apply)(struct dev_cgroup_pool_state *, int, u64))
+{
+	struct devcg_state *devcs = css_to_devcs(of_css(of));
+	int err = 0;
+
+	while (buf && !err) {
+		struct dev_cgroup_pool_state *pool = NULL;
+		char *options, *dev_name;
+		unsigned long set_mask = 0;
+		struct devcg_device *dev;
+		u64 new_limits[DEVICE_CGROUP_MAX_REGIONS];
+		int i;
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
+		dev_name = strsep(&options, " \t");
+		if (!dev_name[0])
+			continue;
+
+		rcu_read_lock();
+		dev = devcg_get_device_by_name(dev_name);
+		rcu_read_unlock();
+
+		if (!dev)
+			return -EINVAL;
+
+		err = devcg_parse_limits(options, dev, new_limits, &set_mask);
+		if (err < 0)
+			goto out_put;
+
+		pool = get_cg_pool_unlocked(devcs, dev);
+		if (IS_ERR(pool)) {
+			err = PTR_ERR(pool);
+			goto out_put;
+		}
+
+		/* And commit */
+		for_each_set_bit(i, &set_mask, DEVICE_CGROUP_MAX_REGIONS)
+			apply(pool, i, new_limits[i]);
+
+out_put:
+		kref_put(&dev->ref, devcg_free_device);
+	}
+
+
+	return err ?: nbytes;
+}
+
+static int devcg_limit_show(struct seq_file *sf, void *v,
+			    u64 (*fn)(struct dev_cgroup_pool_state *, int))
+{
+	struct devcg_state *devcs = css_to_devcs(seq_css(sf));
+	struct devcg_device *dev;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(dev, &devcg_devices, dev_node) {
+		struct dev_cgroup_pool_state *pool = find_cg_pool_locked(devcs, dev);
+
+		seq_puts(sf, dev->name);
+
+		for (int i = 0; i < dev->base.num_regions; i++) {
+			u64 val = fn(pool, i);
+
+			if (val < PAGE_COUNTER_MAX)
+				seq_printf(sf, " %s=%lld",
+					   dev->base.regions[i].name, val);
+			else
+				seq_printf(sf, " %s=max", dev->base.regions[i].name);
+		}
+
+		seq_putc(sf, '\n');
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+
+static int devcg_region_current_show(struct seq_file *sf, void *v)
+{
+	return devcg_limit_show(sf, v, get_resource_current);
+}
+
+static int devcg_region_min_show(struct seq_file *sf, void *v)
+{
+	return devcg_limit_show(sf, v, get_resource_min);
+}
+
+static ssize_t devcg_region_min_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return devcg_limit_write(of, buf, nbytes, off, set_resource_min);
+}
+
+static int devcg_region_low_show(struct seq_file *sf, void *v)
+{
+	return devcg_limit_show(sf, v, get_resource_low);
+}
+
+static ssize_t devcg_region_low_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return devcg_limit_write(of, buf, nbytes, off, set_resource_low);
+}
+
+static int devcg_region_max_show(struct seq_file *sf, void *v)
+{
+	return devcg_limit_show(sf, v, get_resource_max);
+}
+
+static ssize_t devcg_region_max_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	return devcg_limit_write(of, buf, nbytes, off, set_resource_max);
+}
+
+static struct cftype files[] = {
+	{
+		.name = "region.capacity",
+		.seq_show = devcg_region_capacity_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+	{
+		.name = "region.current",
+		.seq_show = devcg_region_current_show,
+	},
+	{
+		.name = "region.min",
+		.write = devcg_region_min_write,
+		.seq_show = devcg_region_min_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "region.low",
+		.write = devcg_region_low_write,
+		.seq_show = devcg_region_low_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "region.max",
+		.write = devcg_region_max_write,
+		.seq_show = devcg_region_max_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{ } /* Zero entry terminates. */
+};
+
+struct cgroup_subsys dev_cgrp_subsys = {
+	.css_alloc	= devcs_alloc,
+	.css_free	= devcs_free,
+	.css_offline	= devcs_offline,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
diff --git a/mm/page_counter.c b/mm/page_counter.c
index b249d15af9dd8..fbb0cb34415d7 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -288,7 +288,7 @@ int page_counter_memparse(const char *buf, const char *max,
 }
 
 
-#ifdef CONFIG_MEMCG
+#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DEVICE)
 /*
  * This function calculates an individual page counter's effective
  * protection which is derived from its own memory.min/low, its
@@ -460,4 +460,4 @@ void page_counter_calculate_protection(struct page_counter *root,
 			atomic_long_read(&parent->children_low_usage),
 			recursive_protection));
 }
-#endif /* CONFIG_MEMCG */
+#endif /* CONFIG_MEMCG || CONFIG_CGROUP_DEVICE */
-- 
2.45.2

