Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C966890A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 02:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339410E979;
	Fri, 13 Jan 2023 01:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4210E971;
 Fri, 13 Jan 2023 01:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673572733; x=1705108733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8GdIhSQriGTOtBWIEXOEDy9Xggyv0+9Ofz23ziBHpIQ=;
 b=Z2dzEPiz8gmjl+1urr38+KWmWvEu4TFkiOWhtFrZ+jdA3w5S5ft9H0Da
 LqHGgx/YjGA35J9X82PHdP56NdJpQbtaPV4b/999Md+aIv0o0VODE6fHp
 uuSFJIuYcLgUHNdzOBQDTHX/6nTbzzAkRicXLWdS7hY7EsRUhF2XGxFOq
 A2AKiD+Pf3RakI0MZ6rN1M+VcjUpAIQTsT8mJSAp1D9w/lRBtP01JtxBU
 IvP08RhMxdrQhSHsvr4xorPZaS2vPWm6Pf2ktnEu95pOtnmp/QOcSejib
 GDkXXDUZaKX+bJzeex0wCvzeIDum6uw/F5JM2BLKPPCHs7kaG2K2RJPXe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323941590"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="323941590"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 17:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="746761040"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="746761040"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2023 17:18:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/i915/pxp: Pxp hw init should be in resume_complete
Date: Thu, 12 Jan 2023 17:18:50 -0800
Message-Id: <20230113011850.1463965-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
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
index c1e427ba57ae..4c68a3f26e96 100644
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
@@ -1563,6 +1568,16 @@ static int i915_pm_resume(struct device *kdev)
 	return i915_drm_resume(&i915->drm);
 }
 
+static void i915_pm_complete(struct device *kdev)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(kdev);
+
+	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
+		return;
+
+	i915_drm_complete(&i915->drm);
+}
+
 /* freeze: before creating the hibernation_image */
 static int i915_pm_freeze(struct device *kdev)
 {
@@ -1783,6 +1798,7 @@ const struct dev_pm_ops i915_pm_ops = {
 	.suspend_late = i915_pm_suspend_late,
 	.resume_early = i915_pm_resume_early,
 	.resume = i915_pm_resume,
+	.complete = i915_pm_complete,
 
 	/*
 	 * S4 event handlers
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

