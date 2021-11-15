Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF14501B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97C36EC97;
	Mon, 15 Nov 2021 09:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E946EC96;
 Mon, 15 Nov 2021 09:50:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133799"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133799"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447171"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:40 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 08/14] tests/kms_color_chamelium: New subtests for Plane gamma
Date: Mon, 15 Nov 2021 15:17:53 +0530
Message-Id: <20211115094759.520955-9-bhanuprakash.modem@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out gamma LUT and verify we have the same frame dump as
drawing solid color rectangles.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 188 +++++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 76f82d6d35..b506109271 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -24,7 +24,34 @@
 
 #include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level using Chamelium to verify instead of CRC");
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
 
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
@@ -723,6 +750,161 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 }
 
+static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb, fbref;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+	bool ret = true;
+	struct chamelium_port *port = NULL;
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
+	for_each_valid_output_on_pipe(display, plane->pipe->pipe, output) {
+		for (i = 0; i < data->port_count; i++)
+			if (strcmp(output->name, chamelium_port_get_name(data->ports[i])) == 0) {
+				port = data->ports[i];
+				break;
+			}
+
+		if (port)
+			break;
+	}
+	igt_require(port);
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
+
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fbref));
+
+	disable_degamma(plane->pipe);
+	disable_ctm(plane->pipe);
+	disable_gamma(plane->pipe);
+
+	disable_plane_degamma(plane);
+	disable_plane_ctm(plane);
+	disable_plane_gamma(plane);
+
+	igt_plane_set_fb(plane, &fbref);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		struct chamelium_frame_dump *frame_fullcolors;
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
+		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
+				gamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+		lut = create_max_lut(segment_info);
+		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
+
+		/* Draw a gradient with gamma LUT to remap all
+		 * values to max red/green/blue.
+		 */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+		frame_fullcolors =
+			chamelium_read_captured_frame(data->chamelium, 0);
+
+		/* Verify that the framebuffer reference of the software computed
+		 * output is equal to the frame dump of the gamma LUT
+		 * transformation output.
+		 */
+		ret &= chamelium_frame_match_or_dump(data->chamelium, port,
+					      frame_fullcolors, &fbref,
+					      CHAMELIUM_CHECK_ANALOG);
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
+	drmModeFreeProperty(gamma_mode);
+
+	return ret;
+}
+
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
+		igt_require(data->display.pipes[pipe].n_planes > 0);
+		igt_display_require_output_on_pipe(&data->display, pipe);
+	}
+
+	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-gamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_gamma_test);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -755,6 +937,10 @@ igt_main
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 
+	for_each_pipe_static(pipe)
+		igt_subtest_group
+			run_tests_for_plane(&data, pipe);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.32.0

