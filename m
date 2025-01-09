Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7171A08115
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A229810EFE0;
	Thu,  9 Jan 2025 20:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqKx1VNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4B410EFDC;
 Thu,  9 Jan 2025 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452892; x=1767988892;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=iWfd4v/RMeJh3+HwhlvwvWQlkQc+eArOLy/m3xgdXdc=;
 b=DqKx1VNjdc72zEXHIaHZsTouW5i1xnsjfOqCpyG+qzU5wv6qCVXlo6or
 LyHWoAEHs6fkELxvNk/h/Rpu/tMYcHYozCErxItB7Gh5/d/34mlzkwsxy
 VNeXwN1pAiYeqFtlHlQYw6vivCUrVlmAH1ydBbQq2Bbr7bGTYumYvuEkK
 ooM/GEb5U8+icSF20MxhhonWAcCMIBJkv55wSxMYcIT07tozQ+FcuAPAX
 K9iJKBAxcw+m9xMpP08jr1Dd++mYL2622iRrb/rqODOU79nlm7BzJwpaL
 M1wqtgf8dXzAka8uso+CS/tb4LSKzU0XYJhKVw3FZAceS4N784v1TWAPG A==;
X-CSE-ConnectionGUID: YaANGSEVT/yw2zfRdBMVFw==
X-CSE-MsgGUID: OqnsQ/FkTmK/0NMxSjxsZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619310"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:32 -0800
X-CSE-ConnectionGUID: YGhnbkNYRpevLU7iRtaKLQ==
X-CSE-MsgGUID: EuC8pfbnSeqZNUi+ar7XZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798701"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:28 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:41 +0530
Subject: [PATCH v7 13/14] drm/i915/histogram: Histogram changes for Display 20+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-13-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

In Display 20+, new registers are added for setting index, reading
histogram and writing the IET.

v2: Removed duplicate code (Jani)
v3: Moved histogram core changes to earlier patches (Jani/Suraj)
v4: Rebased after addressing comments on patch 1
v5: Added the retry logic from patch3 and rebased the patch series
v6: optimize wite_iet() (Suraj)

Bspec: 68895
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c     | 108 +++++++++++++++------
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  25 +++++
 2 files changed, 104 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 039ca16023b1d56c0f1f91d3a1d8ed440e4ea675..d015350b57ed5c8e9aaab71311159bf51e15e9c7 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -22,6 +22,37 @@
 #define HISTOGRAM_BIN_READ_RETRY_COUNT 5
 #define IET_SAMPLE_FORMAT_1_INT_9_FRACT 0x1000009
 
+static void set_bin_index_0(struct intel_display *display, enum pipe pipe)
+{
+	if (DISPLAY_VER(display) >= 20)
+		intel_de_rmw(display, DPST_IE_INDEX(pipe),
+			     DPST_IE_BIN_INDEX_MASK, DPST_IE_BIN_INDEX(0));
+	else
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_MASK,
+			     DPST_CTL_BIN_REG_CLEAR);
+}
+
+static void write_iet(struct intel_display *display, enum pipe pipe,
+			      u32 *data)
+{
+	int i;
+
+	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+		if (DISPLAY_VER(display) >= 20)
+			intel_de_rmw(display, DPST_IE_BIN(pipe),
+				     DPST_IE_BIN_DATA_MASK,
+				     DPST_IE_BIN_DATA(data[i]));
+		else
+			intel_de_rmw(display, DPST_BIN(pipe),
+				     DPST_BIN_DATA_MASK,
+				     DPST_BIN_DATA(data[i]));
+
+		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n",
+			       i, data[i]);
+	}
+}
+
 static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 {
 	struct intel_display *display = to_intel_display(intel_crtc);
@@ -29,12 +60,27 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 	int index;
 	u32 dpstbin;
 
+	if (DISPLAY_VER(display) >= 20)
+		intel_de_rmw(display, DPST_HIST_INDEX(intel_crtc->pipe),
+			     DPST_HIST_BIN_INDEX_MASK,
+			     DPST_HIST_BIN_INDEX(0));
+	else
+		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
+
 	for (index = 0; index < ARRAY_SIZE(histogram->bin_data); index++) {
-		dpstbin = intel_de_read(display, DPST_BIN(intel_crtc->pipe));
+		dpstbin = intel_de_read(display, (DISPLAY_VER(display) >= 20 ?
+					DPST_HIST_BIN(intel_crtc->pipe) :
+					DPST_BIN(intel_crtc->pipe)));
 		if (!(dpstbin & DPST_BIN_BUSY)) {
-			histogram->bin_data[index] = dpstbin & DPST_BIN_DATA_MASK;
-		} else
+			histogram->bin_data[index] = dpstbin & (DISPLAY_VER(display) >= 20 ?
+								DPST_HIST_BIN_DATA_MASK :
+								DPST_BIN_DATA_MASK);
+		} else {
+			drm_err(display->drm, "Histogram bin busy, retyring\n");
+			fsleep(2);
 			return false;
+		}
 	}
 	return true;
 }
@@ -62,8 +108,6 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	 * Set DPST_CTL Bin Reg function select to TC
 	 * Set DPST_CTL Bin Register Index to 0
 	 */
-	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
 	for (retry = 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++) {
 		if (intel_histogram_get_data(intel_crtc)) {
 			u32 *data;
@@ -156,17 +200,27 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
 
 	if (histogram->enable)
 		return 0;
-
-	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
-		     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT |
-		     DPST_CTL_ENHANCEMENT_MODE_MASK | DPST_CTL_IE_MODI_TABLE_EN,
-		     ((mode == DRM_MODE_HISTOGRAM_HSV_MAX_RGB) ?
-		      DPST_CTL_BIN_REG_FUNC_TC : 0) | DPST_CTL_IE_HIST_EN |
-		     DPST_CTL_HIST_MODE_HSV |
-		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
-		     DPST_CTL_EN_MULTIPLICATIVE | DPST_CTL_IE_MODI_TABLE_EN);
+	 /* enable histogram, clear DPST_BIN reg and select TC function */
+	if (DISPLAY_VER(display) >= 20)
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE,
+			     DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE_HSV);
+	else
+		 /* enable histogram, clear DPST_CTL bin reg func select to TC */
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE |
+			     DPST_CTL_IE_TABLE_VALUE_FORMAT |
+			     DPST_CTL_ENHANCEMENT_MODE_MASK |
+			     DPST_CTL_IE_MODI_TABLE_EN,
+			     ((mode == DRM_MODE_HISTOGRAM_HSV_MAX_RGB) ?
+			      DPST_CTL_BIN_REG_FUNC_TC : 0) |
+			     DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE_HSV |
+			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
+			     DPST_CTL_EN_MULTIPLICATIVE | DPST_CTL_IE_MODI_TABLE_EN);
 
 	/* Re-Visit: check if wait for one vblank is required */
 	drm_crtc_wait_one_vblank(&intel_crtc->base);
@@ -236,7 +290,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
 	struct intel_histogram *histogram = intel_crtc->histogram;
 	struct intel_display *display = to_intel_display(intel_crtc);
 	int pipe = intel_crtc->pipe;
-	int i = 0;
 	struct drm_iet_1dlut_sample *iet;
 	u32 *data;
 	int ret;
@@ -254,15 +307,15 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
 		return -EINVAL;
 	}
 
-	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_IE);
 
-	drm_crtc_wait_one_vblank(&intel_crtc->base);
+	if (DISPLAY_VER(display) < 20) {
+		/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL,
+			     DPST_CTL_BIN_REG_FUNC_IE);
+	}
 
-	 /* Set DPST_CTL Bin Register Index to 0 */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
+	set_bin_index_0(display, pipe);
 
 	iet = (struct drm_iet_1dlut_sample *)blob->data;
 	data = kzalloc(sizeof(data) * iet->nr_elements, GFP_KERNEL);
@@ -273,11 +326,8 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
-		intel_de_rmw(display, DPST_BIN(pipe),
-			     DPST_BIN_DATA_MASK, data[i]);
-		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
-	}
+	write_iet(display, pipe, data);
+
 	kfree(data);
 	drm_property_blob_put(intel_crtc->base.state->iet_lut);
 
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
index 213c9f483567cb19a47b44953749f6baf0afe9e7..3fbb9c2deaae6278d5a832dfb61ef860de0c6f21 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -45,6 +45,31 @@
 #define _DPST_BIN_B					0x491C4
 #define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
 #define  DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define  DPST_BIN_DATA(val)				REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
 #define  DPST_BIN_BUSY					REG_BIT(31)
 
+#define _DPST_HIST_INDEX_A				0x490D8
+#define _DPST_HIST_INDEX_B				0x491D8
+#define DPST_HIST_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)
+#define  DPST_HIST_BIN_INDEX_MASK			REG_GENMASK(4, 0)
+#define  DPST_HIST_BIN_INDEX(val)			REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)
+
+#define _DPST_HIST_BIN_A				0x490C4
+#define _DPST_HIST_BIN_B				0x491C4
+#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)
+#define  DPST_HIST_BIN_BUSY				REG_BIT(31)
+#define  DPST_HIST_BIN_DATA_MASK				REG_GENMASK(30, 0)
+
+#define _DPST_IE_BIN_A					0x490CC
+#define _DPST_IE_BIN_B					0x491CC
+#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_IE_BIN_A, _DPST_IE_BIN_B)
+#define	 DPST_IE_BIN_DATA_MASK				REG_GENMASK(9, 0)
+#define  DPST_IE_BIN_DATA(val)				REG_FIELD_PREP(DPST_IE_BIN_DATA_MASK, val)
+
+#define _DPST_IE_INDEX_A				0x490DC
+#define _DPST_IE_INDEX_B				0x491DC
+#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)
+#define  DPST_IE_BIN_INDEX_MASK				REG_GENMASK(6, 0)
+#define  DPST_IE_BIN_INDEX(val)				REG_FIELD_PREP(DPST_IE_BIN_INDEX_MASK, val)
+
 #endif /* __INTEL_HISTOGRAM_REGS_H__ */

-- 
2.25.1

