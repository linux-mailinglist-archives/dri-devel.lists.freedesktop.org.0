Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F89B64EE6F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4810E5FF;
	Fri, 16 Dec 2022 16:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EAD10E5E8;
 Fri, 16 Dec 2022 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206510; x=1702742510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BzrW/R9Hm+Pdbzn8buonOZEFkyqj92qqiDeyiabe1HA=;
 b=lnq5OuZH/4eMhq0ZpbPpijmcMYIP8+Z9Y0V6VawL5R+B8SJyGS0YBJEx
 cW4Nm5swepfEL+v9uDxi0yaF7itI1omFATEY8+0dQThJoJMWPCiAC0Xo/
 kfvymHqOVuDPTb9VbXCESZlp00E2iJNsz5vbJ5kiR0bs/7UJtKcF8KL43
 nhs3A6XX5b9EoSsoS4EuWe/+OQUn+xXe8awZDLgzh8XRFnwxMt/uyJHCq
 kg9PyrKjgejjhdfQJKs7Ujz3mAxtUzizgg+Gf8OpX51yGkopUUDLM0U22
 GzPdo1U6v8FGN7p5PirDAO9kLL14NfCu4qYrIlz/sduchOIDsK+IBrF8M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="346077037"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="346077037"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="713301640"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="713301640"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 11/12] drm/i915/opregion: convert intel_opregion_get_edid()
 to struct drm_edid
Date: Fri, 16 Dec 2022 18:00:25 +0200
Message-Id: <f615ca2eb508126f768869b10cac5f21968e2faa.1671206131.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671206131.git.jani.nikula@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify validation and use by converting to drm_edid.

Cc: Imre Deak <imre.deak@intel.com>
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

