Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639351FC29
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BA410EF8D;
	Mon,  9 May 2022 12:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D910EF83;
 Mon,  9 May 2022 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097935; x=1683633935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ta+Xw9BacgmGlgYy81SBKCqrU7A4H8gu8t0RaXxA+nw=;
 b=TsIGsbDNMYEAbMoR7cgWbU9o6qNOE8FqW7UfH1xl1/5nf6zxjww1Rf7T
 h2SDrr5ZpB8/FyxvtWzvHu622VX3r3THJ4brCQYsXY8RztX/k3JxYuOhs
 V/1oYlJdtd4z702QkM6LfsrPrcUeJt0cp2fHWGGjMkZpzdNM8aaW+W/Og
 +1Skdoj5U2TJ20MDca7T1d8Y70KUL8QVmbhY3tAko1k4piJ0iYDpsUNug
 99wV97ObjJY1UwfKyQ2XIpAZixjCHnzZOt5gM6xT8D4m92Oh1Rs5b0Hef
 HZQiu+AVMxkaIUQow2Og13jC4QOo4AoxESh3En1LSksCc8fkRjQM293bj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294253515"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294253515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="813448039"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 25/25] drm/edid: convert version_greater() to drm_edid
Date: Mon,  9 May 2022 15:03:24 +0300
Message-Id: <f1835a86294b392d075570001ed9009a48352670.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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
index a44818f44718..429078bcf372 100644
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
@@ -3232,7 +3237,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 						  closure->drm_edid,
 						  timing);
 
-	if (!version_greater(closure->drm_edid->edid, 1, 1))
+	if (!version_greater(closure->drm_edid, 1, 1))
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
@@ -3243,7 +3248,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 							  timing);
 		break;
 	case 0x04: /* cvt, only in 1.4+ */
-		if (!version_greater(closure->drm_edid->edid, 1, 3))
+		if (!version_greater(closure->drm_edid, 1, 3))
 			break;
 
 		closure->modes += drm_cvt_modes_for_range(closure->connector,
@@ -3264,7 +3269,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid->edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
 
 	return closure.modes;
@@ -3341,7 +3346,7 @@ static int add_established_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_established_modes,
 					    &closure);
 
@@ -3396,7 +3401,7 @@ static int add_standard_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(drm_edid->edid, 1, 0))
+	if (version_greater(drm_edid, 1, 0))
 		drm_for_each_detailed_block(drm_edid, do_standard_modes,
 					    &closure);
 
@@ -3476,7 +3481,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid->edid, 1, 2))
+	if (version_greater(drm_edid, 1, 2))
 		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
@@ -3532,7 +3537,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 		.quirks = quirks,
 	};
 
-	if (closure.preferred && !version_greater(drm_edid->edid, 1, 3))
+	if (closure.preferred && !version_greater(drm_edid, 1, 3))
 		closure.preferred =
 		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
@@ -5591,7 +5596,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	if (!version_greater(drm_edid->edid, 1, 1))
+	if (!version_greater(drm_edid, 1, 1))
 		return;
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range,
-- 
2.30.2

