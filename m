Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419045AB5F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573C6E193;
	Tue, 23 Nov 2021 18:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F92E6E193
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1637692642; bh=VtcDHTDLUT5+0lqaLqhTrJuHkcUk+F3G4XxVSj2YZ00=;
 h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 b=fUcel7ME204oNiMpzCTvxUaSJeJQYT7UJakclLxBb5RsmRo90o34e+8OIbCjzK8W2
 SGcCpKb2R5BtDlLxq6xBpl5AI2hSN7NBcrbBc69d0mo3MrIeZMJlxioY+qQp8/+e2u
 S6xvIJGAO+ORGvcLfx/9Dt2QUIdyGH0EIzJwHmUs=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 23 Nov 2021 19:37:21 +0100 (CET)
X-EA-Auth: eg5eNkju73i8TUVOlxMRTYIjEIQX3dsor3vR1CgaKsR5yLnNQvV9WDV9u+T1OIx/UFmFCLhDfwQpVp0lrp5QhI2ayauaqyte
Date: Tue, 23 Nov 2021 19:37:20 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm: change logs to print connectors in the form
 [CONNECTOR:id:name]
Message-ID: <YZ004FJjXdNFz31k@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

The preferred way to log connectors is [CONNECTOR:id:name]. Change it in
drm core programs. Also replace obsolete log calls (like DRM_DEBUG_*)
to the new ones (like drm_dbg_*)

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_client_modeset.c | 66 +++++++++++++++++-----------
 drivers/gpu/drm/drm_connector.c      | 24 +++++-----
 drivers/gpu/drm/drm_edid.c           | 45 +++++++++++--------
 drivers/gpu/drm/drm_edid_load.c      | 21 +++++----
 drivers/gpu/drm/drm_mode_config.c    |  3 +-
 5 files changed, 95 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..8df53b6e7687 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -240,8 +240,9 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 	for (i = 0; i < connector_count; i++) {
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
-		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-			      connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] enabled? %s\n",
+			    connector->base.id, connector->name,
+			    connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
 
 		any_enabled |= enabled[i];
 	}
@@ -350,8 +351,9 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 			continue;
 
 		if (!modes[i] && (h_idx || v_idx)) {
-			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
-				      connector->base.id);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: no modes tiled %d\n",
+				    connector->base.id, connector->name, i);
 			continue;
 		}
 		if (connector->tile_h_loc < h_idx)
@@ -419,14 +421,17 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
-			      connector->base.id);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s]: looking for cmdline mode\n",
+			    connector->base.id, connector->name);
 
 		/* got for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
-				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: looking for preferred mode %d\n",
+				    connector->base.id, connector->name,
+				    connector->tile_group ? connector->tile_group->id : 0);
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
@@ -448,8 +453,8 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-					      connector->base.id);
+				DRM_DEBUG_KMS("[CONNECTOR:%d:%s]: falling back to non tiled mode\n",
+					      connector->base.id, connector->name);
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
 				modes[i] = drm_connector_get_tiled_mode(connector);
@@ -617,15 +622,17 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			num_connectors_detected++;
 
 		if (!enabled[i]) {
-			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
-				      connector->name);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] not enabled, skipping\n",
+				    connector->base.id, connector->name);
 			conn_configured |= BIT(i);
 			continue;
 		}
 
 		if (connector->force == DRM_FORCE_OFF) {
-			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
-				      connector->name);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] is disabled by user, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			continue;
 		}
@@ -635,8 +642,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			if (connector->force > DRM_FORCE_OFF)
 				goto bail;
 
-			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
-				      connector->name);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] has no encoder or crtc, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			conn_configured |= BIT(i);
 			continue;
@@ -658,23 +666,27 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			}
 		}
 
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
-			      connector->name);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s]: looking for cmdline mode\n",
+			    connector->base.id, connector->name);
 
 		/* go for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
 		/* try for preferred next */
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
-				      connector->name, connector->has_tile);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: looking for preferred mode %d\n",
+				    connector->base.id, connector->name,
+				    connector->has_tile);
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
 		if (!modes[i] && !list_empty(&connector->modes)) {
-			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: using first mode listed\n",
+				    connector->base.id, connector->name);
 			modes[i] = list_first_entry(&connector->modes,
 						    struct drm_display_mode,
 						    head);
@@ -693,8 +705,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * This is crtc->mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
 			 */
-			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: looking for current mode\n",
+				    connector->base.id, connector->name);
 			modes[i] = &connector->state->crtc->mode;
 		}
 		/*
@@ -703,8 +716,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-				      connector->base.id);
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s]: falling back to non tiled mode\n",
+				    connector->base.id, connector->name);
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3bc782b630b9..306fff5559f2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -161,25 +161,29 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
 		return;
 
 	if (mode->force) {
-		DRM_INFO("forcing %s connector %s\n", connector->name,
+		drm_info(connector->dev, "[CONNECTOR:%d:%s] forcing: %s\n",
+			 connector->base.id, connector->name,
 			 drm_get_connector_force_name(mode->force));
 		connector->force = mode->force;
 	}
 
 	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
-		DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
-			 connector->name, mode->panel_orientation);
+		drm_info(connector->dev,
+			 "[CONNECTOR:%d:%s] panel_orientation to %d by cmdline\n",
+			 connector->base.id, connector->name,
+			 mode->panel_orientation);
 		drm_connector_set_panel_orientation(connector,
 						    mode->panel_orientation);
 	}
 
-	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
-		      connector->name, mode->name,
-		      mode->xres, mode->yres,
-		      mode->refresh_specified ? mode->refresh : 60,
-		      mode->rb ? " reduced blanking" : "",
-		      mode->margins ? " with margins" : "",
-		      mode->interlace ?  " interlaced" : "");
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] cmdline mode %s %dx%d@%dHz%s%s%s\n",
+		    connector->base.id, connector->name, mode->name,
+		    mode->xres, mode->yres,
+		    mode->refresh_specified ? mode->refresh : 60,
+		    mode->rb ? " reduced blanking" : "",
+		    mode->margins ? " with margins" : "",
+		    mode->interlace ?  " interlaced" : "");
 }
 
 static void drm_connector_free(struct kref *kref)
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..95899b491c6e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5076,32 +5076,37 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_30;
-		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: HDMI sink does deep color 30.\n",
+			     connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_36;
-		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: HDMI sink does deep color 36.\n",
+			     connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_48;
-		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: HDMI sink does deep color 48.\n",
+			     connector->base.id, connector->name);
 	}
 
 	if (dc_bpc == 0) {
-		DRM_DEBUG("%s: No deep color support on this HDMI sink.\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: No deep color support on this HDMI sink.\n",
+			     connector->base.id, connector->name);
 		return;
 	}
 
-	DRM_DEBUG("%s: Assigning HDMI sink color depth as %d bpc.\n",
-		  connector->name, dc_bpc);
+	drm_dbg_core(connector->dev,
+		     "[CONNECTOR:%d:%s]: Assigning HDMI sink color depth as %d bpc.\n",
+		     connector->base.id, connector->name, dc_bpc);
 	info->bpc = dc_bpc;
 
 	/*
@@ -5114,8 +5119,9 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
 		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
-		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: HDMI sink does YCRCB444 in deep color.\n",
+			     connector->base.id, connector->name);
 	}
 
 	/*
@@ -5123,8 +5129,9 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * then deep color 36 bit must be supported.
 	 */
 	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
-		DRM_DEBUG("%s: HDMI sink should do DC_36, but does not!\n",
-			  connector->name);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: HDMI sink should do DC_36, but does not!\n",
+			     connector->base.id, connector->name);
 	}
 }
 
@@ -5357,8 +5364,9 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	if (info->bpc == 0 && edid->revision == 3 &&
 	    edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
 		info->bpc = 8;
-		DRM_DEBUG("%s: Assigning DFP sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+		drm_dbg_core(connector->dev,
+			     "[CONNECTOR:%d:%s]: Assigning DFP sink color depth as %d bpc.\n",
+			     connector->base.id, connector->name, info->bpc);
 	}
 
 	/* Only defined for 1.4 with digital displays */
@@ -5390,8 +5398,9 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 		break;
 	}
 
-	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
-			  connector->name, info->bpc);
+	drm_dbg_core(connector->dev,
+		     "[CONNECTOR:%d:%s]: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
+		     connector->base.id, connector->name, info->bpc);
 
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 37d8ba3ddb46..2ae7217b3648 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -187,8 +187,9 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 
 		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
 		if (IS_ERR(pdev)) {
-			DRM_ERROR("Failed to register EDID firmware platform device "
-				  "for connector \"%s\"\n", connector_name);
+			drm_err(connector->dev,
+				"[CONNECTOR:%d:%s]: failed to register EDID firmware platform device\n",
+				connector->base.id, connector_name);
 			return ERR_CAST(pdev);
 		}
 
@@ -242,9 +243,10 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 		u8 *new_edid;
 
 		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
-		DRM_INFO("Found %d valid extensions instead of %d in EDID data "
-		    "\"%s\" for connector \"%s\"\n", valid_extensions,
-		    edid[0x7e], name, connector_name);
+		drm_info(connector->dev,
+			 "[CONNECTOR:%d:%s]: found %d valid extensions instead of %d in EDID data \"%s\"\n",
+			 connector->base.id, connector_name,
+			 valid_extensions, edid[0x7e], name);
 		edid[0x7e] = valid_extensions;
 
 		new_edid = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
@@ -253,10 +255,11 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 			edid = new_edid;
 	}
 
-	DRM_INFO("Got %s EDID base block and %d extension%s from "
-	    "\"%s\" for connector \"%s\"\n", (builtin >= 0) ? "built-in" :
-	    "external", valid_extensions, valid_extensions == 1 ? "" : "s",
-	    name, connector_name);
+	drm_info(connector->dev,
+		 "[CONNECTOR:%d:%s]: got %s EDID base block and %d extension%s from \"%s\"\n",
+		 connector->base.id, connector_name,
+		 (builtin >= 0) ? "built-in" : "external", valid_extensions,
+		 valid_extensions == 1 ? "" : "s", name);
 
 out:
 	release_firmware(fw);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..8244c8618215 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -504,7 +504,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	if (WARN_ON(!list_empty(&dev->mode_config.connector_list))) {
 		drm_connector_list_iter_begin(dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter)
-			DRM_ERROR("connector %s leaked!\n", connector->name);
+			drm_err(connector->dev, "[CONNECTOR:%d:%s] leaked!\n",
+				connector->base.id, connector->name);
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-- 
2.33.0



