Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D454E9106
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A7910EC21;
	Mon, 28 Mar 2022 09:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9CF10EB6A;
 Mon, 28 Mar 2022 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459103; x=1679995103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+Vo5fEkzCJCcefRIUBhmjKVq9YwkUOl7FZWj0f9QAw=;
 b=Kr0yUmW9Ms2Pc7EHfABDE8YtmuyfxmxHpf4hJ4NbfdBqnQsKSwVvg0Na
 1/ISFQ3sgC4YCTSW9ZQOJEURyt/Lq4cWopoR9hSJDg6y1Nc0wrCiqmHCS
 Xs7YkN+NHyY3+ULQY4oBbTypzEoqupxbI3z6hI6znJKAqe2mLtZiVV2Py
 djgnvotuZUdFxPYc2WrTv8HsQclxq4X4ad1OVzSC0nVSf4XenU84iouwW
 7nfoUETLDu27hkcjLYmNyiDli2CWNMVsOd7EwomRAAfdTlt7pPi0emcdC
 GhdNiXiN85wsmJSQj40tTtEpUh6tPQQIO3MzQwXVT6EvrYxQJjY2fTDZh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258670031"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="258670031"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="553851121"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/edid: constify struct detailed_timing in parsing
 callbacks
Date: Mon, 28 Mar 2022 12:17:22 +0300
Message-Id: <cb8d62b55c1d67a3584448ea6a1caa4a71217e3b.1648458971.git.jani.nikula@intel.com>
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

Moving one level higher, constify struct detailed_timing pointers in
callbacks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 ++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 60eee683be3f..95c48485794c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2347,7 +2347,7 @@ static bool is_detailed_timing_descriptor(const u8 d[18])
 	return d[0] != 0x00 || d[1] != 0x00;
 }
 
-typedef void detailed_cb(struct detailed_timing *timing, void *closure);
+typedef void detailed_cb(const struct detailed_timing *timing, void *closure);
 
 static void
 cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
@@ -2406,7 +2406,7 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
 }
 
 static void
-is_rb(struct detailed_timing *descriptor, void *data)
+is_rb(const struct detailed_timing *descriptor, void *data)
 {
 	bool *res = data;
 
@@ -2438,9 +2438,9 @@ drm_monitor_supports_rb(struct edid *edid)
 }
 
 static void
-find_gtf2(struct detailed_timing *descriptor, void *data)
+find_gtf2(const struct detailed_timing *descriptor, void *data)
 {
-	struct detailed_data_monitor_range **res = data;
+	const struct detailed_data_monitor_range **res = data;
 
 	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -2456,7 +2456,7 @@ find_gtf2(struct detailed_timing *descriptor, void *data)
 static int
 drm_gtf2_hbreak(struct edid *edid)
 {
-	struct detailed_data_monitor_range *range = NULL;
+	const struct detailed_data_monitor_range *range = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
 
@@ -2469,7 +2469,7 @@ drm_gtf2_hbreak(struct edid *edid)
 static int
 drm_gtf2_2c(struct edid *edid)
 {
-	struct detailed_data_monitor_range *range = NULL;
+	const struct detailed_data_monitor_range *range = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
 
@@ -2482,7 +2482,7 @@ drm_gtf2_2c(struct edid *edid)
 static int
 drm_gtf2_m(struct edid *edid)
 {
-	struct detailed_data_monitor_range *range = NULL;
+	const struct detailed_data_monitor_range *range = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
 
@@ -2495,7 +2495,7 @@ drm_gtf2_m(struct edid *edid)
 static int
 drm_gtf2_k(struct edid *edid)
 {
-	struct detailed_data_monitor_range *range = NULL;
+	const struct detailed_data_monitor_range *range = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
 
@@ -2508,7 +2508,7 @@ drm_gtf2_k(struct edid *edid)
 static int
 drm_gtf2_2j(struct edid *edid)
 {
-	struct detailed_data_monitor_range *range = NULL;
+	const struct detailed_data_monitor_range *range = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &range);
 
@@ -3015,7 +3015,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static void
-do_inferred_modes(struct detailed_timing *timing, void *c)
+do_inferred_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct edid_display_descriptor *data = &timing->data.descriptor;
@@ -3097,7 +3097,7 @@ drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *ti
 }
 
 static void
-do_established_modes(struct detailed_timing *timing, void *c)
+do_established_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3148,7 +3148,7 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
 }
 
 static void
-do_standard_modes(struct detailed_timing *timing, void *c)
+do_standard_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct edid_display_descriptor *data = &timing->data.descriptor;
@@ -3261,7 +3261,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 }
 
 static void
-do_cvt_mode(struct detailed_timing *timing, void *c)
+do_cvt_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3290,7 +3290,7 @@ add_cvt_modes(struct drm_connector *connector, struct edid *edid)
 static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode);
 
 static void
-do_detailed_mode(struct detailed_timing *timing, void *c)
+do_detailed_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	struct drm_display_mode *newmode;
@@ -4523,17 +4523,19 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
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
 
-	*(u8 **)data = t->data.descriptor.data.str.str;
+	*res = timing->data.descriptor.data.str.str;
 }
 
 static int get_monitor_name(struct edid *edid, char name[13])
 {
-	char *edid_name = NULL;
+	const char *edid_name = NULL;
 	int mnl;
 
 	if (!edid || !name)
@@ -5253,7 +5255,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 }
 
 static
-void get_monitor_range(struct detailed_timing *timing,
+void get_monitor_range(const struct detailed_timing *timing,
 		       void *info_monitor_range)
 {
 	struct drm_monitor_range_info *monitor_range = info_monitor_range;
-- 
2.30.2

