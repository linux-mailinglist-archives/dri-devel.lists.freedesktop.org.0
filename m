Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5938758A6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3B10F549;
	Thu,  7 Mar 2024 20:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLN7sgDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173A10F54D;
 Thu,  7 Mar 2024 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844018; x=1741380018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S81tVtp+ehoatErPxBFw+hK4QxnOrUGsJA/f5ol/dbk=;
 b=FLN7sgDpdZ5qBKw2zccScvZzaTL8yGiSqLosEGWs0xxuT1ehjLKH6s3p
 JPsuLjXgr0IFJh2chnvNdMmPyfkjM/NOojFrH1kZ4bFD1Wb70rXFluvwl
 +Cd+vqAKg5ndsYKnWVqeKNz75GJr5kDvHSwioUVWYzqhqB5IW+Rzb8WYX
 33teQzEA3fpBzMM36n9nrBJ+W//sT0/cReBQm0z/BZV5blFpWTUrOdTp/
 jXv24XpWiLYLnPQSsiSeLAgvRDIHCs9I1GUGLOAsWSepaQN9mePzXn5/B
 Z4OV5sGuOT9X/XZwvq4vuIihY5Anld29a4fZo5AdmxZlSqvKfQIJU6Np6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4664263"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4664263"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10675542"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 6/6] drm/client: switch to drm device based logging, and more
Date: Thu,  7 Mar 2024 22:39:38 +0200
Message-Id: <f580f7a20bdea45178cef3940b636d491ae3dd92.1709843865.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to drm device based logging and WARNs, and unify connector and
crtc logging formats. Pass drm device around a bit more to be able to do
this.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
 1 file changed, 70 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 871e4e2129d6..cb29a957a900 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -242,8 +242,10 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 	for (i = 0; i < connector_count; i++) {
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
-		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-			      connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] enabled? %s\n",
+			    connector->base.id, connector->name,
+			    connector->display_info.non_desktop ?
+			    "non desktop" : str_yes_no(enabled[i]));
 
 		any_enabled |= enabled[i];
 	}
@@ -303,7 +305,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	}
 
 	if (can_clone) {
-		DRM_DEBUG_KMS("can clone using command line\n");
+		drm_dbg_kms(dev, "can clone using command line\n");
 		return true;
 	}
 
@@ -332,15 +334,16 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	kfree(dmt_mode);
 
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
 
-static int drm_client_get_tile_offsets(struct drm_connector **connectors,
+static int drm_client_get_tile_offsets(struct drm_device *dev,
+				       struct drm_connector **connectors,
 				       unsigned int connector_count,
 				       struct drm_display_mode **modes,
 				       struct drm_client_offset *offsets,
@@ -357,8 +360,9 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 			continue;
 
 		if (!modes[i] && (h_idx || v_idx)) {
-			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
-				      connector->base.id);
+			drm_dbg_kms(dev,
+				    "[CONNECTOR:%d:%s] no modes for connector tiled %d\n",
+				    connector->base.id, connector->name, i);
 			continue;
 		}
 		if (connector->tile_h_loc < h_idx)
@@ -369,11 +373,12 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 	}
 	offsets[idx].x = hoffset;
 	offsets[idx].y = voffset;
-	DRM_DEBUG_KMS("returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
+	drm_dbg_kms(dev, "returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
 	return 0;
 }
 
-static bool drm_client_target_preferred(struct drm_connector **connectors,
+static bool drm_client_target_preferred(struct drm_device *dev,
+					struct drm_connector **connectors,
 					unsigned int connector_count,
 					struct drm_display_mode **modes,
 					struct drm_client_offset *offsets,
@@ -423,17 +428,19 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			 * find the tile offsets for this pass - need to find
 			 * all tiles left and above
 			 */
-			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
+			drm_client_get_tile_offsets(dev, connectors, connector_count,
+						    modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
-			      connector->base.id);
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for cmdline mode\n",
+			    connector->base.id, connector->name);
 
 		/* got for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
-				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for preferred mode, tile %d\n",
+				    connector->base.id, connector->name,
+				    connector->tile_group ? connector->tile_group->id : 0);
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
@@ -455,16 +462,18 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-					      connector->base.id);
+				drm_dbg_kms(dev,
+					    "[CONNECTOR:%d:%s] Falling back to non-tiled mode\n",
+					    connector->base.id, connector->name);
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
 				modes[i] = drm_connector_get_tiled_mode(connector);
 			}
 		}
 
-		DRM_DEBUG_KMS("found mode %s\n", modes[i] ? modes[i]->name :
-			  "none");
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Found mode %s\n",
+			    connector->base.id, connector->name,
+			    modes[i] ? modes[i]->name : "none");
 		conn_configured |= BIT_ULL(i);
 	}
 
@@ -585,7 +594,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return false;
 
-	if (WARN_ON(count <= 0))
+	if (drm_WARN_ON(dev, count <= 0))
 		return false;
 
 	save_enabled = kcalloc(count, sizeof(bool), GFP_KERNEL);
@@ -624,26 +633,26 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			num_connectors_detected++;
 
 		if (!enabled[i]) {
-			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] not enabled, skipping\n",
+				    connector->base.id, connector->name);
 			conn_configured |= BIT(i);
 			continue;
 		}
 
 		if (connector->force == DRM_FORCE_OFF) {
-			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disabled by user, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			continue;
 		}
 
 		encoder = connector->state->best_encoder;
-		if (!encoder || WARN_ON(!connector->state->crtc)) {
+		if (!encoder || drm_WARN_ON(dev, !connector->state->crtc)) {
 			if (connector->force > DRM_FORCE_OFF)
 				goto bail;
 
-			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] has no encoder or crtc, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			conn_configured |= BIT(i);
 			continue;
@@ -660,28 +669,30 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
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
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for cmdline mode\n",
+			    connector->base.id, connector->name);
 
 		/* go for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
 		/* try for preferred next */
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
-				      connector->name, connector->has_tile);
+			drm_dbg_kms(dev,
+				    "[CONNECTOR:%d:%s] looking for preferred mode, has tile: %s\n",
+				    connector->base.id, connector->name,
+				    str_yes_no(connector->has_tile));
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
 		if (!modes[i] && !list_empty(&connector->modes)) {
-			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] using first listed mode\n",
+				    connector->base.id, connector->name);
 			modes[i] = list_first_entry(&connector->modes,
 						    struct drm_display_mode,
 						    head);
@@ -700,8 +711,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * This is crtc->mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
 			 */
-			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for current mode\n",
+				    connector->base.id, connector->name);
 			modes[i] = &connector->state->crtc->mode;
 		}
 		/*
@@ -710,18 +721,18 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-				      connector->base.id);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Falling back to non-tiled mode\n",
+				    connector->base.id, connector->name);
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
 
-		DRM_DEBUG_KMS("connector %s on [CRTC:%d:%s]: %dx%d%s\n",
-			      connector->name,
-			      connector->state->crtc->base.id,
-			      connector->state->crtc->name,
-			      modes[i]->hdisplay, modes[i]->vdisplay,
-			      modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
+			    connector->base.id, connector->name,
+			    connector->state->crtc->base.id,
+			    connector->state->crtc->name,
+			    modes[i]->hdisplay, modes[i]->vdisplay,
+			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
 
 		fallback = false;
 		conn_configured |= BIT(i);
@@ -737,15 +748,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
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
@@ -782,7 +793,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	int i, ret = 0;
 	bool *enabled;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(dev, "\n");
 
 	if (!width)
 		width = dev->mode_config.max_width;
@@ -813,7 +824,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	offsets = kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 	enabled = kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 	if (!crtcs || !modes || !enabled || !offsets) {
-		DRM_ERROR("Memory allocation failed\n");
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -824,7 +834,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	for (i = 0; i < connector_count; i++)
 		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);
 	if (!total_modes_count)
-		DRM_DEBUG_KMS("No connectors reported connected with modes\n");
+		drm_dbg_kms(dev, "No connectors reported connected with modes\n");
 	drm_client_connectors_enabled(connectors, connector_count, enabled);
 
 	if (!drm_client_firmware_config(client, connectors, connector_count, crtcs,
@@ -835,12 +845,12 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 
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
@@ -858,11 +868,12 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
 			struct drm_connector *connector = connectors[i];
 
-			DRM_DEBUG_KMS("desired mode %s set on crtc %d (%d,%d)\n",
-				      mode->name, crtc->base.id, offset->x, offset->y);
+			drm_dbg_kms(dev, "[CRTC:%d:%s] desired mode %s set (%d,%d)\n",
+				    crtc->base.id, crtc->name,
+				    mode->name, offset->x, offset->y);
 
-			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
-					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
+			if (drm_WARN_ON_ONCE(dev, modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
+					     (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
 				ret = -EINVAL;
 				break;
 			}
-- 
2.39.2

