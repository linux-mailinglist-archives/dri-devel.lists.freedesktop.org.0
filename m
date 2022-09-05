Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355525ACE54
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67310E247;
	Mon,  5 Sep 2022 08:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B176910E218;
 Mon,  5 Sep 2022 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662368222; x=1693904222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOX3+j2FO8TLHuzwfvF6IdNOcGsO9OsgzO2ct+qiEWI=;
 b=eXAQtcSQHnljGxBwozl6XGc+J8Uyn/3GnHn1cXRoCz0exF9PU1Pq/11X
 N0M303d6GDNuDcybaRe4edGowPgaLlto0BKNrrG3ZvNnPmqigqQU0TDlZ
 4Jf9YDIpfIS4lnGvD3++LefbdlFLlhlN9sUKL/urEEMZyy5kBN89cNKY6
 1t67uXUQrwIZXtwiC7hRj/vm5NMG+yps5A6sW5XmTWUlCvjtTWFRB2HF8
 d9hZfiAWeTNUB58L5HHCotGcsN+/5KWhDOKRkItsLg+Yr59GsE6w/Fo6N
 fXe1TKskLujikrwpaz2/bla1zl1hIbBl1uxOwk8R7YJ5IpXvwIAJoZc3E g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296347062"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="296347062"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="755961733"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2022 01:57:00 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to
 separate function
Date: Mon,  5 Sep 2022 11:57:43 +0300
Message-Id: <20220905085744.29637-4-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
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

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 52 +++++++++++++++------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 24d6a287a6e3..79ac23495165 100644
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
@@ -58,7 +62,6 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
 	int ret = 0;
 
@@ -72,18 +75,20 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
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
@@ -101,11 +106,32 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
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
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
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

