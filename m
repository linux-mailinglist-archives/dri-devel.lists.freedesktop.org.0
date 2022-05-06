Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD051D545
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152D10F9F6;
	Fri,  6 May 2022 10:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E974010F9C2;
 Fri,  6 May 2022 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831872; x=1683367872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SZv66c2FNtaXxL0PsP8c5gYF4k1jMa/2uUMxrnXenew=;
 b=d+9kwwDyBz9EXTt38i2Ge2VYL6Mgamq0ZCwYakNwoKrubVdErKnKFS17
 tclUnSTgz3FqMXeqPh1PE+lJzil3CPVZXSXPQ4tGMpJxDCpM91CnILL2e
 aQHTo7+XNEounWQx1kfxelB7ZpdhJJf6RUK8CikM3kC+RebzY1Zb2XUAK
 4G2vX7T5y/xgMAYV2I0Y20I2B+KXWGfI9hfEqueXOtboPcmHrctJthRu7
 YkHJQAPpzh1D3jXZNpaQaIPNtbWuh0QjUkcgVJ+EP9P8Y2BgWtQKYvFEY
 RhDTio0qcgvXXyDgsnrpaTHmtkljCJc9jIGsPKnmz+BlGLvOyaUULMMuz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248959374"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248959374"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549800149"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/25] drm/edid: propagate drm_edid to drm_edid_to_eld()
Date: Fri,  6 May 2022 13:10:13 +0300
Message-Id: <6d8ecfb355155d8104bbf20ae735246ab088dde9.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

We'll need to propagate	drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c9d48fbd0a76..74038be72ad3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4865,13 +4865,13 @@ static void clear_eld(struct drm_connector *connector)
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
@@ -4882,10 +4882,10 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 
 	clear_eld(connector);
 
-	if (!edid)
+	if (!drm_edid)
 		return;
 
-	mnl = get_monitor_name(edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
@@ -4893,12 +4893,12 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 
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
@@ -5848,7 +5848,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	quirks = update_display_info(connector, drm_edid);
 
 	/* Depends on info->cea_rev set by drm_add_display_info() above */
-	drm_edid_to_eld(connector, edid);
+	drm_edid_to_eld(connector, drm_edid);
 
 	/*
 	 * EDID spec says modes should be preferred in this order:
-- 
2.30.2

