Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600760A666
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499E810E4A0;
	Mon, 24 Oct 2022 12:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79A210E4F7;
 Mon, 24 Oct 2022 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614876; x=1698150876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m8a/MccM2MtMIvrcnYCWz6TUS/t0aF3QuHeEHmRZbBk=;
 b=kXFc8XRDhxFopXuavZS+gr6qzglcCj/aRyjZ6nZZZ+2w9QKnvNAuZLeA
 Eo+ePIyfd01ULcmGb0vX9bIIfo55ZhqQi2qOKsq7eIPVUiWovEWNd7s/I
 6PSUvIS0LjdYxHlEelL3CZUvLpcvJM9XbhLwGwQB4RKMOnTjc6SdKDhk4
 sClUW0PGndSOpUWL9EifUMWBBFD1EGMcGzlUu2THU+a30BKOOon5/QWU4
 3e7/TOxq4b6LOkEovGSBJJ1+hsUD9Hn+QX223VMviYtt6CQ9cf/scWbm0
 YqaNIA9YasFFLp09+OiTkUcUBXJVSXfTi+mdmI4aHrqH5A6mUze8C20ng Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="309091488"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="309091488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055725"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055725"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/16] drm/edid/firmware: drop redundant connector_name
 variable/parameter
Date: Mon, 24 Oct 2022 15:33:38 +0300
Message-Id: <befa53a33f2ea83094027a0e88d155779ad096e1.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

Stop passing around something that's readily available in
connector->name.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid_load.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 37d8ba3ddb46..13cdbfb991eb 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -167,8 +167,7 @@ static int edid_size(const u8 *edid, int data_size)
 	return (edid[0x7e] + 1) * EDID_LENGTH;
 }
 
-static void *edid_load(struct drm_connector *connector, const char *name,
-			const char *connector_name)
+static void *edid_load(struct drm_connector *connector, const char *name)
 {
 	const struct firmware *fw = NULL;
 	const u8 *fwdata;
@@ -185,10 +184,10 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 		struct platform_device *pdev;
 		int err;
 
-		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
+		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
 		if (IS_ERR(pdev)) {
 			DRM_ERROR("Failed to register EDID firmware platform device "
-				  "for connector \"%s\"\n", connector_name);
+				  "for connector \"%s\"\n", connector->name);
 			return ERR_CAST(pdev);
 		}
 
@@ -244,7 +243,7 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
 		DRM_INFO("Found %d valid extensions instead of %d in EDID data "
 		    "\"%s\" for connector \"%s\"\n", valid_extensions,
-		    edid[0x7e], name, connector_name);
+		    edid[0x7e], name, connector->name);
 		edid[0x7e] = valid_extensions;
 
 		new_edid = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
@@ -256,7 +255,7 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 	DRM_INFO("Got %s EDID base block and %d extension%s from "
 	    "\"%s\" for connector \"%s\"\n", (builtin >= 0) ? "built-in" :
 	    "external", valid_extensions, valid_extensions == 1 ? "" : "s",
-	    name, connector_name);
+	    name, connector->name);
 
 out:
 	release_firmware(fw);
@@ -265,7 +264,6 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 
 struct edid *drm_load_edid_firmware(struct drm_connector *connector)
 {
-	const char *connector_name = connector->name;
 	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
 	struct edid *edid;
 
@@ -288,7 +286,7 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
 	while ((edidname = strsep(&edidstr, ","))) {
 		colon = strchr(edidname, ':');
 		if (colon != NULL) {
-			if (strncmp(connector_name, edidname, colon - edidname))
+			if (strncmp(connector->name, edidname, colon - edidname))
 				continue;
 			edidname = colon + 1;
 			break;
@@ -310,7 +308,7 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
 	if (*last == '\n')
 		*last = '\0';
 
-	edid = edid_load(connector, edidname, connector_name);
+	edid = edid_load(connector, edidname);
 	kfree(fwstr);
 
 	return edid;
-- 
2.34.1

