Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993869E9BD4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C8410E4DB;
	Mon,  9 Dec 2024 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEm9tzoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3B10E500;
 Mon,  9 Dec 2024 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762106; x=1765298106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9H+YgjLDAJoWg0BOEzUyApDyf3O9kLJzQ/jdZt+fvFE=;
 b=jEm9tzoSRFyzBoSok0Yab5cFvJsGGGA3/f5cq4btPyOu4/u20+W2r00O
 1ijZoFX1J7aAyvA2fcCWZveeAa/+Z7YuUe8iibGYsiFaXmXGra5XVBJUK
 MbRMrRxtFJVl1XJT4GhHT6kMZI/RitPzTpwK8H2nZ1l2fyDj7RXT+WTgD
 ySdJKRh5NFXzGc29Qer6rEsmqemeKQm4efz9tJBf9U2U8pXWxfpDRa3Dy
 THCfM4BrNxgy9o1L4zMed2YvPeo6ljDeHuQizwatQ70JKvZa2ukOixW5A
 2VBAQvnM4aNzfHxF2nvPWajYMOmqtN8pQ94bJ9YGTExQfD7LyUsGdwWj3 Q==;
X-CSE-ConnectionGUID: iCUmbFkLTs+wMiyE8pk7ow==
X-CSE-MsgGUID: FxTMYcSLR1CLdhBvHbYZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551684"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:35:06 -0800
X-CSE-ConnectionGUID: FxXlXoAkSCyqiVh3L0+5fw==
X-CSE-MsgGUID: 2lIvp0ToT4aW7Zryjyyv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371765"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:35:04 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/10] drm/i915/histogram: Histogram changes for Display 20+
Date: Mon,  9 Dec 2024 21:55:03 +0530
Message-Id: <20241209162504.2146697-10-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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
 .../gpu/drm/i915/display/intel_histogram.c    | 105 +++++++++++++-----
 .../drm/i915/display/intel_histogram_regs.h   |  25 +++++
 2 files changed, 103 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 39d96c86bb89..d503d0f0a5ee 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -29,6 +29,37 @@ struct intel_histogram {
 	u32 bin_data[HISTOGRAM_BIN_COUNT];
 };
 
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
@@ -36,12 +67,27 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
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
@@ -69,8 +115,6 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	 * Set DPST_CTL Bin Reg function select to TC
 	 * Set DPST_CTL Bin Register Index to 0
 	 */
-	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
 	for (retry = 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++) {
 		if (intel_histogram_get_data(intel_crtc)) {
 			u32 *data;
@@ -163,15 +207,26 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
 	if (histogram->enable)
 		return 0;
 
-	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
-		     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT |
-		     DPST_CTL_ENHANCEMENT_MODE_MASK | DPST_CTL_IE_MODI_TABLE_EN,
-		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
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
+		 /* enable histogram, clear DPST_BIN reg and select TC function */
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE |
+			     DPST_CTL_IE_TABLE_VALUE_FORMAT |
+			     DPST_CTL_ENHANCEMENT_MODE_MASK |
+			     DPST_CTL_IE_MODI_TABLE_EN,
+			     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE_HSV |
+			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
+			     DPST_CTL_EN_MULTIPLICATIVE |
+			     DPST_CTL_IE_MODI_TABLE_EN);
 
 	/* Re-Visit: check if wait for one vblank is required */
 	drm_crtc_wait_one_vblank(&intel_crtc->base);
@@ -240,7 +295,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
 	struct intel_histogram *histogram = intel_crtc->histogram;
 	struct intel_display *display = to_intel_display(intel_crtc);
 	int pipe = intel_crtc->pipe;
-	int i = 0;
 	struct drm_iet *iet;
 	u32 *data;
 	int ret;
@@ -258,15 +312,15 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
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
 
 	iet = (struct drm_iet *)blob->data;
 	data = kzalloc(sizeof(data) * iet->nr_elements, GFP_KERNEL);
@@ -277,11 +331,8 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
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
 	drm_property_blob_put(intel_crtc->base.state->histogram_iet);
 
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
index 213c9f483567..3fbb9c2deaae 100644
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

