Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4C556F7C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 02:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2405D8870A;
	Thu, 23 Jun 2022 00:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B910F6D2;
 Thu, 23 Jun 2022 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655944428; x=1687480428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DHU6HSW0ZHwdNwVH21sXp1TNLittW/XutpAT/YGKw6E=;
 b=iMWnxJc4K6+Tj1hrJDvCzY3+m9eU/6VCic7jW6FSkml/+yDqkSJyKWUo
 Xqet2ZqeVjg1ujIxibyc7qHZFz8GU19HBfVj8cvjrmEp/7hdE1d3ygppw
 1SeD7OpR7SOPs302P2SBtIvbd3RwQ6CqxbFYNrMMK7nOa672TamrGyzK4
 sMOdcz339OuIr1cOTHiPJZa62BYjaP+Ji3giRJMCXBX5k3twSBf9kd4Px
 SWwoPLdEBnHNfMkb7Sbde1qILxvopxlDmUgxkCZpTUQdPpJEL+cKhRulo
 pl+1NQr0CVV4/iC6EIGfoxXdQZMGRLib+a59+ONI+2dzeyySIJ2eSujNb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366904945"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="366904945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 17:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="715626338"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 22 Jun 2022 17:33:46 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Date: Wed, 22 Jun 2022 17:32:25 -0700
Message-Id: <20220623003225.23301-1-vinay.belgaumkar@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SLPC min/max frequency updates require H2G calls. We are seeing
timeouts when GuC channel is backed up and it is unable to respond
in a timely fashion causing warnings and affecting CI.

This is seen when waitboosting happens during a stress test.
this patch updates the waitboost path to use a non-blocking
H2G call instead, which returns as soon as the message is
successfully transmitted.

v2: Use drm_notice to report any errors that might occur while
sending the waitboost H2G request (Tvrtko)
v3: Add drm_notice inside force_min_freq (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 42 +++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 2df31af70d63..ec9c4ca0f615 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
 	return data->header.global_state;
 }
 
+static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
+{
+	u32 request[] = {
+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
+		id,
+		value,
+	};
+	int ret;
+
+	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+
+	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
+
+	return guc_action_slpc_set_param_nb(guc, id, value);
+}
+
 static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
 {
 	u32 request[] = {
@@ -208,12 +232,14 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 	 */
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		ret = slpc_set_param(slpc,
-				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
-				     freq);
+		/* Non-blocking request will avoid stalls */
+		ret = slpc_set_param_nb(slpc,
+					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					freq);
 		if (ret)
-			i915_probe_error(i915, "Unable to force min freq to %u: %d",
-					 freq, ret);
+			drm_notice(&i915->drm,
+				   "Failed to send set_param for min freq(%d): (%d)\n",
+				   freq, ret);
 	}
 
 	return ret;
@@ -222,6 +248,7 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 static void slpc_boost_work(struct work_struct *work)
 {
 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
+	int err;
 
 	/*
 	 * Raise min freq to boost. It's possible that
@@ -231,8 +258,9 @@ static void slpc_boost_work(struct work_struct *work)
 	 */
 	mutex_lock(&slpc->lock);
 	if (atomic_read(&slpc->num_waiters)) {
-		slpc_force_min_freq(slpc, slpc->boost_freq);
-		slpc->num_boosts++;
+		err = slpc_force_min_freq(slpc, slpc->boost_freq);
+		if (!err)
+			slpc->num_boosts++;
 	}
 	mutex_unlock(&slpc->lock);
 }
-- 
2.35.1

