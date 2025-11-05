Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0902C359D5
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80810E73A;
	Wed,  5 Nov 2025 12:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdIUB/t+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BBD10E73A;
 Wed,  5 Nov 2025 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345397; x=1793881397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zrtURSKA0bmakO9wTiwagdx8KY0KJ0UNKK1wzUju/q8=;
 b=fdIUB/t+hFxGR6XhApErWBKUwb8L6ElCa8goPl3bSSQWAxlmi0shTuic
 MFjaY0INznpQi9BEDSm88exlWoebJF6Sa8AhHowL+HlHepXzEdcYsIyRx
 SWvuaprdzTy61TnoUBB9HLqHxUJ1/qP7FG/CsBcmkPiJyYeJY3uueFDYW
 s05CYQTWcRrMJ4QSxNuKxNJMwafzw3hgqRP7SD88N30TR1LAh5/jagn4g
 1eFXfMIBbfctHaYJOvN3QaObbhsWnAO733lJxYJH95/Aj/TRC/8p9QJSz
 +JZCPtYi+bS6VzpVt0LUvkH3TR2wlymGBJuCDZQoRQYBDMAa9Ivlb0Cb9 Q==;
X-CSE-ConnectionGUID: H405/z8NSc6qZVK/9o0R/g==
X-CSE-MsgGUID: U347lVdUTLiZKR9uByuofQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64364087"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64364087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:17 -0800
X-CSE-ConnectionGUID: Wdq/o9AITs624Ohai82YLg==
X-CSE-MsgGUID: VGklmN8wQgWJnLVnwG7piA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740341"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:12 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 12/16] drm/i915/color: Program Pre-CSC registers
Date: Wed,  5 Nov 2025 18:04:08 +0530
Message-ID: <20251105123413.2671075-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 83b0cb519e44..ac15a8b2c6b3 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3942,6 +3942,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
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
@@ -3990,6 +4050,7 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.50.1

