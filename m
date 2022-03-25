Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4904E7364
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075510E666;
	Fri, 25 Mar 2022 12:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0EE10E5A4;
 Fri, 25 Mar 2022 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211167; x=1679747167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eM2W9WyMZgAJPKeOlLMYAF35kd6Zm0NrGtCGK/nhWSY=;
 b=PBvRHVWZEoM5jFFYDzGhR42/FAZbh/CWsZ+4k0MZkExDQIxUI71w11Lr
 vsR3lAbwh7M1ed8d5vhRw4PH0Y4pwpEczELjIqdiqRwMugwC2uUuZt+fH
 pNXD2RzwMKxZMnOIzSlDSjmOEz1J4vDS2e6Q9fb+q366vFBYzp3NVJhjg
 f8yGtKSra8+/Y1LmC00HXpW0agmLHIP+O9X6pCnrNEAwst4UiHFNIK0us
 3oHCfipyOB7Io1jAoRGn76WFQPx3ffZ3PAhMupBnnAvMU+rqf1GuCMeEf
 nMyY16h3f8PHB1GH4YZ2u3c6rbrT7rEP1PuFiKGryaxWNlGHsiSE0+nV3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="319329756"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="319329756"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="584448855"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/edid: constify struct detailed_timing in parsing
 callbacks
Date: Fri, 25 Mar 2022 14:25:28 +0200
Message-Id: <206cdf72e3406e09a822427b4d2b075f19890fbb.1648210803.git.jani.nikula@intel.com>
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

Moving one level higher, constify struct detailed_timing pointers in
callbacks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 ++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 593f151c1155..c006b09066bb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2346,7 +2346,7 @@ static bool is_detailed_timing_descriptor(const u8 d[18])
 	return d[0] != 0x00 || d[1] != 0x00;
 }
 
-typedef void detailed_cb(struct detailed_timing *timing, void *closure);
+typedef void detailed_cb(const struct detailed_timing *timing, void *closure);
 
 static void
 cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
@@ -2405,7 +2405,7 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 }
 
 static void
-is_rb(struct detailed_timing *timing, void *data)
+is_rb(const struct detailed_timing *timing, void *data)
 {
 	bool *res = data;
 
@@ -2433,9 +2433,9 @@ drm_monitor_supports_rb(struct edid *edid)
 }
 
 static void
-find_gtf2(struct detailed_timing *timing, void *data)
+find_gtf2(const struct detailed_timing *timing, void *data)
 {
-	struct detailed_timing **res = data;
+	const struct detailed_timing **res = data;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -2450,7 +2450,7 @@ find_gtf2(struct detailed_timing *timing, void *data)
 static int
 drm_gtf2_hbreak(struct edid *edid)
 {
-	struct detailed_timing *timing = NULL;
+	const struct detailed_timing *timing = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
@@ -2462,7 +2462,7 @@ drm_gtf2_hbreak(struct edid *edid)
 static int
 drm_gtf2_2c(struct edid *edid)
 {
-	struct detailed_timing *timing = NULL;
+	const struct detailed_timing *timing = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
@@ -2474,7 +2474,7 @@ drm_gtf2_2c(struct edid *edid)
 static int
 drm_gtf2_m(struct edid *edid)
 {
-	struct detailed_timing *timing = NULL;
+	const struct detailed_timing *timing = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
@@ -2486,7 +2486,7 @@ drm_gtf2_m(struct edid *edid)
 static int
 drm_gtf2_k(struct edid *edid)
 {
-	struct detailed_timing *timing = NULL;
+	const struct detailed_timing *timing = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
@@ -2498,7 +2498,7 @@ drm_gtf2_k(struct edid *edid)
 static int
 drm_gtf2_2j(struct edid *edid)
 {
-	struct detailed_timing *timing = NULL;
+	const struct detailed_timing *timing = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &timing);
 
@@ -3004,7 +3004,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static void
-do_inferred_modes(struct detailed_timing *timing, void *c)
+do_inferred_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
@@ -3086,7 +3086,7 @@ drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *ti
 }
 
 static void
-do_established_modes(struct detailed_timing *timing, void *c)
+do_established_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3137,7 +3137,7 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
 }
 
 static void
-do_standard_modes(struct detailed_timing *timing, void *c)
+do_standard_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
@@ -3250,7 +3250,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 }
 
 static void
-do_cvt_mode(struct detailed_timing *timing, void *c)
+do_cvt_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3279,7 +3279,7 @@ add_cvt_modes(struct drm_connector *connector, struct edid *edid)
 static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode);
 
 static void
-do_detailed_mode(struct detailed_timing *timing, void *c)
+do_detailed_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	struct drm_display_mode *newmode;
@@ -4512,17 +4512,19 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 }
 
 static void
-monitor_name(struct detailed_timing *t, void *data)
+monitor_name(const struct detailed_timing *timing, void *data)
 {
-	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_NAME))
+	const char **res = data;
+
+	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME))
 		return;
 
-	*(u8 **)data = t->data.other_data.data.str.str;
+	*res = timing->data.other_data.data.str.str;
 }
 
 static int get_monitor_name(struct edid *edid, char name[13])
 {
-	char *edid_name = NULL;
+	const char *edid_name = NULL;
 	int mnl;
 
 	if (!edid || !name)
@@ -5242,7 +5244,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 }
 
 static
-void get_monitor_range(struct detailed_timing *timing,
+void get_monitor_range(const struct detailed_timing *timing,
 		       void *info_monitor_range)
 {
 	struct drm_monitor_range_info *monitor_range = info_monitor_range;
-- 
2.30.2

