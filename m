Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230916EBFE1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F3F10E2DE;
	Sun, 23 Apr 2023 14:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682A10E297;
 Sun, 23 Apr 2023 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V1oDkmbueRnnz+rHHKvWOOs8MJ4RbGDKdmsY3zOpu8c=; b=C8X0JyttvzfIZRkmdMIeTVc7jr
 uWzk7FyLU4tVJF6tWDU9ilaTYNyLbwiDmBI9EeXPAmdEV8uAFJVK7/F9zWtAh0UnRw5JRv1xbTYox
 qgbnp4/71R6hU95uy41F/0g+RaSktaXSjA1a8d9ns7pdr3WHgfypygBfP1cAsJAqIo93Ef/OxE2HE
 hcXZBOFO4sz7WlbRfmOM/+zeMAZ0dqs/TlNt5y7jhxvWOqDtYp0G8UZfjXtwg2wZZuZnp7SHqVHVy
 zITmGbRUxLyu9jhIv7+Eqmer4N2pJCz0GYbtQ+gVp3RIF/KiTw+kOwYrUh1XmLpo9aQgUwRZMSRI+
 58vqZ59A==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRX-00ANVs-0Y; Sun, 23 Apr 2023 16:11:55 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 01/40] drm/amd/display: fix segment distribution for
 linear LUTs
Date: Sun, 23 Apr 2023 13:10:13 -0100
Message-Id: <20230423141051.702990-2-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

The region and segment calculation was incapable of dealing
with regions of more than 16 segments. We first fix this.

Now that we can support regions up to 256 elements we can
define a better segment distribution for near-linear LUTs
for our maximum of 256 HW-supported points.

With these changes an "identity" LUT looks visually
indistinguishable from bypass and allows us to use
our 3DLUT.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/dc/dcn10/dcn10_cm_common.c    | 95 +++++++++++++++----
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
index 7a00fe525dfb..f27413e94280 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
@@ -346,20 +346,37 @@ bool cm_helper_translate_curve_to_hw_format(
 		 * segment is from 2^-10 to 2^1
 		 * There are less than 256 points, for optimization
 		 */
-		seg_distr[0] = 3;
-		seg_distr[1] = 4;
-		seg_distr[2] = 4;
-		seg_distr[3] = 4;
-		seg_distr[4] = 4;
-		seg_distr[5] = 4;
-		seg_distr[6] = 4;
-		seg_distr[7] = 4;
-		seg_distr[8] = 4;
-		seg_distr[9] = 4;
-		seg_distr[10] = 1;
-
-		region_start = -10;
-		region_end = 1;
+		if (output_tf->tf == TRANSFER_FUNCTION_LINEAR) {
+			seg_distr[0] = 0; /* 2 */
+			seg_distr[1] = 1; /* 4 */
+			seg_distr[2] = 2; /* 4 */
+			seg_distr[3] = 3; /* 8 */
+			seg_distr[4] = 4; /* 16 */
+			seg_distr[5] = 5; /* 32 */
+			seg_distr[6] = 6; /* 64 */
+			seg_distr[7] = 7; /* 128 */
+
+			region_start = -8;
+			region_end = 1;
+		} else {
+			seg_distr[0] = 3; /* 8 */
+			seg_distr[1] = 4; /* 16 */
+			seg_distr[2] = 4;
+			seg_distr[3] = 4;
+			seg_distr[4] = 4;
+			seg_distr[5] = 4;
+			seg_distr[6] = 4;
+			seg_distr[7] = 4;
+			seg_distr[8] = 4;
+			seg_distr[9] = 4;
+			seg_distr[10] = 1; /* 2 */
+			/* total = 8*16 + 8 + 64 + 2 = */
+
+			region_start = -10;
+			region_end = 1;
+		}
+
+
 	}
 
 	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
@@ -372,16 +389,56 @@ bool cm_helper_translate_curve_to_hw_format(
 
 	j = 0;
 	for (k = 0; k < (region_end - region_start); k++) {
-		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
+		/*
+		 * We're using an ugly-ish hack here. Our HW allows for
+		 * 256 segments per region but SW_SEGMENTS is 16.
+		 * SW_SEGMENTS has some undocumented relationship to
+		 * the number of points in the tf_pts struct, which
+		 * is 512, unlike what's suggested TRANSFER_FUNC_POINTS.
+		 *
+		 * In order to work past this dilemma we'll scale our
+		 * increment by (1 << 4) and then do the inverse (1 >> 4)
+		 * when accessing the elements in tf_pts.
+		 *
+		 * TODO: find a better way using SW_SEGMENTS and
+		 *       TRANSFER_FUNC_POINTS definitions
+		 */
+		increment = (NUMBER_SW_SEGMENTS << 4) / (1 << seg_distr[k]);
 		start_index = (region_start + k + MAX_LOW_POINT) *
 				NUMBER_SW_SEGMENTS;
-		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
+		for (i = (start_index << 4); i < (start_index << 4) + (NUMBER_SW_SEGMENTS << 4);
 				i += increment) {
+			struct fixed31_32 in_plus_one, in;
+			struct fixed31_32 value, red_value, green_value, blue_value;
+			uint32_t t = i & 0xf;
+
 			if (j == hw_points - 1)
 				break;
-			rgb_resulted[j].red = output_tf->tf_pts.red[i];
-			rgb_resulted[j].green = output_tf->tf_pts.green[i];
-			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
+
+			in_plus_one = output_tf->tf_pts.red[(i >> 4) + 1];
+			in = output_tf->tf_pts.red[i >> 4];
+			value = dc_fixpt_sub(in_plus_one, in);
+			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
+			value = dc_fixpt_add(in, value);
+			red_value = value;
+
+			in_plus_one = output_tf->tf_pts.green[(i >> 4) + 1];
+			in = output_tf->tf_pts.green[i >> 4];
+			value = dc_fixpt_sub(in_plus_one, in);
+			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
+			value = dc_fixpt_add(in, value);
+			green_value = value;
+
+			in_plus_one = output_tf->tf_pts.blue[(i >> 4) + 1];
+			in = output_tf->tf_pts.blue[i >> 4];
+			value = dc_fixpt_sub(in_plus_one, in);
+			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
+			value = dc_fixpt_add(in, value);
+			blue_value = value;
+
+			rgb_resulted[j].red = red_value;
+			rgb_resulted[j].green = green_value;
+			rgb_resulted[j].blue = blue_value;
 			j++;
 		}
 	}
-- 
2.39.2

