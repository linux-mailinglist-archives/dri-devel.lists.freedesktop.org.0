Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA84E488B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D86610E5C2;
	Tue, 22 Mar 2022 21:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5410E5B7;
 Tue, 22 Mar 2022 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985340; x=1679521340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=II+GyBHVkpm9sNxk7+428jmhTWrXRP/rhYnoH6Bzavg=;
 b=GrITlLALp2tkqi/sy44FCJ4GnMjjiNCt5gb0pO3HwxakGDGk6t1GpJmx
 XUPMspiuYorahmOvSmwsh+Y9j6gMDAawqOKp9wvwjCWuLXTdPOJtKWr49
 HUzw77KiQMnoYZT/QictI0tSeBcqf04OT0ObVY5Zz2s7UhE9tRfBnq0Mo
 XZ1DAjBxqtGTr85HW1ayCaTZGdCHgxlpbAYVcBaP+I24+VJj056mwN9sA
 5J5KqAaNIsGZ1HWOqTtrte7wpvW/QUHK/y0moKpkpj2OSwbJSKy+DDamM
 QuDp1kus5Z5ETh9gqlzvzQLmiUoZ8fQQRS+hAwE877+3CTYzwAewpa/Fe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240115913"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="240115913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="519082876"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 18/19] drm/edid: skip CEA extension scan in drm_edid_to_eld()
 just for CEA rev
Date: Tue, 22 Mar 2022 23:40:47 +0200
Message-Id: <bfc68f9ab578af4a429e210e6e6cf89e28bcb526.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
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

The DisplayID CTA data block version does not necessarily match the CEA
revision. Simplify by postponing drm_edid_to_eld() slightly, and reusing
the CEA revision extracted by drm_parse_cea_ext().

By not bailing out early in drm_edid_to_eld() we may end up filling
meaningless data to the ELD. However, the main decision for audio is not
the ELD, but rather drm_detect_monitor_audio() called by drivers.

(Arguably a future cleanup could do that in drm_add_edid_modes() and
cache the result in the connector.)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f40427dc5236..dfaa21f00941 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4710,10 +4710,10 @@ static void clear_eld(struct drm_connector *connector)
  */
 static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 {
+	struct drm_display_info *info = &connector->display_info;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	uint8_t *eld = connector->eld;
-	const u8 *cea;
 	int total_sad_count = 0;
 	int mnl;
 
@@ -4722,16 +4722,10 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
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
@@ -5681,8 +5675,6 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 		return 0;
 	}
 
-	drm_edid_to_eld(connector, edid);
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -5690,6 +5682,9 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
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

