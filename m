Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940F838BF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9010F385;
	Tue, 23 Jan 2024 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D31110F1A0;
 Tue, 23 Jan 2024 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005737; x=1737541737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bKiIHUhiJwfYKGSAl6H8TfHiQ517TTsOb5MKB3Z9Ba4=;
 b=COQxUclQME4quSK3/+lqLoKpmXOxcKrokVqwf8MvHzp9U9hJHk6tjHpb
 vWFeccPdpcgDkzdYb4ZVIH8XwO09FxVZlm7gXHRzMtngccWCnWsLud1Zm
 YCKlmcpo7c5H4+ATo5ImxM7skIvt2srp638ryvomnwv2apAXDJA6mYwFQ
 9AC7cK8EF+PgME9nNCUnZz5aCVdXlq7u/ZkJXJsD7WY4lGFpp4quI/Yu7
 wH50OnElE//MWzdCyPomoeZzsPF+OvCJz5SkbqewaYJnBIiJeAFXGpGIB
 w0mVqlQpS+X0Xj+vZKVHzyXwmbmwSZPcUJI056IHnMSWIw++rPLuwlUU1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134263"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134263"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283431"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283431"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:56 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/19] drm/i915/dp: Allocate/free DP tunnel BW in the encoder
 enable/disable hooks
Date: Tue, 23 Jan 2024 12:28:46 +0200
Message-Id: <20240123102850.390126-16-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate and free the DP tunnel BW required by a stream while
enabling/disabling the stream during a modeset.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c    | 28 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi.c |  7 ++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index dfe0b07a122d1..1e498e1510adf 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -19,6 +19,7 @@
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_dp_link_training.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpio_phy.h"
 #include "intel_fifo_underrun.h"
 #include "intel_hdmi.h"
@@ -729,6 +730,24 @@ static void vlv_enable_dp(struct intel_atomic_state *state,
 	encoder->audio_enable(encoder, pipe_config, conn_state);
 }
 
+static void g4x_dp_pre_pll_enable(struct intel_atomic_state *state,
+				  struct intel_encoder *encoder,
+				  const struct intel_crtc_state *new_crtc_state,
+				  const struct drm_connector_state *new_conn_state)
+{
+	intel_dp_tunnel_atomic_alloc_bw(state, encoder,
+					new_crtc_state, new_conn_state);
+}
+
+static void g4x_dp_post_pll_disable(struct intel_atomic_state *state,
+				    struct intel_encoder *encoder,
+				    const struct intel_crtc_state *old_crtc_state,
+				    const struct drm_connector_state *old_conn_state)
+{
+	intel_dp_tunnel_atomic_free_bw(state, encoder,
+				       old_crtc_state, old_conn_state);
+}
+
 static void g4x_pre_enable_dp(struct intel_atomic_state *state,
 			      struct intel_encoder *encoder,
 			      const struct intel_crtc_state *pipe_config,
@@ -762,6 +781,8 @@ static void vlv_dp_pre_pll_enable(struct intel_atomic_state *state,
 	intel_dp_prepare(encoder, pipe_config);
 
 	vlv_phy_pre_pll_enable(encoder, pipe_config);
+
+	g4x_dp_pre_pll_enable(state, encoder, pipe_config, conn_state);
 }
 
 static void chv_pre_enable_dp(struct intel_atomic_state *state,
@@ -785,6 +806,8 @@ static void chv_dp_pre_pll_enable(struct intel_atomic_state *state,
 	intel_dp_prepare(encoder, pipe_config);
 
 	chv_phy_pre_pll_enable(encoder, pipe_config);
+
+	g4x_dp_pre_pll_enable(state, encoder, pipe_config, conn_state);
 }
 
 static void chv_dp_post_pll_disable(struct intel_atomic_state *state,
@@ -792,6 +815,8 @@ static void chv_dp_post_pll_disable(struct intel_atomic_state *state,
 				    const struct intel_crtc_state *old_crtc_state,
 				    const struct drm_connector_state *old_conn_state)
 {
+	g4x_dp_post_pll_disable(state, encoder, old_crtc_state, old_conn_state);
+
 	chv_phy_post_pll_disable(encoder, old_crtc_state);
 }
 
@@ -1349,11 +1374,14 @@ bool g4x_dp_init(struct drm_i915_private *dev_priv,
 		intel_encoder->enable = vlv_enable_dp;
 		intel_encoder->disable = vlv_disable_dp;
 		intel_encoder->post_disable = vlv_post_disable_dp;
+		intel_encoder->post_pll_disable = g4x_dp_post_pll_disable;
 	} else {
+		intel_encoder->pre_pll_enable = g4x_dp_pre_pll_enable;
 		intel_encoder->pre_enable = g4x_pre_enable_dp;
 		intel_encoder->enable = g4x_enable_dp;
 		intel_encoder->disable = g4x_disable_dp;
 		intel_encoder->post_disable = g4x_post_disable_dp;
+		intel_encoder->post_pll_disable = g4x_dp_post_pll_disable;
 	}
 	intel_encoder->audio_enable = g4x_dp_audio_enable;
 	intel_encoder->audio_disable = g4x_dp_audio_disable;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 922194b957be2..aa6e7da08fbce 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -54,6 +54,7 @@
 #include "intel_dp_aux.h"
 #include "intel_dp_link_training.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpio_phy.h"
 #include "intel_dsi.h"
 #include "intel_fdi.h"
@@ -3141,6 +3142,9 @@ static void intel_ddi_post_pll_disable(struct intel_atomic_state *state,
 
 	main_link_aux_power_domain_put(dig_port, old_crtc_state);
 
+	intel_dp_tunnel_atomic_free_bw(state, encoder,
+				       old_crtc_state, old_conn_state);
+
 	if (is_tc_port)
 		intel_tc_port_put_link(dig_port);
 }
@@ -3480,6 +3484,9 @@ intel_ddi_pre_pll_enable(struct intel_atomic_state *state,
 		intel_ddi_update_active_dpll(state, encoder, master_crtc);
 	}
 
+	intel_dp_tunnel_atomic_alloc_bw(state, encoder,
+					crtc_state, conn_state);
+
 	main_link_aux_power_domain_get(dig_port, crtc_state);
 
 	if (is_tc_port && !intel_tc_port_in_tbt_alt_mode(dig_port))
-- 
2.39.2

