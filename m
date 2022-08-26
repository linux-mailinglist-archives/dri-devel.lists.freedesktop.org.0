Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219035A3114
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747610E6D7;
	Fri, 26 Aug 2022 21:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F1910E68E;
 Fri, 26 Aug 2022 21:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549717; x=1693085717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h5GLVAWn6TeUAI6z0ZQVoyQ3+H0lY8ShRy+X/nma/Pk=;
 b=GwoviN0EfcywR/GeEdoT/3wdPivukLFKGVTJZLZrzn20DrRCQPcJsCsi
 RI5gkSiSl2U6YxiCU/JzVgQKTd/lWvpNyoMJCiLcLwUL8L1OMG+8C5oQg
 9+giJ2slDJL9O3zcG4ADAKlEYEf4CDpJPEdZWTIqJNifpgRz0O69eaybP
 F+JUUFgnw49okGFvPCYsvOTainpTIz8FAMOrVEGgsa+aRLLwz/4plGhEy
 ghYS5l+VfIakRJZZD4ugEexKYTYMy2R/O611CjJVhhZUTLq4z011N9OyF
 z7S/5DNTOYpfgQn6HLBlhPtTIyh8o//qiu1BPvwIvaJCq50VGYtSTHz13 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="275002355"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="275002355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="671624275"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 26 Aug 2022 14:35:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/edid: s/monitor_rage/vrr_range/
Date: Sat, 27 Aug 2022 00:34:53 +0300
Message-Id: <20220826213501.31490-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename info->monitor_range to info->vrr_range to actually
reflect its usage.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++-----
 drivers/gpu/drm/drm_debugfs.c                 |  4 +--
 drivers/gpu/drm/drm_edid.c                    | 26 +++++++++----------
 drivers/gpu/drm/i915/display/intel_vrr.c      |  6 ++---
 include/drm/drm_connector.h                   |  4 +--
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e702f0d72d53..928b5b6541db 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9921,8 +9921,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
 		amdgpu_dm_connector->pixel_clock_mhz = 0;
-		connector->display_info.monitor_range.min_vfreq = 0;
-		connector->display_info.monitor_range.max_vfreq = 0;
+		connector->display_info.vrr_range.min_vfreq = 0;
+		connector->display_info.vrr_range.max_vfreq = 0;
 		freesync_capable = false;
 
 		goto update;
@@ -9970,8 +9970,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				amdgpu_dm_connector->pixel_clock_mhz =
 					range->pixel_clock_mhz * 10;
 
-				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
-				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
+				connector->display_info.vrr_range.min_vfreq = range->min_vfreq;
+				connector->display_info.vrr_range.max_vfreq = range->max_vfreq;
 
 				break;
 			}
@@ -9993,8 +9993,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
 				freesync_capable = true;
 
-			connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
-			connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
+			connector->display_info.vrr_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
+			connector->display_info.vrr_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
 		}
 	}
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 01ee3febb813..1437c798b122 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -377,8 +377,8 @@ static int vrr_range_show(struct seq_file *m, void *data)
 	if (connector->status != connector_status_connected)
 		return -ENODEV;
 
-	seq_printf(m, "Min: %u\n", connector->display_info.monitor_range.min_vfreq);
-	seq_printf(m, "Max: %u\n", connector->display_info.monitor_range.max_vfreq);
+	seq_printf(m, "Min: %u\n", connector->display_info.vrr_range.min_vfreq);
+	seq_printf(m, "Max: %u\n", connector->display_info.vrr_range.max_vfreq);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ac662495635c..4355d73632c3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6020,11 +6020,11 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 }
 
 static
-void get_monitor_range(const struct detailed_timing *timing, void *c)
+void get_vrr_range(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	struct drm_display_info *info = &closure->connector->display_info;
-	struct drm_monitor_range_info *monitor_range = &info->monitor_range;
+	struct drm_monitor_range_info *vrr_range = &info->vrr_range;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
 	const struct detailed_data_monitor_range *range = &data->data.range;
 	const struct edid *edid = closure->drm_edid->edid;
@@ -6044,19 +6044,19 @@ void get_monitor_range(const struct detailed_timing *timing, void *c)
 	if (range->flags != DRM_EDID_RANGE_LIMITS_ONLY_FLAG)
 		return;
 
-	monitor_range->min_vfreq = range->min_vfreq;
-	monitor_range->max_vfreq = range->max_vfreq;
+	vrr_range->min_vfreq = range->min_vfreq;
+	vrr_range->max_vfreq = range->max_vfreq;
 
 	if (edid->revision >= 4) {
 		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
-			monitor_range->min_vfreq += 255;
+			vrr_range->min_vfreq += 255;
 		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
-			monitor_range->max_vfreq += 255;
+			vrr_range->max_vfreq += 255;
 	}
 }
 
-static void drm_get_monitor_range(struct drm_connector *connector,
-				  const struct drm_edid *drm_edid)
+static void drm_get_vrr_range(struct drm_connector *connector,
+			      const struct drm_edid *drm_edid)
 {
 	const struct drm_display_info *info = &connector->display_info;
 	struct detailed_mode_closure closure = {
@@ -6067,11 +6067,11 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 	if (!version_greater(drm_edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
+	drm_for_each_detailed_block(drm_edid, get_vrr_range, &closure);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-		      info->monitor_range.min_vfreq,
-		      info->monitor_range.max_vfreq);
+		      info->vrr_range.min_vfreq,
+		      info->vrr_range.max_vfreq);
 }
 
 static void drm_parse_vesa_mso_data(struct drm_connector *connector,
@@ -6164,7 +6164,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->edid_hdmi_ycbcr444_dc_modes = 0;
 
 	info->non_desktop = 0;
-	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
+	memset(&info->vrr_range, 0, sizeof(info->vrr_range));
 	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
 
 	info->mso_stream_count = 0;
@@ -6184,7 +6184,7 @@ static u32 update_display_info(struct drm_connector *connector,
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
-	drm_get_monitor_range(connector, drm_edid);
+	drm_get_vrr_range(connector, drm_edid);
 
 	if (edid->revision < 3)
 		goto out;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 04250a0fec3c..15bc9b9f2b27 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -38,7 +38,7 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
 	}
 
 	return HAS_VRR(i915) &&
-		info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > 10;
+		info->vrr_range.max_vfreq - info->vrr_range.min_vfreq > 10;
 }
 
 void
@@ -117,9 +117,9 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		return;
 
 	vmin = DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000,
-			    adjusted_mode->crtc_htotal * info->monitor_range.max_vfreq);
+			    adjusted_mode->crtc_htotal * info->vrr_range.max_vfreq);
 	vmax = adjusted_mode->crtc_clock * 1000 /
-		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
+		(adjusted_mode->crtc_htotal * info->vrr_range.min_vfreq);
 
 	vmin = max_t(int, vmin, adjusted_mode->crtc_vtotal);
 	vmax = max_t(int, vmax, adjusted_mode->crtc_vtotal);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 56aee949c6fa..7ae23d691cd6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -636,9 +636,9 @@ struct drm_display_info {
 	bool non_desktop;
 
 	/**
-	 * @monitor_range: Frequency range supported by monitor range descriptor
+	 * @vrr_range: Refresh rate range supported by monitor for VRR
 	 */
-	struct drm_monitor_range_info monitor_range;
+	struct drm_monitor_range_info vrr_range;
 
 	/**
 	 * @luminance_range: Luminance range supported by panel
-- 
2.35.1

