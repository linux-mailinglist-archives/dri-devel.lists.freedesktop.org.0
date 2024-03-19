Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09D87FA79
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A6510F8B8;
	Tue, 19 Mar 2024 09:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MotpkK50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4ED10F8BC;
 Tue, 19 Mar 2024 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839585; x=1742375585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oimg/3tJ3SUDn3YN9ahp7dpj5f9XoHvLgB9jzXRMP/I=;
 b=MotpkK50rHEQoHCKx0ZFFfWV7KU/yDah/sziK85ArVWa2o/uTaW+aZDE
 C+4l7adL6MxE2Xz5Wu/+4cu7FVPmNbHfHsW7zAZubL5JIrdaO6bmFmij8
 GX5VCeflvQZdVkmh/Q6jhN1R4uprRwxkHnsTcjSdfQH5YUl8Vdm+Vt+S1
 p1PBlSAfWD4B+bczaoXuvecdJP+3yjmGUsE9Aksa5y+ezAXpb5f9f8ssx
 tQ0Gd0vh/zW0QUkSkPOHk1YJ3etBvDaXcTmqE7LVWdiKrYYkcHah/E+Y/
 hjj9vwfGVEmS0OqSyjbuPiRsA2xr8NY+2HlIPw/J7OwMxwVkWq4KuZjpZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238027"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13780632"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [RESEND v3 1/6] drm/mst: read sideband messaging cap
Date: Tue, 19 Mar 2024 11:12:48 +0200
Message-Id: <b32a3704934871a67d06420b760e148b76c5ced8.1710839496.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710839496.git.jani.nikula@intel.com>
References: <cover.1710839496.git.jani.nikula@intel.com>
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

Amend drm_dp_read_mst_cap() to return an enum, indicating "SST", "SST
with sideband messaging", or "MST". Modify all call sites to take the
new return value into account.

v2:
- Rename enumerators (Ville)

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
 4 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 03d528209426..c193be3577f7 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3608,24 +3608,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
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
+		return DRM_DP_SST;
 
 	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
-		return false;
+		return DRM_DP_SST;
+
+	if (mstm_cap & DP_MST_CAP)
+		return DRM_DP_MST;
+
+	if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
+		return DRM_DP_SST_SIDEBAND_MSG;
 
-	return mstm_cap & DP_MST_CAP;
+	return DRM_DP_SST;
 }
 EXPORT_SYMBOL(drm_dp_read_mst_cap);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index af7ca00e9bc0..91c42949ac7e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4046,7 +4046,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
 
 	return i915->display.params.enable_dp_mst &&
 		intel_dp_mst_source_support(intel_dp) &&
-		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
 }
 
 static void
@@ -4055,7 +4055,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_encoder *encoder =
 		&dp_to_dig_port(intel_dp)->base;
-	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
+	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
 
 	drm_dbg_kms(&i915->drm,
 		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 7de7707ec6a8..fb06ee17d9e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	if (nouveau_mst) {
 		mstm = outp->dp.mstm;
 		if (mstm)
-			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
+			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd) == DRM_DP_MST;
 	}
 
 	if (nouveau_dp_has_sink_count(connector, outp)) {
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 3ae88a383a41..cbcb49cb6a46 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -817,7 +817,28 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 
-bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+/**
+ * enum drm_dp_mst_mode - sink's MST mode capability
+ */
+enum drm_dp_mst_mode {
+	/**
+	 * @DRM_DP_SST: The sink does not support MST nor single stream sideband
+	 * messaging.
+	 */
+	DRM_DP_SST,
+	/**
+	 * @DRM_DP_MST: Sink supports MST, more than one stream and single
+	 * stream sideband messaging.
+	 */
+	DRM_DP_MST,
+	/**
+	 * @DRM_DP_SST_SIDEBAND_MSG: Sink supports only one stream and single
+	 * stream sideband messaging.
+	 */
+	DRM_DP_SST_SIDEBAND_MSG,
+};
+
+enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
 
 int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
-- 
2.39.2

