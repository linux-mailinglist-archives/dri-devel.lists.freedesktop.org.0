Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E4B51D557
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA8B10FB1A;
	Fri,  6 May 2022 10:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042E410FB1A;
 Fri,  6 May 2022 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831919; x=1683367919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4/x0LzcvT14dMCvyCn7flGhsCsKPjgvlZz5kHTuJQ7g=;
 b=RjRlUiX8KlQJONyvBqjW9hptj7PU1DpBGZtjO9/Uw/1zcKcvhC/0Icer
 1cJ6cN3zXFXhELU7ajA0QzMsNQ0jXylACHFIqNutDpUxhY07VY+H//e1a
 lmxjyhFJD0xYXf9jHyovnqZub4q0ACJ21vKQTOkbhPvb5t3rDxC1Ak4Ee
 MTMsUV3hdWAYUnyvjyLkDNQbawtdXmPjXXov1/guZKILpTApvIM7gaFAr
 UxCVM6GEuaOXKQ6oDSzRi7W0k2XDXCMlGBOu3k+CMZJGdbvisKbWR7hjo
 70qLJmy8g5dilRnf62R1wtUHZAol3A/pydtLhrfUMjiPfsVbuTi7NbmNZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268570837"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268570837"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="621764157"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/25] drm/edid: convert get_monitor_name() to drm_edid
Date: Fri,  6 May 2022 13:10:22 +0300
Message-Id: <9c58a6d742769834c279fdd4096f14c1b1259bbf.1651830938.git.jani.nikula@intel.com>
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

v2: Drop incorrect NULL name check (Dan Carpenter)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b8deced8de01..4fd2ee976d39 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4812,15 +4812,15 @@ monitor_name(const struct detailed_timing *timing, void *data)
 	*res = timing->data.other_data.data.str.str;
 }
 
-static int get_monitor_name(const struct edid *edid, char name[13])
+static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
 {
 	const char *edid_name = NULL;
 	int mnl;
 
-	if (!edid || !name)
+	if (!drm_edid || !name)
 		return 0;
 
-	drm_for_each_detailed_block(edid, monitor_name, &edid_name);
+	drm_for_each_detailed_block(drm_edid->edid, monitor_name, &edid_name);
 	for (mnl = 0; edid_name && mnl < 13; mnl++) {
 		if (edid_name[mnl] == 0x0a)
 			break;
@@ -4840,14 +4840,22 @@ static int get_monitor_name(const struct edid *edid, char name[13])
  */
 void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
 {
-	int name_length;
-	char buf[13];
+	int name_length = 0;
 
 	if (bufsize <= 0)
 		return;
 
-	name_length = min(get_monitor_name(edid, buf), bufsize - 1);
-	memcpy(name, buf, name_length);
+	if (edid) {
+		char buf[13];
+		struct drm_edid drm_edid = {
+			.edid = edid,
+			.size = edid_size(edid),
+		};
+
+		name_length = min(get_monitor_name(&drm_edid, buf), bufsize - 1);
+		memcpy(name, buf, name_length);
+	}
+
 	name[name_length] = '\0';
 }
 EXPORT_SYMBOL(drm_edid_get_monitor_name);
@@ -4887,7 +4895,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!drm_edid)
 		return;
 
-	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
-- 
2.30.2

