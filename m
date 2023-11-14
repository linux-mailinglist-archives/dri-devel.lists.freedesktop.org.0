Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B27EAE7B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 11:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A837810E1E3;
	Tue, 14 Nov 2023 10:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9710E1FA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699959502; x=1731495502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3fr5hzP5cwj+Uls25iB0GCeIo9EBg40UoZroo3Bbp88=;
 b=crao46+hVA0qie4maOI/ZqCOVtcSOSRpM4xKLe236xpy6r1e0vDWyvKw
 vHXli2q0o1JYa3YXe6oaAP3vtIBT+7GhuXA7STfIgRNFcaUKJpal6hV94
 UOXMQnZWM9RN0R8ev8v3dDzDA7rJSVUGl2vKlj2C2ckryXP14R3EoSq2D
 fInGNot9sJeoeiCNKFZskrtxBeDpGSrjcxdqh/AIGvZGRooiu9eewc7Ri
 YOrnZF3LJkygeujjkwoTI2TIKre/sf/MKnEa7x0CEqSuNFzwJiJZ1Ccke
 6ZiHy2obOxfwgw0dkHmtQq1LrZLCsEB4a6Ifxg7WvDAdBcZzKqDR9XGO/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454923813"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="454923813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855246449"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="855246449"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:58:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/probe-helper: convert
 drm_connector_helper_get_modes_from_ddc() to struct drm_edid
Date: Tue, 14 Nov 2023 12:58:15 +0200
Message-Id: <20231114105815.4188901-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Going forward, the struct drm_edid based functions drm_edid_read(),
drm_edid_connector_update() and drm_edid_connector_add_modes() are the
preferred ways of retrieving the EDID and updating the connector.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 3f479483d7d8..309d88f13648 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1116,21 +1116,20 @@ EXPORT_SYMBOL(drm_crtc_helper_mode_valid_fixed);
  */
 int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
 {
-	struct edid *edid;
-	int count = 0;
+	const struct drm_edid *drm_edid;
+	int count;
 
 	if (!connector->ddc)
 		return 0;
 
-	edid = drm_get_edid(connector, connector->ddc);
+	drm_edid = drm_edid_read(connector);
+
+	/* clears property if EDID is NULL */
+	drm_edid_connector_update(connector, drm_edid);
 
-	// clears property if EDID is NULL
-	drm_connector_update_edid_property(connector, edid);
+	count = drm_edid_connector_add_modes(connector);
 
-	if (edid) {
-		count = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	drm_edid_free(drm_edid);
 
 	return count;
 }
-- 
2.39.2

