Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F85847197
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC2410E789;
	Fri,  2 Feb 2024 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQ+gqw7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8010E789;
 Fri,  2 Feb 2024 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706882754; x=1738418754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7mbjOiSJ1A8QUlgvTDR3hKFx5pFHY6tio4Sj8qAGXmw=;
 b=hQ+gqw7rmorQian68kKeU6WmaFPFEwtY02q+473LFOf3KOMEKAd/z2y+
 VZTffiAYXfjun1h4MK8Se52WxjKXUvhWjbdjV5cRkt+0SkqygFu2uglJ9
 ZqHV+w6enh5hpARq8uQhyBmEhK1jgBS9x35XSffZC5agb85kPQAuzUVQ/
 jw/4swYnUPLYTuU04iSeoy7nDGF0VwiuzSwfZWS7NeOSAAxqPyACg7upW
 OQyTqBTd7/HYxho0Xq8yePpVzATtS8Z1G4WNobmuthuaDAxa47ZgjNSW1
 7S/uZme+1hdApyyE2DRiFbyWQXiJcE2tTd+PmB4k9OVTobqYfrb17vGwN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17578424"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17578424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="23367441"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:05:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [RFC 1/4] drm/mst: read sideband messaging cap
Date: Fri,  2 Feb 2024 16:05:31 +0200
Message-Id: <6c846638f986eed60395ce0fa8f41e21a61ce045.1706882590.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706882590.git.jani.nikula@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amend drm_dp_read_mst_cap() to return an enum, indicating "none",
"sideband messaging", or "mst". Modify all call sites to take the new
return value into account.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
 4 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f7c6b60629c2..a68a6c8a2495 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3603,24 +3603,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
 
 /**
- * drm_dp_read_mst_cap() - check whether or not a sink supports MST
+ * drm_dp_read_mst_cap() - Read the sink's MST mode capability
  * @aux: The DP AUX channel to use
  * @dpcd: A cached copy of the DPCD capabilities for this sink
  *
- * Returns: %True if the sink supports MST, %false otherwise
+ * Returns: enum drm_dp_mst_mode to indicate MST mode capability
  */
-bool drm_dp_read_mst_cap(struct drm_dp_aux *aux,
-			 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
+					 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	u8 mstm_cap;
 
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
-		return false;
+		return DP_MST_NONE;
 
 	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
-		return false;
+		return DP_MST_NONE;
+
+	if (mstm_cap & DP_MST_CAP)
+		return DP_MST_CAPABLE;
+
+	if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
+		return DP_MST_SIDEBAND_MSG;
 
-	return mstm_cap & DP_MST_CAP;
+	return DP_MST_NONE;
 }
 EXPORT_SYMBOL(drm_dp_read_mst_cap);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ab415f41924d..7af09f2c008d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4011,7 +4011,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
 
 	return i915->display.params.enable_dp_mst &&
 		intel_dp_mst_source_support(intel_dp) &&
-		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
 }
 
 static void
@@ -4020,7 +4020,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_encoder *encoder =
 		&dp_to_dig_port(intel_dp)->base;
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 7de7707ec6a8..d180d22dbab0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	if (nouveau_mst) {
 		mstm = outp->dp.mstm;
 		if (mstm)
-			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
+			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd) == DP_MST_CAPABLE;
 	}
 
 	if (nouveau_dp_has_sink_count(connector, outp)) {
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..db48016b2aed 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -818,7 +818,28 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 
-bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+/**
+ * enum drm_dp_mst_mode - sink's MST mode capability
+ */
+enum drm_dp_mst_mode {
+	/**
+	 * @DP_MST_NONE: The sink does not support MST nor single stream
+	 * sideband messaging.
+	 */
+	DP_MST_NONE,
+	/**
+	 * @DP_MST_CAPABLE: Sink supports MST, more than one stream and single
+	 * stream sideband messaging.
+	 */
+	DP_MST_CAPABLE,
+	/**
+	 * @DP_MST_SIDEBAND_MSG: Sink supports only one stream and single stream
+	 * sideband messaging.
+	 */
+	DP_MST_SIDEBAND_MSG,
+};
+
+enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
 
 int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
-- 
2.39.2

