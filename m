Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56C4501B0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCC56EC53;
	Mon, 15 Nov 2021 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB86EC53;
 Mon, 15 Nov 2021 09:50:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133778"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133778"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447027"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:29 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
Date: Mon, 15 Nov 2021 15:17:49 +0530
Message-Id: <20211115094759.520955-5-bhanuprakash.modem@intel.com>
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

To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out gamma LUT and verify we have the same CRC as drawing solid
color rectangles.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 775f35964f..b45d66762f 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -24,7 +24,34 @@
 
 #include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
+
+#define MAX_SUPPORTED_PLANES 7
+#define SDR_PLANE_BASE 3
+
+typedef bool (*test_t)(data_t*, igt_plane_t*);
+
+static bool is_hdr_plane(const igt_plane_t *plane)
+{
+	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
+}
+
+static bool is_valid_plane(igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+		return false;
+
+	/*
+	 * Test 1 HDR plane, 1 SDR plane.
+	 *
+	 * 0,1,2 HDR planes
+	 * 3,4,5,6 SDR planes
+	 *
+	 */
+	return index >= 0 && index < MAX_SUPPORTED_PLANES;
+}
 
 static void test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
@@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+	bool ret = true;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd,
+				  plane->pipe->pipe,
+				  INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
+	igt_assert(output);
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb));
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+
+	disable_plane_ctm(plane);
+	disable_plane_degamma(plane);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		igt_crc_t crc_gamma, crc_fullcolors;
+		segment_data_t *segment_info = NULL;
+		struct drm_color_lut_ext *lut = NULL;
+		uint32_t lut_size = 0;
+
+		/* Ignore 'no gamma' from enum list. */
+		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
+			continue;
+
+		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
+
+		/* Draw solid colors with no gamma transformation. */
+		disable_plane_gamma(plane);
+		paint_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
+
+		/* Draw gradient colors with gamma LUT to remap all
+		 * values to max red/green/blue.
+		 */
+		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
+				gamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+		lut = create_max_lut(segment_info);
+		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
+
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
+
+		/* Verify that the CRC of the software computed output is
+		 * equal to the CRC of the gamma LUT transformation output.
+		 */
+		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
+
+		free(lut);
+		clear_segment_data(segment_info);
+	}
+
+	disable_plane_gamma(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	igt_pipe_crc_free(pipe_crc);
+	drmModeFreeProperty(gamma_mode);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
 		invalid_ctm_matrix_sizes(data, p);
 }
 
+static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
+{
+	igt_plane_t *plane;
+	int count = 0;
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+
+		igt_assert(test(data, plane));
+
+		count++;
+	}
+
+	igt_require_f(count, "No valid planes found.\n");
+}
+
+static void run_tests_for_plane(data_t *data, enum pipe pipe)
+{
+	igt_fixture {
+		igt_require_pipe(&data->display, pipe);
+		igt_require_pipe_crc(data->drm_fd);
+		igt_require(data->display.pipes[pipe].n_planes > 0);
+		igt_display_require_output_on_pipe(&data->display, pipe);
+	}
+
+	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_gamma_test);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -910,6 +1084,9 @@ igt_main
 
 		igt_subtest_group
 			run_invalid_tests_for_pipe(&data, pipe);
+
+		igt_subtest_group
+			run_tests_for_plane(&data, pipe);
 	}
 
 	igt_fixture {
-- 
2.32.0

