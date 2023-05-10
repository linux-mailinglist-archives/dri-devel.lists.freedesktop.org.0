Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D506FE371
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 19:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8170F10E4EE;
	Wed, 10 May 2023 17:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D20510E4DF;
 Wed, 10 May 2023 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683740754; x=1715276754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SFcL0erINhukxTNL7GDSlNQ2j7cyUWzmStSlrDvxB0=;
 b=MccWYejN+xq3XfYtxpVrBtNFRbM5Ki5gEiQ8xlJTRdrlnbH3zw3ovC7N
 2WonpY6YiXGGo9EBvce8XcY5mhRo7zYMMXU7xMGpzXMkvgX4YOrjI55PV
 aycIH8eyfTISvNYqxxSlMhi7rxBuNVqfVKwojSyRU/i3z2Tfo9j1nCLtV
 Drs5BnmiiHrtvDsJl5yZMR/eVTeGtQFNUDSXqq5NvQejlqaqk4oVOhNAU
 sdyZgEg0ZNZB4PHT1pccjF91XQ6Lf8szJLJi72GxESrXUil0zFmhY2oto
 Wb0L5Qx20CE44nYeLPUq2qquB8vesas+q71QavC9MVB2REPUgIIUEu+Aq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353352063"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="353352063"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 10:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="945791930"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="945791930"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 10:45:52 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 7/8] drm/i915/pxp: On MTL,
 KCR enabling doesn't wait on tee component
Date: Wed, 10 May 2023 10:45:49 -0700
Message-Id: <20230510174550.986965-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230510174550.986965-1-alan.previn.teres.alexis@intel.com>
References: <20230510174550.986965-1-alan.previn.teres.alexis@intel.com>
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

On legacy platforms, KCR HW enabling is done at the time the mei
component interface is bound. It's also disabled during unbind.
However, for MTL onwards, we don't depend on a tee component
to start sending GSC-CS firmware messages.

Thus, immediately enable (or disable) KCR HW on PXP's init,
fini and resume.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 15 ++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c    |  3 ++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 4bc276daca16..8dc41de3f6f7 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -10,6 +10,7 @@
 #include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
 
 #include "i915_drv.h"
+#include "intel_pxp.h"
 #include "intel_pxp_cmd_interface_42.h"
 #include "intel_pxp_cmd_interface_43.h"
 #include "intel_pxp_gsccs.h"
@@ -422,10 +423,22 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
 
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
 {
+	intel_wakeref_t wakeref;
+
 	gsccs_destroy_execution_resource(pxp);
+	with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)
+		intel_pxp_fini_hw(pxp);
 }
 
 int intel_pxp_gsccs_init(struct intel_pxp *pxp)
 {
-	return gsccs_allocate_execution_resource(pxp);
+	int ret;
+	intel_wakeref_t wakeref;
+
+	ret = gsccs_allocate_execution_resource(pxp);
+	if (!ret) {
+		with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref)
+			intel_pxp_init_hw(pxp);
+	}
+	return ret;
 }
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

