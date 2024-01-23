Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925E838C05
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B532A10E771;
	Tue, 23 Jan 2024 10:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F0610F1CC;
 Tue, 23 Jan 2024 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005742; x=1737541742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ngK8DbMOjRxFGZtNEZQQS0UanG2SGPN4yFHJBBsiczE=;
 b=JHfLWQ/iX+ni9sSHYeaY3sZRdRCRzINfF1AtniKuyI6dnJ0dNttUf7nI
 NhjyS02EcOsw8DUqpLP9A9Ot6Bj0tm2VQsi0qLJUCAriZ7QWhiYpXhnER
 dNUlhpmZdMkWFa6x16sxERJpRzv1AMYC2lVrdfBLyXKpspIZ8KQzl972q
 wXIqZ+Om5kE6UYaHF6OjfiTUCxEX42glf6yS7U73z6aeCojEYJB6/+9au
 OhYxNfgK/0xOnIEtns+WRqfCq6CuPzX15m2AsbCVz2y4hjDn3veEkYnWl
 F0tz+0hfM4l8knZbF3i1SIHfXUqeW7EWPJn2G1MnFzl9RQWxBooQo/INB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134314"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134314"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283492"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283492"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:29:00 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915/dp: Enable DP tunnel BW allocation mode
Date: Tue, 23 Jan 2024 12:28:50 +0200
Message-Id: <20240123102850.390126-20-imre.deak@intel.com>
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

Detect DP tunnels and enable the BW allocation mode on them. Send a
hotplug notification to userspace in response to a BW change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../drm/i915/display/intel_display_driver.c   | 20 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.c       | 14 +++++++++++--
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index ecf9cb74734b6..62987b8427f7b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -35,6 +35,7 @@
 #include "intel_dkl_phy.h"
 #include "intel_dmc.h"
 #include "intel_dp.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_fb.h"
@@ -435,10 +436,8 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 
 	for_each_pipe(i915, pipe) {
 		ret = intel_crtc_init(i915, pipe);
-		if (ret) {
-			intel_mode_config_cleanup(i915);
-			return ret;
-		}
+		if (ret)
+			goto err_mode_config;
 	}
 
 	intel_plane_possible_crtcs_init(i915);
@@ -460,6 +459,10 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
+	ret = intel_dp_tunnel_mgr_init(i915);
+	if (ret)
+		goto err_hdcp;
+
 	intel_display_driver_disable_user_access(i915);
 
 	drm_modeset_lock_all(dev);
@@ -482,6 +485,13 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 		ilk_wm_sanitize(i915);
 
 	return 0;
+
+err_hdcp:
+	intel_hdcp_component_fini(i915);
+err_mode_config:
+	intel_mode_config_cleanup(i915);
+
+	return ret;
 }
 
 /* part #3: call after gem init */
@@ -598,6 +608,8 @@ void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 
 	intel_mode_config_cleanup(i915);
 
+	intel_dp_tunnel_mgr_cleanup(i915);
+
 	intel_overlay_cleanup(i915);
 
 	intel_gmbus_teardown(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bc138a54f8d7b..6133266d78276 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5752,6 +5752,7 @@ intel_dp_detect(struct drm_connector *connector,
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
 	enum drm_connector_status status;
+	int ret;
 
 	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.id, connector->name);
@@ -5787,9 +5788,18 @@ intel_dp_detect(struct drm_connector *connector,
 							intel_dp->is_mst);
 		}
 
+		intel_dp_tunnel_disconnect(intel_dp);
+
 		goto out;
 	}
 
+	ret = intel_dp_tunnel_detect(intel_dp, ctx);
+	if (ret == -EDEADLK)
+		return ret;
+
+	if (ret == 1)
+		intel_connector->base.epoch_counter++;
+
 	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
 
 	intel_dp_configure_mst(intel_dp);
@@ -5820,8 +5830,6 @@ intel_dp_detect(struct drm_connector *connector,
 	 * with an IRQ_HPD, so force a link status check.
 	 */
 	if (!intel_dp_is_edp(intel_dp)) {
-		int ret;
-
 		ret = intel_dp_retrain_link(encoder, ctx);
 		if (ret)
 			return ret;
@@ -5961,6 +5969,8 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder)
 
 	intel_dp_mst_encoder_cleanup(dig_port);
 
+	intel_dp_tunnel_destroy(intel_dp);
+
 	intel_pps_vdd_off_sync(intel_dp);
 
 	/*
-- 
2.39.2

