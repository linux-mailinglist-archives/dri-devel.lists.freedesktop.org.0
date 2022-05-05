Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D851B787
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 07:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5910F9BC;
	Thu,  5 May 2022 05:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978810F9BA;
 Thu,  5 May 2022 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651729223; x=1683265223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GzTzy8H8zU4jwVcyEMaJHCSnQEcifsLg+OU//98mT8=;
 b=QjAc+OZsf8qLY0mC+YonUCIh9kN6k39bFvE9Cmt74Eu3kqRY3zC8y7p5
 0rJS9LHq3q5ycxB09xPTBjCWUIDxKRSSAjG7lTXZy9zM+6RcFz7Kfw9zM
 4Ya6CIHU5PqKnRo7lBosJThTCLm1CmVYJUv3CDrnO+5iqHQDfFYQiHppl
 m9VnBOdAKV++wbKKA1KWwpiE9F5X6hLNsc8SSkxlidsVhrXGVHfpU5cKk
 Df3AgHUbagNcWBVFs19fGS9HQCPFG+E4DPdNPRsixjFUkotu/W5hhEcUn
 vgDCusGEjKgqdaEUxVNUrrnHsiQHJpnMtTdm1KXCim2xfrSzR/hWDeCeS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268153819"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="268153819"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 22:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="694507953"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 04 May 2022 22:40:22 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Date: Wed,  4 May 2022 22:40:10 -0700
Message-Id: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 ++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 1db833da42df..c852f73cf521 100644
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
@@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct *work)
 	 */
 	mutex_lock(&slpc->lock);
 	if (atomic_read(&slpc->num_waiters)) {
-		slpc_force_min_freq(slpc, slpc->boost_freq);
-		slpc->num_boosts++;
+		if (!slpc_force_min_freq(slpc, slpc->boost_freq))
+			slpc->num_boosts++;
 	}
 	mutex_unlock(&slpc->lock);
 }
-- 
2.35.1

