Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07498501280
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E0410FD12;
	Thu, 14 Apr 2022 15:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978110FD12;
 Thu, 14 Apr 2022 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948919; x=1681484919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvDRcqAhYmLLHhQig+k7klqhNvpbsy9v7cWyriDTeIM=;
 b=jyP7hf16pOFV8+i14f+28cc4HBfUI88sGMPq/dG2frK0/VNrQrXlXsJj
 emosgH4XnVsTKatNvF0SNdl+7WGNc4rVip5ZKlrE9jjx1Jn2aCxHVVCb7
 U1n7aTkB/gT7Os8Z9U67PXF3wF3pGEqm9JMTy3cBHXVNjQkdT5QIuHXsi
 oy8sOrs8K41olJGO06Tiau+7IJ/1/g/uFoeVYCevYlL8E00prf7ecKKZx
 +/hyLGjRzCbUlO5pVWoYswYHt78pt7WgRlKpDA1OZ/rg+EpPsH2d9yYT0
 fTPg8tixwwKmP9QNWQQUomS554vyHucIBrpe+siRTp2VQYNsZ+mGY1OqF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323394969"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323394969"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="612365528"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/19] drm/edid: detect basic audio in all CEA extensions
Date: Thu, 14 Apr 2022 18:06:59 +0300
Message-Id: <7b18113076e495e8360995e6961655f83492725e.1649948563.git.jani.nikula@intel.com>
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

Convert drm_find_cea_extension() to EDID block iterator in basic audio
detection. Detect basic audio in all CEA extensions.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1fc4e8754cd4..091f68102f77 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5136,17 +5136,21 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(const struct edid *edid)
 {
+	struct drm_edid_iter edid_iter;
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	edid_ext = drm_find_cea_extension(edid);
-	if (!edid_ext)
-		goto end;
-
-	has_audio = (edid_ext[0] == CEA_EXT &&
-		    (edid_ext[3] & EDID_BASIC_AUDIO) != 0);
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(edid_ext, &edid_iter) {
+		if (edid_ext[0] == CEA_EXT) {
+			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
+			if (has_audio)
+				break;
+		}
+	}
+	drm_edid_iter_end(&edid_iter);
 
 	if (has_audio) {
 		DRM_DEBUG_KMS("Monitor has basic audio support\n");
-- 
2.30.2

