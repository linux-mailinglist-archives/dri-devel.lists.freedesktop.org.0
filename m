Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1361405020
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733006E878;
	Thu,  9 Sep 2021 12:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3C16E872;
 Thu,  9 Sep 2021 12:32:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208005409"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208005409"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="470057723"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Huang@freedesktop.org, Sean Z <sean.z.huang@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 06/17] drm/i915/pxp: set KCR reg init
Date: Thu,  9 Sep 2021 05:29:04 -0700
Message-Id: <20210909122915.971652-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
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

The setting is required by hardware to allow us doing further protection
operation such as sending commands to GPU or TEE. The register needs to
be re-programmed on resume, so for simplicitly we bundle the programming
with the component binding, which is automatically called on resume.

Further HW set-up operations will be added in the same location in
follow-up patches, so get ready for them by using a couple of
init/fini_hw wrappers instead of calling the KCR funcs directly.

v3: move programming to component binding function, rework commit msg

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c     | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h     |  3 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 400deaea2d8a..66a98feb33ab 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -7,6 +7,24 @@
 #include "gt/intel_context.h"
 #include "i915_drv.h"
 
+/* KCR register definitions */
+#define KCR_INIT _MMIO(0x320f0)
+
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+
+static void kcr_pxp_enable(struct intel_gt *gt)
+{
+	intel_uncore_write(gt->uncore, KCR_INIT,
+			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+}
+
+static void kcr_pxp_disable(struct intel_gt *gt)
+{
+	intel_uncore_write(gt->uncore, KCR_INIT,
+			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+}
+
 static int create_vcs_context(struct intel_pxp *pxp)
 {
 	static struct lock_class_key pxp_lock;
@@ -71,5 +89,14 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 	intel_pxp_tee_component_fini(pxp);
 
 	destroy_vcs_context(pxp);
+}
+
+void intel_pxp_init_hw(struct intel_pxp *pxp)
+{
+	kcr_pxp_enable(pxp_to_gt(pxp));
+}
 
+void intel_pxp_fini_hw(struct intel_pxp *pxp)
+{
+	kcr_pxp_disable(pxp_to_gt(pxp));
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index e87550fb9821..5427c3b28aa9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -22,6 +22,9 @@ static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_init(struct intel_pxp *pxp);
 void intel_pxp_fini(struct intel_pxp *pxp);
+
+void intel_pxp_init_hw(struct intel_pxp *pxp);
+void intel_pxp_fini_hw(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
 {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index f1d8de832653..0c0c7946e6a0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -33,6 +33,9 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
 
+	/* the component is required to fully start the PXP HW */
+	intel_pxp_init_hw(pxp);
+
 	return 0;
 }
 
@@ -41,6 +44,8 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 {
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
 
+	intel_pxp_fini_hw(pxp);
+
 	pxp->pxp_component = NULL;
 }
 
-- 
2.25.1

