Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE24E90F7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975E110EB3A;
	Mon, 28 Mar 2022 09:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056310EAD7;
 Mon, 28 Mar 2022 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459071; x=1679995071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FH09TiMnMimO+UYp1HS9yZX42SvCC57EQLh9OARm9RM=;
 b=Dye+cCDxXyIcsL86qc49xGfQM/m3+Yq0PmCXp0mCXftwHJb1rCq3goxP
 SY9O0OuJmgtTXKg7uUnayL/g7j0ZqsrpJXDnwA/c/LX2pROeXA2/T8Wb7
 hjdalrNUPNljidvVwTz6gY3srJWq+s0pBnd07dpBvR0ARGxLlXKG66uAp
 g2UtuCCJzdGWB1pE6u7K1UBYTA3sCtK8LNV6IIFalPJXIye7CmrpsXFda
 L3pJGCV50M9jhWhbG+PMCoJ/tBkeiJusjxsQKiM1Mxlr4PfiCN/cA6iji
 /SSM76fKZYo8Ct4TiQetuMP43Hb1/NYM/qjIcf+WWgLQC4fpR/fOiYT+X g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="257783810"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="257783810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="517949979"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/11] drm/edid: slightly restructure timing and non-timing
 descriptor structs
Date: Mon, 28 Mar 2022 12:17:17 +0300
Message-Id: <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pixel clock is conceptually part of the detailed timings, while it's
just zero padding for display descriptors. Modify the structures to
reflect this. Rename struct detailed_non_pixel to
edid_display_descriptor to better reflect spec while at it. (Further
struct renames are left for follow-up work.)

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +++---
 drivers/gpu/drm/drm_edid.c                        | 12 ++++++------
 include/drm/drm_edid.h                            |  9 +++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b30656959fd8..e477f4b42b6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11537,7 +11537,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 {
 	int i = 0;
 	struct detailed_timing *timing;
-	struct detailed_non_pixel *data;
+	struct edid_display_descriptor *data;
 	struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
@@ -11592,7 +11592,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			for (i = 0; i < 4; i++) {
 
 				timing	= &edid->detailed_timings[i];
-				data	= &timing->data.other_data;
+				data	= &timing->data.descriptor;
 				range	= &data->data.range;
 				/*
 				 * Check if monitor has continuous frequency mode
@@ -11629,7 +11629,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
 			timing  = &edid->detailed_timings[i];
-			data    = &timing->data.other_data;
+			data    = &timing->data.descriptor;
 
 			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13d05062d68c..ac80681d64f6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2742,7 +2742,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 	if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
 		mode->clock = 1088 * 10;
 	else
-		mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
+		mode->clock = le16_to_cpu(pt->pixel_clock) * 10;
 
 	mode->hdisplay = hactive;
 	mode->hsync_start = mode->hdisplay + hsync_offset;
@@ -2984,7 +2984,7 @@ static void
 do_inferred_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
+	struct edid_display_descriptor *data = &timing->data.descriptor;
 	struct detailed_data_monitor_range *range = &data->data.range;
 
 	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
@@ -3117,7 +3117,7 @@ static void
 do_standard_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
+	struct edid_display_descriptor *data = &timing->data.descriptor;
 	struct drm_connector *connector = closure->connector;
 	struct edid *edid = closure->edid;
 	int i;
@@ -3187,7 +3187,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 	for (i = 0; i < 4; i++) {
 		int width, height;
 
-		cvt = &(timing->data.other_data.data.cvt[i]);
+		cvt = &(timing->data.descriptor.data.cvt[i]);
 
 		if (!memcmp(cvt->code, empty, 3))
 			continue;
@@ -4494,7 +4494,7 @@ monitor_name(struct detailed_timing *t, void *data)
 	if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR_NAME))
 		return;
 
-	*(u8 **)data = t->data.other_data.data.str.str;
+	*(u8 **)data = t->data.descriptor.data.str.str;
 }
 
 static int get_monitor_name(struct edid *edid, char name[13])
@@ -5223,7 +5223,7 @@ void get_monitor_range(struct detailed_timing *timing,
 		       void *info_monitor_range)
 {
 	struct drm_monitor_range_info *monitor_range = info_monitor_range;
-	const struct detailed_non_pixel *data = &timing->data.other_data;
+	const struct edid_display_descriptor *data = &timing->data.descriptor;
 	const struct detailed_data_monitor_range *range = &data->data.range;
 
 	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..8e322ef173a8 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -68,6 +68,7 @@ struct std_timing {
 
 /* If detailed data is pixel timing */
 struct detailed_pixel_timing {
+	__le16 pixel_clock; /* non-zero, need to multiply by 10 KHz */
 	u8 hactive_lo;
 	u8 hblank_lo;
 	u8 hactive_hblank_hi;
@@ -142,8 +143,9 @@ struct cvt_timing {
 	u8 code[3];
 } __attribute__((packed));
 
-struct detailed_non_pixel {
-	u8 pad1;
+struct edid_display_descriptor {
+	u16 pad0; /* 0 for Display Descriptor */
+	u8 pad1; /* 0 for Display Descriptor */
 	u8 type; /* ff=serial, fe=string, fd=monitor range, fc=monitor name
 		    fb=color point data, fa=standard timing data,
 		    f9=undefined, f8=mfg. reserved */
@@ -168,10 +170,9 @@ struct detailed_non_pixel {
 #define EDID_DETAIL_MONITOR_SERIAL 0xff
 
 struct detailed_timing {
-	__le16 pixel_clock; /* need to multiply by 10 KHz */
 	union {
 		struct detailed_pixel_timing pixel_data;
-		struct detailed_non_pixel other_data;
+		struct edid_display_descriptor descriptor;
 	} data;
 } __attribute__((packed));
 
-- 
2.30.2

