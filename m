Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A44C9F62
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1063510EB9F;
	Wed,  2 Mar 2022 08:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7DF10EB9F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646210275; x=1677746275;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=2DSaECwO8R6OglLS66shFJwoI8HaXDbGu74rGOD5ncA=;
 b=Dd7lII5NcLje6ldiA5SqxMQ3pMHNFgOkolwvQzCVr1EtRi+lpPyqB2Xc
 hl8E8DISV/+SqRx+ccEBGFA/k/a+itvDV0SF5hvDfA5N1S8tom44VAhA9
 498r6sbJcz+4iSbHDpcBcJoZbgq23PjSU66vQIkOwxS1U41yaT1M0hoU1
 iMOIIvCwv4rC/dKsFwu6sYKjScnF1mDqFg4LtI7fV7ygbwP2RlLO6jV3b
 KANJI3D59cORGQ26Vm+AdCuvITM6nKXWF8bY9D3sHGhQ9RvsvmNrrxsYS
 oTUIYSa0Ti+rhHqSrzCuZfeLhwfwnHCsRAc+AiBA0/AKhJmeKVH2ACE6U A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253539683"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="253539683"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 00:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="508124688"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga002.jf.intel.com with ESMTP; 02 Mar 2022 00:37:54 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v3 2/4] drm/edid: parse multiple CEA extension block
Date: Wed,  2 Mar 2022 16:50:55 +0800
Message-Id: <20220302085057.27317-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302085057.27317-1-shawn.c.lee@intel.com>
References: <20220302085057.27317-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to find and parse more CEA ext blocks if edid->extensions
is greater than one.

v2: split prvious patch to two. And do CEA block parsing
    in this one.
v3: simplify this patch based on previous change.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 375e70d9de86..c4a47465ba76 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4319,16 +4319,24 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	const u8 *cea, *db;
+	u8 dbl, hdmi_len;
 	int modes = 0, ext_index = 0;
+	int i, start, end;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
+	for (;;) {
+		const u8 *hdmi = NULL, *video = NULL;
+		u8 video_len = 0;
+
+		cea = drm_find_cea_extension(edid, &ext_index);
+		if (!cea)
+			break;
+
+		if (cea_revision(cea) < 3)
+			continue;
 
 		if (cea_db_offsets(cea, &start, &end))
-			return 0;
+			continue;
 
 		for_each_cea_db(cea, i, start, end) {
 			db = &cea[i];
@@ -4350,15 +4358,15 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 							  dbl - 1);
 			}
 		}
-	}
 
-	/*
-	 * We parse the HDMI VSDB after having added the cea modes as we will
-	 * be patching their flags when the sink supports stereo 3D.
-	 */
-	if (hdmi)
-		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
-					    video_len);
+		/*
+		 * We parse the HDMI VSDB after having added the cea modes as we will
+		 * be patching their flags when the sink supports stereo 3D.
+		 */
+		if (hdmi)
+			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
+						    video_len);
+	}
 
 	return modes;
 }
-- 
2.31.1

