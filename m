Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2305364EE66
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602CB10E5F2;
	Fri, 16 Dec 2022 16:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966D10E5ED;
 Fri, 16 Dec 2022 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206478; x=1702742478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sy/xQc4bMej24rvIp5Gpd6HKDFr8Ht6SFP30KyJ42rc=;
 b=GG5Tmak7b2mrYUt+uSGPl2z17YGb8rZbrYKUEY1CddV9TyKAYZG4rRUO
 RDfyNcKbrfX/QjPH9t1696DZGzvytVFY49FqmrKUECrBjKZSlQcbvh0eG
 Cq0e+h68xsZ1NhQ5Rhnlvqs4atl5uuV5wZQXJekLLIn1T3GCJKjs9AWO3
 IKWyYXrzvUVM3aJfm5D5xAvDDJZAWV7fAr6pwYG46QbfzuLg32uiyMEOz
 vwwG8aE9GdasynkDmYCpFZtCJBcB70c00ENpYHx9ZbP8Te4Yi9gsXOEyy
 YPimBkZLrZuDhOyjJ/qWzY2rjTIfKU991MvhQG7SJFEpZg5F4PlnwFULf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383327126"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383327126"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="738576270"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="738576270"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/12] drm/edid: move EDID BPC quirk application to
 update_display_info()
Date: Fri, 16 Dec 2022 18:00:19 +0200
Message-Id: <e7c3db0e10803ea0a7aa45ce24b314a059b45289.1671206131.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671206131.git.jani.nikula@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BPC quirks are closer to home in update_display_info().

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2246a5b10d2c..15f69c362fc3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6467,6 +6467,18 @@ static void update_display_info(struct drm_connector *connector,
 	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
 		info->max_dsc_bpp = 15;
 
+	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
+		info->bpc = 6;
+
+	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
+		info->bpc = 8;
+
+	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
+		info->bpc = 10;
+
+	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
+		info->bpc = 12;
+
 	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
 	drm_edid_to_eld(connector, drm_edid);
 }
@@ -6566,7 +6578,7 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int _drm_edid_connector_update(struct drm_connector *connector,
 				      const struct drm_edid *drm_edid)
 {
-	struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
 
 	/*
@@ -6606,18 +6618,6 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
 		edid_fixup_preferred(connector);
 
-	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
-		info->bpc = 6;
-
-	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
-		info->bpc = 8;
-
-	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
-		info->bpc = 10;
-
-	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
-		info->bpc = 12;
-
 	return num_modes;
 }
 
-- 
2.34.1

