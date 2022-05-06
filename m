Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63251D56E
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4D10FB11;
	Fri,  6 May 2022 10:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997D10FB11;
 Fri,  6 May 2022 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831974; x=1683367974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSwlDuEr9mFVsUXGkn8W+RSHTDi6LJvFfnsPPqJzhgM=;
 b=BacED43ety0xIKu1V5rEDYpGoABg4sKpFUClNglfiHqzjv6yJv7jh0je
 BNhKdiUy+A7E/3TmqzZmYCKRjGi0kvqoOZbhnkNzrxh6kE/2/uFqztn2P
 xfZHL38Q5baAILNDrFTzNfwsndcOp4oCZVobD+cJstYsqxJHWrfUPt6ky
 YyZTxcbwFxoHW0pZ2pQp6fot77m8rgT+qoRf09htBIYwUUBGbxFrexGLo
 clz46A4XVnBGt91kroglOSXc9wQEQQJRo/efnR/QahH0hSOqLC58iBiJ8
 OJbiCZp9ZW/oP/24LQVSOefULyZKEKaeL4I2UDtu2zp4NwB0/3cIoiFyN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248959833"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248959833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585906669"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/25] drm/edid: convert version_greater() to drm_edid
Date: Fri,  6 May 2022 13:10:32 +0300
Message-Id: <bdafb3a04bd409d5fbf922ab932b7ffce12ed33b.1651830939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere. Also make version_greater()
a function for type safety.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc64837ad706..df48189ba2c7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -45,10 +45,6 @@
 
 #include "drm_crtc_internal.h"
 
-#define version_greater(edid, maj, min) \
-	(((edid)->version > (maj)) || \
-	 ((edid)->version == (maj) && (edid)->revision > (min)))
-
 static int oui(u8 first, u8 second, u8 third)
 {
 	return (first << 16) | (second << 8) | third;
@@ -1576,6 +1572,15 @@ struct drm_edid {
 	const struct edid *edid;
 };
 
+static bool version_greater(const struct drm_edid *drm_edid,
+			    u8 version, u8 revision)
+{
+	const struct edid *edid = drm_edid->edid;
+
+	return edid->version > version ||
+		(edid->version == version && edid->revision > revision);
+}
+
 static int edid_extension_block_count(const struct edid *edid)
 {
 	return edid->extensions;
@@ -3214,7 +3219,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 						  closure->drm_edid,
 						  timing);
 
-	if (!version_greater(closure->drm_edid->edid, 1, 1))
+	if (!version_greater(closure->drm_edid, 1, 1))
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
@@ -3225,7 +3230,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 							  timing);
 		break;
 	case 0x04: /* cvt, only in 1.4+ */
-		if (!version_greater(closure->drm_edid->edid, 1, 3))
+		if (!version_greater(closure->drm_edid, 1, 3))
 			break;
 
 		closure->modes += drm_cvt_modes_for_range(closure->connector,
@@ -3246,7 +3251,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid->edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
 
 	return closure.modes;
@@ -3323,7 +3328,7 @@ static int add_established_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_established_modes,
 					    &closure);
 
@@ -3378,7 +3383,7 @@ static int add_standard_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(drm_edid->edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_standard_modes,
 					    &closure);
 
@@ -3458,7 +3463,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid->edid, 1, 2))
+	if (version_greater(drm_edid, 1, 2))
 		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
@@ -3514,7 +3519,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 		.quirks = quirks,
 	};
 
-	if (closure.preferred && !version_greater(drm_edid->edid, 1, 3))
+	if (closure.preferred && !version_greater(drm_edid, 1, 3))
 		closure.preferred =
 		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
@@ -5584,7 +5589,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	if (!version_greater(drm_edid->edid, 1, 1))
+	if (!version_greater(drm_edid, 1, 1))
 		return;
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range,
-- 
2.30.2

