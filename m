Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8D64EE60
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B438D10E5F4;
	Fri, 16 Dec 2022 16:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF9D10E5ED;
 Fri, 16 Dec 2022 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206475; x=1702742475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCPG6Yqo7wTPv5+RvjknKDTMwDW2+XH4iOgAhJX9OHI=;
 b=nUpGVcKuR9xWeEUUXeKf+IDs5fQJczVoQpQwYrUsIvJ/cK608OhOnGoX
 u2kaQCj0XmERrs7/jxEqBDes/XQDOM3LEWr5S+xPEb4c96E7Kh0lnCwAQ
 5pw8Xc4/4qdNK+/2NpSeyZkdCbkk8IYUOT9HuODZJsf9UthIAf4lcQ8+D
 fgBGzf146ORCqG4E0+uoDvauPvq2WP/J9I4RhXA4YGXRvnSkHbLJ0PdVt
 AsR2fq4pXKQeKGqVQ9LXBnotjdAvCKIVof+OgaPgKtBJLLuzZg6P0oqg4
 TWkeGXMAhKlFcMYKlUdyg/H3PjquVvez5A99czOKShcH4IF+54mfx5XBa A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383327088"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383327088"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="738576228"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="738576228"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 04/12] drm/edid: merge ELD handling to update_display_info()
Date: Fri, 16 Dec 2022 18:00:18 +0200
Message-Id: <d38f45c328dc0fdea444721df913d851321070f5.1671206131.git.jani.nikula@intel.com>
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

Simplify display info update by merging ELD handling as well as clearing
of the data in update_display_info().

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f40058d4c290..2246a5b10d2c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5529,8 +5529,6 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	int total_sad_count = 0;
 	int mnl;
 
-	clear_eld(connector);
-
 	if (!drm_edid)
 		return;
 
@@ -6377,9 +6375,15 @@ static void update_display_info(struct drm_connector *connector,
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
 
@@ -6462,6 +6466,9 @@ static void update_display_info(struct drm_connector *connector,
 
 	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
 		info->max_dsc_bpp = 15;
+
+	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
+	drm_edid_to_eld(connector, drm_edid);
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
@@ -6562,12 +6569,6 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
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
@@ -6575,8 +6576,8 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 */
 	update_display_info(connector, drm_edid);
 
-	/* Depends on info->cea_rev set by update_display_info() above */
-	drm_edid_to_eld(connector, drm_edid);
+	if (!drm_edid)
+		return 0;
 
 	/*
 	 * EDID spec says modes should be preferred in this order:
@@ -6713,10 +6714,7 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
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

