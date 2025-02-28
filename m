Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A54A4A4C3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1CE10ED52;
	Fri, 28 Feb 2025 21:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqkLPLOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9910ED50;
 Fri, 28 Feb 2025 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777312; x=1772313312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LwDPpP/Od2VODLPdCVQtTN3jJru5UTC3AM6y89UOVaQ=;
 b=bqkLPLOBFeqixni9iBgoqj9GK07NJAXVwIM5Fxq9vOE0QrvS6J8EQZAX
 YrorT6bsB/iG38xC3r2xL+nFiSJqzDoIxh+Op3nG+8rnCTNzIF6C36qsI
 oAKIScb7Xbc62ySWKd9beHdbMVT8YLNlWUoDOPzslOsTT7xgYEwbIPTYV
 NDMJg1HX1XsrX5cqG4GWLtgAMc/wgAb2kQnRzp1V0Y4/nZzZ5JwZA/+e2
 8fZfzf46EgnzK4PCdZYJuj/GPcgjBypb70LbHGMnDI4UDA+2a2yw/b3pQ
 yrYWmsQ1WXAwtQJVjIm2uvnfHsg+YbxoFmPWDUuib/sCbO3OG9eVgWNqL A==;
X-CSE-ConnectionGUID: +8slSLHMROCtJOAjQOGUug==
X-CSE-MsgGUID: kIwgSulqSumIaKzgroyOsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352322"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:12 -0800
X-CSE-ConnectionGUID: o4ozXOPtRQqfPKpKYg7txQ==
X-CSE-MsgGUID: DhmMuzlRS8i7rvs9PG78CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684867"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/client: Make copies of modes
Date: Fri, 28 Feb 2025 23:14:50 +0200
Message-ID: <20250228211454.8138-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
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

drm_client_firmware_config() is currently picking up the current
mode of the crtc via the legacy crtc->mode, which is not supposed
to be used by atomic drivers at all. We can't simply switch over
to the proper crtc->state->mode because we drop the crtc->mutex
(which protects crtc->state) before the mode gets used.

The most straightforward solution to extend the lifetime of
modes[] seem to be to make full copies of the modes.

And with this we can undo also commit 3eadd887dbac
("drm/client:Fully protect modes[] with dev->mode_config.mutex")
as the lifetime of modes[] no longer has anything to do with
that lock.

v2: Don't try to copy NULL modes
v3: Keep storing pointers and use drm_mode_{duplicate,destroy}()

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 62 +++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 148257287ae4..ff034359f063 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -265,6 +265,25 @@ static void drm_client_connectors_enabled(struct drm_connector *connectors[],
 		enabled[i] = drm_connector_enabled(connectors[i], false);
 }
 
+static void mode_replace(struct drm_device *dev,
+			 const struct drm_display_mode **dst,
+			 const struct drm_display_mode *src)
+{
+	drm_mode_destroy(dev, (struct drm_display_mode *)*dst);
+
+	*dst = src ? drm_mode_duplicate(dev, src) : NULL;
+}
+
+static void modes_destroy(struct drm_device *dev,
+			  const struct drm_display_mode *modes[],
+			  int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		mode_replace(dev, &modes[i], NULL);
+}
+
 static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_connector *connectors[],
 				     unsigned int connector_count,
@@ -296,7 +315,9 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	for (i = 0; i < connector_count; i++) {
 		if (!enabled[i])
 			continue;
-		modes[i] = drm_connector_pick_cmdline_mode(connectors[i]);
+
+		mode_replace(dev, &modes[i],
+			     drm_connector_pick_cmdline_mode(connectors[i]));
 		if (!modes[i]) {
 			can_clone = false;
 			break;
@@ -335,7 +356,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 					   DRM_MODE_MATCH_CLOCK |
 					   DRM_MODE_MATCH_FLAGS |
 					   DRM_MODE_MATCH_3D_FLAGS))
-				modes[i] = mode;
+				mode_replace(dev, &modes[i], mode);
 		}
 		if (!modes[i])
 			can_clone = false;
@@ -445,16 +466,19 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 		}
 
 		mode_type = "cmdline";
-		modes[i] = drm_connector_pick_cmdline_mode(connector);
+		mode_replace(dev, &modes[i],
+			     drm_connector_pick_cmdline_mode(connector));
 
 		if (!modes[i]) {
 			mode_type = "preferred";
-			modes[i] = drm_connector_preferred_mode(connector, width, height);
+			mode_replace(dev, &modes[i],
+				     drm_connector_preferred_mode(connector, width, height));
 		}
 
 		if (!modes[i]) {
 			mode_type = "first";
-			modes[i] = drm_connector_first_mode(connector);
+			mode_replace(dev, &modes[i],
+				     drm_connector_first_mode(connector));
 		}
 
 		/*
@@ -472,10 +496,12 @@ static bool drm_client_target_preferred(struct drm_device *dev,
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
 				mode_type = "non tiled";
-				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
+				mode_replace(dev, &modes[i],
+					     drm_connector_fallback_non_tiled_mode(connector));
 			} else {
 				mode_type = "tiled";
-				modes[i] = drm_connector_get_tiled_mode(connector);
+				mode_replace(dev, &modes[i],
+					     drm_connector_get_tiled_mode(connector));
 			}
 		}
 
@@ -690,16 +716,19 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		}
 
 		mode_type = "cmdline";
-		modes[i] = drm_connector_pick_cmdline_mode(connector);
+		mode_replace(dev, &modes[i],
+			     drm_connector_pick_cmdline_mode(connector));
 
 		if (!modes[i]) {
 			mode_type = "preferred";
-			modes[i] = drm_connector_preferred_mode(connector, width, height);
+			mode_replace(dev, &modes[i],
+				     drm_connector_preferred_mode(connector, width, height));
 		}
 
 		if (!modes[i]) {
 			mode_type = "first";
-			modes[i] = drm_connector_first_mode(connector);
+			mode_replace(dev, &modes[i],
+				     drm_connector_first_mode(connector));
 		}
 
 		/* last resort: use current mode */
@@ -716,7 +745,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * fastboot check to work correctly.
 			 */
 			mode_type = "current";
-			modes[i] = &connector->state->crtc->mode;
+			mode_replace(dev, &modes[i],
+				     &connector->state->crtc->mode);
 		}
 
 		/*
@@ -726,7 +756,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
 			mode_type = "non tiled";
-			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
+			mode_replace(dev, &modes[i],
+				     drm_connector_fallback_non_tiled_mode(connector));
 		}
 		crtcs[i] = new_crtc;
 
@@ -798,7 +829,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	unsigned int total_modes_count = 0;
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
-	/* points to modes protected by mode_config.mutex */
 	const struct drm_display_mode **modes;
 	struct drm_crtc **crtcs;
 	int i, ret = 0;
@@ -850,7 +880,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 
 	if (!drm_client_firmware_config(client, connectors, connector_count, crtcs,
 					modes, offsets, enabled, width, height)) {
-		memset(modes, 0, connector_count * sizeof(*modes));
+		modes_destroy(dev, modes, connector_count);
 		memset(crtcs, 0, connector_count * sizeof(*crtcs));
 		memset(offsets, 0, connector_count * sizeof(*offsets));
 
@@ -867,6 +897,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 				      crtcs, modes, 0, width, height);
 	}
 
+	mutex_unlock(&dev->mode_config.mutex);
+
 	drm_client_modeset_release(client);
 
 	for (i = 0; i < connector_count; i++) {
@@ -901,11 +933,11 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			modeset->y = offset->y;
 		}
 	}
-	mutex_unlock(&dev->mode_config.mutex);
 
 	mutex_unlock(&client->modeset_mutex);
 out:
 	kfree(crtcs);
+	modes_destroy(dev, modes, connector_count);
 	kfree(modes);
 	kfree(offsets);
 	kfree(enabled);
-- 
2.45.3

