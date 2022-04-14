Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8664F501283
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF9110FD16;
	Thu, 14 Apr 2022 15:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E0210FD1C;
 Thu, 14 Apr 2022 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948924; x=1681484924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3KbuO80w+41ggY16yuNxZOwj8s6ASjwQ6mJRFgjV/0=;
 b=KxYRDm0AStwfXSOeg/ONb18CAmDvzTIbyng+gSuuoMMiV7g8V29en310
 ZQe0vn/0cLCTvF8fIgB4q+syaCIzs3YKJkUAOEs7tafKROB7FcQMBBcIG
 J36Gz5xCVB0iKtxz7vrbfPH0CZaEd4mrennUi0yawgdjEEDurryQ/nrJZ
 tp6vKn6TPHvoGayBbGjJiY1sJIPYRQisIM3L/CcOlRlglDL0L9y/fojI1
 Wb0WQIDyuSYd1SvpswG44E2cWo0Tbjcd8kVUkN+IcmTQ75aOovRUEA1iQ
 FT/VOwAfScSZTBXX+Bl09PY+LuyCz2/m0NF4KxORxpkoLL/XqkNh7NJXi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="261796005"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="261796005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560231949"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] drm/edid: detect color formats and CTA revision in all
 CTA extensions
Date: Thu, 14 Apr 2022 18:07:00 +0300
Message-Id: <36d99eacfa84fe880e76b7510fefc341437a9f3b.1649948563.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert drm_find_cea_extension() to EDID block iterator in color format
and CTA revision detection. Detect them in all CTA extensions.

Also parse CTA Data Blocks in DisplayID even if there's no CTA EDID
extension.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 091f68102f77..fad9fd13937b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5470,32 +5470,40 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		return;
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(edid_ext, &edid_iter) {
+		if (edid_ext[0] != CEA_EXT)
+			continue;
 
-	info->cea_rev = edid_ext[1];
+		if (!info->cea_rev)
+			info->cea_rev = edid_ext[1];
 
-	/* The existence of a CEA block should imply RGB support */
-	info->color_formats = DRM_COLOR_FORMAT_RGB444;
+		if (info->cea_rev != edid_ext[1])
+			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
+				      info->cea_rev, edid_ext[1]);
 
-	/* CTA DisplayID Data Block does not have byte #3 */
-	if (edid_ext[0] == CEA_EXT) {
+		/* The existence of a CTA extension should imply RGB support */
+		info->color_formats = DRM_COLOR_FORMAT_RGB444;
 		if (edid_ext[3] & EDID_CEA_YCRCB444)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 	}
+	drm_edid_iter_end(&edid_iter);
 
 	cea_db_iter_edid_begin(edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
 
+		/* The existence of a CTA block should imply RGB support */
+		info->color_formats = DRM_COLOR_FORMAT_RGB444;
+
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, data);
 		if (cea_db_is_hdmi_forum_vsdb(db) ||
-- 
2.30.2

