Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB4554589
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6839710EB3C;
	Wed, 22 Jun 2022 11:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2A310EABF;
 Wed, 22 Jun 2022 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895604; x=1687431604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ohRLOGfCe1NO+faPNdGjlNZzoXhtdtl24EvYVg12CKM=;
 b=M2RapTLuPePWSlE05dgqCnZuoQN6htapYkHFy0IOWnP5ZOM74Dyb4nWW
 yZcpWVMco5mBWytWmOVg9pdnh4UleLDZUmhfC+ADD5kCP7P/HBBiisK9M
 cxwUUVVMeCWKx1alR6Ef7jWbPLsf4fChhbQRGxv83ur5kGcNA0jQnpESJ
 YyZUyIgWRFs09mt5HeonTOPDqeeytGlVzN85jnuwF2aHw3/uBUNEEzjYi
 EOs62BZmq/GEGbDEa0OOFqu0I3vUfxCVeh/w0JZHh4h0zwFUBYCeCWPkS
 As7uTSlu+qBHCcpHtw0e7nsV1CgxIsqDNms5/z5ViXKTeUenXwdMbiHgE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305837448"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="305837448"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="655609466"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/13] drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
Date: Wed, 22 Jun 2022 13:59:22 +0300
Message-Id: <944e7c45ca5a59f421926e94e6b12abccff78f92.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert all the connectors that use cached connector edid and
detect_edid to drm_edid.

v2: Don't leak opregion fallback EDID (Ville)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_connector.c    |  4 +-
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 77 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 26 ++++---
 drivers/gpu/drm/i915/display/intel_lvds.c     | 37 +++++----
 5 files changed, 81 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 1dcc268927a2..d83b2a64f618 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -95,12 +95,12 @@ void intel_connector_destroy(struct drm_connector *connector)
 {
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 
-	kfree(intel_connector->detect_edid);
+	drm_edid_free(intel_connector->detect_edid);
 
 	intel_hdcp_cleanup(intel_connector);
 
 	if (!IS_ERR_OR_NULL(intel_connector->edid))
-		kfree(intel_connector->edid);
+		drm_edid_free(intel_connector->edid);
 
 	intel_panel_fini(intel_connector);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0da9b208d56e..d476df0ac9df 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -592,8 +592,8 @@ struct intel_connector {
 	struct intel_panel panel;
 
 	/* Cached EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
-	struct edid *edid;
-	struct edid *detect_edid;
+	const struct drm_edid *edid;
+	const struct drm_edid *detect_edid;
 
 	/* Number of times hotplug detection was tried after an HPD interrupt */
 	int hotplug_retries;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 32292c0be2bd..4ee35317cf2a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3577,12 +3577,11 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 				    intel_dp->aux.i2c_defer_count);
 		intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_FAILSAFE;
 	} else {
-		struct edid *block = intel_connector->detect_edid;
+		/* FIXME: Get rid of drm_edid_raw() */
+		const struct edid *block = drm_edid_raw(intel_connector->detect_edid);
 
-		/* We have to write the checksum
-		 * of the last block read
-		 */
-		block += intel_connector->detect_edid->extensions;
+		/* We have to write the checksum of the last block read */
+		block += block->extensions;
 
 		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
 				       block->checksum) <= 0)
@@ -4461,7 +4460,7 @@ bool intel_digital_port_connected(struct intel_encoder *encoder)
 	return is_connected;
 }
 
-static struct edid *
+static const struct drm_edid *
 intel_dp_get_edid(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
@@ -4472,18 +4471,22 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
 		if (IS_ERR(intel_connector->edid))
 			return NULL;
 
-		return drm_edid_duplicate(intel_connector->edid);
+		return drm_edid_dup(intel_connector->edid);
 	} else
-		return drm_get_edid(&intel_connector->base,
-				    &intel_dp->aux.ddc);
+		return drm_edid_read_ddc(&intel_connector->base,
+					 &intel_dp->aux.ddc);
 }
 
 static void
 intel_dp_update_dfp(struct intel_dp *intel_dp,
-		    const struct edid *edid)
+		    const struct drm_edid *drm_edid)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct edid *edid;
+
+	/* FIXME: Get rid of drm_edid_raw() */
+	edid = drm_edid_raw(drm_edid);
 
 	intel_dp->dfp.max_bpc =
 		drm_dp_downstream_max_bpc(intel_dp->dpcd,
@@ -4583,21 +4586,24 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 	bool vrr_capable;
 
 	intel_dp_unset_edid(intel_dp);
-	edid = intel_dp_get_edid(intel_dp);
-	connector->detect_edid = edid;
+	drm_edid = intel_dp_get_edid(intel_dp);
+	connector->detect_edid = drm_edid;
 
 	vrr_capable = intel_vrr_is_capable(connector);
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
 		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
 	drm_connector_set_vrr_capable_property(&connector->base, vrr_capable);
 
-	intel_dp_update_dfp(intel_dp, edid);
+	intel_dp_update_dfp(intel_dp, drm_edid);
 	intel_dp_update_420(intel_dp);
 
+	/* FIXME: Get rid of drm_edid_raw() */
+	edid = drm_edid_raw(drm_edid);
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_dp->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
 		intel_dp->has_audio = drm_detect_monitor_audio(edid);
@@ -4612,7 +4618,7 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	struct intel_connector *connector = intel_dp->attached_connector;
 
 	drm_dp_cec_unset_edid(&intel_dp->aux);
-	kfree(connector->detect_edid);
+	drm_edid_free(connector->detect_edid);
 	connector->detect_edid = NULL;
 
 	intel_dp->has_hdmi_sink = false;
@@ -4776,12 +4782,11 @@ intel_dp_force(struct drm_connector *connector)
 static int intel_dp_get_modes(struct drm_connector *connector)
 {
 	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int num_modes = 0;
 
-	edid = intel_connector->detect_edid;
-	if (edid)
-		num_modes = intel_connector_update_modes(connector, edid);
+	drm_edid = intel_connector->detect_edid;
+	num_modes = drm_edid_connector_update(connector, drm_edid);
 
 	/* Also add fixed mode, which may or may not be present in EDID */
 	if (intel_dp_is_edp(intel_attached_dp(intel_connector)))
@@ -4790,7 +4795,7 @@ static int intel_dp_get_modes(struct drm_connector *connector)
 	if (num_modes)
 		return num_modes;
 
-	if (!edid) {
+	if (!drm_edid) {
 		struct intel_dp *intel_dp = intel_attached_dp(intel_connector);
 		struct drm_display_mode *mode;
 
@@ -5198,7 +5203,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	bool has_dpcd;
 	enum pipe pipe = INVALID_PIPE;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
@@ -5231,29 +5236,33 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	}
 
 	mutex_lock(&dev->mode_config.mutex);
-	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read_ddc(connector, &intel_dp->aux.ddc);
+	if (!drm_edid) {
+		const struct edid *edid;
+
 		/* Fallback to EDID from ACPI OpRegion, if any */
+		/* FIXME: Make intel_opregion_get_edid() return drm_edid */
 		edid = intel_opregion_get_edid(intel_connector);
-		if (edid)
+		if (edid) {
+			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
 			drm_dbg_kms(&dev_priv->drm,
 				    "[CONNECTOR:%d:%s] Using OpRegion EDID\n",
 				    connector->base.id, connector->name);
-	}
-	if (edid) {
-		if (drm_add_edid_modes(connector, edid)) {
-			drm_connector_update_edid_property(connector, edid);
-		} else {
 			kfree(edid);
-			edid = ERR_PTR(-EINVAL);
+		}
+	}
+	if (drm_edid) {
+		if (!drm_edid_connector_update(connector, drm_edid)) {
+			drm_edid_free(drm_edid);
+			drm_edid = ERR_PTR(-EINVAL);
 		}
 	} else {
-		edid = ERR_PTR(-ENOENT);
+		drm_edid = ERR_PTR(-ENOENT);
 	}
-	intel_connector->edid = edid;
+	intel_connector->edid = drm_edid;
 
-	intel_bios_init_panel(dev_priv, &intel_connector->panel,
-			      encoder->devdata, IS_ERR(edid) ? NULL : edid);
+	intel_bios_init_panel(dev_priv, &intel_connector->panel, encoder->devdata,
+			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
 
 	intel_panel_add_edid_fixed_modes(intel_connector,
 					 intel_connector->panel.vbt.drrs_type != DRRS_TYPE_NONE,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 1ae09431f53a..db33a0ccd7ee 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2340,7 +2340,7 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 	intel_hdmi->dp_dual_mode.type = DRM_DP_DUAL_MODE_NONE;
 	intel_hdmi->dp_dual_mode.max_tmds_clock = 0;
 
-	kfree(to_intel_connector(connector)->detect_edid);
+	drm_edid_free(to_intel_connector(connector)->detect_edid);
 	to_intel_connector(connector)->detect_edid = NULL;
 }
 
@@ -2407,7 +2407,8 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	intel_wakeref_t wakeref;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 	bool connected = false;
 	struct i2c_adapter *i2c;
 
@@ -2415,21 +2416,24 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	i2c = intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
 
-	edid = drm_get_edid(connector, i2c);
+	drm_edid = drm_edid_read_ddc(connector, i2c);
 
-	if (!edid && !intel_gmbus_is_forced_bit(i2c)) {
+	if (!drm_edid && !intel_gmbus_is_forced_bit(i2c)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
 		intel_gmbus_force_bit(i2c, true);
-		edid = drm_get_edid(connector, i2c);
+		drm_edid = drm_edid_read_ddc(connector, i2c);
 		intel_gmbus_force_bit(i2c, false);
 	}
 
-	intel_hdmi_dp_dual_mode_detect(connector, edid != NULL);
+	intel_hdmi_dp_dual_mode_detect(connector, drm_edid != NULL);
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
 
-	to_intel_connector(connector)->detect_edid = edid;
+	to_intel_connector(connector)->detect_edid = drm_edid;
+
+	/* FIXME: Get rid of drm_edid_raw() */
+	edid = drm_edid_raw(drm_edid);
 	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
 		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
 		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
@@ -2501,13 +2505,11 @@ intel_hdmi_force(struct drm_connector *connector)
 
 static int intel_hdmi_get_modes(struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
-	edid = to_intel_connector(connector)->detect_edid;
-	if (edid == NULL)
-		return 0;
+	drm_edid = to_intel_connector(connector)->detect_edid;
 
-	return intel_connector_update_modes(connector, edid);
+	return drm_edid_connector_update(connector, drm_edid);
 }
 
 static struct i2c_adapter *
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 730480ac3300..741152fd90eb 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -479,7 +479,7 @@ static int intel_lvds_get_modes(struct drm_connector *connector)
 
 	/* use cached edid if we have one */
 	if (!IS_ERR_OR_NULL(intel_connector->edid))
-		return drm_add_edid_modes(connector, intel_connector->edid);
+		return drm_edid_connector_update(connector, intel_connector->edid);
 
 	return intel_panel_get_modes(intel_connector);
 }
@@ -829,7 +829,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	i915_reg_t lvds_reg;
 	u32 lvds;
 	u8 pin;
@@ -948,27 +948,30 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	 * preferred mode is the right one.
 	 */
 	mutex_lock(&dev->mode_config.mutex);
-	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
+	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
+		const struct edid *edid;
+
+		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
 		edid = drm_get_edid_switcheroo(connector,
-				    intel_gmbus_get_adapter(dev_priv, pin));
-	else
-		edid = drm_get_edid(connector,
-				    intel_gmbus_get_adapter(dev_priv, pin));
-	if (edid) {
-		if (drm_add_edid_modes(connector, edid)) {
-			drm_connector_update_edid_property(connector,
-								edid);
-		} else {
-			kfree(edid);
-			edid = ERR_PTR(-EINVAL);
+					       intel_gmbus_get_adapter(dev_priv, pin));
+		if (edid)
+			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
+	} else {
+		drm_edid = drm_edid_read_ddc(connector,
+					     intel_gmbus_get_adapter(dev_priv, pin));
+	}
+	if (drm_edid) {
+		if (!drm_edid_connector_update(connector, drm_edid)) {
+			drm_edid_free(drm_edid);
+			drm_edid = ERR_PTR(-EINVAL);
 		}
 	} else {
-		edid = ERR_PTR(-ENOENT);
+		drm_edid = ERR_PTR(-ENOENT);
 	}
-	intel_connector->edid = edid;
+	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel(dev_priv, &intel_connector->panel, NULL,
-			      IS_ERR(edid) ? NULL : edid);
+			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
 
 	/* Try EDID first */
 	intel_panel_add_edid_fixed_modes(intel_connector,
-- 
2.30.2

