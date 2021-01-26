Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4E304BAB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1F16E48D;
	Tue, 26 Jan 2021 21:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FFB6E171;
 Tue, 26 Jan 2021 21:44:37 +0000 (UTC)
IronPort-SDR: czDphdFDFSSebhkpN1AfIxsFWFVeVVre7XpD+ZiomSwypPelfgYXXEbLx2y5GMn87JQ+B+cjFT
 BpCUb8ws9GMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198770827"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="198770827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 13:44:37 -0800
IronPort-SDR: jB94TEEMFBkJrl7atXpKz+il2NJU9Q8ef60DYeuRMlLjJ1PRfvZy1XoNdkK7mqYeAUktlL3zX+
 GDY761QES78A==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="362139884"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 13:44:36 -0800
From: Brian Welty <brian.welty@intel.com>
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [RFC PATCH 1/9] cgroup: Introduce cgroup for drm subsystem
Date: Tue, 26 Jan 2021 13:46:18 -0800
Message-Id: <20210126214626.16260-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126214626.16260-1-brian.welty@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenny Ho <Kenny.Ho@amd.com>

With the increased importance of machine learning, data science and
other cloud-based applications, GPUs are already in production use in
data centers today.  Existing GPU resource management is very coarse
grain, however, as sysadmins are only able to distribute workload on a
per-GPU basis.  An alternative is to use GPU virtualization (with or
without SRIOV) but it generally acts on the entire GPU instead of the
specific resources in a GPU.  With a drm cgroup controller, we can
enable alternate, fine-grain, sub-GPU resource management (in addition
to what may be available via GPU virtualization.)

Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 ++++-
 Documentation/cgroup-v1/drm.rst         |  1 +
 include/linux/cgroup_drm.h              | 92 +++++++++++++++++++++++++
 include/linux/cgroup_subsys.h           |  4 ++
 init/Kconfig                            |  5 ++
 kernel/cgroup/Makefile                  |  1 +
 kernel/cgroup/drm.c                     | 42 +++++++++++
 7 files changed, 161 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/cgroup-v1/drm.rst
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 63521cd36ce5..b099e1d71098 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -63,8 +63,10 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
        5-7-1. RDMA Interface Files
      5-8. HugeTLB
        5.8-1. HugeTLB Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-9. GPU
+       5-9-1. GPU Interface Files
+     5-10. Misc
+       5-10-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2160,6 +2162,18 @@ HugeTLB Interface Files
 	are local to the cgroup i.e. not hierarchical. The file modified event
 	generated on this file reflects only the local events.
 
+GPU
+---
+
+The "gpu" controller regulates the distribution and accounting of
+of GPU-related resources.
+
+GPU Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+TODO
+
+
 Misc
 ----
 
diff --git a/Documentation/cgroup-v1/drm.rst b/Documentation/cgroup-v1/drm.rst
new file mode 100644
index 000000000000..5f5658e1f5ed
--- /dev/null
+++ b/Documentation/cgroup-v1/drm.rst
@@ -0,0 +1 @@
+Please see ../cgroup-v2.rst for details
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
new file mode 100644
index 000000000000..345af54a5d41
--- /dev/null
+++ b/include/linux/cgroup_drm.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ */
+#ifndef _CGROUP_DRM_H
+#define _CGROUP_DRM_H
+
+#include <linux/cgroup.h>
+
+#ifdef CONFIG_CGROUP_DRM
+
+/**
+ * The DRM cgroup controller data structure.
+ */
+struct drmcg {
+	struct cgroup_subsys_state	css;
+};
+
+/**
+ * css_to_drmcg - get the corresponding drmcg ref from a cgroup_subsys_state
+ * @css: the target cgroup_subsys_state
+ *
+ * Return: DRM cgroup that contains the @css
+ */
+static inline struct drmcg *css_to_drmcg(struct cgroup_subsys_state *css)
+{
+	return css ? container_of(css, struct drmcg, css) : NULL;
+}
+
+/**
+ * drmcg_get - get the drmcg reference that a task belongs to
+ * @task: the target task
+ *
+ * This increase the reference count of the css that the @task belongs to
+ *
+ * Return: reference to the DRM cgroup the task belongs to
+ */
+static inline struct drmcg *drmcg_get(struct task_struct *task)
+{
+	return css_to_drmcg(task_get_css(task, gpu_cgrp_id));
+}
+
+/**
+ * drmcg_put - put a drmcg reference
+ * @drmcg: the target drmcg
+ *
+ * Put a reference obtained via drmcg_get
+ */
+static inline void drmcg_put(struct drmcg *drmcg)
+{
+	if (drmcg)
+		css_put(&drmcg->css);
+}
+
+/**
+ * drmcg_parent - find the parent of a drm cgroup
+ * @cg: the target drmcg
+ *
+ * This does not increase the reference count of the parent cgroup
+ *
+ * Return: parent DRM cgroup of @cg
+ */
+static inline struct drmcg *drmcg_parent(struct drmcg *cg)
+{
+	return css_to_drmcg(cg->css.parent);
+}
+
+#else /* CONFIG_CGROUP_DRM */
+
+struct drmcg {
+};
+
+static inline struct drmcg *css_to_drmcg(struct cgroup_subsys_state *css)
+{
+	return NULL;
+}
+
+static inline struct drmcg *drmcg_get(struct task_struct *task)
+{
+	return NULL;
+}
+
+static inline void drmcg_put(struct drmcg *drmcg)
+{
+}
+
+static inline struct drmcg *drmcg_parent(struct drmcg *cg)
+{
+	return NULL;
+}
+
+#endif	/* CONFIG_CGROUP_DRM */
+#endif	/* _CGROUP_DRM_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index acb77dcff3b4..f4e627942115 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -61,6 +61,10 @@ SUBSYS(pids)
 SUBSYS(rdma)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+SUBSYS(gpu)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963..bee29f51e380 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1027,6 +1027,11 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
+config CGROUP_DRM
+	bool "DRM controller (EXPERIMENTAL)"
+	help
+	  Provides accounting and enforcement of resources in the DRM subsystem.
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index 5d7a76bfbbb7..31f186f58121 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -4,5 +4,6 @@ obj-y := cgroup.o rstat.o namespace.o cgroup-v1.o freezer.o
 obj-$(CONFIG_CGROUP_FREEZER) += legacy_freezer.o
 obj-$(CONFIG_CGROUP_PIDS) += pids.o
 obj-$(CONFIG_CGROUP_RDMA) += rdma.o
+obj-$(CONFIG_CGROUP_DRM) += drm.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
new file mode 100644
index 000000000000..5e38a8230922
--- /dev/null
+++ b/kernel/cgroup/drm.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2019 Advanced Micro Devices, Inc.
+#include <linux/slab.h>
+#include <linux/cgroup.h>
+#include <linux/cgroup_drm.h>
+
+static struct drmcg *root_drmcg __read_mostly;
+
+static void drmcg_css_free(struct cgroup_subsys_state *css)
+{
+	struct drmcg *drmcg = css_to_drmcg(css);
+
+	kfree(drmcg);
+}
+
+static struct cgroup_subsys_state *
+drmcg_css_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct drmcg *parent = css_to_drmcg(parent_css);
+	struct drmcg *drmcg;
+
+	drmcg = kzalloc(sizeof(struct drmcg), GFP_KERNEL);
+	if (!drmcg)
+		return ERR_PTR(-ENOMEM);
+
+	if (!parent)
+		root_drmcg = drmcg;
+
+	return &drmcg->css;
+}
+
+struct cftype files[] = {
+	{ }	/* terminate */
+};
+
+struct cgroup_subsys gpu_cgrp_subsys = {
+	.css_alloc	= drmcg_css_alloc,
+	.css_free	= drmcg_css_free,
+	.early_init	= false,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
