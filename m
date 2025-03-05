Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63FA50004
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A9110E7AB;
	Wed,  5 Mar 2025 13:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6qaraGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393410E7E2;
 Wed,  5 Mar 2025 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180532; x=1772716532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y4CgkMBsK68I+i8HZJorHcfE38UzIAJ1fZEfabABVrY=;
 b=W6qaraGu+UAQYIujrofJ0Zweh0LH8aSe8ZgRznE9fVlVWjXl6hdwrVg3
 pFz7PjzjxIwegCQBCYcsCC5vsonoKH+rkM8fT5syoNJ3C1kE7aQaDz7l9
 bMbQj/v3NCSrcnN+ZWlxD4SFLibnu1KT+48ZsC9AtyhGGM4xe3NfJnQOm
 4tbyEIETmAuXq5tuxbMbN+ZAKmptUGHk3qeMG4FT3xJENgTjTM/alF/+2
 6jP1s8+i9hB9WggeX6Z7YNkgyv/qADhTDmzk8/HEjgEFdToGSQVArn3K6
 bn7/oHk/W4GT17Fe5sWWi0ZcEoY2LGw3VHhnylB7NA/WHbjhjKPzg/ecl w==;
X-CSE-ConnectionGUID: Q9cK+qh9TY2ZVJissURCDQ==
X-CSE-MsgGUID: g5G9HCOOR3u9XcdcHiwluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685630"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:32 -0800
X-CSE-ConnectionGUID: L41e+He9QLK8Df+T/7dgPw==
X-CSE-MsgGUID: 0YF0NkwERhq0vCISixowqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701249"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:28 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 20/23] drm/i915/color: Program Pre-CSC registers
Date: Wed,  5 Mar 2025 18:56:05 +0530
Message-ID: <20250305132608.2379253-21-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Add callback for programming Pre-CSC LUT for TGL and beyond

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index b650a4d76be4..9bec9159bb78 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3907,9 +3907,97 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
 		i915->display.funcs.color->load_plane_csc_matrix(plane_state, blob);
 }
 
+static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
+					    const struct drm_color_lut_32 *pre_csc_lut,
+					    u32 offset)
+{
+	struct intel_display *display = to_intel_display(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		lut_size = 128;
+
+		intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val = (pre_csc_lut[i].green & 0xffffff);
+
+				intel_de_write_fw(display,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			/* ToDo: Restrict to 0x7ffffff*/
+			while (i < 131)
+				intel_de_write_fw(display,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(display,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(display,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i].green);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(display,
+						  PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  1 << 16);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(display, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
 static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 				  const struct drm_property_blob *blob, bool is_pre_csc)
 {
+	struct drm_color_lut_32 *lut = blob->data;
+
+	if (is_pre_csc)
+		xelpd_program_plane_pre_csc_lut(plane_state, lut, 0);
 }
 
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
-- 
2.42.0

