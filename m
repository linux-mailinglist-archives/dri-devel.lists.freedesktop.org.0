Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B944501B3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B190A6EC94;
	Mon, 15 Nov 2021 09:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230176EC8D;
 Mon, 15 Nov 2021 09:50:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133794"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447157"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:37 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 07/14] tests/kms_color: New negative tests for plane level
 color mgmt
Date: Mon, 15 Nov 2021 15:17:52 +0530
Message-Id: <20211115094759.520955-8-bhanuprakash.modem@intel.com>
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

Negative check for:
 * plane gamma lut sizes
 * plane degamma lut sizes
 * plane ctm matrix sizes

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e14b37cb6f..d9fe417ba9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -736,6 +736,118 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool invalid_plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+
+	igt_info("Plane invalid gamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		segment_data_t *segment_info = NULL;
+		size_t lut_size = 0;
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
+
+		igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, gamma_mode->enums[i].name);
+		invalid_plane_lut_sizes(display, plane,
+					IGT_PLANE_GAMMA_LUT,
+					lut_size);
+
+		clear_segment_data(segment_info);
+
+		/* One enum is enough. */
+		break;
+	}
+
+	drmModeFreeProperty(gamma_mode);
+
+	return true;
+}
+
+static bool invalid_plane_degamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModePropertyPtr degamma_mode = NULL;
+	uint32_t i;
+
+	igt_info("Plane invalid degamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
+
+	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
+
+	/* Iterate all supported degamma modes. */
+	for (i = 0; i < degamma_mode->count_enums; i++) {
+		segment_data_t *segment_info = NULL;
+		size_t lut_size = 0;
+
+		/* Ignore 'no degamma' from enum list. */
+		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
+			continue;
+
+		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
+
+		segment_info = get_segment_data(data,
+						degamma_mode->enums[i].value,
+						degamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count * 2;
+
+		igt_plane_set_prop_enum(plane,
+					IGT_PLANE_DEGAMMA_MODE,
+					degamma_mode->enums[i].name);
+		invalid_plane_lut_sizes(display, plane,
+					IGT_PLANE_DEGAMMA_LUT,
+					lut_size);
+
+		clear_segment_data(segment_info);
+
+		/* One enum is enough. */
+		break;
+	}
+
+	drmModeFreeProperty(degamma_mode);
+
+	return true;
+}
+
+static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
+{
+	igt_info("Plane invalid CTM test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
+	invalid_plane_lut_sizes(&data->display, plane,
+				IGT_PLANE_CTM,
+				sizeof(struct drm_color_ctm));
+
+	return true;
+}
+
 static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 {
 	igt_output_t *output;
@@ -1411,6 +1523,21 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 					ctm_tests[i].iter);
 		}
 	}
+
+	igt_describe("Negative check for invalid plane gamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-gamma-lut-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_gamma_test);
+
+	igt_describe("Negative check for invalid plane degamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-degamma-lut-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_degamma_test);
+
+	igt_describe("Negative check for invalid plane ctm matrix sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
 }
 
 igt_main
-- 
2.32.0

