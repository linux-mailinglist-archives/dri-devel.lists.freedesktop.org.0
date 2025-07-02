Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756CCAF0F2B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACF310E69E;
	Wed,  2 Jul 2025 09:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGTJRj0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E1C10E69E;
 Wed,  2 Jul 2025 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447339; x=1782983339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRrpkgIV3EoRMYF2MqP7ddQps+qoFY6w6ePomxQOJrY=;
 b=eGTJRj0bq6OGJ6eDRk6OeIPPI1phja0YXM6QZFQqbrUbgZv32Zj6btA5
 tDtV4j67NV+Ymn8yEAg5WFFf/bD4+RU4unysW2a4/yDclGNSxQ8I2k5CN
 M+/LS9Qh6x0wwYyvPjI/AgPSkpOMxuA3n/FFZXLvX/sD3ZQm/f9Gr7G+S
 bBGuy4cvIMcwszZRwL7hSB+J3IZ4cy5ZCbBdsTQK6mjgPIpkYOaeJce0z
 Qi96p3WIkhumRJYJlLwbF15o8WJ2/hgdzKpUylTp2Ipq26VKDqD1KE0Sm
 jjUiLtYyol3/obB0KLbUoxoaMl3eFSHnqeDGvRiF5Zwf3TguczPxGnKo+ A==;
X-CSE-ConnectionGUID: 8RDI2imXTM6KONymWr1FIw==
X-CSE-MsgGUID: xIU8XsaJTkqo+UhI3q3f8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427240"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427240"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:58 -0700
X-CSE-ConnectionGUID: GGbf8jgYTLmy246lRFC+0A==
X-CSE-MsgGUID: /3O8LkNaTpWvuIIPMlItAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536766"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:54 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 21/24] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Wed,  2 Jul 2025 14:49:33 +0530
Message-ID: <20250702091936.3004854-22-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Extract the LUT and program plane post csc registers.

v2: Add DSB support
v3: Add support for single segment 1D LUT

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 75981fe232bf..689bc4f4ce25 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4041,11 +4041,134 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	}
 }
 
+static void
+xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
+				 const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_plane_state *state = &plane_state->uapi;
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	const struct drm_color_lut_32 *post_csc_lut = plane_state->hw.gamma_lut->data;
+	u32 i, lut_size, j;
+	bool is_single_seg = drm_color_lut_32_size(plane_state->hw.gamma_lut) == 32 ?
+			     true : false;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+		/* TODO: Add macro */
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (post_csc_lut) {
+			/* Segment 0 */
+			for (i = 0, j = 0; i < 9; i++, j++) {
+				if (is_single_seg)
+					break;
+
+				u32 lut_val = (post_csc_lut[j].green & 0xffffff);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe,
+										     plane, 0),
+						   lut_val);
+			}
+
+			/* Segment 1 */
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val;
+
+				if (i == 0 && !is_single_seg)
+					lut_val = post_csc_lut[0].green & 0xffffff;
+				else if (i == 1 && !is_single_seg)
+					lut_val = (post_csc_lut[8].green & 0xffffff);
+				else
+					lut_val = is_single_seg ?
+						  drm_color_lut_32_extract(post_csc_lut[j++].green,
+									   24)
+						  : (post_csc_lut[j++].green & 0xffffff);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   lut_val);
+			}
+
+			/* Segment 2 */
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   is_single_seg ? (1 << 24) :
+						   post_csc_lut[j].green);
+			} while (++j < (is_single_seg ? 34 : 42));
+		} else {
+			/*TODO: Add for segment 0 */
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   1 << 24);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+		intel_de_write_dsb(display, dsb,
+				   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (post_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						   post_csc_lut[i].green & 0xffff);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						   post_csc_lut[i++].green & 0x3ffff);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						   (1 << 16));
+			} while (i++ < 34);
+		}
+
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
 static void
 xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *plane_state)
 {
 	if (plane_state->hw.degamma_lut)
 		xelpd_program_plane_pre_csc_lut(dsb, plane_state);
+
+	if (plane_state->hw.gamma_lut)
+		xelpd_program_plane_post_csc_lut(dsb, plane_state);
 }
 
 static const struct intel_color_funcs chv_color_funcs = {
-- 
2.42.0

