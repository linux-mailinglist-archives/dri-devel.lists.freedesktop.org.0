Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1D5ECA49
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2210E039;
	Tue, 27 Sep 2022 17:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786DC10E090;
 Tue, 27 Sep 2022 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298017; x=1695834017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbd7iwv+W+UQ7+uxsm3XwZbEzCthnf1625cjyaR3X9s=;
 b=CKdG5/ZJHnjlkGD10hTRtOdehLLoEKYpwhPDGWQBV3GuVfFn3eaJEQXe
 QIeD5E994zkCCr3HinmvvMIXIBrc1NLeXQGOrnoMtK+HlPuMw3cURQl9m
 IwnxE1pjGIDUIQTFcMh61QPU1TK/PytTSQEThCbEB81GdavONZCIxQkg0
 4Qzc6TuMvfufkMXAHK70HJcaNbRo/xxLjKI2DtZR+Z9FbcaDY72iTpfag
 2WYV35UScyaksn1dBdjqHSIhhY5iOrmDX1xXgZt6V6FOLWjhlASPOROvS
 ARdn6YHxteu/+Z9rX6umOFs/bbQIQhybOB4I1GnLxUkcoHwb7tgysXIal g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="363208145"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="363208145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821519"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="623821519"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/edid: Define more flags
Date: Tue, 27 Sep 2022 19:59:59 +0300
Message-Id: <20220927170006.27855-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
References: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace a bunch of hex constants with proper definitions.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 include/drm/drm_edid.h     | 14 +++++++++-----
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ac662495635c..76753c56d4f7 100644
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

