Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F9673E75
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55E310E99B;
	Thu, 19 Jan 2023 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9BB10E99C;
 Thu, 19 Jan 2023 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145159; x=1705681159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UaBvTPPN/qFm6aJAGwv9/wUEunB/aBJDdH/97Lxe6T4=;
 b=BvguqtmlS49PPdx6c9YiCeNNBLsECRibcpFzKUInDkX/jYjQqAS/ez6v
 5VhRW3ZfB9HBHAmGV2xf/44yDg863l7d6ALTMsku9s7CYVSCOp0Q8DixP
 aXrvic1gENxrN2lt9JJnITzzhhaF/WPzDsrJOj93jEc5Edslr9uIbBz9e
 QMipLKiaXouhAkhcPQKPJWF1ByI1vA63RxzA8/rZaqGKzeaxbIePHXLNb
 qgwOTuimG6U6JnucunSnbYc6/sPcKncYGiaQvhq/IX+RbqgDpvBh/EdVF
 YzgsXT5FMrtWamDPxan5eesYOVlTE1siO/4jpYLIO0/F9UppLOXDAmpv4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305699221"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305699221"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637756000"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="637756000"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 2/8] drm/edid: refactor _drm_edid_connector_update() and
 rename
Date: Thu, 19 Jan 2023 18:18:55 +0200
Message-Id: <e9880bbb2b5724d9aac88a90a31ba3ba9af9da3f.1674144945.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674144945.git.jani.nikula@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
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

By moving update_display_info() out of _drm_edid_connector_update() we
make the function purely about adding modes. Rename accordingly.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ee453e39562a..f9502df3dbca 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6637,19 +6637,12 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
-static int _drm_edid_connector_update(struct drm_connector *connector,
-				      const struct drm_edid *drm_edid)
+static int _drm_edid_connector_add_modes(struct drm_connector *connector,
+					 const struct drm_edid *drm_edid)
 {
 	const struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
 
-	/*
-	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
-	 * To avoid multiple parsing of same block, lets parse that map
-	 * from sink info, before parsing CEA modes.
-	 */
-	update_display_info(connector, drm_edid);
-
 	if (!drm_edid)
 		return 0;
 
@@ -6754,7 +6747,9 @@ int drm_edid_connector_update(struct drm_connector *connector,
 {
 	int count;
 
-	count = _drm_edid_connector_update(connector, drm_edid);
+	update_display_info(connector, drm_edid);
+
+	count = _drm_edid_connector_add_modes(connector, drm_edid);
 
 	_drm_update_tile_info(connector, drm_edid);
 
@@ -6824,7 +6819,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
  */
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 {
-	struct drm_edid drm_edid;
+	struct drm_edid _drm_edid;
+	const struct drm_edid *drm_edid;
 
 	if (edid && !drm_edid_is_valid(edid)) {
 		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
@@ -6832,8 +6828,11 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 		edid = NULL;
 	}
 
-	return _drm_edid_connector_update(connector,
-					  drm_edid_legacy_init(&drm_edid, edid));
+	drm_edid = drm_edid_legacy_init(&_drm_edid, edid);
+
+	update_display_info(connector, drm_edid);
+
+	return _drm_edid_connector_add_modes(connector, drm_edid);
 }
 EXPORT_SYMBOL(drm_add_edid_modes);
 
-- 
2.34.1

