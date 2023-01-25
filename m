Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4967AB58
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6E10E748;
	Wed, 25 Jan 2023 08:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443C10E044;
 Wed, 25 Jan 2023 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674634015; x=1706170015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmu7SRa3OZF7p/UqYSXIqjv1kxZ8TfYVws5kKCZVdCk=;
 b=QOsK3EbhSstjFt3O192d33GFa+ZZN7GooNMfBOZ37svX2nmxVpatiMkU
 8RIho849x45tObedbDP7GZ+2n1tGSBJlY9KLObRr9ZR2CLau9iqvoG0bz
 T9rgNH9IE492a9a+vpnoND/NiRV7+0ZiBowY+lnmWOEoifa4IPkiSH5Xr
 A5+RFv8+G1VaXYAfjYuzSViEI9yQPwe7tBsxPkjLscOHBOEv0GIfCO5v3
 OV8xUL1+t/fsd6zrHJOcZEOUg68Vf8m9d4w1HKmnRnd8nxuvAKUdOkiYM
 5hXJeMdFlTdrE9L2WZ/3JPfIxGrlSb4pX4HCCE7JzJfpNKu6nu4K9MCg8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310079375"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310079375"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991180691"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="991180691"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 00:06:54 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/i915/pxp: On MTL,
 KCR enabling doesn't wait on tee component
Date: Wed, 25 Jan 2023 00:06:50 -0800
Message-Id: <20230125080651.100223-8-alan.previn.teres.alexis@intel.com>
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
index 9b56f743eac9..87a5f566aab3 100644
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
 
@@ -237,15 +243,20 @@ int intel_pxp_init(struct drm_i915_private *i915)
 
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
index 892d39cc61c1..b4f28d62a90e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -43,8 +43,9 @@ void intel_pxp_resume(struct intel_pxp *pxp)
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

