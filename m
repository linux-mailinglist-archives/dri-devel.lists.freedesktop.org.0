Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96F9D712A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512410E526;
	Sun, 24 Nov 2024 13:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qabG87gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C565610E525;
 Sun, 24 Nov 2024 13:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86BA45C5652;
 Sun, 24 Nov 2024 13:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB18C4CED3;
 Sun, 24 Nov 2024 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455880;
 bh=Sr4dabF8+IetEmYJp2qvJEqjVxoX0ug+4ZvrdPjgQHc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qabG87gqj5o2FygC+SBQJrgZ2n0ZyxcTpu17otkA+TzJ8oH5FoI5ce5zaUUNfZ7kR
 MC5zbUMRiGLtjwjgAiYg/8dHbq653A59/PwtWAx2bqasTDIIfvMZCl+ILM7ZHmUtyZ
 xy7cb3OZeV3fXjOtH3GR9O3V4+Aw/B3wGTAY8FsDhg9AHjdBDP1kg0OWHaFCLy/aL1
 kAZu3B1JeHNowgMxxu7L14eytbStpCP6TVtFsCBPQVnblE6/kuf5PkFU6JBVtMTrkz
 6CcqAbFhbOVMKAAn5/cs2cNvDrR2J/Z8fKpF+qnxs9AJbY5v0zZ/m1YoyxcROa+JBY
 K4g3w6dejwaEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, hamza.mahfooz@amd.com, alex.hung@amd.com,
 chiahsuan.chung@amd.com, sunil.khatri@amd.com, aurabindo.pillai@amd.com,
 mwen@igalia.com, Wayne.Lin@amd.com, linux@treblig.org,
 nicholas.kazlauskas@amd.com, etbitnun@amd.com, dillon.varone@amd.com,
 ryanseto@amd.com, alvin.lee2@amd.com, Ilya.Bakoulin@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 65/87] drm/amd/display: Prune Invalid Modes For
 HDMI Output
Date: Sun, 24 Nov 2024 08:38:43 -0500
Message-ID: <20241124134102.3344326-65-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit abdd2768d7630bc8ec3403aea24f4197bada3c1f ]

[Why]
1. HDMI does not have 6 bpc support. Having 6 bpc pass validation
does not comply with spec.
2. Validate 420 only for native HDMI, but not apply to pcon use
case.
3. Current mode validation log is not readable.

[how]
1. Cap 8 bpc for dp-hdmi converter.
2. Validate yuv420 for pcon use case as well,
   if rgb/yuv444 8bpc cannot fit into pcon bw limitation of
   the link from the converter to HDMI sink.
3. Add readable pixel_format and color_depth into debug log.

Reviewed-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++---
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 40 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  6 +--
 .../gpu/drm/amd/display/dc/inc/core_status.h  |  2 +
 4 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 90df415ece0bf..23b19821459f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7295,10 +7295,15 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 	const struct drm_connector_state *drm_state = dm_state ? &dm_state->base : NULL;
 	int requested_bpc = drm_state ? drm_state->max_requested_bpc : 8;
 	enum dc_status dc_result = DC_OK;
+	uint8_t bpc_limit = 6;
 
 	if (!dm_state)
 		return NULL;
 
+	if (aconnector->dc_link->connector_signal == SIGNAL_TYPE_HDMI_TYPE_A ||
+	    aconnector->dc_link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER)
+		bpc_limit = 8;
+
 	do {
 		stream = create_stream_for_sink(connector, drm_mode,
 						dm_state, old_stream,
@@ -7319,11 +7324,12 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 			dc_result = dm_validate_stream_and_context(adev->dm.dc, stream);
 
 		if (dc_result != DC_OK) {
-			DRM_DEBUG_KMS("Mode %dx%d (clk %d) failed DC validation with error %d (%s)\n",
+			DRM_DEBUG_KMS("Mode %dx%d (clk %d) pixel_encoding:%s color_depth:%s failed validation -- %s\n",
 				      drm_mode->hdisplay,
 				      drm_mode->vdisplay,
 				      drm_mode->clock,
-				      dc_result,
+				      dc_pixel_encoding_to_str(stream->timing.pixel_encoding),
+				      dc_color_depth_to_str(stream->timing.display_color_depth),
 				      dc_status_to_str(dc_result));
 
 			dc_stream_release(stream);
@@ -7331,10 +7337,13 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 			requested_bpc -= 2; /* lower bpc to retry validation */
 		}
 
-	} while (stream == NULL && requested_bpc >= 6);
+	} while (stream == NULL && requested_bpc >= bpc_limit);
 
-	if (dc_result == DC_FAIL_ENC_VALIDATE && !aconnector->force_yuv420_output) {
-		DRM_DEBUG_KMS("Retry forcing YCbCr420 encoding\n");
+	if ((dc_result == DC_FAIL_ENC_VALIDATE ||
+	     dc_result == DC_EXCEED_DONGLE_CAP) &&
+	     !aconnector->force_yuv420_output) {
+		DRM_DEBUG_KMS("%s:%d Retry forcing yuv420 encoding\n",
+				     __func__, __LINE__);
 
 		aconnector->force_yuv420_output = true;
 		stream = create_validate_stream_for_sink(aconnector, drm_mode,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 801cdbc8117d9..e255c204b7e85 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -434,3 +434,43 @@ char *dc_status_to_str(enum dc_status status)
 
 	return "Unexpected status error";
 }
+
+char *dc_pixel_encoding_to_str(enum dc_pixel_encoding pixel_encoding)
+{
+	switch (pixel_encoding) {
+	case PIXEL_ENCODING_RGB:
+		return "RGB";
+	case PIXEL_ENCODING_YCBCR422:
+		return "YUV422";
+	case PIXEL_ENCODING_YCBCR444:
+		return "YUV444";
+	case PIXEL_ENCODING_YCBCR420:
+		return "YUV420";
+	default:
+		return "Unknown";
+	}
+}
+
+char *dc_color_depth_to_str(enum dc_color_depth color_depth)
+{
+	switch (color_depth) {
+	case COLOR_DEPTH_666:
+		return "6-bpc";
+	case COLOR_DEPTH_888:
+		return "8-bpc";
+	case COLOR_DEPTH_101010:
+		return "10-bpc";
+	case COLOR_DEPTH_121212:
+		return "12-bpc";
+	case COLOR_DEPTH_141414:
+		return "14-bpc";
+	case COLOR_DEPTH_161616:
+		return "16-bpc";
+	case COLOR_DEPTH_999:
+		return "9-bpc";
+	case COLOR_DEPTH_111111:
+		return "11-bpc";
+	default:
+		return "Unknown";
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 9a406d74c0dd7..3d93efdc1026d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -819,12 +819,12 @@ void dc_stream_log(const struct dc *dc, const struct dc_stream_state *stream)
 			stream->dst.height,
 			stream->output_color_space);
 	DC_LOG_DC(
-			"\tpix_clk_khz: %d, h_total: %d, v_total: %d, pixelencoder:%d, displaycolorDepth:%d\n",
+			"\tpix_clk_khz: %d, h_total: %d, v_total: %d, pixel_encoding:%s, color_depth:%s\n",
 			stream->timing.pix_clk_100hz / 10,
 			stream->timing.h_total,
 			stream->timing.v_total,
-			stream->timing.pixel_encoding,
-			stream->timing.display_color_depth);
+			dc_pixel_encoding_to_str(stream->timing.pixel_encoding),
+			dc_color_depth_to_str(stream->timing.display_color_depth));
 	DC_LOG_DC(
 			"\tlink: %d\n",
 			stream->link->link_index);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_status.h b/drivers/gpu/drm/amd/display/dc/inc/core_status.h
index fa5edd03d0043..b5afd8c3103db 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_status.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_status.h
@@ -60,5 +60,7 @@ enum dc_status {
 };
 
 char *dc_status_to_str(enum dc_status status);
+char *dc_pixel_encoding_to_str(enum dc_pixel_encoding pixel_encoding);
+char *dc_color_depth_to_str(enum dc_color_depth color_depth);
 
 #endif /* _CORE_STATUS_H_ */
-- 
2.43.0

