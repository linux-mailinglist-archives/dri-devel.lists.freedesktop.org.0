Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B45FDDB0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 17:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31FB10E8FA;
	Thu, 13 Oct 2022 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E210E8F7;
 Thu, 13 Oct 2022 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665676566; x=1697212566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZlbDMuUg3tvX3WOgVclgx65/t7rUaf1GcyNiQaPtrnE=;
 b=f8SFmQsa6J690lOsh71CUQGRj3kJQfa+7UMY9besaiwYGNsHac7yqx2M
 znqpsUnhIqQTOKfo1k2FS0cQ3HI4yU34G59nrog0mLlDjCg1MHnuc5FfH
 HJPW8ztYn1HGHGb06FUtRFC+7HdcGDDGzsb0GoAIKxZV99EU10x40nzvG
 7tNcbomLRZJwGOgURTBKbRmTcSqCMIeAA5iK25VdQiM+O22h1q5g0IT9Q
 uTQYho12tMvN5Bd/eMNLrdjF4YP3vGd10YM686C1y5X6qakx+3qcNzBRG
 6m/VzZYQPUBwgJQUkMF10lwaEIx7qhS+YYxqA05cOQQZaBtTEM6bzE/TR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="369299036"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="369299036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 08:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="731916947"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="731916947"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2022 08:56:05 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/slpc: Use platform limits for min/max frequency
Date: Thu, 13 Oct 2022 08:55:24 -0700
Message-Id: <20221013155524.25886-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC will set the min/max frequencies to theoretical max on
ATS-M. This will break kernel ABI, so limit min/max frequency
to RP0(platform max) instead.

Also modify the SLPC selftest to update the min frequency
when we have a server part so that we can iterate between
platform min and max.

v2: Check softlimits instead of platform limits(Riana)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7030

Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 ++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
 3 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index 4c6e9257e593..e42bc215e54d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 	enum intel_engine_id id;
 	struct igt_spinner spin;
 	u32 slpc_min_freq, slpc_max_freq;
+	u32 saved_min_freq;
 	int err = 0;
 
 	if (!intel_uc_uses_guc_slpc(&gt->uc))
@@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int test_type)
 		return -EIO;
 	}
 
-	/*
-	 * FIXME: With efficient frequency enabled, GuC can request
-	 * frequencies higher than the SLPC max. While this is fixed
-	 * in GuC, we level set these tests with RPn as min.
-	 */
-	err = slpc_set_min_freq(slpc, slpc->min_freq);
-	if (err)
-		return err;
+	if (slpc_min_freq == slpc_max_freq) {
+		/* Server parts will have min/max clamped to RP0 */
+		if (slpc->min_is_rpmax) {
+			err = slpc_set_min_freq(slpc, slpc->min_freq);
+			if (err) {
+				pr_err("Unable to update min freq on server part");
+				return err;
+			}
 
-	if (slpc->min_freq == slpc->rp0_freq) {
-		pr_err("Min/Max are fused to the same value\n");
-		return -EINVAL;
+		} else {
+			pr_err("Min/Max are fused to the same value\n");
+			return -EINVAL;
+		}
+	} else {
+		/*
+		 * FIXME: With efficient frequency enabled, GuC can request
+		 * frequencies higher than the SLPC max. While this is fixed
+		 * in GuC, we level set these tests with RPn as min.
+		 */
+		err = slpc_set_min_freq(slpc, slpc->min_freq);
+		if (err)
+			return err;
 	}
 
+	saved_min_freq = slpc_min_freq;
+
+	/* New temp min freq = RPn */
+	slpc_min_freq = slpc->min_freq;
+
 	intel_gt_pm_wait_for_idle(gt);
 	intel_gt_pm_get(gt);
 	for_each_engine(engine, gt, id) {
@@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 
 	/* Restore min/max frequencies */
 	slpc_set_max_freq(slpc, slpc_max_freq);
-	slpc_set_min_freq(slpc, slpc_min_freq);
+	slpc_set_min_freq(slpc, saved_min_freq);
 
 	if (igt_flush_test(gt->i915))
 		err = -EIO;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index fdd895f73f9f..11613d373a49 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	slpc->max_freq_softlimit = 0;
 	slpc->min_freq_softlimit = 0;
+	slpc->min_is_rpmax = false;
 
 	slpc->boost_freq = 0;
 	atomic_set(&slpc->num_waiters, 0);
@@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
+{
+	int slpc_min_freq;
+
+	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
+		return false;
+
+	if (slpc_min_freq > slpc->rp0_freq)
+		return true;
+	else
+		return false;
+}
+
+static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
+{
+	/* For server parts, SLPC min will be at RPMax.
+	 * Use min softlimit to clamp it to RP0 instead.
+	 */
+	if (is_slpc_min_freq_rpmax(slpc) &&
+	    !slpc->min_freq_softlimit) {
+		slpc->min_is_rpmax = true;
+		slpc->min_freq_softlimit = slpc->rp0_freq;
+	}
+}
+
 static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 {
 	/* Force SLPC to used platform rp0 */
@@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	slpc_get_rp_values(slpc);
 
+	/* Handle the case where min=max=RPmax */
+	update_server_min_softlimit(slpc);
+
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index 73d208123528..a6ef53b04e04 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -19,6 +19,9 @@ struct intel_guc_slpc {
 	bool supported;
 	bool selected;
 
+	/* Indicates this is a server part */
+	bool min_is_rpmax;
+
 	/* platform frequency limits */
 	u32 min_freq;
 	u32 rp0_freq;
-- 
2.35.1

