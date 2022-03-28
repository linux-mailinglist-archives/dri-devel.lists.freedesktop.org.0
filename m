Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F84E9104
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636D10EC20;
	Mon, 28 Mar 2022 09:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64C10EB6A;
 Mon, 28 Mar 2022 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459102; x=1679995102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjvPNHMd0YKRpG54o8/pJGaow228lq34iEERd84wFxk=;
 b=SEaVc382ldsWkkTuvKT6mGvAaU/5pZCgFH3ggi1W0SIpFFxD0h2serIZ
 J1orY8FK1g3Kyl/e9UE5ygp8FM98yRyoGrB9fEprSAEyn82LIJ9qM2+vL
 qhKl7FG3AjLWrp6VN6EvWXCTd1qGNufASkSGqN8USRBuWTK3qCgYSqEfk
 eJ8A6LnFscii/eYyUwqeyLZkvXcgxgjb5YX/yDyDztHdwyrXL2bCQaY7E
 GfQFsvwu568KoyBNEAH7c0cFlf68ipiih1IDm6wYgH6e/BPm/P2cAOGBv
 dbvdn7MyFa4tWQXZaI3aUBfFJtPIB58bXPJo5fkYrQs3PM3KL1NK/vz3u A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="241106730"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="241106730"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="830508170"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:18:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/11] drm/edid: constify struct edid passed around in
 callbacks and closure
Date: Mon, 28 Mar 2022 12:17:24 +0300
Message-Id: <8d153fc52f2c45c3bc9030e175fa4e13095a50d5.1648458971.git.jani.nikula@intel.com>
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

Finalize detailed timing parsing constness by making struct edid also
const in callbacks and closure.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 48 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4542f8b8c8f0..0c4b95fb6bd9 100644
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
@@ -2424,7 +2424,7 @@ is_rb(const struct detailed_timing *descriptor, void *data)
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
 static bool
-drm_monitor_supports_rb(struct edid *edid)
+drm_monitor_supports_rb(const struct edid *edid)
 {
 	if (edid->revision >= 4) {
 		bool ret = false;
@@ -2453,7 +2453,7 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
-drm_gtf2_hbreak(struct edid *edid)
+drm_gtf2_hbreak(const struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
@@ -2466,7 +2466,7 @@ drm_gtf2_hbreak(struct edid *edid)
 }
 
 static int
-drm_gtf2_2c(struct edid *edid)
+drm_gtf2_2c(const struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
@@ -2479,7 +2479,7 @@ drm_gtf2_2c(struct edid *edid)
 }
 
 static int
-drm_gtf2_m(struct edid *edid)
+drm_gtf2_m(const struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
@@ -2492,7 +2492,7 @@ drm_gtf2_m(struct edid *edid)
 }
 
 static int
-drm_gtf2_k(struct edid *edid)
+drm_gtf2_k(const struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
@@ -2505,7 +2505,7 @@ drm_gtf2_k(struct edid *edid)
 }
 
 static int
-drm_gtf2_2j(struct edid *edid)
+drm_gtf2_2j(const struct edid *edid)
 {
 	const struct detailed_data_monitor_range *range = NULL;
 
@@ -2521,7 +2521,7 @@ drm_gtf2_2j(struct edid *edid)
  * standard_timing_level - get std. timing level(CVT/GTF/DMT)
  * @edid: EDID block to scan
  */
-static int standard_timing_level(struct edid *edid)
+static int standard_timing_level(const struct edid *edid)
 {
 	if (edid->revision >= 2) {
 		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
@@ -2564,7 +2564,7 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
 static struct drm_display_mode *
-drm_mode_std(struct drm_connector *connector, struct edid *edid,
+drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
@@ -2726,7 +2726,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * return a new struct drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
-						  struct edid *edid,
+						  const struct edid *edid,
 						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
@@ -2826,7 +2826,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 
 static bool
 mode_in_hsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, const u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int hsync, hmin, hmax;
 
@@ -2843,7 +2843,7 @@ mode_in_hsync_range(const struct drm_display_mode *mode,
 
 static bool
 mode_in_vsync_range(const struct drm_display_mode *mode,
-		    struct edid *edid, const u8 *t)
+		    const struct edid *edid, const u8 *t)
 {
 	int vsync, vmin, vmax;
 
@@ -2859,7 +2859,7 @@ mode_in_vsync_range(const struct drm_display_mode *mode,
 }
 
 static u32
-range_pixel_clock(struct edid *edid, const u8 *t)
+range_pixel_clock(const struct edid *edid, const u8 *t)
 {
 	/* unspecified */
 	if (t[9] == 0 || t[9] == 255)
@@ -2874,7 +2874,7 @@ range_pixel_clock(struct edid *edid, const u8 *t)
 }
 
 static bool
-mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
+mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
 	      const struct detailed_timing *timing)
 {
 	u32 max_clock;
@@ -2920,7 +2920,7 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 }
 
 static int
-drm_dmt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -2955,7 +2955,7 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 }
 
 static int
-drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -2984,7 +2984,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
 }
 
 static int
-drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
+drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
 			const struct detailed_timing *timing)
 {
 	int i, modes = 0;
@@ -3052,7 +3052,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 }
 
 static int
-add_inferred_modes(struct drm_connector *connector, struct edid *edid)
+add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
@@ -3114,7 +3114,7 @@ do_established_modes(const struct detailed_timing *timing, void *c)
  * (defined above).  Tease them out and add them to the global modes list.
  */
 static int
-add_established_modes(struct drm_connector *connector, struct edid *edid)
+add_established_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
 	unsigned long est_bits = edid->established_timings.t1 |
@@ -3151,7 +3151,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	const struct edid_display_descriptor *data = &timing->data.descriptor;
 	struct drm_connector *connector = closure->connector;
-	struct edid *edid = closure->edid;
+	const struct edid *edid = closure->edid;
 	int i;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
@@ -3178,7 +3178,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
  * GTF or CVT. Grab them from @edid and add them to the list.
  */
 static int
-add_standard_modes(struct drm_connector *connector, struct edid *edid)
+add_standard_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
@@ -3270,7 +3270,7 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
 }
 
 static int
-add_cvt_modes(struct drm_connector *connector, struct edid *edid)
+add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
@@ -3324,7 +3324,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
  * @quirks: quirks to apply
  */
 static int
-add_detailed_modes(struct drm_connector *connector, struct edid *edid,
+add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 		   u32 quirks)
 {
 	struct detailed_mode_closure closure = {
@@ -4531,7 +4531,7 @@ monitor_name(const struct detailed_timing *timing, void *data)
 	*res = timing->data.descriptor.data.str.str;
 }
 
-static int get_monitor_name(struct edid *edid, char name[13])
+static int get_monitor_name(const struct edid *edid, char name[13])
 {
 	const char *edid_name = NULL;
 	int mnl;
-- 
2.30.2

