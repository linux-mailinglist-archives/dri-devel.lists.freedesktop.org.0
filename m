Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E991AC08
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B008825B;
	Thu, 27 Jun 2024 15:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B3C10EB0A;
 Thu, 27 Jun 2024 15:57:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
Date: Thu, 27 Jun 2024 17:47:21 +0200
Message-ID: <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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
- populate drmcgroup_device->regions[..] name and size for each active
  region, set num_regions accordingly.
- Call drm(m)cg_register_device()
- Use drmcg_try_charge to check if you can allocate a chunk of memory,
  use drmcg_uncharge when freeing it. This may return an error code,
  or -EAGAIN when the cgroup limit is reached. In that case a reference
  to the limiting pool is returned.
- The limiting cs can be used as compare function for
  drmcs_evict_valuable.
- After having evicted enough, drop reference to limiting cs with
  drmcs_pool_put.

This API allows you to limit device resources with cgroups.
You can see the supported cards in /sys/fs/cgroup/drm.capacity
You need to echo +drm to cgroup.subtree_control, and then you can
partition memory.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
---
 Documentation/admin-guide/cgroup-v2.rst |  51 ++
 Documentation/gpu/drm-compute.rst       |  54 ++
 include/linux/cgroup_drm.h              | 115 ++++
 include/linux/cgroup_subsys.h           |   4 +
 init/Kconfig                            |   7 +
 kernel/cgroup/Makefile                  |   1 +
 kernel/cgroup/drm.c                     | 813 ++++++++++++++++++++++++
 7 files changed, 1045 insertions(+)
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 8fbb0519d556..edf63c3edb41 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2553,6 +2553,57 @@ RDMA Interface Files
 	  mlx4_0 hca_handle=1 hca_object=20
 	  ocrdma1 hca_handle=1 hca_object=23
 
+DRM
+----
+
+The "drm" controller regulates the distribution and accounting of
+DRM resources, currently only memory regions. Because each memory
+region may have its own page size, which does not have to be equal
+to the system page size. the units are in bytes.
+
+DRM Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+  drm.max, drm.min, drm.low
+	A readwrite nested-keyed file that exists for all the cgroups
+	except root that describes current configured resource limit
+	for a DRM device.
+
+	Lines are keyed by device name and are not ordered.
+	Each line contains space separated resource name and its configured
+	limit that can be distributed.
+
+	The following nested keys are defined.
+
+	  ==========	=======================================================
+	  region.* 	Maximum amount of bytes that allocatable in this region
+	  ==========	=======================================================
+
+	An example for xe follows::
+
+	  0000:03:00.0 region.vram0=1073741824 region.stolen=max
+
+	The semantics are the same as for the memory cgroup controller, and are
+	calculated in the same way.
+
+  drm.capacity
+	A read-only file that describes maximum region capacity.
+	It only exists on the root cgroup. Not all memory can be
+	allocated by cgroups, as the kernel reserves some for
+	internal use.
+
+	An example for xe follows::
+
+	  0000:03:00.0 region.vram0=8514437120 region.stolen=67108864
+
+  drm.current
+	A read-only file that describes current resource usage.
+	It exists for all the cgroup except root.
+
+	An example for xe follows::
+
+	  0000:03:00.0 region.vram0=12550144 region.stolen=8650752
+
 HugeTLB
 -------
 
diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-compute.rst
new file mode 100644
index 000000000000..116270976ef7
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
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
new file mode 100644
index 000000000000..bbc466f9f368
--- /dev/null
+++ b/include/linux/cgroup_drm.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _CGROUP_DRM_H
+#define _CGROUP_DRM_H
+
+#include <linux/types.h>
+#include <linux/llist.h>
+
+#include <drm/drm_managed.h>
+
+struct drm_device;
+struct drm_file;
+
+struct drmcgroup_pool_state;
+
+/*
+ * Use 8 as max, because of N^2 lookup when setting things, can be bumped if needed
+ * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
+ */
+#define DRMCG_MAX_REGIONS 8
+
+/* Public definition of cgroup device, should not be modified after _register() */
+struct drmcgroup_device {
+	struct {
+		u64 size;
+		const char *name;
+	} regions[DRMCG_MAX_REGIONS];
+
+	int num_regions;
+
+	/* used by cgroups, do not use */
+	void *priv;
+};
+
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+int drmcg_register_device(struct drm_device *dev,
+			   struct drmcgroup_device *drm_cg);
+void drmcg_unregister_device(struct drmcgroup_device *cgdev);
+int drmcg_try_charge(struct drmcgroup_pool_state **drmcs,
+		     struct drmcgroup_pool_state **limitcs,
+		     struct drmcgroup_device *cgdev,
+		     u32 index, u64 size);
+void drmcg_uncharge(struct drmcgroup_pool_state *drmcs,
+		    struct drmcgroup_device *cgdev,
+		    u32 index, u64 size);
+
+bool drmcs_evict_valuable(struct drmcgroup_pool_state *limitcs,
+			  struct drmcgroup_device *dev,
+			  int index,
+			  struct drmcgroup_pool_state *testcs,
+			  bool ignore_low,
+			  bool *hit_low);
+
+void drmcs_pool_put(struct drmcgroup_pool_state *drmcs);
+#else
+static inline int
+drmcg_register_device(struct drm_device *dev,
+		      struct drmcgroup_device *drm_cg)
+{
+	return 0;
+}
+
+static inline void drmcg_unregister_device(struct drmcgroup_device *cgdev)
+{
+}
+
+static inline int drmcg_try_charge(struct drmcgroup_pool_state **drmcs,
+				   struct drmcgroup_pool_state **limitcs,
+				   struct drmcgroup_device *cgdev,
+				   u32 index, u64 size)
+{
+	*drmcs = NULL;
+	if (limitcs)
+		*limitcs = NULL;
+	return 0;
+}
+
+static inline void drmcg_uncharge(struct drmcgroup_pool_state *drmcs,
+				  struct drmcgroup_device *cgdev,
+				  u32 index, u64 size)
+{ }
+
+static inline bool drmcs_evict_valuable(struct drmcgroup_pool_state *limitcs,
+					struct drmcgroup_device *dev, int index,
+					struct drmcgroup_pool_state *testcs,
+					bool ignore_low, bool *hit_low)
+{
+	return true;
+}
+
+static inline void drmcs_pool_put(struct drmcgroup_pool_state *drmcs)
+{ }
+
+#endif
+
+static inline void drmmcg_unregister_device(struct drm_device *dev, void *arg)
+{
+	drmcg_unregister_device(arg);
+}
+
+/*
+ * This needs to be done as inline, because cgroup lives in the core
+ * kernel and it cannot call drm calls directly
+ */
+static inline int drmmcg_register_device(struct drm_device *dev,
+					 struct drmcgroup_device *cgdev)
+{
+	return drmcg_register_device(dev, cgdev) ?:
+		drmm_add_action_or_reset(dev, drmmcg_unregister_device, cgdev);
+}
+
+#endif	/* _CGROUP_DRM_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index 445235487230..49460494a010 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -65,6 +65,10 @@ SUBSYS(rdma)
 SUBSYS(misc)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+SUBSYS(drm)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/init/Kconfig b/init/Kconfig
index febdea2afc3b..0acb42c96579 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1091,6 +1091,13 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
+config CGROUP_DRM
+	bool "DRM controller"
+	help
+	  Provides the DRM subsystem controller.
+
+	  ...
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index 12f8457ad1f9..849bd2917477 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_CGROUP_PIDS) += pids.o
 obj-$(CONFIG_CGROUP_RDMA) += rdma.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CGROUP_MISC) += misc.o
+obj-$(CONFIG_CGROUP_DRM) += drm.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
new file mode 100644
index 000000000000..26d64070e74f
--- /dev/null
+++ b/kernel/cgroup/drm.c
@@ -0,0 +1,813 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023-2024 Intel
+ * Partially based on the rdma and misc controllers, which bear the following copyrights:
+ *
+ * Copyright 2020 Google LLC
+ * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
+ */
+
+#include <linux/cgroup.h>
+#include <linux/cgroup_drm.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/page_counter.h>
+#include <linux/parser.h>
+#include <linux/slab.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+
+struct drmcg_device {
+	spinlock_t lock;
+	struct kref ref;
+	struct rcu_head rcu;
+
+	/* Protected by RCU and global spinlock */
+	struct list_head dev_node;
+
+	/* Protected by global spinlock only */
+	struct list_head pools;
+
+	/* Copy of the struct passed by device, to prevent lifetime issues */
+	struct drmcgroup_device base;
+
+	/* Name describing the card, set by drmcg_register_device */
+	const char *name;
+
+	/* Whether the device is unregistered by its caller.
+	 * No new pools should be added to the device afterwards.
+	 */
+	bool unregistered;
+};
+
+struct drmcgroup_state {
+	struct cgroup_subsys_state css;
+
+	struct list_head pools;
+};
+
+struct drmcgroup_pool_state {
+	struct drmcg_device *device;
+	struct drmcgroup_state *cs;
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
+	struct drmcgroup_pool_res {
+		struct page_counter cnt;
+	} resources[];
+};
+
+/*
+ * 3 operations require locking protection:
+ * - Registering and unregistering device to/from list, requires global lock.
+ * - Adding a drmcgroup_pool_state to a CSS, removing when CSS is freed.
+ * - Adding a drmcgroup_pool_state to a device list.
+ *
+ * Since for the most common operations RCU provides enough protection, I
+ * do not think more granular locking makes sense. Most protection is offered
+ * by RCU and the lockless operating page_counter.
+ */
+static DEFINE_SPINLOCK(drmcg_lock);
+static LIST_HEAD(drmcg_devices);
+
+static inline struct drmcgroup_state *
+css_to_drmcs(struct cgroup_subsys_state *css)
+{
+	return container_of(css, struct drmcgroup_state, css);
+}
+
+static inline struct drmcgroup_state *get_current_drmcg(void)
+{
+	return css_to_drmcs(task_get_css(current, drm_cgrp_id));
+}
+
+static struct drmcgroup_state *parent_drmcg(struct drmcgroup_state *cg)
+{
+	return cg->css.parent ? css_to_drmcs(cg->css.parent) : NULL;
+}
+
+static void free_cg_pool(struct drmcgroup_pool_state *pool)
+{
+	list_del(&pool->dev_node);
+	kfree(pool);
+}
+
+static void
+set_resource_min(struct drmcgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_min(&pool->resources[i].cnt, val);
+}
+
+static void
+set_resource_low(struct drmcgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_low(&pool->resources[i].cnt, val);
+}
+
+static void
+set_resource_max(struct drmcgroup_pool_state *pool, int i, u64 val)
+{
+	page_counter_set_max(&pool->resources[i].cnt, val);
+}
+
+static u64 get_resource_low(struct drmcgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.low) : 0;
+}
+
+static u64 get_resource_min(struct drmcgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.min) : 0;
+}
+
+static u64 get_resource_max(struct drmcgroup_pool_state *pool, int idx)
+{
+	return pool ? READ_ONCE(pool->resources[idx].cnt.max) : PAGE_COUNTER_MAX;
+}
+
+static u64 get_resource_current(struct drmcgroup_pool_state *pool, int idx)
+{
+	return pool ? page_counter_read(&pool->resources[idx].cnt) : 0;
+}
+
+static void reset_all_resource_limits(struct drmcgroup_pool_state *rpool)
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
+static void drmcs_offline(struct cgroup_subsys_state *css)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(css);
+	struct drmcgroup_pool_state *pool;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(pool, &drmcs->pools, css_node)
+		reset_all_resource_limits(pool);
+	rcu_read_unlock();
+}
+
+static void drmcs_free(struct cgroup_subsys_state *css)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(css);
+	struct drmcgroup_pool_state *pool, *next;
+
+	spin_lock(&drmcg_lock);
+	list_for_each_entry_safe(pool, next, &drmcs->pools, css_node) {
+		/*
+		 *The pool is dead and all references are 0,
+		 * no need for RCU protection with list_del_rcu or freeing.
+		 */
+		list_del(&pool->css_node);
+		free_cg_pool(pool);
+	}
+	spin_unlock(&drmcg_lock);
+
+	kfree(drmcs);
+}
+
+static struct cgroup_subsys_state *
+drmcs_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct drmcgroup_state *drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
+	if (!drmcs)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&drmcs->pools);
+	return &drmcs->css;
+}
+
+static struct drmcgroup_pool_state *
+find_cg_pool_locked(struct drmcgroup_state *drmcs, struct drmcg_device *dev)
+{
+	struct drmcgroup_pool_state *pool;
+
+	list_for_each_entry_rcu(pool, &drmcs->pools, css_node, spin_locked(&drmcg_lock))
+		if (pool->device == dev)
+			return pool;
+
+	return NULL;
+}
+
+static struct drmcgroup_pool_state *pool_parent(struct drmcgroup_pool_state *pool)
+{
+	if (!pool->resources[0].cnt.parent)
+		return NULL;
+
+	return container_of(pool->resources[0].cnt.parent, typeof(*pool), resources[0].cnt);
+}
+
+bool drmcs_evict_valuable(struct drmcgroup_pool_state *limit,
+			  struct drmcgroup_device *dev,
+			  int index,
+			  struct drmcgroup_pool_state *test,
+			  bool ignore_low,
+			  bool *hit_low)
+{
+	struct drmcgroup_pool_state *pool = test;
+	struct page_counter *climit, *ctest;
+	u64 used, min, low;
+
+	/* Can always evict from current pool, despite limits */
+	if (limit == test)
+		return true;
+
+	if (limit) {
+		if (!parent_drmcg(limit->cs))
+			return true;
+
+		for (pool = test; pool && limit != pool; pool = pool_parent(pool))
+			{}
+
+		if (!pool)
+			return false;
+	} else {
+		/*
+		 * If there is no cgroup limiting memory usage, use the root
+		 * cgroup instead for limit calculations.
+		 */
+		for (limit = test; pool_parent(limit); limit = pool_parent(limit))
+			{}
+	}
+
+	climit = &limit->resources[index].cnt;
+	ctest = &test->resources[index].cnt;
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
+		*hit_low = true;
+		return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(drmcs_evict_valuable);
+
+static struct drmcgroup_pool_state *
+alloc_pool_single(struct drmcgroup_state *drmcs, struct drmcg_device *dev,
+		  struct drmcgroup_pool_state **allocpool)
+{
+	struct drmcgroup_state *parent = parent_drmcg(drmcs);
+	struct drmcgroup_pool_state *pool, *ppool = NULL;
+	int i;
+
+	if (!*allocpool) {
+		pool = kzalloc(offsetof(struct drmcgroup_pool_state, resources[dev->base.num_regions]), GFP_NOWAIT);
+		if (!pool)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		pool = *allocpool;
+		*allocpool = NULL;
+	}
+
+	pool->device = dev;
+	pool->num_res = dev->base.num_regions;
+	pool->cs = drmcs;
+
+	if (parent)
+		ppool = find_cg_pool_locked(parent, dev);
+
+	for (i = 0; i < pool->num_res; i++)
+		page_counter_init(&pool->resources[i].cnt, ppool ? &ppool->resources[i].cnt : NULL);
+	reset_all_resource_limits(pool);
+
+	list_add_tail_rcu(&pool->css_node, &drmcs->pools);
+	list_add_tail(&pool->dev_node, &dev->pools);
+
+	if (!parent)
+		pool->inited = true;
+	else
+		pool->inited = ppool ? ppool->inited : false;
+	return pool;
+}
+
+static struct drmcgroup_pool_state *
+get_cg_pool_locked(struct drmcgroup_state *drmcs, struct drmcg_device *dev,
+		   struct drmcgroup_pool_state **allocpool)
+{
+	struct drmcgroup_pool_state *pool, *ppool, *retpool;
+	struct drmcgroup_state *p, *pp;
+	int i;
+
+	/*
+	 * Recursively create pool, we may not initialize yet on
+	 * recursion, this is done as a separate step.
+	 */
+	for (p = drmcs; p; p = parent_drmcg(p)) {
+		pool = find_cg_pool_locked(p, dev);
+		if (!pool)
+			pool = alloc_pool_single(p, dev, allocpool);
+
+		if (IS_ERR(pool))
+			return pool;
+
+		if (p == drmcs && pool->inited)
+			return pool;
+
+		if (pool->inited)
+			break;
+	}
+
+	retpool = pool = find_cg_pool_locked(drmcs, dev);
+	for (p = drmcs, pp = parent_drmcg(drmcs); pp; p = pp, pp = parent_drmcg(p)) {
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
+static void drmcg_free_rcu(struct rcu_head *rcu)
+{
+	struct drmcg_device *dev = container_of(rcu, typeof(*dev), rcu);
+	struct drmcgroup_pool_state *pool, *next;
+
+	list_for_each_entry_safe(pool, next, &dev->pools, dev_node)
+		free_cg_pool(pool);
+	kfree(dev->name);
+	kfree(dev);
+}
+
+static void drmcg_free_device(struct kref *ref)
+{
+	struct drmcg_device *cgdev = container_of(ref, typeof(*cgdev), ref);
+
+	call_rcu(&cgdev->rcu, drmcg_free_rcu);
+}
+
+void drmcg_unregister_device(struct drmcgroup_device *cgdev)
+{
+	struct drmcg_device *dev;
+	struct list_head *entry;
+
+	if (!cgdev || !cgdev->priv)
+		return;
+
+	dev = cgdev->priv;
+	cgdev->priv = NULL;
+
+	spin_lock(&drmcg_lock);
+
+	/* Remove from global device list */
+	list_del_rcu(&dev->dev_node);
+
+	list_for_each_rcu(entry, &dev->pools) {
+		struct drmcgroup_pool_state *pool =
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
+	spin_unlock(&drmcg_lock);
+
+	kref_put(&dev->ref, drmcg_free_device);
+}
+
+EXPORT_SYMBOL_GPL(drmcg_unregister_device);
+
+int drmcg_register_device(struct drm_device *drm_dev,
+			  struct drmcgroup_device *cgdev)
+{
+	struct drmcg_device *dev;
+	char *name;
+
+	cgdev->priv = NULL;
+	if (!cgdev->num_regions)
+		return 0;
+
+	cgdev->priv = dev = kzalloc(sizeof (*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	name = kstrdup(drm_dev->unique, GFP_KERNEL);
+	if (!name) {
+		kfree(dev);
+		cgdev->priv = NULL;
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&dev->pools);
+	dev->name = name;
+	dev->base = *cgdev;
+	kref_init(&dev->ref);
+
+	spin_lock(&drmcg_lock);
+	list_add_tail_rcu(&dev->dev_node, &drmcg_devices);
+	spin_unlock(&drmcg_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drmcg_register_device);
+
+static struct drmcg_device *drmcg_get_device(const char *name)
+{
+	struct drmcg_device *dev;
+
+	list_for_each_entry_rcu(dev, &drmcg_devices, dev_node, spin_locked(&drmcg_lock))
+		if (!strcmp(name, dev->name) &&
+		    kref_get_unless_zero(&dev->ref))
+			return dev;
+
+	return NULL;
+}
+
+void drmcs_pool_put(struct drmcgroup_pool_state *pool)
+{
+	if (pool)
+		css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(drmcs_pool_put);
+
+static struct drmcgroup_pool_state *
+get_cg_pool_unlocked(struct drmcgroup_state *cg, struct drmcg_device *dev)
+{
+	struct drmcgroup_pool_state *pool, *allocpool = NULL;
+
+	/* fastpath lookup? */
+	rcu_read_lock();
+	pool = find_cg_pool_locked(cg, dev);
+	if (pool && !READ_ONCE(pool->inited))
+		pool = NULL;
+	rcu_read_unlock();
+
+	while (!pool) {
+		spin_lock(&drmcg_lock);
+		if (!dev->unregistered)
+			pool = get_cg_pool_locked(cg, dev, &allocpool);
+		else
+			pool = ERR_PTR(-ENODEV);
+		spin_unlock(&drmcg_lock);
+
+		if (pool == ERR_PTR(-ENOMEM)) {
+			pool = NULL;
+			if (WARN_ON(allocpool))
+				continue;
+
+			allocpool = kzalloc(offsetof(struct drmcgroup_pool_state, resources[dev->base.num_regions]), GFP_KERNEL);
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
+void drmcg_uncharge(struct drmcgroup_pool_state *pool,
+		    struct drmcgroup_device *cgdev,
+		    u32 index, u64 size)
+{
+	if (index >= cgdev->num_regions || !pool)
+		return;
+
+	page_counter_uncharge(&pool->resources[index].cnt, size);
+	css_put(&pool->cs->css);
+}
+EXPORT_SYMBOL_GPL(drmcg_uncharge);
+
+int drmcg_try_charge(struct drmcgroup_pool_state **drmcs,
+		     struct drmcgroup_pool_state **limitcs,
+		     struct drmcgroup_device *dev,
+		     u32 index, u64 size)
+{
+	struct drmcg_device *cgdev = dev->priv;
+	struct drmcgroup_state *cg;
+	struct drmcgroup_pool_state *pool;
+	struct page_counter *fail;
+	int ret;
+
+	*drmcs = NULL;
+	if (limitcs)
+		*limitcs = NULL;
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
+	cg = get_current_drmcg();
+
+	pool = get_cg_pool_unlocked(cg, cgdev);
+	if (IS_ERR(pool)) {
+		ret = PTR_ERR(pool);
+		goto err;
+	}
+
+	if (!page_counter_try_charge(&pool->resources[index].cnt, size, &fail)) {
+		if (limitcs) {
+			*limitcs = container_of(fail, struct drmcgroup_pool_state, resources[index].cnt);
+			css_get(&(*limitcs)->cs->css);
+		}
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	/* On success, reference is transferred to *drmcs */
+	*drmcs = pool;
+	return 0;
+
+err:
+	css_put(&cg->css);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drmcg_try_charge);
+
+static int drmcg_capacity_show(struct seq_file *sf, void *v)
+{
+	struct drmcg_device *dev;
+	int i;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(dev, &drmcg_devices, dev_node) {
+		seq_puts(sf, dev->name);
+		for (i = 0; i < dev->base.num_regions; i++)
+			seq_printf(sf, " region.%s=%lld",
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
+	/* Only support region setting for now */
+	if (strncmp(name, "region.", 7))
+		return -EINVAL;
+	else
+		name += 7;
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
+static int drmcg_parse_limits(char *options, struct drmcg_device *dev,
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
+static ssize_t drmcg_limit_write(struct kernfs_open_file *of,
+				 char *buf, size_t nbytes, loff_t off,
+				 void (*apply)(struct drmcgroup_pool_state *, int, u64))
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(of_css(of));
+	int err = 0;
+
+	while (buf && !err) {
+		struct drmcgroup_pool_state *pool = NULL;
+		char *options, *dev_name;
+		unsigned long set_mask = 0;
+		struct drmcg_device *dev;
+		u64 new_limits[DRMCG_MAX_REGIONS];
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
+		dev = drmcg_get_device(dev_name);
+		rcu_read_unlock();
+
+		if (!dev)
+			return -EINVAL;
+
+		err = drmcg_parse_limits(options, dev, new_limits, &set_mask);
+		if (err < 0)
+			goto out_put;
+
+		pool = get_cg_pool_unlocked(drmcs, dev);
+		if (IS_ERR(pool)) {
+			err = PTR_ERR(pool);
+			goto out_put;
+		}
+
+		/* And commit */
+		for_each_set_bit(i, &set_mask, DRMCG_MAX_REGIONS)
+			apply(pool, i, new_limits[i]);
+
+out_put:
+		kref_put(&dev->ref, drmcg_free_device);
+	}
+
+
+	return err ?: nbytes;
+}
+
+static int drmcg_limit_show(struct seq_file *sf, void *v,
+			    u64 (*fn)(struct drmcgroup_pool_state *, int))
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(seq_css(sf));
+	struct drmcg_device *dev;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(dev, &drmcg_devices, dev_node) {
+		struct drmcgroup_pool_state *pool = find_cg_pool_locked(drmcs, dev);
+
+		seq_puts(sf, dev->name);
+
+		for (int i = 0; i < dev->base.num_regions; i++) {
+			u64 val = fn(pool, i);
+
+			if (val < PAGE_COUNTER_MAX)
+				seq_printf(sf, " region.%s=%lld",
+					   dev->base.regions[i].name, val);
+			else
+				seq_printf(sf, " region.%s=max", dev->base.regions[i].name);
+		}
+
+		seq_putc(sf, '\n');
+	}
+	rcu_read_unlock();
+
+	css_put(&drmcs->css);
+
+	return 0;
+}
+
+static int drmcg_current_show(struct seq_file *sf, void *v)
+{
+	return drmcg_limit_show(sf, v, get_resource_current);
+}
+
+static int drmcg_min_show(struct seq_file *sf, void *v)
+{
+	return drmcg_limit_show(sf, v, get_resource_min);
+}
+
+static ssize_t drmcg_min_write(struct kernfs_open_file *of,
+			       char *buf, size_t nbytes, loff_t off)
+{
+	return drmcg_limit_write(of, buf, nbytes, off, set_resource_min);
+}
+
+static int drmcg_low_show(struct seq_file *sf, void *v)
+{
+	return drmcg_limit_show(sf, v, get_resource_low);
+}
+
+static ssize_t drmcg_low_write(struct kernfs_open_file *of,
+			       char *buf, size_t nbytes, loff_t off)
+{
+	return drmcg_limit_write(of, buf, nbytes, off, set_resource_low);
+}
+
+static int drmcg_max_show(struct seq_file *sf, void *v)
+{
+	return drmcg_limit_show(sf, v, get_resource_max);
+}
+
+static ssize_t drmcg_max_write(struct kernfs_open_file *of,
+			       char *buf, size_t nbytes, loff_t off)
+{
+	return drmcg_limit_write(of, buf, nbytes, off, set_resource_max);
+}
+
+static struct cftype files[] = {
+	{
+		.name = "capacity",
+		.seq_show = drmcg_capacity_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+	{
+		.name = "current",
+		.seq_show = drmcg_current_show,
+	},
+	{
+		.name = "min",
+		.write = drmcg_min_write,
+		.seq_show = drmcg_min_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "low",
+		.write = drmcg_low_write,
+		.seq_show = drmcg_low_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "max",
+		.write = drmcg_max_write,
+		.seq_show = drmcg_max_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{ } /* Zero entry terminates. */
+};
+
+struct cgroup_subsys drm_cgrp_subsys = {
+	.css_alloc	= drmcs_alloc,
+	.css_free	= drmcs_free,
+	.css_offline	= drmcs_offline,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
-- 
2.45.2

