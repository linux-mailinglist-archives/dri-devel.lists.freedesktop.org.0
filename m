Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4D60A669
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8766310E546;
	Mon, 24 Oct 2022 12:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97F210E522;
 Mon, 24 Oct 2022 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614902; x=1698150902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EifGz9CpdzCpU7Xcb+/70ZnIjfWmAky/PmGJX9SHbs=;
 b=MQ1iz+bCooFFLQCEgpzzClGMbDOdI0utofo1zm8OXGMw3kDCvK7K1BRD
 mrtpR1AcmFTwulUQnHcMspLhoG4m+3EcSA2AJ+4WbuL6ZdjYUt4EvT3++
 adcJbX6fCHfjLIviU+fGrKMqSWNVBavTmMgpPIJcjV6lyrxPITnQMoUh0
 0UblLQDybCkwTnB96ZqFpJS5syczblwZYi9y/G/9oanFhY3SOtuoZbcqp
 akPQZ25gUUps75dD3HFAwavsNXdmhoYcFnkyMVA2Q0QV9ahnvrUYpNQ/3
 zRunL41uVM28B+MLpNKRjp100tjWyahgGw/Nw+21kLaIbFZ6IDtHDcmtj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="308498285"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="308498285"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055777"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055777"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/16] drm/edid: add [CONNECTOR:%d:%s] to debug logging
Date: Mon, 24 Oct 2022 15:33:43 +0300
Message-Id: <5884410682bcbc032de4d3af8562c0b271edaa7f.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

Reference the connector using [CONNECTOR:%d:%s] in existing device based
debug logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9078d1fb6d00..3be98ac2e711 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2196,7 +2196,8 @@ static void connector_bad_edid(struct drm_connector *connector,
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
 
-	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID is invalid:\n",
+		    connector->base.id, connector->name);
 	for (i = 0; i < num_blocks; i++)
 		edid_block_dump(KERN_DEBUG, edid + i, i);
 }
@@ -6031,7 +6032,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	}
 
 	drm_dbg_kms(connector->dev,
-		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
+		    "[CONNECTOR:%d:%s] HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
+		    connector->base.id, connector->name,
 		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
 }
 
@@ -6131,8 +6133,9 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
 	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
 		info->non_desktop = true;
 
-	drm_dbg_kms(connector->dev, "HMD or specialized display VSDB version %u: 0x%02x\n",
-		    version, db[5]);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] HMD or specialized display VSDB version %u: 0x%02x\n",
+		    connector->base.id, connector->name, version, db[5]);
 }
 
 static void drm_parse_cea_ext(struct drm_connector *connector,
@@ -6253,8 +6256,9 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	struct drm_display_info *info = &connector->display_info;
 
 	if (block->num_bytes < 3) {
-		drm_dbg_kms(connector->dev, "Unexpected vendor block size %u\n",
-			    block->num_bytes);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Unexpected vendor block size %u\n",
+			    connector->base.id, connector->name, block->num_bytes);
 		return;
 	}
 
@@ -6262,13 +6266,16 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		return;
 
 	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
-		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
+			    connector->base.id, connector->name);
 		return;
 	}
 
 	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
 	default:
-		drm_dbg_kms(connector->dev, "Reserved MSO mode value\n");
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
+			    connector->base.id, connector->name);
 		fallthrough;
 	case 0:
 		info->mso_stream_count = 0;
@@ -6288,12 +6295,16 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 
 	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
 	if (info->mso_pixel_overlap > 8) {
-		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+			    connector->base.id, connector->name,
 			    info->mso_pixel_overlap);
 		info->mso_pixel_overlap = 8;
 	}
 
-	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
+		    connector->base.id, connector->name,
 		    info->mso_stream_count, info->mso_pixel_overlap);
 }
 
@@ -6421,7 +6432,8 @@ static u32 update_display_info(struct drm_connector *connector,
 
 out:
 	if (quirks & EDID_QUIRK_NON_DESKTOP) {
-		drm_dbg_kms(connector->dev, "Non-desktop display%s\n",
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
+			    connector->base.id, connector->name,
 			    info->non_desktop ? " (redundant quirk)" : "");
 		info->non_desktop = true;
 	}
@@ -6732,8 +6744,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 	struct drm_edid drm_edid;
 
 	if (edid && !drm_edid_is_valid(edid)) {
-		drm_warn(connector->dev, "%s: EDID invalid.\n",
-			 connector->name);
+		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
+			 connector->base.id, connector->name);
 		edid = NULL;
 	}
 
-- 
2.34.1

