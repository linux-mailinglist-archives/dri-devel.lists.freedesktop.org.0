Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795E6A2519
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 00:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7F10E036;
	Fri, 24 Feb 2023 23:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859D310E036;
 Fri, 24 Feb 2023 23:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677281514; x=1708817514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zjQBJDy3OHOEi+gieddTtIlTyViuk+XSfUmm+aI53Rw=;
 b=MOKLJ62Z7GRWp/gtbd4AlZzr3A5tpu84Wl2lhEkEcxZfSd13t7DO+yxQ
 OVxqlgjOH4SRIuzZxNbAVQONhdVxDuDmqcTCpuQJPPn2lA//mEpWwAslG
 8BVp7CYRR+Amksi5ptcsqQgkMyF9LLiLN8bqX5RR+rr0xydwDO/j+G5H6
 0P8FkqKDC2HEzb8cNdIkz2vcCS+RSxlZmFH9dBB+bomV5jZt/1uV3evIC
 vi8kgwmmqRBfBmxZU9U38OAzhWPEdDtHbLLT1WWShwh50xnZhmzFKxYIL
 WBquYc9mL2KIB7J6UKxWbj3VJaNRKYm5iUToMVqbZu+Qw4V/XseSFIVmI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321803491"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="321803491"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 15:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705446116"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="705446116"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 15:31:53 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Set wedged if enable guc communication failed
Date: Fri, 24 Feb 2023 15:17:24 -0800
Message-Id: <20230224231724.769343-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add err code check for enable_communication on resume path, set wedged if failed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index cef3d6f5c34e..f3bb7cbbd293 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -401,8 +401,11 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
 	intel_ggtt_restore_fences(gt->ggtt);
 
 	ret = intel_uc_runtime_resume(&gt->uc);
-	if (ret)
+	if (ret) {
+		/* Set wedge if uc resume failed */
+		intel_gt_set_wedged(gt);
 		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 6648691bd645..d4f428acf20a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -698,8 +698,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 	/* Make sure we enable communication if and only if it's disabled */
 	GEM_BUG_ON(enable_communication == intel_guc_ct_enabled(&guc->ct));
 
-	if (enable_communication)
-		guc_enable_communication(guc);
+	if (enable_communication) {
+		err = guc_enable_communication(guc);
+		if (err) {
+			guc_dbg(guc, "Failed to resume, %pe", ERR_PTR(err));
+			return err;
+		}
+	}
 
 	/* If we are only resuming GuC communication but not reloading
 	 * GuC, we need to ensure the ARAT timer interrupt is enabled
-- 
2.34.1

