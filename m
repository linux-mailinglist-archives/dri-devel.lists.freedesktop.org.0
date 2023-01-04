Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E265D049
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83D010E552;
	Wed,  4 Jan 2023 10:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7C10E552;
 Wed,  4 Jan 2023 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826804; x=1704362804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lzd9CvG2MHlbjMK5+M+h/rhZ6E6nsuExOH2IeaaVxfQ=;
 b=RTDIpR855+d9yhAnpmI6ZmzI6Is0+D4AMOUvKxTQFxqXnaiaFqO25RHh
 /dT8Xtxg+2ZAQVYUiRGF5gKeWuq8r4JQ3q0XXfdpKWSRxGAeWB35rASTO
 2v0W0PJzm/3PnE1OK8dN+Ss6Hx4BeI+4I/Sq7ulPQiNTRVfrws4TnpHug
 zCXcNX0UMvGH5ydBKrryKMF5dBCduF4dz4QcKNu6I4qyzJLw2VA/xwxTi
 u0lNfAHu2aKZdu8RsFL5yDQkmOJW6WBZxIBw1OAqfT7Xt81Zq7sLhvKkC
 teFbCLsWAUXYARnp+/tl+HBVHlxVztGF4QzjqaERxYtEojflG/zlLWPv3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333832"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333832"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983877104"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983877104"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 14/22] drm/edid: merge ELD handling to update_display_info()
Date: Wed,  4 Jan 2023 12:05:29 +0200
Message-Id: <1f2e7424b998fbcdd9cea488e7d6d7cbb26c460f.1672826282.git.jani.nikula@intel.com>
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

Simplify display info update by merging ELD handling as well as clearing
of the data in update_display_info().

The connector->eld really should be moved under display_info altogether,
but that's for another time.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6bc0432046c8..810a5fca398a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5489,8 +5489,6 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	int total_sad_count = 0;
 	int mnl;
 
-	clear_eld(connector);
-
 	if (!drm_edid)
 		return;
 
@@ -6465,9 +6463,15 @@ static void update_display_info(struct drm_connector *connector,
 				const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
-	const struct edid *edid = drm_edid->edid;
+	const struct edid *edid;
 
 	drm_reset_display_info(connector);
+	clear_eld(connector);
+
+	if (!drm_edid)
+		return;
+
+	edid = drm_edid->edid;
 
 	info->quirks = edid_get_quirks(drm_edid);
 
@@ -6550,6 +6554,9 @@ static void update_display_info(struct drm_connector *connector,
 
 	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
 		info->max_dsc_bpp = 15;
+
+	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
+	drm_edid_to_eld(connector, drm_edid);
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
@@ -6650,12 +6657,6 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
 
-	if (!drm_edid) {
-		drm_reset_display_info(connector);
-		clear_eld(connector);
-		return 0;
-	}
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -6663,8 +6664,8 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 */
 	update_display_info(connector, drm_edid);
 
-	/* Depends on info->cea_rev set by update_display_info() above */
-	drm_edid_to_eld(connector, drm_edid);
+	if (!drm_edid)
+		return 0;
 
 	/*
 	 * EDID spec says modes should be preferred in this order:
@@ -6801,10 +6802,7 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
 	 * that it seems better to duplicate it rather than attempt to ensure
 	 * some arbitrary ordering of calls.
 	 */
-	if (drm_edid)
-		update_display_info(connector, drm_edid);
-	else
-		drm_reset_display_info(connector);
+	update_display_info(connector, drm_edid);
 
 	_drm_update_tile_info(connector, drm_edid);
 
-- 
2.34.1

