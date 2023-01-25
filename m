Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A567AB4A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6510E739;
	Wed, 25 Jan 2023 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60910E739;
 Wed, 25 Jan 2023 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674634015; x=1706170015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eADo523zkyo79rzK04u4NgQD7R/j65oJe78ncrIQnvo=;
 b=hsPQXQ3grKb/HHKgOB3B4kra5srcHWW7eaHxtBDpP1gWhqCewB8d++Q8
 sKWkcyIFyjDPrHguF1MM/0vqR9UEjWDfBakvkJwKyzkQWxlJ1TqV8cdUr
 o2NSZI2ShsE1u3yuY/UNf4q9t88s/RvFvsH0hVbGPRZw90YTNExOGT3aM
 kBGbc+bptQyb5M2pZCI5LffNwDpCrNdO0XRtMzPA7BpGusncCRTlVWkNZ
 ZwO6ZO4KACk82644bEAJbffyvtm4w0HlughRNEO8K044cfdEN262U6eDt
 RoLRbLRJeZurOXRvv3BpAEjdpkfwXsxBzYkSefhbf+RB0T4OCAglGozeT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310079364"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310079364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991180673"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="991180673"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 00:06:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/8] drm/i915/pxp: Add GSC-CS back-end resource init and
 cleanup
Date: Wed, 25 Jan 2023 00:06:44 -0800
Message-Id: <20230125080651.100223-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
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
---
 drivers/gpu/drm/i915/Makefile              |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 17 ++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 65 ++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 29 ++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  8 +++
 5 files changed, 116 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 2184bc5b2be7..5fcbc049ebb3 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -331,6 +331,7 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_debugfs.o \
+	pxp/intel_pxp_gsccs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
 	pxp/intel_pxp_session.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index cfc9af8b3d21..22280408156e 100644
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
@@ -229,7 +235,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
 
 	i915->pxp->arb_is_valid = false;
 
-	intel_pxp_tee_component_fini(i915->pxp);
+	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
+		intel_pxp_gsccs_fini(i915->pxp);
+	else
+		intel_pxp_tee_component_fini(i915->pxp);
 
 	destroy_vcs_context(i915->pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
new file mode 100644
index 000000000000..b304864902c8
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -0,0 +1,65 @@
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
+	mutex_init(&pxp->tee_mutex);
+
+	/* Finally, create an intel_context to be used during the submission */
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
+		return PTR_ERR(ce);
+	}
+	i915_vm_put(ce->vm);
+	ce->vm = i915_vm_get(pxp->ctrl_gt->vm);
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
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7dc5f08d1583..326bd8414407 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,14 @@ struct intel_pxp {
 	 */
 	struct intel_gt *ctrl_gt;
 
+	/**
+	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
+	 */
+	struct gsccs_session_resources {
+		u64 host_session_handle; /* used by firmware to link commands to sessions */
+		struct intel_context *ce; /* context for gsc command submission */
+	} gsccs_res;
+
 	/**
 	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
 	 * module. Only set and cleared inside component bind/unbind functions,
-- 
2.39.0

