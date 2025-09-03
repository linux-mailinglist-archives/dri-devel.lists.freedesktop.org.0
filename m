Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F2AB42528
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E317E10E8EE;
	Wed,  3 Sep 2025 15:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jgprmKA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A156910E8BB;
 Wed,  3 Sep 2025 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55BB2llQEXofSNUg7BS61EGnBIFUC2JGyZpY0uhw5bg=; b=jgprmKA2XRMym7yKEnKrh+k6gS
 gEnsEVB1oyvHgcwtCGsnk2zx7UE8O/BCIKYWdvxh9CB5Dwpws5fVaOwUKsNrAIukOvMW7Cg6P+MO0
 Aah1YRp6qtPYSgtF38CNVfXUp6S32boYnbrMcEwCkQpmZ1kcco1EPrC5Hej7bi6h1guuQ8LSXf710
 87sZTpwYvLTUXMs0SGEknFrzwpBsysnJ79HAoST6ps8KvhkUFOvFCzXYGQQkK1Mt8wn2fYh11vzOf
 EW/pom1b3wxNUwJ2S6Kud8MZ4vbcvAAvHPfQn5L3TwaajutXdK2ibPdxWKyvpq2x8WVaXOrmrF28Q
 EDa4AR1Q==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKm-006GaB-P4; Wed, 03 Sep 2025 17:23:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 13/21] cgroup: Add the DRM cgroup controller
Date: Wed,  3 Sep 2025 16:23:19 +0100
Message-ID: <20250903152327.66002-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Skeleton controller without any functionality.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 include/linux/cgroup_drm.h    |  7 +++++
 include/linux/cgroup_subsys.h |  4 +++
 init/Kconfig                  |  5 +++
 kernel/cgroup/Makefile        |  1 +
 kernel/cgroup/drm.c           | 58 +++++++++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
new file mode 100644
index 000000000000..3e51fe517791
--- /dev/null
+++ b/include/linux/cgroup_drm.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025 Valve Corporation */
+
+#ifndef _CGROUP_DRM_H
+#define _CGROUP_DRM_H
+
+#endif	/* _CGROUP_DRM_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index 3fd0bcbf3080..2ad172c9fba2 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -69,6 +69,10 @@ SUBSYS(misc)
 SUBSYS(dmem)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+SUBSYS(drm)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/init/Kconfig b/init/Kconfig
index d811cad02a75..5ef9494f0866 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1200,6 +1200,11 @@ config CGROUP_DMEM
 	  As an example, it allows you to restrict VRAM usage for applications
 	  in the DRM subsystem.
 
+config CGROUP_DRM
+	bool "DRM controller"
+	help
+	  Provides the DRM subsystem controller.
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index ede31601a363..c39799312cfd 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CPUSETS_V1) += cpuset-v1.o
 obj-$(CONFIG_CGROUP_MISC) += misc.o
 obj-$(CONFIG_CGROUP_DMEM) += dmem.o
+obj-$(CONFIG_CGROUP_DRM) += drm.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
new file mode 100644
index 000000000000..55947a009e04
--- /dev/null
+++ b/kernel/cgroup/drm.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Valve Corporation */
+
+#include <linux/cgroup.h>
+#include <linux/cgroup_drm.h>
+#include <linux/slab.h>
+
+struct drm_cgroup_state {
+	struct cgroup_subsys_state css;
+};
+
+struct drm_root_cgroup_state {
+	struct drm_cgroup_state drmcs;
+};
+
+static struct drm_root_cgroup_state root_drmcs;
+
+static inline struct drm_cgroup_state *
+css_to_drmcs(struct cgroup_subsys_state *css)
+{
+	return container_of(css, struct drm_cgroup_state, css);
+}
+
+static void drmcs_free(struct cgroup_subsys_state *css)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+
+	if (drmcs != &root_drmcs.drmcs)
+		kfree(drmcs);
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
2.48.0

