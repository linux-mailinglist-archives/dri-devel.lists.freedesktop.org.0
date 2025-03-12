Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF4A5D715
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4056510E71C;
	Wed, 12 Mar 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEurgmFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3AE10E6FD;
 Wed, 12 Mar 2025 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763617; x=1773299617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxhsbquncfTmgkIUeYm4hCBcaNdIqR6zxd2LNgU56eI=;
 b=GEurgmFgL+7xzd+uBoQujNo06oYQoKIB9nMtwMvYWnUXgjcIW001BOR1
 1t5Ge/kzjVBWEKOTu1bcduZA2i651OD/Yr7y8dBbsx31Jint2dv6Nnsd0
 J53HkO1FWIS9wb9X84InvccBds43YRtfCpYXjF43E73m+mX+KFI7z7W0c
 xdp1DGreX6K56Xnf59i/SUS6oiwTmFvtEAy/hmMglA5KNhVGSkaWBaRJ4
 F8wwZi8bkkKbjRoJAdXIG4W7I1TuZXzP7Xpnt6nW/quYS4//aO+eB/JUE
 CU8bDGkpiQ9H84jFDeeZWjEI/q0ff7X4DzLWEI1MO8MvdWRpXx+635qTp Q==;
X-CSE-ConnectionGUID: xD8ZaYLlT4iAcet0EBPCQA==
X-CSE-MsgGUID: IS7Knd2DSfaDvMTMJXjZXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288937"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288937"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:37 -0700
X-CSE-ConnectionGUID: hGTuY4eeTGWMJBEiVoAcOA==
X-CSE-MsgGUID: BNTiW1tSQWqbZqYXopdkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120368396"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:33 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 21/23] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Wed, 12 Mar 2025 12:54:23 +0530
Message-ID: <20250312072425.3099205-22-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

Extract the LUT and program plane post csc registers.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 9bec9159bb78..c1c3dfb81bbc 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3991,6 +3991,113 @@ static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
 	}
 }
 
+static void xelpd_program_plane_post_csc_lut(const struct drm_plane_state *state,
+					     const struct drm_color_lut_32 *post_csc_lut,
+					     u32 offset)
+{
+	struct intel_display *display = to_intel_display(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size, j;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+		/* TODO: Add macro */
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
+				  PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (post_csc_lut) {
+			/* Segment 0 */
+			for (i = 0, j = 0; i < 9; i++, j++) {
+				u32 lut_val = (post_csc_lut[j].green & 0xffffff);
+
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Segment 1 */
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val;
+
+				if (i == 0)
+					lut_val = post_csc_lut[0].green & 0xffffff;
+				else if (i == 1)
+					lut_val = (post_csc_lut[8].green & 0xffffff);
+				else
+					lut_val = (post_csc_lut[j++].green & 0xffffff);
+
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Segment 2 */
+			do {
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  post_csc_lut[j++].green);
+			} while (j < 42);
+		} else {
+			/*TODO: Add for segment 0 */
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  1 << 24);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (post_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  post_csc_lut[i].green & 0xffff);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  post_csc_lut[i++].green & 0x3ffff);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(display,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  (1 << 16));
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(display, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
 static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 				  const struct drm_property_blob *blob, bool is_pre_csc)
 {
@@ -3998,6 +4105,8 @@ static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 
 	if (is_pre_csc)
 		xelpd_program_plane_pre_csc_lut(plane_state, lut, 0);
+	else
+		xelpd_program_plane_post_csc_lut(plane_state, lut, 0);
 }
 
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
-- 
2.42.0

