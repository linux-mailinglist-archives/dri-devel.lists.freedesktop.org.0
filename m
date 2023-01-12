Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726BE6667DE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C027010E848;
	Thu, 12 Jan 2023 00:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8710E840;
 Thu, 12 Jan 2023 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673483837; x=1705019837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=03m4eo5WB+EzMhrE7x1UMNPHa77OJ7bPzpLExLpJ+yE=;
 b=Tyt+LT0DEu0FVcTE4PK+6FP/CiGqkK0jMuQ9KK70r7i6mId75XcYFVtR
 LASW7xD1rur0Gbwr1NxLCnUAmjFiRoOSAEEZntVrpXoEbBEMDOIMKPDHu
 k2LXtnoElsaUYEmZPNUl0UygfPtXht2X358v28kIExilwxs4yMo6hjZz/
 1NHPGB+4W+2IevA8cJGrkXdihbVEibfwSdg0WJFSnTtH30TkdO7lsH2dk
 t1T8mURJ5FREpT23CWZVHwL4tjSy3iPNakauj9ZsPcXP26vFsnDJ4YHXB
 RFYjB2Rq2j8PFdy7qn+T2vNL5AFEADeGs9pF4AYq/IjNx/WfmA4bkcD8l Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303271500"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303271500"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 16:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635179915"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635179915"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 16:37:16 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/i915/pxp: Pxp hw init should be in resume_complete
Date: Wed, 11 Jan 2023 16:37:06 -0800
Message-Id: <20230112003706.950931-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
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
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During suspend flow, i915 currently achors' on the pm_suspend_prepare
callback as the location where we quiesce the entire GPU and perform
all necessary cleanup in order to go into suspend. PXP is also called
during this time to perform the arbitration session teardown (with
the assurance no additional GEM IOCTLs will come after that could
restart the session).

However, if other devices or drivers fail their suspend_prepare, the
system will not go into suspend and i915 will be expected to resume
operation. In this case, we need to re-initialize the PXP hardware
and this really should be done within the pm_resume_complete callback
which is the correct opposing function in the resume sequence to
match pm_suspend_prepare of the suspend sequence.

Because this callback is the last thing at the end of resuming
we expect little to no impact to the rest of the i915 resume sequence
with this change.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.h   |  1 +
 drivers/gpu/drm/i915/i915_driver.c      | 20 ++++++++++++++++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  6 +++---
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 6c9a46452364..fd1a23621222 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -77,6 +77,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
 
 void intel_gt_suspend_prepare(struct intel_gt *gt);
 void intel_gt_suspend_late(struct intel_gt *gt);
+
 int intel_gt_resume(struct intel_gt *gt);
 
 void intel_gt_runtime_suspend(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c1e427ba57ae..c3e7c40daaeb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1170,6 +1170,13 @@ static bool suspend_to_idle(struct drm_i915_private *dev_priv)
 	return false;
 }
 
+static void i915_drm_complete(struct drm_device *dev)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+
+	intel_pxp_resume_complete(i915->pxp);
+}
+
 static int i915_drm_prepare(struct drm_device *dev)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
@@ -1370,8 +1377,6 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	i915_gem_resume(dev_priv);
 
-	intel_pxp_resume(dev_priv->pxp);
-
 	intel_modeset_init_hw(dev_priv);
 	intel_init_clock_gating(dev_priv);
 	intel_hpd_init(dev_priv);
@@ -1484,6 +1489,16 @@ int i915_driver_resume_switcheroo(struct drm_i915_private *i915)
 	return i915_drm_resume(&i915->drm);
 }
 
+static void i915_pm_complete(struct device *kdev)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(kdev);
+
+	if (!i915)
+		dev_err(kdev, "DRM not initialized, aborting suspend.\n");
+
+	i915_drm_complete(&i915->drm);
+}
+
 static int i915_pm_prepare(struct device *kdev)
 {
 	struct drm_i915_private *i915 = kdev_to_i915(kdev);
@@ -1779,6 +1794,7 @@ const struct dev_pm_ops i915_pm_ops = {
 	 * PMSG_RESUME]
 	 */
 	.prepare = i915_pm_prepare,
+	.complete = i915_pm_complete,
 	.suspend = i915_pm_suspend,
 	.suspend_late = i915_pm_suspend_late,
 	.resume_early = i915_pm_resume_early,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index e427464aa131..4f836b317424 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -34,7 +34,7 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
 	}
 }
 
-void intel_pxp_resume(struct intel_pxp *pxp)
+void intel_pxp_resume_complete(struct intel_pxp *pxp)
 {
 	if (!intel_pxp_is_enabled(pxp))
 		return;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
index 586be769104f..06b46f535b42 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
@@ -11,7 +11,7 @@ struct intel_pxp;
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
 void intel_pxp_suspend(struct intel_pxp *pxp);
-void intel_pxp_resume(struct intel_pxp *pxp);
+void intel_pxp_resume_complete(struct intel_pxp *pxp);
 void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
@@ -22,7 +22,7 @@ static inline void intel_pxp_suspend(struct intel_pxp *pxp)
 {
 }
 
-static inline void intel_pxp_resume(struct intel_pxp *pxp)
+static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
 {
 }
 
@@ -32,6 +32,6 @@ static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
 #endif
 static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
 {
-	intel_pxp_resume(pxp);
+	intel_pxp_resume_complete(pxp);
 }
 #endif /* __INTEL_PXP_PM_H__ */
-- 
2.39.0

