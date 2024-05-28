Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF58D1A55
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80C10E196;
	Tue, 28 May 2024 11:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZNC4Ir/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEF010E196;
 Tue, 28 May 2024 11:53:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19EDF6203D;
 Tue, 28 May 2024 11:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F4CC3277B;
 Tue, 28 May 2024 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716897192;
 bh=bKf/VdtSEftKO+AsBfiSV+8sd0HFatxAnVyEq6Z9M4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZNC4Ir/ejdbgc2zVSO/0Euynl1TfeqW5N696yFBfT4dDcfip39yX6QPxJ00TUJkOs
 FMKCvdE/BRkbuMtBFRaiKCpJksPsttWGzlM3JWobwTb2rvWk/1IKoqk6VxuW0KQ3aH
 wucoYK4mgGr8xqlOaxB6Rb4wPz0tLLtwwmy6vkkne/5rGzBGs9V9UZUyYU5pd77DYj
 gzZYpDXDnw1+GiB3amV4PGKRV28a5qg2yZd0KNq+EDTUC0/xhSKJoxj5s4uBqBobP3
 wB+KuFc7U6qxbgWHlLbcJ9ae7st066GhtOW8AisHRGtHtJ4Vmayq9f4hK2WO8EpnLL
 zH9c5MICNwbyQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Charlene Liu <charlene.liu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Sung Joon Kim <sungkim@amd.com>, Taimur Hassan <syed.hassan@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Swapnil Patel <swapnil.patel@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/amd/display: Move 'struct scaler_data' off stack
Date: Tue, 28 May 2024 13:51:21 +0200
Message-Id: <20240528115146.2870032-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528115146.2870032-1-arnd@kernel.org>
References: <20240528115146.2870032-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The scaler_data structure is implicitly copied onto the stack twice by
being returned from a function. This is usually a bad idea, but it
was not flagged by the compiler until a recent addition that pushed
it over the 1024 byte function stack limit:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c: In function 'populate_dml_plane_cfg_from_plane_state':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.c:1075:1: error: the frame size of 1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Use an explicit kzalloc() and memcpy() instead here to keep it off the
stack.

Fixes: 00c391102abc ("drm/amd/display: Add misc DC changes for DCN401")
Fixes: 7966f319c66d ("drm/amd/display: Introduce DML2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../display/dc/dml2/dml2_translation_helper.c | 56 ++++++++++---------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 705985d3f407..c04ebf5434c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -927,7 +927,7 @@ static void populate_dml_surface_cfg_from_plane_state(enum dml_project_id dml2_p
 	}
 }
 
-static struct scaler_data get_scaler_data_for_plane(const struct dc_plane_state *in, struct dc_state *context)
+static void get_scaler_data_for_plane(const struct dc_plane_state *in, struct dc_state *context, struct scaler_data *out)
 {
 	int i;
 	struct pipe_ctx *temp_pipe = &context->res_ctx.temp_pipe;
@@ -948,7 +948,7 @@ static struct scaler_data get_scaler_data_for_plane(const struct dc_plane_state
 	}
 
 	ASSERT(i < MAX_PIPES);
-	return temp_pipe->plane_res.scl_data;
+	memcpy(out, &temp_pipe->plane_res.scl_data, sizeof(*out));
 }
 
 static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_stream_state *in)
@@ -1007,27 +1007,31 @@ static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned
 
 static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_plane_state *in, struct dc_state *context)
 {
-	const struct scaler_data scaler_data = get_scaler_data_for_plane(in, context);
+	struct scaler_data *scaler_data = kzalloc(sizeof(*scaler_data), GFP_KERNEL);
+	if (!scaler_data)
+		return;
+
+	get_scaler_data_for_plane(in, context, scaler_data);
 
 	out->CursorBPP[location] = dml_cur_32bit;
 	out->CursorWidth[location] = 256;
 
 	out->GPUVMMinPageSizeKBytes[location] = 256;
 
-	out->ViewportWidth[location] = scaler_data.viewport.width;
-	out->ViewportHeight[location] = scaler_data.viewport.height;
-	out->ViewportWidthChroma[location] = scaler_data.viewport_c.width;
-	out->ViewportHeightChroma[location] = scaler_data.viewport_c.height;
-	out->ViewportXStart[location] = scaler_data.viewport.x;
-	out->ViewportYStart[location] = scaler_data.viewport.y;
-	out->ViewportXStartC[location] = scaler_data.viewport_c.x;
-	out->ViewportYStartC[location] = scaler_data.viewport_c.y;
+	out->ViewportWidth[location] = scaler_data->viewport.width;
+	out->ViewportHeight[location] = scaler_data->viewport.height;
+	out->ViewportWidthChroma[location] = scaler_data->viewport_c.width;
+	out->ViewportHeightChroma[location] = scaler_data->viewport_c.height;
+	out->ViewportXStart[location] = scaler_data->viewport.x;
+	out->ViewportYStart[location] = scaler_data->viewport.y;
+	out->ViewportXStartC[location] = scaler_data->viewport_c.x;
+	out->ViewportYStartC[location] = scaler_data->viewport_c.y;
 	out->ViewportStationary[location] = false;
 
-	out->ScalerEnabled[location] = scaler_data.ratios.horz.value != dc_fixpt_one.value ||
-				scaler_data.ratios.horz_c.value != dc_fixpt_one.value ||
-				scaler_data.ratios.vert.value != dc_fixpt_one.value ||
-				scaler_data.ratios.vert_c.value != dc_fixpt_one.value;
+	out->ScalerEnabled[location] = scaler_data->ratios.horz.value != dc_fixpt_one.value ||
+				scaler_data->ratios.horz_c.value != dc_fixpt_one.value ||
+				scaler_data->ratios.vert.value != dc_fixpt_one.value ||
+				scaler_data->ratios.vert_c.value != dc_fixpt_one.value;
 
 	/* Current driver code base uses LBBitPerPixel as 57. There is a discrepancy
 	 * from the HW/DML teams about this value. Initialize LBBitPerPixel with the
@@ -1043,25 +1047,25 @@ static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out
 		out->VRatioChroma[location] = 1;
 	} else {
 		/* Follow the original dml_wrapper.c code direction to fix scaling issues */
-		out->HRatio[location] = (dml_float_t)scaler_data.ratios.horz.value / (1ULL << 32);
-		out->HRatioChroma[location] = (dml_float_t)scaler_data.ratios.horz_c.value / (1ULL << 32);
-		out->VRatio[location] = (dml_float_t)scaler_data.ratios.vert.value / (1ULL << 32);
-		out->VRatioChroma[location] = (dml_float_t)scaler_data.ratios.vert_c.value / (1ULL << 32);
+		out->HRatio[location] = (dml_float_t)scaler_data->ratios.horz.value / (1ULL << 32);
+		out->HRatioChroma[location] = (dml_float_t)scaler_data->ratios.horz_c.value / (1ULL << 32);
+		out->VRatio[location] = (dml_float_t)scaler_data->ratios.vert.value / (1ULL << 32);
+		out->VRatioChroma[location] = (dml_float_t)scaler_data->ratios.vert_c.value / (1ULL << 32);
 	}
 
-	if (!scaler_data.taps.h_taps) {
+	if (!scaler_data->taps.h_taps) {
 		out->HTaps[location] = 1;
 		out->HTapsChroma[location] = 1;
 	} else {
-		out->HTaps[location] = scaler_data.taps.h_taps;
-		out->HTapsChroma[location] = scaler_data.taps.h_taps_c;
+		out->HTaps[location] = scaler_data->taps.h_taps;
+		out->HTapsChroma[location] = scaler_data->taps.h_taps_c;
 	}
-	if (!scaler_data.taps.v_taps) {
+	if (!scaler_data->taps.v_taps) {
 		out->VTaps[location] = 1;
 		out->VTapsChroma[location] = 1;
 	} else {
-		out->VTaps[location] = scaler_data.taps.v_taps;
-		out->VTapsChroma[location] = scaler_data.taps.v_taps_c;
+		out->VTaps[location] = scaler_data->taps.v_taps;
+		out->VTapsChroma[location] = scaler_data->taps.v_taps_c;
 	}
 
 	out->SourceScan[location] = (enum dml_rotation_angle)in->rotation;
@@ -1072,6 +1076,8 @@ static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out
 	out->DynamicMetadataTransmittedBytes[location] = 0;
 
 	out->NumberOfCursors[location] = 1;
+
+	kfree(scaler_data);
 }
 
 static unsigned int map_stream_to_dml_display_cfg(const struct dml2_context *dml2,
-- 
2.39.2

