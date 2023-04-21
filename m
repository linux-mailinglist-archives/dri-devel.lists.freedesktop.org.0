Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E06EA332
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 07:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265FD10EDA0;
	Fri, 21 Apr 2023 05:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275D710E28F;
 Fri, 21 Apr 2023 05:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682055256; x=1713591256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SFcL0erINhukxTNL7GDSlNQ2j7cyUWzmStSlrDvxB0=;
 b=cdMUXEIdNTTiMw4eSDOlm5UPMY11e4KWOim/u8x10JnMR+GPt6hSt3CG
 rEI4Pd1Q7oA+dei5KUCe04l9cEZ7mVRWUsGyW+n8/AK3YcUV5KGSes4Jv
 dpPuDEpcpo/k6TGjEvya2lL8vcV/qGhd4o2YaEbfqa5gzpkPXyKwFH0vA
 lHbUhSXFd5xdwUTNzWbvK84GqWAYDUp9Tf3JgPBueS5QeD26DmsvaI77g
 C8BiZVL9SDhJwWJDrBLR7j93ZXdS28R/jbSG/kC7u4d7oCsIHRPelyrGD
 BwjwO9smKMU2BWv9yFOpAN/5h3tnQAJ4y4rSl4ei/9LJLWrbbkVXEleTG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411186943"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="411186943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 22:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669612116"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669612116"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 22:34:15 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 7/8] drm/i915/pxp: On MTL,
 KCR enabling doesn't wait on tee component
Date: Thu, 20 Apr 2023 22:34:08 -0700
Message-Id: <20230421053410.1836241-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
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

