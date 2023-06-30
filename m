Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB83743C3D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A90510E46F;
	Fri, 30 Jun 2023 12:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEA110E471;
 Fri, 30 Jun 2023 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129481; x=1719665481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLm3YKzf1h5iufcmimWrsvkp0QkoOcSfM0N9Xk3bgcE=;
 b=PlWvrDWcVEPJDd35agZAVvoulvm3lHi9lky/ITsRwG9WJu4X9mC9NNCa
 xXfih8C6XDDcqILHwz+iftpwBpZv0QDgj0gn1cZrYEU9IiyWcjaIiB4Yz
 PdTUsbeorJ2JHq6XiIykXxK3GNKnatbuStcwW9r0vqq+DpMjZ+aKPqe5p
 hyyxTFjQeKVTR6RPbPP18RnFqGFzhSuKnFroWLeflxN57UOqd6jYli3SV
 x+Je096UgNGw/IO5nGbRhKOAJiN+czGYpeXvRjiyzao6IRD9Kb0Y1xDAc
 o/z0+gY+JKXw6v2elSywp3jH1Ikd6nEZVrbGishp3TRNKg44jKUW2uFhR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232242"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232242"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219118"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219118"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:19 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/19] drm/i915/dp: Add DSC BPC/BPP constraints while
 selecting pipe bpp with DSC
Date: Fri, 30 Jun 2023 18:16:48 +0530
Message-Id: <20230630124652.4140932-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we check if pipe_bpp is max the min DSC bpc requirements.
Add checks for max DSC BPC/BPP constraints while computing the
pipe_bpp when DSC is in use.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 633dba7885fd..f6f9b061fc0b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1683,13 +1683,27 @@ u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
 }
 
 static
-bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
+bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915,
+				struct drm_connector_state *conn_state,
+				struct link_config_limits *limits,
+				int pipe_bpp)
 {
-	return pipe_bpp >= intel_dp_dsc_min_src_input_bpc(i915) * 3;
+	u8 dsc_max_bpc, dsc_min_bpc, dsc_max_pipe_bpp, dsc_min_pipe_bpp;
+
+	dsc_max_bpc = min(intel_dp_dsc_max_src_input_bpc(i915), conn_state->max_requested_bpc);
+	dsc_min_bpc = intel_dp_dsc_min_src_input_bpc(i915);
+
+	dsc_max_pipe_bpp = min(dsc_max_bpc * 3, limits->max_bpp);
+	dsc_min_pipe_bpp = max(dsc_min_bpc * 3, limits->min_bpp);
+
+	return pipe_bpp >= dsc_min_pipe_bpp &&
+	       pipe_bpp <= dsc_max_pipe_bpp;
 }
 
 static
-int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
+int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp,
+				struct drm_connector_state *conn_state,
+				struct link_config_limits *limits)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int forced_bpp;
@@ -1699,7 +1713,7 @@ int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
 
 	forced_bpp = intel_dp->force_dsc_bpc * 3;
 
-	if (is_dsc_pipe_bpp_sufficient(i915, forced_bpp)) {
+	if (is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, forced_bpp)) {
 		drm_dbg_kms(&i915->drm, "Input DSC BPC forced to %d\n", intel_dp->force_dsc_bpc);
 		return forced_bpp;
 	}
@@ -1720,16 +1734,16 @@ static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	u16 output_bpp, dsc_max_compressed_bpp = 0;
 	int forced_bpp, pipe_bpp;
 
-	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
+	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
 
 	if (forced_bpp) {
 		pipe_bpp = forced_bpp;
 	} else {
 		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, conn_state->max_requested_bpc);
 
-		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
+		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
 			drm_dbg_kms(&i915->drm,
-				    "Computed BPC less than min supported by source for DSC\n");
+				    "Computed BPC is not in DSC BPC limits\n");
 			return -EINVAL;
 		}
 	}
@@ -1771,7 +1785,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int pipe_bpp, forced_bpp;
 
-	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
+	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
 
 	if (forced_bpp) {
 		pipe_bpp = forced_bpp;
@@ -1779,9 +1793,9 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 		/* For eDP use max bpp that can be supported with DSC. */
 		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
 							conn_state->max_requested_bpc);
-		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
+		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
 			drm_dbg_kms(&i915->drm,
-				    "Computed BPC less than min supported by source for DSC\n");
+				    "Computed BPC is not in DSC BPC limits\n");
 			return -EINVAL;
 		}
 	}
-- 
2.40.1

