Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2E4E9103
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A8C10EBB6;
	Mon, 28 Mar 2022 09:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4395B10EBEB;
 Mon, 28 Mar 2022 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459106; x=1679995106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RiJIIxEYo5DrI+6dT0nLvCLL+B3So7UixYzpfdMv534=;
 b=OUfWLhVq0s6JH3w0wzGssogdB+ZBLUu3nZi+QfGDkLNCkXAL8sEvuy0+
 99UWmk8iDCDUIp/egoLplatwcU2t8vcD/QQ8XHChAfWLrIIm9AHKHbxe4
 v/iwUEqq77PFPOazEuFHGKILhzyp5k6NhNQd6bU4SF6tajHzuqqkWp2Vr
 LzWoAEKaWG2vQTlXt+v+ROPFzeMGc6+oXTZQm/koC6MdMIWbcusNiJV+Y
 RL4HFNrPsx4DpJM3eEBwh5K8O4XUEQJITMzaaNmVVYRIBMAtoADK/KKLM
 VhOjgBhHPupPQvSXhHW+pvOezH7O0Q4LqGyCaxSJi/lRpzR6As0xNS5Jr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="283841884"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="283841884"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="603962424"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/edid: constify struct detailed_timing in lower
 level parsing
Date: Mon, 28 Mar 2022 12:17:21 +0300
Message-Id: <5db2906c3767ea80392cf91b9aa5745763349c4f.1648458971.git.jani.nikula@intel.com>
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

Start constifying the struct detailed_timing pointers being passed
around from bottom up.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4d63f3412672..60eee683be3f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2566,7 +2566,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  */
 static struct drm_display_mode *
 drm_mode_std(struct drm_connector *connector, struct edid *edid,
-	     struct std_timing *t)
+	     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
@@ -2684,7 +2684,7 @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
  */
 static void
 drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
-			    struct detailed_pixel_timing *pt)
+			    const struct detailed_pixel_timing *pt)
 {
 	int i;
 	static const struct {
@@ -2728,11 +2728,11 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
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
@@ -2827,7 +2827,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -2844,7 +2844,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, u8 *t)
+		    struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -2860,7 +2860,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, u8 *t)
+range_pixel_clock(struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -2876,10 +2876,10 @@ range_pixel_clock(struct edid *edid, u8 *t)
 
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
@@ -2922,7 +2922,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 
 static int
 drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2957,7 +2957,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 
 static int
 drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -2986,7 +2986,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 
 static int
 drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
-			struct detailed_timing *timing)
+			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -3018,8 +3018,8 @@ static void
 do_inferred_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct edid_display_descriptor *data = &timing->data.descriptor;
-	struct detailed_data_monitor_range *range = &data->data.range;
+	const struct edid_display_descriptor *data = &timing->data.descriptor;
+	const struct detailed_data_monitor_range *range = &data->data.range;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -3068,11 +3068,11 @@ add_inferred_modes(struct drm_connector *connector, struct edid *edid)
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
@@ -3151,7 +3151,7 @@ static void
 do_standard_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
-	struct edid_display_descriptor *data = &timing->data.descriptor;
+	const struct edid_display_descriptor *data = &timing->data.descriptor;
 	struct drm_connector *connector = closure->connector;
 	struct edid *edid = closure->edid;
 	int i;
@@ -3160,7 +3160,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 		return;
 
 	for (i = 0; i < 6; i++) {
-		struct std_timing *std = &data->data.timings[i];
+		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
 		newmode = drm_mode_std(connector, edid, std);
@@ -3209,12 +3209,12 @@ add_standard_modes(struct drm_connector *connector, struct edid *edid)
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

