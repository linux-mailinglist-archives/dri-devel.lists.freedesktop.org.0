Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE92ABBC52
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C410E048;
	Mon, 19 May 2025 11:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTPtGTA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A910E21F;
 Mon, 19 May 2025 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654147; x=1779190147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=djiksAnqZwvzPy7TLldAG5o/JGve1C7K9hm3pAmhXsY=;
 b=HTPtGTA7rlMUc3C3eAh1JBPgee7xQwzfNiIyFECvLmhueZMgVY8i7vI7
 GJrO8TuP8yJAgO40wm8osQkn44AHAZOeQDzxUgAaNZTrwj7d0SYKgQq98
 1vTvu4k7ktzx2GVYPoTycGl8H5kBlXmTvzSN9KQXlyJk2RMm28UbIbVqd
 LLRjL1XJm6aIvlQZpdXwnMigQpWFheW+lyWkMUAB6cLJL8h5gK474UOyE
 LXuwD84a9qV6eZY0NTK2w314nCH9lRFy47NZQUbc1VoHpn99LmHhec7Kd
 h3BR1nE7snPG9V1pNzKktyXOhCj2d5CYVQaffntHlwvRTL1QLVucbXoCO A==;
X-CSE-ConnectionGUID: yuExgI/wRh+wacWDpI8paQ==
X-CSE-MsgGUID: MrGs8sW6QZatJpoJW07+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="67105508"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="67105508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:04 -0700
X-CSE-ConnectionGUID: 3UfPtCAjTSiBT/xITUCBlQ==
X-CSE-MsgGUID: QOu3h5rwTyS+TGTR7DZWeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139836580"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.201])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/connector: move HDR sink metadata to display info
Date: Mon, 19 May 2025 14:29:00 +0300
Message-Id: <20250519112900.1383997-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Information parsed from the display EDID should be stored in display
info. Move HDR sink metadata there.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

This depends on commit 6692dbc15e5e ("drm/edid: fixed the bug that hdr
metadata was not reset") in drm-misc-fixes. Will need to wait for
backmerge.
---
 drivers/gpu/drm/display/drm_hdmi_helper.c     |  2 +-
 drivers/gpu/drm/drm_connector.c               |  2 +-
 drivers/gpu/drm/drm_edid.c                    | 19 ++++++++++---------
 .../drm/i915/display/intel_dp_aux_backlight.c |  2 +-
 include/drm/drm_connector.h                   |  8 +++++---
 5 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 855cb02b827d..45af1cf55973 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -44,7 +44,7 @@ int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 
 	/* Sink EOTF is Bit map while infoframe is absolute values */
 	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
-	    connector->hdr_sink_metadata.hdmi_type1.eotf))
+			       connector->display_info.hdr_sink_metadata.hdmi_type1.eotf))
 		DRM_DEBUG_KMS("Unknown EOTF %d\n", hdr_metadata->hdmi_metadata_type1.eotf);
 
 	err = hdmi_drm_infoframe_init(frame);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7..f7de3bb911c4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1645,7 +1645,7 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *	structure from userspace. This is received as blob and stored in
  *	&drm_connector_state.hdr_output_metadata. It parses EDID and saves the
  *	sink metadata in &struct hdr_sink_metadata, as
- *	&drm_connector.hdr_sink_metadata.  Driver uses
+ *	&drm_connector.display_info.hdr_sink_metadata.  Driver uses
  *	drm_hdmi_infoframe_set_hdr_metadata() helper to set the HDR metadata,
  *	hdmi_drm_infoframe_pack() to pack the infoframe as per spec, in case of
  *	HDMI encoder.
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74e77742b2bd..c6c61afeaa31 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5373,7 +5373,8 @@ static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
 
 static void drm_calculate_luminance_range(struct drm_connector *connector)
 {
-	struct hdr_static_metadata *hdr_metadata = &connector->hdr_sink_metadata.hdmi_type1;
+	const struct hdr_static_metadata *hdr_metadata =
+		&connector->display_info.hdr_sink_metadata.hdmi_type1;
 	struct drm_luminance_range_info *luminance_range =
 		&connector->display_info.luminance_range;
 	static const u8 pre_computed_values[] = {
@@ -5434,21 +5435,21 @@ static uint8_t hdr_metadata_type(const u8 *edid_ext)
 static void
 drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 {
+	struct hdr_static_metadata *hdr_metadata =
+		&connector->display_info.hdr_sink_metadata.hdmi_type1;
 	u16 len;
 
 	len = cea_db_payload_len(db);
 
-	connector->hdr_sink_metadata.hdmi_type1.eotf =
-						eotf_supported(db);
-	connector->hdr_sink_metadata.hdmi_type1.metadata_type =
-						hdr_metadata_type(db);
+	hdr_metadata->eotf = eotf_supported(db);
+	hdr_metadata->metadata_type = hdr_metadata_type(db);
 
 	if (len >= 4)
-		connector->hdr_sink_metadata.hdmi_type1.max_cll = db[4];
+		hdr_metadata->max_cll = db[4];
 	if (len >= 5)
-		connector->hdr_sink_metadata.hdmi_type1.max_fall = db[5];
+		hdr_metadata->max_fall = db[5];
 	if (len >= 6) {
-		connector->hdr_sink_metadata.hdmi_type1.min_cll = db[6];
+		hdr_metadata->min_cll = db[6];
 
 		/* Calculate only when all values are available */
 		drm_calculate_luminance_range(connector);
@@ -6596,7 +6597,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->has_hdmi_infoframe = false;
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
-	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
+	memset(&info->hdr_sink_metadata, 0, sizeof(info->hdr_sink_metadata));
 
 	info->edid_hdmi_rgb444_dc_modes = 0;
 	info->edid_hdmi_ycbcr444_dc_modes = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 271b27c9de51..5537136c367a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -145,7 +145,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 	 * ranges for such panels.
 	 */
 	if (display->params.enable_dpcd_backlight != INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL &&
-	    !(connector->base.hdr_sink_metadata.hdmi_type1.metadata_type &
+	    !(connector->base.display_info.hdr_sink_metadata.hdmi_type1.metadata_type &
 	      BIT(HDMI_STATIC_METADATA_TYPE1))) {
 		drm_info(display->drm,
 			 "[CONNECTOR:%d:%s] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d.\n",
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a3..1e7b8074564c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -799,6 +799,11 @@ struct drm_display_info {
 	 */
 	struct drm_hdmi_info hdmi;
 
+	/**
+	 * @hdr_sink_metadata: HDR Metadata Information read from sink
+	 */
+	struct hdr_sink_metadata hdr_sink_metadata;
+
 	/**
 	 * @non_desktop: Non desktop display (HMD).
 	 */
@@ -2241,9 +2246,6 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
-	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
-	struct hdr_sink_metadata hdr_sink_metadata;
-
 	/**
 	 * @hdmi: HDMI-related variable and properties.
 	 */
-- 
2.39.5

