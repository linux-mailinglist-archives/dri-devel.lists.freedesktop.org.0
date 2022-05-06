Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0851D554
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DC10FAC1;
	Fri,  6 May 2022 10:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A07010FAC1;
 Fri,  6 May 2022 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831909; x=1683367909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6XB8zLqO4CFu0L7dfD2s6tSvq36y3iQzcFimlyq9Vo=;
 b=EpG9IKKDDHUIZc3bYnOo7ivkssUEsslTgUIwYIi1hOhOKFoDHq92X3AA
 fccm+xfJd10wUgzGMLD8FI9Grn2cXH/A0cyqZ3+yb24T5sHyPS6D/PFy1
 /Fs2QzswcUOPOHaE3xHIixRNxrp/O48pXKa0udbsrVEGAxFSJtl8Nq2IX
 HMx029eAiW40FDkwPzfm4nYD5MPeoZMn6r0TQIpeZqGC4O7J8AykWf6nL
 fUHo5QDPzWbXJMlk3tl2ofFwS/dIrq4H2dm9XFEGpsu9496iimujKcUaT
 Kl1xNPhGf4o/NgsDUpix40t+/kebagMwmcZQnTFiou/BCAo5ekVhN9tXY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293631602"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293631602"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654646932"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/25] drm/edid: convert drm_mode_std() and children to
 drm_edid
Date: Fri,  6 May 2022 13:10:20 +0300
Message-Id: <f56ff5831c2c8cbfb9c575c32020a84c3b09db87.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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
index 27655da6ef9c..4b2d3453fc5c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2655,11 +2655,11 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
 
 /* Secondary GTF curve kicks in above some break frequency */
 static int
-drm_gtf2_hbreak(const struct edid *edid)
+drm_gtf2_hbreak(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
 
@@ -2667,11 +2667,11 @@ drm_gtf2_hbreak(const struct edid *edid)
 }
 
 static int
-drm_gtf2_2c(const struct edid *edid)
+drm_gtf2_2c(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
 
@@ -2679,11 +2679,11 @@ drm_gtf2_2c(const struct edid *edid)
 }
 
 static int
-drm_gtf2_m(const struct edid *edid)
+drm_gtf2_m(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
 
@@ -2691,11 +2691,11 @@ drm_gtf2_m(const struct edid *edid)
 }
 
 static int
-drm_gtf2_k(const struct edid *edid)
+drm_gtf2_k(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
 
@@ -2703,11 +2703,11 @@ drm_gtf2_k(const struct edid *edid)
 }
 
 static int
-drm_gtf2_2j(const struct edid *edid)
+drm_gtf2_2j(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
 
@@ -2715,12 +2715,14 @@ drm_gtf2_2j(const struct edid *edid)
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
@@ -2752,9 +2754,9 @@ static int drm_mode_hsync(const struct drm_display_mode *mode)
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
@@ -2764,7 +2766,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 		>> EDID_TIMING_ASPECT_SHIFT;
 	unsigned vfreq = (t->vfreq_aspect & EDID_TIMING_VFREQ_MASK)
 		>> EDID_TIMING_VFREQ_SHIFT;
-	int timing_level = standard_timing_level(edid);
+	int timing_level = standard_timing_level(drm_edid);
 
 	if (bad_std_timing(t->hsize, t->vfreq_aspect))
 		return NULL;
@@ -2775,7 +2777,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	vrefresh_rate = vfreq + 60;
 	/* the vdisplay is calculated based on the aspect ratio */
 	if (aspect_ratio == 0) {
-		if (edid->revision < 3)
+		if (drm_edid->edid->revision < 3)
 			vsize = hsize;
 		else
 			vsize = (hsize * 10) / 16;
@@ -2818,7 +2820,7 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
 	}
 
 	/* check whether it can be found in default mode table */
-	if (drm_monitor_supports_rb(edid)) {
+	if (drm_monitor_supports_rb(drm_edid->edid)) {
 		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
 					 true);
 		if (mode)
@@ -2844,14 +2846,14 @@ drm_mode_std(struct drm_connector *connector, const struct edid *edid,
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
@@ -3342,7 +3344,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
+		newmode = drm_mode_std(connector, closure->drm_edid, std);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
 			closure->modes++;
@@ -3367,7 +3369,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, drm_edid->edid,
+		newmode = drm_mode_std(connector, drm_edid,
 				       &drm_edid->edid->standard_timings[i]);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
-- 
2.30.2

