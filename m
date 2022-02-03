Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A94A80E5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236410E9DB;
	Thu,  3 Feb 2022 09:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2925310E9DB;
 Thu,  3 Feb 2022 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879079; x=1675415079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ai7S6qGkhi0r2HJwCoixRY9j4mHIN4UgaPGQtKixsdo=;
 b=ESx0enP3dmO5xRotKusqxpkYUbHg9s1b9hng01h/hjEaW0nwo08D+tJ0
 FEjsBlD8EsFPZzlQfLyxf2eVBnzFG5DwvyIgJb67K7XrTs3XDqxl2c3Ro
 YKiOD03/fkoMHM4qjmDOrlKI6oUhSE06stEpqAKHJCul4ZDu89tNmQNov
 cF1Tr00YMtutx/QHYhYCyapn2AJUFszbX7IRVyIqj4TtXvGEDDzWJDA9N
 KUVA/lvRNAZBS+dkkaqDNM2kk08T42sltaN5Xv/vhOhw1AusWeZDGeN4/
 kx7GPc3206hJj8CsVMrJequMXpvUadUKJUKvK9g9fxnkF35bNGsSHvT2k w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="246937089"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="246937089"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="699245338"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/i915/mst: update slot information for 128b/132b
Date: Thu,  3 Feb 2022 11:03:56 +0200
Message-Id: <fecbe3e9c93e33a16b24481432de5a524821677d.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
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

v2:
- Update in .compute_config() not .atomic_check (Ville)

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 +++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6b6eab507d30..2959e2c3930b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -99,6 +99,27 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	return 0;
 }
 
+static void intel_dp_mst_update_slots(struct intel_encoder *encoder,
+				      struct intel_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
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
+		return;
+	}
+
+	drm_dp_mst_update_slots(topology_state, link_coding_cap);
+}
+
 static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 				       struct intel_crtc_state *pipe_config,
 				       struct drm_connector_state *conn_state)
@@ -155,6 +176,8 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	if (ret)
 		return ret;
 
+	intel_dp_mst_update_slots(encoder, pipe_config, conn_state);
+
 	pipe_config->limited_color_range =
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
@@ -357,6 +380,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	int start_slot = intel_dp_is_uhbr(old_crtc_state) ? 0 : 1;
 	int ret;
 
 	drm_dbg_kms(&i915->drm, "active links %d\n",
@@ -366,7 +390,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
 	}
@@ -475,6 +499,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	int start_slot = intel_dp_is_uhbr(pipe_config) ? 0 : 1;
 	int ret;
 	bool first_mst_stream;
 
@@ -509,7 +534,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp->active_mst_links++;
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
 
 	/*
 	 * Before Gen 12 this is not done as part of
-- 
2.30.2

