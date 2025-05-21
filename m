Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31164ABEFEC
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF42710E6F5;
	Wed, 21 May 2025 09:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md+VgZoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB3E10E6EF;
 Wed, 21 May 2025 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747819993; x=1779355993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcM8cY0JJjbM/QZC+XwC8i8LRRKwQ/0rk7Rq3VyzC4w=;
 b=Md+VgZoF3tPJI7qqsEeXzJ6wvriQbchI95sVmxuMK9PqaxylDT+LqX5P
 Rq9WKzpzL3kNzLE6VEZWkqWJpCDBa6lotGeeI21CvWRzGTzLieR1xgHVi
 BSTry0/z16X6+YQecJnyq0tXCew+URu+dAu2DjS1u0clgsdzUFoZ7YNm9
 F67yQ3K0GmgedqYW2CMG9fsO8dETOgH8AlsOCFAUomf2c5d0RXxbN8/E9
 0fwLA5VVRYFVE7f9R7Ha5MFKG4KcGe11thfow4zTI5VBFtStNY/IqutZq
 Dc4EFHv5WRuceVWPSBO8uI2lBs/uW+6qePZ3dYhd2Cja+tUroAdhhTZN4 g==;
X-CSE-ConnectionGUID: NxQrfpHmQAOwUKoA9KQbow==
X-CSE-MsgGUID: yNWv0aikTC2Q3V9Pu/TeDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49714351"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49714351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:12 -0700
X-CSE-ConnectionGUID: WJDcfMR4QYGgNeeZdQiM0g==
X-CSE-MsgGUID: ukIdcN5VR7e/9n4NULAVvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140407111"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:11 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 08/12] drm/i915/alpm: Move port alpm configuration
Date: Wed, 21 May 2025 12:32:36 +0300
Message-ID: <20250521093240.2284835-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521093240.2284835-1-jouni.hogander@intel.com>
References: <20250521093240.2284835-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is specified in Bspec where port alpm configuration is supposed to be
performed. Change accordingly.

v2:
  - drop HAS reference
  - ensure PORT_ALPM registers are not writen on older platform

Bspec: 68849
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c    | 48 ++++++++++++--------
 drivers/gpu/drm/i915/display/intel_alpm.h    |  2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c |  1 +
 drivers/gpu/drm/i915/display/intel_ddi.c     |  6 +++
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index bbcf510b0c25..dfdde8e4eabe 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -336,7 +336,6 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	enum port port = dp_to_dig_port(intel_dp)->base.port;
 	u32 alpm_ctl;
 
 	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
@@ -368,23 +367,6 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 				       pr_alpm_ctl);
 		}
 
-		intel_de_write(display,
-			       PORT_ALPM_CTL(port),
-			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
-			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
-			       PORT_ALPM_CTL_SILENCE_PERIOD(
-				       intel_dp->alpm_parameters.silence_period_sym_clocks));
-
-		intel_de_write(display,
-			       PORT_ALPM_LFPS_CTL(port),
-			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
-			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
-			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
-			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
-				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms));
 	} else {
 		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
 			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
@@ -408,6 +390,36 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
 	intel_dp->alpm_parameters.transcoder = crtc_state->cpu_transcoder;
 }
 
+void intel_alpm_port_configure(struct intel_dp *intel_dp,
+			       const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	enum port port = dp_to_dig_port(intel_dp)->base.port;
+	u32 alpm_ctl_val = 0, lfps_ctl_val = 0;
+
+	if (DISPLAY_VER(display) < 20)
+		return;
+
+	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
+		alpm_ctl_val = PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
+			PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
+			PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
+			PORT_ALPM_CTL_SILENCE_PERIOD(
+				intel_dp->alpm_parameters.silence_period_sym_clocks);
+		lfps_ctl_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
+			PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
+				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
+			PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
+				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
+			PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
+				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms);
+	}
+
+	intel_de_write(display, PORT_ALPM_CTL(port), alpm_ctl_val);
+
+	intel_de_write(display, PORT_ALPM_LFPS_CTL(port), lfps_ctl_val);
+}
+
 void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 				 struct intel_crtc *crtc)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 86f4d5ab1981..a861c20b5d79 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -27,6 +27,8 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state);
 void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 				 struct intel_crtc *crtc);
+void intel_alpm_port_configure(struct intel_dp *intel_dp,
+			       const struct intel_crtc_state *crtc_state);
 void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc);
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index a82b93cbc81d..91118d115fd3 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -10,6 +10,7 @@
 
 #include "i915_reg.h"
 #include "i915_utils.h"
+#include "intel_alpm.h"
 #include "intel_cx0_phy.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 0e6d618b5356..65ab012c3eae 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3743,6 +3743,12 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 
 	intel_ddi_buf_enable(encoder, intel_dp->DP);
 	intel_dp->DP |= DDI_BUF_CTL_ENABLE;
+
+	/*
+	 * 6.k If AUX-Less ALPM is going to be enabled
+	 *     i. Configure PORT_ALPM_CTL and PORT_ALPM_LFPS_CTL here
+	 */
+	intel_alpm_port_configure(intel_dp, crtc_state);
 }
 
 static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
-- 
2.43.0

