Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C219F4BA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085D6E34A;
	Mon,  6 Apr 2020 11:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000D6E348;
 Mon,  6 Apr 2020 11:37:21 +0000 (UTC)
IronPort-SDR: 5Q9MLp/qpXFQe1+6yD3CleIdKHpr7APU/ViPjAiRu4VyeEgbOUveJRRuqAc21YoJ2v6yht7AuY
 L5rxqNtjD9fA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:20 -0700
IronPort-SDR: 7lUCaMeXJYOCOls2YC9lmyy+TxNQBl0y5wwNcOHqcHp79C1Ae9wN49VNVlOzi+1/yGyQZ/+3AP
 BCbPAI085wgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192288"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:37:16 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH 03/18] drm/i915/display/ddi: Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:57:45 +0530
Message-Id: <20200406112800.23762-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN* over WARN* calls.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7184f3b8f091..353a32f5bf46 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2654,8 +2654,9 @@ static void tgl_ddi_vswing_sequence(struct intel_encoder *encoder,
 		tgl_dkl_phy_ddi_vswing_sequence(encoder, link_clock, level);
 }
 
-static u32 translate_signal_level(int signal_levels)
+static u32 translate_signal_level(struct intel_dp *intel_dp, int signal_levels)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(index_to_dp_signal_levels); i++) {
@@ -2663,8 +2664,9 @@ static u32 translate_signal_level(int signal_levels)
 			return i;
 	}
 
-	WARN(1, "Unsupported voltage swing/pre-emphasis level: 0x%x\n",
-	     signal_levels);
+	drm_WARN(&i915->drm, 1,
+		 "Unsupported voltage swing/pre-emphasis level: 0x%x\n",
+		 signal_levels);
 
 	return 0;
 }
@@ -2675,7 +2677,7 @@ static u32 intel_ddi_dp_level(struct intel_dp *intel_dp)
 	int signal_levels = train_set & (DP_TRAIN_VOLTAGE_SWING_MASK |
 					 DP_TRAIN_PRE_EMPHASIS_MASK);
 
-	return translate_signal_level(signal_levels);
+	return translate_signal_level(intel_dp, signal_levels);
 }
 
 u32 bxt_signal_levels(struct intel_dp *intel_dp)
@@ -3766,7 +3768,7 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
-	WARN_ON(crtc_state->has_pch_encoder);
+	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
 
 	intel_enable_pipe(crtc_state);
 
@@ -3877,7 +3879,7 @@ intel_ddi_update_prepare(struct intel_atomic_state *state,
 		crtc ? intel_atomic_get_new_crtc_state(state, crtc) : NULL;
 	int required_lanes = crtc_state ? crtc_state->lane_count : 1;
 
-	WARN_ON(crtc && crtc->active);
+	drm_WARN_ON(state->base.dev, crtc && crtc->active);
 
 	intel_tc_port_get_link(enc_to_dig_port(encoder),
 		               required_lanes);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
