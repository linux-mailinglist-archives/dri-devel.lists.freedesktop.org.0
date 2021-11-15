Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F604501BA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F3A6EC9B;
	Mon, 15 Nov 2021 09:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03D6ECA3;
 Mon, 15 Nov 2021 09:51:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133824"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="232133824"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:51:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="535447391"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:59 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 14/14] tests/kms_color_chamelium: Extended IGT tests to
 support logarithmic gamma mode
Date: Mon, 15 Nov 2021 15:17:59 +0530
Message-Id: <20211115094759.520955-15-bhanuprakash.modem@intel.com>
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
 Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extended IGT tests to support logarithmic gamma mode on pipe

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 40 ++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index af820565d3..26e940f4c1 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -317,10 +317,21 @@ static void test_pipe_gamma(data_t *data,
 		igt_assert(fbref_id);
 
 		igt_plane_set_fb(primary, &fb_modeset);
+
+		/* Reset the color properties */
 		disable_ctm(primary->pipe);
 		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_full);
+		disable_gamma(primary->pipe);
 		igt_display_commit(&data->display);
+		igt_wait_for_vblank(data->drm_fd,
+				    data->display.pipes[primary->pipe->pipe].crtc_offset);
+
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE)) {
+			set_advance_gamma(data, primary->pipe, MAX_GAMMA);
+		} else {
+			set_gamma(data, primary->pipe, gamma_full);
+			igt_display_commit(&data->display);
+		}
 
 		/* Draw solid colors with no gamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fbref);
@@ -343,6 +354,7 @@ static void test_pipe_gamma(data_t *data,
 					      frame_fullcolors, &fbref,
 					      CHAMELIUM_CHECK_ANALOG);
 
+		/* Cleanup */
 		disable_gamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
@@ -431,7 +443,10 @@ static bool test_pipe_ctm(data_t *data,
 
 		if (memcmp(before, after, sizeof(color_t))) {
 			set_degamma(data, primary->pipe, degamma_linear);
-			set_gamma(data, primary->pipe, gamma_linear);
+			if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE))
+				disable_gamma(primary->pipe);
+			else
+				set_gamma(data, primary->pipe, gamma_linear);
 		} else {
 			/* Disable Degamma and Gamma for ctm max test */
 			disable_degamma(primary->pipe);
@@ -465,6 +480,12 @@ static bool test_pipe_ctm(data_t *data,
 		igt_output_set_pipe(output, PIPE_NONE);
 	}
 
+	/* Cleanup */
+	disable_gamma(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
 
@@ -561,7 +582,14 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb_modeset);
 
 		set_degamma(data, primary->pipe, degamma_linear);
-		set_gamma(data, primary->pipe, gamma_linear);
+		/*
+		 * No need of linear gamma for limited range ctm test
+		 * Not extending for new API interface.
+		 */
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE))
+			disable_gamma(primary->pipe);
+		else
+			set_gamma(data, primary->pipe, gamma_linear);
 		set_ctm(primary->pipe, ctm);
 
 		igt_output_set_prop_value(output,
@@ -598,6 +626,12 @@ static void test_pipe_limited_range_ctm(data_t *data,
 
 	}
 
+	/* Cleanup */
+	disable_gamma(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
 
-- 
2.32.0

