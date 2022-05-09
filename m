Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A851FC02
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E28E10EE7C;
	Mon,  9 May 2022 12:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC27A10EE7B;
 Mon,  9 May 2022 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097839; x=1683633839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vnNXBNxE0aNt8VeQiIpq51UIvY9/m5L7/30H2a8Tj+s=;
 b=fo+jQ9O6+bm3VSMmKQF0jT7Wxy/p31cwyvAuxr9xmUdDILZR85SQvH9H
 3MXNDVeXhczGG62f2zQwPPpG8gWlTq9EQ7oEBoRmTHJUsBCCq8f15L3uj
 UDni0vK0DzC4rYH91rwOhp4Rb5WclFRz4j+rSYXGc4ho0yeiz7YjNbJlJ
 WP2vUr3HlqSVKobQLvuhibBhaN+6yny8VyE/v5mIWlJlzWcbyVPyd0bXS
 sB9O2lFkniMs8HCCWAMjjr3uLFb130s0IdCg3GCHsMYJn7npT+7P0vw72
 PLo8DAWHj+SGvHjzlZ8JRWBGXYEp6GNGNr7SJNNxk5fJcDAT78HNsQESX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="269167462"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="269167462"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="696464289"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/25] drm/edid: propagate drm_edid to drm_edid_to_eld()
Date: Mon,  9 May 2022 15:03:05 +0300
Message-Id: <ddd28f56d1b2604bbf8457cb5bd3c6df34ff35b9.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 96e3f9327044..e4fdf742645b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4883,13 +4883,13 @@ static void clear_eld(struct drm_connector *connector)
 /*
  * drm_edid_to_eld - build ELD from EDID
  * @connector: connector corresponding to the HDMI/DP sink
- * @edid: EDID to parse
+ * @drm_edid: EDID to parse
  *
  * Fill the ELD (EDID-Like Data) buffer for passing to the audio driver. The
  * HDCP and Port_ID ELD fields are left for the graphics driver to fill in.
  */
 static void drm_edid_to_eld(struct drm_connector *connector,
-			    const struct edid *edid)
+			    const struct drm_edid *drm_edid)
 {
 	const struct drm_display_info *info = &connector->display_info;
 	const struct cea_db *db;
@@ -4900,10 +4900,10 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 
 	clear_eld(connector);
 
-	if (!edid)
+	if (!drm_edid)
 		return;
 
-	mnl = get_monitor_name(edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
@@ -4911,12 +4911,12 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 
 	eld[DRM_ELD_VER] = DRM_ELD_VER_CEA861D;
 
-	eld[DRM_ELD_MANUFACTURER_NAME0] = edid->mfg_id[0];
-	eld[DRM_ELD_MANUFACTURER_NAME1] = edid->mfg_id[1];
-	eld[DRM_ELD_PRODUCT_CODE0] = edid->prod_code[0];
-	eld[DRM_ELD_PRODUCT_CODE1] = edid->prod_code[1];
+	eld[DRM_ELD_MANUFACTURER_NAME0] = drm_edid->edid->mfg_id[0];
+	eld[DRM_ELD_MANUFACTURER_NAME1] = drm_edid->edid->mfg_id[1];
+	eld[DRM_ELD_PRODUCT_CODE0] = drm_edid->edid->prod_code[0];
+	eld[DRM_ELD_PRODUCT_CODE1] = drm_edid->edid->prod_code[1];
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *data = cea_db_data(db);
 		int len = cea_db_payload_len(db);
@@ -5864,7 +5864,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	quirks = update_display_info(connector, drm_edid);
 
 	/* Depends on info->cea_rev set by drm_add_display_info() above */
-	drm_edid_to_eld(connector, edid);
+	drm_edid_to_eld(connector, drm_edid);
 
 	/*
 	 * EDID spec says modes should be preferred in this order:
-- 
2.30.2

