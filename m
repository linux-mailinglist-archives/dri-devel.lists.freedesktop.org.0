Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F74501287
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF81810FD3E;
	Thu, 14 Apr 2022 15:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017E10FD1C;
 Thu, 14 Apr 2022 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948929; x=1681484929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhkRvqSjUK+4Bze5RBWlBpCZK5hGkqBoL+126PYT728=;
 b=OQ2EipxXkyn1eZBuJ0O0eQO/UDsR8VVYzNkxkRbPh07eSe8WLb7QY84E
 svgLTnPEL1FQsC3Xi50OpAeXTQYgQyj1X50qJKxYdO2OMY8bZRlMxFlQx
 ZuKYuu9hlKrsNPRGXlpHdVAgEtXMQe+UcuJfc9Z16ms5ugp+gVnsNJJXM
 i1HRt67gZXjSbK1J0HEow/joOfqkpOUwgEh6n34+n1lvjnpFxcFaDwy7A
 hWFeQlZ1VJTfgtrsHFEwm/zb4DpZYMSvFPvsVBXzdVoPkc+7pp9O7toVb
 GLxV0XXFcBf8qspfuojTmNgpkCYj7GG9PnMAHEQD4y0RHC0ERwL0snTgX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="260546312"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="260546312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="656039577"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/19] drm/edid: skip CTA extension scan in drm_edid_to_eld()
 just for CTA rev
Date: Thu, 14 Apr 2022 18:07:01 +0300
Message-Id: <c9fbbc367c0b4ce9f770e12395ec9da4de570c51.1649948563.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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

The DisplayID CTA data block version does not necessarily match the CTA
revision. Simplify by postponing drm_edid_to_eld() slightly, and reusing
the CTA revision extracted by drm_parse_cea_ext().

By not bailing out early in drm_edid_to_eld() we may end up filling
meaningless data to the ELD. However, the main decision for audio is not
the ELD, but rather drm_detect_monitor_audio() called by drivers.

(Arguably a future cleanup could do that in drm_add_edid_modes() and
cache the result in the connector.)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fad9fd13937b..ccd7d075eeb8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4887,10 +4887,10 @@ static void clear_eld(struct drm_connector *connector)
 static void drm_edid_to_eld(struct drm_connector *connector,
 			    const struct edid *edid)
 {
+	const struct drm_display_info *info = &connector->display_info;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	uint8_t *eld = connector->eld;
-	const u8 *cea;
 	int total_sad_count = 0;
 	int mnl;
 
@@ -4899,16 +4899,10 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
-	if (!cea) {
-		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
-		return;
-	}
-
 	mnl = get_monitor_name(edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
-	eld[DRM_ELD_CEA_EDID_VER_MNL] = cea[1] << DRM_ELD_CEA_EDID_VER_SHIFT;
+	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
 	eld[DRM_ELD_CEA_EDID_VER_MNL] |= mnl;
 
 	eld[DRM_ELD_VER] = DRM_ELD_VER_CEA861D;
@@ -5847,8 +5841,6 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 		return 0;
 	}
 
-	drm_edid_to_eld(connector, edid);
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -5856,6 +5848,9 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	 */
 	quirks = drm_add_display_info(connector, edid);
 
+	/* Depends on info->cea_rev set by drm_add_display_info() above */
+	drm_edid_to_eld(connector, edid);
+
 	/*
 	 * EDID spec says modes should be preferred in this order:
 	 * - preferred detailed mode
-- 
2.30.2

