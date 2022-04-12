Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A54FEA2C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 00:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033210EBEE;
	Tue, 12 Apr 2022 22:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223D10EBEA;
 Tue, 12 Apr 2022 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649803745; x=1681339745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UCI2H2jxl6MVQFwZAehhn+6D3oaQeEPR6qJo8CbjwV8=;
 b=MeCHGpk+RDsd7pdJc0Ou8iQKGaaqJmFPn8c93zW8LBl/hFtBXyRtLzcO
 E+ZZKUfnkKpU4bIt+SURBi012U/VNEJ1RLTvyFllYGWMi1iOLUVFmoyJv
 SbiHp86DjMgYKqvXCMURpXnqytCM0fFM+ovPMFT4uTEntFPd7e2PkB2OY
 mpcvBHaD4rNTTJlXSKaZI0hC19JG+0xRcN+C2yunarw+Jt6a1+k55yrnK
 KpGkaRsUwLAkL5CqCiOotxKTUhTq13/IMosoAQLLXlz7DifL50hasbFtl
 2a61mhjO/0SNqaZH4LtbBpoYT577/nGI6r4o19vnmECHlAJmcxl/PJY8j g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261371245"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="261371245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 15:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="854555366"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2022 15:49:04 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use i915_probe_error instead of drm_err
Date: Tue, 12 Apr 2022 15:48:52 -0700
Message-Id: <20220412224852.21501-1-vinay.belgaumkar@intel.com>
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

This will ensure we don't have false positives when we run
error injection tests.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 42 ++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index b170238aa15c..639de3c10545 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -152,8 +152,8 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 
 	ret = guc_action_slpc_query(guc, offset);
 	if (unlikely(ret))
-		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "Failed to query task state (%pe)\n",
+				 ERR_PTR(ret));
 
 	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
 
@@ -170,8 +170,8 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
 
 	ret = guc_action_slpc_set_param(guc, id, value);
 	if (ret)
-		drm_err(&i915->drm, "Failed to set param %d to %u (%pe)\n",
-			id, value, ERR_PTR(ret));
+		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
+				 id, value, ERR_PTR(ret));
 
 	return ret;
 }
@@ -211,8 +211,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 				     freq);
 		if (ret)
-			drm_err(&i915->drm, "Unable to force min freq to %u: %d",
-				freq, ret);
+			i915_probe_error(i915, "Unable to force min freq to %u: %d",
+					 freq, ret);
 	}
 
 	return ret;
@@ -247,9 +247,9 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
 	if (unlikely(err)) {
-		drm_err(&i915->drm,
-			"Failed to allocate SLPC struct (err=%pe)\n",
-			ERR_PTR(err));
+		i915_probe_error(i915,
+				 "Failed to allocate SLPC struct (err=%pe)\n",
+				 ERR_PTR(err));
 		return err;
 	}
 
@@ -316,15 +316,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
 	ret = guc_action_slpc_reset(guc, offset);
 
 	if (unlikely(ret < 0)) {
-		drm_err(&i915->drm, "SLPC reset action failed (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
+				 ERR_PTR(ret));
 		return ret;
 	}
 
 	if (!ret) {
 		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
-			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
-				slpc_get_state_string(slpc));
+			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
+					 slpc_get_state_string(slpc));
 			return -EIO;
 		}
 	}
@@ -616,8 +616,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	ret = slpc_reset(slpc);
 	if (unlikely(ret < 0)) {
-		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
+				 ERR_PTR(ret));
 		return ret;
 	}
 
@@ -632,24 +632,24 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Ignore efficient freq and set min to platform min */
 	ret = slpc_ignore_eff_freq(slpc, true);
 	if (unlikely(ret)) {
-		drm_err(&i915->drm, "Failed to set SLPC min to RPn (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
+				 ERR_PTR(ret));
 		return ret;
 	}
 
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
-		drm_err(&i915->drm, "Failed to set SLPC max to RP0 (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
+				 ERR_PTR(ret));
 		return ret;
 	}
 
 	/* Revert SLPC min/max to softlimits if necessary */
 	ret = slpc_set_softlimits(slpc);
 	if (unlikely(ret)) {
-		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
-			ERR_PTR(ret));
+		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
+				 ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.35.1

