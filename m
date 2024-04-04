Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB4F898FAD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9381134F4;
	Thu,  4 Apr 2024 20:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esMckfye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A9E1134F1;
 Thu,  4 Apr 2024 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262848; x=1743798848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEZReGBUOr6VpJImbmMUa1NM8e6Vp7kJL4CqTjXiNNk=;
 b=esMckfyeRN42tOu/VB9mzu/7ncEN8I3j3rVULLlQrbcSnx784hiBikoL
 vk22SPy8DGX+KLYCX+xCFxDzV39mseeWh+Hdk/aDNqZ6bkoF+FTEzqOpt
 /v23nvCfumRZIxMRdHcESJ+bOHtHy3ZXXOxok1RmduqurRw1hamUu5THz
 LgLTiE7Q4N1u5ly2LZ7dNh3PdFDXIjO46EED66Ma9NCnaRqHcwdfLr5oB
 /Mj8251UjC07n6HwupEmDG7PbwpjvwznT1d/8/QOZr+ym2ncadU7ItQi3
 eCRnXpEVWmok2lI/QkhHle3sUsyvvjC6ofWFBmZN8DYNbhvQ6mmCiHLLY Q==;
X-CSE-ConnectionGUID: js63HtbyT/yFCAl9E69ssA==
X-CSE-MsgGUID: fgKEHv3lQhWGhIy8IfoSog==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019746"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019746"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790586"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790586"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:34:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:34:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/12] drm/client: Switch to per-device debugs
Date: Thu,  4 Apr 2024 23:33:33 +0300
Message-ID: <20240404203336.10454-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use drm_dev_dbg() & co. so that we know which device we're
dealing with.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 117 ++++++++++++++-------------
 1 file changed, 60 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 1fba6cd8d761..1751162b7d5c 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -239,7 +239,8 @@ static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
 	return enable;
 }
 
-static void drm_client_connectors_enabled(struct drm_connector *connectors[],
+static void drm_client_connectors_enabled(struct drm_device *dev,
+					  struct drm_connector *connectors[],
 					  unsigned int connector_count,
 					  bool enabled[])
 {
@@ -250,8 +251,8 @@ static void drm_client_connectors_enabled(struct drm_connector *connectors[],
 	for (i = 0; i < connector_count; i++) {
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
-		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-			      connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
+		drm_dbg_kms(dev, "connector %d enabled? %s\n", connector->base.id,
+			    connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
 
 		any_enabled |= enabled[i];
 	}
@@ -312,7 +313,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	}
 
 	if (can_clone) {
-		DRM_DEBUG_KMS("can clone using command line\n");
+		drm_dbg_kms(dev, "can clone using command line\n");
 		return true;
 	}
 
@@ -341,15 +342,16 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	drm_mode_destroy(dev, dmt_mode);
 
 	if (can_clone) {
-		DRM_DEBUG_KMS("can clone using 1024x768\n");
+		drm_dbg_kms(dev, "can clone using 1024x768\n");
 		return true;
 	}
 fail:
-	DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
+	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
 	return false;
 }
 
-static int drm_client_get_tile_offsets(struct drm_connector *connectors[],
+static int drm_client_get_tile_offsets(struct drm_device *dev,
+				       struct drm_connector *connectors[],
 				       unsigned int connector_count,
 				       const struct drm_display_mode *modes[],
 				       struct drm_client_offset offsets[],
@@ -366,8 +368,8 @@ static int drm_client_get_tile_offsets(struct drm_connector *connectors[],
 			continue;
 
 		if (!modes[i] && (h_idx || v_idx)) {
-			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
-				      connector->base.id);
+			drm_dbg_kms(dev, "no modes for connector tiled %d %d\n",
+				    i, connector->base.id);
 			continue;
 		}
 		if (connector->tile_h_loc < h_idx)
@@ -378,11 +380,12 @@ static int drm_client_get_tile_offsets(struct drm_connector *connectors[],
 	}
 	offsets[idx].x = hoffset;
 	offsets[idx].y = voffset;
-	DRM_DEBUG_KMS("returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
+	drm_dbg_kms(dev, "returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
 	return 0;
 }
 
-static bool drm_client_target_preferred(struct drm_connector *connectors[],
+static bool drm_client_target_preferred(struct drm_device *dev,
+					struct drm_connector *connectors[],
 					unsigned int connector_count,
 					const struct drm_display_mode *modes[],
 					struct drm_client_offset offsets[],
@@ -432,17 +435,17 @@ static bool drm_client_target_preferred(struct drm_connector *connectors[],
 			 * find the tile offsets for this pass - need to find
 			 * all tiles left and above
 			 */
-			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
+			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
-			      connector->base.id);
+		drm_dbg_kms(dev, "looking for cmdline mode on connector %d\n",
+			    connector->base.id);
 
 		/* got for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
-				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
+			drm_dbg_kms(dev, "looking for preferred mode on connector %d %d\n",
+				    connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
@@ -462,16 +465,16 @@ static bool drm_client_target_preferred(struct drm_connector *connectors[],
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-					      connector->base.id);
+				drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
+					    connector->base.id);
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
 				modes[i] = drm_connector_get_tiled_mode(connector);
 			}
 		}
 
-		DRM_DEBUG_KMS("found mode %s\n", modes[i] ? modes[i]->name :
-			  "none");
+		drm_dbg_kms(dev, "found mode %s\n",
+			    modes[i] ? modes[i]->name : "none");
 		conn_configured |= BIT_ULL(i);
 	}
 
@@ -631,15 +634,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			num_connectors_detected++;
 
 		if (!enabled[i]) {
-			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s not enabled, skipping\n",
+				    connector->name);
 			conn_configured |= BIT(i);
 			continue;
 		}
 
 		if (connector->force == DRM_FORCE_OFF) {
-			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s is disabled by user, skipping\n",
+				    connector->name);
 			enabled[i] = false;
 			continue;
 		}
@@ -649,8 +652,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			if (connector->force > DRM_FORCE_OFF)
 				goto bail;
 
-			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s has no encoder or crtc, skipping\n",
+				    connector->name);
 			enabled[i] = false;
 			conn_configured |= BIT(i);
 			continue;
@@ -667,28 +670,28 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		for (j = 0; j < count; j++) {
 			if (crtcs[j] == new_crtc) {
-				DRM_DEBUG_KMS("fallback: cloned configuration\n");
+				drm_dbg_kms(dev, "fallback: cloned configuration\n");
 				goto bail;
 			}
 		}
 
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
-			      connector->name);
+		drm_dbg_kms(dev, "looking for cmdline mode on connector %s\n",
+			    connector->name);
 
 		/* go for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
 		/* try for preferred next */
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
-				      connector->name, connector->has_tile);
+			drm_dbg_kms(dev, "looking for preferred mode on connector %s %d\n",
+				    connector->name, connector->has_tile);
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
 		if (!modes[i] && !list_empty(&connector->modes)) {
-			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "using first mode listed on connector %s\n",
+				    connector->name);
 			modes[i] = drm_connector_first_mode(connector);
 		}
 
@@ -699,8 +702,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * is dodgy. Switch to crtc->state->mode, after taking
 			 * care of the resulting locking/lifetime issues.
 			 */
-			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "looking for current mode on connector %s\n",
+				    connector->name);
 			modes[i] = &connector->state->crtc->mode;
 		}
 		/*
@@ -709,18 +712,18 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-				      connector->base.id);
+			drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
+				    connector->base.id);
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
 
-		DRM_DEBUG_KMS("connector %s on [CRTC:%d:%s]: %dx%d%s\n",
-			      connector->name,
-			      connector->state->crtc->base.id,
-			      connector->state->crtc->name,
-			      modes[i]->hdisplay, modes[i]->vdisplay,
-			      modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
+		drm_dbg_kms(dev, "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
+			    connector->name,
+			    connector->state->crtc->base.id,
+			    connector->state->crtc->name,
+			    modes[i]->hdisplay, modes[i]->vdisplay,
+			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
 
 		fallback = false;
 		conn_configured |= BIT(i);
@@ -736,15 +739,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	 */
 	if (num_connectors_enabled != num_connectors_detected &&
 	    num_connectors_enabled < dev->mode_config.num_crtc) {
-		DRM_DEBUG_KMS("fallback: Not all outputs enabled\n");
-		DRM_DEBUG_KMS("Enabled: %i, detected: %i\n", num_connectors_enabled,
-			      num_connectors_detected);
+		drm_dbg_kms(dev, "fallback: Not all outputs enabled\n");
+		drm_dbg_kms(dev, "Enabled: %i, detected: %i\n",
+			    num_connectors_enabled, num_connectors_detected);
 		fallback = true;
 	}
 
 	if (fallback) {
 bail:
-		DRM_DEBUG_KMS("Not using firmware configuration\n");
+		drm_dbg_kms(dev, "Not using firmware configuration\n");
 		memcpy(enabled, save_enabled, count);
 		ret = false;
 	}
@@ -782,7 +785,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	int i, ret = 0;
 	bool *enabled;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(dev, "\n");
 
 	if (!width)
 		width = dev->mode_config.max_width;
@@ -813,7 +816,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	offsets = kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 	enabled = kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 	if (!crtcs || !modes || !enabled || !offsets) {
-		DRM_ERROR("Memory allocation failed\n");
+		drm_err(dev, "Memory allocation failed\n");
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -824,8 +827,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	for (i = 0; i < connector_count; i++)
 		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);
 	if (!total_modes_count)
-		DRM_DEBUG_KMS("No connectors reported connected with modes\n");
-	drm_client_connectors_enabled(connectors, connector_count, enabled);
+		drm_dbg_kms(dev, "No connectors reported connected with modes\n");
+	drm_client_connectors_enabled(dev, connectors, connector_count, enabled);
 
 	if (!drm_client_firmware_config(client, connectors, connector_count, crtcs,
 					modes, offsets, enabled, width, height)) {
@@ -835,12 +838,12 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 
 		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
 					      offsets, enabled, width, height) &&
-		    !drm_client_target_preferred(connectors, connector_count, modes,
+		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
 						 offsets, enabled, width, height))
-			DRM_ERROR("Unable to find initial modes\n");
+			drm_err(dev, "Unable to find initial modes\n");
 
-		DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
-			      width, height);
+		drm_dbg_kms(dev, "picking CRTCs for %dx%d config\n",
+			    width, height);
 
 		drm_client_pick_crtcs(client, connectors, connector_count,
 				      crtcs, modes, 0, width, height);
@@ -857,8 +860,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
 			struct drm_connector *connector = connectors[i];
 
-			DRM_DEBUG_KMS("desired mode %s set on crtc %d (%d,%d)\n",
-				      mode->name, crtc->base.id, offset->x, offset->y);
+			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
+				    mode->name, crtc->base.id, offset->x, offset->y);
 
 			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
 					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
-- 
2.43.2

