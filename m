Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D265A2414
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930F10E7D4;
	Fri, 26 Aug 2022 09:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587DD10E7D1;
 Fri, 26 Aug 2022 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505583; x=1693041583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vp0Urg4qiwUDn6AvML0AlsVHmP234UTFv+54S+inO7M=;
 b=lCWGhVa+nGM4GuD2mSy+QFqmzZG+UN11OYenmqBp2gPKJhNtNM321Pge
 1SbmueaSlkglw7oPKcs+Qs0i2DbrpciVo61sI/HOnrMz+4M4Gy8BFFKxR
 /fyvXc/krNsPwxnDVWv4urpajMdKC+bJwp1Y9PhExSjXPfJNIotWr4PZv
 qIPYiNpL4dB5y5M2EHPm6v0wriUxJj3TYdavkUZmmetK9TcmsHbmz68vG
 bzk7k0sWjWj8IAtCysv6RZH7CDK5hYvUr+NgCq/0Ueb+XZsrpJd2nrM1x
 9AKIPBjbkoQ3gmQRdUGCKVlEwPky+mh1b+RQhtzLJvgnvbIpbNP1NkN9G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274217132"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="274217132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="752816388"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 02:19:40 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to
 separate function
Date: Fri, 26 Aug 2022 12:20:19 +0300
Message-Id: <20220826092019.23151-5-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
References: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
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

We are using almost same code to loop through bpps while calling
drm_dp_atomic_find_vcpi_slots - lets remove this duplication by
introducing a new function intel_dp_mst_find_vcpi_slots_for_bpp

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 85 +++++++++++----------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 630450bd22a2..b393c97f3fb8 100644
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
@@ -57,26 +61,26 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
 	int ret = 0;
 
 	crtc_state->lane_count = limits->max_lane_count;
 	crtc_state->port_clock = limits->max_rate;
 
-	for (bpp = limits->max_bpp; bpp >= limits->min_bpp; bpp -= 2 * 3) {
+	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
 		crtc_state->pipe_bpp = bpp;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       crtc_state->pipe_bpp,
-						       false);
+						       dsc ? bpp << 4 : crtc_state->pipe_bpp,
+						       dsc);
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
 						      connector->port,
 						      crtc_state->pbn,
-						      drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
-									       crtc_state->port_clock,
-									       crtc_state->lane_count));
+						      !dsc ? drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
+										   crtc_state->port_clock,
+										   crtc_state->lane_count)
+							   : 0);
 		if (slots == -EDEADLK)
 			return slots;
 		if (slots >= 0) {
@@ -94,11 +98,32 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
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
@@ -116,25 +141,21 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 						struct drm_connector_state *conn_state,
 						struct link_config_limits *limits)
 {
-	struct drm_atomic_state *state = crtc_state->uapi.state;
-	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
-	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
 					   DP_DPCD_QUIRK_CONSTANT_N);
-	int bpp, slots = -EINVAL;
+	int slots = -EINVAL;
 	int i, num_bpc;
 	u8 dsc_bpc[3] = {0};
 	int min_bpp, max_bpp;
 	u8 dsc_max_bpc;
 
-	crtc_state->lane_count = limits->max_lane_count;
-	crtc_state->port_clock = limits->max_rate;
-
 	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
 	if (DISPLAY_VER(i915) >= 12)
 		dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
@@ -155,29 +176,11 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
 		    min_bpp, max_bpp);
 
-	for (bpp = max_bpp; bpp >= min_bpp; bpp -= 2 * 3) {
-		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       bpp << 4,
-						       true);
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp, min_bpp,
+						     limits, conn_state, 2 * 3, true);
 
-		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
-						      connector->port,
-						      crtc_state->pbn, 0);
-
-		drm_dbg_kms(&i915->drm, "Trying bpp %d got %d pbn %d slots\n",
-			    bpp, crtc_state->pbn, slots);
-
-		if (slots == -EDEADLK)
-			return slots;
-		if (slots >= 0)
-			break;
-	}
-
-	if (slots < 0) {
-		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
-			    slots);
+	if (slots < 0)
 		return slots;
-	}
 
 	intel_link_compute_m_n(crtc_state->pipe_bpp,
 			       crtc_state->lane_count,
-- 
2.24.1.485.gad05a3d8e5

