Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C667C4ADC79
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E2610E189;
	Tue,  8 Feb 2022 15:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE810E189;
 Tue,  8 Feb 2022 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644333806; x=1675869806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TrHVYXAMBKHp7hUg20VQ1nt0bPRibRkoSabZl31CoCs=;
 b=iWBfaeIo9cawqYbsgdaCq7bB6zX6XUVcrD1mkcArIs5clbqN4bPiU3nS
 edFAdc7YUCBo0V8eKunisvyWHObOc8zLIT2eXtnXLQZqbgjYJmyZsf+gu
 oEAlbu8YgSc2IHXP9YIra2RhxqawdWDmXpI3m7mwiEh6w1oG1/VL5IvSc
 FvQCbY69UkI1mJ33v6MYLjkWryVq1oFjQ8mk1euCFsvaGqFDPL4UX6WAm
 49PNNCtlPG7e2AEK+V1ytlvoGIRVxcIQ48tnp5Qy9dN+V9HVQeCJlBYdL
 WsaiE47j8rvJ7DSM+vA6HtRce+ft//Fu2nVklhIgjfqELB/n7Xk0oe0Yy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="228937199"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="228937199"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:23:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="540640386"
Received: from ijbeckin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.19.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:23:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/mst: update slot information for 128b/132b
Date: Tue,  8 Feb 2022 17:23:17 +0200
Message-Id: <20220208152317.3019070-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <fecbe3e9c93e33a16b24481432de5a524821677d.1643878928.git.jani.nikula@intel.com>
References: <fecbe3e9c93e33a16b24481432de5a524821677d.1643878928.git.jani.nikula@intel.com>
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
Cc: uma.shankar@intel.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

128b/132b supports using 64 slots starting from 0, while 8b/10b reserves
slot 0 for metadata.

Commit d6c6a76f80a1 ("drm: Update MST First Link Slot Information Based
on Encoding Format") added support for updating the topology state
accordingly, and commit 41724ea273cd ("drm/amd/display: Add DP 2.0 MST
DM Support") started using it in the amd driver.

This feels more than a little cumbersome, especially updating the
information in atomic check. For i915, add the update to MST connector
.compute_config hook rather than iterating over all MST managers and
connectors in global mode config .atomic_check. Fingers crossed.

v3:
- Propagate errors from intel_dp_mst_update_slots() (Ville)

v2:
- Update in .compute_config() not .atomic_check (Ville)

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 33 +++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6b6eab507d30..e30e698aa684 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -99,6 +99,29 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	return 0;
 }
 
+static int intel_dp_mst_update_slots(struct intel_encoder *encoder,
+				     struct intel_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
+	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
+	struct drm_dp_mst_topology_state *topology_state;
+	u8 link_coding_cap = intel_dp_is_uhbr(crtc_state) ?
+		DP_CAP_ANSI_128B132B : DP_CAP_ANSI_8B10B;
+
+	topology_state = drm_atomic_get_mst_topology_state(conn_state->state, mgr);
+	if (IS_ERR(topology_state)) {
+		drm_dbg_kms(&i915->drm, "slot update failed\n");
+		return PTR_ERR(topology_state);
+	}
+
+	drm_dp_mst_update_slots(topology_state, link_coding_cap);
+
+	return 0;
+}
+
 static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 				       struct intel_crtc_state *pipe_config,
 				       struct drm_connector_state *conn_state)
@@ -155,6 +178,10 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	if (ret)
 		return ret;
 
+	ret = intel_dp_mst_update_slots(encoder, pipe_config, conn_state);
+	if (ret)
+		return ret;
+
 	pipe_config->limited_color_range =
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
@@ -357,6 +384,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	int start_slot = intel_dp_is_uhbr(old_crtc_state) ? 0 : 1;
 	int ret;
 
 	drm_dbg_kms(&i915->drm, "active links %d\n",
@@ -366,7 +394,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
 	}
@@ -475,6 +503,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	int start_slot = intel_dp_is_uhbr(pipe_config) ? 0 : 1;
 	int ret;
 	bool first_mst_stream;
 
@@ -509,7 +538,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp->active_mst_links++;
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
 
 	/*
 	 * Before Gen 12 this is not done as part of
-- 
2.30.2

