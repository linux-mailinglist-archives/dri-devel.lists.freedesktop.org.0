Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AD51D55A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C925F10FB3C;
	Fri,  6 May 2022 10:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26110FB3C;
 Fri,  6 May 2022 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831928; x=1683367928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WnnAalcM6wbkFydN0FNvbL8a7kpLGUXqH+kRriHpCfU=;
 b=HXAKE67ZhjZUo79CLDZgUw4i4pC1XdTUqYLuJxvuo0Pw7T3gIYEET4jz
 adV5fSSW1lXEw1Xosn21LyCkOs2R1w0QOW1aiOiulNwiUD+VVY9GfbtXt
 3/8GjxcOJsGRREyGA3fD7vYEFpEAEWTgeEOOcWrO1aV009C0YYu3uD/je
 sP2DvSykRd4J78bXFp7YH56O+Rq2EiYg4ZFF2nPB3v5aG7mUydqiDYmwb
 Q/QmX0Tle3+7mk+y+fi3B7JMoV9EBs789nyIbMm6r1L1I+BnyFtRtRc/F
 h82Bv4mzYtB4CPSLash0gjsZKCYl1lV2gdT3Mr4vMS3IFN8BjLtZxWXVk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331413695"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="331413695"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="569049674"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/25] drm/edid: convert drm_for_each_detailed_block() to
 drm_edid
Date: Fri,  6 May 2022 13:10:23 +0300
Message-Id: <b63376b9d9a37f8fdbe686ec2b484f7322e5d84b.1651830938.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4fd2ee976d39..2017feecbe1c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2580,20 +2580,20 @@ vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
 		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
 
-static void
-drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
+static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
+					detailed_cb *cb, void *closure)
 {
 	struct drm_edid_iter edid_iter;
 	const u8 *ext;
 	int i;
 
-	if (edid == NULL)
+	if (!drm_edid)
 		return;
 
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
-		cb(&(edid->detailed_timings[i]), closure);
+		cb(&(drm_edid->edid->detailed_timings[i]), closure);
 
-	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
 	drm_edid_iter_for_each(ext, &edid_iter) {
 		switch (*ext) {
 		case CEA_EXT:
@@ -2632,7 +2632,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_edid)
 	if (drm_edid->edid->revision >= 4) {
 		bool ret = false;
 
-		drm_for_each_detailed_block(drm_edid->edid, is_rb, &ret);
+		drm_for_each_detailed_block(drm_edid, is_rb, &ret);
 		return ret;
 	}
 
@@ -2659,7 +2659,7 @@ drm_gtf2_hbreak(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
 
@@ -2671,7 +2671,7 @@ drm_gtf2_2c(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
 
@@ -2683,7 +2683,7 @@ drm_gtf2_m(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
 
@@ -2695,7 +2695,7 @@ drm_gtf2_k(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
 
@@ -2707,7 +2707,7 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
 
@@ -3247,7 +3247,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_inferred_modes, &closure);
+		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
 
 	return closure.modes;
 }
@@ -3324,7 +3324,7 @@ static int add_established_modes(struct drm_connector *connector,
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
+		drm_for_each_detailed_block(drm_edid, do_established_modes,
 					    &closure);
 
 	return modes + closure.modes;
@@ -3379,7 +3379,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	}
 
 	if (version_greater(drm_edid->edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_standard_modes,
+		drm_for_each_detailed_block(drm_edid, do_standard_modes,
 					    &closure);
 
 	/* XXX should also look for standard codes in VTB blocks */
@@ -3459,7 +3459,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 	};
 
 	if (version_greater(drm_edid->edid, 1, 2))
-		drm_for_each_detailed_block(drm_edid->edid, do_cvt_mode, &closure);
+		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
 
@@ -3518,7 +3518,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 		closure.preferred =
 		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
-	drm_for_each_detailed_block(drm_edid->edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block(drm_edid, do_detailed_mode, &closure);
 
 	return closure.modes;
 }
@@ -4820,7 +4820,7 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
 	if (!drm_edid || !name)
 		return 0;
 
-	drm_for_each_detailed_block(drm_edid->edid, monitor_name, &edid_name);
+	drm_for_each_detailed_block(drm_edid, monitor_name, &edid_name);
 	for (mnl = 0; edid_name && mnl < 13; mnl++) {
 		if (edid_name[mnl] == 0x0a)
 			break;
@@ -5541,7 +5541,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 	if (!version_greater(drm_edid->edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
+	drm_for_each_detailed_block(drm_edid, get_monitor_range,
 				    &info->monitor_range);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-- 
2.30.2

