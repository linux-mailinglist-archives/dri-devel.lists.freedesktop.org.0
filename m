Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2B838C01
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CABC10F3B5;
	Tue, 23 Jan 2024 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817A10F0BD;
 Tue, 23 Jan 2024 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005734; x=1737541734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7xpb78w/2Yw3osL4wy9TVDVvfMoWyzygfmfTVp2JLA=;
 b=Bh1SBGqiCRHpXb8vfcMpH3SjQ5jnll3wA6zxDyMp3i8Jfpeu8pKr2WDG
 kH3bZMzix3bEwtwyngUGH+pmw0w2pwc88pbvI1yzaKBbEL+Dou5hzbYXi
 WTopG61HXMzDZoqzOgOps5cOAB9MeJdV4T00NyQufmIvaA2YXyiFZQQLQ
 sc9tekeqZSkYN5rWfvS5z6Lp+sqv08zZHA5zSRurpdckpAuDbTOV77mGM
 hnEC/BraroWXWovL+cucfp5Cfo7qsGb5oPUCuBAj7i9j4QgbXRk9JWIhA
 Nm/1jmG4yY+m1BNl6i1FoVjxgYvBWxsTLImMmSl6r4Eo5inG13NpxcKQ0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134233"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283420"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283420"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:53 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915/dp: Account for tunnel BW limit in
 intel_dp_max_link_data_rate()
Date: Tue, 23 Jan 2024 12:28:44 +0200
Message-Id: <20240123102850.390126-14-imre.deak@intel.com>
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

Take any link BW limitation into account in
intel_dp_max_link_data_rate(). Such a limitation can be due to multiple
displays on (Thunderbolt) links with DP tunnels sharing the link BW.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 323475569ee7f..78dfe8be6031d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -63,6 +63,7 @@
 #include "intel_dp_hdcp.h"
 #include "intel_dp_link_training.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpio_phy.h"
 #include "intel_dpll.h"
 #include "intel_fifo_underrun.h"
@@ -152,6 +153,22 @@ int intel_dp_link_symbol_clock(int rate)
 	return DIV_ROUND_CLOSEST(rate * 10, intel_dp_link_symbol_size(rate));
 }
 
+static int max_dprx_rate(struct intel_dp *intel_dp)
+{
+	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
+		return drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
+
+	return drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
+}
+
+static int max_dprx_lane_count(struct intel_dp *intel_dp)
+{
+	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
+		return drm_dp_tunnel_max_dprx_lane_count(intel_dp->tunnel);
+
+	return drm_dp_max_lane_count(intel_dp->dpcd);
+}
+
 static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
 {
 	intel_dp->sink_rates[0] = 162000;
@@ -180,7 +197,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	/*
 	 * Sink rates for 8b/10b.
 	 */
-	max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
+	max_rate = max_dprx_rate(intel_dp);
 	max_lttpr_rate = drm_dp_lttpr_max_link_rate(intel_dp->lttpr_common_caps);
 	if (max_lttpr_rate)
 		max_rate = min(max_rate, max_lttpr_rate);
@@ -259,7 +276,7 @@ static void intel_dp_set_max_sink_lane_count(struct intel_dp *intel_dp)
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &intel_dig_port->base;
 
-	intel_dp->max_sink_lane_count = drm_dp_max_lane_count(intel_dp->dpcd);
+	intel_dp->max_sink_lane_count = max_dprx_lane_count(intel_dp);
 
 	switch (intel_dp->max_sink_lane_count) {
 	case 1:
@@ -389,14 +406,21 @@ int intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
  * @max_dprx_rate: Maximum data rate of the DPRX
  * @max_dprx_lanes: Maximum lane count of the DPRX
  *
- * Calculate the maximum data rate for the provided link parameters.
+ * Calculate the maximum data rate for the provided link parameters taking into
+ * account any BW limitations by a DP tunnel attached to @intel_dp.
  *
  * Returns the maximum data rate in kBps units.
  */
 int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
 				int max_dprx_rate, int max_dprx_lanes)
 {
-	return drm_dp_max_dprx_data_rate(max_dprx_rate, max_dprx_lanes);
+	int max_rate = drm_dp_max_dprx_data_rate(max_dprx_rate, max_dprx_lanes);
+
+	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
+		max_rate = min(max_rate,
+			       drm_dp_tunnel_available_bw(intel_dp->tunnel));
+
+	return max_rate;
 }
 
 bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
-- 
2.39.2

