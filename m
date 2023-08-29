Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076578C906
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2685F10E3E6;
	Tue, 29 Aug 2023 15:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5810E3E2;
 Tue, 29 Aug 2023 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324740; x=1724860740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FB7ss4kmHop2yaKxXN25+gcSbQ8RmW+Dh4y7g/Bgb5o=;
 b=RRN+8jELxiRNyqp2ZeAZgYcJZEm5bZAF6L9P/5qZJUMdFOMzRjTLwOJn
 gxtR6ZpA1bRILLq4WPbIoNS9Sd7bELeIVgDo4LgUlr2owwU5E4gAi5DKc
 +HR4ZlLpsm46xtfx7311AlnWS2CPj/CuhhAcTTvsxVx3lRMCOcBYXChTc
 8LvtTLc86Ut6z+fRJeuEUsff02wdvjH+BY8XZ7uH63+D8j0z3WfEd6cNb
 UJbXMKgEh4iY/YnnkugdT+LYdeXZkIWIYp5MnPHdpa75ok/I05ydmoZ0E
 f36KKADNUf2NnyIJBxfl4a50rTmdLVbgdnyajKlxkpVUrEPe83girAEVi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769251"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769251"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554994"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554994"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:58 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 08/33] drm: Add color lut range structure
Date: Tue, 29 Aug 2023 21:33:57 +0530
Message-ID: <20230829160422.1251087-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add color lut range structure which is to be used to advertize
the capabilities of pre-csc/post-csc color operation blocks.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 include/uapi/drm/drm_mode.h | 77 +++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1cd656b0e994..6ce7bd0926e0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1091,6 +1091,83 @@ struct drm_color_pipeline {
 				  DRM_MODE_PAGE_FLIP_ASYNC | \
 				  DRM_MODE_PAGE_FLIP_TARGET)
 
+/**
+ * DRM_MODE_LUT_POST_CSC
+ *
+ * LUT is for post csc (after CTM)
+ */
+#define DRM_MODE_LUT_POST_CSC BIT(0)
+
+/**
+ * DRM_MODE_LUT_PRE_CSC
+ *
+ * LUT is for pre csc (before CTM)
+ */
+#define DRM_MODE_LUT_PRE_CSC BIT(1)
+
+/**
+ * DRM_MODE_LUT_INTERPOLATE
+ *
+ * linearly interpolate between the points
+ */
+#define DRM_MODE_LUT_INTERPOLATE BIT(2)
+
+/**
+ * DRM_MODE_LUT_REUSE_LAST
+ *
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_MODE_LUT_REUSE_LAST BIT(3)
+
+/**
+ * DRM_MODE_LUT_NON_DECREASING
+ *
+ * the curve must be non-decreasing
+ */
+#define DRM_MODE_LUT_NON_DECREASING BIT(4)
+
+/**
+ * DRM_MODE_LUT_REFLECT_NEGATIVE
+ *
+ *  the curve is reflected across origin for negative inputs
+ */
+#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
+
+/**
+ * DRM_MODE_LUT_SINGLE_CHANNEL
+ *
+ * the same curve (red) is used for blue and green channels as well
+ */
+#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
+
+/**
+ * struct drm_color_lut_range
+ *
+ * structure to advertise capability of a color hardware
+ * block that accepts LUT values.  It can represent LUTs with
+ * varied number of entries and distributions
+ * (Multi segmented, Logarithmic etc).
+ */
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
+	LUT_TYPE_PRE_CSC = 0,
+	LUT_TYPE_POST_CSC = 1,
+};
+
 /*
  * Request a page flip on the specified crtc.
  *
-- 
2.38.1

