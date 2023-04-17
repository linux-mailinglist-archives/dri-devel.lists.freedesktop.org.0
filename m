Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0836E539A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584CF10E603;
	Mon, 17 Apr 2023 21:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F6F10E602;
 Mon, 17 Apr 2023 21:07:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 978E462A31;
 Mon, 17 Apr 2023 21:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DDFC4339C;
 Mon, 17 Apr 2023 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681765619;
 bh=bHRwsDaRRSk7HISz3NKNW1I5ChIQDDNVzcgEjzA2/xU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iaAe7VTNxZV5DOVrkbqD09VOv2a+wSaEaP6/Sacmck5wV6Xnmg8116TJwxIZ1VKmO
 agY/ZoxM1bKzX10vC+dTtis0OtvubRLyOewF7liRah+NTgp0ydv5hA0twy267VVLrM
 EH3ANysYrM0SORcyBcJ63Z6Mal/i2vgUNL/Z79ueoKl9ZgPbPFIyn6zXQStIoIpHlh
 ag8JXjQ123HbmIeUBE9b+qp3WizAQG2+yFEy4mYVvgULJ4jH9tFbVE6eV+7uASwipe
 +baOJymoze8c1egtXn/TcXZykHqgpK8iDOgRO3SrtewX32EfYaYIa+4l2Uv3vrX9EH
 Xa0vH6JR9TXGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/amd/display: fix missing=prototypes warnings
Date: Mon, 17 Apr 2023 23:05:43 +0200
Message-Id: <20230417210602.2614198-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417210602.2614198-1-arnd@kernel.org>
References: <20230417210602.2614198-1-arnd@kernel.org>
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, dri-devel@lists.freedesktop.org,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Alex Hung <alex.hung@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Three functions in the amdgpu display driver cause -Wmissing-prototype
warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1858:6: error: no previous prototype for 'is_timing_changed' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:210:6: error: no previous prototype for 'is_synaptics_cascaded_panamera' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: error: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Werror=missing-prototypes]

is_timing_changed() is actually meant to be a global symbol, but needs
a proper name and prototype, while the other two can just be made static.

Fixes: 54c7b715b5ef ("drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub")
Fixes: 17ce8a6907f7 ("drm/amd/display: Add dsc pre-validation in atomic check")
Fixes: 8f0d304d21b3 ("drm/amd/display: Do not commit pipe when updating DRR")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 ++---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 6 +++---
 drivers/gpu/drm/amd/display/dc/dc.h                         | 3 +++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 994ba426ca66..442511061178 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -45,8 +45,7 @@
 #endif
 
 #include "dc/dcn20/dcn20_resource.h"
-bool is_timing_changed(struct dc_stream_state *cur_stream,
-		       struct dc_stream_state *new_stream);
+
 #define PEAK_FACTOR_X1000 1006
 
 static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
@@ -1417,7 +1416,7 @@ int pre_validate_dsc(struct drm_atomic_state *state,
 		struct dc_stream_state *stream = dm_state->context->streams[i];
 
 		if (local_dc_state->streams[i] &&
-		    is_timing_changed(stream, local_dc_state->streams[i])) {
+		    dc_is_timing_changed(stream, local_dc_state->streams[i])) {
 			DRM_INFO_ONCE("crtc[%d] needs mode_changed\n", i);
 		} else {
 			int ind = find_crtc_index_in_state_by_stream(state, stream);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 85d54bfb595c..344533623cb9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1855,7 +1855,7 @@ bool dc_add_all_planes_for_stream(
 	return add_all_planes_for_stream(dc, stream, &set, 1, context);
 }
 
-bool is_timing_changed(struct dc_stream_state *cur_stream,
+bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
 		       struct dc_stream_state *new_stream)
 {
 	if (cur_stream == NULL)
@@ -1880,7 +1880,7 @@ static bool are_stream_backends_same(
 	if (stream_a == NULL || stream_b == NULL)
 		return false;
 
-	if (is_timing_changed(stream_a, stream_b))
+	if (dc_is_timing_changed(stream_a, stream_b))
 		return false;
 
 	if (stream_a->signal != stream_b->signal)
@@ -3505,7 +3505,7 @@ bool pipe_need_reprogram(
 	if (pipe_ctx_old->stream_res.stream_enc != pipe_ctx->stream_res.stream_enc)
 		return true;
 
-	if (is_timing_changed(pipe_ctx_old->stream, pipe_ctx->stream))
+	if (dc_is_timing_changed(pipe_ctx_old->stream, pipe_ctx->stream))
 		return true;
 
 	if (pipe_ctx_old->stream->dpms_off != pipe_ctx->stream->dpms_off)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 23ee63b98dcd..e7ab6cb3769b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2225,4 +2225,7 @@ void dc_process_dmub_dpia_hpd_int_enable(const struct dc *dc,
 /* Disable acc mode Interfaces */
 void dc_disable_accelerated_mode(struct dc *dc);
 
+bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
+		       struct dc_stream_state *new_stream);
+
 #endif /* DC_INTERFACE_H_ */
-- 
2.39.2

