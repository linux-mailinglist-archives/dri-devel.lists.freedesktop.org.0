Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FEC4501B1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62576EC7F;
	Mon, 15 Nov 2021 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336BB6EC52;
 Mon, 15 Nov 2021 09:50:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133774"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133774"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447006"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:26 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 03/14] kms_color_helper: Add helper functions for plane color
 mgmt
Date: Mon, 15 Nov 2021 15:17:48 +0530
Message-Id: <20211115094759.520955-4-bhanuprakash.modem@intel.com>
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions to support Plane color management properties.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 173 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  29 +++++++
 2 files changed, 202 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index d71e7bb2e6..c65b7a0f50 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -241,6 +241,150 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
 }
 
+drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
+				enum igt_atomic_plane_properties prop)
+{
+	igt_display_t *display = plane->pipe->display;
+	uint32_t prop_id = plane->props[prop];
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
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info)
+{
+	uint32_t val, segment, entry, index = 0;
+	uint32_t max_val = 0xffffffff;
+	struct drm_color_lut_ext *lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
+	igt_assert(lut);
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = info->segment_data[segment].start;
+		uint32_t end = info->segment_data[segment].end;
+
+		for (entry = 1; entry <= entry_count; entry++) {
+			val = (index == 0) ? /* First entry is Zero. */
+				0 : start + entry * ((end - start) * 1.0 / entry_count);
+
+			lut[index].red = lut[index].green = lut[index].blue = MIN(val, max_val);
+
+			index++;
+		}
+	}
+
+	return lut;
+}
+
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info)
+{
+	int i;
+	struct drm_color_lut_ext *lut;
+	uint32_t max_val = 0xffffffff;
+
+	lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
+	igt_assert(lut);
+
+	lut[0].red = lut[0].green = lut[0].blue = 0; /* First entry is Zero. */
+
+	for (i = 1; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = max_val;
+
+	return lut;
+}
+
+void clear_segment_data(segment_data_t *info)
+{
+	if (!info)
+		return;
+
+	free(info->segment_data);
+	free(info);
+}
+
+segment_data_t *get_segment_data(data_t *data,
+				uint64_t blob_id, char *mode)
+{
+	drmModePropertyBlobPtr blob;
+	struct drm_color_lut_range *lut_range = NULL;
+	segment_data_t *info = NULL;
+	uint32_t i;
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	info = malloc(sizeof(segment_data_t));
+	igt_assert(info);
+
+	lut_range = (struct drm_color_lut_range *) blob->data;
+	info->segment_count = blob->length / sizeof(lut_range[0]);
+	igt_assert(info->segment_count);
+
+	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
+	igt_assert(info->segment_data);
+
+	for (i = 0; i < info->segment_count; i++) {
+		info->entries_count += lut_range[i].count;
+		info->segment_data[i] = lut_range[i];
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+	return info;
+}
+
+void set_plane_gamma(igt_plane_t *plane,
+		char *mode,
+		struct drm_color_lut_ext *lut,
+		uint32_t size)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, mode);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, lut, size);
+}
+
+void set_plane_degamma(igt_plane_t *plane,
+		char *mode,
+		struct drm_color_lut_ext *lut,
+		uint32_t size)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_DEGAMMA_MODE, mode);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, lut, size);
+}
+
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients)
+{
+	struct drm_color_ctm ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (coefficients[i] < 0) {
+			ctm.matrix[i] =
+				(int64_t) (-coefficients[i] *
+				((int64_t) 1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else
+			ctm.matrix[i] =
+				(int64_t) (coefficients[i] *
+				((int64_t) 1L << 32));
+	}
+
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, &ctm, sizeof(ctm));
+}
+
+void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop)
+{
+	if (igt_plane_has_prop(plane, prop))
+		igt_plane_replace_prop_blob(plane, prop, NULL, 0);
+}
+
 drmModePropertyBlobPtr
 get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 {
@@ -274,6 +418,19 @@ pipe_set_property_blob_id(igt_pipe_t *pipe,
 	return ret;
 }
 
+static int
+plane_set_property_blob(igt_display_t *display,
+			igt_plane_t *plane,
+			enum igt_atomic_plane_properties prop,
+			void *ptr, size_t length)
+{
+	igt_plane_replace_prop_blob(plane, prop, ptr, length);
+
+	return igt_display_try_commit2(display,
+				       display->is_atomic ?
+				       COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
 int
 pipe_set_property_blob(igt_pipe_t *pipe,
 		       enum igt_atomic_crtc_properties prop,
@@ -319,6 +476,22 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 	free(lut);
 }
 
+void
+invalid_plane_lut_sizes(igt_display_t *display,
+			igt_plane_t *plane,
+			enum igt_atomic_plane_properties prop,
+			size_t lut_size)
+{
+	void *lut = malloc(lut_size * 2);
+	igt_assert(lut);
+
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, 1), -EINVAL);
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size + 1), -EINVAL);
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size - 1), -EINVAL);
+
+	free(lut);
+}
+
 void
 invalid_gamma_lut_sizes(data_t *data, enum pipe p)
 {
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index bb6f0054f3..5a35dcaac1 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -64,6 +64,14 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
@@ -90,10 +98,31 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
+	enum igt_atomic_plane_properties prop);
+void clear_segment_data(segment_data_t *info);
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
+segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_plane_gamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_degamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients);
+void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop);
+void invalid_plane_lut_sizes(igt_display_t *display,
+			   igt_plane_t *plane,
+			   enum igt_atomic_plane_properties prop,
+			   size_t lut_size);
+
 #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
 #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
 #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
 
+#define disable_plane_degamma(plane) disable_plane_prop(plane, IGT_PLANE_DEGAMMA_LUT)
+#define disable_plane_gamma(plane) disable_plane_prop(plane, IGT_PLANE_GAMMA_LUT)
+#define disable_plane_ctm(plane) disable_plane_prop(plane, IGT_PLANE_CTM)
+
 drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
 				enum igt_atomic_crtc_properties prop);
 bool crc_equal(igt_crc_t *a, igt_crc_t *b);
-- 
2.32.0

