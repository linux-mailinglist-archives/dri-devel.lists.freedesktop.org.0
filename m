Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1427860A66A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B510E52A;
	Mon, 24 Oct 2022 12:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F4410E4A9;
 Mon, 24 Oct 2022 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614903; x=1698150903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZnZVruDtD58WqTTNmVvyWtzKCvoneCmffBU7B35X4dU=;
 b=dSEXtsLiDZlnU633BzScUWI0fWOw+aCyyitcIgSNojcFK3BRzsBq/HQ+
 d/lgT3qJsLtAOOLkxXP6vyDjWDbHwMPd2UUh7tPjfAleSKOlTUT7iP8pd
 pU58+m04KilTzSLOb1gmxO78/68z30IE7oJbNln4fBoLeMxUZ3iyPcBSo
 hkufT4YHsiAzHCG/MOWR7v3c2JJlmngSsRNFF3RDfGFaW8n7/YZiae+jB
 pIxB9PYKedsicqOn6gAU2BO3FJRQ3mTOEsEVnnAHd6y+Aljv7Kk5kJtjs
 uOQ1T6SeUQwmvyB9v2dnrWA8MpkCZVnPNwxi6pSd4vd5Oq/JsobYjRPg/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="309091586"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="309091586"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:35:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633693923"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633693923"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:35:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/16] drm/edid: convert to device specific logging
Date: Mon, 24 Oct 2022 15:33:44 +0300
Message-Id: <e48346bfe09a632d5a5faa55e3c161b196cf21e8.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to drm_kms_dbg/drm_err where possible, and reference the
connector using [CONNECTOR:%d:%s]. Pass connectors around a bit more to
enable this. Where this is not possible, unify the rest of the debugs to
DRM_DEBUG_KMS.

Rewrite tile debug logging to one line while at it.

v2:
- Use [CONNECTOR:%d:%s] throughout (Ville)
- Tile debug logging revamp
- Pass connector around a bit more

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 137 +++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3be98ac2e711..b2d61c05f559 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1979,7 +1979,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 
 	status = edid_block_check(block, is_base_block);
 	if (status == EDID_BLOCK_HEADER_REPAIR) {
-		DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
+		DRM_DEBUG_KMS("Fixing EDID header, your hardware may be failing\n");
 		edid_header_fix(block);
 
 		/* Retry with fixed header, update status if that worked. */
@@ -2301,8 +2301,9 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
 
 		drm_edid_free(override);
 
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
-			      connector->base.id, connector->name, num_modes);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
+			    connector->base.id, connector->name, num_modes);
 	}
 
 	return num_modes;
@@ -3388,11 +3389,12 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * timing block contains enough info for us to create and return a new struct
  * drm_display_mode.
  */
-static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
+static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connector,
 						  const struct drm_edid *drm_edid,
 						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
+	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
 	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
 	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
@@ -3409,17 +3411,19 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 		return NULL;
 
 	if (pt->misc & DRM_EDID_PT_STEREO) {
-		DRM_DEBUG_KMS("stereo mode not supported\n");
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Stereo mode not supported\n",
+			    connector->base.id, connector->name);
 		return NULL;
 	}
 	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
-		DRM_DEBUG_KMS("composite sync not supported\n");
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
+			    connector->base.id, connector->name);
 	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
-		DRM_DEBUG_KMS("Incorrect Detailed timing. "
-				"Wrong Hsync/Vsync pulse width\n");
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Incorrect Detailed timing. Wrong Hsync/Vsync pulse width\n",
+			    connector->base.id, connector->name);
 		return NULL;
 	}
 
@@ -3976,7 +3980,8 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 	return closure.modes;
 }
 
-static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode);
+static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
+					  struct drm_display_mode *mode);
 
 static void
 do_detailed_mode(const struct detailed_timing *timing, void *c)
@@ -3987,7 +3992,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 	if (!is_detailed_timing_descriptor(timing))
 		return;
 
-	newmode = drm_mode_detailed(closure->connector->dev,
+	newmode = drm_mode_detailed(closure->connector,
 				    closure->drm_edid, timing,
 				    closure->quirks);
 	if (!newmode)
@@ -4001,7 +4006,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 	 * so fix up anything that looks like CEA/HDMI mode, but the clock
 	 * is just slightly off.
 	 */
-	fixup_detailed_cea_mode_clock(newmode);
+	fixup_detailed_cea_mode_clock(closure->connector, newmode);
 
 	drm_mode_probed_add(closure->connector, newmode);
 	closure->modes++;
@@ -4663,7 +4668,8 @@ static int add_hdmi_mode(struct drm_connector *connector, u8 vic)
 	struct drm_display_mode *newmode;
 
 	if (!drm_valid_hdmi_vic(vic)) {
-		DRM_ERROR("Unknown HDMI VIC: %d\n", vic);
+		drm_err(connector->dev, "[CONNECTOR:%d:%s] Unknown HDMI VIC: %d\n",
+			connector->base.id, connector->name, vic);
 		return 0;
 	}
 
@@ -5270,7 +5276,8 @@ static int add_cea_modes(struct drm_connector *connector,
 	return modes;
 }
 
-static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
+static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
+					  struct drm_display_mode *mode)
 {
 	const struct drm_display_mode *cea_mode;
 	int clock1, clock2, clock;
@@ -5308,8 +5315,10 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	if (mode->clock == clock)
 		return;
 
-	DRM_DEBUG("detailed mode matches %s VIC %d, adjusting clock %d -> %d\n",
-		  type, vic, mode->clock, clock);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] detailed mode matches %s VIC %d, adjusting clock %d -> %d\n",
+		    connector->base.id, connector->name,
+		    type, vic, mode->clock, clock);
 	mode->clock = clock;
 }
 
@@ -5417,15 +5426,12 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 	if (len >= 12)
 		connector->audio_latency[1] = db[12];
 
-	DRM_DEBUG_KMS("HDMI: latency present %d %d, "
-		      "video latency %d %d, "
-		      "audio latency %d %d\n",
-		      connector->latency_present[0],
-		      connector->latency_present[1],
-		      connector->video_latency[0],
-		      connector->video_latency[1],
-		      connector->audio_latency[0],
-		      connector->audio_latency[1]);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
+		    connector->base.id, connector->name,
+		    connector->latency_present[0], connector->latency_present[1],
+		    connector->video_latency[0], connector->video_latency[1],
+		    connector->audio_latency[0], connector->audio_latency[1]);
 }
 
 static void
@@ -5523,7 +5529,9 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 		return;
 
 	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
-	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
+		    connector->base.id, connector->name,
+		    &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
 	eld[DRM_ELD_CEA_EDID_VER_MNL] |= mnl;
@@ -5577,8 +5585,9 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_BASELINE_ELD_LEN] =
 		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
 
-	DRM_DEBUG_KMS("ELD size %d, SAD count %d\n",
-		      drm_eld_size(eld), total_sad_count);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
+		    connector->base.id, connector->name,
+		    drm_eld_size(eld), total_sad_count);
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
@@ -5849,7 +5858,8 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	DRM_DEBUG_KMS("CEA VCDB 0x%02x\n", db[2]);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] CEA VCDB 0x%02x\n",
+		    connector->base.id, connector->name, db[2]);
 
 	if (db[2] & EDID_CEA_VCDB_QS)
 		info->rgb_quant_range_selectable = true;
@@ -6052,39 +6062,39 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
-		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
+			    connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
-		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
+			    connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
-		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
+			    connector->base.id, connector->name);
 	}
 
 	if (dc_bpc == 0) {
-		DRM_DEBUG("%s: No deep color support on this HDMI sink.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] No deep color support on this HDMI sink.\n",
+			    connector->base.id, connector->name);
 		return;
 	}
 
-	DRM_DEBUG("%s: Assigning HDMI sink color depth as %d bpc.\n",
-		  connector->name, dc_bpc);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Assigning HDMI sink color depth as %d bpc.\n",
+		    connector->base.id, connector->name, dc_bpc);
 	info->bpc = dc_bpc;
 
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
 		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
-		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
+			    connector->base.id, connector->name);
 	}
 
 	/*
@@ -6092,8 +6102,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * then deep color 36 bit must be supported.
 	 */
 	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
-		DRM_DEBUG("%s: HDMI sink should do DC_36, but does not!\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
+			    connector->base.id, connector->name);
 	}
 }
 
@@ -6110,10 +6120,9 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	if (len >= 7)
 		info->max_tmds_clock = db[7] * 5000;
 
-	DRM_DEBUG_KMS("HDMI: DVI dual %d, "
-		      "max TMDS clock %d kHz\n",
-		      info->dvi_dual,
-		      info->max_tmds_clock);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
+		    connector->base.id, connector->name,
+		    info->dvi_dual, info->max_tmds_clock);
 
 	drm_parse_hdmi_deep_color_info(connector, db);
 }
@@ -6156,8 +6165,10 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->cea_rev = edid_ext[1];
 
 		if (info->cea_rev != edid_ext[1])
-			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
-				      info->cea_rev, edid_ext[1]);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] CEA extension version mismatch %u != %u\n",
+				    connector->base.id, connector->name,
+				    info->cea_rev, edid_ext[1]);
 
 		/* The existence of a CTA extension should imply RGB support */
 		info->color_formats = DRM_COLOR_FORMAT_RGB444;
@@ -6243,9 +6254,10 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
 
-	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-		      info->monitor_range.min_vfreq,
-		      info->monitor_range.max_vfreq);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
+		    connector->base.id, connector->name,
+		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
 }
 
 static void drm_parse_vesa_mso_data(struct drm_connector *connector,
@@ -6387,8 +6399,9 @@ static u32 update_display_info(struct drm_connector *connector,
 	if (info->bpc == 0 && edid->revision == 3 &&
 	    edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
 		info->bpc = 8;
-		DRM_DEBUG("%s: Assigning DFP sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Assigning DFP sink color depth as %d bpc.\n",
+			    connector->base.id, connector->name, info->bpc);
 	}
 
 	/* Only defined for 1.4 with digital displays */
@@ -6420,8 +6433,9 @@ static u32 update_display_info(struct drm_connector *connector,
 		break;
 	}
 
-	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
+		    connector->base.id, connector->name, info->bpc);
 
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
@@ -7121,11 +7135,14 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 	connector->tile_h_size = w + 1;
 	connector->tile_v_size = h + 1;
 
-	DRM_DEBUG_KMS("tile cap 0x%x\n", tile->tile_cap);
-	DRM_DEBUG_KMS("tile_size %d x %d\n", w + 1, h + 1);
-	DRM_DEBUG_KMS("topo num tiles %dx%d, location %dx%d\n",
-		      num_h_tile + 1, num_v_tile + 1, tile_h_loc, tile_v_loc);
-	DRM_DEBUG_KMS("vend %c%c%c\n", tile->topology_id[0], tile->topology_id[1], tile->topology_id[2]);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] tile cap 0x%x, size %dx%d, num tiles %dx%d, location %dx%d, vend %c%c%c",
+		    connector->base.id, connector->name,
+		    tile->tile_cap,
+		    connector->tile_h_size, connector->tile_v_size,
+		    connector->num_h_tile, connector->num_v_tile,
+		    connector->tile_h_loc, connector->tile_v_loc,
+		    tile->topology_id[0], tile->topology_id[1], tile->topology_id[2]);
 
 	tg = drm_mode_get_tile_group(connector->dev, tile->topology_id);
 	if (!tg)
-- 
2.34.1

