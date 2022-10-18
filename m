Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE16032CF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 20:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9D810E28F;
	Tue, 18 Oct 2022 18:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735910E043;
 Tue, 18 Oct 2022 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666119032; x=1697655032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mV4dAxW/cGBCHGJX+v0AQlAPO6pmJfNwd7tlbgM03sk=;
 b=mZTIOxmeczJZ8Tn1FDPhm16wRRGrJV8mqzcGJJ1TVpTYsPUaLnGTrGkQ
 qlUvCrDATLnmXK2sQprbTe6OWYqHle33gnbE9spgZwGCZ1JT0+GUAX9cy
 hpX0s5ldrj5GsQJD8m4+iti1+24+FqVdCs4CDlw7VYJX+cyRzGewQI4Ib
 UGuxfowXvgzzHVgmU8yCZJd5l3GNGato1Iq9vcX8rmpJwRVFqoy0+H7++
 nn3MHiHERu/lKImKmvMgYPYe3RPE6HxEn4aYK9UltFA/Nsr/5R4chnWE5
 FKNmzo7jYhNAfLf1caq0kHoxMjDbHpSLassi97GoBxrRUMXdeYHI+sL+C A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="289519589"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="289519589"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 11:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="628853822"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="628853822"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 18 Oct 2022 11:31:16 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/slpc: Use platform limits for min/max frequency
Date: Tue, 18 Oct 2022 11:30:31 -0700
Message-Id: <20221018183031.33704-1-vinay.belgaumkar@intel.com>
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
 Riana Tauro <riana.tauro@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC will set the min/max frequencies to theoretical max on
ATS-M. This will break kernel ABI, so limit min/max frequency
to RP0(platform max) instead.

Also modify the SLPC selftest to update the min frequency
when we have a server part so that we can iterate between
platform min and max.

v2: Check softlimits instead of platform limits (Riana)
v3: More review comments (Ashutosh)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7030

Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 30 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  2 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
 4 files changed, 63 insertions(+), 12 deletions(-)

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
index fdd895f73f9f..b7cdeec44bd3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	slpc->max_freq_softlimit = 0;
 	slpc->min_freq_softlimit = 0;
+	slpc->min_is_rpmax = false;
 
 	slpc->boost_freq = 0;
 	atomic_set(&slpc->num_waiters, 0);
@@ -588,6 +589,32 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
+{
+	int slpc_min_freq;
+
+	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
+		return false;
+
+	if (slpc_min_freq == SLPC_MAX_FREQ_MHZ)
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
+		(slpc_to_gt(slpc))->defaults.min_freq = slpc->min_freq_softlimit;
+	}
+}
+
 static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 {
 	/* Force SLPC to used platform rp0 */
@@ -647,6 +674,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	slpc_get_rp_values(slpc);
 
+	/* Handle the case where min=max=RPmax */
+	update_server_min_softlimit(slpc);
+
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 82a98f78f96c..11975a31c9d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -9,6 +9,8 @@
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc_types.h"
 
+#define SLPC_MAX_FREQ_MHZ 4250
+
 struct intel_gt;
 struct drm_printer;
 
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

