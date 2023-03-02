Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9A6A8B6F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 23:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BDF10E57F;
	Thu,  2 Mar 2023 22:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10C210E57E;
 Thu,  2 Mar 2023 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677794714; x=1709330714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wyml9wvEJVrN9H/HmyIVpIQiXWu3mO4TWTCmM7IR73w=;
 b=ghskhztn8Pj8l5YTwEyeISNNwAeD4yC1fk9ITOhsUC3wb0uMyxiGeeJP
 HlAMF6oS2h2ceb6bzyu/CwW+A63cQrPEcXlJPb2r3gvirecGyKAwJVs+B
 4MeMGlIrSUbK3oTMls41ysCgouYOYvd5f4xpLV1cEsqQvOwHNCWJPUZLP
 t80273bv8oqPqqp4l2Z+5V/rPG0PFEIJmKBACLSpX24zBaqFf4gNRuKbu
 TCaLitUhtjaualNvjglHVWk7vQ+xm3/r26Sd5d5Htng7I1gvdi8BWwnna
 obSoVkVhKZRIVhnYMYcgfk1WrnI5O0WbEinCtxs2kgH0dk3PTZnoVTYt3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337181829"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="337181829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 14:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764187490"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="764187490"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2023 14:05:13 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Set wedged if enable guc communication failed
Date: Thu,  2 Mar 2023 13:50:20 -0800
Message-Id: <20230302215020.1307608-1-zhanjun.dong@intel.com>
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

Add err code check for enable_communication on resume path. When resume failed, we can no longer use the GPU, marking the GPU as wedged.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 7 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index cef3d6f5c34e..42a7d75ce39e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -401,8 +401,13 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
 	intel_ggtt_restore_fences(gt->ggtt);
 
 	ret = intel_uc_runtime_resume(&gt->uc);
-	if (ret)
+	if (ret) {
+		/* Resume failed, we can no longer use the GPU, marking the GPU
+		 * as wedged.
+		 */
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

