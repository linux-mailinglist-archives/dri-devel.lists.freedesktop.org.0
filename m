Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D69522F50
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 11:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9581510F9B1;
	Wed, 11 May 2022 09:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDFE10F9B0;
 Wed, 11 May 2022 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652261039; x=1683797039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CljKr8sVzZ5Hm4ZHpdGgYDrzq0XU+hMn3ruSGL2YKug=;
 b=AoM5MTFvXXpxSfemC1UI1LJOJAF5lXHTlwsWwJF90wnxgozjzKt3iXyY
 G/ZhTTFQ8+IHLeU7sndgeic6JBz/BvYe0ashVKcb20tpYbOlxhAT8Ovp9
 nMbId6ejrqlprFZ/iI5Xvy7Ovk4qSSBBXvCbX6LxRLgAoXLlC1hfrNlYR
 T9tlBQON/8OyeFljsfz1fi76F/+A2fATh+MysUsKdVrBzZRJl82CnPw8m
 tl4nz2Oh5ylQMStREUVBJ6lbdq5QEpdunNDrSWN5ou3joMDZkz+FQjP/y
 aQcY0JxghwB4ukCjACsRIRiQ4ouhd2hUeDt378Fy06ablF9A8otfLkYR9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267233065"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="267233065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:23:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="594027201"
Received: from kniesyn-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.131.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:23:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/edid: propagate drm_edid to drm_edid_to_eld()
Date: Wed, 11 May 2022 12:23:49 +0300
Message-Id: <20220511092349.4186498-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ddd28f56d1b2604bbf8457cb5bd3c6df34ff35b9.1652097712.git.jani.nikula@intel.com>
References: <ddd28f56d1b2604bbf8457cb5bd3c6df34ff35b9.1652097712.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

v3: Rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e89afa04d5ab..92a65ccbd730 100644
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
 
 	/* Depends on info->cea_rev set by update_display_info() above */
-	drm_edid_to_eld(connector, edid);
+	drm_edid_to_eld(connector, drm_edid);
 
 	/*
 	 * EDID spec says modes should be preferred in this order:
-- 
2.30.2

