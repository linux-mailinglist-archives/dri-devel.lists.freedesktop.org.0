Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B615FB3DF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CED10E50D;
	Tue, 11 Oct 2022 13:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A3210E821;
 Tue, 11 Oct 2022 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496292; x=1697032292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bm1Hm+pVe2bIa38rgIiw4hwFLES+dSS7isESFXmlWLQ=;
 b=Cot3z16Lvhnus9cosjILLGYci9ECV0aBmEr3CXHv9O3tD1RhLhGTzixa
 PP49M+5wjH4RGZ310o9WYjtsj7MCI9cLTNyLssccjlsAa5AO7oZ+R8UxP
 oiUf6wjC4GjCC/Vep7Mj2Wf/mP08nmEjFTcsHcAIuH//Wxx4wUnbuEgdB
 YexQQgi9bjc+5enJtIc+3D0HxOJ6Guyq2NGIBxLSeMdiu6tmVXbTV0sCz
 c3MG+FOIl0x5p/cAMuVJn5zBt+aqoDuLRV/AQv4+LMASr7fwr2f4NHkym
 KYBfQozJk0kNLvbAA2j84Id3bGgis0AnviIrSqwI0snDLp8pM3Net4ZxQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="330988645"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="330988645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:51:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="604150662"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="604150662"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:51:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/15] drm/edid: convert to device specific logging
Date: Tue, 11 Oct 2022 16:49:49 +0300
Message-Id: <86764202b71c0cff306bb9110c5818a0979c2b23.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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

Convert to drm_kms_dbg/drm_err where possible, and unify the rest of the
debugs to DRM_DEBUG_KMS.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 105 ++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 935bdf4e6269..09b0b8337382 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1979,7 +1979,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 
 	status = edid_block_check(block, is_base_block);
 	if (status == EDID_BLOCK_HEADER_REPAIR) {
-		DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
+		DRM_DEBUG_KMS("Fixing EDID header, your hardware may be failing\n");
 		edid_header_fix(block);
 
 		/* Retry with fixed header, update status if that worked. */
@@ -2281,8 +2281,9 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
 
 		drm_edid_free(override);
 
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
-			      connector->base.id, connector->name, num_modes);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
+			    connector->base.id, connector->name, num_modes);
 	}
 
 	return num_modes;
@@ -3389,17 +3390,16 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 		return NULL;
 
 	if (pt->misc & DRM_EDID_PT_STEREO) {
-		DRM_DEBUG_KMS("stereo mode not supported\n");
+		drm_dbg_kms(dev, "Stereo mode not supported\n");
 		return NULL;
 	}
 	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
-		DRM_DEBUG_KMS("composite sync not supported\n");
+		drm_dbg_kms(dev, "Composite sync not supported\n");
 	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
-		DRM_DEBUG_KMS("Incorrect Detailed timing. "
-				"Wrong Hsync/Vsync pulse width\n");
+		drm_dbg_kms(dev, "Incorrect Detailed timing. Wrong Hsync/Vsync pulse width\n");
 		return NULL;
 	}
 
@@ -4643,7 +4643,7 @@ static int add_hdmi_mode(struct drm_connector *connector, u8 vic)
 	struct drm_display_mode *newmode;
 
 	if (!drm_valid_hdmi_vic(vic)) {
-		DRM_ERROR("Unknown HDMI VIC: %d\n", vic);
+		drm_err(connector->dev, "Unknown HDMI VIC: %d\n", vic);
 		return 0;
 	}
 
@@ -5288,8 +5288,8 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	if (mode->clock == clock)
 		return;
 
-	DRM_DEBUG("detailed mode matches %s VIC %d, adjusting clock %d -> %d\n",
-		  type, vic, mode->clock, clock);
+	DRM_DEBUG_KMS("detailed mode matches %s VIC %d, adjusting clock %d -> %d\n",
+		      type, vic, mode->clock, clock);
 	mode->clock = clock;
 }
 
@@ -5397,15 +5397,11 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
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
+		    "HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
+		    connector->latency_present[0], connector->latency_present[1],
+		    connector->video_latency[0], connector->video_latency[1],
+		    connector->audio_latency[0], connector->audio_latency[1]);
 }
 
 static void
@@ -5503,7 +5499,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 		return;
 
 	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
-	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	drm_dbg_kms(connector->dev, "ELD monitor %s\n",
+		    &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
 	eld[DRM_ELD_CEA_EDID_VER_MNL] |= mnl;
@@ -5557,8 +5554,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_BASELINE_ELD_LEN] =
 		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
 
-	DRM_DEBUG_KMS("ELD size %d, SAD count %d\n",
-		      drm_eld_size(eld), total_sad_count);
+	drm_dbg_kms(connector->dev, "ELD size %d, SAD count %d\n",
+		    drm_eld_size(eld), total_sad_count);
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
@@ -5829,7 +5826,7 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	DRM_DEBUG_KMS("CEA VCDB 0x%02x\n", db[2]);
+	drm_dbg_kms(connector->dev, "CEA VCDB 0x%02x\n", db[2]);
 
 	if (db[2] & EDID_CEA_VCDB_QS)
 		info->rgb_quant_range_selectable = true;
@@ -6031,39 +6028,39 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
-		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: HDMI sink does deep color 30.\n",
+			    connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
-		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: HDMI sink does deep color 36.\n",
+			    connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
-		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: HDMI sink does deep color 48.\n",
+			    connector->name);
 	}
 
 	if (dc_bpc == 0) {
-		DRM_DEBUG("%s: No deep color support on this HDMI sink.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: No deep color support on this HDMI sink.\n",
+			    connector->name);
 		return;
 	}
 
-	DRM_DEBUG("%s: Assigning HDMI sink color depth as %d bpc.\n",
-		  connector->name, dc_bpc);
+	drm_dbg_kms(connector->dev, "%s: Assigning HDMI sink color depth as %d bpc.\n",
+		    connector->name, dc_bpc);
 	info->bpc = dc_bpc;
 
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
 		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
-		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: HDMI sink does YCRCB444 in deep color.\n",
+			    connector->name);
 	}
 
 	/*
@@ -6071,8 +6068,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * then deep color 36 bit must be supported.
 	 */
 	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
-		DRM_DEBUG("%s: HDMI sink should do DC_36, but does not!\n",
-			  connector->name);
+		drm_dbg_kms(connector->dev, "%s: HDMI sink should do DC_36, but does not!\n",
+			    connector->name);
 	}
 }
 
@@ -6089,10 +6086,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	if (len >= 7)
 		info->max_tmds_clock = db[7] * 5000;
 
-	DRM_DEBUG_KMS("HDMI: DVI dual %d, "
-		      "max TMDS clock %d kHz\n",
-		      info->dvi_dual,
-		      info->max_tmds_clock);
+	drm_dbg_kms(connector->dev, "HDMI: DVI dual %d, max TMDS clock %d kHz\n",
+		    info->dvi_dual, info->max_tmds_clock);
 
 	drm_parse_hdmi_deep_color_info(connector, db);
 }
@@ -6134,8 +6129,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->cea_rev = edid_ext[1];
 
 		if (info->cea_rev != edid_ext[1])
-			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
-				      info->cea_rev, edid_ext[1]);
+			drm_dbg_kms(connector->dev, "CEA extension version mismatch %u != %u\n",
+				    info->cea_rev, edid_ext[1]);
 
 		/* The existence of a CTA extension should imply RGB support */
 		info->color_formats = DRM_COLOR_FORMAT_RGB444;
@@ -6221,9 +6216,8 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
 
-	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-		      info->monitor_range.min_vfreq,
-		      info->monitor_range.max_vfreq);
+	drm_dbg_kms(connector->dev, "Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
+		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
 }
 
 static void drm_parse_vesa_mso_data(struct drm_connector *connector,
@@ -6357,8 +6351,8 @@ static u32 update_display_info(struct drm_connector *connector,
 	if (info->bpc == 0 && edid->revision == 3 &&
 	    edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
 		info->bpc = 8;
-		DRM_DEBUG("%s: Assigning DFP sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+		drm_dbg_kms(connector->dev, "%s: Assigning DFP sink color depth as %d bpc.\n",
+			    connector->name, info->bpc);
 	}
 
 	/* Only defined for 1.4 with digital displays */
@@ -6390,8 +6384,8 @@ static u32 update_display_info(struct drm_connector *connector,
 		break;
 	}
 
-	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+	drm_dbg_kms(connector->dev, "%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
+		    connector->name, info->bpc);
 
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
@@ -7090,11 +7084,12 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 	connector->tile_h_size = w + 1;
 	connector->tile_v_size = h + 1;
 
-	DRM_DEBUG_KMS("tile cap 0x%x\n", tile->tile_cap);
-	DRM_DEBUG_KMS("tile_size %d x %d\n", w + 1, h + 1);
-	DRM_DEBUG_KMS("topo num tiles %dx%d, location %dx%d\n",
-		      num_h_tile + 1, num_v_tile + 1, tile_h_loc, tile_v_loc);
-	DRM_DEBUG_KMS("vend %c%c%c\n", tile->topology_id[0], tile->topology_id[1], tile->topology_id[2]);
+	drm_dbg_kms(connector->dev, "tile cap 0x%x\n", tile->tile_cap);
+	drm_dbg_kms(connector->dev, "tile_size %d x %d\n", w + 1, h + 1);
+	drm_dbg_kms(connector->dev, "topo num tiles %dx%d, location %dx%d\n",
+		    num_h_tile + 1, num_v_tile + 1, tile_h_loc, tile_v_loc);
+	drm_dbg_kms(connector->dev, "vend %c%c%c\n", tile->topology_id[0],
+		    tile->topology_id[1], tile->topology_id[2]);
 
 	tg = drm_mode_get_tile_group(connector->dev, tile->topology_id);
 	if (!tg)
-- 
2.34.1

