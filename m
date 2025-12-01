Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05BC95E10
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9897C10E2D8;
	Mon,  1 Dec 2025 06:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpAPQNU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1250B10E2D8;
 Mon,  1 Dec 2025 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570964; x=1796106964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3Wzy/meVOL9BBjI/oLn3MLhVW8haBKS8oEgdSFSp7c=;
 b=bpAPQNU68/xurryKMvsot1B77rQMtIHq1A9buILI9ac8rjlDbKkF0qPX
 5ERjND9iA5k1zo0i9hOaT2q7OX1cWtN6fRFK7YdWvPq/y/U+CZgFk8iE8
 EIGI3mTmOMetaNeXg0m2vuMPnh8iWz0SVrYM0e4/l8wcOtJorYbk9j5yh
 wtjoV6p7tVqV6pO5vDhWLvR3UN7lb1Bm61NyKCoxoh2NnYcvq9LGJpE4g
 NrSDMTvQWz8yRV7/WF3Zp8rZoU/fHD22ESpfn8c51ylQVbruH4KzjYZb0
 kCXRvBIYR8Ql4BvgkhCG7qVa6MVvPxs0enaPL2BYKlmWw3l4tQScK9ErT A==;
X-CSE-ConnectionGUID: 9HnnTaveQJqnl/+xmV/V/g==
X-CSE-MsgGUID: TuVY54G4RzeH7dHhJAj4aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663237"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:36:03 -0800
X-CSE-ConnectionGUID: IXSFDRd1QSSqzpfcq0esOw==
X-CSE-MsgGUID: SFMLIH47R6i2O7M5MI2Thw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806121"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:58 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Date: Mon,  1 Dec 2025 12:16:51 +0530
Message-ID: <20251201064655.3579280-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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

Add callback to program Pre-CSC LUT for TGL and beyond

v2: Add DSB support
v3: Add support for single segment 1D LUT color op
v4:
- s/drm_color_lut_32/drm_color_lut32/ (Simon)
- Change commit message (Suraj)
- Improve comments (Suraj)
- Remove multisegmented programming, to be added later
- Remove dead code for SDR planes, add when needed

BSpec: 50411, 50412, 50413, 50414
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4ca359d68730..2a114d2964fa 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3943,6 +3943,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
 			   ctm_to_twos_complement(input[11], 0, 12));
 }
 
+static void
+xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
+				const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_plane_state *state = &plane_state->uapi;
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		lut_size = 128;
+
+		intel_de_write_dsb(display, dsb,
+				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			/* TODO: Restrict to 0x7ffffff */
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   (1 << 24));
+			} while (i++ > 130);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	}
+}
+
+static void
+xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *plane_state)
+{
+	if (plane_state->hw.degamma_lut)
+		xelpd_program_plane_pre_csc_lut(dsb, plane_state);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3991,6 +4051,7 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.50.1

