Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53551983B3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D9A6E487;
	Mon, 30 Mar 2020 18:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1060C6E484;
 Mon, 30 Mar 2020 18:48:39 +0000 (UTC)
IronPort-SDR: sVSsw9RbfIIiplMyoiUeKJen3Zifuw/8JH18lvKpK5FX/Y11hRkecQLe+VXp9/kmnZ2XZXJnVo
 Tct9zbOVrr6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 11:48:38 -0700
IronPort-SDR: F07yo7sU44bKTWIQPzSqIed0e/bEXhCaTB25VZPzVedgw9Gctjdd9OKK89wrWWwyVuBk1zQN03
 NNNl7/bI+atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="267013144"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2020 11:48:32 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Imre Deak <imre.deak@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/5] drm/i915/display: Add Nearest-neighbor based integer
 scaling support
Date: Tue, 31 Mar 2020 00:08:56 +0530
Message-Id: <20200330183857.13270-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Integer scaling (IS) is a nearest-neighbor upscaling technique that
simply scales up the existing pixels by an integer
(i.e., whole number) multiplier.Nearest-neighbor (NN) interpolation
works by filling in the missing color values in the upscaled image
with that of the coordinate-mapped nearest source pixel value.

Both IS and NN preserve the clarity of the original image. Integer
scaling is particularly useful for pixel art games that rely on
sharp, blocky images to deliver their distinctive look.

Introduce functions to configure the scaler filter coefficients to
enable nearest-neighbor filtering.

Bspec: 49247

changes since v2:
* Move APIs from 5/5 into this patch.
* Change filter programming related function names to cnl_*, move
  filter select bits related code into inline function (Ville)
changes since v1:
* Rearrange skl_scaler_setup_nearest_neighbor_filter() to iterate the
  registers directly instead of the phases and taps (Ville)

changes since RFC:
* Refine the skl_scaler_setup_nearest_neighbor_filter() logic (Ville)

Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 99 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  4 +
 2 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 37bd7ce88ecd..85c29a69519f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6237,6 +6237,105 @@ void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state)
 		skl_detach_scaler(crtc, i);
 }
 
+static int cnl_coef_tap(int i)
+{
+	return i % 7;
+}
+
+static u16 cnl_nearest_filter_coef(int t)
+{
+	return t == 3 ? 0x0800 : 0x3000;
+}
+
+/**
+ *  Theory behind setting nearest-neighbor integer scaling:
+ *
+ *  17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
+ *  The letter represents the filter tap (D is the center tap) and the number
+ *  represents the coefficient set for a phase (0-16).
+ *
+ *         +------------+------------------------+------------------------+
+ *         |Index value | Data value coeffient 1 | Data value coeffient 2 |
+ *         +------------+------------------------+------------------------+
+ *         |   00h      |          B0            |          A0            |
+ *         +------------+------------------------+------------------------+
+ *         |   01h      |          D0            |          C0            |
+ *         +------------+------------------------+------------------------+
+ *         |   02h      |          F0            |          E0            |
+ *         +------------+------------------------+------------------------+
+ *         |   03h      |          A1            |          G0            |
+ *         +------------+------------------------+------------------------+
+ *         |   04h      |          C1            |          B1            |
+ *         +------------+------------------------+------------------------+
+ *         |   ...      |          ...           |          ...           |
+ *         +------------+------------------------+------------------------+
+ *         |   38h      |          B16           |          A16           |
+ *         +------------+------------------------+------------------------+
+ *         |   39h      |          D16           |          C16           |
+ *         +------------+------------------------+------------------------+
+ *         |   3Ah      |          F16           |          C16           |
+ *         +------------+------------------------+------------------------+
+ *         |   3Bh      |        Reserved        |          G16           |
+ *         +------------+------------------------+------------------------+
+ *
+ *  To enable nearest-neighbor scaling:  program scaler coefficents with
+ *  the center tap (Dxx) values set to 1 and all other values set to 0 as per
+ *  SCALER_COEFFICIENT_FORMAT
+ *
+ */
+
+static void cnl_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
+					     enum pipe pipe, int id, int set)
+{
+	int i;
+
+	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set),
+			  PS_COEE_INDEX_AUTO_INC);
+
+	for (i = 0; i < 17 * 7; i += 2) {
+		u32 tmp;
+		int t;
+
+		t = cnl_coef_tap(i);
+		tmp = cnl_nearest_filter_coef(t);
+
+		t = cnl_coef_tap(i + 1);
+		tmp |= cnl_nearest_filter_coef(t) << 16;
+
+		intel_de_write_fw(dev_priv, CNL_PS_COEF_DATA_SET(pipe, id, set),
+				  tmp);
+	}
+
+	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set), 0);
+}
+
+inline u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set)
+{
+	if (filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
+		return (PS_FILTER_PROGRAMMED |
+			PS_Y_VERT_FILTER_SELECT(set) |
+			PS_Y_HORZ_FILTER_SELECT(set) |
+			PS_UV_VERT_FILTER_SELECT(set) |
+			PS_UV_HORZ_FILTER_SELECT(set));
+	}
+
+	return PS_FILTER_MEDIUM;
+}
+
+void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe pipe,
+			     int id, int set, enum drm_scaling_filter filter)
+{
+	switch (filter) {
+	case DRM_SCALING_FILTER_DEFAULT:
+		break;
+	case DRM_SCALING_FILTER_NEAREST_NEIGHBOR:
+		cnl_program_nearest_filter_coefs(dev_priv, pipe, id, set);
+		break;
+	default:
+		MISSING_CASE(filter);
+	}
+}
+
 static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index adb1225a3480..c22308a042d8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -28,6 +28,7 @@
 #include <drm/drm_util.h>
 
 enum link_m_n_set;
+enum drm_scaling_filter;
 struct dpll;
 struct drm_connector;
 struct drm_device;
@@ -587,6 +588,9 @@ void intel_crtc_arm_fifo_underrun(struct intel_crtc *crtc,
 u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_center);
 int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state);
 void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
+u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set);
+void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe pipe,
+			     int id, int set, enum drm_scaling_filter filter);
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state);
 u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
