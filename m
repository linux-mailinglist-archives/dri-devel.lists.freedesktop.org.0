Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCF667C0F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B07E10E302;
	Thu, 12 Jan 2023 16:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913610E302;
 Thu, 12 Jan 2023 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673542662; x=1705078662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tUTxI03m+NTLtcglmz0tTkp8uvuUcMX2wFEFmhnCZQ=;
 b=BvXX0qtsyc/qd94CBSUtJC0DR/b/WslwBBN39pCYK12q1xNfKJh6jfx+
 rJO2oy8QqHGt1/sRDtj/QVMd0x4bHlS+OM3jg1ZlM+vvf3UoUItJZ/G7E
 /zuX0A9nPs9MPmaZdvThXq8zCOPV4cGEafwWxJsOo/Xl4ZitsIe8LJSOX
 LuqTRs+7yp/cKevIL+/RzqzU9PpeUneKeQOIr0fAXW8W2qlm3ungNU3FS
 /Kgqsv5Vm9RPHvlS+mSaWt1HZt3Pjg+1TYrowHd1veCmcRK+goVogpvjs
 cNqhUCbW0KHExtkZ2st9GsWYV3TL5cPv7I9WjTITHUpG5LuKQVV52M4/5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325016376"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325016376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651232620"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="651232620"
Received: from jacton-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.195.171])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:34 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 03/12] cgroup: Add the DRM cgroup controller
Date: Thu, 12 Jan 2023 16:56:00 +0000
Message-Id: <20230112165609.1083270-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Skeleton controller without any functionality.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 include/linux/cgroup_drm.h    |  9 ++++++
 include/linux/cgroup_subsys.h |  4 +++
 init/Kconfig                  |  7 +++++
 kernel/cgroup/Makefile        |  1 +
 kernel/cgroup/drm.c           | 59 +++++++++++++++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
new file mode 100644
index 000000000000..bf8abc6b8ebf
--- /dev/null
+++ b/include/linux/cgroup_drm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _CGROUP_DRM_H
+#define _CGROUP_DRM_H
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
index 7e5c3ddc341d..c5ace0d57007 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1089,6 +1089,13 @@ config CGROUP_RDMA
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
index 000000000000..48a8d646a094
--- /dev/null
+++ b/kernel/cgroup/drm.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <linux/slab.h>
+#include <linux/cgroup.h>
+#include <linux/cgroup_drm.h>
+#include <linux/sched.h>
+
+struct drm_cgroup_state {
+	struct cgroup_subsys_state css;
+};
+
+struct drm_root_cgroup_state {
+	struct drm_cgroup_state drmcs;
+};
+
+static inline struct drm_cgroup_state *
+css_to_drmcs(struct cgroup_subsys_state *css)
+{
+	return container_of(css, struct drm_cgroup_state, css);
+}
+
+static struct drm_root_cgroup_state root_drmcs;
+
+static void drmcs_free(struct cgroup_subsys_state *css)
+{
+	if (css != &root_drmcs.drmcs.css)
+		kfree(css_to_drmcs(css));
+}
+
+static struct cgroup_subsys_state *
+drmcs_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct drm_cgroup_state *drmcs;
+
+	if (!parent_css) {
+		drmcs = &root_drmcs.drmcs;
+	} else {
+		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
+		if (!drmcs)
+			return ERR_PTR(-ENOMEM);
+	}
+
+	return &drmcs->css;
+}
+
+struct cftype files[] = {
+	{ } /* Zero entry terminates. */
+};
+
+struct cgroup_subsys drm_cgrp_subsys = {
+	.css_alloc	= drmcs_alloc,
+	.css_free	= drmcs_free,
+	.early_init	= false,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
-- 
2.34.1

