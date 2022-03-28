Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29A4E99C1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65510E679;
	Mon, 28 Mar 2022 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3A10E679;
 Mon, 28 Mar 2022 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478127; x=1680014127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sb/HkICSit8FjZ8yoZIFDiYe6S2j9dX5bL0gtqaEZY=;
 b=kDYD/TaEwgFnZyk/t3DmwMNrGo2iftjMqb1q9Pu6V/3RxxoAh+fEBbHj
 547oDkpEVb0NIqFZGz24JEgWW920KvsdTXBGFNCsv7S8+jLYoviXZ0ThF
 XP0UlRudJGrlocSgChhdbU3EXQ2K33L3teNKdUBCSShaPKXvyJGZpckGy
 prsysiBzaOOCz6MBceDz9Ily4rtXgs93IXs+CL92W/psjrw8R3epCpXTy
 bZBECnDkd6v8Q/5YwM9lEsFJxu5j9LXZbK6FROr2s/Vu9HqZYKrcSpc9n
 XazbWCRJSJY0iT6FJ/RD5qK9sC1xHF+CBGO3wRp3puibjHkRWgynWDKib A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="256586334"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="256586334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="585211049"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/12] drm/edid: constify struct detailed_timing in lower
 level parsing
Date: Mon, 28 Mar 2022 17:34:28 +0300
Message-Id: <0b7fafcc7784db0003e454544916c273a9eb1250.1648477901.git.jani.nikula@intel.com>
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

Start constifying the struct detailed_timing pointers being passed
around from bottom up.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 27a0e9bf260c..6d1461991ba4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2560,7 +2560,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  */
 static struct drm_display_mode *
 drm_mode_std(struct drm_connector *connector, struct edid *edid,
-	     struct std_timing *t)
+	     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
@@ -2678,7 +2678,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
  */
 static void
 drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
-			    struct detailed_pixel_timing *pt)
+			    const struct detailed_pixel_timing *pt)
 {
 	int i;
 	static const struct {
@@ -2722,11 +2722,11 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
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
@@ -2821,7 +2821,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -2838,7 +2838,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -2854,7 +2854,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, u8 *t)
+range_pixel_clock(struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -2870,10 +2870,10 @@ range_pixel_clock(struct edid *edid, u8 *t)
 
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
@@ -2916,7 +2916,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 
 static int
 drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2951,7 +2951,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 
 static int
 drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2980,7 +2980,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 
 static int
 drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -3012,8 +3012,8 @@ static void
 do_inferred_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
-	struct detailed_data_monitor_range *range = &data->data.range;
+	const struct detailed_non_pixel *data = &timing->data.other_data;
+	const struct detailed_data_monitor_range *range = &data->data.range;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -3062,11 +3062,11 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
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
@@ -3145,7 +3145,7 @@ static void
 do_standard_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct detailed_non_pixel *data = &timing->data.other_data;
+	const struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
 	struct edid *edid = closure->edid;
 	int i;
@@ -3154,7 +3154,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 		return;
 
 	for (i = 0; i < 6; i++) {
-		struct std_timing *std = &data->data.timings[i];
+		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
 		newmode = drm_mode_std(connector, edid, std);
@@ -3203,12 +3203,12 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
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

