Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E44501B8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C9F6EC9A;
	Mon, 15 Nov 2021 09:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681E86EBAA;
 Mon, 15 Nov 2021 09:50:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133815"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133815"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447311"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:52 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 12/14] kms_color_helper: Add helper functions to support
 logarithmic gamma mode
Date: Mon, 15 Nov 2021 15:17:57 +0530
Message-Id: <20211115094759.520955-13-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Add helper functions to support logarithmic gamma mode

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 127 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  16 +++++
 2 files changed, 143 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index c65b7a0f50..7ea8282df3 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -190,6 +190,33 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
+						const gamma_lut_t *gamma,
+						uint32_t color_depth,
+						int off)
+{
+	struct drm_color_lut *lut;
+	int i, lut_size = gamma->size;
+	/* This is the maximum value due to 16 bit precision in hardware. */
+	uint32_t max_hw_value = (1 << 16) - 1;
+	unsigned int max_segment_value = 1 << 24;
+
+	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
+
+	for (i = 0; i < lut_size; i++) {
+		double scaling_factor = (double)max_hw_value / (double)max_segment_value;
+		uint32_t r = MIN((gamma->coeffs[i].r * scaling_factor), max_hw_value);
+		uint32_t g = MIN((gamma->coeffs[i].g * scaling_factor), max_hw_value);
+		uint32_t b = MIN((gamma->coeffs[i].b * scaling_factor), max_hw_value);
+
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
+	}
+
+	return lut;
+}
+
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma)
@@ -203,6 +230,15 @@ void set_degamma(data_t *data,
 	free(lut);
 }
 
+void set_pipe_gamma(igt_pipe_t *pipe,
+		    uint64_t value,
+		    struct drm_color_lut *lut,
+		    uint32_t size)
+{
+	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_MODE, value);
+	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
+}
+
 void set_gamma(data_t *data,
 	       igt_pipe_t *pipe, const gamma_lut_t *gamma)
 {
@@ -241,6 +277,51 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
 }
 
+drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
+					       enum igt_atomic_crtc_properties prop)
+{
+	igt_display_t *display = pipe->display;
+	uint32_t prop_id = pipe->props[prop];
+	drmModePropertyPtr drmProp;
+
+	igt_assert(prop_id);
+
+	drmProp = drmModeGetProperty(display->drm_fd, prop_id);
+
+	igt_assert(drmProp);
+	igt_assert(drmProp->count_enums);
+
+	return drmProp;
+}
+
+gamma_lut_t *pipe_create_linear_lut(segment_data_t *info)
+{
+	uint32_t segment, entry, index = 0;
+	double val;
+	int i = 0;
+	gamma_lut_t *gamma = alloc_lut(info->entries_count);
+
+	igt_assert(gamma);
+
+	gamma->size = info->entries_count;
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = (segment == 0) ? 0 : (1 << (segment - 1));
+		uint32_t end = 1 << segment;
+
+		for (entry = 0; entry < entry_count; entry++) {
+			val = (index == 0) ? /* First entry is Zero. */
+				0 : start + entry *
+				((end - start) * 1.0 / entry_count);
+
+			set_rgb(&gamma->coeffs[i++], val);
+			index++;
+		}
+	}
+
+	return gamma;
+}
+
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 				enum igt_atomic_plane_properties prop)
 {
@@ -331,6 +412,7 @@ segment_data_t *get_segment_data(data_t *data,
 	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
 	igt_assert(info->segment_data);
 
+	info->entries_count = 0;
 	for (i = 0; i < info->segment_count; i++) {
 		info->entries_count += lut_range[i].count;
 		info->segment_data[i] = lut_range[i];
@@ -341,6 +423,51 @@ segment_data_t *get_segment_data(data_t *data,
 	return info;
 }
 
+void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type)
+{
+	igt_display_t *display = &data->display;
+	gamma_lut_t *gamma_log;
+	drmModePropertyPtr gamma_mode = NULL;
+	segment_data_t *segment_info = NULL;
+	struct drm_color_lut *lut = NULL;
+	int lut_size = 0;
+
+	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);
+	gamma_mode = get_pipe_gamma_degamma_mode(pipe, IGT_CRTC_GAMMA_MODE);
+
+	for (int i = 0; i < gamma_mode->count_enums; i++) {
+		if (!strcmp(gamma_mode->enums[i].name, "logarithmic gamma")) {
+			segment_info = get_segment_data(data,
+							gamma_mode->enums[i].value,
+							gamma_mode->enums[i].name);
+			lut_size = sizeof(struct drm_color_lut) *
+					  segment_info->entries_count;
+			if (type == LINEAR_GAMMA) {
+				gamma_log = pipe_create_linear_lut(segment_info);
+				lut = coeffs_to_logarithmic_lut(data,
+								gamma_log,
+								data->color_depth,
+								0);
+			} else if (type == MAX_GAMMA) {
+				gamma_log = generate_table_max(segment_info->entries_count);
+				gamma_log->size = segment_info->entries_count;
+				lut = coeffs_to_lut(data, gamma_log,
+						    data->color_depth, 0);
+			}
+			set_pipe_gamma(pipe, gamma_mode->enums[i].value,
+				       lut, lut_size);
+			igt_display_commit2(display, display->is_atomic
+					    ? COMMIT_ATOMIC : COMMIT_LEGACY);
+			break;
+		}
+	}
+	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);
+	free(gamma_log);
+	free(lut);
+	clear_segment_data(segment_info);
+	drmModeFreeProperty(gamma_mode);
+}
+
 void set_plane_gamma(igt_plane_t *plane,
 		char *mode,
 		struct drm_color_lut_ext *lut,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 5a35dcaac1..c863874f0c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -70,6 +70,11 @@ typedef struct {
 	uint32_t entries_count;
 } segment_data_t;
 
+enum gamma_type {
+	LINEAR_GAMMA,
+	MAX_GAMMA
+};
+
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 
 void paint_gradient_rectangles(data_t *data,
@@ -89,6 +94,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
+						const gamma_lut_t *gamma,
+						uint32_t color_depth,
+						int off);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
@@ -98,12 +107,19 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
+					       enum igt_atomic_crtc_properties
+					       prop);
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 	enum igt_atomic_plane_properties prop);
 void clear_segment_data(segment_data_t *info);
+gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
 segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
+		    struct drm_color_lut *lut, uint32_t size);
+void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type);
 void set_plane_gamma(igt_plane_t *plane,
 	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
 void set_plane_degamma(igt_plane_t *plane,
-- 
2.32.0

