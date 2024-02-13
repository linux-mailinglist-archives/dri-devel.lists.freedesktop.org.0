Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B1852957
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C22310EAF0;
	Tue, 13 Feb 2024 06:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtlLC9Ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2B910EA2C;
 Tue, 13 Feb 2024 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806615; x=1739342615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N61x3zAOazluLq5/UnQpgLB6mdvjw3++vvHDTDadCUA=;
 b=QtlLC9Ql0CeSmBBiuqarY5F50onVNRdHkB9Vq/CRNmJzEr5VsBhAXp3J
 i9clsHOlxTeYHGmVqJeoN48f4b/bJonWHfjSqGmlAMpJk55jth1QzwOoY
 T5Uv6J+h+howGDAXfQ9Lz4pCdYW/fq2nMs/n7dzwu20azTddj0PPdCWaA
 D/FUlGLREcBMid5aGJ6e9wZNlZTxyiupAU9b3xnqDO3TXcp4HbHJXXJQc
 Qf/eUJMjeIfdC+y6BdK4QM84TGlP/mVaORGCDvUhKHV1MkL6XRMs0/XWK
 Znl1JO3ah56sApywiWm/PRvFrKFc6p/ziuFXD0ZYhDXu93Wztdn1KOWY+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948287"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450708"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:43:28 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 26/28] drm/i915/xelpd: Program Plane Post CSC Registers
Date: Tue, 13 Feb 2024 12:18:33 +0530
Message-ID: <20240213064835.139464-27-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
 drivers/gpu/drm/i915/display/intel_color.c | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 6dd9b8e43352..68e1c91a2b39 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3863,6 +3863,92 @@ static void xelpd_program_plane_pre_csc_lut(const struct drm_plane_state *state,
 	}
 }
 
+static void xelpd_program_plane_post_csc_lut(const struct drm_plane_state *state,
+					     const struct drm_color_lut_ext *post_csc_lut,
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
 static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 				  const struct drm_property_blob *blob, bool is_pre_csc)
 {
@@ -3870,6 +3956,8 @@ static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state,
 
 	if (is_pre_csc)
 		xelpd_program_plane_pre_csc_lut(plane_state, lut, 0);
+	else
+		xelpd_program_plane_post_csc_lut(plane_state, lut, 0);
 }
 
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state,
-- 
2.42.0

