Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B84E4FF9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12B610E664;
	Wed, 23 Mar 2022 10:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11FB10E65C;
 Wed, 23 Mar 2022 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648029901; x=1679565901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9IX2ChMG+tQUey05sXOupe0vFV+0tsB4fpa7vGdsz4M=;
 b=GXdE1/OhiAU4i/ItC5Saf5tmDf6pOOTXARB1T6VC1NxEjmO4AoYnLA0C
 jx/Bmh1sC7v6VeE9EnVex3sxpRq84C+Zg3dKxbd9Nc9wbMV1/GCYcOG6w
 fTxIWHU/JdE4NswkbrI/GSgk+BCWMmFZbrzx9/66iz/RmSJ841Ob5DjNc
 /LkZeA5dgqiuo+YbMXl9AL7F57wfJzsFalqTbaofQgeKO3YL1/ghWHC/N
 zNYBEWyFRQO2yruLQ2uF2wwvCGSZDowsNSsq7pd8gCVSbCvSw7GW8cnMq
 B5oRwnFCLo1SK1yNdKd1erZtRVz3lVoJCuw/rUafhN2zOqj6l+oemzrgb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="256894894"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="256894894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 03:04:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="544127102"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 03:04:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: fix CEA extension byte #3 parsing
Date: Wed, 23 Mar 2022 12:04:38 +0200
Message-Id: <20220323100438.1757295-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Shawn C Lee <shawn.c.lee@intel.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only an EDID CEA extension has byte #3, while the CTA DisplayID Data
Block does not. Don't interpret bogus data for color formats.

For most displays it's probably an unlikely scenario you'd have a CTA
DisplayID Data Block without a CEA extension, but they do exist.

Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
Cc: <stable@vger.kernel.org> # v4.15
Cc: Shawn C Lee <shawn.c.lee@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

commit e28ad544f462 was merged in v5.3, but it has Cc: stable for v4.15.

This is also fixed in my CEA data block iteration series [1], but we'll
want the simple fix for stable first.

Hum, CTA is formerly CEA, I and the code seem to use both, should we use
only one or the other?

[1] https://patchwork.freedesktop.org/series/101659/
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..ccf7031a6797 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5187,10 +5187,14 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 	/* The existence of a CEA block should imply RGB support */
 	info->color_formats = DRM_COLOR_FORMAT_RGB444;
-	if (edid_ext[3] & EDID_CEA_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
-	if (edid_ext[3] & EDID_CEA_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+
+	/* CTA DisplayID Data Block does not have byte #3 */
+	if (edid_ext[0] == CEA_EXT) {
+		if (edid_ext[3] & EDID_CEA_YCRCB444)
+			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+		if (edid_ext[3] & EDID_CEA_YCRCB422)
+			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+	}
 
 	if (cea_db_offsets(edid_ext, &start, &end))
 		return;
-- 
2.30.2

