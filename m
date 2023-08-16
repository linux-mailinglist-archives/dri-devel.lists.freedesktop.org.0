Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8F77EDB6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 01:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38DB10E3E1;
	Wed, 16 Aug 2023 23:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CFC10E3E1;
 Wed, 16 Aug 2023 23:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692227612; x=1723763612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N/wUSTibpib/sZ7tur2lVxvuLYbqrjI3hjmtdSbz+vM=;
 b=OOFjzAQt8omhdtEgfMwXPBjO+mBgKD5s2kw1Xhn/wy709aRgDrYtLsJa
 jCCFUYk2O54nVyHYdEfO226fGuKkUO+WmaKChWFKaa1GHgdJIK7iYEOy3
 8y8R4CszwZBGND56Q6rFsiDyMdIQIdARvHaBWSCQmg7Ro3gvdgonfUVb6
 u0Pv3ZBXzfu2FitUrr+mrvBl3DsM+tehLkTvRz+8YqRLW9NsWIrTvvJD0
 80cLYSNJR04Yr5zcoGIza/PxkdrpPIP0eegGvEJWfK6NbbOR7KIVr1dzZ
 /pYgU5i7qwL3tAhC603wJpMHh2U/ATx+W+ZeQx9mKUq48DWSWVyPGZgNi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371559455"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="371559455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 16:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734413931"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="734413931"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 16:13:31 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/huc: silence injected failure in the load via GSC
 path
Date: Wed, 16 Aug 2023 16:13:20 -0700
Message-ID: <20230816231320.1555190-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
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
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we can't load the HuC due to an injected failure, we don't want
to throw and error and trip CI. Using the gt_probe_error macro for
logging ensure that the error is only printed if it wasn't explicitly
injected.

v2: keep the line to less than 100 characters (checkpatch).

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7061
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> #v1
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index f89a1f80f50e..bb58fa9579b8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -9,6 +9,7 @@
 #include <drm/i915_component.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gt/intel_gt_print.h"
 
 #include "i915_drv.h"
 #include "gt/intel_gt.h"
@@ -156,7 +157,8 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 {
 	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 	struct intel_pxp *pxp = i915->pxp;
-	struct intel_uc *uc = &pxp->ctrl_gt->uc;
+	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_uc *uc = &gt->uc;
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
@@ -176,7 +178,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 			/* load huc via pxp */
 			ret = intel_huc_fw_load_and_auth_via_gsc(&uc->huc);
 			if (ret < 0)
-				drm_err(&i915->drm, "failed to load huc via gsc %d\n", ret);
+				gt_probe_error(gt, "failed to load huc via gsc %d\n", ret);
 		}
 	}
 
-- 
2.41.0

