Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F130E51FC16
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445C510EEF8;
	Mon,  9 May 2022 12:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0710EEF9;
 Mon,  9 May 2022 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097903; x=1683633903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y6527320DXjS/K1KKLYGDj1NI6tuGeHfVEt42F+CDNA=;
 b=Z9JQvEML/C/E4FjJC6HLEd0HMC8pe/olQW0tHJbhvyhp3jOdROc9CWO8
 MGuTVj1roM3hZADQrbZOLe+ESUu14l8wCg3biabaTQ+n7R0AzM0IF3Svy
 6ugVrPrIW5pQjRr719Iq7T/o4sB+GD6F79c76B+X1VIoHTGuxQks0sBID
 +Yv9/ppsW5yMoJGLkgASGUp5HasK32yZizFrvJQdAxajxJxcu9Rip5GOw
 iKNnMOc2d93cebod+c9QUT3QSQNdet/pBx8wATEiTSPnP1dslzuJQx/T7
 VYZxr+HlyuFFdyg8ix5Ofs4b+CDjEh3elb5LDBmhJv2g3ruxWpoJYXkUV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="251074466"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="251074466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="601935460"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/25] drm/edid: convert get_monitor_name() to drm_edid
Date: Mon,  9 May 2022 15:03:14 +0300
Message-Id: <c940aad14f323ef3a7907a0fb534011deb1589a9.1652097712.git.jani.nikula@intel.com>
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

v2: Drop incorrect NULL name check (Dan Carpenter)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 364949e146a9..e3ff0f31a614 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4830,15 +4830,15 @@ monitor_name(const struct detailed_timing *timing, void *data)
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
@@ -4858,14 +4858,22 @@ static int get_monitor_name(const struct edid *edid, char name[13])
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
@@ -4905,7 +4913,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!drm_edid)
 		return;
 
-	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
+	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
 	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
-- 
2.30.2

