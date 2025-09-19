Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7679B8A04C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C0010EA2D;
	Fri, 19 Sep 2025 14:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iy94wILQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E1310EA28;
 Fri, 19 Sep 2025 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758292753; x=1789828753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K6aMHo1MVUsDhbRei30la/ZlbCraX63CFeVF2FLu2gg=;
 b=iy94wILQMvtwxx2Qi09D3Cdm4grOk8zFYpzhfApiuynPJ+wo9GALh3uL
 SIk0kLvQNYoGyy1gjSBXfhjBozb5A3TjDlYO1KWgFDTn7ZInuiKBvVLO3
 eT0jAcTd9YaM+b4OqKLiTaCw7gB2gGf6bJSkL0vTF0bWZcD8ma1hQ25lY
 OMWoZuOgph7XJrP8wi4L44c4gvW5vEy8bZIk6fxGA1bP2hQP4IUF9tLRo
 5GlNhJqLTnmx32p82qxQGfaM6y+WqNDFhNl1IR3qh7oBmscXh8rA50ZoB
 qedREiQ9fmLh6GWT5G9KThsl4E9Av7+Ndytdike4FMkMQiWOOzIban7ol A==;
X-CSE-ConnectionGUID: js/OkbXpTVmjFQ1hir8MHg==
X-CSE-MsgGUID: 53lemTbnTIuijbuPTwugPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59858266"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59858266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 07:39:13 -0700
X-CSE-ConnectionGUID: 2eYiE52kQmmEq09oODg1rA==
X-CSE-MsgGUID: j3fyibcNQAOmGDsDamcpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="199553159"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2025 07:39:12 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 04/10] drm/i915/display: Add filter lut values
Date: Fri, 19 Sep 2025 20:04:12 +0530
Message-Id: <20250919143418.3102605-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250919143418.3102605-1-nemesa.garg@intel.com>
References: <20250919143418.3102605-1-nemesa.garg@intel.com>
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

Add the register bits related to filter lut values.
These values are golden values and these value has
to be loaded one time while enabling the casf.

v2: update commit message[Ankit]
v3: Make filter_load fn name same[Jani]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 40 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  3 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    | 11 +++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 6a877c7c76fa..18a8a621016a 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -30,6 +30,46 @@
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
+void intel_casf_filter_lut_load(struct intel_crtc *crtc,
+				const struct intel_crtc_state *crtc_state)
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
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 83523fe66c48..3edbc3ad51cf 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -9,9 +9,12 @@
 #include <linux/types.h>
 
 struct intel_crtc_state;
+struct intel_crtc;
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
 void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
 void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
+void intel_casf_filter_lut_load(struct intel_crtc *crtc,
+				const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index c24ba281ae37..b96950a48335 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -19,4 +19,15 @@
 #define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
 #define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
 
+#define _SHRPLUT_DATA_A                        0x682B8
+#define _SHRPLUT_DATA_B                        0x68AB8
+#define SHRPLUT_DATA(pipe)             _MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
+
+#define _SHRPLUT_INDEX_A               0x682B4
+#define _SHRPLUT_INDEX_B               0x68AB4
+#define SHRPLUT_INDEX(pipe)            _MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
+#define   INDEX_AUTO_INCR              REG_BIT(10)
+#define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
+#define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
+
 #endif /* __INTEL_CASF_REGS__ */
-- 
2.25.1

