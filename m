Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4ABC359DA
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C149010E740;
	Wed,  5 Nov 2025 12:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFZcJihO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7DE10E740;
 Wed,  5 Nov 2025 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345401; x=1793881401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Op6LAx6mjIfQhwKizsxZw0Hhlm0VfKw0MK870ZvOAvQ=;
 b=LFZcJihOJxMMSHgZuZctalV/KuxA6GFbuX/JgKLsDoz0xXUIJMTD1eMQ
 x3QnXj/HZ2SIbp0VEVmdc6xX12DLUJ8RO1suFo+IAOK7A6G7XReG2nXp3
 9eS7M8i7Y2NEl3IiHGdWJ4aeUZ7cpddMTlxeawlxGVL0QOsudeRC7PKsR
 +CxNabOvSGfNtoQotOQssyivtPri8Nhol/3GNPrshuUoQDOvUSkHnpqJR
 qAf59gidoedzTSSB/mZ5giptNXaTI76gOBnUs2GRg/PNTZuiadYmjqGM7
 ccY4vk9avqMOno5jKGKokXqpgCsCM45E63+2X7fbBi81JqyO5AAuM/AkM A==;
X-CSE-ConnectionGUID: qaROR4h3TSSO9SZbeAHPEQ==
X-CSE-MsgGUID: +hw4H1NiR/KxJ9R3mN1fXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64384370"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64384370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:21 -0800
X-CSE-ConnectionGUID: N6/dOuIuTA20dFWQGuZQBw==
X-CSE-MsgGUID: uGUeQ/3aSb6912wXGqgtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740359"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:17 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 13/16] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Wed,  5 Nov 2025 18:04:09 +0530
Message-ID: <20251105123413.2671075-14-uma.shankar@intel.com>
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

Extract the LUT and program plane post csc registers.

v2: Add DSB support
v3: Add support for single segment 1D LUT
v4:
- s/drm_color_lut_32/drm_color_lut32 (Simon)
- Move declaration to beginning of the function (Suraj)
- Remove multisegmented code, add it later
- Remove dead code for SDR planes, add it later

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ac15a8b2c6b3..f290432f3c31 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3995,11 +3995,70 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
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
+	const struct drm_color_lut32 *post_csc_lut = plane_state->hw.gamma_lut->data;
+	u32 i, j, lut_size, lut_val;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+		/* TODO: Add macro */
+		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (post_csc_lut) {
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				lut_val = drm_color_lut32_extract(post_csc_lut[j++].green, 24);
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
+						   (1 << 24));
+			} while (++j < 34);
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
2.50.1

