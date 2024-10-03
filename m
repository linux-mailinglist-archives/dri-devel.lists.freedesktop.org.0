Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB498EE2E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F15210E81D;
	Thu,  3 Oct 2024 11:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDPCwA0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D78010E81D;
 Thu,  3 Oct 2024 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955197; x=1759491197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDSrjUIiQXzEkADw2TPtq/z33dnzAPhvhoZ2CFHP/nc=;
 b=oDPCwA0jN/TTOJbjpB+sfRIMiw2tu2XX8fAENd8hIL7k/YUHnq2ugl1y
 D9d6cDrZRY3iQlPlgl5DZRZzMmWck9nO5vXWr8d3RWqJoLsuXd9lD/LP1
 lL+ZB/gCkE+bZnkEGx/WWOadI5zmnPteO1zIY4tc39fepAOkf0IrQZ7TC
 6TdW49AhQlDLI3FoyVdjiQIQa/EMh1velAGJaYmKcHfnHIs2uu1+71zlw
 dkj93urXC7FlsU9vL65kYj5sUwCrI6ROZKEXmdNg/6Wk51HrQg2OfpnvQ
 nC1VV+VU9XIiTq5YYE2wgeL75EYn78GFIaLdtdv61XNMuez3mq2e2HDgD w==;
X-CSE-ConnectionGUID: eObA/gzeQeqxf3YU4SkyAg==
X-CSE-MsgGUID: 6WOIux62S1WXoN55W3Osug==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38502993"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38502993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:17 -0700
X-CSE-ConnectionGUID: 4/3U3yt6QgyAYq1D8IGoEQ==
X-CSE-MsgGUID: OGd3v/2/SyiwYvu++AFYog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426509"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/8] drm/client: Streamline mode selection debugs
Date: Thu,  3 Oct 2024 14:32:59 +0300
Message-ID: <20241003113304.11700-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
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

Get rid of all the redundant debugs and just wait until the end
to print which mode (and of which type) we picked.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 70 +++++++++++++---------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 068ce32cc41b..888323137a6a 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -408,6 +408,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 
 retry:
 	for (i = 0; i < connector_count; i++) {
+		const char *mode_type;
+
 		connector = connectors[i];
 
 		if (conn_configured & BIT_ULL(i))
@@ -441,20 +443,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 						    modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for cmdline mode\n",
-			    connector->base.id, connector->name);
 
-		/* got for command line mode first */
+		mode_type = "cmdline";
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
+
 		if (!modes[i]) {
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for preferred mode, tile %d\n",
-				    connector->base.id, connector->name,
-				    connector->tile_group ? connector->tile_group->id : 0);
+			mode_type = "preferred";
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
-		/* No preferred modes, pick one off the list */
-		if (!modes[i])
+
+		if (!modes[i]) {
+			mode_type = "first";
 			modes[i] = drm_connector_first_mode(connector);
+		}
+
 		/*
 		 * In case of tiled mode if all tiles not present fallback to
 		 * first available non tiled mode.
@@ -469,18 +471,22 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				drm_dbg_kms(dev,
-					    "[CONNECTOR:%d:%s] Falling back to non-tiled mode\n",
-					    connector->base.id, connector->name);
+				mode_type = "non tiled";
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
+				mode_type = "tiled";
 				modes[i] = drm_connector_get_tiled_mode(connector);
 			}
 		}
 
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Found mode %s\n",
-			    connector->base.id, connector->name,
-			    modes[i] ? modes[i]->name : "none");
+		if (modes[i])
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
+				    connector->base.id, connector->name,
+				    mode_type, modes[i]->name);
+		else
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] no mode found\n",
+				    connector->base.id, connector->name);
+
 		conn_configured |= BIT_ULL(i);
 	}
 
@@ -627,6 +633,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		struct drm_connector *connector;
 		struct drm_encoder *encoder;
 		struct drm_crtc *new_crtc;
+		const char *mode_type;
 
 		connector = connectors[i];
 
@@ -676,30 +683,22 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		for (j = 0; j < count; j++) {
 			if (crtcs[j] == new_crtc) {
-				drm_dbg_kms(dev, "fallback: cloned configuration\n");
+				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
+					    connector->base.id, connector->name);
 				goto bail;
 			}
 		}
 
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for cmdline mode\n",
-			    connector->base.id, connector->name);
-
-		/* go for command line mode first */
+		mode_type = "cmdline";
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
-		/* try for preferred next */
 		if (!modes[i]) {
-			drm_dbg_kms(dev,
-				    "[CONNECTOR:%d:%s] looking for preferred mode, has tile: %s\n",
-				    connector->base.id, connector->name,
-				    str_yes_no(connector->has_tile));
+			mode_type = "preferred";
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 
-		/* No preferred mode marked by the EDID? Are there any modes? */
-		if (!modes[i] && !list_empty(&connector->modes)) {
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] using first listed mode\n",
-				    connector->base.id, connector->name);
+		if (!modes[i]) {
+			mode_type = "first";
 			modes[i] = drm_connector_first_mode(connector);
 		}
 
@@ -716,28 +715,25 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * This is crtc->mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
 			 */
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for current mode\n",
-				    connector->base.id, connector->name);
+			mode_type = "current";
 			modes[i] = &connector->state->crtc->mode;
 		}
+
 		/*
 		 * In case of tiled modes, if all tiles are not present
 		 * then fallback to a non tiled mode.
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Falling back to non-tiled mode\n",
-				    connector->base.id, connector->name);
+			mode_type = "non tiled";
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
 
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
+		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
 			    connector->base.id, connector->name,
-			    connector->state->crtc->base.id,
-			    connector->state->crtc->name,
-			    modes[i]->hdisplay, modes[i]->vdisplay,
-			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
+			    new_crtc->base.id, new_crtc->name,
+			    mode_type, modes[i]->name);
 
 		fallback = false;
 		conn_configured |= BIT(i);
-- 
2.45.2

