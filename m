Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E606667B0BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D48610E78E;
	Wed, 25 Jan 2023 11:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D710E78C;
 Wed, 25 Jan 2023 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674645072; x=1706181072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQ0u6uPmhlQ+puFQdyQz7RVkWCHuPQToXbOdX1+j/YE=;
 b=T0tx0mbbFZEkvChEiJTQ7BKETYy1tX9zY79z+uK4yXp9A2FFJhAsTk0o
 od/tfDgkD1lskQpeW+ldXhvgyg+ZRWduqNPLDf8EZVeMuLVfMOspf9qtm
 Q9e3mnwPlqg6Omd6nF7+2Q1oDVVcGDltSx07PD8uy7EjxAqZ8hEvN+HiD
 zFMUq4O0OfPRekATnsJD2Un+oW06fBDQxlor5ItzESkZ2LV5j4t3IgH2n
 6R+HGqL2/75V8rkdyFFhZTm6z/GiPdvZBPsu3eNoXmGH7nKezBNAsWq5m
 sW98MrWHnmZJ+gaE7rc+5GmT0XyPXVwVYIiwNDH7GrUWdfKPbPGIhz2GA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="391035489"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="391035489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:11:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="751156018"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="751156018"
Received: from ericnguy-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.123])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:11:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI v8 2/4] drm/i915/bios: convert intel_bios_init_panel() to drm_edid
Date: Wed, 25 Jan 2023 13:10:50 +0200
Message-Id: <897807d62f74f690a173ecd405e25c6ccdd63b98.1674643465.git.jani.nikula@intel.com>
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

Try to use struct drm_edid where possible, even if having to fall back
to looking into struct edid down low via drm_edid_raw().

v2: Rebase

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 23 ++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_bios.h |  4 ++--
 drivers/gpu/drm/i915/display/intel_dp.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c |  2 +-
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 78abe34c7a42..e6ca51232dcf 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -619,14 +619,14 @@ static void dump_pnp_id(struct drm_i915_private *i915,
 
 static int opregion_get_panel_type(struct drm_i915_private *i915,
 				   const struct intel_bios_encoder_data *devdata,
-				   const struct edid *edid, bool use_fallback)
+				   const struct drm_edid *drm_edid, bool use_fallback)
 {
 	return intel_opregion_get_panel_type(i915);
 }
 
 static int vbt_get_panel_type(struct drm_i915_private *i915,
 			      const struct intel_bios_encoder_data *devdata,
-			      const struct edid *edid, bool use_fallback)
+			      const struct drm_edid *drm_edid, bool use_fallback)
 {
 	const struct bdb_lvds_options *lvds_options;
 
@@ -651,12 +651,13 @@ static int vbt_get_panel_type(struct drm_i915_private *i915,
 
 static int pnpid_get_panel_type(struct drm_i915_private *i915,
 				const struct intel_bios_encoder_data *devdata,
-				const struct edid *edid, bool use_fallback)
+				const struct drm_edid *drm_edid, bool use_fallback)
 {
 	const struct bdb_lvds_lfp_data *data;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
 	const struct lvds_pnp_id *edid_id;
 	struct lvds_pnp_id edid_id_nodate;
+	const struct edid *edid = drm_edid_raw(drm_edid); /* FIXME */
 	int i, best = -1;
 
 	if (!edid)
@@ -700,7 +701,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 
 static int fallback_get_panel_type(struct drm_i915_private *i915,
 				   const struct intel_bios_encoder_data *devdata,
-				   const struct edid *edid, bool use_fallback)
+				   const struct drm_edid *drm_edid, bool use_fallback)
 {
 	return use_fallback ? 0 : -1;
 }
@@ -714,13 +715,13 @@ enum panel_type {
 
 static int get_panel_type(struct drm_i915_private *i915,
 			  const struct intel_bios_encoder_data *devdata,
-			  const struct edid *edid, bool use_fallback)
+			  const struct drm_edid *drm_edid, bool use_fallback)
 {
 	struct {
 		const char *name;
 		int (*get_panel_type)(struct drm_i915_private *i915,
 				      const struct intel_bios_encoder_data *devdata,
-				      const struct edid *edid, bool use_fallback);
+				      const struct drm_edid *drm_edid, bool use_fallback);
 		int panel_type;
 	} panel_types[] = {
 		[PANEL_TYPE_OPREGION] = {
@@ -744,7 +745,7 @@ static int get_panel_type(struct drm_i915_private *i915,
 
 	for (i = 0; i < ARRAY_SIZE(panel_types); i++) {
 		panel_types[i].panel_type = panel_types[i].get_panel_type(i915, devdata,
-									  edid, use_fallback);
+									  drm_edid, use_fallback);
 
 		drm_WARN_ON(&i915->drm, panel_types[i].panel_type > 0xf &&
 			    panel_types[i].panel_type != 0xff);
@@ -3186,7 +3187,7 @@ void intel_bios_init(struct drm_i915_private *i915)
 static void intel_bios_init_panel(struct drm_i915_private *i915,
 				  struct intel_panel *panel,
 				  const struct intel_bios_encoder_data *devdata,
-				  const struct edid *edid,
+				  const struct drm_edid *drm_edid,
 				  bool use_fallback)
 {
 	/* already have it? */
@@ -3196,7 +3197,7 @@ static void intel_bios_init_panel(struct drm_i915_private *i915,
 	}
 
 	panel->vbt.panel_type = get_panel_type(i915, devdata,
-					       edid, use_fallback);
+					       drm_edid, use_fallback);
 	if (panel->vbt.panel_type < 0) {
 		drm_WARN_ON(&i915->drm, use_fallback);
 		return;
@@ -3227,9 +3228,9 @@ void intel_bios_init_panel_early(struct drm_i915_private *i915,
 void intel_bios_init_panel_late(struct drm_i915_private *i915,
 				struct intel_panel *panel,
 				const struct intel_bios_encoder_data *devdata,
-				const struct edid *edid)
+				const struct drm_edid *drm_edid)
 {
-	intel_bios_init_panel(i915, panel, devdata, edid, true);
+	intel_bios_init_panel(i915, panel, devdata, drm_edid, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index ff1fdd2e0c1c..d221f784aa88 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -32,8 +32,8 @@
 
 #include <linux/types.h>
 
+struct drm_edid;
 struct drm_i915_private;
-struct edid;
 struct intel_bios_encoder_data;
 struct intel_crtc_state;
 struct intel_encoder;
@@ -238,7 +238,7 @@ void intel_bios_init_panel_early(struct drm_i915_private *dev_priv,
 void intel_bios_init_panel_late(struct drm_i915_private *dev_priv,
 				struct intel_panel *panel,
 				const struct intel_bios_encoder_data *devdata,
-				const struct edid *edid);
+				const struct drm_edid *drm_edid);
 void intel_bios_fini_panel(struct intel_panel *panel);
 void intel_bios_driver_remove(struct drm_i915_private *dev_priv);
 bool intel_bios_is_valid_vbt(const void *buf, size_t size);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cd7fae1b7543..4cc7c04b9bda 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5322,7 +5322,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, encoder->devdata,
-				   IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
+				   IS_ERR(drm_edid) ? NULL : drm_edid);
 
 	intel_panel_add_edid_fixed_modes(intel_connector, true);
 
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 6a98787edf48..9f6910bba2e9 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -977,7 +977,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, NULL,
-				   IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
+				   IS_ERR(drm_edid) ? NULL : drm_edid);
 
 	/* Try EDID first */
 	intel_panel_add_edid_fixed_modes(intel_connector, true);
-- 
2.34.1

