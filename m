Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D265488B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55E910E5C7;
	Thu, 22 Dec 2022 22:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8433210E59C;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CgTsWJRmpgSzGxdg4b1qhgE5P3uJ9Hd0pyah7mdQ/V8=;
 b=Ou31ODNa8BpoExzXsNpUT5V5M44tR6tfe+zC6XJsrvAenFe5wO+dvW+L
 hYGtbUduBnPhEIrL8vBsmG4GXHFviiU3RxYdka4a2R3XodhlkrSVhuSqB
 LyS1BxT5uENW09mLH9MmsLGz4sk4Pm5X/C7mmfsfscdEM4/Gnf5gkOetI
 SpSVeisyo/nOWwraK/AW51GEVFdk8/kf+z59XHVMORsItuWruBUs4Mvwu
 D6S/ocwGuw1XVy1X7Tee49KnZoryZI+3lMD1ZHAr7Hte/ghuyZ22+D4le
 vg8A+YdVGjOvy7fVe6ZS9b60mBQXpU9HdMH8YaEqK02PTLyiwqDez1wtr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472863"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412328"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412328"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 15/20] drm/i915: Rename find_section to find_bdb_section
Date: Thu, 22 Dec 2022 14:21:22 -0800
Message-Id: <20221222222127.34560-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This prevents a namespace collision on other archs.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 46 +++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 755e56f9db6c..7fd96b409d48 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -143,8 +143,8 @@ struct bdb_block_entry {
 };
 
 static const void *
-find_section(struct drm_i915_private *i915,
-	     enum bdb_block_id section_id)
+bdb_find_section(struct drm_i915_private *i915,
+		 enum bdb_block_id section_id)
 {
 	struct bdb_block_entry *entry;
 
@@ -203,7 +203,7 @@ static size_t lfp_data_min_size(struct drm_i915_private *i915)
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
 	size_t size;
 
-	ptrs = find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
 	if (!ptrs)
 		return 0;
 
@@ -632,7 +632,7 @@ static int vbt_get_panel_type(struct drm_i915_private *i915,
 {
 	const struct bdb_lvds_options *lvds_options;
 
-	lvds_options = find_section(i915, BDB_LVDS_OPTIONS);
+	lvds_options = bdb_find_section(i915, BDB_LVDS_OPTIONS);
 	if (!lvds_options)
 		return -1;
 
@@ -672,11 +672,11 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
 
 	dump_pnp_id(i915, edid_id, "EDID");
 
-	ptrs = find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
 	if (!ptrs)
 		return -1;
 
-	data = find_section(i915, BDB_LVDS_LFP_DATA);
+	data = bdb_find_section(i915, BDB_LVDS_LFP_DATA);
 	if (!data)
 		return -1;
 
@@ -792,7 +792,7 @@ parse_panel_options(struct drm_i915_private *i915,
 	int panel_type = panel->vbt.panel_type;
 	int drrs_mode;
 
-	lvds_options = find_section(i915, BDB_LVDS_OPTIONS);
+	lvds_options = bdb_find_section(i915, BDB_LVDS_OPTIONS);
 	if (!lvds_options)
 		return;
 
@@ -882,11 +882,11 @@ parse_lfp_data(struct drm_i915_private *i915,
 	const struct lvds_pnp_id *pnp_id;
 	int panel_type = panel->vbt.panel_type;
 
-	ptrs = find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
+	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
 	if (!ptrs)
 		return;
 
-	data = find_section(i915, BDB_LVDS_LFP_DATA);
+	data = bdb_find_section(i915, BDB_LVDS_LFP_DATA);
 	if (!data)
 		return;
 
@@ -933,7 +933,7 @@ parse_generic_dtd(struct drm_i915_private *i915,
 	if (i915->display.vbt.version < 229)
 		return;
 
-	generic_dtd = find_section(i915, BDB_GENERIC_DTD);
+	generic_dtd = bdb_find_section(i915, BDB_GENERIC_DTD);
 	if (!generic_dtd)
 		return;
 
@@ -1012,7 +1012,7 @@ parse_lfp_backlight(struct drm_i915_private *i915,
 	int panel_type = panel->vbt.panel_type;
 	u16 level;
 
-	backlight_data = find_section(i915, BDB_LVDS_BACKLIGHT);
+	backlight_data = bdb_find_section(i915, BDB_LVDS_BACKLIGHT);
 	if (!backlight_data)
 		return;
 
@@ -1113,14 +1113,14 @@ parse_sdvo_panel_data(struct drm_i915_private *i915,
 	if (index == -1) {
 		const struct bdb_sdvo_lvds_options *sdvo_lvds_options;
 
-		sdvo_lvds_options = find_section(i915, BDB_SDVO_LVDS_OPTIONS);
+		sdvo_lvds_options = bdb_find_section(i915, BDB_SDVO_LVDS_OPTIONS);
 		if (!sdvo_lvds_options)
 			return;
 
 		index = sdvo_lvds_options->panel_type;
 	}
 
-	dtds = find_section(i915, BDB_SDVO_PANEL_DTDS);
+	dtds = bdb_find_section(i915, BDB_SDVO_PANEL_DTDS);
 	if (!dtds)
 		return;
 
@@ -1156,7 +1156,7 @@ parse_general_features(struct drm_i915_private *i915)
 {
 	const struct bdb_general_features *general;
 
-	general = find_section(i915, BDB_GENERAL_FEATURES);
+	general = bdb_find_section(i915, BDB_GENERAL_FEATURES);
 	if (!general)
 		return;
 
@@ -1280,7 +1280,7 @@ parse_driver_features(struct drm_i915_private *i915)
 {
 	const struct bdb_driver_features *driver;
 
-	driver = find_section(i915, BDB_DRIVER_FEATURES);
+	driver = bdb_find_section(i915, BDB_DRIVER_FEATURES);
 	if (!driver)
 		return;
 
@@ -1317,7 +1317,7 @@ parse_panel_driver_features(struct drm_i915_private *i915,
 {
 	const struct bdb_driver_features *driver;
 
-	driver = find_section(i915, BDB_DRIVER_FEATURES);
+	driver = bdb_find_section(i915, BDB_DRIVER_FEATURES);
 	if (!driver)
 		return;
 
@@ -1357,7 +1357,7 @@ parse_power_conservation_features(struct drm_i915_private *i915,
 	if (i915->display.vbt.version < 228)
 		return;
 
-	power = find_section(i915, BDB_LFP_POWER);
+	power = bdb_find_section(i915, BDB_LFP_POWER);
 	if (!power)
 		return;
 
@@ -1397,7 +1397,7 @@ parse_edp(struct drm_i915_private *i915,
 	const struct edp_fast_link_params *edp_link_params;
 	int panel_type = panel->vbt.panel_type;
 
-	edp = find_section(i915, BDB_EDP);
+	edp = bdb_find_section(i915, BDB_EDP);
 	if (!edp)
 		return;
 
@@ -1527,7 +1527,7 @@ parse_psr(struct drm_i915_private *i915,
 	const struct psr_table *psr_table;
 	int panel_type = panel->vbt.panel_type;
 
-	psr = find_section(i915, BDB_PSR);
+	psr = bdb_find_section(i915, BDB_PSR);
 	if (!psr) {
 		drm_dbg_kms(&i915->drm, "No PSR BDB found.\n");
 		return;
@@ -1688,7 +1688,7 @@ parse_mipi_config(struct drm_i915_private *i915,
 	/* Parse #52 for panel index used from panel_type already
 	 * parsed
 	 */
-	start = find_section(i915, BDB_MIPI_CONFIG);
+	start = bdb_find_section(i915, BDB_MIPI_CONFIG);
 	if (!start) {
 		drm_dbg_kms(&i915->drm, "No MIPI config BDB found");
 		return;
@@ -2000,7 +2000,7 @@ parse_mipi_sequence(struct drm_i915_private *i915,
 	if (panel->vbt.dsi.panel_id != MIPI_DSI_GENERIC_PANEL_ID)
 		return;
 
-	sequence = find_section(i915, BDB_MIPI_SEQUENCE);
+	sequence = bdb_find_section(i915, BDB_MIPI_SEQUENCE);
 	if (!sequence) {
 		drm_dbg_kms(&i915->drm,
 			    "No MIPI Sequence found, parsing complete\n");
@@ -2082,7 +2082,7 @@ parse_compression_parameters(struct drm_i915_private *i915)
 	if (i915->display.vbt.version < 198)
 		return;
 
-	params = find_section(i915, BDB_COMPRESSION_PARAMETERS);
+	params = bdb_find_section(i915, BDB_COMPRESSION_PARAMETERS);
 	if (params) {
 		/* Sanity checks */
 		if (params->entry_size != sizeof(params->data[0])) {
@@ -2756,7 +2756,7 @@ parse_general_definitions(struct drm_i915_private *i915)
 	u16 block_size;
 	int bus_pin;
 
-	defs = find_section(i915, BDB_GENERAL_DEFINITIONS);
+	defs = bdb_find_section(i915, BDB_GENERAL_DEFINITIONS);
 	if (!defs) {
 		drm_dbg_kms(&i915->drm,
 			    "No general definition block is found, no devices defined.\n");
-- 
2.37.3

