Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE94E9108
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825C810EC23;
	Mon, 28 Mar 2022 09:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A59C10EBEB;
 Mon, 28 Mar 2022 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459107; x=1679995107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rWzE46us+0Sqt9zh+iCw3SGY70qDmGFryOqAWqhkMqM=;
 b=eJX+jHvEM8UbnntckioJJEYD/c5jSibplV1Cz9pNLtCJj+a/DeMOdf8O
 KJ9XaKf+KQEioF2xHyiDRqd8LE9opFKTOkI7Df1tp+U6EpEnwwkwkT4CG
 rEdrDkDm16qi1mhEYB5WG7POhgT9itwPj/jeaNNly7bsTwnbchTQTgn34
 2JYrrmUpAqH6gvOQD5U62wA4DC8BXm9UV+NzEFuFlXBbk8F0SbOBMD5ZY
 eG58ELIh8pzREMOA3ZGDNrHpW6bbWs5F4hU7MHD4v83Anv+QlEKOe2VfZ
 zwgRBzRWDQongZKg/mCLsb3x3doouEVYzEg8WrYmbEgdWLD1t+/lFVvAD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="322140187"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="322140187"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="787162951"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/edid: constify struct edid passed to detailed
 blocks
Date: Mon, 28 Mar 2022 12:17:23 +0300
Message-Id: <477792b768fd810109912dc2c9a5fd45c21a3e57.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
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

Constify the first level of struct edid in detailed timing parsing. Also
switch to struct edid instead of u8.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 48 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 95c48485794c..4542f8b8c8f0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2350,38 +2350,37 @@ static bool is_detailed_timing_descriptor(const u8 d[18])
 typedef void detailed_cb(const struct detailed_timing *timing, void *closure);
 
 static void
-cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
+cea_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
 {
 	int i, n;
 	u8 d = ext[0x02];
-	u8 *det_base = ext + d;
+	const u8 *det_base = ext + d;
 
 	if (d < 4 || d > 127)
 		return;
 
 	n = (127 - d) / 18;
 	for (i = 0; i < n; i++)
-		cb((struct detailed_timing *)(det_base + 18 * i), closure);
+		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
 
 static void
-vtb_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
+vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
 {
 	unsigned int i, n = min((int)ext[0x02], 6);
-	u8 *det_base = ext + 5;
+	const u8 *det_base = ext + 5;
 
 	if (ext[0x01] != 1)
 		return; /* unknown version */
 
 	for (i = 0; i < n; i++)
-		cb((struct detailed_timing *)(det_base + 18 * i), closure);
+		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
 
 static void
-drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
+drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
 {
 	int i;
-	struct edid *edid = (struct edid *)raw_edid;
 
 	if (edid == NULL)
 		return;
@@ -2389,8 +2388,8 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&(edid->detailed_timings[i]), closure);
 
-	for (i = 1; i <= raw_edid[0x7e]; i++) {
-		u8 *ext = raw_edid + (i * EDID_LENGTH);
+	for (i = 1; i <= edid->extensions; i++) {
+		const u8 *ext = (const u8 *)edid + (i * EDID_LENGTH);
 
 		switch (*ext) {
 		case CEA_EXT:
@@ -2430,7 +2429,7 @@ drm_monitor_supports_rb(struct edid *edid)
 	if (edid->revision >= 4) {
 		bool ret = false;
 
-		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
+		drm_for_each_detailed_block(edid, is_rb, &ret);
 		return ret;
 	}
 
@@ -2458,7 +2457,7 @@ drm_gtf2_hbreak(struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
+	drm_for_each_detailed_block(edid, find_gtf2, &range);
 
 	BUILD_BUG_ON(offsetof(struct detailed_timing, data.descriptor.data.range) +
 		     offsetof(typeof(*range), formula.gtf2.hfreq_start_khz) != 12);
@@ -2471,7 +2470,7 @@ drm_gtf2_2c(struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
+	drm_for_each_detailed_block(edid, find_gtf2, &range);
 
 	BUILD_BUG_ON(offsetof(struct detailed_timing, data.descriptor.data.range) +
 		     offsetof(typeof(*range), formula.gtf2.c) != 13);
@@ -2484,7 +2483,7 @@ drm_gtf2_m(struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
+	drm_for_each_detailed_block(edid, find_gtf2, &range);
 
 	BUILD_BUG_ON(offsetof(struct detailed_timing, data.descriptor.data.range) +
 		     offsetof(typeof(*range), formula.gtf2.m) != 14);
@@ -2497,7 +2496,7 @@ drm_gtf2_k(struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
+	drm_for_each_detailed_block(edid, find_gtf2, &range);
 
 	BUILD_BUG_ON(offsetof(struct detailed_timing, data.descriptor.data.range) +
 		     offsetof(typeof(*range), formula.gtf2.k) != 16);
@@ -2510,7 +2509,7 @@ drm_gtf2_2j(struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
+	drm_for_each_detailed_block(edid, find_gtf2, &range);
 
 	BUILD_BUG_ON(offsetof(struct detailed_timing, data.descriptor.data.range) +
 		     offsetof(typeof(*range), formula.gtf2.j) != 17);
@@ -3061,8 +3060,7 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
 	};
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_inferred_modes,
-					    &closure);
+		drm_for_each_detailed_block(edid, do_inferred_modes, &closure);
 
 	return closure.modes;
 }
@@ -3141,8 +3139,8 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		    drm_for_each_detailed_block((u8 *)edid,
-						do_established_modes, &closure);
+		drm_for_each_detailed_block(edid, do_established_modes,
+					    &closure);
 
 	return modes + closure.modes;
 }
@@ -3200,7 +3198,7 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_standard_modes,
+		drm_for_each_detailed_block(edid, do_standard_modes,
 					    &closure);
 
 	/* XXX should also look for standard codes in VTB blocks */
@@ -3280,7 +3278,7 @@ add_cvt_modes(struct drm_connector *connector, struct edid *edid)
 	};
 
 	if (version_greater(edid, 1, 2))
-		drm_for_each_detailed_block((u8 *)edid, do_cvt_mode, &closure);
+		drm_for_each_detailed_block(edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
 
@@ -3340,7 +3338,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 		closure.preferred =
 		    (edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
-	drm_for_each_detailed_block((u8 *)edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block(edid, do_detailed_mode, &closure);
 
 	return closure.modes;
 }
@@ -4541,7 +4539,7 @@ static int get_monitor_name(struct edid *edid, char name[13])
 	if (!edid || !name)
 		return 0;
 
-	drm_for_each_detailed_block((u8 *)edid, monitor_name, &edid_name);
+	drm_for_each_detailed_block(edid, monitor_name, &edid_name);
 	for (mnl = 0; edid_name && mnl < 13; mnl++) {
 		if (edid_name[mnl] == 0x0a)
 			break;
@@ -5287,7 +5285,7 @@ void drm_get_monitor_range(struct drm_connector *connector,
 	if (!version_greater(edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block((u8 *)edid, get_monitor_range,
+	drm_for_each_detailed_block(edid, get_monitor_range,
 				    &info->monitor_range);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-- 
2.30.2

