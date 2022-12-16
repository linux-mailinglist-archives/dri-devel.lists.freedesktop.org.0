Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43B64EE72
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EFF10E5F9;
	Fri, 16 Dec 2022 16:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4D610E5ED;
 Fri, 16 Dec 2022 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206483; x=1702742483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4szs20UTY6bA5Vx+u8zdvqIBh7bKI+NLVBeLRrJyQ4M=;
 b=SwLfes7uNZSlWd3p2q9FmS8Lp2X3nFnne5qKzZks0glgx+sNPzwsYxvt
 6J8yu3QXAh4Yze2SEfpi+qz/pchbPwZ1hRNKgEX16VpHxnDtSiEIXx+RS
 QJN9dQeiWDOse4F8RZJb6yuy8TARiJVS76rmWyViMsx/dmwZu0gBFl58l
 HFNVLwQXO0HyrdVHMmx1YsTqpoHX7sIXb37yZ+/U0pcSxvtCv5tG936b4
 AuEEWtHBw6OBn0oOS+4iNoVb2BpXJ/C0TeXWDDhzg/Cg+YBu1h5KSPl7T
 mJrPsyUqqT1uWcrXJSx98QQYkAdkBKQk+bZks/RW3yS3hgUMn+ubS9QMy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="298665572"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="298665572"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="718399749"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="718399749"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 06/12] drm/edid: refactor _drm_edid_connector_update() and
 rename
Date: Fri, 16 Dec 2022 18:00:20 +0200
Message-Id: <f35102562feb9ca63462a902a582c3494fccde4d.1671206131.git.jani.nikula@intel.com>
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

By moving update_display_info() out of _drm_edid_connector_update() we
make the function purely about adding modes. Rename accordingly.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 15f69c362fc3..4ebfd7212bce 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6575,19 +6575,12 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
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
 
@@ -6692,7 +6685,9 @@ int drm_edid_connector_update(struct drm_connector *connector,
 {
 	int count;
 
-	count = _drm_edid_connector_update(connector, drm_edid);
+	update_display_info(connector, drm_edid);
+
+	count = _drm_edid_connector_add_modes(connector, drm_edid);
 
 	_drm_update_tile_info(connector, drm_edid);
 
@@ -6762,7 +6757,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
  */
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 {
-	struct drm_edid drm_edid;
+	struct drm_edid _drm_edid;
+	const struct drm_edid *drm_edid;
 
 	if (edid && !drm_edid_is_valid(edid)) {
 		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
@@ -6770,8 +6766,11 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
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

