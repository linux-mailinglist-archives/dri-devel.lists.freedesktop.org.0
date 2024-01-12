Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52182C3F3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044610E128;
	Fri, 12 Jan 2024 16:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374D10E10F;
 Fri, 12 Jan 2024 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078217; x=1736614217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Oz/lIdi/PqeRNXBpQJDPBiqV0EdZoRAVZhtXLiJMrw=;
 b=KGUEUHCe5ce2k6Td9zURsqbmzgkllS8ZLOGae8r8/ruD7l3L7bARnaze
 xnmBeX93VJygZcFnd7Lmuv7VXtuBmcHLnTPUl8owmrGZoIX9RIBYOxIz2
 Wt5kNc8rh2Rfu5GTPK/AOA/2+r/uw4lJoUwPeCNjKrfRG3HEsY6GA+21c
 pjYA33BT/FQJXaSVVe+mHUedHWIKzL7dz1yqVfCWkusyvLlc49k2kYEpz
 cDrCmHBMJziawoFpOD9cBFzem3HuSXt8+itEhFC9CmmIMJVqznDomvGLB
 8mu91xu0MhPsE8MWXlVYMiWEADlpuRg8xJ9gVoeYLWVSGsth7UfwmmqDM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12583282"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12583282"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776044186"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="776044186"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/radeon: convert to using is_hdmi and has_audio from
 display info
Date: Fri, 12 Jan 2024 18:49:54 +0200
Message-Id: <2668b2904f5d781b2e354a932fe76e632448919b.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Xinhui <Xinhui.Pan@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi and has_audio in display info over
calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
respectively.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/radeon/atombios_encoders.c | 10 +++++-----
 drivers/gpu/drm/radeon/evergreen_hdmi.c    |  5 ++---
 drivers/gpu/drm/radeon/radeon_audio.c      |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c   |  4 ++--
 6 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 6e537c5bd295..386fd5f0a762 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -701,7 +701,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 			if (radeon_connector->use_digital &&
 			    (radeon_connector->audio == RADEON_AUDIO_ENABLE))
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else if (radeon_connector->use_digital)
@@ -720,7 +720,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -737,14 +737,14 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
 		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			if (radeon_audio != 0 &&
-			    drm_detect_monitor_audio(radeon_connector_edid(connector)) &&
+			    connector->display_info.has_audio &&
 			    ASIC_IS_DCE4(rdev) && !ASIC_IS_DCE5(rdev))
 				return ATOM_ENCODER_MODE_DP_AUDIO;
 			return ATOM_ENCODER_MODE_DP;
 		} else if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -755,7 +755,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
 		if (radeon_audio != 0 &&
-		    drm_detect_monitor_audio(radeon_connector_edid(connector)) &&
+		    connector->display_info.has_audio &&
 		    ASIC_IS_DCE4(rdev) && !ASIC_IS_DCE5(rdev))
 			return ATOM_ENCODER_MODE_DP_AUDIO;
 		return ATOM_ENCODER_MODE_DP;
diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/radeon/evergreen_hdmi.c
index 681119c91d94..09dda114e218 100644
--- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
+++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
@@ -412,7 +412,7 @@ void evergreen_hdmi_enable(struct drm_encoder *encoder, bool enable)
 	if (enable) {
 		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 
-		if (connector && drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+		if (connector && connector->display_info.has_audio) {
 			WREG32(HDMI_INFOFRAME_CONTROL0 + dig->afmt->offset,
 			       HDMI_AVI_INFO_SEND | /* enable AVI info frames */
 			       HDMI_AVI_INFO_CONT | /* required for audio info values to be updated */
@@ -450,8 +450,7 @@ void evergreen_dp_enable(struct drm_encoder *encoder, bool enable)
 	if (!dig || !dig->afmt)
 		return;
 
-	if (enable && connector &&
-	    drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (enable && connector && connector->display_info.has_audio) {
 		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 		struct radeon_connector_atom_dig *dig_connector;
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 91b58fbc2be7..e88c35d003c5 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -410,7 +410,7 @@ void radeon_audio_detect(struct drm_connector *connector,
 			radeon_encoder->audio = rdev->audio.hdmi_funcs;
 		}
 
-		if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+		if (connector->display_info.has_audio) {
 			if (!dig->pin)
 				dig->pin = radeon_audio_get_pin(encoder);
 			radeon_audio_enable(rdev, dig->pin, 0xf);
@@ -647,7 +647,7 @@ static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
 	if (!connector)
 		return;
 
-	if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (connector->display_info.has_audio) {
 		radeon_audio_set_mute(encoder, true);
 
 		radeon_audio_write_speaker_allocation(encoder);
@@ -687,7 +687,7 @@ static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
 	if (!connector)
 		return;
 
-	if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (connector->display_info.has_audio) {
 		radeon_audio_write_speaker_allocation(encoder);
 		radeon_audio_write_sad_regs(encoder);
 		radeon_audio_write_latency_fields(encoder, mode);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index b84b58926106..81b5c3c8f658 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -109,7 +109,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 	case DRM_MODE_CONNECTOR_DVII:
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (radeon_connector->use_digital) {
-			if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (connector->display_info.is_hdmi) {
 				if (connector->display_info.bpc)
 					bpc = connector->display_info.bpc;
 			}
@@ -117,7 +117,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	case DRM_MODE_CONNECTOR_DVID:
 	case DRM_MODE_CONNECTOR_HDMIA:
-		if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		if (connector->display_info.is_hdmi) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -126,7 +126,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		dig_connector = radeon_connector->con_priv;
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
 		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) ||
-		    drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		    connector->display_info.is_hdmi) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -150,7 +150,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	}
 
-	if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+	if (connector->display_info.is_hdmi) {
 		/* hdmi deep color only implemented on DCE4+ */
 		if ((bpc > 8) && !ASIC_IS_DCE4(rdev)) {
 			DRM_DEBUG("%s: HDMI deep color %d bpc unsupported. Using 8 bpc.\n",
@@ -1478,7 +1478,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		else if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
 			if (mode->clock > 340000)
 				return MODE_CLOCK_HIGH;
@@ -1774,7 +1774,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 		    (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			return radeon_dp_mode_valid_helper(connector, mode);
 		} else {
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				/* HDMI 1.3+ supports max clock of 340 Mhz */
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index efd18c8d84c8..8d3b907602b1 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1728,7 +1728,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			    (!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
 			    ((radeon_encoder->underscan_type == UNDERSCAN_ON) ||
 			     ((radeon_encoder->underscan_type == UNDERSCAN_AUTO) &&
-			      drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			      connector->display_info.is_hdmi &&
 			      is_hdtv_mode(mode)))) {
 				if (radeon_encoder->underscan_hborder != 0)
 					radeon_crtc->h_border = radeon_encoder->underscan_hborder;
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 3de3dce9e89d..0f723292409e 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -386,7 +386,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (radeon_connector->use_digital) {
 			/* HDMI 1.3 supports up to 340 Mhz over single link */
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				if (pixel_clock > 340000)
 					return true;
 				else
@@ -408,7 +408,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 			return false;
 		else {
 			/* HDMI 1.3 supports up to 340 Mhz over single link */
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				if (pixel_clock > 340000)
 					return true;
 				else
-- 
2.39.2

