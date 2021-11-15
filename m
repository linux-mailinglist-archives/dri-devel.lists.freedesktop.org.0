Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE14501B6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719CC6EB88;
	Mon, 15 Nov 2021 09:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4C76EC93;
 Mon, 15 Nov 2021 09:50:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133802"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447199"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:43 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 09/14] tests/kms_color_chamelium: New subtests for Plane
 degamma
Date: Mon, 15 Nov 2021 15:17:54 +0530
Message-Id: <20211115094759.520955-10-bhanuprakash.modem@intel.com>
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

To verify Plane degamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out degamma LUT and verify we have the same frame dump as
drawing solid color rectangles with linear gamma LUT.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 131 ++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index b506109271..3bcb3ac043 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -874,6 +874,132 @@ static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	drmModePropertyPtr degamma_mode;
+	struct igt_fb fb, fbref;
+	struct chamelium_port *port;
+	uint32_t i;
+	bool ret = true;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane degamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
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
+	/* Draw solid colors with no degamma. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
+	/* Iterate all supported degamma modes. */
+	for (i = 0; i < degamma_mode->count_enums; i++) {
+		struct chamelium_frame_dump *frame_fullcolors;
+		segment_data_t *degamma_segment_info = NULL;
+		struct drm_color_lut_ext *degamma_lut = NULL;
+		uint32_t degamma_lut_size = 0;
+
+		/* Ignore 'no degamma' from enum list. */
+		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
+			continue;
+
+		degamma_segment_info = get_segment_data(data, degamma_mode->enums[i].value,
+						degamma_mode->enums[i].name);
+		degamma_lut_size = sizeof(struct drm_color_lut_ext) * degamma_segment_info->entries_count;
+		degamma_lut = create_max_lut(degamma_segment_info);
+
+		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
+
+		/* Draw a gradient with degamma LUT to remap all
+		 * values to max red/green/blue.
+		 */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		set_plane_degamma(plane, degamma_mode->enums[i].name,
+				degamma_lut, degamma_lut_size);
+		igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
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
+				frame_fullcolors, &fbref,
+				CHAMELIUM_CHECK_ANALOG);
+
+		free(degamma_lut);
+		clear_segment_data(degamma_segment_info);
+	}
+
+	disable_plane_degamma(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	drmModeFreeProperty(degamma_mode);
+
+	return ret;
+}
+
 static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 {
 	igt_plane_t *plane;
@@ -903,6 +1029,11 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-plane-gamma",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_gamma_test);
+
+	igt_describe("Compare maxed out plane degamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-degamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_degamma_test);
 }
 
 igt_main
-- 
2.32.0

