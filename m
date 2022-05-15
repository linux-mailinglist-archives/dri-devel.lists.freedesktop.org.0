Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3F5275F6
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 08:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FCF10EA38;
	Sun, 15 May 2022 06:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE3D10EA36;
 Sun, 15 May 2022 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652594720; x=1684130720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AzQqyiH7YZy5lBmVnar1AiJYrUKu45vpT5U5oPYYwwI=;
 b=aJS4vlBioh4JigElTDiM0W4lRO3iiYZKAO2v8bE2j3oAlT2nq1qhXVPp
 QaqnxpW5PE/mxw/sQYhSoARV3FLaHfCRp7aJs1WsE70J6TtH7mSfmR58R
 LAs6J2qn5/oAHiczGPxKO+bujBxET/uifT5/D8E50W9fnU2/Y8bUvMVdn
 W70oPXiDEXsilIwTIF+jIP5crEvMJeHyMJIiBGUr7Sba8NWgYpyU2O2xw
 eYw4c/onTnHmJGHD9DKxqwdOuAU6FJkG97zO1ycGBheii675dg1TLW2kB
 CYq/zqB1kTuo5keYUSTbGGLCaM9azd4WuYQh5nqGP1l9eP/bcQ22E9dLO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="252663570"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="252663570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 23:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="573554772"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga007.fm.intel.com with ESMTP; 14 May 2022 23:05:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Date: Sat, 14 May 2022 23:05:06 -0700
Message-Id: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 1db833da42df..e5e869c96262 100644
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
@@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 	 */
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
-		ret = slpc_set_param(slpc,
-				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
-				     freq);
-		if (ret)
-			i915_probe_error(i915, "Unable to force min freq to %u: %d",
-					 freq, ret);
+		/* Non-blocking request will avoid stalls */
+		ret = slpc_set_param_nb(slpc,
+					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					freq);
 	}
 
 	return ret;
@@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 static void slpc_boost_work(struct work_struct *work)
 {
 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	int err;
 
 	/*
 	 * Raise min freq to boost. It's possible that
@@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
 	 */
 	mutex_lock(&slpc->lock);
 	if (atomic_read(&slpc->num_waiters)) {
-		slpc_force_min_freq(slpc, slpc->boost_freq);
-		slpc->num_boosts++;
+		err = slpc_force_min_freq(slpc, slpc->boost_freq);
+		if (!err)
+			slpc->num_boosts++;
+		else
+			drm_notice(&i915->drm, "Failed to send waitboost request (%d)\n",
+				   err);
 	}
 	mutex_unlock(&slpc->lock);
 }
-- 
2.35.1

