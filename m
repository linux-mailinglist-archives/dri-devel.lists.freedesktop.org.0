Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48014D7578
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 14:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BF510E11D;
	Sun, 13 Mar 2022 13:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE810E059;
 Sun, 13 Mar 2022 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647178394; x=1678714394;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=QtrMHmhLQqP+pMkwm0xYjvpOXRA6MQSJeB1LfeQgu+M=;
 b=D20F+Gs2wugq2DYj4XAi0XTTPHQcL5CMcoYnqgwok6DFxD9tRliK2vI+
 suNUUHy8Dx2ebtTNKK/LodzDV/lh6HKjBs4uZIpmGqIZXl86ZlJb5q+xy
 00fwRg/NhtU2gJGyHmG2s9qLJpJAcjwQhqnZ59iSuQ2P2J85r0wLEbNvx
 0+LRwJ2YqDfLkjTyTcpy+lLojXZ5enznkSQBRXhQmEjKxYdW/ouMkYEKt
 gmz37g0wD9okUIZSe3E0EUbt2LCpFM5C8kPZS0EL4mcMpiHsHuUZSjITI
 b2njTHlKRctNGVr3Wn2lCyR36SytHU+C0Qg9sT+aU7pL+NF0RAcSxO1Vj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="255600693"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="255600693"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 06:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="515101472"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga006.jf.intel.com with ESMTP; 13 Mar 2022 06:33:12 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v7 2/5] drm/edid: parse multiple CEA extension block
Date: Sun, 13 Mar 2022 21:46:59 +0800
Message-Id: <20220313134702.24175-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220313134702.24175-1-shawn.c.lee@intel.com>
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Drew Davenport <ddavenport@chromium.org>, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to find and parse more CEA ext blocks if edid->extensions
is greater than one.

v2: split prvious patch to two. And do CEA block parsing
    in this one.
v3: simplify this patch based on previous change.
v4: refine patch v3.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Drew Davenport <ddavenport@chromium.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 78c415aa6889..9fa84881fbba 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4320,16 +4320,22 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
 	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
 
-	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
-	if (cea && cea_revision(cea) >= 3) {
+	for (;;) {
+		const u8 *cea, *db, *hdmi = NULL, *video = NULL;
+		u8 dbl, hdmi_len = 0, video_len = 0;
 		int i, start, end;
 
+		cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+		if (!cea)
+			break;
+
+		if (cea_revision(cea) < 3)
+			continue;
+
 		if (cea_db_offsets(cea, &start, &end))
-			return 0;
+			continue;
 
 		for_each_cea_db(cea, i, start, end) {
 			db = &cea[i];
@@ -4351,15 +4357,15 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
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

