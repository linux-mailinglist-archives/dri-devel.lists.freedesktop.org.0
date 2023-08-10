Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF177793E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94810E54D;
	Thu, 10 Aug 2023 13:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125C10E52D;
 Thu, 10 Aug 2023 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672897; x=1723208897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiahveQRDUYDNmmuWt6oZp0CRKVrzs3w1SVtnrsbrEY=;
 b=ZA9252Nli2hYPF5v2ApuhVUaDcyHQvFmMilUMZGVySxq8e4oOymLO4ku
 44kn5iR3BFn8cMFmRy4GnidZQFDSVfhr2uX6FrZwMply/NIctk5EyamRc
 kmdkkhLreOKce/iqJISsNc/KHJmgjdtfDlO9GD2hUxK8Qts4JMDIA6tPK
 a6pu41Ju+2i1EWuFN3ZdDIvY7muw13iYpZKZcJi4RKz0J3MIdTpFQoOun
 qY8Q/XOqPoqpreZHgPNZjUjM+PrQpNalbdz35EC2U/KRBndmyNgjYqltW
 0Qp3+Vwpyy4Di/Thv1zkhwlr+MrKvqccdGWcDg1nOAhmvwtHofqj5c7MR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358634"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143503"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143503"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:13 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/20] drm/i915/dp: Add DSC BPC/BPP constraints while
 selecting pipe bpp with DSC
Date: Thu, 10 Aug 2023 18:33:14 +0530
Message-Id: <20230810130319.3708392-16-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

Currently we check if the pipe_bpp selected is >= the
min DSC bpc/bpp requirement. We do not check if it is <= the max DSC
bpc/bpp requirement.

Add checks for max DSC BPC/BPP constraints while computing the
pipe_bpp when DSC is in use.

v2: Fix the commit message.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4870c9b0db6..67e8a9abe6ce 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1691,13 +1691,27 @@ u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
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
@@ -1707,7 +1721,7 @@ int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
 
 	forced_bpp = intel_dp->force_dsc_bpc * 3;
 
-	if (is_dsc_pipe_bpp_sufficient(i915, forced_bpp)) {
+	if (is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, forced_bpp)) {
 		drm_dbg_kms(&i915->drm, "Input DSC BPC forced to %d\n", intel_dp->force_dsc_bpc);
 		return forced_bpp;
 	}
@@ -1729,16 +1743,16 @@ static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
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
@@ -1780,7 +1794,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int pipe_bpp, forced_bpp;
 
-	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
+	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
 
 	if (forced_bpp) {
 		pipe_bpp = forced_bpp;
@@ -1788,9 +1802,9 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
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

