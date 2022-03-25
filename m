Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70374E7368
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB41D10E704;
	Fri, 25 Mar 2022 12:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DFF10E677;
 Fri, 25 Mar 2022 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211174; x=1679747174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOH1/ykpCkb+6TXMedVTud/bCAXFchm8Xu8OyvWi+7s=;
 b=CQUNG5u5mOVvABJs7y9HkzVOT7Q4Y0h8PqRUHy51h3M5c0Ypwq0wadlF
 tWRNeujKkJpF1qZ1M6EW/AOxZ71hHGJrRhsDG0t5643ddQZepWUB7pP19
 i40rs96lf52vy3wrMmBwsz6kxWj3cyCvKoFilPNUDqMm4kC+fKCVuMITx
 ReN5XYqPeDYyyIbqyAYV2Xztvll+i2YjcuwbdI/ZnoZeOUkXfV7oPKX+c
 +xSVSU9R1aWTppzBqYrzNrt7z/L3vK/3neFJShMDaYljY4+NpeVUIQM53
 tccOr+8t3ct6HIjWXIeYeSyry1E+zjo+GQ2dTw0AR//7jd1lTXsc08+WD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="239225166"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="239225166"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="638202911"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/edid: constify struct edid passed to detailed blocks
Date: Fri, 25 Mar 2022 14:25:29 +0200
Message-Id: <c54450b2d016af2074e72bb9144413b3da556e19.1648210803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648210803.git.jani.nikula@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
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
index c006b09066bb..fad792ef2c79 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2349,38 +2349,37 @@ static bool is_detailed_timing_descriptor(const u8 d[18])
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
@@ -2388,8 +2387,8 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&(edid->detailed_timings[i]), closure);
 
-	for (i = 1; i <= raw_edid[0x7e]; i++) {
-		u8 *ext = raw_edid + (i * EDID_LENGTH);
+	for (i = 1; i <= edid->extensions; i++) {
+		const u8 *ext = (const u8 *)edid + (i * EDID_LENGTH);
 
 		switch (*ext) {
 		case CEA_EXT:
@@ -2425,7 +2424,7 @@ drm_monitor_supports_rb(struct edid *edid)
 	if (edid->revision >= 4) {
 		bool ret = false;
 
-		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
+		drm_for_each_detailed_block(edid, is_rb, &ret);
 		return ret;
 	}
 
@@ -2452,7 +2451,7 @@ drm_gtf2_hbreak(struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+	drm_for_each_detailed_block(edid, find_gtf2, &timing);
 
 	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
 
@@ -2464,7 +2463,7 @@ drm_gtf2_2c(struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+	drm_for_each_detailed_block(edid, find_gtf2, &timing);
 
 	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.c) != 13);
 
@@ -2476,7 +2475,7 @@ drm_gtf2_m(struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+	drm_for_each_detailed_block(edid, find_gtf2, &timing);
 
 	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.m) != 14);
 
@@ -2488,7 +2487,7 @@ drm_gtf2_k(struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+	drm_for_each_detailed_block(edid, find_gtf2, &timing);
 
 	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.k) != 16);
 
@@ -2500,7 +2499,7 @@ drm_gtf2_2j(struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
-	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
+	drm_for_each_detailed_block(edid, find_gtf2, &timing);
 
 	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.gtf2.j) != 17);
 
@@ -3050,8 +3049,7 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
 	};
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_inferred_modes,
-					    &closure);
+		drm_for_each_detailed_block(edid, do_inferred_modes, &closure);
 
 	return closure.modes;
 }
@@ -3130,8 +3128,8 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		    drm_for_each_detailed_block((u8 *)edid,
-						do_established_modes, &closure);
+		drm_for_each_detailed_block(edid, do_established_modes,
+					    &closure);
 
 	return modes + closure.modes;
 }
@@ -3189,7 +3187,7 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block((u8 *)edid, do_standard_modes,
+		drm_for_each_detailed_block(edid, do_standard_modes,
 					    &closure);
 
 	/* XXX should also look for standard codes in VTB blocks */
@@ -3269,7 +3267,7 @@ add_cvt_modes(struct drm_connector *connector, struct edid *edid)
 	};
 
 	if (version_greater(edid, 1, 2))
-		drm_for_each_detailed_block((u8 *)edid, do_cvt_mode, &closure);
+		drm_for_each_detailed_block(edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
 
@@ -3329,7 +3327,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 		closure.preferred =
 		    (edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
-	drm_for_each_detailed_block((u8 *)edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block(edid, do_detailed_mode, &closure);
 
 	return closure.modes;
 }
@@ -4530,7 +4528,7 @@ static int get_monitor_name(struct edid *edid, char name[13])
 	if (!edid || !name)
 		return 0;
 
-	drm_for_each_detailed_block((u8 *)edid, monitor_name, &edid_name);
+	drm_for_each_detailed_block(edid, monitor_name, &edid_name);
 	for (mnl = 0; edid_name && mnl < 13; mnl++) {
 		if (edid_name[mnl] == 0x0a)
 			break;
@@ -5276,7 +5274,7 @@ void drm_get_monitor_range(struct drm_connector *connector,
 	if (!version_greater(edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block((u8 *)edid, get_monitor_range,
+	drm_for_each_detailed_block(edid, get_monitor_range,
 				    &info->monitor_range);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-- 
2.30.2

