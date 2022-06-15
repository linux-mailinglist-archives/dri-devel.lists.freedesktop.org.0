Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6F54C89F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A03C10E4CD;
	Wed, 15 Jun 2022 12:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jun 2022 12:33:42 UTC
Received: from qq.com (smtpbg465.qq.com [59.36.132.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F210E4CD;
 Wed, 15 Jun 2022 12:33:42 +0000 (UTC)
X-QQ-mid: bizesmtp66t1655295961tobfeji8
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 15 Jun 2022 20:25:54 +0800 (CST)
X-QQ-SSF: 01400000002000D0M000000A0000000
X-QQ-FEAT: W6nSwEQQYT+hxqlHfPaxc8+z7KqaIPzWVaNsD/EviunI59BwYzcY9hB079ysz
 X3ZZdEBmYN7YwoDsFnWOph7OQrlfbXeTb/zVa0j+I0svnN/dKdwmV78U03dingiuHN6S/Ei
 eRIkg7vfQNpKN9lV8aT/41L63LJdip52S13yqmqGV7HtBuE5tqaN2Mpb4GkDrs8h5+gcb6C
 e5xTzBDCXXFecnYaN1pepTxqCQIdHFMi7jgAub8lkrio3pMgAKuENzfhuHlviz8iyQ3ne8+
 R7TplT45LQseDwrxkn1NGMXbL1Z74yA4rhoOssePRCicZYcgV82xlvPJmMdrlG4b9b/idG5
 raCxwNNcoPNzPkHDtVqkFYx3SZYVw==
X-QQ-GoodBg: 1
From: hongao <hongao@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, inhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Wed, 15 Jun 2022 20:24:58 +0800
Message-Id: <20220615122458.20145-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign3
X-QQ-Bgrelay: 1
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
Cc: hongao <hongao@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi for more
efficiency

Tested on "Oland [Radeon HD 8570 / R7 240/340 OEM]" & "Caicos [R5 230]"

Signed-off-by: hongao <hongao@uniontech.com>
---
 drivers/gpu/drm/radeon/atombios_encoders.c |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c   |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 70bd84b7ef2b..393d471ba396 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -714,7 +714,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 			if (radeon_connector->use_digital &&
 			    (radeon_connector->audio == RADEON_AUDIO_ENABLE))
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else if (radeon_connector->use_digital)
@@ -733,7 +733,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
@@ -757,7 +757,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 		} else if (radeon_audio != 0) {
 			if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
 				return ATOM_ENCODER_MODE_HDMI;
-			else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
+			else if (connector->display_info.is_hdmi &&
 				 (radeon_connector->audio == RADEON_AUDIO_AUTO))
 				return ATOM_ENCODER_MODE_HDMI;
 			else
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 58db79921cd3..2fbec7bdd56b 100644
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
@@ -1500,7 +1500,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
 		    (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
 			return MODE_OK;
-		else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+		else if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 			/* HDMI 1.3+ supports max clock of 340 Mhz */
 			if (mode->clock > 340000)
 				return MODE_CLOCK_HIGH;
@@ -1808,7 +1808,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 		    (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
 			return radeon_dp_mode_valid_helper(connector, mode);
 		} else {
-			if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
+			if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
 				/* HDMI 1.3+ supports max clock of 340 Mhz */
 				if (mode->clock > 340000)
 					return MODE_CLOCK_HIGH;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 57ff2b723c87..c7a1e3af55cf 100644
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
2.20.1




