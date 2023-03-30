Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C986D09FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D2210EEF2;
	Thu, 30 Mar 2023 15:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616B10EEDF;
 Thu, 30 Mar 2023 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190828; x=1711726828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iaAhaAnM+PjGrtFPfbXRslA9HUPwSaGwqnXFbY1LfOA=;
 b=DtWTkxaXqFKdLlCClx2GjoyBndUEqKGSrGDc00Vn7j4xPScOe5hKtRFJ
 kpqJbDWMv1yMydN+HfuwB7onzJyUncw01Wl/BBQ74JW5XYtHS5QK85F92
 SqRq+kbLWTi4WNUSVmA0UBaM7wKeFGMm23CW88lVClyKQPxca123gIO8q
 dESlhrDmf3E0/BgD7MPTTZLimQ9Zt/uguhiteQK8M8BES0DkhsU32GlMS
 RJ+kZWWCLhaxEbM1qeYZDjVXGPIzZYa7pbYYJH2C0k/luW7eUbgcP4fGX
 O/VKwXFIQ3K7fVTTgGs94uOUQclHKcf8uEQrF/kOnFMrJ3ev2OLktgVku w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427480546"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="427480546"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795702270"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="795702270"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/radeon: convert to using is_hdmi and has_audio from
 display info
Date: Thu, 30 Mar 2023 18:39:40 +0300
Message-Id: <afd406252f9d8c17431e8bd6410bab5412a7c919.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
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
index 4aca09cab4b8..c9d214986e3d 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -700,7 +700,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 			if (radeon_connector->use_digital &&
 			    (radeon_connector->audio == RADEON_AUDIO_ENABLE))
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else if (radeon_connector->use_digital)
@@ -719,7 +719,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -736,14 +736,14 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
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
@@ -754,7 +754,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
 		if (radeon_audio != 0 &&
-		    drm_detect_monitor_audio(radeon_connector_edid(connector)) &&
+		    connector->display_info.has_audio &&
 		    ASIC_IS_DCE4(rdev) && !ASIC_IS_DCE5(rdev))
 			return ATOM_ENCODER_MODE_DP_AUDIO;
 		return ATOM_ENCODER_MODE_DP;
diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/radeon/evergreen_hdmi.c
index 5f3078f8ab95..134780283274 100644
--- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
+++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
@@ -411,7 +411,7 @@ void evergreen_hdmi_enable(struct drm_encoder *encoder, bool enable)
 	if (enable) {
 		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 
-		if (connector && drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+		if (connector && connector->display_info.has_audio) {
 			WREG32(HDMI_INFOFRAME_CONTROL0 + dig->afmt->offset,
 			       HDMI_AVI_INFO_SEND | /* enable AVI info frames */
 			       HDMI_AVI_INFO_CONT | /* required for audio info values to be updated */
@@ -449,8 +449,7 @@ void evergreen_dp_enable(struct drm_encoder *encoder, bool enable)
 	if (!dig || !dig->afmt)
 		return;
 
-	if (enable && connector &&
-	    drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (enable && connector && connector->display_info.has_audio) {
 		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 		struct radeon_connector_atom_dig *dig_connector;
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index d6ccaf24ee0c..947de91e13f6 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -408,7 +408,7 @@ void radeon_audio_detect(struct drm_connector *connector,
 			radeon_encoder->audio = rdev->audio.hdmi_funcs;
 		}
 
-		if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+		if (connector->display_info.has_audio) {
 			if (!dig->pin)
 				dig->pin = radeon_audio_get_pin(encoder);
 			radeon_audio_enable(rdev, dig->pin, 0xf);
@@ -645,7 +645,7 @@ static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
 	if (!connector)
 		return;
 
-	if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (connector->display_info.has_audio) {
 		radeon_audio_set_mute(encoder, true);
 
 		radeon_audio_write_speaker_allocation(encoder);
@@ -685,7 +685,7 @@ static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
 	if (!connector)
 		return;
 
-	if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (connector->display_info.has_audio) {
 		radeon_audio_write_speaker_allocation(encoder);
 		radeon_audio_write_sad_regs(encoder);
 		radeon_audio_write_latency_fields(encoder, mode);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 07193cd0c417..adebf8e9d2bd 100644
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
@@ -1479,7 +1479,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		else if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
 			if (mode->clock > 340000)
 				return MODE_CLOCK_HIGH;
@@ -1775,7 +1775,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 		    (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			return radeon_dp_mode_valid_helper(connector, mode);
 		} else {
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				/* HDMI 1.3+ supports max clock of 340 Mhz */
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index f34a7f63261d..a308b2fbff76 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1727,7 +1727,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			    (!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
 			    ((radeon_encoder->underscan_type == UNDERSCAN_ON) ||
 			     ((radeon_encoder->underscan_type == UNDERSCAN_AUTO) &&
-			      drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			      connector->display_info.is_hdmi &&
 			      is_hdtv_mode(mode)))) {
 				if (radeon_encoder->underscan_hborder != 0)
 					radeon_crtc->h_border = radeon_encoder->underscan_hborder;
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index b3518a8f95a0..7710a301676d 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -382,7 +382,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (radeon_connector->use_digital) {
 			/* HDMI 1.3 supports up to 340 Mhz over single link */
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				if (pixel_clock > 340000)
 					return true;
 				else
@@ -404,7 +404,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
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

