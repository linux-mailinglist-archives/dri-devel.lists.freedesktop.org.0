Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D16D9F1B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE36710EC93;
	Thu,  6 Apr 2023 17:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B699E10EC7F;
 Thu,  6 Apr 2023 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803069; x=1712339069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SFcL0erINhukxTNL7GDSlNQ2j7cyUWzmStSlrDvxB0=;
 b=UQNe4B1nGc6kautp1UfmVEJiQBNdLVu6uBFDayY9oxQ20iTTpKKsSchu
 1gCEt/wJad2iopmLsbMaGImWePPfjKKo+y0BSjq0yig9SKqqNuwyDnkiH
 f7RTGzm1dAzNgeaz0kZRQlhRCTsJALeZt39m/p/TAQHGbDHfphahK20Ua
 88sKZYRlkxb+3SEnJXsz95Ab/B7Kf6wZ4xOlT6KRmaDjkTdseJr1U6jfe
 t3QXv97Fo2aka8KhNsUyO0QFASpQcf7G5ytt7swCf2lnH4E4kGcuBZZGt
 luPaCnU5sSUweSHqxjggChoIIs3q5TbPlIFW+GARzvukXe2tBgzeisuIt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345432467"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345432467"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680757366"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680757366"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 10:44:29 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 7/8] drm/i915/pxp: On MTL,
 KCR enabling doesn't wait on tee component
Date: Thu,  6 Apr 2023 10:44:18 -0700
Message-Id: <20230406174419.471256-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

