Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6AA9D2433
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C610E627;
	Tue, 19 Nov 2024 10:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzS64sTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80410E61C;
 Tue, 19 Nov 2024 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013711; x=1763549711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+bHsXzTdgd/jVnU3KPl6C2Qxn3Ie2xvXkDvywBhB7iM=;
 b=IzS64sTCGroYnyGVoEJQxHSCbW+L9rPr2psfz313MOB9VEOEZPMxMGI8
 r1/51QOxnDfLB3Jp+18G4/660x7W3MVlwJyA2J6MTXHp6Dm64A3wDhLyf
 PiLXapimSj7LoCmiuYFWfIEjB3x6kHofMVpYvaYwagpVri8uodGo2C/ZS
 7fgCuyYv1Zr/26TBAsrEnfSIbvVnlJ1g4Ad6wEGEudMAI3EY4nwJ8/q0N
 WLhlSFuazxffzIBAutBfk6mbwz2sb6Z/dqpT7Q3XARG+nnt/0TN57g3nH
 eiWEok8Q5GhE/FLGGMy2w1+Uhvs3PwH5GljCJczfY6NkdCodTRXpZfudi A==;
X-CSE-ConnectionGUID: CeF358A3TT2lprp8JBdhgQ==
X-CSE-MsgGUID: 0RhODcMoQkyupmaO96W6dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43075370"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43075370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:55:11 -0800
X-CSE-ConnectionGUID: lVCvbG65QeODudbmGdCsZA==
X-CSE-MsgGUID: pd6pb7DwRhyGyRZYqV7KLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89937457"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 02:55:10 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display 20+
Date: Tue, 19 Nov 2024 16:15:20 +0530
Message-Id: <20241119104521.575377-8-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
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
 .../drm/i915/display/intel_histogram_regs.h   |  25 ++++
 2 files changed, 105 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index fdcc64677e96..beaad9256e01 100644
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
@@ -236,7 +290,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data)
 	struct intel_histogram *histogram = intel_crtc->histogram;
 	struct intel_display *display = to_intel_display(intel_crtc);
 	int pipe = intel_crtc->pipe;
-	int i = 0;
 
 	if (!histogram)
 		return -EINVAL;
@@ -261,24 +314,20 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data)
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
 
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
index e50b1448bd40..2a52ac9282c1 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -44,6 +44,31 @@
 #define _DPST_BIN_B					0x491C4
 #define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
 #define  DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define  DPST_BIN_DATA					REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
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

