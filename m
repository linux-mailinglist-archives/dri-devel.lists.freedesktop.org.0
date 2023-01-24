Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80867945D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 10:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD3710E639;
	Tue, 24 Jan 2023 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800D10E639;
 Tue, 24 Jan 2023 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674553327; x=1706089327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZsRnkVlArIbVkYSygV8EYeU3TeVVItBefYyE8gOzmw=;
 b=nsmgrDPuDgm7PYO9aWY6sXfNitrxQYooGmyMQMUUmzy8qs6pp5wVOJ1y
 KtU38zrZ21VJlGk22CGB8VQHdodHbycLdO6h3dDCyuVlH95HwFCfrLUwe
 UiZC56gQ2fG5NNSlXxSsiDiIM2lgl8mPJoxmvnyxQ1iYko5CxfGFpgASS
 zvH7PxXxoRaNnzj4fKiTt644oLORseQ8Pu1phENwQMzoD3bC19O2UaoAz
 UrDSY2Ja8LeFZGTmjD0fWdgtfBSSsiFxXDIHCK0olfFDLgQ27CArMtX+E
 TVOahEhVhOusLThzR0MvpSULvcFI2FtDbcg8x2rog+avBlhYgg02R6BfW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328348486"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="328348486"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:42:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="662067699"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="662067699"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:42:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/connector: move HDR sink metadata to display info
Date: Tue, 24 Jan 2023 11:41:53 +0200
Message-Id: <20230124094154.2282778-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124094154.2282778-1-jani.nikula@intel.com>
References: <20230124094154.2282778-1-jani.nikula@intel.com>
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

Information parsed from the display EDID should be stored in display
info. The functional change here is clearing the HDR sink metadata in
drm_reset_display_info(), which should be the right thing to do anyway.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c       |  2 +-
 drivers/gpu/drm/drm_connector.c                 |  2 +-
 drivers/gpu/drm/drm_edid.c                      | 17 +++++++++--------
 .../drm/i915/display/intel_dp_aux_backlight.c   |  2 +-
 include/drm/drm_connector.h                     |  8 +++++---
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 0264abe55278..001369e023e3 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -44,7 +44,7 @@ int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
 
 	/* Sink EOTF is Bit map while infoframe is absolute values */
 	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
-	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
+	    connector->display_info.hdr_sink_metadata.hdmi_type1.eotf)) {
 		DRM_DEBUG_KMS("EOTF Not Supported\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9d0250c28e9b..5a2ff375ba47 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1345,7 +1345,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	structure from userspace. This is received as blob and stored in
  *	&drm_connector_state.hdr_output_metadata. It parses EDID and saves the
  *	sink metadata in &struct hdr_sink_metadata, as
- *	&drm_connector.hdr_sink_metadata.  Driver uses
+ *	&drm_connector.display_info.hdr_sink_metadata.  Driver uses
  *	drm_hdmi_infoframe_set_hdr_metadata() helper to set the HDR metadata,
  *	hdmi_drm_infoframe_pack() to pack the infoframe as per spec, in case of
  *	HDMI encoder.
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6dc4591da0bc..1ce3f153868d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5282,7 +5282,8 @@ static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
 
 static void drm_calculate_luminance_range(struct drm_connector *connector)
 {
-	struct hdr_static_metadata *hdr_metadata = &connector->hdr_sink_metadata.hdmi_type1;
+	const struct hdr_static_metadata *hdr_metadata =
+		&connector->display_info.hdr_sink_metadata.hdmi_type1;
 	struct drm_luminance_range_info *luminance_range =
 		&connector->display_info.luminance_range;
 	static const u8 pre_computed_values[] = {
@@ -5343,21 +5344,21 @@ static uint8_t hdr_metadata_type(const u8 *edid_ext)
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
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 83af95bce98d..0e3491c9c304 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -144,7 +144,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 	 * ranges for such panels.
 	 */
 	if (i915->params.enable_dpcd_backlight != INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL &&
-	    !(connector->base.hdr_sink_metadata.hdmi_type1.metadata_type &
+	    !(connector->base.display_info.hdr_sink_metadata.hdmi_type1.metadata_type &
 	      BIT(HDMI_STATIC_METADATA_TYPE1))) {
 		drm_info(&i915->drm,
 			 "Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d. needs this, please file a _new_ bug report on drm/i915, see " FDO_BUG_URL " for details.\n",
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b5048516185..627bedc47511 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -686,6 +686,11 @@ struct drm_display_info {
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
@@ -1790,9 +1795,6 @@ struct drm_connector {
 	 * &drm_mode_config.connector_free_work.
 	 */
 	struct llist_node free_node;
-
-	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
-	struct hdr_sink_metadata hdr_sink_metadata;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
-- 
2.34.1

