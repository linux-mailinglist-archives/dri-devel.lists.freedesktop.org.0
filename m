Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F222B10BFE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A710E957;
	Thu, 24 Jul 2025 13:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJEtRp1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2D810E94C;
 Thu, 24 Jul 2025 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365070; x=1784901070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1lKR3GB5gbP0+OfG1eU7VGQg/pWpGdgGeX+o2y95sI=;
 b=AJEtRp1OPnEjeZZu7rq0860so00tXPs9i6PGa7s2aj25z1db3IhoO45a
 c8C6haBV1R2mVUxnvaH8oRaCkn97dncZdvWCW/hYPbc9OOu+M8krj9DaM
 xQwx4MVPTedDSCK4rZLSePUvYpvEmdl5tt8Mj0OIQswuvlwNeW6mlxw4N
 MWeBtiuHw6ElfS8MhrTAj+nW/4Vrui8J1sy1R9ECeM5quP8uLIvHOQX4i
 AiCulRd1REWJNzjzRlwE3vXuy6paBKAeihN3GZGBwxIxRkGsVq5M0Hz1a
 FzE2HNLCHYYVaZiIAVBvlEV2fSei0z7u2/iusfxkHT/3sIx3+m54ujl20 g==;
X-CSE-ConnectionGUID: OiWjCzLtSmC2hruMkTqAUg==
X-CSE-MsgGUID: 8LrWPEVbQfGqujy7bwgEUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55553888"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55553888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 06:51:10 -0700
X-CSE-ConnectionGUID: iPCQ9s8JQqivxb0SxvKTJA==
X-CSE-MsgGUID: au6+h5zhTCqZEshCOA7nAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159826476"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 06:51:07 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 07/10] drm/i915/display: Configure the second scaler
Date: Thu, 24 Jul 2025 19:15:41 +0530
Message-Id: <20250724134544.284371-8-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724134544.284371-1-nemesa.garg@intel.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both sharpness and panel fitter use pipe scaler,
but only one can be enabled at a time. Furthermore
sharpness uses second scaler. So for CASF, check if
second scaler is available and make sure that only
either of panel fitter or sharpness is enabled at
a time.

v2: Add the panel fitting check before enabling sharpness
v3: Reframe commit message[Arun]
v4: Replace string based comparison with plane_state[Jani]
v5: Rebase
v6: Fix build issue
v7: Remove scaler id from verify_crtc_state[Ankit]
v8: Change the patch title. Add code comment.
    Move the config part in patch#6. [Ankit]
v9: Refactor the patch[Ankit]
v10: Modify the header of patch[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    |  8 +++++++
 drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  4 +++-
 drivers/gpu/drm/i915/display/skl_scaler.c    | 25 +++++++++++++++-----
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index b2d2aea9108b..d5d5b967bf05 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -159,6 +159,14 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
 	}
 }
 
+bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->hw.casf_params.casf_enable)
+		return true;
+
+	return false;
+}
+
 static int casf_coeff_tap(int i)
 {
 	return i % SCALER_FILTER_NUM_TAPS;
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 031d2e41701e..a546f88a65bb 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -17,5 +17,6 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
 void intel_casf_filter_lut_load(struct intel_crtc *crtc,
 				const struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
+bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7035c1fc9033..706ebb7af99e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -60,6 +60,7 @@
 #include "intel_audio.h"
 #include "intel_bo.h"
 #include "intel_bw.h"
+#include "intel_casf.h"
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
 #include "intel_color.h"
@@ -4254,7 +4255,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (DISPLAY_VER(display) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
-		    intel_crtc_needs_fastset(crtc_state)) {
+		    intel_crtc_needs_fastset(crtc_state) ||
+		    intel_casf_needs_scaler(crtc_state)) {
 			ret = skl_update_scaler_crtc(crtc_state);
 			if (ret)
 				return ret;
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 1c6da9be486c..f1f38d9739e6 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include "i915_utils.h"
+#include "intel_casf.h"
 #include "intel_casf_regs.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
@@ -282,7 +283,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
 				 drm_rect_width(&crtc_state->pipe_src),
 				 drm_rect_height(&crtc_state->pipe_src),
 				 width, height, NULL, 0,
-				 crtc_state->pch_pfit.enabled);
+				 crtc_state->pch_pfit.enabled ||
+				 intel_casf_needs_scaler(crtc_state));
 }
 
 /**
@@ -321,7 +323,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 }
 
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
-				 struct intel_crtc *crtc)
+				 struct intel_crtc *crtc,
+				 struct intel_plane_state *plane_state,
+				 bool casf_scaler)
 {
 	int i;
 
@@ -329,6 +333,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		if (scaler_state->scalers[i].in_use)
 			continue;
 
+		/* CASF needs second scaler */
+		if (!plane_state && casf_scaler && i != 1)
+			continue;
+
 		scaler_state->scalers[i].in_use = true;
 
 		return i;
@@ -379,7 +387,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 				     int num_scalers_need, struct intel_crtc *crtc,
 				     const char *name, int idx,
 				     struct intel_plane_state *plane_state,
-				     int *scaler_id)
+				     int *scaler_id, bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
@@ -388,7 +396,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 	int vscale = 0;
 
 	if (*scaler_id < 0)
-		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
+		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
 
 	if (drm_WARN(display->drm, *scaler_id < 0,
 		     "Cannot find scaler for %s:%d\n", name, idx))
@@ -520,10 +528,14 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
 	struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 
+	if (intel_casf_needs_scaler(crtc_state) && crtc_state->pch_pfit.enabled)
+		return -EINVAL;
+
 	return intel_atomic_setup_scaler(crtc_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "CRTC", crtc->base.base.id,
-					 NULL, &scaler_state->scaler_id);
+					 NULL, &scaler_state->scaler_id,
+					 intel_casf_needs_scaler(crtc_state));
 }
 
 static int setup_plane_scaler(struct intel_atomic_state *state,
@@ -558,7 +570,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
 	return intel_atomic_setup_scaler(crtc_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "PLANE", plane->base.base.id,
-					 plane_state, &plane_state->scaler_id);
+					 plane_state, &plane_state->scaler_id,
+					 false);
 }
 
 /**
-- 
2.25.1

