Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80D65D05A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8C410E566;
	Wed,  4 Jan 2023 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AB10E564;
 Wed,  4 Jan 2023 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826836; x=1704362836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f28yXyuPCw5qqjy3tYDOeHUtVROKLB9vceXiiKc241A=;
 b=Kz6kcLplcdnPaHQxbstsyEFhjCY0tD3aVLf9yojogmlBiyk89L/b1BZf
 D3W5z61xNgRS5zt4WBmgjCuifQewWIQ/MhXlI/O7kfM5idef414Xbjx7H
 uZ4je2NlmsVP1zGni7J0EJhKIDBjISfpJ/o5V41tL1H6jfpVHgvOkeV9a
 Kpl0jT8zNas+ckgHoDCU1T1LWX8qGr6EnnNKVy9xtbXdUeB9d7M0HlAUj
 Zo0iUuuGnJJUAsM1kcozNdFygoWgR9DR6X5hXnCbZgSNeE9UYVIG2c89R
 t3T5zSFcbzYUtGhpndM3Q3MzboD+TQjAQddMDB6oQFcVZs/eJd4+Watdt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="408157085"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="408157085"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:07:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="723590998"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="723590998"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:07:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 22/22] drm/i915/panel: move panel fixed EDID to struct
 intel_panel
Date: Wed,  4 Jan 2023 12:05:37 +0200
Message-Id: <94814815b820135ca259d97f463c80628cabf9f6.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a bit confusing to have two cached EDIDs in struct intel_connector
with slightly different purposes. Make the distinction a bit clearer by
moving the EDID cached for eDP and LVDS panels at connector init time to
struct intel_panel, and name it fixed_edid. That's what it is, a fixed
EDID for the panels.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 .../gpu/drm/i915/display/intel_connector.c    |  3 ---
 .../drm/i915/display/intel_display_types.h    |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dvo.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     | 11 +++++-----
 drivers/gpu/drm/i915/display/intel_panel.c    | 10 +++++++++-
 drivers/gpu/drm/i915/display/intel_panel.h    |  4 +++-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
 10 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ae14c794c4bc..d56d01f07bb7 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -2054,7 +2054,7 @@ void icl_dsi_init(struct drm_i915_private *dev_priv)
 		goto err;
 	}
 
-	intel_panel_init(intel_connector);
+	intel_panel_init(intel_connector, NULL);
 
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 4814d4e2f7f9..257afac34839 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -99,9 +99,6 @@ void intel_connector_destroy(struct drm_connector *connector)
 
 	intel_hdcp_cleanup(intel_connector);
 
-	if (!IS_ERR_OR_NULL(intel_connector->edid))
-		drm_edid_free(intel_connector->edid);
-
 	intel_panel_fini(intel_connector);
 
 	drm_connector_cleanup(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 34dc850340b8..6feb232bb1c2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -351,6 +351,9 @@ struct intel_vbt_panel_data {
 };
 
 struct intel_panel {
+	/* Fixed EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
+	const struct drm_edid *fixed_edid;
+
 	struct list_head fixed_modes;
 
 	/* backlight */
@@ -591,8 +594,7 @@ struct intel_connector {
 	/* Panel info for eDP and LVDS */
 	struct intel_panel panel;
 
-	/* Cached EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
-	const struct drm_edid *edid;
+	/* Cached EDID for detect. */
 	const struct drm_edid *detect_edid;
 
 	/* Number of times hotplug detection was tried after an HPD interrupt */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 67f2cb048ac1..3f4396b5f029 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4480,18 +4480,19 @@ bool intel_digital_port_connected(struct intel_encoder *encoder)
 static const struct drm_edid *
 intel_dp_get_edid(struct intel_dp *intel_dp)
 {
-	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_edid *fixed_edid = connector->panel.fixed_edid;
 
-	/* use cached edid if we have one */
-	if (intel_connector->edid) {
+	/* Use panel fixed edid if we have one */
+	if (fixed_edid) {
 		/* invalid edid */
-		if (IS_ERR(intel_connector->edid))
+		if (IS_ERR(fixed_edid))
 			return NULL;
 
-		return drm_edid_dup(intel_connector->edid);
-	} else
-		return drm_edid_read_ddc(&intel_connector->base,
-					 &intel_dp->aux.ddc);
+		return drm_edid_dup(fixed_edid);
+	}
+
+	return drm_edid_read_ddc(&connector->base, &intel_dp->aux.ddc);
 }
 
 static void
@@ -5316,7 +5317,6 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	} else {
 		drm_edid = ERR_PTR(-ENOENT);
 	}
-	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, encoder->devdata,
 				   IS_ERR(drm_edid) ? NULL : drm_edid);
@@ -5343,7 +5343,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		goto out_vdd_off;
 	}
 
-	intel_panel_init(intel_connector);
+	intel_panel_init(intel_connector, drm_edid);
 
 	intel_edp_backlight_setup(intel_dp, intel_connector);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index 4aeae0f3ac91..0be8105cb18a 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -554,6 +554,6 @@ void intel_dvo_init(struct drm_i915_private *i915)
 		 */
 		intel_panel_add_encoder_fixed_mode(connector, encoder);
 
-		intel_panel_init(connector);
+		intel_panel_init(connector, NULL);
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 9f6910bba2e9..a1557d84ce0a 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -477,10 +477,11 @@ static int intel_lvds_compute_config(struct intel_encoder *intel_encoder,
 static int intel_lvds_get_modes(struct drm_connector *connector)
 {
 	struct intel_connector *intel_connector = to_intel_connector(connector);
+	const struct drm_edid *fixed_edid = intel_connector->panel.fixed_edid;
 
-	/* use cached edid if we have one */
-	if (!IS_ERR_OR_NULL(intel_connector->edid)) {
-		drm_edid_connector_update(connector, intel_connector->edid);
+	/* Use panel fixed edid if we have one */
+	if (!IS_ERR_OR_NULL(fixed_edid)) {
+		drm_edid_connector_update(connector, fixed_edid);
 
 		return drm_edid_connector_add_modes(connector);
 	}
@@ -974,8 +975,6 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	} else {
 		drm_edid = ERR_PTR(-ENOENT);
 	}
-	intel_connector->edid = drm_edid;
-
 	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, NULL,
 				   IS_ERR(drm_edid) ? NULL : drm_edid);
 
@@ -1000,7 +999,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	if (!intel_panel_preferred_fixed_mode(intel_connector))
 		goto failed;
 
-	intel_panel_init(intel_connector);
+	intel_panel_init(intel_connector, drm_edid);
 
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 3b1004b019a8..42aa04bac261 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -31,6 +31,8 @@
 #include <linux/kernel.h>
 #include <linux/pwm.h>
 
+#include <drm/drm_edid.h>
+
 #include "i915_reg.h"
 #include "intel_backlight.h"
 #include "intel_connector.h"
@@ -670,10 +672,13 @@ void intel_panel_init_alloc(struct intel_connector *connector)
 	INIT_LIST_HEAD(&panel->fixed_modes);
 }
 
-int intel_panel_init(struct intel_connector *connector)
+int intel_panel_init(struct intel_connector *connector,
+		     const struct drm_edid *fixed_edid)
 {
 	struct intel_panel *panel = &connector->panel;
 
+	panel->fixed_edid = fixed_edid;
+
 	intel_backlight_init_funcs(panel);
 
 	if (!has_drrs_modes(connector))
@@ -692,6 +697,9 @@ void intel_panel_fini(struct intel_connector *connector)
 	struct intel_panel *panel = &connector->panel;
 	struct drm_display_mode *fixed_mode, *next;
 
+	if (!IS_ERR_OR_NULL(panel->fixed_edid))
+		drm_edid_free(panel->fixed_edid);
+
 	intel_backlight_destroy(panel);
 
 	intel_bios_fini_panel(panel);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
index 4b51e1c51da6..15a8c897b33f 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.h
+++ b/drivers/gpu/drm/i915/display/intel_panel.h
@@ -13,13 +13,15 @@ enum drrs_type;
 struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
+struct drm_edid;
 struct drm_i915_private;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_encoder;
 
 void intel_panel_init_alloc(struct intel_connector *connector);
-int intel_panel_init(struct intel_connector *connector);
+int intel_panel_init(struct intel_connector *connector,
+		     const struct drm_edid *fixed_edid);
 void intel_panel_fini(struct intel_connector *connector);
 enum drm_connector_status
 intel_panel_detect(struct drm_connector *connector, bool force);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 21805c15d5eb..c58e5cfa8e88 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2903,7 +2903,7 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, u16 type)
 		mutex_unlock(&i915->drm.mode_config.mutex);
 	}
 
-	intel_panel_init(intel_connector);
+	intel_panel_init(intel_connector, NULL);
 
 	if (!intel_panel_preferred_fixed_mode(intel_connector))
 		goto err;
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 662bdb656aa3..2289f6b1b4eb 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1983,7 +1983,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 		goto err_cleanup_connector;
 	}
 
-	intel_panel_init(intel_connector);
+	intel_panel_init(intel_connector, NULL);
 
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
-- 
2.34.1

