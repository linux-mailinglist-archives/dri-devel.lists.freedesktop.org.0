Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7BBAF426
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9C10E67A;
	Wed,  1 Oct 2025 06:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jq3c04w/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8103210E67D;
 Wed,  1 Oct 2025 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300774; x=1790836774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4N/wOZ/69mHMtgczSxCLL8dO8Zpi6DMmxL4AOn4YMPM=;
 b=Jq3c04w/zZW8bBdHHuqhCvfKTAE/mA/2hHgpcVhGafF80Rh8ymAOIXip
 tVD8jILf4cJsbudXeLB9GjccjhEk3sZ6keB5/m0KAadW2wsv8TgOBi4G7
 mz84jK8V5tA5gnMV0I1DcjWIF6EEdfyfB6D7TAZsHUyIY4A7+L7raLMmU
 +zH8tRyMI0mKDgcI45wqh3V2ljnoKpGIMdDUgu6mzgM7QAcDeswkzvGZd
 dV6sc/esnGhAc3ZBamcE4M4M70jYd7dhxBpJ3PZdf3CpBjdyR/C17yd5G
 xbWc19GhKZBfhEhVZDxCX6lu9k3yu+Lt3g4kvPJrj1H/DiMiSVU0GVt9N Q==;
X-CSE-ConnectionGUID: zIMxBmCiSfCldtsdN/xTrw==
X-CSE-MsgGUID: FR1FIANaTIuMCV8HSU4t1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65422493"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65422493"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:39:34 -0700
X-CSE-ConnectionGUID: IYHxBhQ1S3CYsKIzYqwa/A==
X-CSE-MsgGUID: UBin9iDXSOmVHLtQ+G5Mtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177841914"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 30 Sep 2025 23:39:33 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 04/10] drm/i915/display: Add filter lut values
Date: Wed,  1 Oct 2025 12:04:54 +0530
Message-Id: <20251001063500.1259687-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251001063500.1259687-1-nemesa.garg@intel.com>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
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

Add the register bits related to filter lut values
and helper to load the casf filter lut.

These values are golden values and these value has
to be loaded one time while enabling the casf.

v2: update commit message[Ankit]
v3: Add intel_casf prefix to filter_load fn[Jani]
v4: Define the filter macros here

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 49 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  1 +
 .../gpu/drm/i915/display/intel_casf_regs.h    | 11 +++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index ad2faed5c1b3..313ed6b10317 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -16,6 +16,13 @@
 #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
 
+#define FILTER_COEFF_0_125 125
+#define FILTER_COEFF_0_25 250
+#define FILTER_COEFF_0_5 500
+#define FILTER_COEFF_1_0 1000
+#define FILTER_COEFF_0_0 0
+#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
+
 /**
  * DOC: Content Adaptive Sharpness Filter (CASF)
  *
@@ -31,6 +38,46 @@
  * original image.
  */
 
+/* Default LUT values to be loaded one time. */
+static const u16 sharpness_lut[] = {
+	4095, 2047, 1364, 1022, 816, 678, 579,
+	504, 444, 397, 357, 323, 293, 268, 244, 224,
+	204, 187, 170, 154, 139, 125, 111, 98, 85,
+	73, 60, 48, 36, 24, 12, 0
+};
+
+const u16 filtercoeff_1[] = {
+	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
+	FILTER_COEFF_0_0,
+};
+
+const u16 filtercoeff_2[] = {
+	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
+	FILTER_COEFF_0_0,
+};
+
+const u16 filtercoeff_3[] = {
+	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
+	FILTER_COEFF_0_125,
+};
+
+static void intel_casf_filter_lut_load(struct intel_crtc *crtc,
+				       const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	int i;
+
+	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
+		       INDEX_AUTO_INCR | INDEX_VALUE(0));
+
+	for (i = 0; i < ARRAY_SIZE(sharpness_lut); i++)
+		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
+			       sharpness_lut[i]);
+}
+
 void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -115,6 +162,8 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 sharpness_ctl;
 
+	intel_casf_filter_lut_load(crtc, crtc_state);
+
 	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
 
 	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 753871880279..e8432b4bc52b 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct intel_crtc_state;
+struct intel_crtc;
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
 void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index bd763efe5c1b..87803cca510f 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -19,4 +19,15 @@
 #define   SHARPNESS_FILTER_SIZE_5X5	REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
 #define   SHARPNESS_FILTER_SIZE_7X7	REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
 
+#define _SHRPLUT_DATA_A			0x682B8
+#define _SHRPLUT_DATA_B			0x68AB8
+#define SHRPLUT_DATA(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
+
+#define _SHRPLUT_INDEX_A		0x682B4
+#define _SHRPLUT_INDEX_B		0x68AB4
+#define SHRPLUT_INDEX(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
+#define   INDEX_AUTO_INCR		REG_BIT(10)
+#define   INDEX_VALUE_MASK		REG_GENMASK(4, 0)
+#define   INDEX_VALUE(x)		REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
+
 #endif /* __INTEL_CASF_REGS__ */
-- 
2.25.1

