Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A88767B0BE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B12A10E78F;
	Wed, 25 Jan 2023 11:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5266C10E78C;
 Wed, 25 Jan 2023 11:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674645074; x=1706181074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9JGnj5mYTQa0OFBDbdL2SDVXI/uAy88eyWePWYSJWw=;
 b=IrW+uuw0hf9g4TK91WVDjgN3r8CL94oHzFues/p+/5/mtpBifQBvWVbd
 +mlhhEl5enskGayyuEFUIX6EtXpjJWUV+VIVya5VVxCcp/1GStfmfd/G0
 7jJfwP63D1rOd8H4UkiTPdj7UQFi0oUY7HaZ1JR5aTw7by2+Oo0ncq2s3
 ka/lQEaxAzVc2hodKp49X3yMVzibj6awRICFH/r+sB4xd2o7IQ7HRtqgr
 zTUrqdlTcrxp9GgN6A7t+ceN1BeEkuSEzBvI9WcpH19/imQwjApbZFlpz
 RL3JHbpy/qYlOXTz1b6SSQ7TEE/l/7dYiKuDABaDQ9rxPinJMNHGo8xwh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="391035496"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="391035496"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:11:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="751156108"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="751156108"
Received: from ericnguy-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.123])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:11:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI v8 3/4] drm/i915/opregion: convert intel_opregion_get_edid() to
 struct drm_edid
Date: Wed, 25 Jan 2023 13:10:51 +0200
Message-Id: <6abb01f1e97d54a3c11bec24377f035df412b492.1674643465.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674643465.git.jani.nikula@intel.com>
References: <cover.1674643465.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify validation and use by converting to drm_edid.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 10 ++-----
 drivers/gpu/drm/i915/display/intel_opregion.c | 29 +++++++------------
 drivers/gpu/drm/i915/display/intel_opregion.h |  4 +--
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4cc7c04b9bda..a44eefb97e8d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5296,18 +5296,12 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
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

