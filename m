Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F59B5A3117
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265B510E6FC;
	Fri, 26 Aug 2022 21:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC0310E6A0;
 Fri, 26 Aug 2022 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549719; x=1693085719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TXDMWEAcAjk8n+euJh0r9fOVldCET2/TNmI3zs48AwI=;
 b=VeFMj+mFdgWQQAO7MVHi2V8e4fxdRjF2KwSzT1wfZx+1QanzPIK3iPJU
 inbJFHnv09O9rXnZQfm7DNQNWCDofjskKQKHLIXFf1E8NaDjkBzTm0wsh
 RKViezNk96d+CvBrbt1m56SSQ68W8wMwhvcUTSlWdq1dwrd8QGjJGijo3
 ydmtRITGBi8kB+04LyuLhguNQCBbGw4vbVXm9M31hDm6D1Fo2Ibiw4hNe
 k788p3u09bBMnqWQ0RqdOM/eT96XtZ43TJBW5veEP8bPHQMmE7clEJsbD
 CTnV4XKTLbpS4qKeysr/FDaQRk4kinTgpzYz7ozX57cCaW1bB63PYc9Fh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295870971"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="295870971"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="640215062"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 26 Aug 2022 14:35:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/edid: Define more flags
Date: Sat, 27 Aug 2022 00:34:54 +0300
Message-Id: <20220826213501.31490-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace a bunch of hex constants with proper definitions.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 include/drm/drm_edid.h     | 14 +++++++++-----
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4355d73632c3..856d304a1354 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2984,7 +2984,7 @@ is_rb(const struct detailed_timing *descriptor, void *data)
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.cvt.flags) != 15);
 
 	if (descriptor->data.other_data.data.range.flags == DRM_EDID_CVT_SUPPORT_FLAG &&
-	    descriptor->data.other_data.data.range.formula.cvt.flags & 0x10)
+	    descriptor->data.other_data.data.range.formula.cvt.flags & DRM_EDID_CVT_FLAGS_REDUCED_BLANKING)
 		*res = true;
 }
 
@@ -3012,7 +3012,7 @@ find_gtf2(const struct detailed_timing *descriptor, void *data)
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
 
-	if (descriptor->data.other_data.data.range.flags == 0x02)
+	if (descriptor->data.other_data.data.range.flags == DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG)
 		*res = descriptor;
 }
 
@@ -3415,7 +3415,7 @@ range_pixel_clock(const struct edid *edid, const u8 *t)
 		return 0;
 
 	/* 1.4 with CVT support gives us real precision, yay */
-	if (edid->revision >= 4 && t[10] == 0x04)
+	if (edid->revision >= 4 && t[10] == DRM_EDID_CVT_SUPPORT_FLAG)
 		return (t[9] * 10000) - ((t[12] >> 2) * 250);
 
 	/* 1.3 is pathetic, so fuzz up a bit */
@@ -3441,7 +3441,7 @@ static bool mode_in_range(const struct drm_display_mode *mode,
 			return false;
 
 	/* 1.4 max horizontal check */
-	if (edid->revision >= 4 && t[10] == 0x04)
+	if (edid->revision >= 4 && t[10] == DRM_EDID_CVT_SUPPORT_FLAG)
 		if (t[13] && mode->hdisplay > 8 * (t[13] + (256 * (t[12]&0x3))))
 			return false;
 
@@ -3581,13 +3581,13 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
-	case 0x02: /* secondary gtf, XXX could do more */
-	case 0x00: /* default gtf */
+	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG: /* XXX could do more */
+	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
 		closure->modes += drm_gtf_modes_for_range(closure->connector,
 							  closure->drm_edid,
 							  timing);
 		break;
-	case 0x04: /* cvt, only in 1.4+ */
+	case DRM_EDID_CVT_SUPPORT_FLAG:
 		if (!version_greater(closure->drm_edid, 1, 3))
 			break;
 
@@ -3595,7 +3595,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 							  closure->drm_edid,
 							  timing);
 		break;
-	case 0x01: /* just the ranges, no formula */
+	case DRM_EDID_RANGE_LIMITS_ONLY_FLAG:
 	default:
 		break;
 	}
@@ -6393,7 +6393,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	num_modes += add_cea_modes(connector, drm_edid);
 	num_modes += add_alternate_cea_modes(connector, drm_edid);
 	num_modes += add_displayid_detailed_modes(connector, drm_edid);
-	if (drm_edid->edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
+	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
 		num_modes += add_inferred_modes(connector, drm_edid);
 
 	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 1ed61e2b30a4..429735b91f63 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -97,10 +97,13 @@ struct detailed_data_string {
 #define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2) /* 1.4 */
 #define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3) /* 1.4 */
 
-#define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
-#define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
-#define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
-#define DRM_EDID_CVT_SUPPORT_FLAG           0x04
+#define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00 /* 1.3 */
+#define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01 /* 1.4 */
+#define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02 /* 1.3 */
+#define DRM_EDID_CVT_SUPPORT_FLAG           0x04 /* 1.4 */
+
+#define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
+#define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
 struct detailed_data_monitor_range {
 	u8 min_vfreq;
@@ -206,7 +209,8 @@ struct detailed_timing {
 #define DRM_EDID_DIGITAL_TYPE_DP       (5 << 0) /* 1.4 */
 #define DRM_EDID_DIGITAL_DFP_1_X       (1 << 0) /* 1.3 */
 
-#define DRM_EDID_FEATURE_DEFAULT_GTF      (1 << 0)
+#define DRM_EDID_FEATURE_DEFAULT_GTF      (1 << 0) /* 1.2 */
+#define DRM_EDID_FEATURE_CONTINUOUS_FREQ  (1 << 0) /* 1.4 */
 #define DRM_EDID_FEATURE_PREFERRED_TIMING (1 << 1)
 #define DRM_EDID_FEATURE_STANDARD_COLOR   (1 << 2)
 /* If analog */
-- 
2.35.1

