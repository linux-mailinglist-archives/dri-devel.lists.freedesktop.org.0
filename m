Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F204E7367
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1A10E701;
	Fri, 25 Mar 2022 12:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F73A10E677;
 Fri, 25 Mar 2022 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211176; x=1679747176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FM6w0RYQa+ALvD9YI4DkxM7A1uJ5wbLS7kbH/k/HuNg=;
 b=N+NE45M95hdk6fBM92p/JtkhyfCMi06iPPKzu9VB9H672lAwZg6VGafF
 NCAb3Fo5CnvkiLn8cvH4YUOwZhkgSB2ls31XSisK8Y3oXewFsjuxWb5TM
 hYgQ49CIu5cq2+0PLnTyeCo4iWLMqHgmBUP2Vfjj3IcmAowmHptf4BwdH
 h/2uXY2fuD5OsI2GhZFS9MObbGrCQl1wJFi6qy/lw0TS8/+cufSti8o1x
 bmnmA6P9gn2keHeSpoPji/SVwgb/X2yaGYHlpKPr3tharfwDuP+arEb2S
 wJ5W8NX37SdpPHnD/Mm49qT4q+5hDXe/72KWY1jUsuw0qoIp07jSFRE7p Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="256189124"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="256189124"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="648246270"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/edid: constify struct edid passed around in callbacks
 and closure
Date: Fri, 25 Mar 2022 14:25:30 +0200
Message-Id: <7b5b2cb0134fb376d67ea8d8c1041bab1b40ab2f.1648210803.git.jani.nikula@intel.com>
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

Finalize detailed timing parsing constness by making struct edid also
const in callbacks and closure.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 48 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fad792ef2c79..fae6f39897c8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -97,7 +97,7 @@ static int oui(u8 first, u8 second, u8 third)
 
 struct detailed_mode_closure {
 	struct drm_connector *connector;
-	struct edid *edid;
+	const struct edid *edid;
 	bool preferred;
 	u32 quirks;
 	int modes;
@@ -2419,7 +2419,7 @@ is_rb(const struct detailed_timing *timing, void *data)
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
 static bool
-drm_monitor_supports_rb(struct edid *edid)
+drm_monitor_supports_rb(const struct edid *edid)
 {
 	if (edid->revision >= 4) {
 		bool ret = false;
@@ -2447,7 +2447,7 @@ find_gtf2(const struct detailed_timing *timing, void *data)
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
-drm_gtf2_hbreak(struct edid *edid)
+drm_gtf2_hbreak(const struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
@@ -2459,7 +2459,7 @@ drm_gtf2_hbreak(struct edid *edid)
 }
 
 static int
-drm_gtf2_2c(struct edid *edid)
+drm_gtf2_2c(const struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
@@ -2471,7 +2471,7 @@ drm_gtf2_2c(struct edid *edid)
 }
 
 static int
-drm_gtf2_m(struct edid *edid)
+drm_gtf2_m(const struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
@@ -2483,7 +2483,7 @@ drm_gtf2_m(struct edid *edid)
 }
 
 static int
-drm_gtf2_k(struct edid *edid)
+drm_gtf2_k(const struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
@@ -2495,7 +2495,7 @@ drm_gtf2_k(struct edid *edid)
 }
 
 static int
-drm_gtf2_2j(struct edid *edid)
+drm_gtf2_2j(const struct edid *edid)
 {
 	const struct detailed_timing *timing = NULL;
 
@@ -2510,7 +2510,7 @@ drm_gtf2_2j(struct edid *edid)
  * standard_timing_level - get std. timing level(CVT/GTF/DMT)
  * @edid: EDID block to scan
  */
-static int standard_timing_level(struct edid *edid)
+static int standard_timing_level(const struct edid *edid)
 {
 	if (edid->revision >= 2) {
 		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
@@ -2553,7 +2553,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
 static struct drm_display_mode *
-drm_mode_std(struct drm_connector *connector, struct edid *edid,
+drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
@@ -2715,7 +2715,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * return a new struct drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
-						  struct edid *edid,
+						  const struct edid *edid,
 						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
@@ -2815,7 +2815,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, const u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -2832,7 +2832,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, const u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -2848,7 +2848,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, const u8 *t)
+range_pixel_clock(const struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -2863,7 +2863,7 @@ range_pixel_clock(struct edid *edid, const u8 *t)
 }
 
 static bool
-mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
+mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
 	      const struct detailed_timing *timing)
 {
 	u32 max_clock;
@@ -2909,7 +2909,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 }
 
 static int
-drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -2944,7 +2944,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 }
 
 static int
-drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -2973,7 +2973,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static int
-drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -3041,7 +3041,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 }
 
 static int
-add_inferred_modes(struct drm_connector *connector, struct edid *edid)
+add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
@@ -3103,7 +3103,7 @@ do_established_modes(const struct detailed_timing *timing, void *c)
  * (defined above).  Tease them out and add them to the global modes list.
  */
 static int
-add_established_modes(struct drm_connector *connector, struct edid *edid)
+add_established_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
 	unsigned long est_bits = edid->established_timings.t1 |
@@ -3140,7 +3140,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
-	struct edid *edid = closure->edid;
+	const struct edid *edid = closure->edid;
 	int i;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
@@ -3167,7 +3167,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
  * GTF or CVT. Grab them from @edid and add them to the list.
  */
 static int
-add_standard_modes(struct drm_connector *connector, struct edid *edid)
+add_standard_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
@@ -3259,7 +3259,7 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
 }
 
 static int
-add_cvt_modes(struct drm_connector *connector, struct edid *edid)
+add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
@@ -3313,7 +3313,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
  * @quirks: quirks to apply
  */
 static int
-add_detailed_modes(struct drm_connector *connector, struct edid *edid,
+add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 		   u32 quirks)
 {
 	struct detailed_mode_closure closure = {
@@ -4520,7 +4520,7 @@ monitor_name(const struct detailed_timing *timing, void *data)
 	*res = timing->data.other_data.data.str.str;
 }
 
-static int get_monitor_name(struct edid *edid, char name[13])
+static int get_monitor_name(const struct edid *edid, char name[13])
 {
 	const char *edid_name = NULL;
 	int mnl;
-- 
2.30.2

