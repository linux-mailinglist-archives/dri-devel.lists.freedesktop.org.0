Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D649A4501B7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF16EC59;
	Mon, 15 Nov 2021 09:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E803D6EC59;
 Mon, 15 Nov 2021 09:50:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133805"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133805"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447248"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:46 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 10/14] tests/kms_color_chamelium: New subtests for Plane CTM
Date: Mon, 15 Nov 2021 15:17:55 +0530
Message-Id: <20211115094759.520955-11-bhanuprakash.modem@intel.com>
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

To verify plane CTM, draw 3 rectangles using before colors with the
ctm matrix applied and verify the frame dump is equal to using after
colors with an identify ctm matrix.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 229 ++++++++++++++++++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 3bcb3ac043..af820565d3 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -53,6 +53,77 @@ static bool is_valid_plane(igt_plane_t *plane)
 	return index >= 0 && index < MAX_SUPPORTED_PLANES;
 }
 
+struct {
+	const char *test_name;
+	int iter;
+	color_t expected_colors[3];
+	double ctm[9];
+} ctm_tests[] = {
+	{"plane-ctm-red-to-blue", 0,
+					{{ 0.0, 0.0, 1.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 0.0, 0.0, 0.0,
+		  0.0, 1.0, 0.0,
+		  1.0, 0.0, 1.0 },
+	},
+	{"plane-ctm-green-to-red", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 1.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 1.0, 1.0, 0.0,
+		  0.0, 0.0, 0.0,
+		  0.0, 0.0, 1.0 },
+	},
+	{"plane-ctm-blue-to-red", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 1.0, 0.0, 0.0 }},
+		{ 1.0, 0.0, 1.0,
+		  0.0, 1.0, 0.0,
+		  0.0, 0.0, 0.0 },
+	},
+	{"plane-ctm-max", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 100.0, 0.0, 0.0,
+		  0.0, 100.0, 0.0,
+		  0.0, 0.0, 100.0 },
+	},
+	{"plane-ctm-negative", 0,
+					{{ 0.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 0.0 }},
+		{ -1.0, 0.0, 0.0,
+		   0.0, -1.0, 0.0,
+		   0.0, 0.0, -1.0 },
+	},
+	/* We tests a few values around the expected result because
+	 * it depends on the hardware we're dealing with, we can
+	 * either get clamped or rounded values and we also need to
+	 * account for odd number of items in the LUTs.
+	 */
+	{"plane-ctm-0-25", 5,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.25, 0.0,  0.0,
+		  0.0,  0.25, 0.0,
+		  0.0,  0.0,  0.25 },
+	},
+	{"plane-ctm-0-50", 5,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.5,  0.0,  0.0,
+		  0.0,  0.5,  0.0,
+		  0.0,  0.0,  0.5 },
+	},
+	{"plane-ctm-0-75", 7,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.75, 0.0,  0.0,
+		  0.0,  0.75, 0.0,
+		  0.0,  0.0,  0.75 },
+	},
+};
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -1000,6 +1071,103 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool test_plane_ctm(data_t *data,
+			  igt_plane_t *plane,
+			  color_t *before,
+			  color_t *after,
+			  double *ctm_matrix)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb, fbref;
+	struct chamelium_port *port;
+	struct chamelium_frame_dump *frame_hardware;
+	uint32_t i;
+	bool ret = true;
+
+	igt_info("Plane CTM test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
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
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* Without CTM transformation. */
+	paint_rectangles(data, mode, after, &fbref);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(plane, &fb);
+	set_plane_ctm(plane, ctm_matrix);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_hardware =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	/* Verify that the framebuffer reference of the software
+	 * computed output is equal to the frame dump of the CTM
+	 * matrix transformation output.
+	 */
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					     frame_hardware,
+					     &fbref,
+					     CHAMELIUM_CHECK_ANALOG);
+
+	disable_plane_ctm(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	return ret;
+}
+
 static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 {
 	igt_plane_t *plane;
@@ -1017,8 +1185,57 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 	igt_require_f(count, "No valid planes found.\n");
 }
 
+static void run_plane_ctm_test(data_t *data,
+				enum pipe pipe,
+				color_t *expected,
+				double *ctm,
+				int iter)
+{
+	igt_plane_t *plane;
+	bool result;
+	int i, count = 0;
+	double delta = 1.0 / (1 << 8);
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+
+		result = false;
+
+		if (!iter)
+			result |= test_plane_ctm(data, plane,
+					red_green_blue, expected,
+					ctm);
+
+		for (i = 0; i < iter; i++) {
+			expected[0].r =
+			expected[1].g =
+			expected[2].b =
+				ctm[0] + delta * (i - (iter/2));
+
+			result |= test_plane_ctm(data, plane,
+					red_green_blue,	expected,
+					ctm);
+			if (result)
+				break;
+		}
+
+		igt_assert(result);
+		count++;
+	}
+
+	igt_require_f(count, "No valid planes found.\n");
+}
+
 static void run_tests_for_plane(data_t *data, enum pipe pipe)
 {
+	int i;
+
 	igt_fixture {
 		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
@@ -1034,6 +1251,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-plane-degamma",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_degamma_test);
+
+	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
+		igt_describe("Compare after applying ctm matrix & identity matrix");
+		igt_subtest_f("pipe-%s-%s",
+				kmstest_pipe_name(pipe),
+				ctm_tests[i].test_name) {
+			run_plane_ctm_test(data, pipe,
+					ctm_tests[i].expected_colors,
+					ctm_tests[i].ctm,
+					ctm_tests[i].iter);
+		}
+	}
 }
 
 igt_main
-- 
2.32.0

