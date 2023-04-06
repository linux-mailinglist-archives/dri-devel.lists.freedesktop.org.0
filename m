Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1596D9F19
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4467610EC95;
	Thu,  6 Apr 2023 17:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB9F10E0F6;
 Thu,  6 Apr 2023 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803067; x=1712339067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlNsTj03vzW7Z9ZUpTpU9hrom3Mw85KbRJJInT+yRvk=;
 b=GCf/LlxYn2CbthPLqhmhTuSgsW0BpjYcRs8oZEAVs7L4Gow3LUYWzAm0
 WvAVWbizsXwGBtV28Ie/j6+DA/tlej70yB8Ode67QfAOZaGCkvkWmoufg
 sfSS4RbgH/YlIvJkZMFypeMG5xpizTK26waJ9DkBt251YnP1b+jBljilK
 1rfqEiRU3JbwSBGPB2N+ZJXYL6vSDMmK0PkB4bIPItEit0ghki8u6BRMP
 sgRXUPRE6FJlt7ZpnjD+Z/WMwTSQLH8AgFjpt85pM7nKi+d/Y4IqgJWG0
 eND721hQlBUgKqos+U2gDzIPmASU7cMOnZxOM86H6qFIXWR7sdpkwY6Kv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345432445"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345432445"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680757340"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680757340"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 10:44:26 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/8] drm/i915/pxp: Add GSC-CS back-end resource init and
 cleanup
Date: Thu,  6 Apr 2023 10:44:12 -0700
Message-Id: <20230406174419.471256-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 20 +++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 63 ++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 29 ++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  8 +++
 6 files changed, 117 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 97b0d4ae221a..5df177f9afd1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -338,6 +338,7 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_debugfs.o \
+	pxp/intel_pxp_gsccs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
 	pxp/intel_pxp_session.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 9d4c7724e98e..f93aa171aa1e 100644
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
 
@@ -165,9 +169,12 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
 	/*
 	 * For MTL onwards, PXP-controller-GT needs to have a valid GSC engine
 	 * on the media GT. NOTE: if we have a media-tile with a GSC-engine,
-	 * the VDBOX is already present so skip that check
+	 * the VDBOX is already present so skip that check. We also have to
+	 * ensure the GSC and HUC firmware are coming online
 	 */
-	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0))
+	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0) &&
+	    intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw) &&
+	    intel_uc_fw_is_loadable(&i915->media_gt->uc.huc.fw))
 		return i915->media_gt;
 
 	/*
@@ -207,7 +214,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
 	if (!i915->pxp)
 		return -ENOMEM;
 
+	/* init common info used by all feature-mode usages*/
 	i915->pxp->ctrl_gt = gt;
+	mutex_init(&i915->pxp->tee_mutex);
 
 	/*
 	 * If full PXP feature is not available but HuC is loaded by GSC on pre-MTL
@@ -229,7 +238,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
 
 	i915->pxp->arb_is_valid = false;
 
-	intel_pxp_tee_component_fini(i915->pxp);
+	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
+		intel_pxp_gsccs_fini(i915->pxp);
+	else
+		intel_pxp_tee_component_fini(i915->pxp);
 
 	destroy_vcs_context(i915->pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
new file mode 100644
index 000000000000..bad55719a7ac
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -0,0 +1,63 @@
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
+	struct gsccs_session_resources *exec_res = &pxp->gsccs_res;
+
+	if (exec_res->ce)
+		intel_context_put(exec_res->ce);
+
+	memset(exec_res, 0, sizeof(*exec_res));
+}
+
+static int
+gsccs_allocate_execution_resource(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp->ctrl_gt;
+	struct gsccs_session_resources *exec_res = &pxp->gsccs_res;
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
+	i915_vm_put(ce->vm);
+	ce->vm = i915_vm_get(pxp->ctrl_gt->vm);
+	exec_res->ce = ce;
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
index a2846b1dbbee..1ce07d7e8769 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -284,8 +284,6 @@ int intel_pxp_tee_component_init(struct intel_pxp *pxp)
 	struct intel_gt *gt = pxp->ctrl_gt;
 	struct drm_i915_private *i915 = gt->i915;
 
-	mutex_init(&pxp->tee_mutex);
-
 	ret = alloc_streaming_command(pxp);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 007de49e1ea4..1e01036d0455 100644
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

