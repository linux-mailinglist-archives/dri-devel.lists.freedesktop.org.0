Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11485C803
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C6C89861;
	Tue, 20 Feb 2024 21:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mm/fsBFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F7610E0C2;
 Tue, 20 Feb 2024 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463907; x=1739999907;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w09dI6gT4hNbI12hWYMOdmt0/0tvc5tgOc9aqSgscR8=;
 b=mm/fsBFNiphx1YcQFBYnInDaN7fM5o8hVxoIHifR0Df4Gtf3YWoyzz/B
 xA2yLMHifDp/+atTVRIsOkWO6UHyixLMUpHfwTTLb1Nlm2/Y+f0bBJlHz
 PV8b3pf6USH/LxejS3p5SuvJmF20WaLsoxuWro/M+AAlLmmCDGuyCnhiM
 ei1FcmpQ7sHnhyj8W61Np/sAuKbxGXnREiLEjQ79bZAkwXNDLaiYpn1rw
 8wKznFqaxAagwQxGYXxmIfwejP/9hxLhyMCau2WPZJx3ybdjBwyWc2NXE
 Id2QdqOXz9kY251gnYqglo4WaT16FvHwm6gGaAhKmAEVz45IEYH4CbNWv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738648"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061580"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:25 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/21] drm/i915: Fix display bpp limit computation during
 system resume
Date: Tue, 20 Feb 2024 23:18:23 +0200
Message-Id: <20240220211841.448846-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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

The system resume display mode restoration should happen with an output
configuration matching that of the suspend time saved mode. Since the
restored mode configuration is subject to the bpp fallback logic,
starting out with an unlimited bpp and reducing the bpp as required by
any (MST) link BW limit, the resulting bpp will match the one during
suspend only if the BW limit checks during suspend and resume are
applied in an identical way. The latter is not guaranteed at the moment,
since the pre-suspend MST topology may not be in place during resume
(for instance if the MST sink was disconnected while being suspended),
which makes the MST link BW check accept the unlimited bpp mode
configuration unconditionally without ensuring that the required BW fits
into the available MST link BW.

To fix the above, initialize the bpp fallback logic with the max link
bpp / force-FEC limits left behind by the suspend time mode save.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  3 +--
 drivers/gpu/drm/i915/display/intel_link_bw.c | 22 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_link_bw.h |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 00ac65a140298..485c38d71f106 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6252,12 +6252,11 @@ static int intel_atomic_check_config(struct intel_atomic_state *state,
 
 static int intel_atomic_check_config_and_link(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	struct intel_link_bw_limits new_limits;
 	struct intel_link_bw_limits old_limits;
 	int ret;
 
-	intel_link_bw_init_limits(i915, &new_limits);
+	intel_link_bw_init_limits(state, &new_limits);
 	old_limits = new_limits;
 
 	while (true) {
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
index 9c6d35a405a18..27ea858897c9f 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_display_types.h"
 #include "intel_dp_mst.h"
 #include "intel_fdi.h"
@@ -13,19 +14,32 @@
 
 /**
  * intel_link_bw_init_limits - initialize BW limits
- * @i915: device instance
+ * @state: Atomic state
  * @limits: link BW limits
  *
  * Initialize @limits.
  */
-void intel_link_bw_init_limits(struct drm_i915_private *i915, struct intel_link_bw_limits *limits)
+void intel_link_bw_init_limits(struct intel_atomic_state *state,
+			       struct intel_link_bw_limits *limits)
 {
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	enum pipe pipe;
 
 	limits->force_fec_pipes = 0;
 	limits->bpp_limit_reached_pipes = 0;
-	for_each_pipe(i915, pipe)
-		limits->max_bpp_x16[pipe] = INT_MAX;
+	for_each_pipe(i915, pipe) {
+		const struct intel_crtc_state *crtc_state =
+			intel_atomic_get_new_crtc_state(state,
+							intel_crtc_for_pipe(i915, pipe));
+
+		if (state->base.duplicated && crtc_state) {
+			limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
+			if (crtc_state->fec_enable)
+				limits->force_fec_pipes |= BIT(pipe);
+		} else {
+			limits->max_bpp_x16[pipe] = INT_MAX;
+		}
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.h b/drivers/gpu/drm/i915/display/intel_link_bw.h
index 2cf57307cc249..6b0ccfff59dab 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.h
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.h
@@ -22,7 +22,7 @@ struct intel_link_bw_limits {
 	int max_bpp_x16[I915_MAX_PIPES];
 };
 
-void intel_link_bw_init_limits(struct drm_i915_private *i915,
+void intel_link_bw_init_limits(struct intel_atomic_state *state,
 			       struct intel_link_bw_limits *limits);
 int intel_link_bw_reduce_bpp(struct intel_atomic_state *state,
 			     struct intel_link_bw_limits *limits,
-- 
2.39.2

