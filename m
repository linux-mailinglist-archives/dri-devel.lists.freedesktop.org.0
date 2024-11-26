Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0999D9863
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1F110E8B3;
	Tue, 26 Nov 2024 13:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsUtJlfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FCD10E8A9;
 Tue, 26 Nov 2024 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627256; x=1764163256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Otansgh3d/tI/JQWVBrjKh9N4NIsr7e0pBYZQWX2jY=;
 b=VsUtJlfZOBhKVGT+maTSE2gKqObhS0adgAztNr7/Ae2w9XK0Q2YSVGJi
 lwmOHzXdWcAd85bObR2XNpd9ct04IGftpoWs6wM/hvCYPqJESfG88ytGU
 3KyuVqO4OMXKywC8fNI4I6+YvIHZ7og/jwcxi/fEWhEEav4Vg7673h8/N
 ltarsrXwLGud7luEpeFOvZzcf/3hL+qvBRWZg+i6aVepYtyoj7iketgev
 LIrkaG3A+gLnWBlkKD652VFqAnQgk6go1Urxr7gs2i1vYxOpp/m/FZotU
 0dmZYRtDlxm0a2lsPjGfYmt4FhAFHLXZQeybJyWdKFkpG9jXwB6LW/+2o A==;
X-CSE-ConnectionGUID: 4rNrX+y+RQq5IKVq8q/NQQ==
X-CSE-MsgGUID: sXi4xs3ARBeeazp++Kgd1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170422"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:55 -0800
X-CSE-ConnectionGUID: CPcrFfloSaesjpOOLx7DOA==
X-CSE-MsgGUID: DzMSIyF0SUeiDOXzt7DJrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875046"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:51 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 22/25] drm/i915/color: Program Pre-CSC registers
Date: Tue, 26 Nov 2024 18:57:27 +0530
Message-ID: <20241126132730.1192571-23-uma.shankar@intel.com>
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

Add callback for programming Pre-CSC LUT for TGL and beyond

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 736113faaec0..d942e70bcb56 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3880,9 +3880,97 @@ void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state
 		i915->display.funcs.color->load_plane_csc_matrix(plane_state, blob);
 }
 
+static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
+					    const struct drm_color_lut_32 *pre_csc_lut,
+					    u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		lut_size = 128;
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val = (pre_csc_lut[i].green & 0xffffff);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			/* ToDo: Restrict to 0x7ffffff*/
+			while (i < 131)
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i].green);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						  1 << 16);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_fw(dev_priv, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
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

