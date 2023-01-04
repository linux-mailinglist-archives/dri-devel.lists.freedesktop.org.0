Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615FC65D045
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800F010E54E;
	Wed,  4 Jan 2023 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB4010E54F;
 Wed,  4 Jan 2023 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826796; x=1704362796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0kQJQCib76iSqUU7R3xGxzzXlKQH4EGOpTUqIWhXt8=;
 b=Ecc/torF8Io4A2vqm1jF9BF4noGL+fhWSsXJMStZfSCjUmv7uK0ZV9L/
 lZrtBAZBJZh69cQIYKJc+u9OmCf5yX9PrjUHqP4plWTY61EV06szkzcNi
 88r2cpici/Ga74Cfgcg4iPkLxi/C1A2wXIvAocs5Z4hauKoJoPIrFm21u
 5ZyLZOxANmorX4Y4/awKaesR0VU8L1CKCL+YeGEhlZYm/bkOturDcJanX
 Q3kdTPLIHo3CPYd0yt9tCaJoRHX4GtHUilOKIgXSZqLenSfAI6hvWWu8/
 aCcUIEqRSPWZBKcXGxF2OCLGM7p6BjT1ceKEdFVJ66xJJUFevh3WNYlxo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333803"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333803"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983877079"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983877079"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 12/22] drm/edid: store quirks in display info
Date: Wed,  4 Jan 2023 12:05:27 +0200
Message-Id: <819b908f64ad2d158245917f436f24d33a65b95d.1672826282.git.jani.nikula@intel.com>
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

Although the quirks are internal to EDID parsing, it'll be helpful to
store them in display info to avoid having to pass them around.

This will also help separate adding probed modes (which needs the
quirks) from updating display info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 42 ++++++++++++++++++-------------------
 include/drm/drm_connector.h |  5 +++++
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5cb1d36ce48a..fd8d056e38c1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6461,18 +6461,20 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	kfree(info->vics);
 	info->vics = NULL;
 	info->vics_len = 0;
+
+	info->quirks = 0;
 }
 
-static u32 update_display_info(struct drm_connector *connector,
-			       const struct drm_edid *drm_edid)
+static void update_display_info(struct drm_connector *connector,
+				const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
 	const struct edid *edid = drm_edid->edid;
 
-	u32 quirks = edid_get_quirks(drm_edid);
-
 	drm_reset_display_info(connector);
 
+	info->quirks = edid_get_quirks(drm_edid);
+
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
@@ -6543,17 +6545,15 @@ static u32 update_display_info(struct drm_connector *connector,
 	drm_update_mso(connector, drm_edid);
 
 out:
-	if (quirks & EDID_QUIRK_NON_DESKTOP) {
+	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
 			    connector->base.id, connector->name,
 			    info->non_desktop ? " (redundant quirk)" : "");
 		info->non_desktop = true;
 	}
 
-	if (quirks & EDID_QUIRK_CAP_DSC_15BPP)
+	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
 		info->max_dsc_bpp = 15;
-
-	return quirks;
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
@@ -6651,8 +6651,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int _drm_edid_connector_update(struct drm_connector *connector,
 				      const struct drm_edid *drm_edid)
 {
+	struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
-	u32 quirks;
 
 	if (!drm_edid) {
 		drm_reset_display_info(connector);
@@ -6665,7 +6665,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 * To avoid multiple parsing of same block, lets parse that map
 	 * from sink info, before parsing CEA modes.
 	 */
-	quirks = update_display_info(connector, drm_edid);
+	update_display_info(connector, drm_edid);
 
 	/* Depends on info->cea_rev set by update_display_info() above */
 	drm_edid_to_eld(connector, drm_edid);
@@ -6684,7 +6684,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 *
 	 * XXX order for additional mode types in extension blocks?
 	 */
-	num_modes += add_detailed_modes(connector, drm_edid, quirks);
+	num_modes += add_detailed_modes(connector, drm_edid, info->quirks);
 	num_modes += add_cvt_modes(connector, drm_edid);
 	num_modes += add_standard_modes(connector, drm_edid);
 	num_modes += add_established_modes(connector, drm_edid);
@@ -6694,20 +6694,20 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
 		num_modes += add_inferred_modes(connector, drm_edid);
 
-	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
-		edid_fixup_preferred(connector, quirks);
+	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
+		edid_fixup_preferred(connector, info->quirks);
 
-	if (quirks & EDID_QUIRK_FORCE_6BPC)
-		connector->display_info.bpc = 6;
+	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
+		info->bpc = 6;
 
-	if (quirks & EDID_QUIRK_FORCE_8BPC)
-		connector->display_info.bpc = 8;
+	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
+		info->bpc = 8;
 
-	if (quirks & EDID_QUIRK_FORCE_10BPC)
-		connector->display_info.bpc = 10;
+	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
+		info->bpc = 10;
 
-	if (quirks & EDID_QUIRK_FORCE_12BPC)
-		connector->display_info.bpc = 12;
+	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
+		info->bpc = 12;
 
 	return num_modes;
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1c26c4e72c62..7b5048516185 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -728,6 +728,11 @@ struct drm_display_info {
 	 * @vics_len: Number of elements in vics. Internal to EDID parsing.
 	 */
 	int vics_len;
+
+	/**
+	 * @quirks: EDID based quirks. Internal to EDID parsing.
+	 */
+	u32 quirks;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.34.1

