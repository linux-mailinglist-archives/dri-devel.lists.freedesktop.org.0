Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98B4E488C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA8F10E5C4;
	Tue, 22 Mar 2022 21:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4310E5B1;
 Tue, 22 Mar 2022 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985336; x=1679521336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plB/wu5WUsu/n0moCaDlPDNY+kpNWVcCkM/GvGtzdcM=;
 b=F0qrHm7qEdciLtciatfcGQfzGl4BYKsBQO5E2MkLLBwm8EvIv7kPkbre
 YU8arYmv9gexYaqxnPLcTgLTk9pJ8AEkarfSqsnfMtftBFiaorm++LWev
 rRB+uwsKk4/dkTNCTgYZ4Cq76lO/6Bwt7+JUbYBmuqFn/akqzLpOAf+kQ
 0eB7sCA/cPh+QxDA0jKksm5EJqha+QlvUqMg8xhc2lDdRCWF+yh9YgRn4
 I3ZYI/DaItG3b859Ms+SG+/uNJCoBy4qwzXWs6+TtztK/tTLxyBB5JvXi
 l8+9ErmEXVoKCO05SZc/tcxPxXqMruNhVeGO+rW9nG7VPWzkzKpUapzgZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240115888"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="240115888"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="543905720"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 17/19] drm/edid: detect color formats and CEA revision only on
 CEA extension
Date: Tue, 22 Mar 2022 23:40:46 +0200
Message-Id: <0d78c9066958834c4c62c294f28aac3d8f151284.1647985054.git.jani.nikula@intel.com>
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

The CTA data block in DisplayID does not have the bits from byte 3 that
a CEA extension has. Only look for them in CEA extensions, but also look
for them in all CEA extensions.

The DisplayID CTA data block version does not seem to match the CEA
revision either. Ignore it for the purpose of CEA revision.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b6675f8638bb..f40427dc5236 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5293,22 +5293,31 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
-	const u8 *edid_ext;
+	const u8 *cea;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		return;
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(cea, &edid_iter) {
+		if (cea[0] != CEA_EXT)
+			continue;
 
-	info->cea_rev = edid_ext[1];
+		if (!info->cea_rev)
+			info->cea_rev = cea[1];
 
-	/* The existence of a CEA block should imply RGB support */
-	info->color_formats = DRM_COLOR_FORMAT_RGB444;
-	if (edid_ext[3] & EDID_CEA_YCRCB444)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
-	if (edid_ext[3] & EDID_CEA_YCRCB422)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+		if (info->cea_rev != cea[1])
+			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
+				      info->cea_rev, cea[1]);
+
+		/* The existence of a CEA block should imply RGB support */
+		info->color_formats = DRM_COLOR_FORMAT_RGB444;
+		if (cea[3] & EDID_CEA_YCRCB444)
+			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
+		if (cea[3] & EDID_CEA_YCRCB422)
+			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+	}
+	drm_edid_iter_end(&edid_iter);
 
 	cea_db_iter_edid_begin(edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
-- 
2.30.2

