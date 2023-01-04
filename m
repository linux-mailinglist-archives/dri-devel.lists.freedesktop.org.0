Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DA65D058
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E6510E564;
	Wed,  4 Jan 2023 10:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA9110E55F;
 Wed,  4 Jan 2023 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826832; x=1704362832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVX6NbBcN8Xm3Q0+kZAVlldPn1/IWet6WBBAkwdSUmI=;
 b=Gw1TZ+CveKrUcXgDEo3yFyGm2Znz3okxAtw3O5LT5XxvdYcpi9T3+1ka
 ISosIAvMwXqwmJJMEMckNYE8CsEo1+n4ZqBcvgQqhiWlUE8tbAdDPlns1
 oOkmBbuJEG8mzicfcaQw1AgzW5zCsX2bN7oM13OVoGxLFXMrK+D1Hk51R
 ikvFZPbpA9dErf+rzw3jvwySB2TVKdO9seF1fPsPEYW0wHdAq8Brgnw+h
 chY94WqN4XR14aW++tptG7JEKM/MuH1kf5FgYaSKt2KWa29WTpUnsUS2c
 DCRlxZVSms7mFD617q53mfqMECOx58NaCCFb3ioUOaYJXkh3LIQWuo5Jb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="384188843"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="384188843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:07:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="797476829"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="797476829"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:07:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 21/22] drm/i915/opregion: convert intel_opregion_get_edid()
 to struct drm_edid
Date: Wed,  4 Jan 2023 12:05:36 +0200
Message-Id: <9defaecd528346981c47ea4289c3d2883431bf52.1672826282.git.jani.nikula@intel.com>
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

Simplify validation and use by converting to drm_edid.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 10 ++-----
 drivers/gpu/drm/i915/display/intel_opregion.c | 29 +++++++------------
 drivers/gpu/drm/i915/display/intel_opregion.h |  4 +--
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a64e97808813..67f2cb048ac1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5299,18 +5299,12 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	mutex_lock(&dev_priv->drm.mode_config.mutex);
 	drm_edid = drm_edid_read_ddc(connector, &intel_dp->aux.ddc);
 	if (!drm_edid) {
-		const struct edid *edid;
-
 		/* Fallback to EDID from ACPI OpRegion, if any */
-		/* FIXME: Make intel_opregion_get_edid() return drm_edid */
-		edid = intel_opregion_get_edid(intel_connector);
-		if (edid) {
-			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
+		drm_edid = intel_opregion_get_edid(intel_connector);
+		if (drm_edid)
 			drm_dbg_kms(&dev_priv->drm,
 				    "[CONNECTOR:%d:%s] Using OpRegion EDID\n",
 				    connector->base.id, connector->name);
-			kfree(edid);
-		}
 	}
 	if (drm_edid) {
 		if (drm_edid_connector_update(connector, drm_edid) ||
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index e0184745632c..b8dce0576512 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -1101,41 +1101,34 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
  * The EDID in the OpRegion, or NULL if there is none or it's invalid.
  *
  */
-struct edid *intel_opregion_get_edid(struct intel_connector *intel_connector)
+const struct drm_edid *intel_opregion_get_edid(struct intel_connector *intel_connector)
 {
 	struct drm_connector *connector = &intel_connector->base;
 	struct drm_i915_private *i915 = to_i915(connector->dev);
 	struct intel_opregion *opregion = &i915->display.opregion;
-	const void *in_edid;
-	const struct edid *edid;
-	struct edid *new_edid;
+	const struct drm_edid *drm_edid;
+	const void *edid;
 	int len;
 
 	if (!opregion->asle_ext)
 		return NULL;
 
-	in_edid = opregion->asle_ext->bddc;
+	edid = opregion->asle_ext->bddc;
 
 	/* Validity corresponds to number of 128-byte blocks */
 	len = (opregion->asle_ext->phed & ASLE_PHED_EDID_VALID_MASK) * 128;
-	if (!len || !memchr_inv(in_edid, 0, len))
+	if (!len || !memchr_inv(edid, 0, len))
 		return NULL;
 
-	edid = in_edid;
+	drm_edid = drm_edid_alloc(edid, len);
 
-	if (len < EDID_LENGTH * (1 + edid->extensions)) {
-		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5): too short\n");
-		return NULL;
-	}
-	new_edid = drm_edid_duplicate(edid);
-	if (!new_edid)
-		return NULL;
-	if (!drm_edid_is_valid(new_edid)) {
-		kfree(new_edid);
+	if (!drm_edid_valid(drm_edid)) {
 		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5)\n");
-		return NULL;
+		drm_edid_free(drm_edid);
+		drm_edid = NULL;
 	}
-	return new_edid;
+
+	return drm_edid;
 }
 
 bool intel_opregion_headless_sku(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 2f261f985400..d02e6696a050 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -74,7 +74,7 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
 				  pci_power_t state);
 int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
-struct edid *intel_opregion_get_edid(struct intel_connector *connector);
+const struct drm_edid *intel_opregion_get_edid(struct intel_connector *connector);
 
 bool intel_opregion_headless_sku(struct drm_i915_private *i915);
 
@@ -123,7 +123,7 @@ static inline int intel_opregion_get_panel_type(struct drm_i915_private *dev)
 	return -ENODEV;
 }
 
-static inline struct edid *
+static inline const struct drm_edid *
 intel_opregion_get_edid(struct intel_connector *connector)
 {
 	return NULL;
-- 
2.34.1

