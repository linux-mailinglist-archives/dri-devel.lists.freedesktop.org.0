Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785973D1378
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BA86EB9A;
	Wed, 21 Jul 2021 16:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DEB6EB6B;
 Wed, 21 Jul 2021 16:12:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297028242"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297028242"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564786987"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:12:20 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] drm/i915/guc/slpc: Allocate, initialize and release SLPC
Date: Wed, 21 Jul 2021 09:11:11 -0700
Message-Id: <20210721161120.24610-6-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate data structures for SLPC and functions for
initializing on host side.

v2: Address review comments (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 11 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 36 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index fcccb103a21a..686cb978662d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -337,6 +337,12 @@ int intel_guc_init(struct intel_guc *guc)
 			goto err_ct;
 	}
 
+	if (intel_guc_slpc_is_used(guc)) {
+		ret = intel_guc_slpc_init(&guc->slpc);
+		if (ret)
+			goto err_submission;
+	}
+
 	/* now that everything is perma-pinned, initialize the parameters */
 	guc_init_params(guc);
 
@@ -347,6 +353,8 @@ int intel_guc_init(struct intel_guc *guc)
 
 	return 0;
 
+err_submission:
+	intel_guc_submission_fini(guc);
 err_ct:
 	intel_guc_ct_fini(&guc->ct);
 err_ads:
@@ -369,6 +377,9 @@ void intel_guc_fini(struct intel_guc *guc)
 
 	i915_ggtt_disable_guc(gt->ggtt);
 
+	if (intel_guc_slpc_is_used(guc))
+		intel_guc_slpc_fini(&guc->slpc);
+
 	if (intel_guc_submission_is_used(guc))
 		intel_guc_submission_fini(guc);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index d9feb430ce35..a99d727b5bf0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -12,6 +12,16 @@ static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
 	return container_of(slpc, struct intel_guc, slpc);
 }
 
+static inline struct intel_gt *slpc_to_gt(struct intel_guc_slpc *slpc)
+{
+	return guc_to_gt(slpc_to_guc(slpc));
+}
+
+static inline struct drm_i915_private *slpc_to_i915(struct intel_guc_slpc *slpc)
+{
+	return (slpc_to_gt(slpc))->i915;
+}
+
 static bool __detect_slpc_supported(struct intel_guc *guc)
 {
 	/* GuC SLPC is unavailable for pre-Gen12 */
@@ -35,9 +45,29 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
 	guc->slpc_selected = __guc_slpc_selected(guc);
 }
 
+static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	int err;
+
+	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
+	if (unlikely(err)) {
+		drm_err(&i915->drm,
+			"Failed to allocate SLPC struct (err=%pe)\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	return err;
+}
+
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
-	return 0;
+	GEM_BUG_ON(slpc->vma);
+
+	return slpc_shared_data_init(slpc);
 }
 
 /*
@@ -60,4 +90,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
 {
+	if (!slpc->vma)
+		return;
+
+	i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index c3b0ad7f0f93..f02249ff5f1b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -8,6 +8,7 @@
 
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc_types.h"
+#include "abi/guc_actions_slpc_abi.h"
 
 static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index b85148265b1f..214a449e78f2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -7,9 +7,12 @@
 #define _INTEL_GUC_SLPC_TYPES_H_
 
 #include <linux/types.h>
+#include "abi/guc_actions_slpc_abi.h"
 
 struct intel_guc_slpc {
 
+	struct i915_vma *vma;
+	struct slpc_shared_data *vaddr;
 };
 
 #endif
-- 
2.25.0

