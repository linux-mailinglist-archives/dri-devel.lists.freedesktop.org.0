Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A3A43045C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 20:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C796E49D;
	Sat, 16 Oct 2021 18:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10486E491;
 Sat, 16 Oct 2021 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634409763; bh=w7I2sjdWToOSPpLipo0o1q4QfwUmq4t4Tpm9K6xp080=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=RQWroZoBPqRkthVGcrgdK97jjMFosuP0Sk+0Uv5PO5i6mW93409YwxuzlxgnBE8n+
 xzPxSAl+x+9t4NZI8zDLscbrAMYNFoFm8Qy4Rn3BLVvBuy5mS1M4oENNG6FP4FE0GR
 FeXlk2XsoSK5RS+Y6tIfhkcqdkdpsKXupvAkDJRc=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 16 Oct 2021 20:42:43 +0200 (CEST)
X-EA-Auth: 4l3et7uPrFCA/FOh6vilGkj+PiI8WvMUHxVCHTk1FCfMKBS5sUWhV2IUJ6nWun/UPToO0++fdIak78d/i2FSj7IZRwkQ/48G
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
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH v2 03/13] drm/radeon: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Sat, 16 Oct 2021 20:42:16 +0200
Message-Id: <20211016184226.3862-4-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016184226.3862-1-cssk@net-c.es>
References: <20211016184226.3862-1-cssk@net-c.es>
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

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information is less
efficient. Change to drm_display_info.is_hdmi

This is a TODO task in Documentation/gpu/todo.rst

Also, correct an inacurracy or bug in
radeon_connector_get_edid()/radeon_connector_free_edid(). Two variables
have EDID data:
- struct radeon_connector.edid
- struct drm_connector.edid_blob_ptr
The second is updated by calling drm_connector_update_edid_property() or
drm_get_edid() - which internally calls drm_connector_update_edid_property().
drm_display_info.is_hdmi is updated when this function is called.
radeon_connector_get_edid() calls drm_get_edid() to update
drm_connector.edid_blob_ptr/drm_display_info only in some cases. Change it
to be always up to date, so drm_display_info is always correct.
As counterpart, reset these values in radeon_connector_free_edid().

This second change is necessary for the previous one to work properly.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/radeon/atombios_encoders.c |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 15 +++++++++------
 drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c   |  4 ++--
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 0fce73b9a646..844f61a36f20 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -713,7 +713,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 			if (radeon_connector->use_digital &&
 			    (radeon_connector->audio == RADEON_AUDIO_ENABLE))
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else if (radeon_connector->use_digital)
@@ -732,7 +732,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -756,7 +756,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		} else if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..deaae181ac59 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -130,7 +130,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 	case DRM_MODE_CONNECTOR_DVII:
 	case DRM_MODE_CONNECTOR_HDMIB:
 		if (radeon_connector->use_digital) {
-			if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (connector->display_info.is_hdmi) {
 				if (connector->display_info.bpc)
 					bpc = connector->display_info.bpc;
 			}
@@ -138,7 +138,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	case DRM_MODE_CONNECTOR_DVID:
 	case DRM_MODE_CONNECTOR_HDMIA:
-		if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		if (connector->display_info.is_hdmi) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -147,7 +147,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		dig_connector = radeon_connector->con_priv;
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
 		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) ||
-		    drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		    connector->display_info.is_hdmi) {
 			if (connector->display_info.bpc)
 				bpc = connector->display_info.bpc;
 		}
@@ -171,7 +171,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 		break;
 	}
 
-	if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+	if (connector->display_info.is_hdmi) {
 		/* hdmi deep color only implemented on DCE4+ */
 		if ((bpc > 8) && !ASIC_IS_DCE4(rdev)) {
 			DRM_DEBUG("%s: HDMI deep color %d bpc unsupported. Using 8 bpc.\n",
@@ -348,6 +348,8 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 			/* some servers provide a hardcoded edid in rom for KVMs */
 			radeon_connector->edid = radeon_bios_get_hardcoded_edid(rdev);
 		}
+		if (radeon_connector->edid)
+			drm_connector_update_edid_property(connector, radeon_connector->edid);
 	}
 }
 
@@ -358,6 +360,7 @@ static void radeon_connector_free_edid(struct drm_connector *connector)
 	if (radeon_connector->edid) {
 		kfree(radeon_connector->edid);
 		radeon_connector->edid = NULL;
+		drm_connector_update_edid_property(connector, NULL);
 	}
 }
 
@@ -1496,7 +1499,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		else if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
 			if (mode->clock > 340000)
 				return MODE_CLOCK_HIGH;
@@ -1804,7 +1807,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 		    (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			return radeon_dp_mode_valid_helper(connector, mode);
 		} else {
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				/* HDMI 1.3+ supports max clock of 340 Mhz */
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..f406933a8f1d 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1720,7 +1720,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			    (!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
 			    ((radeon_encoder->underscan_type == UNDERSCAN_ON) ||
 			     ((radeon_encoder->underscan_type == UNDERSCAN_AUTO) &&
-			      drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			      connector->display_info.is_hdmi &&
 			      is_hdtv_mode(mode)))) {
 				if (radeon_encoder->underscan_hborder != 0)
 					radeon_crtc->h_border = radeon_encoder->underscan_hborder;
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 46549d5179ee..b999464f213a 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -383,7 +383,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
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
2.33.0



