Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE261470B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129410E355;
	Tue,  1 Nov 2022 09:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AE710E345;
 Tue,  1 Nov 2022 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667295752; x=1698831752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3kKhSuiu0kweSm5hMpoAWFQhT9N55ekQtn7yVRzUoH8=;
 b=DkMRTTgbrZ8o5bhI8TR0rtPSLxAKOMLgqr8SRyzcHKPm+6F+xHTGvf3G
 /M2zD/qqrg5w5ODpGTnqotGYZ+q3pzZmy4oruuaxJ3JDzp4g9sKfEDG0W
 rwQiffgsOAUgldJCn5hELCEK/IXFXS72NcFaOep6NWgg8d2TRt+jrPC0u
 2DPLR92D5Mq+GDA5kL5YCkCLVTSQF/kS52wblgCfn0/s3ry5eNlF//Lta
 FgMMrWenn2gWi7JVP2csl19jL7z7KMfxO2Jy91+U9b5RWTcyQsU6oSC7d
 +v+cM49VL5n+F3dHuf2hivVD5+uH/llDH+2marIVR7fDqVoOlDLY/JCoO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="373317434"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="373317434"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963076287"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="963076287"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 02:42:30 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to
 separate function
Date: Tue,  1 Nov 2022 11:42:19 +0200
Message-Id: <20221101094222.22091-4-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101094222.22091-1-stanislav.lisovskiy@intel.com>
References: <20221101094222.22091-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We would be using almost same code to loop through bpps while calling
drm_dp_atomic_find_vcpi_slots - lets remove this duplication by
introducing a new function intel_dp_mst_find_vcpi_slots_for_bpp

v2: Fix pbn_div calculation - shouldn't matter if its DSC or not.
v3: FIx rebase conflict, constant_n no longer needed.

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 48 +++++++++++++++------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 421bbcaed664..bdbb599cd48b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -44,10 +44,14 @@
 #include "intel_hotplug.h"
 #include "skl_scaler.h"
 
-static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
-					    struct intel_crtc_state *crtc_state,
-					    struct drm_connector_state *conn_state,
-					    struct link_config_limits *limits)
+static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
+						struct intel_crtc_state *crtc_state,
+						int max_bpp,
+						int min_bpp,
+						struct link_config_limits *limits,
+						struct drm_connector_state *conn_state,
+						int step,
+						bool dsc)
 {
 	struct drm_atomic_state *state = crtc_state->uapi.state;
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
@@ -71,18 +75,20 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	// TODO: Handle pbn_div changes by adding a new MST helper
 	if (!mst_state->pbn_div) {
 		mst_state->pbn_div = drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
-							      limits->max_rate,
-							      limits->max_lane_count);
+							      crtc_state->port_clock,
+							      crtc_state->lane_count);
 	}
 
-	for (bpp = limits->max_bpp; bpp >= limits->min_bpp; bpp -= 2 * 3) {
+	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
 		crtc_state->pipe_bpp = bpp;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       crtc_state->pipe_bpp,
-						       false);
+						       dsc ? bpp << 4 : crtc_state->pipe_bpp,
+						       dsc);
+
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
-						      connector->port, crtc_state->pbn);
+						      connector->port,
+						      crtc_state->pbn);
 		if (slots == -EDEADLK)
 			return slots;
 		if (slots >= 0) {
@@ -100,11 +106,29 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	if (ret && slots >= 0)
 		slots = ret;
 
-	if (slots < 0) {
+	if (slots < 0)
 		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
 			    slots);
+
+	return slots;
+}
+
+
+static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
+					    struct intel_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    struct link_config_limits *limits)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	int slots = -EINVAL;
+
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, limits->max_bpp,
+						     limits->min_bpp, limits,
+						     conn_state, 2 * 3, false);
+
+	if (slots < 0)
 		return slots;
-	}
 
 	intel_link_compute_m_n(crtc_state->pipe_bpp,
 			       crtc_state->lane_count,
-- 
2.37.3

