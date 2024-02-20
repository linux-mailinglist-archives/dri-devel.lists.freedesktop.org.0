Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8585C82D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C1F10E588;
	Tue, 20 Feb 2024 21:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUi5j3Z4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C000510E591;
 Tue, 20 Feb 2024 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463931; x=1739999931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sSIwUdE2y8YPdYQljKM3sWeDUqAcsoJn0p+5vf+EGz4=;
 b=eUi5j3Z4v6CvU7RYpyhQ+yYXx7ZNAzBzOab1oFrTfCn3a8++JmxNfQGE
 BBbWLNVOWNchioPoT0xQI+KLVqhZ0r6qBKTgaJM03FNwhN871NP/BWX0P
 hnHUAH1jsJa1413PLZTWvnLHvZCCoxPGVvj9nJwZ+3QMrmKkF9JQN38SA
 9L2TAu9ZVYI50Xf5zJDwhw7cV04ecRaweCS8+D7vbruxEgNJ8RnECGCYD
 l0OXg2GuRnm2zC25ehSt5rhqz3xjh4iyUUdHg7jTVPbq3hFQwGnk7tmf4
 rgz629CDGB9NAdKg8poOYNutUGDIPM9paFu0OO14U/JAg+lek7P5sXJI9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738682"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061655"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:49 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/21] drm/i915/dp: Enable DP tunnel BW allocation mode
Date: Tue, 20 Feb 2024 23:18:41 +0200
Message-Id: <20240220211841.448846-22-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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
index 4f7ba7eb03d27..87dd07e0d138d 100644
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
@@ -434,10 +435,8 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 
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
@@ -457,6 +456,10 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
+	ret = intel_dp_tunnel_mgr_init(i915);
+	if (ret)
+		goto err_hdcp;
+
 	intel_display_driver_disable_user_access(i915);
 
 	drm_modeset_lock_all(dev);
@@ -475,6 +478,13 @@ int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
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
@@ -599,6 +609,8 @@ void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 
 	intel_mode_config_cleanup(i915);
 
+	intel_dp_tunnel_mgr_cleanup(i915);
+
 	intel_overlay_cleanup(i915);
 
 	intel_gmbus_teardown(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f7f8bd5742ad4..789b5fa074fd0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5726,6 +5726,7 @@ intel_dp_detect(struct drm_connector *connector,
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
 	enum drm_connector_status status;
+	int ret;
 
 	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.id, connector->name);
@@ -5761,9 +5762,18 @@ intel_dp_detect(struct drm_connector *connector,
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
@@ -5794,8 +5804,6 @@ intel_dp_detect(struct drm_connector *connector,
 	 * with an IRQ_HPD, so force a link status check.
 	 */
 	if (!intel_dp_is_edp(intel_dp)) {
-		int ret;
-
 		ret = intel_dp_retrain_link(encoder, ctx);
 		if (ret)
 			return ret;
@@ -5935,6 +5943,8 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder)
 
 	intel_dp_mst_encoder_cleanup(dig_port);
 
+	intel_dp_tunnel_destroy(intel_dp);
+
 	intel_pps_vdd_off_sync(intel_dp);
 
 	/*
-- 
2.39.2

