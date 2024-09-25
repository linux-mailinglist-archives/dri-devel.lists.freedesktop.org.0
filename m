Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE9986300
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902E510EA4D;
	Wed, 25 Sep 2024 15:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIFK06gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DFE10EA3A;
 Wed, 25 Sep 2024 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727277494; x=1758813494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qdO9NlhdkoE5SATJ6VNVMyfAtKXUQLUOhNeTr1dqj/M=;
 b=nIFK06ggCYX/YVgLy1l4+YrPEbPEa+FEPwNyE9wzYLiRRrE1Y3FfjDxi
 Db9m6xsygabKMlwwRDwdCqmp07/9FJ46ZDYxY0cJPock3KhEL2hRSNlDW
 awsX7N+Kp7fLtyHSsTT55oeHc2T6Bs8f/unbu+y4g1xu7YPBgSks1YEak
 g7pAGP11Y2jy7EOGdH6VNxC3tywO3k1UiqKqSWTRXIczIkBsv4/NpZvGn
 eoTzF0D3e8QH6LGqF5ulGwgOabSy+I/79IfrbFSTfsvsbsDJnLT3WmrmJ
 tRglqE3fJvUWbofrC5V9c9qzfDGNhHo3fzoyWTajOi/n2lKocQROncpoh Q==;
X-CSE-ConnectionGUID: kwn1/Oa/SCqLYi5RjjICPw==
X-CSE-MsgGUID: MMNQLV0QRW21C55ceJ7odw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48866917"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48866917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:18:01 -0700
X-CSE-ConnectionGUID: v2mUiEY1RVGyc3fRkarOKQ==
X-CSE-MsgGUID: FIz3DoTqRWuq84ih3lCKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76612957"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 08:17:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv4 7/7] drm/i915/histogram: Histogram changes for Display 20+
Date: Wed, 25 Sep 2024 20:37:54 +0530
Message-Id: <20240925150754.1876893-8-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925150754.1876893-1-arun.r.murthy@intel.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_histogram.c    | 111 +++++++++++++-----
 .../drm/i915/display/intel_histogram_reg.h    |  25 ++++
 2 files changed, 105 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index f776d87dfca0..f8aeeae0c487 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -29,6 +29,51 @@ struct intel_histogram {
 	u32 bin_data[HISTOGRAM_BIN_COUNT];
 };
 
+static void set_bin_index_0(struct intel_display *display, enum pipe pipe)
+{
+	if (DISPLAY_VER(display) >= 20)
+		intel_de_rmw(display, DPST_IE_INDEX(pipe),
+			     DPST_IE_BIN_INDEX_MASK, DPST_IE_BIN_INDEX(0));
+	else
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK,
+			     DPST_CTL_BIN_REG_FUNC_IE | DPST_CTL_BIN_REG_CLEAR);
+}
+
+static void write_iet(struct intel_display *display, enum pipe pipe,
+			      u32 *data)
+{
+	int i;
+
+	if (DISPLAY_VER(display) >= 20) {
+		for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+			intel_de_rmw(display, DPST_IE_BIN(pipe),
+				     DPST_IE_BIN_DATA_MASK,
+				     DPST_IE_BIN_DATA(data[i]));
+			drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n",
+				       i, data[i]);
+		}
+	} else {
+		for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+			intel_de_rmw(display, DPST_BIN(pipe),
+				     DPST_BIN_DATA_MASK, data[i]);
+			drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n",
+				       i, data[i]);
+		}
+	}
+}
+
+static void set_histogram_index_0(struct intel_display *display, enum pipe pipe)
+{
+	if (DISPLAY_VER(display) >= 20)
+		intel_de_rmw(display, DPST_HIST_INDEX(pipe),
+			     DPST_HIST_BIN_INDEX_MASK,
+			     DPST_HIST_BIN_INDEX(0));
+	else
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
+}
+
 static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 {
 	struct intel_display *display = to_intel_display(intel_crtc);
@@ -40,9 +85,13 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 	retry_count = 0;
 
 	while (index < HISTOGRAM_BIN_COUNT) {
-		dpstbin = intel_de_read(display, DPST_BIN(intel_crtc->pipe));
+		dpstbin = intel_de_read(display, (DISPLAY_VER(display) >= 20 ?
+					DPST_HIST_BIN(intel_crtc->pipe) :
+					DPST_BIN(intel_crtc->pipe)));
 		if (!(dpstbin & DPST_BIN_BUSY)) {
-			histogram->bin_data[index] = dpstbin & DPST_BIN_DATA_MASK;
+			histogram->bin_data[index] = dpstbin & (DISPLAY_VER(display) >= 20 ?
+							        DPST_HIST_BIN_DATA_MASK :
+							        DPST_BIN_DATA_MASK);
 			index++;
 		} else {
 			/*
@@ -58,9 +107,7 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 			/* Add a delay before retrying */
 			fsleep(HISTOGRAM_BIN_READ_DELAY);
 			index = 0;
-			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
-				     DPST_CTL_BIN_REG_FUNC_SEL |
-				     DPST_CTL_BIN_REG_MASK, 0);
+			set_histogram_index_0(display, intel_crtc->pipe);
 		}
 	}
 	return true;
@@ -84,8 +131,8 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	 * Set DPST_CTL Bin Reg function select to TC
 	 * Set DPST_CTL Bin Register Index to 0
 	 */
-	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
+	set_histogram_index_0(display, intel_crtc->pipe);
+
 	if (intel_histogram_get_data(intel_crtc)) {
 		drm_property_replace_global_blob(display->drm,
 				&intel_crtc->config->histogram.histogram,
@@ -158,13 +205,20 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
 	if (histogram->enable)
 		return 0;
 
-	 /* enable histogram, clear DPST_BIN reg and select TC function */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
-		     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT,
-		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
-		     DPST_CTL_HIST_MODE_HSV |
-		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
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
+			     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT,
+			     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
+			     DPST_CTL_HIST_MODE_HSV |
+			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
 
 	/* Re-Visit: check if wait for one vblank is required */
 	drm_crtc_wait_one_vblank(&intel_crtc->base);
@@ -228,7 +282,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data)
 	struct intel_histogram *histogram = intel_crtc->histogram;
 	struct intel_display *display = to_intel_display(intel_crtc);
 	int pipe = intel_crtc->pipe;
-	int i = 0;
 
 	if (!histogram)
 		return -EINVAL;
@@ -253,24 +306,20 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data)
 	 * Set DPST_CTL Bin Reg function select to IE
 	 * Set DPST_CTL Bin Register Index to 0
 	 */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK,
-		     DPST_CTL_BIN_REG_FUNC_IE | DPST_CTL_BIN_REG_CLEAR);
-
-	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
-		intel_de_rmw(display, DPST_BIN(pipe),
-			     DPST_BIN_DATA_MASK, data[i]);
-		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
+	set_bin_index_0(display, pipe);
+	write_iet(display, pipe, data);
+	if (DISPLAY_VER(display) < 20) {
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_ENHANCEMENT_MODE_MASK |
+			     DPST_CTL_IE_MODI_TABLE_EN,
+			     DPST_CTL_EN_MULTIPLICATIVE |
+			     DPST_CTL_IE_MODI_TABLE_EN);
+		/* Once IE is applied, change DPST CTL to TC */
+		intel_de_rmw(display, DPST_CTL(pipe),
+			     DPST_CTL_BIN_REG_FUNC_SEL,
+			     DPST_CTL_BIN_REG_FUNC_TC);
 	}
 
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_ENHANCEMENT_MODE_MASK | DPST_CTL_IE_MODI_TABLE_EN,
-		     DPST_CTL_EN_MULTIPLICATIVE | DPST_CTL_IE_MODI_TABLE_EN);
-
-	/* Once IE is applied, change DPST CTL to TC */
-	intel_de_rmw(display, DPST_CTL(pipe),
-		     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_TC);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_reg.h b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
index ac392ed47463..003fdb517c7b 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
@@ -44,8 +44,33 @@
 #define _DPST_BIN_B					0x491C4
 #define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
 #define DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define DPST_BIN_DATA					REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
 #define DPST_BIN_BUSY					REG_BIT(31)
 
+#define _DPST_HIST_INDEX_A				0x490D8
+#define _DPST_HIST_INDEX_B				0x491D8
+#define DPST_HIST_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)
+#define DPST_HIST_BIN_INDEX_MASK			REG_GENMASK(4, 0)
+#define DPST_HIST_BIN_INDEX(val)			REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)
+
+#define _DPST_HIST_BIN_A				0x490C4
+#define _DPST_HIST_BIN_B				0x491C4
+#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)
+#define DPST_HIST_BIN_BUSY				REG_BIT(31)
+#define DPST_HIST_BIN_DATA_MASK				REG_GENMASK(30, 0)
+
+#define _DPST_IE_BIN_A					0x490CC
+#define _DPST_IE_BIN_B					0x491CC
+#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe, _DPST_IE_BIN_A, _DPST_IE_BIN_B)
+#define	DPST_IE_BIN_DATA_MASK				REG_GENMASK(9, 0)
+#define DPST_IE_BIN_DATA(val)				REG_FIELD_PREP(DPST_IE_BIN_DATA_MASK, val)
+
+#define _DPST_IE_INDEX_A				0x490DC
+#define _DPST_IE_INDEX_B				0x491DC
+#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe, _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)
+#define DPST_IE_BIN_INDEX_MASK				REG_GENMASK(6, 0)
+#define DPST_IE_BIN_INDEX(val)				REG_FIELD_PREP(DPST_IE_BIN_INDEX_MASK, val)
+
 #define INTEL_HISTOGRAM_PIPEA			0x90000000
 #define INTEL_HISTOGRAM_PIPEB			0x90000002
 #define INTEL_HISTOGRAM_EVENT(pipe)		PIPE(pipe, \
-- 
2.25.1

