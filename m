Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B155458B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6991610EB58;
	Wed, 22 Jun 2022 11:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F074310EAF3;
 Wed, 22 Jun 2022 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895609; x=1687431609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UwyBiAMFzJbBZSrlPFHCy48umsliRZJy6jgafdgLUcg=;
 b=MUARqpfNg4rLu7V/KC5pKI1GrVn5+k9w5GcVVPE0erW7i4Ve8En5rqvz
 jGJjhdpcDzBnocOe/ielJbsDhgqlBoa8084ryKfPdNnrkd2Uec5yJe0EB
 rFjCdv5df43WNQ8ha10hs4Am4GyKSdZrazDbRu8aR0bqfq0rLtk/t0wlP
 nD+trLPvjhzfNF6amzgJz4RoN276izBZbmgtNa0+7YFylnJ98cHDkm6Q6
 RCD1fzyviXR9z6Eku8edcFeiXrBIq4c4Oo/RJNZCYXYy8aGKSGJeW3XI8
 +w1+ztcLTnmmP9psN9rmx8DmvNxOncP0c7GPEz4SIstB4Gh0wK65/FVuY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260816710"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260816710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677482394"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/i915/bios: convert intel_bios_init_panel() to
 drm_edid
Date: Wed, 22 Jun 2022 13:59:23 +0300
Message-Id: <54ef0e45c563c667160ac71747f3b3ad32e903a3.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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

Try to use struct drm_edid where possible, even if having to fall back
to looking into struct edid down low via drm_edid_raw().

v2: Rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 19 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_bios.h |  4 ++--
 drivers/gpu/drm/i915/display/intel_dp.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c |  2 +-
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index ab23324c0402..553fdb3a4be7 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -606,14 +606,14 @@ get_lfp_data_tail(const struct bdb_lvds_lfp_data *data,
 
 static int opregion_get_panel_type(struct drm_i915_private *i915,
 				   const struct intel_bios_encoder_data *devdata,
-				   const struct edid *edid)
+				   const struct drm_edid *drm_edid)
 {
 	return intel_opregion_get_panel_type(i915);
 }
 
 static int vbt_get_panel_type(struct drm_i915_private *i915,
 			      const struct intel_bios_encoder_data *devdata,
-			      const struct edid *edid)
+			      const struct drm_edid *drm_edid)
 {
 	const struct bdb_lvds_options *lvds_options;
 
@@ -638,12 +638,13 @@ static int vbt_get_panel_type(struct drm_i915_private *i915,
 
 static int pnpid_get_panel_type(struct drm_i915_private *i915,
 				const struct intel_bios_encoder_data *devdata,
-				const struct edid *edid)
+				const struct drm_edid *drm_edid)
 {
 	const struct bdb_lvds_lfp_data *data;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
 	const struct lvds_pnp_id *edid_id;
 	struct lvds_pnp_id edid_id_nodate;
+	const struct edid *edid = drm_edid_raw(drm_edid); /* FIXME */
 	int i, best = -1;
 
 	if (!edid)
@@ -685,7 +686,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 
 static int fallback_get_panel_type(struct drm_i915_private *i915,
 				   const struct intel_bios_encoder_data *devdata,
-				   const struct edid *edid)
+				   const struct drm_edid *drm_edid)
 {
 	return 0;
 }
@@ -699,13 +700,13 @@ enum panel_type {
 
 static int get_panel_type(struct drm_i915_private *i915,
 			  const struct intel_bios_encoder_data *devdata,
-			  const struct edid *edid)
+			  const struct drm_edid *drm_edid)
 {
 	struct {
 		const char *name;
 		int (*get_panel_type)(struct drm_i915_private *i915,
 				      const struct intel_bios_encoder_data *devdata,
-				      const struct edid *edid);
+				      const struct drm_edid *drm_edid);
 		int panel_type;
 	} panel_types[] = {
 		[PANEL_TYPE_OPREGION] = {
@@ -728,7 +729,7 @@ static int get_panel_type(struct drm_i915_private *i915,
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(panel_types); i++) {
-		panel_types[i].panel_type = panel_types[i].get_panel_type(i915, devdata, edid);
+		panel_types[i].panel_type = panel_types[i].get_panel_type(i915, devdata, drm_edid);
 
 		drm_WARN_ON(&i915->drm, panel_types[i].panel_type > 0xf &&
 			    panel_types[i].panel_type != 0xff);
@@ -3140,11 +3141,11 @@ void intel_bios_init(struct drm_i915_private *i915)
 void intel_bios_init_panel(struct drm_i915_private *i915,
 			   struct intel_panel *panel,
 			   const struct intel_bios_encoder_data *devdata,
-			   const struct edid *edid)
+			   const struct drm_edid *drm_edid)
 {
 	init_vbt_panel_defaults(panel);
 
-	panel->vbt.panel_type = get_panel_type(i915, devdata, edid);
+	panel->vbt.panel_type = get_panel_type(i915, devdata, drm_edid);
 
 	parse_panel_options(i915, panel);
 	parse_generic_dtd(i915, panel);
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index e47582b0de0a..defea578a768 100644
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
@@ -235,7 +235,7 @@ void intel_bios_init(struct drm_i915_private *dev_priv);
 void intel_bios_init_panel(struct drm_i915_private *dev_priv,
 			   struct intel_panel *panel,
 			   const struct intel_bios_encoder_data *devdata,
-			   const struct edid *edid);
+			   const struct drm_edid *drm_edid);
 void intel_bios_fini_panel(struct intel_panel *panel);
 void intel_bios_driver_remove(struct drm_i915_private *dev_priv);
 bool intel_bios_is_valid_vbt(const void *buf, size_t size);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4ee35317cf2a..871309430f6f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5262,7 +5262,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel(dev_priv, &intel_connector->panel, encoder->devdata,
-			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
+			      IS_ERR(drm_edid) ? NULL : drm_edid);
 
 	intel_panel_add_edid_fixed_modes(intel_connector,
 					 intel_connector->panel.vbt.drrs_type != DRRS_TYPE_NONE,
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 741152fd90eb..c3bb3b21928b 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -971,7 +971,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	intel_connector->edid = drm_edid;
 
 	intel_bios_init_panel(dev_priv, &intel_connector->panel, NULL,
-			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
+			      IS_ERR(drm_edid) ? NULL : drm_edid);
 
 	/* Try EDID first */
 	intel_panel_add_edid_fixed_modes(intel_connector,
-- 
2.30.2

