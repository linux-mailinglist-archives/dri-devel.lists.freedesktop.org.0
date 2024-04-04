Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8D898FB0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289911134FA;
	Thu,  4 Apr 2024 20:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsX6YMAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56341134F5;
 Thu,  4 Apr 2024 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262854; x=1743798854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IVKOrJnNx5OnODMIvwT1U8gVwaVatRrd9uKkuLG6bss=;
 b=XsX6YMAog1dD7ufbz5fN/VjIwuS6lsA9poSGmBmkT0Rt/4rxFd/fBWqF
 GVQuXA9tLCZs9KJMo6VM0MOCJ8h+C+3EdnXKOpi/QYbhe0xMIIiGdi9T7
 IKqPOE16wDKQ3ZxAbmkOAxNEflp2E10BTAt+Ba8z6WZO32uT2Pne5NVpc
 0Z1iE6tCBdQD32hfLgJL9EI8gwkXvmI9j9yvMocxruobvakgywY/mPW5y
 hbbXBM/+V0o6+J2hl6xe2VLKxn/NLhKMmTIk7l+jSuOvtqlXR8gmlc/gt
 O0f6Q68/bCE71/SVGM0dtYjm2x4JDv3JMBB61mITFBgqM4olzK74u1kBv Q==;
X-CSE-ConnectionGUID: 7UFvgbXzRfWJknxecYRNsA==
X-CSE-MsgGUID: HhgQlJZnQteAOrWxS/wneg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019748"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790587"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790587"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:34:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:34:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/client: Use [CONNECTOR:%d:%s] formatting
Date: Thu,  4 Apr 2024 23:33:34 +0300
Message-ID: <20240404203336.10454-11-ville.syrjala@linux.intel.com>
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

Switch to the canonical [CONNECTOR:%d:%s] etc. format for
printing out kms objects.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++++-------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 1751162b7d5c..415d1799337b 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -251,8 +251,10 @@ static void drm_client_connectors_enabled(struct drm_device *dev,
 	for (i = 0; i < connector_count; i++) {
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
-		drm_dbg_kms(dev, "connector %d enabled? %s\n", connector->base.id,
-			    connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] enabled? %s\n",
+			    connector->base.id, connector->name,
+			    connector->display_info.non_desktop ?
+			    "non desktop" : str_yes_no(enabled[i]));
 
 		any_enabled |= enabled[i];
 	}
@@ -368,8 +370,8 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
 			continue;
 
 		if (!modes[i] && (h_idx || v_idx)) {
-			drm_dbg_kms(dev, "no modes for connector tiled %d %d\n",
-				    i, connector->base.id);
+			drm_dbg_kms(dev, "no modes for tiled [CONNECTOR:%d:%s]\n",
+				    connector->base.id, connector->name);
 			continue;
 		}
 		if (connector->tile_h_loc < h_idx)
@@ -438,14 +440,15 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		drm_dbg_kms(dev, "looking for cmdline mode on connector %d\n",
-			    connector->base.id);
+		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
 
 		/* got for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 		if (!modes[i]) {
-			drm_dbg_kms(dev, "looking for preferred mode on connector %d %d\n",
-				    connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
+			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
+				    connector->base.id, connector->name,
+				    connector->tile_group ? connector->tile_group->id : 0);
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
@@ -465,8 +468,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
-					    connector->base.id);
+				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
+					    connector->base.id, connector->name);
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
 				modes[i] = drm_connector_get_tiled_mode(connector);
@@ -634,15 +637,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			num_connectors_detected++;
 
 		if (!enabled[i]) {
-			drm_dbg_kms(dev, "connector %s not enabled, skipping\n",
-				    connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] not enabled, skipping\n",
+				    connector->base.id, connector->name);
 			conn_configured |= BIT(i);
 			continue;
 		}
 
 		if (connector->force == DRM_FORCE_OFF) {
-			drm_dbg_kms(dev, "connector %s is disabled by user, skipping\n",
-				    connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] is disabled by user, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			continue;
 		}
@@ -652,8 +655,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			if (connector->force > DRM_FORCE_OFF)
 				goto bail;
 
-			drm_dbg_kms(dev, "connector %s has no encoder or crtc, skipping\n",
-				    connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] has no encoder or crtc, skipping\n",
+				    connector->base.id, connector->name);
 			enabled[i] = false;
 			conn_configured |= BIT(i);
 			continue;
@@ -675,23 +678,24 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			}
 		}
 
-		drm_dbg_kms(dev, "looking for cmdline mode on connector %s\n",
-			    connector->name);
+		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
 
 		/* go for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
 		/* try for preferred next */
 		if (!modes[i]) {
-			drm_dbg_kms(dev, "looking for preferred mode on connector %s %d\n",
-				    connector->name, connector->has_tile);
+			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tiled? %s)\n",
+				    connector->base.id, connector->name,
+				    str_yes_no(connector->has_tile));
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
 		if (!modes[i] && !list_empty(&connector->modes)) {
-			drm_dbg_kms(dev, "using first mode listed on connector %s\n",
-				    connector->name);
+			drm_dbg_kms(dev, "using first mode listed on [CONNECTOR:%d:%s]\n",
+				    connector->base.id, connector->name);
 			modes[i] = drm_connector_first_mode(connector);
 		}
 
@@ -702,8 +706,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * is dodgy. Switch to crtc->state->mode, after taking
 			 * care of the resulting locking/lifetime issues.
 			 */
-			drm_dbg_kms(dev, "looking for current mode on connector %s\n",
-				    connector->name);
+			drm_dbg_kms(dev, "looking for current mode on [CONNECTOR:%d:%s]\n",
+				    connector->base.id, connector->name);
 			modes[i] = &connector->state->crtc->mode;
 		}
 		/*
@@ -712,14 +716,14 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
-				    connector->base.id);
+			drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
+				    connector->base.id, connector->name);
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
 
-		drm_dbg_kms(dev, "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
-			    connector->name,
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
+			    connector->base.id, connector->name,
 			    connector->state->crtc->base.id,
 			    connector->state->crtc->name,
 			    modes[i]->hdisplay, modes[i]->vdisplay,
@@ -860,8 +864,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
 			struct drm_connector *connector = connectors[i];
 
-			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
-				    mode->name, crtc->base.id, offset->x, offset->y);
+			drm_dbg_kms(dev, "desired mode %s set on [CRTC:%d:%s] (%d,%d)\n",
+				    mode->name, crtc->base.id, crtc->name,
+				    offset->x, offset->y);
 
 			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
 					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
-- 
2.43.2

