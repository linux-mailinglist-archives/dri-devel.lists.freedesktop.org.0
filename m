Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D051D563
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAEE10FBEB;
	Fri,  6 May 2022 10:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D2410FBEB;
 Fri,  6 May 2022 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831945; x=1683367945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nyZEX2Qitj9zevwlLPCRD5dAB3L6ayQsCFg1T8N7000=;
 b=iN2U7+bs4exERX/UOxARCw55XsxPbw4GnZzmskYusWMCvQJzKdw0n7DZ
 XjSF3V3Q6KeJLanONhobjEsbHWcKmtI4vwsPsknqQ5bIzP7TeZETbmx/t
 tRQJzVSYRb1RY3FmpnF+bZnxCWcvebixZoh9sxGPfe0aIM5MXMzO2AuiS
 TWT13bJbEVqvE3cqoRrp2vZ/BrKMEABYO3LdbsbT3UKnfZxEQ0admfOxL
 nPXCLCYId4OBqxR40w/GhjyC2+7OTamQ704KB1EBnn1Pprb+LV+bPZCX1
 2wVDG1IsIO22FnWu6D/yyvg7IF6/h80BxVQzoEy5CgYyv2sysaxX/a8PJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248331901"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248331901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="569049750"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/25] drm/edid: add drm_edid helper for
 drm_detect_monitor_audio()
Date: Fri,  6 May 2022 13:10:27 +0300
Message-Id: <14f174a3057d5f570d70ad219af117a5a9f3165b.1651830939.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 ++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3277b4fd33ce..706552ae00ea 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5144,19 +5144,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
 }
 EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 
-/**
- * drm_detect_monitor_audio - check monitor audio capability
- * @edid: EDID block to scan
- *
- * Monitor should have CEA extension block.
- * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
- * audio' only. If there is any audio extension block and supported
- * audio format, assume at least 'basic audio' support, even if 'basic
- * audio' is not defined in EDID.
- *
- * Return: True if the monitor supports audio, false otherwise.
- */
-bool drm_detect_monitor_audio(const struct edid *edid)
+static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 {
 	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
@@ -5164,7 +5152,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] == CEA_EXT) {
 			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
@@ -5179,7 +5167,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 	}
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			const u8 *data = cea_db_data(db);
@@ -5197,6 +5185,28 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 end:
 	return has_audio;
 }
+
+/**
+ * drm_detect_monitor_audio - check monitor audio capability
+ * @edid: EDID block to scan
+ *
+ * Monitor should have CEA extension block.
+ * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
+ * audio' only. If there is any audio extension block and supported
+ * audio format, assume at least 'basic audio' support, even if 'basic
+ * audio' is not defined in EDID.
+ *
+ * Return: True if the monitor supports audio, false otherwise.
+ */
+bool drm_detect_monitor_audio(const struct edid *edid)
+{
+	struct drm_edid drm_edid = {
+		.edid = edid,
+		.size = edid_size(edid),
+	};
+
+	return _drm_detect_monitor_audio(&drm_edid);
+}
 EXPORT_SYMBOL(drm_detect_monitor_audio);
 
 
-- 
2.30.2

