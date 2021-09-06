Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590444020D1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3836289CD7;
	Mon,  6 Sep 2021 21:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A031489CCB;
 Mon,  6 Sep 2021 21:01:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747375"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:00:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362114"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:00:57 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range attributes
Date: Tue,  7 Sep 2021 03:08:44 +0530
Message-Id: <20210906213904.27918-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing LUT precision structure is having only 16 bit
precision. This is not enough for upcoming enhanced hardwares
and advance usecases like HDR processing. Hence added a new
structure with 32 bit precision values.

This also defines a new structure to define color lut ranges,
along with related macro definitions and enums. This will help
describe multi segmented lut ranges in the hardware.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 90c55383f1ee..1079794c86c3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -903,6 +903,64 @@ struct hdr_output_metadata {
 	};
 };
 
+/*
+ * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
+ * can be used for either purpose, but not simultaneously. To expose
+ * modes that support gamma and degamma simultaneously the gamma mode
+ * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
+ * ranges.
+ */
+/* LUT is for gamma (after CTM) */
+#define DRM_MODE_LUT_GAMMA BIT(0)
+/* LUT is for degamma (before CTM) */
+#define DRM_MODE_LUT_DEGAMMA BIT(1)
+/* linearly interpolate between the points */
+#define DRM_MODE_LUT_INTERPOLATE BIT(2)
+/*
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_MODE_LUT_REUSE_LAST BIT(3)
+/* the curve must be non-decreasing */
+#define DRM_MODE_LUT_NON_DECREASING BIT(4)
+/* the curve is reflected across origin for negative inputs */
+#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
+/* the same curve (red) is used for blue and green channels as well */
+#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
+
+struct drm_color_lut_range {
+	/* DRM_MODE_LUT_* */
+	__u32 flags;
+	/* number of points on the curve */
+	__u16 count;
+	/* input/output bits per component */
+	__u8 input_bpc, output_bpc;
+	/* input start/end values */
+	__s32 start, end;
+	/* output min/max values */
+	__s32 min, max;
+};
+
+enum lut_type {
+	LUT_TYPE_DEGAMMA = 0,
+	LUT_TYPE_GAMMA = 1,
+};
+
+/*
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+	/*
+	 * Data is U32.32 fixed point format.
+	 */
+	__u64 red;
+	__u64 green;
+	__u64 blue;
+	__u64 reserved;
+};
+
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
-- 
2.26.2

