Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0FA7FBEB0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FA210E585;
	Tue, 28 Nov 2023 15:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16710E066;
 Tue, 28 Nov 2023 13:07:56 +0000 (UTC)
Received: from kwepemm000018.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sfj3C1QgjzWhqF;
 Tue, 28 Nov 2023 20:49:59 +0800 (CST)
Received: from DESKTOP-RAUQ1L5.china.huawei.com (10.174.179.172) by
 kwepemm000018.china.huawei.com (7.193.23.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 20:50:40 +0800
From: Weixi Zhu <weixi.zhu@huawei.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <akpm@linux-foundation.org>
Subject: [RFC PATCH 1/6] mm/gmem: add heterogeneous NUMA node
Date: Tue, 28 Nov 2023 20:50:20 +0800
Message-ID: <20231128125025.4449-2-weixi.zhu@huawei.com>
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

This patch adds a new NUMA node state, named N_HETEROGENEOUS. It is
utilized to identify heterogeneous NUMA (hNUMA) node. Note that hNUMA node
may not be directly accessible by the CPU.

Each hNUMA node can be identified with a NUMA id. This can be extended to
provide NUMA topology including device local DRAM, where a cache-coherent
bus does not need to exist between the CPU and device local DRAM.
Furthermore, this allows an application user to issue memory hints that
bind with specific hNUMA nodes.

Signed-off-by: Weixi Zhu <weixi.zhu@huawei.com>
---
 drivers/base/node.c      |  6 ++++
 include/linux/gmem.h     | 19 ++++++++++
 include/linux/nodemask.h | 10 ++++++
 init/main.c              |  2 ++
 mm/Kconfig               | 14 ++++++++
 mm/Makefile              |  1 +
 mm/gmem.c                | 78 ++++++++++++++++++++++++++++++++++++++++
 mm/page_alloc.c          |  3 ++
 8 files changed, 133 insertions(+)
 create mode 100644 include/linux/gmem.h
 create mode 100644 mm/gmem.c

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 493d533f8375..aa4d2ca266aa 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -928,6 +928,9 @@ static struct node_attr node_state_attr[] = {
 	[N_CPU] = _NODE_ATTR(has_cpu, N_CPU),
 	[N_GENERIC_INITIATOR] = _NODE_ATTR(has_generic_initiator,
 					   N_GENERIC_INITIATOR),
+#ifdef CONFIG_GMEM
+	[N_HETEROGENEOUS] = _NODE_ATTR(has_hetero_memory, N_HETEROGENEOUS),
+#endif
 };
 
 static struct attribute *node_state_attrs[] = {
@@ -940,6 +943,9 @@ static struct attribute *node_state_attrs[] = {
 	&node_state_attr[N_MEMORY].attr.attr,
 	&node_state_attr[N_CPU].attr.attr,
 	&node_state_attr[N_GENERIC_INITIATOR].attr.attr,
+#ifdef CONFIG_GMEM
+	&node_state_attr[N_HETEROGENEOUS].attr.attr,
+#endif
 	NULL
 };
 
diff --git a/include/linux/gmem.h b/include/linux/gmem.h
new file mode 100644
index 000000000000..fff877873557
--- /dev/null
+++ b/include/linux/gmem.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generalized Memory Management.
+ *
+ * Copyright (C) 2023- Huawei, Inc.
+ * Author: Weixi Zhu
+ *
+ */
+#ifndef _GMEM_H
+#define _GMEM_H
+
+#ifdef CONFIG_GMEM
+/* h-NUMA topology */
+void __init hnuma_init(void);
+#else
+static inline void hnuma_init(void) {}
+#endif
+
+#endif /* _GMEM_H */
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 8d07116caaf1..66e4640a52ba 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -407,6 +407,9 @@ enum node_states {
 	N_MEMORY,		/* The node has memory(regular, high, movable) */
 	N_CPU,		/* The node has one or more cpus */
 	N_GENERIC_INITIATOR,	/* The node has one or more Generic Initiators */
+#ifdef CONFIG_GMEM
+	N_HETEROGENEOUS,	/* The node has heterogeneous memory */
+#endif
 	NR_NODE_STATES
 };
 
@@ -536,6 +539,13 @@ static inline int node_random(const nodemask_t *maskp)
 #define for_each_node(node)	   for_each_node_state(node, N_POSSIBLE)
 #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
 
+#ifdef CONFIG_GMEM
+/* For h-NUMA topology */
+#define hnode_map		node_states[N_HETEROGENEOUS]
+#define num_hnodes()		num_node_state(N_HETEROGENEOUS)
+#define for_each_hnode(node)	for_each_node_state(node, N_HETEROGENEOUS)
+#endif
+
 /*
  * For nodemask scratch area.
  * NODEMASK_ALLOC(type, name) allocates an object with a specified type and
diff --git a/init/main.c b/init/main.c
index e24b0780fdff..12dfb5b63d51 100644
--- a/init/main.c
+++ b/init/main.c
@@ -100,6 +100,7 @@
 #include <linux/stackdepot.h>
 #include <linux/randomize_kstack.h>
 #include <net/net_namespace.h>
+#include <linux/gmem.h>
 
 #include <asm/io.h>
 #include <asm/setup.h>
@@ -901,6 +902,7 @@ void start_kernel(void)
 	setup_per_cpu_areas();
 	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
 	boot_cpu_hotplug_init();
+	hnuma_init();
 
 	pr_notice("Kernel command line: %s\n", saved_command_line);
 	/* parameters may set static keys */
diff --git a/mm/Kconfig b/mm/Kconfig
index 89971a894b60..1a7d8194513c 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1270,6 +1270,20 @@ config LOCK_MM_AND_FIND_VMA
 	bool
 	depends on !STACK_GROWSUP
 
+config GMEM
+	bool "generalized memory management for external memory devices"
+	depends on (ARM64 || X86_64) && MMU && TRANSPARENT_HUGEPAGE
+	select ARCH_USES_HIGH_VMA_FLAGS
+	default y
+	help
+	  Supporting GMEM (generalized memory management) for external memory
+	  devices
+
+	  GMEM extends Linux MM to share its machine-independent MM code. Only
+	  high-level interface is provided for device drivers. This prevents
+	  accelerator drivers from reinventing the wheel, but relies on drivers to
+	  implement their hardware-dependent functions declared by GMEM.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 33873c8aedb3..f48ea2eb4a44 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -138,3 +138,4 @@ obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
+obj-$(CONFIG_GMEM) += gmem.o
diff --git a/mm/gmem.c b/mm/gmem.c
new file mode 100644
index 000000000000..767eb070b22e
--- /dev/null
+++ b/mm/gmem.c
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generalized Memory Management.
+ *
+ * Copyright (C) 2023- Huawei, Inc.
+ * Author: Weixi Zhu
+ *
+ */
+#include <linux/mm.h>
+#include <linux/gmem.h>
+
+DEFINE_SPINLOCK(hnode_lock);
+
+struct hnode {
+	unsigned int id;
+	struct gm_dev *dev;
+	struct xarray pages;
+};
+
+struct hnode *hnodes[MAX_NUMNODES];
+
+static bool is_hnode(int node)
+{
+	return !node_isset(node, node_possible_map) &&
+	       node_isset(node, hnode_map);
+}
+
+static bool is_hnode_allowed(int node)
+{
+	return is_hnode(node) && node_isset(node, current->mems_allowed);
+}
+
+static struct hnode *get_hnode(unsigned int hnid)
+{
+	return hnodes[hnid];
+}
+
+void __init hnuma_init(void)
+{
+	unsigned int node;
+
+	for_each_node(node)
+		node_set(node, hnode_map);
+}
+
+static unsigned int alloc_hnode_id(void)
+{
+	unsigned int node;
+
+	spin_lock(&hnode_lock);
+	node = first_unset_node(hnode_map);
+	node_set(node, hnode_map);
+	spin_unlock(&hnode_lock);
+
+	return node;
+}
+
+static void free_hnode_id(unsigned int nid)
+{
+	node_clear(nid, hnode_map);
+}
+
+static void hnode_init(struct hnode *hnode, unsigned int hnid,
+		       struct gm_dev *dev)
+{
+	hnodes[hnid] = hnode;
+	hnodes[hnid]->id = hnid;
+	hnodes[hnid]->dev = dev;
+	xa_init(&hnodes[hnid]->pages);
+}
+
+static void hnode_deinit(unsigned int hnid, struct gm_dev *dev)
+{
+	hnodes[hnid]->id = 0;
+	hnodes[hnid]->dev = NULL;
+	xa_destroy(&hnodes[hnid]->pages);
+	hnodes[hnid] = NULL;
+}
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 733732e7e0ba..a785b62a1542 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -192,6 +192,9 @@ EXPORT_SYMBOL(latent_entropy);
 nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 	[N_POSSIBLE] = NODE_MASK_ALL,
 	[N_ONLINE] = { { [0] = 1UL } },
+#ifdef CONFIG_GMEM
+	[N_HETEROGENEOUS] = NODE_MASK_NONE,
+#endif
 #ifndef CONFIG_NUMA
 	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
 #ifdef CONFIG_HIGHMEM
-- 
2.25.1

