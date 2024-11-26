Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C279D9865
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59110E8B8;
	Tue, 26 Nov 2024 13:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GglRKRss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DEF10E8B6;
 Tue, 26 Nov 2024 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627259; x=1764163259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qaf5NHN0TVf0cdRIRmRUPOQb9RqSsBnISy+PYW5FZ5Y=;
 b=GglRKRsskgfIe+WD0lte4aLRu3G6rnwS1x4oq2F1IcW8BWfj+IarEEsv
 4dJt5LN2QUNlHinwgba3nLR+MkWo21haXd1ev67b/jZRb8C9jOClzIYgn
 vvGjQtYnhnxxHH7QCQm0nWKdvFhNQLBHtv5fT3QTsz4/R3kUVarBm3WWa
 zJkPXhhR2Z0F7akX7TdvZ/gNLnXFZ4LYNBOHISQ8YfmDw3qs+Kz+8s8LZ
 phqQjLz6kq9FZLqQexZf2fKpIs4+ZOARB6TwfaHp8k0yYV6OhCJIMEgAS
 5AdXoHOkne4PoPicvDM2/hvcKgHt+Wo3szc/T7z0v4Arx3kdbg4nxgX0t g==;
X-CSE-ConnectionGUID: fQYaeIF5StaW7ewxaLKhGA==
X-CSE-MsgGUID: lTO91CpLQd6RPj1OSWYzcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170430"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:59 -0800
X-CSE-ConnectionGUID: snGujb8jT/iZx39zrqY9xg==
X-CSE-MsgGUID: xTYIY/RATb6i34C3l1J9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875060"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:55 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 23/25] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Tue, 26 Nov 2024 18:57:28 +0530
Message-ID: <20241126132730.1192571-24-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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
index d942e70bcb56..f3333d0c8b49 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3964,6 +3964,113 @@ static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
 	}
 }
 
+static void xelpd_program_plane_post_csc_lut(const struct drm_plane_state *state,
+					     const struct drm_color_lut_32 *post_csc_lut,
+					     u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size, j;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+		/* TODO: Add macro */
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
+				  PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (post_csc_lut) {
+			/* Segment 0 */
+			for (i = 0, j = 0; i < 9; i++, j++) {
+				u32 lut_val = (post_csc_lut[j].green & 0xffffff);
+
+				intel_de_write_fw(dev_priv,
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
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Segment 2 */
+			do {
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  post_csc_lut[j++].green);
+			} while (j < 42);
+		} else {
+			/*TODO: Add for segment 0 */
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  1 << 24);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (post_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  post_csc_lut[i].green & 0xffff);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  post_csc_lut[i++].green & 0x3ffff);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+						  (1 << 16));
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
 static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 				  const struct drm_property_blob *blob, bool is_pre_csc)
 {
@@ -3971,6 +4078,8 @@ static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 
 	if (is_pre_csc)
 		xelpd_program_plane_pre_csc_lut(plane_state, lut, 0);
+	else
+		xelpd_program_plane_post_csc_lut(plane_state, lut, 0);
 }
 
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
-- 
2.42.0

