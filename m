Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F051FC10
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E010EEC2;
	Mon,  9 May 2022 12:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6057710EEC2;
 Mon,  9 May 2022 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097879; x=1683633879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6KiU8gOfrG3whqxXGyEQLj8ELtFqtVdqqBIwfFlQhOY=;
 b=XSGoXZ/PT9/qysRYc/fzyiZ6jYc4sOKWmqrcCLqfZhbuQXjF6qgM+2p7
 0wRFyogRfntTZVkA9dsjjeCeddMsPTKP+QtmDIsI0bxDaCOb+SbbfdOs3
 4R45gE+XA/h+Hs9cF6694blSUuFwa7HZLGa6yrzGfi/s+UuUzReF11hbA
 ecNFaZVz0vpLhtE3HxZ10baLN76F+1cAiNIMUfRTKGfSjUjFsZeLKK8gl
 5h9ECy/3gcmuXaT+tE3IfC7KWV7ldu0PCeVG/LDO08y4dkgksHXLIME68
 IOx68sq2/XG57yqzKHqDK2gH/Hp3gPs8Fu452Vda1ViDWWckmjmiOA1zw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355456752"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355456752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="519195402"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/25] drm/edid: convert drm_mode_std() and children to
 drm_edid
Date: Mon,  9 May 2022 15:03:12 +0300
Message-Id: <9fb970d108a8bb666b87a590c74f480e0fd81cc8.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 52 ++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 51d918c66a26..bea8f33c58ad 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2673,11 +2673,11 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
-drm_gtf2_hbreak(const struct edid *edid)
+drm_gtf2_hbreak(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
 
@@ -2685,11 +2685,11 @@ drm_gtf2_hbreak(const struct edid *edid)
 }
 
 static int
-drm_gtf2_2c(const struct edid *edid)
+drm_gtf2_2c(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
 
@@ -2697,11 +2697,11 @@ drm_gtf2_2c(const struct edid *edid)
 }
 
 static int
-drm_gtf2_m(const struct edid *edid)
+drm_gtf2_m(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
 
@@ -2709,11 +2709,11 @@ drm_gtf2_m(const struct edid *edid)
 }
 
 static int
-drm_gtf2_k(const struct edid *edid)
+drm_gtf2_k(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
 
@@ -2721,11 +2721,11 @@ drm_gtf2_k(const struct edid *edid)
 }
 
 static int
-drm_gtf2_2j(const struct edid *edid)
+drm_gtf2_2j(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
 
@@ -2733,12 +2733,14 @@ drm_gtf2_2j(const struct edid *edid)
 }
 
 /* Get standard timing level (CVT/GTF/DMT). */
-static int standard_timing_level(const struct edid *edid)
+static int standard_timing_level(const struct drm_edid *drm_edid)
 {
+	const struct edid *edid = drm_edid->edid;
+
 	if (edid->revision >= 2) {
 		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
 			return LEVEL_CVT;
-		if (drm_gtf2_hbreak(edid))
+		if (drm_gtf2_hbreak(drm_edid))
 			return LEVEL_GTF2;
 		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
 			return LEVEL_GTF;
@@ -2770,9 +2772,9 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
  * Take the standard timing params (in this case width, aspect, and refresh)
  * and convert them into a real mode using CVT/GTF/DMT.
  */
-static struct drm_display_mode *
-drm_mode_std(struct drm_connector *connector, const struct edid *edid,
-	     const struct std_timing *t)
+static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid,
+					     const struct std_timing *t)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *m, *mode = NULL;
@@ -2782,7 +2784,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 		>> EDID_TIMING_ASPECT_SHIFT;
 	unsigned vfreq = (t->vfreq_aspect & EDID_TIMING_VFREQ_MASK)
 		>> EDID_TIMING_VFREQ_SHIFT;
-	int timing_level = standard_timing_level(edid);
+	int timing_level = standard_timing_level(drm_edid);
 
 	if (bad_std_timing(t->hsize, t->vfreq_aspect))
 		return NULL;
@@ -2793,7 +2795,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	vrefresh_rate = vfreq + 60;
 	/* the vdisplay is calculated based on the aspect ratio */
 	if (aspect_ratio == 0) {
-		if (edid->revision < 3)
+		if (drm_edid->edid->revision < 3)
 			vsize = hsize;
 		else
 			vsize = (hsize * 10) / 16;
@@ -2836,7 +2838,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	}
 
 	/* check whether it can be found in default mode table */
-	if (drm_monitor_supports_rb(edid)) {
+	if (drm_monitor_supports_rb(drm_edid->edid)) {
 		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
 					 true);
 		if (mode)
@@ -2862,14 +2864,14 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 		mode = drm_gtf_mode(dev, hsize, vsize, vrefresh_rate, 0, 0);
 		if (!mode)
 			return NULL;
-		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(edid)) {
+		if (drm_mode_hsync(mode) > drm_gtf2_hbreak(drm_edid)) {
 			drm_mode_destroy(dev, mode);
 			mode = drm_gtf_mode_complex(dev, hsize, vsize,
 						    vrefresh_rate, 0, 0,
-						    drm_gtf2_m(edid),
-						    drm_gtf2_2c(edid),
-						    drm_gtf2_k(edid),
-						    drm_gtf2_2j(edid));
+						    drm_gtf2_m(drm_edid),
+						    drm_gtf2_2c(drm_edid),
+						    drm_gtf2_k(drm_edid),
+						    drm_gtf2_2j(drm_edid));
 		}
 		break;
 	case LEVEL_CVT:
@@ -3360,7 +3362,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
+		newmode = drm_mode_std(connector, closure->drm_edid, std);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
 			closure->modes++;
@@ -3385,7 +3387,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, drm_edid->edid,
+		newmode = drm_mode_std(connector, drm_edid,
 				       &drm_edid->edid->standard_timings[i]);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
-- 
2.30.2

