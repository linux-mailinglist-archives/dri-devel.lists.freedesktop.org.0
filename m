Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F84E735F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEA810E448;
	Fri, 25 Mar 2022 12:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A4410E4FC;
 Fri, 25 Mar 2022 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211162; x=1679747162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yE8S276Ukc0K5Id/fqiICtNY014Oi8Rd6NP8uBVdIlc=;
 b=nA0a1PpDOLCuRGeeaJKDbkZpgFyhHNpWprHJJMnEO2RYFJip2VjufNKp
 V/UNXU7OZS4dI/mXOUJ/rl07PLUQla9Bq1SmfEMqIUesD0NElp/n8PaM8
 mM83dCGgPZHihSNn9nGhy+nhpz8Zbw5Vb8T8111XyyIP932Kif9XJQ3f5
 NB9maz5SIH08FeaL5+DHpoRlNrbEh9XnJvvcUXmQ2YSqy5tQAHn1BbbuR
 ijLMfyMWsnzunBGmiZ0/bz/GYN+EPxvdyeBMSptuhAvWe/O28yMbwRzx5
 nEjgpqmPY8PbrL+RnksZMWcKJLpwy3GHY4nx/w2MKgJhGMfOkDWvkfa+4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="240778039"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="240778039"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="516531607"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:26:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/edid: constify struct detailed_timing in lower level
 parsing
Date: Fri, 25 Mar 2022 14:25:27 +0200
Message-Id: <6c5e94ace7d6308935f90db34b77125abcb4b62e.1648210803.git.jani.nikula@intel.com>
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

Start constifying the struct detailed_timing pointers being passed
around from bottom up.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a9df75cdcc5b..593f151c1155 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2555,7 +2555,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  */
 static struct drm_display_mode *
 drm_mode_std(struct drm_connector *connector, struct edid *edid,
-	     struct std_timing *t)
+	     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
@@ -2673,7 +2673,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
  */
 static void
 drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
-			    struct detailed_pixel_timing *pt)
+			    const struct detailed_pixel_timing *pt)
 {
 	int i;
 	static const struct {
@@ -2717,11 +2717,11 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 						  struct edid *edid,
-						  struct detailed_timing *timing,
+						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
 	struct drm_display_mode *mode;
-	struct detailed_pixel_timing *pt = &timing->data.pixel_data;
+	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
 	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
 	unsigned vactive = (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactive_lo;
 	unsigned hblank = (pt->hactive_hblank_hi & 0xf) << 8 | pt->hblank_lo;
@@ -2816,7 +2816,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -2833,7 +2833,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -2849,7 +2849,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, u8 *t)
+range_pixel_clock(struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -2865,10 +2865,10 @@ range_pixel_clock(struct edid *edid, u8 *t)
 
 static bool
 mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
-	      struct detailed_timing *timing)
+	      const struct detailed_timing *timing)
 {
 	u32 max_clock;
-	u8 *t = (u8 *)timing;
+	const u8 *t = (const u8 *)timing;
 
 	if (!mode_in_hsync_range(mode, edid, t))
 		return false;
@@ -2911,7 +2911,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 
 static int
 drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2946,7 +2946,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 
 static int
 drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2975,7 +2975,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 
 static int
 drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -3007,8 +3007,8 @@ static void
 do_inferred_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
-	struct detailed_data_monitor_range *range = &data->data.range;
+	const struct detailed_non_pixel *data = &timing->data.other_data;
+	const struct detailed_data_monitor_range *range = &data->data.range;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -3057,11 +3057,11 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
 }
 
 static int
-drm_est3_modes(struct drm_connector *connector, struct detailed_timing *timing)
+drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *timing)
 {
 	int i, j, m, modes = 0;
 	struct drm_display_mode *mode;
-	u8 *est = ((u8 *)timing) + 6;
+	const u8 *est = ((const u8 *)timing) + 6;
 
 	for (i = 0; i < 6; i++) {
 		for (j = 7; j >= 0; j--) {
@@ -3140,7 +3140,7 @@ static void
 do_standard_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
+	const struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
 	struct edid *edid = closure->edid;
 	int i;
@@ -3149,7 +3149,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 		return;
 
 	for (i = 0; i < 6; i++) {
-		struct std_timing *std = &data->data.timings[i];
+		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
 		newmode = drm_mode_std(connector, edid, std);
@@ -3198,12 +3198,12 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
 }
 
 static int drm_cvt_modes(struct drm_connector *connector,
-			 struct detailed_timing *timing)
+			 const struct detailed_timing *timing)
 {
 	int i, j, modes = 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
-	struct cvt_timing *cvt;
+	const struct cvt_timing *cvt;
 	const int rates[] = { 60, 85, 75, 60, 50 };
 	const u8 empty[3] = { 0, 0, 0 };
 
-- 
2.30.2

