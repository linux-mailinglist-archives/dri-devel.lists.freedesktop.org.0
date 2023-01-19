Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A43673E81
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAFE10E9AA;
	Thu, 19 Jan 2023 16:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A4210E9A7;
 Thu, 19 Jan 2023 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145184; x=1705681184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+s+bcptEbq+EcKZT5vZDc3N9NAuYBv4TWEdk3yVrOmw=;
 b=g3lJqIqMw+I40RlcI6WcvCo1X2ddfAWlLoSJFA96visafDRG3UB/G0WJ
 hYYVl4pHZdRXqvkZzlR4mOPdlRNqQJnZtSRXGI61rUn+c+10iXZKkR6hT
 YTYvFqjTqYH00ODZDGJyZc5EoRZ4yX1Fh8h2xebsXTG3VAMCG/1nFGcHs
 OeNO/QLC3L9u8ubSZu/PngJWh+h4jxnIwO+FUTHHwlgR9GDKRs1OGzcRC
 K9jYi1xXojzBDYJeg6rIGo/xSg0TTHQubNPzZgd+XYT32J9Vq0SF5j2p7
 y2CnGeuazJOpwkyaGGeH5FVt9TKTNoxDCuRyyU9L+FyXon7+fVC4uqbd0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305699332"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305699332"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637756150"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="637756150"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 7/8] drm/i915/opregion: convert intel_opregion_get_edid()
 to struct drm_edid
Date: Thu, 19 Jan 2023 18:19:00 +0200
Message-Id: <c21e8d9366709de47694e374b2e8b05c0bdbb72d.1674144945.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674144945.git.jani.nikula@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
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

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

