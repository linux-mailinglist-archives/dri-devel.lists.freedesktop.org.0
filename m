Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5F6A511A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB1E10E5FA;
	Tue, 28 Feb 2023 02:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB910E47F;
 Tue, 28 Feb 2023 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677550913; x=1709086913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nh2xoytXCLLfIVQUr/Q2QBdllmyWJjnYdcp6SedCxX8=;
 b=YNtle5+i++50WC6BUd/53ZcJkKxtIvy/c8P3M7gLC15Bi1spd5rMJTuc
 hwHYW4JGwz880xP8eWBcCmZHOOzpn5IET3EAF05Uff9bcZ4R2i39Eqxv/
 OP7I0IlUDrqb1Mjhw98D5Sh7MeugiHtqhqUoOZ8jjvnGGEqScSagaSMsM
 Pdx6AZxno3VbrPpUxNvIl2c7YHXb43XSgtbguqwHFv7UTRTWkAIwKU5eU
 AaUExqC2/pVXXnO0059gXq5IZUi7KkrEG6EQqK2u2r7PP05kY2XD8CyAM
 qaCitJL0BVnQjuzTnPjnwPKCa6jcM9HDyozgYLni+pxIZ7aLV5px72ElU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334070737"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="334070737"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919601738"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="919601738"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 18:21:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 7/8] drm/i915/pxp: On MTL,
 KCR enabling doesn't wait on tee component
Date: Mon, 27 Feb 2023 18:21:49 -0800
Message-Id: <20230228022150.1657843-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
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

On legacy platforms, KCR HW enabling is done at the time the mei
component interface is bound. It's also disabled during unbind.
However, for MTL onwards, we don't depend on a tee component
to start sending GSC-CS firmware messages.

Thus, immediately enable (or disable) KCR HW on PXP's init,
fini and resume.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c    | 19 +++++++++++++++----
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  3 ++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 61041277be24..e2f2cc5f6a6e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -119,6 +119,7 @@ static void destroy_vcs_context(struct intel_pxp *pxp)
 static void pxp_init_full(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp->ctrl_gt;
+	intel_wakeref_t wakeref;
 	int ret;
 
 	/*
@@ -140,10 +141,15 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	if (ret)
 		return;
 
-	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
 		ret = intel_pxp_gsccs_init(pxp);
-	else
+		if (!ret) {
+			with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)
+				intel_pxp_init_hw(pxp);
+		}
+	} else {
 		ret = intel_pxp_tee_component_init(pxp);
+	}
 	if (ret)
 		goto out_context;
 
@@ -239,15 +245,20 @@ int intel_pxp_init(struct drm_i915_private *i915)
 
 void intel_pxp_fini(struct drm_i915_private *i915)
 {
+	intel_wakeref_t wakeref;
+
 	if (!i915->pxp)
 		return;
 
 	i915->pxp->arb_is_valid = false;
 
-	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0))
+	if (HAS_ENGINE(i915->pxp->ctrl_gt, GSC0)) {
+		with_intel_runtime_pm(&i915->pxp->ctrl_gt->i915->runtime_pm, wakeref)
+			intel_pxp_fini_hw(i915->pxp);
 		intel_pxp_gsccs_fini(i915->pxp);
-	else
+	} else {
 		intel_pxp_tee_component_fini(i915->pxp);
+	}
 
 	destroy_vcs_context(i915->pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index 4f836b317424..1a04067f61fc 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -43,8 +43,9 @@ void intel_pxp_resume_complete(struct intel_pxp *pxp)
 	 * The PXP component gets automatically unbound when we go into S3 and
 	 * re-bound after we come out, so in that scenario we can defer the
 	 * hw init to the bind call.
+	 * NOTE: GSC-CS backend doesn't rely on components.
 	 */
-	if (!pxp->pxp_component)
+	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
 		return;
 
 	intel_pxp_init_hw(pxp);
-- 
2.39.0

