Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284E6F5365
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA5B10E213;
	Wed,  3 May 2023 08:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BBA10E20A;
 Wed,  3 May 2023 08:36:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 2/4] drm/cgroup: Add memory accounting to DRM cgroup
Date: Wed,  3 May 2023 10:34:58 +0200
Message-Id: <20230503083500.645848-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based roughly on the rdma and misc cgroup controllers, with a lot of
the accounting code borrowed from rdma.

The interface is simple:
- populate drmcgroup_device->regions[..] name and size for each active
  region.
- Call drm(m)cg_register_device()
- Use drmcg_try_charge to check if you can allocate a chunk of memory,
  use drmcg_uncharge when freeing it. This may return an error code,
  or -EAGAIN when the cgroup limit is reached.

The ttm code transforms -EAGAIN back to -ENOSPC since it has specific
logic for -ENOSPC, and returning -EAGAIN to userspace causes drmIoctl
to restart infinitely.

This API allows you to limit stuff with cgroups.
You can see the supported cards in /sys/fs/cgroup/drm.capacity
You need to echo +drm to cgroup.subtree_control, and then you can
partition memory.

In each cgroup subdir:
drm.max shows the current limits of the cgroup.
drm.current the current amount of allocated memory used by this cgroup.
drm.events shows the amount of time max memory was reached.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  46 ++
 Documentation/gpu/drm-compute.rst       |  54 +++
 include/linux/cgroup_drm.h              |  81 ++++
 kernel/cgroup/drm.c                     | 539 +++++++++++++++++++++++-
 4 files changed, 699 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/drm-compute.rst

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index f67c0829350b..b858d99cb2ef 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2374,6 +2374,52 @@ RDMA Interface Files
 	  mlx4_0 hca_handle=1 hca_object=20
 	  ocrdma1 hca_handle=1 hca_object=23
 
+DRM
+----
+
+The "drm" controller regulates the distribution and accounting of
+DRM resources.
+
+DRM Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+  drm.max
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
index 8ef66a47619f..4f17b1c85f47 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -6,4 +6,85 @@
 #ifndef _CGROUP_DRM_H
 #define _CGROUP_DRM_H
 
+#include <linux/types.h>
+
+#include <drm/drm_managed.h>
+
+struct drm_device;
+struct drm_file;
+
+struct drmcgroup_state;
+
+/*
+ * Use 8 as max, because of N^2 lookup when setting things, can be bumped if needed
+ * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
+ */
+#define DRMCG_MAX_REGIONS 8
+
+struct drmcgroup_device {
+	struct list_head list;
+	struct list_head pools;
+
+	struct {
+		u64 size;
+		const char *name;
+	} regions[DRMCG_MAX_REGIONS];
+
+	/* Name describing the card, set by drmcg_register_device */
+	const char *name;
+
+};
+
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+int drmcg_register_device(struct drm_device *dev,
+			   struct drmcgroup_device *drm_cg);
+void drmcg_unregister_device(struct drmcgroup_device *cgdev);
+int drmcg_try_charge(struct drmcgroup_state **drmcg,
+		     struct drmcgroup_device *cgdev,
+		     u32 index, u64 size);
+void drmcg_uncharge(struct drmcgroup_state *drmcg,
+		    struct drmcgroup_device *cgdev,
+		    u32 index, u64 size);
+#else
+static inline int
+drmcg_register_device(struct drm_device *dev,
+		      struct drm_cgroup *drm_cg)
+{
+	return 0;
+}
+
+static inline void drmcg_unregister_device(struct drmcgroup_device *cgdev)
+{
+}
+
+static inline int drmcg_try_charge(struct drmcgroup_state **drmcg,
+				   struct drmcgroup_device *cgdev,
+				   u32 index, u64 size)
+{
+	*drmcg = NULL;
+	return 0;
+}
+
+static inline void drmcg_uncharge(struct drmcgroup_state *drmcg,
+				  struct drmcgroup_device *cgdev,
+				  u32 index, u64 size)
+{ }
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
 #endif	/* _CGROUP_DRM_H */
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 02c8eaa633d3..a93d9344fd36 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -1,60 +1,557 @@
-/* SPDX-License-Identifier: MIT */
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright 2023 Intel
+ * Partially based on the rdma and misc controllers, which bear the following copyrights:
+ *
+ * Copyright 2020 Google LLC
+ * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
  */
 
 #include <linux/cgroup.h>
 #include <linux/cgroup_drm.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/parser.h>
 #include <linux/slab.h>
 
-struct drm_cgroup_state {
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+
+struct drmcgroup_state {
 	struct cgroup_subsys_state css;
+
+	struct list_head pools;
 };
 
-struct drm_root_cgroup_state {
-	struct drm_cgroup_state drmcs;
+struct drmcgroup_pool_state {
+	struct drmcgroup_device *device;
+	struct drmcgroup_resource {
+		s64 max, used;
+	} resources[DRMCG_MAX_REGIONS];
+
+	s64 usage_sum;
+
+	struct list_head	cg_node;
+	struct list_head	dev_node;
 };
 
-static struct drm_root_cgroup_state root_drmcs;
+static DEFINE_MUTEX(drmcg_mutex);
+static LIST_HEAD(drmcg_devices);
 
-static inline struct drm_cgroup_state *
+static inline struct drmcgroup_state *
 css_to_drmcs(struct cgroup_subsys_state *css)
 {
-	return container_of(css, struct drm_cgroup_state, css);
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
+	return css_to_drmcs(cg->css.parent);
+}
+
+static void free_cg_pool_locked(struct drmcgroup_pool_state *pool)
+{
+	lockdep_assert_held(&drmcg_mutex);
+
+	list_del(&pool->cg_node);
+	list_del(&pool->dev_node);
+	kfree(pool);
+}
+
+static void
+set_resource_max(struct drmcgroup_pool_state *pool, int i, u64 new_max)
+{
+	pool->resources[i].max = new_max;
+}
+
+static void set_all_resource_max_limit(struct drmcgroup_pool_state *rpool)
+{
+	int i;
+
+	for (i = 0; i < DRMCG_MAX_REGIONS; i++)
+		set_resource_max(rpool, i, S64_MAX);
+}
+
+static void drmcs_offline(struct cgroup_subsys_state *css)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(css);
+	struct drmcgroup_pool_state *pool, *next;
+
+	mutex_lock(&drmcg_mutex);
+	list_for_each_entry_safe(pool, next, &drmcs->pools, cg_node) {
+		if (!pool->usage_sum) {
+			free_cg_pool_locked(pool);
+		} else {
+			/* Reset all regions, last uncharge will remove pool */
+			set_all_resource_max_limit(pool);
+		}
+	}
+	mutex_unlock(&drmcg_mutex);
 }
 
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
-	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+	struct drmcgroup_state *drmcs = css_to_drmcs(css);
 
-	if (drmcs != &root_drmcs.drmcs)
-		kfree(drmcs);
+	kfree(drmcs);
 }
 
 static struct cgroup_subsys_state *
 drmcs_alloc(struct cgroup_subsys_state *parent_css)
 {
-	struct drm_cgroup_state *drmcs;
+	struct drmcgroup_state *drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
+	if (!drmcs)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&drmcs->pools);
+	return &drmcs->css;
+}
+
+static struct drmcgroup_pool_state *
+find_cg_pool_locked(struct drmcgroup_state *drmcs, struct drmcgroup_device *dev)
+{
+	struct drmcgroup_pool_state *pool;
+
+	list_for_each_entry(pool, &drmcs->pools, cg_node)
+		if (pool->device == dev)
+			return pool;
+
+	return NULL;
+}
+
+static struct drmcgroup_pool_state *
+get_cg_pool_locked(struct drmcgroup_state *drmcs, struct drmcgroup_device *dev)
+{
+	struct drmcgroup_pool_state *pool;
+
+	pool = find_cg_pool_locked(drmcs, dev);
+	if (pool)
+		return pool;
+
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->device = dev;
+	set_all_resource_max_limit(pool);
 
-	if (!parent_css) {
-		drmcs = &root_drmcs.drmcs;
-	} else {
-		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
-		if (!drmcs)
-			return ERR_PTR(-ENOMEM);
+	INIT_LIST_HEAD(&pool->cg_node);
+	INIT_LIST_HEAD(&pool->dev_node);
+	list_add_tail(&pool->cg_node, &drmcs->pools);
+	list_add_tail(&pool->dev_node, &dev->pools);
+	return pool;
+}
+
+void drmcg_unregister_device(struct drmcgroup_device *cgdev)
+{
+	struct drmcgroup_pool_state *pool, *next;
+
+	mutex_lock(&drmcg_mutex);
+	list_del(&cgdev->list);
+
+	list_for_each_entry_safe(pool, next, &cgdev->pools, dev_node)
+		free_cg_pool_locked(pool);
+	mutex_unlock(&drmcg_mutex);
+	kfree(cgdev->name);
+}
+
+EXPORT_SYMBOL_GPL(drmcg_unregister_device);
+
+int drmcg_register_device(struct drm_device *dev,
+			  struct drmcgroup_device *cgdev)
+{
+	char *name = kstrdup(dev->unique, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&cgdev->pools);
+	mutex_lock(&drmcg_mutex);
+	cgdev->name = name;
+	list_add_tail(&cgdev->list, &drmcg_devices);
+	mutex_unlock(&drmcg_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drmcg_register_device);
+
+static int drmcg_max_show(struct seq_file *sf, void *v)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(seq_css(sf));
+	struct drmcgroup_pool_state *pool;
+
+	mutex_lock(&drmcg_mutex);
+	list_for_each_entry(pool, &drmcs->pools, cg_node) {
+		struct drmcgroup_device *dev = pool->device;
+		int i;
+
+		seq_puts(sf, dev->name);
+
+		for (i = 0; i < DRMCG_MAX_REGIONS; i++) {
+			if (!dev->regions[i].name)
+				continue;
+
+			if (pool->resources[i].max < S64_MAX)
+				seq_printf(sf, " region.%s=%lld", dev->regions[i].name,
+					   pool->resources[i].max);
+			else
+				seq_printf(sf, " region.%s=max", dev->regions[i].name);
+		}
+
+		seq_putc(sf, '\n');
 	}
+	mutex_unlock(&drmcg_mutex);
 
-	return &drmcs->css;
+	return 0;
+}
+
+static struct drmcgroup_device *drmcg_get_device_locked(const char *name)
+{
+	struct drmcgroup_device *dev;
+
+	lockdep_assert_held(&drmcg_mutex);
+
+	list_for_each_entry(dev, &drmcg_devices, list)
+		if (!strcmp(name, dev->name))
+			return dev;
+
+	return NULL;
+}
+
+static void try_to_free_cg_pool_locked(struct drmcgroup_pool_state *pool)
+{
+	struct drmcgroup_device *dev = pool->device;
+	u32 i;
+
+	/* Memory charged to this pool */
+	if (pool->usage_sum)
+		return;
+
+	for (i = 0; i < DRMCG_MAX_REGIONS; i++) {
+		if (!dev->regions[i].name)
+			continue;
+
+		/* Is a specific limit set? */
+		if (pool->resources[i].max < S64_MAX)
+			return;
+	}
+
+	/*
+	 * No user of the pool and all entries are set to defaults;
+	 * safe to delete this pool.
+	 */
+	free_cg_pool_locked(pool);
+}
+
+
+static void
+uncharge_cg_locked(struct drmcgroup_state *drmcs,
+		   struct drmcgroup_device *cgdev,
+		   u32 index, u64 size)
+{
+	struct drmcgroup_pool_state *pool;
+
+	pool = find_cg_pool_locked(drmcs, cgdev);
+
+	if (unlikely(!pool)) {
+		pr_warn("Invalid device %p or drm cgroup %p\n", cgdev, drmcs);
+		return;
+	}
+
+	pool->resources[index].used -= size;
+
+	/*
+	 * A negative count (or overflow) is invalid,
+	 * it indicates a bug in the rdma controller.
+	 */
+	WARN_ON_ONCE(pool->resources[index].used < 0);
+	pool->usage_sum--;
+	try_to_free_cg_pool_locked(pool);
+}
+
+static void drmcg_uncharge_hierarchy(struct drmcgroup_state *drmcs,
+				     struct drmcgroup_device *cgdev,
+				     struct drmcgroup_state *stop_cg,
+				     u32 index, u64 size)
+{
+	struct drmcgroup_state *p;
+
+	mutex_lock(&drmcg_mutex);
+
+	for (p = drmcs; p != stop_cg; p = parent_drmcg(p))
+		uncharge_cg_locked(p, cgdev, index, size);
+
+	mutex_unlock(&drmcg_mutex);
+
+	css_put(&drmcs->css);
+}
+
+void drmcg_uncharge(struct drmcgroup_state *drmcs,
+		    struct drmcgroup_device *cgdev,
+		    u32 index,
+		    u64 size)
+{
+	if (index >= DRMCG_MAX_REGIONS)
+		return;
+
+	drmcg_uncharge_hierarchy(drmcs, cgdev, NULL, index, size);
+}
+EXPORT_SYMBOL_GPL(drmcg_uncharge);
+
+int drmcg_try_charge(struct drmcgroup_state **drmcs,
+		     struct drmcgroup_device *cgdev,
+		     u32 index,
+		     u64 size)
+{
+	struct drmcgroup_state *cg, *p;
+	struct drmcgroup_pool_state *pool;
+	u64 new;
+	int ret = 0;
+
+	if (index >= DRMCG_MAX_REGIONS)
+		return -EINVAL;
+
+	/*
+	 * hold on to css, as cgroup can be removed but resource
+	 * accounting happens on css.
+	 */
+	cg = get_current_drmcg();
+
+	mutex_lock(&drmcg_mutex);
+	for (p = cg; p; p = parent_drmcg(p)) {
+		pool = get_cg_pool_locked(p, cgdev);
+		if (IS_ERR(pool)) {
+			ret = PTR_ERR(pool);
+			goto err;
+		} else {
+			new = pool->resources[index].used + size;
+			if (new > pool->resources[index].max || new > S64_MAX) {
+				ret = -EAGAIN;
+				goto err;
+			} else {
+				pool->resources[index].used = new;
+				pool->usage_sum++;
+			}
+		}
+	}
+	mutex_unlock(&drmcg_mutex);
+
+	*drmcs = cg;
+	return 0;
+
+err:
+	mutex_unlock(&drmcg_mutex);
+	drmcg_uncharge_hierarchy(cg, cgdev, p, index, size);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drmcg_try_charge);
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
+		return retval;
+	}
+	if (!strncmp(value, "max", len))
+		return S64_MAX;
+
+	/* Not u64 or max, error */
+	return -EINVAL;
+}
+
+static int drmcg_parse_limits(char *options,
+			      u64 *limits, char **enables)
+{
+	char *c;
+	int num_limits = 0;
+
+	/* parse resource options */
+	while ((c = strsep(&options, " ")) != NULL) {
+		s64 limit;
+
+		if (num_limits >= DRMCG_MAX_REGIONS)
+			return -EINVAL;
+
+		limit = parse_resource(c, &enables[num_limits]);
+		if (limit < 0)
+			return limit;
+
+		limits[num_limits++] = limit;
+	}
+	return num_limits;
+}
+
+static ssize_t drmcg_max_write(struct kernfs_open_file *of,
+			       char *buf, size_t nbytes, loff_t off)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(of_css(of));
+	struct drmcgroup_device *dev;
+	struct drmcgroup_pool_state *pool;
+	char *options = strstrip(buf);
+	char *dev_name = strsep(&options, " ");
+	u64 limits[DRMCG_MAX_REGIONS];
+	u64 new_limits[DRMCG_MAX_REGIONS];
+	char *regions[DRMCG_MAX_REGIONS];
+	int num_limits, i;
+	unsigned long set_mask = 0;
+	int err = 0;
+
+	if (!dev_name)
+		return -EINVAL;
+
+	num_limits = drmcg_parse_limits(options, limits, regions);
+	if (num_limits < 0)
+		return num_limits;
+	if (!num_limits)
+		return -EINVAL;
+
+	/*
+	 * Everything is parsed into key=value pairs now, take lock and attempt to update
+	 * For good measure, set -EINVAL when a key is set twice.
+	 */
+	mutex_lock(&drmcg_mutex);
+
+	dev = drmcg_get_device_locked(dev_name);
+	if (!dev) {
+		err = -ENODEV;
+		goto err;
+	}
+
+	pool = get_cg_pool_locked(drmcs, dev);
+	if (IS_ERR(pool)) {
+		err = PTR_ERR(pool);
+		goto err;
+	}
+
+	/* Lookup region names and set new_limits to the index */
+	for (i = 0; i < num_limits; i++) {
+		int j;
+
+		for (j = 0; j < DRMCG_MAX_REGIONS; j++)
+			if (dev->regions[j].name &&
+			    !strcmp(regions[i], dev->regions[j].name))
+				break;
+
+		if (j == DRMCG_MAX_REGIONS ||
+		    set_mask & BIT(j)) {
+			err = -EINVAL;
+			goto err_put;
+		}
+
+		set_mask |= BIT(j);
+		new_limits[j] = limits[i];
+	}
+
+	/* And commit */
+	for_each_set_bit(i, &set_mask, DRMCG_MAX_REGIONS)
+		set_resource_max(pool, i, new_limits[i]);
+
+err_put:
+	try_to_free_cg_pool_locked(pool);
+err:
+	mutex_unlock(&drmcg_mutex);
+
+	return err ?: nbytes;
+}
+
+static int drmcg_current_show(struct seq_file *sf, void *v)
+{
+	struct drmcgroup_state *drmcs = css_to_drmcs(seq_css(sf));
+	struct drmcgroup_device *dev;
+
+	mutex_lock(&drmcg_mutex);
+	list_for_each_entry(dev, &drmcg_devices, list) {
+		struct drmcgroup_pool_state *pool = find_cg_pool_locked(drmcs, dev);
+		int i;
+
+		seq_puts(sf, dev->name);
+
+		for (i = 0; i < DRMCG_MAX_REGIONS; i++) {
+			if (!dev->regions[i].name)
+				continue;
+
+			seq_printf(sf, " region.%s=%lld", dev->regions[i].name,
+				   pool ? pool->resources[i].used : 0ULL);
+		}
+
+		seq_putc(sf, '\n');
+	}
+	mutex_unlock(&drmcg_mutex);
+
+	return 0;
+}
+
+static int drmcg_capacity_show(struct seq_file *sf, void *v)
+{
+	struct drmcgroup_device *dev;
+	int i;
+
+	list_for_each_entry(dev, &drmcg_devices, list) {
+		seq_puts(sf, dev->name);
+		for (i = 0; i < DRMCG_MAX_REGIONS; i++)
+			if (dev->regions[i].name)
+				seq_printf(sf, " region.%s=%lld",
+					   dev->regions[i].name,
+					   dev->regions[i].size);
+		seq_putc(sf, '\n');
+	}
+	return 0;
 }
 
-struct cftype files[] = {
+static struct cftype files[] = {
+	{
+		.name = "max",
+		.write = drmcg_max_write,
+		.seq_show = drmcg_max_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "current",
+		.seq_show = drmcg_current_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "capacity",
+		.seq_show = drmcg_capacity_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
 	{ } /* Zero entry terminates. */
 };
 
 struct cgroup_subsys drm_cgrp_subsys = {
 	.css_alloc	= drmcs_alloc,
 	.css_free	= drmcs_free,
-	.early_init	= false,
+	.css_offline	= drmcs_offline,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
 };
-- 
2.34.1

