Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46758C275A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0943310EC2F;
	Fri, 10 May 2024 15:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaL6V1cJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AE510E88B;
 Fri, 10 May 2024 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353715; x=1746889715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WmZo8JFAfCFN/dh/Ty8XyGBBZiFUQk0aX/kr6juHOFU=;
 b=LaL6V1cJQa/7ZrIBpSub2Ea/n4pVCii8fd/aG0ZsGYWMdi8X2YvBc72+
 dxrsPP5ut0mcaHt3jQxfmOMQvZunaSe8MBuTo+uJCcDMpXrY20vJu9a4K
 oZ844LsY+LLUODgEk8G8qMTKhL7qnfgyR2MHPOAdnU2Wu1evUNGoBKtfd
 wQnm6kwk+IeVoXUOqNgK0flvyn23sJ3uM267okPQscJCAOcKOh0uQZ8F6
 lz5QQ3Y+LPs3JqjkvRTiP0z4vs5zW91/NoVG2wpxk2Z9N0ANJSFZTME7/
 pNiIoVur2uhBrSYGGVzblqZ0jdd2MF89wutJPH7TxidnyMLDU1eqbo7Aw Q==;
X-CSE-ConnectionGUID: wshxJuhGSAGRp1SlgvQQUA==
X-CSE-MsgGUID: ltWp6KK1RZ6QCr34lWtIRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22009784"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22009784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:33 -0700
X-CSE-ConnectionGUID: LRTLGbDoTHCQxaLYmPvM/Q==
X-CSE-MsgGUID: j+h/seN9RQeVawY89S5BJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30204396"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
Subject: [RESEND 2/6] drm/radeon: convert to using is_hdmi and has_audio from
 display info
Date: Fri, 10 May 2024 18:08:09 +0300
Message-Id: <c4dfde81b98a4e938ef1e253b05550cad96e49be.1715353572.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715353572.git.jani.nikula@intel.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
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
index 2bff0d9e20f5..0aa395fac36f 100644
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
index 74753bb26d33..16c10db3ce6f 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -409,7 +409,7 @@ void radeon_audio_detect(struct drm_connector *connector,
 			radeon_encoder->audio = rdev->audio.hdmi_funcs;
 		}
 
-		if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+		if (connector->display_info.has_audio) {
 			if (!dig->pin)
 				dig->pin = radeon_audio_get_pin(encoder);
 			radeon_audio_enable(rdev, dig->pin, 0xf);
@@ -646,7 +646,7 @@ static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
 	if (!connector)
 		return;
 
-	if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
+	if (connector->display_info.has_audio) {
 		radeon_audio_set_mute(encoder, true);
 
 		radeon_audio_write_speaker_allocation(encoder);
@@ -686,7 +686,7 @@ static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
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
index 5f1d24d3120c..843383f7237f 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1722,7 +1722,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
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

