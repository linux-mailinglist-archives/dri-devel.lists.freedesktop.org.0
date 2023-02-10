Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E16915C1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 01:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A90810EC20;
	Fri, 10 Feb 2023 00:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33B110EC17;
 Fri, 10 Feb 2023 00:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675989732; x=1707525732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G1A+YUAyUG49plwDPHmNHe52CddmGUgSV6hCX04E4YE=;
 b=gz7II4jupt1DaHKf+EJD0mdtmalhFk3PexKdTftwkTzm6LYJOCwdxwVh
 W/nHapf6OYLU6LtM0qkVWSSx+sVbVNZ7EZPJkSAKc5LlSXQ0TZ1HT7TmZ
 lafdBlKZCLd8OLCDtAlVddVdY1y8pm11i9YP9MLd1LyoS/VXRS1OUUt2b
 M04hnuU/va3eHBHbaG9Vjpvy3rtYP7o7cgWZ6/EUKB/7BS24ogTXUceoN
 gB5gMhfffjYbdtTHPBFGh/CV7owBv0M3e0e3DrG7NuajssiU4xu7kbJu+
 FawZIOVOldrkEk0PYGAAgEemBp/M/gtXtXXTAZx0W7nizYim6nOf2jpFa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327990094"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="327990094"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 16:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913342481"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="913342481"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 16:42:11 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/8] drm/i915/pxp: Add GSC-CS back-end resource init and
 cleanup
Date: Thu,  9 Feb 2023 16:42:02 -0800
Message-Id: <20230210004209.1877143-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
References: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, the PXP back-end transport uses the GSC engine to submit
HECI packets through the HW to the GSC firmware for PXP arb
session management. This submission uses a non-priveleged
batch buffer, a buffer for the command packet and of course
a context targeting the GSC-CS.

Thus for MTL, we need to allocate and free a set of execution
submission resources for the management of the arbitration session.
Lets start with the context creation first since that object and
its usage is very straight-forward. We'll add the buffer allocation
and freeing later when we introduce the gsccs' send-message function.

Do this one time allocation of gsccs specific resources in
a new gsccs source file with intel_pxp_gsccs_init / fini functions
and hook them up from the PXP front-end.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/Makefile              |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 19 +++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 61 ++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 29 ++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  7 +++
 6 files changed, 113 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 918470a04591..ec2f7d4ed638 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -332,6 +332,7 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_debugfs.o \
+	pxp/intel_pxp_gsccs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
 	pxp/intel_pxp_session.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 9d4c7724e98e..560d94d23114 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 
 #include "intel_pxp.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
@@ -132,7 +133,10 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	if (ret)
 		return;
 
-	ret = intel_pxp_tee_component_init(pxp);
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		ret = intel_pxp_gsccs_init(pxp);
+	else
+		ret = intel_pxp_tee_component_init(pxp);
 	if (ret)
 		goto out_context;
 
@@ -165,9 +169,11 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
 	/*
 	 * For MTL onwards, PXP-controller-GT needs to have a valid GSC engine
 	 * on the media GT. NOTE: if we have a media-tile with a GSC-engine,
-	 * the VDBOX is already present so skip that check
+	 * the VDBOX is already present so skip that check. We also have to
+	 * ensure the GSC firmware is coming online
 	 */
-	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0))
+	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0) &&
+	    intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw))
 		return i915->media_gt;
 
 	/*
@@ -207,7 +213,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
 	if (!i915->pxp)
 		return -ENOMEM;
 
+	/* init common info used by all feature-mode usages*/
 	i915->pxp->ctrl_gt = gt;
+	mutex_init(&i915->pxp->tee_mutex);
 
 	/*
 	 * If full PXP feature is not available but HuC is loaded by GSC on pre-MTL
@@ -229,7 +237,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
 
 	i915->pxp->arb_is_valid = false;
 
-	intel_pxp_tee_component_fini(i915->pxp);
+	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
+		intel_pxp_gsccs_fini(i915->pxp);
+	else
+		intel_pxp_tee_component_fini(i915->pxp);
 
 	destroy_vcs_context(i915->pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
new file mode 100644
index 000000000000..13693e78b57e
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ */
+
+#include "gem/i915_gem_internal.h"
+
+#include "gt/intel_context.h"
+
+#include "i915_drv.h"
+#include "intel_pxp_cmd_interface_43.h"
+#include "intel_pxp_gsccs.h"
+#include "intel_pxp_types.h"
+
+static void
+gsccs_destroy_execution_resource(struct intel_pxp *pxp)
+{
+	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
+
+	if (strm_res->ce)
+		intel_context_put(strm_res->ce);
+
+	memset(strm_res, 0, sizeof(*strm_res));
+}
+
+static int
+gsccs_allocate_execution_resource(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp->ctrl_gt;
+	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
+	struct intel_engine_cs *engine = gt->engine[GSC0];
+	struct intel_context *ce;
+
+	/*
+	 * First, ensure the GSC engine is present.
+	 * NOTE: Backend would only be called with the correct gt.
+	 */
+	if (!engine)
+		return -ENODEV;
+
+	/* Finally, create an intel_context to be used during the submission */
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
+		return PTR_ERR(ce);
+	}
+
+	strm_res->ce = ce;
+
+	return 0;
+}
+
+void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
+{
+	gsccs_destroy_execution_resource(pxp);
+}
+
+int intel_pxp_gsccs_init(struct intel_pxp *pxp)
+{
+	return gsccs_allocate_execution_resource(pxp);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
new file mode 100644
index 000000000000..354ea9a8f940
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2022, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_GSCCS_H__
+#define __INTEL_PXP_GSCCS_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+#ifdef CONFIG_DRM_I915_PXP
+void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
+int intel_pxp_gsccs_init(struct intel_pxp *pxp);
+
+#else
+static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
+{
+}
+
+static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
+{
+	return 0;
+}
+
+#endif
+
+#endif /*__INTEL_PXP_GSCCS_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index d9d248b48093..b3b2e7216b84 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -253,8 +253,6 @@ int intel_pxp_tee_component_init(struct intel_pxp *pxp)
 	struct intel_gt *gt = pxp->ctrl_gt;
 	struct drm_i915_private *i915 = gt->i915;
 
-	mutex_init(&pxp->tee_mutex);
-
 	ret = alloc_streaming_command(pxp);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 007de49e1ea4..9924a4891315 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,13 @@ struct intel_pxp {
 	 */
 	struct intel_gt *ctrl_gt;
 
+	/**
+	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
+	 */
+	struct gsccs_session_resources {
+		struct intel_context *ce; /* context for gsc command submission */
+	} gsccs_res;
+
 	/**
 	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
 	 * module. Only set and cleared inside component bind/unbind functions,
-- 
2.39.0

