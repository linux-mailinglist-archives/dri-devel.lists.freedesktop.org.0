Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB41A78C939
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F2010E438;
	Tue, 29 Aug 2023 16:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271D10E414;
 Tue, 29 Aug 2023 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324797; x=1724860797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZ9YcLOC9X5oGxrhVOgeVRvJkh7ORpyVmvEZgbyqUTg=;
 b=XB69BLyIRvyq5zqTJJ2ksVtSPIV1T8Nkcp44YrqFCu3KESCEBbUZLM/R
 +tJYWVJ9zKaAMY9nEOIFmC/MJJ76EFJHapSOZXIPuNm11+rv6U08O+VHc
 +7bTVZMtx2R9JfkRZpedtw9U/as5LeiX7Rcd8AIPy8iKNsEA5Gc8Ttrw+
 gXYRdnEYMRx5F9NXCBFSL1XqkNu412gcxpnqyEUzSfhFEHJcjDYUbLvUd
 MMAeksex2gfeU112Bgn7JxxQXDyZLLVDWMvoqgzfaPzeHh+88HWSnqSYY
 GIrBBXRVU2CG0doZaf28v1nmCjMwtgz+wEc2qEq0I3Bj3nfT6L4X4UXOh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769468"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555178"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555178"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:40 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 29/33] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Tue, 29 Aug 2023 21:34:18 +0530
Message-ID: <20230829160422.1251087-30-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extract the LUT and program plane post csc registers.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 95 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 56bcf750b047..ff996b9ee77d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1963,16 +1963,109 @@ static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
 	}
 }
 
+static void xelpd_program_plane_post_csc_lut(const struct drm_plane_state *state,
+					     struct drm_color_lut_ext *post_csc_lut,
+					     u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		intel_de_write_fw(dev_priv, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				  offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (post_csc_lut) {
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u64 word = drm_color_lut_extract_ext(post_csc_lut[i].green, 24);
+				u32 lut_val = (word & 0xffffff);
+
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  lut_val);
+			}
+
+			do {
+				/* Program the max register to clamp values > 1.0. */
+				intel_de_write_fw(dev_priv,
+						  PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						  post_csc_lut[i].green);
+			} while (i++ < 34);
+		} else {
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
 static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state)
 {
 	const struct drm_property_blob *pre_csc_lut_blob =
 					plane_state->color.pre_csc_lut;
-	struct drm_color_lut_ext *pre_csc_lut = NULL;
+	const struct drm_property_blob *post_csc_lut_blob =
+					plane_state->color.post_csc_lut;
+	struct drm_color_lut_ext *pre_csc_lut, *post_csc_lut;
 
 	if (pre_csc_lut_blob) {
 		pre_csc_lut = pre_csc_lut_blob->data;
 		xelpd_program_plane_pre_csc_lut(plane_state, pre_csc_lut, 0);
 	}
+
+	if (post_csc_lut_blob) {
+		post_csc_lut = post_csc_lut_blob->data;
+		xelpd_program_plane_post_csc_lut(plane_state, post_csc_lut, 0);
+	}
 }
 
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
-- 
2.38.1

