Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785985C818
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552E810E573;
	Tue, 20 Feb 2024 21:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzXpNARD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC1110E573;
 Tue, 20 Feb 2024 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463921; x=1739999921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EP3UJ9SXVPu+tLC2b5ZcMY8GjwhiyCr7KuGo8Jc1h2c=;
 b=KzXpNARDDRrPDXICnePTlo5g8CMYugCZ6QZYkci06LqiFscur2owgoFC
 MO8mSeoKTz/ay+feHHbUUdrcN2JRDIwEPNqO/dpj/Y/j4aKra6IVX/Yn4
 TobDU2hhUcQBGDY6K128yOLpYhbli6mmbq2RCVfIz8uf6fDvWtsxjPq8E
 fklKGJ8zv8iVI/5fnGoWU3gX6eNG0WUMZSSNFk8bTehI5ZXqw/usY9CCl
 aXofJ5BLEjUoqu6WdS/4cTFFVBE31UOcckFMRnhOdyffe3kQLDc3ctPpm
 ElW+NghYedlfAdO6pfHmE/y4KaO7YO/EhQVK9jPQWSnim+3oD6JgEXPAp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738667"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061618"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:39 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 13/21] drm/i915/dp: Add DP tunnel atomic state and check BW
 limit
Date: Tue, 20 Feb 2024 23:18:33 +0200
Message-Id: <20240220211841.448846-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the atomic state during a modeset required to enable the DP tunnel
BW allocation mode on links where such a tunnel was detected. This state
applies to an already enabled output, the state added for a newly
enabled output will be computed and added/cleared to/from the atomic
state in a follow-up patch.

v2:
- s/old_crtc_state/crtc_state in intel_crtc_duplicate_state().
- Move intel_dp_tunnel_atomic_cleanup_inherited_state() to a follow-up
  patch adding the corresponding state. (Ville)
- Move intel_dp_tunnel_atomic_clear_stream_bw() to a follow-up
  patch adding the corresponding state.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c  |  6 ++++++
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_link_bw.c |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 96ab37e158995..798cb90361a83 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -260,6 +260,10 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	if (crtc_state->post_csc_lut)
 		drm_property_blob_get(crtc_state->post_csc_lut);
 
+	if (crtc_state->dp_tunnel_ref.tunnel)
+		drm_dp_tunnel_ref_get(crtc_state->dp_tunnel_ref.tunnel,
+				      &crtc_state->dp_tunnel_ref);
+
 	crtc_state->update_pipe = false;
 	crtc_state->update_m_n = false;
 	crtc_state->update_lrr = false;
@@ -311,6 +315,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
 
 	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
 	intel_crtc_free_hw_state(crtc_state);
+	if (crtc_state->dp_tunnel_ref.tunnel)
+		drm_dp_tunnel_ref_put(&crtc_state->dp_tunnel_ref);
 	kfree(crtc_state);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e1a4200f67a7e..16973ebb7865d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -33,6 +33,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp_tunnel.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
@@ -73,6 +74,7 @@
 #include "intel_dp.h"
 #include "intel_dp_link_training.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_dpt.h"
@@ -4490,6 +4492,8 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
 	saved_state->crc_enabled = slave_crtc_state->crc_enabled;
 
 	intel_crtc_free_hw_state(slave_crtc_state);
+	if (slave_crtc_state->dp_tunnel_ref.tunnel)
+		drm_dp_tunnel_ref_put(&slave_crtc_state->dp_tunnel_ref);
 	memcpy(slave_crtc_state, saved_state, sizeof(*slave_crtc_state));
 	kfree(saved_state);
 
@@ -4505,6 +4509,10 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
 		      &master_crtc_state->hw.adjusted_mode);
 	slave_crtc_state->hw.scaling_filter = master_crtc_state->hw.scaling_filter;
 
+	if (master_crtc_state->dp_tunnel_ref.tunnel)
+		drm_dp_tunnel_ref_get(master_crtc_state->dp_tunnel_ref.tunnel,
+					&slave_crtc_state->dp_tunnel_ref);
+
 	copy_bigjoiner_crtc_state_nomodeset(state, slave_crtc);
 
 	slave_crtc_state->uapi.mode_changed = master_crtc_state->uapi.mode_changed;
@@ -5365,6 +5373,10 @@ static int intel_modeset_pipe(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	ret = intel_dp_tunnel_atomic_add_state_for_crtc(state, crtc);
+	if (ret)
+		return ret;
+
 	ret = intel_dp_mst_add_topology_state_for_crtc(state, crtc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
index 27ea858897c9f..dfd7d5e23f3fa 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
@@ -9,6 +9,7 @@
 #include "intel_crtc.h"
 #include "intel_display_types.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_fdi.h"
 #include "intel_link_bw.h"
 
@@ -163,6 +164,10 @@ static int check_all_link_config(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	ret = intel_dp_tunnel_atomic_check_link(state, limits);
+	if (ret)
+		return ret;
+
 	ret = intel_fdi_atomic_check_link(state, limits);
 	if (ret)
 		return ret;
-- 
2.39.2

