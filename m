Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271614E99BB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E29A10E66D;
	Mon, 28 Mar 2022 14:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2AE10E66D;
 Mon, 28 Mar 2022 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478122; x=1680014122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vHFKmpWj20lJChpg69d2popFmvVVdWvvQwQ/6yIz8fQ=;
 b=NrUpRcHYi0u+tt9G+3Ne9bRl0mapNZJ1nsiLpfD30Degkc7VMBR1GUcE
 /s3U8VU0ha9cc73BHhYQc1bJdbR/Madmw47GtBshLcRhUtjhuNTXZafjE
 RjIjkFbI5V1T2CQPTg+zTEKFFoT8lpD3k2Q5IXO+YhrasNuGiWksmlzBA
 sZsHlMGJhOvppIcUUdxKG24iynmb2qaYM8YJV8HYUgzyynFe3X/jwCMNw
 5+yCSAfeXuS7a5ge9IJHn9uqEwphNDnbdJj8A7hqEf9afMBOTyoGEbARJ
 ywF7EbxQgdAGYpHSew2sKxmBfIQrio5grBgBlvwcu8Q3J5Dm294HREoYE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="283900704"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="283900704"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="638978294"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/12] drm/edid: constify struct detailed_timing in parsing
 callbacks
Date: Mon, 28 Mar 2022 17:34:29 +0300
Message-Id: <9b617068d2349a574a837ad6207b1d45c4d79eb5.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648477901.git.jani.nikula@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
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
index 6d1461991ba4..47234cf211ca 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2349,7 +2349,7 @@ static bool is_detailed_timing_descriptor(const struct detailed_timing *descript
 	return descriptor->pixel_clock != 0;
 }
 
-typedef void detailed_cb(struct detailed_timing *timing, void *closure);
+typedef void detailed_cb(const struct detailed_timing *timing, void *closure);
 
 static void
 cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void *closure)
@@ -2408,7 +2408,7 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
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
-	struct detailed_timing **res = data;
+	const struct detailed_timing **res = data;
 
 	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -2455,7 +2455,7 @@ find_gtf2(struct detailed_timing *descriptor, void *data)
 static int
 drm_gtf2_hbreak(struct edid *edid)
 {
-	struct detailed_timing *descriptor = NULL;
+	const struct detailed_timing *descriptor = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
 
@@ -2467,7 +2467,7 @@ drm_gtf2_hbreak(struct edid *edid)
 static int
 drm_gtf2_2c(struct edid *edid)
 {
-	struct detailed_timing *descriptor = NULL;
+	const struct detailed_timing *descriptor = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
 
@@ -2479,7 +2479,7 @@ drm_gtf2_2c(struct edid *edid)
 static int
 drm_gtf2_m(struct edid *edid)
 {
-	struct detailed_timing *descriptor = NULL;
+	const struct detailed_timing *descriptor = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
 
@@ -2491,7 +2491,7 @@ drm_gtf2_m(struct edid *edid)
 static int
 drm_gtf2_k(struct edid *edid)
 {
-	struct detailed_timing *descriptor = NULL;
+	const struct detailed_timing *descriptor = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
 
@@ -2503,7 +2503,7 @@ drm_gtf2_k(struct edid *edid)
 static int
 drm_gtf2_2j(struct edid *edid)
 {
-	struct detailed_timing *descriptor = NULL;
+	const struct detailed_timing *descriptor = NULL;
 
 	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
 
@@ -3009,7 +3009,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static void
-do_inferred_modes(struct detailed_timing *timing, void *c)
+do_inferred_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
@@ -3091,7 +3091,7 @@ drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *ti
 }
 
 static void
-do_established_modes(struct detailed_timing *timing, void *c)
+do_established_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3142,7 +3142,7 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
 }
 
 static void
-do_standard_modes(struct detailed_timing *timing, void *c)
+do_standard_modes(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
@@ -3255,7 +3255,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 }
 
 static void
-do_cvt_mode(struct detailed_timing *timing, void *c)
+do_cvt_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
@@ -3284,7 +3284,7 @@ add_cvt_modes(struct drm_connector *connector, struct edid *edid)
 static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode);
 
 static void
-do_detailed_mode(struct detailed_timing *timing, void *c)
+do_detailed_mode(const struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 	struct drm_display_mode *newmode;
@@ -4517,17 +4517,19 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
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
@@ -5247,7 +5249,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 }
 
 static
-void get_monitor_range(struct detailed_timing *timing,
+void get_monitor_range(const struct detailed_timing *timing,
 		       void *info_monitor_range)
 {
 	struct drm_monitor_range_info *monitor_range = info_monitor_range;
-- 
2.30.2

