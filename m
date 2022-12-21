Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26D653994
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D6410E4E1;
	Wed, 21 Dec 2022 23:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D623B10E135;
 Wed, 21 Dec 2022 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663822; x=1703199822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibBiAWxaB+tfTYd5FgL5WPS+yPyE0Fb8k+U9y/QQ3Co=;
 b=Wz6c16mdy7tTzF1Up2UUziO0xjKJ900iEHgo+nNrKbysp1m8YLJyVssu
 hdvHE/0f2DPRPM+yfYDFm0kgS6aVw1VbqnvqLVOMaI5iNfnefBHRG2hJ1
 WHXIobZXJbm6AI9Gocx/xG7m5+BvYa+50buBQsAVwAr+fkbLqYceopmg2
 ipeMank4umrO21ckL2HC4ryzw7MRUvTcby27c06PzD51pZ3Gsn61E8wVR
 9gck3wJfCFixRbcqCFgjUQwKrBo/LrDylgdoETPlc84kYrggZPuwkT3s6
 5Bocp0onKfda5BqOpOeFhxBIG17nhkNFgxrzZZXaTlzibG1XY4fvKDUKI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905553"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864450"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864450"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:42 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915/pxp: Pxp hw init should be in resume_complete
Date: Wed, 21 Dec 2022 15:06:27 -0800
Message-Id: <20221221230628.2715916-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
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
2.34.1

