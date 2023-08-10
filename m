Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13256777D30
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DE710E567;
	Thu, 10 Aug 2023 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5C10E563;
 Thu, 10 Aug 2023 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ZkrkzsbuDn6Ki1sNBsgFBc2KIlDw7V9vazQKEOOkr0=; b=FnlpVud881qz1Zord/JNfyqLXP
 eIJbNxUa9nn/7PG+cUpzSwN8JYtrEOGMGB60j2xMo1pd+sJzjq8fyTrZGwvfldeDhY3eWBQlnataR
 KsyPZHFlHortwXUhOl27DnXi6zp2cNmIelJVI+zoE2vkhDQ+8ji6ZqWg9gqcfYEjjn6WG3WnwGAZg
 Rb2cLDvWgeJij4870aGVvM6C2Ju/EbERQ/xDbOaQcqUv4YAL8XsUpieqQTqNXY6ZHmD1Px7jMcUG7
 Om65q+ngtpQU1rYf1/Pa7pklBjerSF+bsGY/fO0j1gNWmyWfBfuu7G5vN1k3Epxex9TA++ZyCBnep
 q4Mi5fEw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU887-00GjYD-Qs; Thu, 10 Aug 2023 18:03:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 01/34] drm/amd/display: fix segment distribution for linear
 LUTs
Date: Thu, 10 Aug 2023 15:02:41 -0100
Message-Id: <20230810160314.48225-2-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
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
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn10/dcn10_cm_common.c    | 93 +++++++++++++++----
 1 file changed, 75 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
index 3538973bd0c6..04b2e04b68f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
@@ -349,20 +349,37 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
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
 
-		region_start = -10;
-		region_end = 1;
 	}
 
 	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
@@ -375,16 +392,56 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 
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
2.40.1

