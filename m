Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4A76D765
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307B10E575;
	Wed,  2 Aug 2023 19:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9010E574;
 Wed,  2 Aug 2023 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691003173; x=1722539173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXlLcds2yr8Kozo2pST3gmHdvN1EN7T9aa9BSWIe10M=;
 b=kSIOWejzFqA0oZS+26bU9V570Gtq5FF6+DnY50gEMoMy9onVCNAIa/op
 27sCT0wX0t4XVfmcbandeQXL5gamT+5DJUSC154Comk9EZjiSXSJP3UPv
 vJMQyZvcBiOhk2+rkio5wadT5Xxir5d7EQR1HRi+ETP6F6sKedncu5tZ5
 UnFQh4nwKqbvXzChdwpJ+udx11o8SM8epIyYu1/KR87nfkIlNTzcLBUem
 NTwUTjoCzF6Bv54ZIjJM+xrLLxeeNronjcZ1XtdpGosy/f2J1s/rGrqth
 RIh7HboNCAcFLm3eWEx8/N3jW/tKmkNBfJfUL1LsLwVOqC8m34PZfgTpM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369678870"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="369678870"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 12:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764318747"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="764318747"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 12:06:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm
 inside pm-complete
Date: Wed,  2 Aug 2023 12:06:11 -0700
Message-Id: <20230802190611.1639371-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the case of failed suspend flow or cases where the kernel does not go
into full suspend but goes from suspend_prepare back to resume_complete,
we get called for a pm_complete but without runtime_pm guaranteed.

Thus, ensure we take the runtime_pm when calling intel_pxp_init_hw
from within intel_pxp_resume_complete.

v2: resume_complete and runtime_resume should abstract a common
    helper with different wakeref requirements. (Daniele)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c | 18 +++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  5 +++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index 1a04067f61fc..6dfd24918953 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -34,8 +34,10 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
 	}
 }
 
-void intel_pxp_resume_complete(struct intel_pxp *pxp)
+static void _pxp_resume(struct intel_pxp *pxp, bool take_wakeref)
 {
+	intel_wakeref_t wakeref;
+
 	if (!intel_pxp_is_enabled(pxp))
 		return;
 
@@ -48,7 +50,21 @@ void intel_pxp_resume_complete(struct intel_pxp *pxp)
 	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
 		return;
 
+	if (take_wakeref)
+		wakeref = intel_runtime_pm_get(&pxp->ctrl_gt->i915->runtime_pm);
 	intel_pxp_init_hw(pxp);
+	if (take_wakeref)
+		intel_runtime_pm_put(&pxp->ctrl_gt->i915->runtime_pm, wakeref);
+}
+
+void intel_pxp_resume_complete(struct intel_pxp *pxp)
+{
+	_pxp_resume(pxp, true);
+}
+
+void intel_pxp_runtime_resume(struct intel_pxp *pxp)
+{
+	_pxp_resume(pxp, false);
 }
 
 void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
index 06b46f535b42..8695889b8380 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
@@ -13,6 +13,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
 void intel_pxp_suspend(struct intel_pxp *pxp);
 void intel_pxp_resume_complete(struct intel_pxp *pxp);
 void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
+void intel_pxp_runtime_resume(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
 {
@@ -29,9 +30,9 @@ static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
 static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
 {
 }
-#endif
+
 static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
 {
-	intel_pxp_resume_complete(pxp);
 }
+#endif
 #endif /* __INTEL_PXP_PM_H__ */

base-commit: d7a437067a2146e1035a5609dae08b9595773a16
-- 
2.39.0

