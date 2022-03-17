Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00404DC5CD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 13:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9D310EB56;
	Thu, 17 Mar 2022 12:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312310EB4A;
 Thu, 17 Mar 2022 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647520073; x=1679056073;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=iCHiRQrceVBMKgv90YGp4PSwebk+8BRBphnQAdUX0ks=;
 b=aRoRivPfCx7Iwjn0c1pj/A2yt+MZQQnV4hwIq6kq3sfUjiET2bDVZpQ1
 3kCBXSyMLYYCQHh9IgDtGQchyDsNCR8SeX7wkmXTJtY6QuDLK2zbV8Axn
 NFNA6ZmNHnjuXlpzatjLcepTf4ow2TG5P33AMsckztITDj2T4vtFrnMvf
 XHQBk0NjpVZc3WKdrNXtEcWFuhpBpgpIwrmdPewabjVbRIYNUXmDJQ1FR
 7pjsgEamcToyQukQoUaF8anXYR4ONaErs4PdKDkLWnC76qldZEcA4JWbI
 jRZ900bHJ7YH1YTH6xKN+c3p30CDNMoCNBypoVzb2x3+uwApIj+92/AD4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237463785"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237463785"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 05:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="581276707"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 05:27:51 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v8 2/5] drm/edid: parse multiple CEA extension block
Date: Thu, 17 Mar 2022 20:41:59 +0800
Message-Id: <20220317124202.14189-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317124202.14189-1-shawn.c.lee@intel.com>
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>,
 ankit.k.nautiyal@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to find and parse more CEA ext blocks if edid->extensions
is greater than one.

v2: split prvious patch to two. And do CEA block parsing
    in this one.
v3: simplify this patch based on previous change.
v4: refine patch v3.
v5: revert previous change.
    And check cea pointer return from drm_find_cea_extension().
    If drvier got the same cea pointer then exit this routine.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Drew Davenport <ddavenport@chromium.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1251226d9284..ef65dd97d700 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4319,16 +4319,24 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
 	int modes = 0, ext_index = 0;
+	const u8 *cur_cea = NULL;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
-	if (cea && cea_revision(cea) >= 3) {
+	for (;;) {
+		const u8 *cea, *db, *hdmi = NULL, *video = NULL;
+		u8 dbl, hdmi_len = 0, video_len = 0;
 		int i, start, end;
 
+		cea = drm_find_cea_extension(edid, &ext_index);
+		if (!cea || cea == cur_cea)
+			break;
+		cur_cea = cea;
+
+		if (cea_revision(cea) < 3)
+			continue;
+
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
2.17.1

