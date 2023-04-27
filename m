Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70506F0F4F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 01:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577DD10EC14;
	Thu, 27 Apr 2023 23:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130610E24B;
 Thu, 27 Apr 2023 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682639337; x=1714175337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9KPtggapAXLcsSCW1sWil685JrxBYePlSXLS/lgeiQ=;
 b=QJxWdIugYZBuPbG0nAdfJFSFXaOqn5AcQtzQ6go17cJ2yWO5k3/e8jrl
 25oQS56Im4C+WY7ZcEATjnUxq9+ia25t50jq8gs+WpCnVefYH6a4Y6USF
 wVkoqP//3YKaUi6Nta6c12BsbEOuSjFkNB1V6J6A5PqSKAqlxKiONHV77
 PThWbkcTOPHUDmbkkVz77JBvb4fvSoDbcefZV0kdfmtZdGZeFjJJMnAtP
 GVVQqZuUwz1g6q56MDqHGrt6WZgzZ3i2Tezrn7oRuJuQdLDkpBEV2mtIf
 Fj7SCoPt2bqBYXjpE/yOFVhmp0lxmFagxDqlVaHjDbXvBlG7scgVgQtm+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336634854"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="336634854"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 16:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="764051962"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="764051962"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 16:48:46 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Date: Thu, 27 Apr 2023 16:48:41 -0700
Message-Id: <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because of the additional firmware, component-driver and
initialization depedencies required on MTL platform before a
PXP context can be created, UMD calling for PXP creation as a
way to get-caps can take a long time. An actual real world
customer stack has seen this happen in the 4-to-8 second range
after the kernel starts (which sees MESA's init appear in the
middle of this range as the compositor comes up). To avoid
unncessary delays experienced by the UMD for get-caps purposes,
add a GET_PARAM for I915_PARAM_PXP_SUPPORT.

However, some failures can still occur after all the depedencies
are met (such as firmware init flow failure, bios configurations
or SOC fusing not allowing PXP enablement). Those scenarios will
only be known to user space when it attempts creating a PXP context
and is documented in the GEM UAPI headers.

While making this change, create a helper that is common to both
GET_PARAM caller and intel_pxp_start since the latter does
similiar checks.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c |  7 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 29 +++++++++++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp.h |  1 +
 include/uapi/drm/i915_drm.h          | 19 ++++++++++++++++++
 4 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 2238e096c957..6f11d7eaa91a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -5,6 +5,8 @@
 #include "gem/i915_gem_mman.h"
 #include "gt/intel_engine_user.h"
 
+#include "pxp/intel_pxp.h"
+
 #include "i915_cmd_parser.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
@@ -102,6 +104,11 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		if (value < 0)
 			return value;
 		break;
+	case I915_PARAM_PXP_STATUS:
+		value = intel_pxp_get_readiness_status(i915->pxp);
+		if (value < 0)
+			return value;
+		break;
 	case I915_PARAM_MMAP_GTT_VERSION:
 		/* Though we've started our numbering from 1, and so class all
 		 * earlier versions as 0, in effect their value is undefined as
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index b600d68de2a4..f143eadbc253 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -358,23 +358,38 @@ void intel_pxp_end(struct intel_pxp *pxp)
 }
 
 /*
- * the arb session is restarted from the irq work when we receive the
- * termination completion interrupt
+ * this helper is used by both intel_pxp_start and by
+ * the GET_PARAM IOCTL that user space calls. Thus, the
+ * return values here should match the UAPI spec.
  */
-int intel_pxp_start(struct intel_pxp *pxp)
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
 {
-	int ret = 0;
-
 	if (!intel_pxp_is_enabled(pxp))
 		return -ENODEV;
 
 	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
 		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
-			return -ENXIO;
+			return 2;
 	} else {
 		if (wait_for(pxp_component_bound(pxp), 250))
-			return -ENXIO;
+			return 2;
 	}
+	return 1;
+}
+
+/*
+ * the arb session is restarted from the irq work when we receive the
+ * termination completion interrupt
+ */
+int intel_pxp_start(struct intel_pxp *pxp)
+{
+	int ret = 0;
+
+	ret = intel_pxp_get_readiness_status(pxp);
+	if (ret < 0)
+		return ret;
+	else if (ret > 1)
+		return -EIO; /* per UAPI spec, user may retry later */
 
 	mutex_lock(&pxp->arb_mutex);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 3ded0890cd27..17e6dbc86b38 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -26,6 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
 
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
 int intel_pxp_start(struct intel_pxp *pxp);
 void intel_pxp_end(struct intel_pxp *pxp);
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index b15dd9cc2ffb..f4efbb2db0c5 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -771,6 +771,25 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
 
+/*
+ * Query the status of PXP support in i915.
+ *
+ * The query can fail in the following scenarios with the listed error codes:
+ *     -ENODEV = PXP support is not available on the GPU device or in the
+ *               kernel due to missing component drivers or kernel configs.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one of
+ * the following values:
+ *     1 = PXP feature is supported and is ready for use.
+ *     2 = PXP feature is supported but should be ready soon (pending
+ *         initialization of non-i915 system dependencies).
+ *
+ * NOTE: When param is supported (positive return values), user space should
+ *       still refer to the GEM PXP context-creation UAPI header specs to be
+ *       aware of possible failure due to system state machine at the time.
+ */
+#define I915_PARAM_PXP_STATUS		 58
+
 /* Must be kept compact -- no holes and well documented */
 
 /**
-- 
2.39.0

