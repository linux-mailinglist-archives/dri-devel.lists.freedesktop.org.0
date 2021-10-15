Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8842EFCF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 13:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0974F6E2B4;
	Fri, 15 Oct 2021 11:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C056E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634297852; bh=DFqDGSHvr1uyycl7Se2wN6v5zUmJJohWh5q1BRuMlCo=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=ujxOFhSFnLXhS9zzljVr8lUx92AdE2jYrC1S7EhrjVQ96sSS4Msb4s1/zNp9HPYWP
 GK2lea3c3GTxbKby+rravWVu4ouUbdSPE4nBua4g+SRGie+FcWAAlY9tbS8d+iGCpo
 3qvFgx3dvFBcFWTDw3d0hgMAkNPR4fFTuoeAk/fs=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 13:37:32 +0200 (CEST)
X-EA-Auth: ufGBbOAyJ7YTrQM19pPR7jskv5qd4zfN9OGE0MrdQTLRfuEqXZAzOMcNePKQkbdd5/ZORT0TCYJhASsC6C2Zi3SU7KRxLiRe
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 02/15] drm/amdgpu: use drm_* functions instead of duplicated
 code in amdgpu driver
Date: Fri, 15 Oct 2021 13:37:00 +0200
Message-Id: <20211015113713.630119-3-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
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

a) Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. The amdgpu driver still calls
drm_detect_hdmi_monitor() to retrieve the same information, which
is less efficient. Change to drm_display_info.is_hdmi

This is a TODO task in Documentation/gpu/todo.rst

b) drm_display_info is updated by drm_get_edid() or
drm_connector_update_edid_property(). In the amdgpu driver it is almost
always updated when the edid is read in amdgpu_connector_get_edid(),
but not always.  Change amdgpu_connector_get_edid() and
amdgpu_connector_free_edid() to keep drm_display_info updated. This allows a)
to work properly.

c) Use drm_edid_get_monitor_name() instead of duplicating the code that
parses the EDID in dm_helpers_parse_edid_caps()

Also, remove the unused "struct dc_context *ctx" parameter in
dm_helpers_parse_edid_caps()

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 23 +++++++----
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |  4 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  6 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  2 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
 9 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index b9c11c2b2885..7b41a1120b70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -25,6 +25,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -108,7 +109,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
 	case DRM_MODE_CONNECTOR_DVII:
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (amdgpu_connector->use_digital) {
-			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+			if (amdgpu_connector_is_hdmi_monitor(connector)) {
 				if (connector->display_info.bpc)
 					bpc = connector->display_info.bpc;
 			}
@@ -116,7 +117,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	case DRM_MODE_CONNECTOR_DVID:
 	case DRM_MODE_CONNECTOR_HDMIA:
-		if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+		if (amdgpu_connector_is_hdmi_monitor(connector)) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -125,7 +126,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
 		dig_connector = amdgpu_connector->con_priv;
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
 		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) ||
-		    drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+		    (amdgpu_connector_is_hdmi_monitor(connector))) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -149,7 +150,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	}
 
-	if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+	if (amdgpu_connector_is_hdmi_monitor(connector)) {
 		/*
 		 * Pre DCE-8 hw can't handle > 12 bpc, and more than 12 bpc doesn't make
 		 * much sense without support for > 12 bpc framebuffers. RGB 4:4:4 at
@@ -315,8 +316,10 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	if (!amdgpu_connector->edid) {
 		/* some laptops provide a hardcoded edid in rom for LCDs */
 		if (((connector->connector_type == DRM_MODE_CONNECTOR_LVDS) ||
-		     (connector->connector_type == DRM_MODE_CONNECTOR_eDP)))
+		     (connector->connector_type == DRM_MODE_CONNECTOR_eDP))) {
 			amdgpu_connector->edid = amdgpu_connector_get_hardcoded_edid(adev);
+			drm_connector_update_edid_property(connector, amdgpu_connector->edid);
+		}
 	}
 }
 
@@ -326,6 +329,7 @@ static void amdgpu_connector_free_edid(struct drm_connector *connector)
 
 	kfree(amdgpu_connector->edid);
 	amdgpu_connector->edid = NULL;
+	drm_connector_update_edid_property(connector, NULL);
 }
 
 static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
@@ -1170,7 +1174,7 @@ static enum drm_mode_status amdgpu_connector_dvi_mode_valid(struct drm_connector
 		    (amdgpu_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
 		    (amdgpu_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B)) {
 			return MODE_OK;
-		} else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+		} else if (amdgpu_connector_is_hdmi_monitor(connector)) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
 			if (mode->clock > 340000)
 				return MODE_CLOCK_HIGH;
@@ -1322,6 +1326,11 @@ bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector)
 	return false;
 }
 
+bool amdgpu_connector_is_hdmi_monitor(struct drm_connector *connector)
+{
+	return connector->display_info.is_hdmi;
+}
+
 static enum drm_connector_status
 amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 {
@@ -1462,7 +1471,7 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
 		    (amdgpu_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			return amdgpu_atombios_dp_mode_valid_helper(connector, mode);
 		} else {
-			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+			if (amdgpu_connector_is_hdmi_monitor(connector)) {
 				/* HDMI 1.3+ supports max clock of 340 Mhz */
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
index 61fcef15ad72..0843540e01f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
@@ -29,6 +29,8 @@ void amdgpu_connector_hotplug(struct drm_connector *connector);
 int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector);
 u16 amdgpu_connector_encoder_get_dp_bridge_encoder_id(struct drm_connector *connector);
 bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector);
+bool amdgpu_connector_is_hdmi_monitor(struct drm_connector *connector);
+
 void
 amdgpu_connector_add(struct amdgpu_device *adev,
 		      uint32_t connector_id,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..41b43207e9fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1364,7 +1364,7 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 		if ((!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
 		    ((amdgpu_encoder->underscan_type == UNDERSCAN_ON) ||
 		     ((amdgpu_encoder->underscan_type == UNDERSCAN_AUTO) &&
-		      drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
+		      amdgpu_connector_is_hdmi_monitor(connector) &&
 		      amdgpu_display_is_hdtv_mode(mode)))) {
 			if (amdgpu_encoder->underscan_hborder != 0)
 				amdgpu_crtc->h_border = amdgpu_encoder->underscan_hborder;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
index af4ef84e27a7..34799786bb40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
@@ -222,7 +222,7 @@ bool amdgpu_dig_monitor_is_duallink(struct drm_encoder *encoder,
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (amdgpu_connector->use_digital) {
 			/* HDMI 1.3 supports up to 340 Mhz over single link */
-			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+			if (amdgpu_connector_is_hdmi_monitor(connector)) {
 				if (pixel_clock > 340000)
 					return true;
 				else
@@ -244,7 +244,7 @@ bool amdgpu_dig_monitor_is_duallink(struct drm_encoder *encoder,
 			return false;
 		else {
 			/* HDMI 1.3 supports up to 340 Mhz over single link */
-			if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector))) {
+			if (amdgpu_connector_is_hdmi_monitor(connector)) {
 				if (pixel_clock > 340000)
 					return true;
 				else
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 6134ed964027..07c4ff14f2a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -469,7 +469,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
 			if (amdgpu_connector->use_digital &&
 			    (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE))
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
+			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
 				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else if (amdgpu_connector->use_digital)
@@ -488,7 +488,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
 		if (amdgpu_audio != 0) {
 			if (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
+			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
 				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -506,7 +506,7 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
 		} else if (amdgpu_audio != 0) {
 			if (amdgpu_connector->audio == AMDGPU_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(amdgpu_connector_edid(connector)) &&
+			else if (amdgpu_connector_is_hdmi_monitor(connector) &&
 				 (amdgpu_connector->audio == AMDGPU_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ea31dcc7a8b..02ecd216a556 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2583,13 +2583,12 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->edid =
 				(struct edid *)sink->dc_edid.raw_edid;
 
-			drm_connector_update_edid_property(connector,
-							   aconnector->edid);
 			if (aconnector->dc_link->aux_mode)
 				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
 						    aconnector->edid);
 		}
 
+		drm_connector_update_edid_property(connector, aconnector->edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
 		update_connector_ext_caps(aconnector);
 	} else {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 6fee12c91ef5..2051dd27ef3b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 
 #include "dm_services.h"
@@ -37,6 +38,7 @@
 #include "amdgpu_dm.h"
 #include "amdgpu_dm_irq.h"
 #include "amdgpu_dm_mst_types.h"
+#include "amdgpu_connectors.h"
 
 #include "dm_helpers.h"
 
@@ -50,16 +52,17 @@
  *	void
  * */
 enum dc_edid_status dm_helpers_parse_edid_caps(
-		struct dc_context *ctx,
+		struct dc_link *link,
 		const struct dc_edid *edid,
 		struct dc_edid_caps *edid_caps)
 {
+	struct amdgpu_dm_connector *aconnector = link->priv;
+	struct drm_connector *connector = &aconnector->base;
 	struct edid *edid_buf = (struct edid *) edid->raw_edid;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
 	int i = 0;
-	int j = 0;
 	uint8_t *sadb = NULL;
 
 	enum dc_edid_status result = EDID_OK;
@@ -78,23 +81,11 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_week = edid_buf->mfg_week;
 	edid_caps->manufacture_year = edid_buf->mfg_year;
 
-	/* One of the four detailed_timings stores the monitor name. It's
-	 * stored in an array of length 13. */
-	for (i = 0; i < 4; i++) {
-		if (edid_buf->detailed_timings[i].data.other_data.type == 0xfc) {
-			while (j < 13 && edid_buf->detailed_timings[i].data.other_data.data.str.str[j]) {
-				if (edid_buf->detailed_timings[i].data.other_data.data.str.str[j] == '\n')
-					break;
-
-				edid_caps->display_name[j] =
-					edid_buf->detailed_timings[i].data.other_data.data.str.str[j];
-				j++;
-			}
-		}
-	}
+	drm_edid_get_monitor_name(edid_buf,
+				  edid_caps->display_name,
+				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
 
-	edid_caps->edid_hdmi = drm_detect_hdmi_monitor(
-			(struct edid *) edid->raw_edid);
+	edid_caps->edid_hdmi = amdgpu_connector_is_hdmi_monitor(connector);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
@@ -610,14 +601,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		/* We don't need the original edid anymore */
 		kfree(edid);
 
-		/* connector->display_info will be parsed from EDID and saved
-		 * into drm_connector->display_info from edid by call stack
-		 * below:
-		 * drm_parse_ycbcr420_deep_color_info
-		 * drm_parse_hdmi_forum_vsdb
-		 * drm_parse_cea_ext
-		 * drm_add_display_info
-		 * drm_connector_update_edid_property
+		/* connector->display_info is parsed from EDID and saved
+		 * into drm_connector->display_info
 		 *
 		 * drm_connector->display_info will be used by amdgpu_dm funcs,
 		 * like fill_stream_properties_from_drm_display_mode
@@ -625,7 +610,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
 		edid_status = dm_helpers_parse_edid_caps(
-						ctx,
+						link,
 						&sink->dc_edid,
 						&sink->edid_caps);
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index c798c65d4276..5efe89fe6c2c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3254,7 +3254,7 @@ struct dc_sink *dc_link_add_remote_sink(
 		goto fail_add_sink;
 
 	edid_status = dm_helpers_parse_edid_caps(
-			link->ctx,
+			link,
 			&dc_sink->dc_edid,
 			&dc_sink->edid_caps);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 9ab854293ace..94dc80060610 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -59,7 +59,7 @@ void dm_helpers_free_gpu_mem(
 		void *pvMem);
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
-	struct dc_context *ctx,
+	struct dc_link *link,
 	const struct dc_edid *edid,
 	struct dc_edid_caps *edid_caps);
 
-- 
2.33.0



