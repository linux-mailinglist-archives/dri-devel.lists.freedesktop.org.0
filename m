Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE09898FA9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5951134EE;
	Thu,  4 Apr 2024 20:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhqwD6Yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40E31134F0;
 Thu,  4 Apr 2024 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262854; x=1743798854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sHxq81IMHzxIG3TZkAt/jjGKXlagka18NNvxDBVfXzI=;
 b=IhqwD6YrWGuH2FBjHPOvGMz0aXAXSEfdW1H6grGL9dhUS1WOqHbSk3I4
 /0Qv8vQimLbiHmWJhJqqfkwbyy+Zb9mUgcxO2GmiAdpRBwmDxRkPVJNSx
 f/d2VhCQ1mZEglIHh/oLpPJt1hyC4HMjvw1tJV/jOxid/HJCQdaT2y/AU
 muc6roKgHHwhvLKKzzomIcaUq15yDfnFBJi9m9ce8XkdLlCMGM0sm8L2Z
 Jr/PcUbemU+R0uyJC5WI+cWtto3TFAuHfSGH5MJt1zr05G7+/dca6uzAy
 6Jus6dOlI+p51BMoGwYW+YeViPqpRaBIoti+BdEUBOhZhIZjgLBto/DcC Q==;
X-CSE-ConnectionGUID: sMIczmsjSaeiszBhWPU7YQ==
X-CSE-MsgGUID: /cRyH/oTRcSjN+/vHNWWfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019758"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019758"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790588"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790588"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:34:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:34:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/client: Streamline mode selection debugs
Date: Thu,  4 Apr 2024 23:33:35 +0300
Message-ID: <20240404203336.10454-12-ville.syrjala@linux.intel.com>
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

Get rid of all the redundant debugs and just wait until the end
to print which mode (and of which type) we picked.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++---------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 415d1799337b..ad88c11037d8 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -408,6 +408,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 
 retry:
 	for (i = 0; i < connector_count; i++) {
+		const char *mode_type;
+
 		connector = connectors[i];
 
 		if (conn_configured & BIT_ULL(i))
@@ -440,20 +442,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
-			    connector->base.id, connector->name);
 
-		/* got for command line mode first */
+		mode_type = "cmdline";
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
+
 		if (!modes[i]) {
-			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
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
@@ -468,16 +470,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
-					    connector->base.id, connector->name);
+				mode_type = "non tiled";
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
+				mode_type = "tiled";
 				modes[i] = drm_connector_get_tiled_mode(connector);
 			}
 		}
 
-		drm_dbg_kms(dev, "found mode %s\n",
-			    modes[i] ? modes[i]->name : "none");
+		if (!modes[i])
+			mode_type = "no";
+
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
+			    connector->base.id, connector->name,
+			    mode_type, modes[i] ? modes[i]->name : "none");
 		conn_configured |= BIT_ULL(i);
 	}
 
@@ -624,6 +630,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		struct drm_connector *connector;
 		struct drm_encoder *encoder;
 		struct drm_crtc *new_crtc;
+		const char *mode_type;
 
 		connector = connectors[i];
 
@@ -673,29 +680,22 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		for (j = 0; j < count; j++) {
 			if (crtcs[j] == new_crtc) {
-				drm_dbg_kms(dev, "fallback: cloned configuration\n");
+				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
+					    connector->base.id, connector->name);
 				goto bail;
 			}
 		}
 
-		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
-			    connector->base.id, connector->name);
-
-		/* go for command line mode first */
+		mode_type = "cmdline";
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
-		/* try for preferred next */
 		if (!modes[i]) {
-			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tiled? %s)\n",
-				    connector->base.id, connector->name,
-				    str_yes_no(connector->has_tile));
+			mode_type = "preferred";
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 
-		/* No preferred mode marked by the EDID? Are there any modes? */
-		if (!modes[i] && !list_empty(&connector->modes)) {
-			drm_dbg_kms(dev, "using first mode listed on [CONNECTOR:%d:%s]\n",
-				    connector->base.id, connector->name);
+		if (!modes[i]) {
+			mode_type = "first";
 			modes[i] = drm_connector_first_mode(connector);
 		}
 
@@ -706,28 +706,25 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * is dodgy. Switch to crtc->state->mode, after taking
 			 * care of the resulting locking/lifetime issues.
 			 */
-			drm_dbg_kms(dev, "looking for current mode on [CONNECTOR:%d:%s]\n",
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
-			drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
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
2.43.2

