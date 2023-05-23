Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCC70E8D8
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831A910E51F;
	Tue, 23 May 2023 22:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A2710E510;
 Tue, 23 May 2023 22:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7xMgvgp4s+MMNIL58uCUfKiYthomMYuXo5NXhxkwRkE=; b=Iomv5nk7NeO4oS2E2+i1WXOLax
 +gqwI/Vetlr53CS1rplUIzIweR2jcGFnfE6BRbJxmTCX2Dp14fkj95OHYwM3FXZokgJzMcf0VUAOD
 +whxtNyM8GKG3FmNlP43kA+xxx2MtkkHgy7QYjmbBPy9FaMKfLJ3smj9W5YDzNupIP6ZAyC7+L8VE
 JLCqm+frrzDDNTBp0W1XslrNajiyHfCfR1Aixh2gBKjtYpnjG7qW4Rh75h3HQJWblX3BgV5fo5zMw
 wQv5CK4chqCWUgxsDC6qiHXlvTu1/qMyTXxO+ay/VNUR7q5KVctllky3bVtD6JwguZfVBgxyWYFGq
 Mw8SlEqQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIL-00HEOv-W8; Wed, 24 May 2023 00:15:54 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 20/36] drm/amd/display: dynamically acquire 3DLUT resources
 for color changes
Date: Tue, 23 May 2023 21:15:04 -0100
Message-Id: <20230523221520.3115570-21-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

dc_acquire_release_mpc_3dlut_for_ctx initializes the bits required to
program 3DLUT in DC MPC hw block, applied in set_output_transfer_func().
Since acquire/release can fail, we should check resources availability
during atomic check considering the new context created. We dynamically
acquire 3D LUT resources when we actually use them, so we don't limit
ourselves with the stream count.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 55 ++++++++++++++++++-
 .../amd/display/dc/dcn301/dcn301_resource.c   | 26 ++++++++-
 4 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fc5b9a25e22f..0be62fe436b0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9410,7 +9410,12 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	 */
 	if (dm_new_crtc_state->base.color_mgmt_changed ||
 	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
-		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
+		if (!dm_state) {
+			ret = dm_atomic_get_state(state, &dm_state);
+			if (ret)
+				goto fail;
+		}
+		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state, dm_state->context);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ac430a23d3e1..e5f9db5a43f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -875,7 +875,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
 void amdgpu_dm_init_color_mod(void);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
-int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
+int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
+				     struct dc_state *ctx);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index fe03f1ec326e..161807e19886 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -364,6 +364,49 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+/* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
+ * interface
+ * @dc: Display Core control structure
+ * @ctx: new DC state information
+ * @stream: DC stream state to set shaper LUT and 3D LUT
+ * @drm_shaper_lut: DRM CRTC (user) shaper LUT
+ * @drm_shaper_size: size of shaper LUT
+ * @drm_lut3d: DRM CRTC (user) 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ *
+ * Returns:
+ * 0 on success.
+ */
+static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
+					 struct dc_state *ctx,
+					 struct dc_stream_state *stream,
+					 const struct drm_color_lut *drm_shaper_lut,
+					 uint32_t drm_shaper_size,
+					 const struct drm_color_lut *drm_lut3d,
+					 uint32_t drm_lut3d_size)
+{
+	struct dc_3dlut *lut3d_func;
+	struct dc_transfer_func *func_shaper;
+	bool acquire = drm_shaper_size || drm_lut3d_size;
+
+	lut3d_func = (struct dc_3dlut *)stream->lut3d_func;
+	func_shaper = (struct dc_transfer_func *)stream->func_shaper;
+
+	ASSERT((lut3d_func && func_shaper) || (!lut3d_func && !func_shaper));
+	if ((acquire && !lut3d_func && !func_shaper) ||
+	    (!acquire && lut3d_func && func_shaper))
+	{
+		if (!dc_acquire_release_mpc_3dlut_for_ctx(dc, acquire, ctx, stream,
+							  &lut3d_func, &func_shaper))
+			return DC_ERROR_UNEXPECTED;
+	}
+
+	stream->func_shaper = func_shaper;
+	stream->lut3d_func = lut3d_func;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
  * @crtc_state: the DRM CRTC state
@@ -403,6 +446,7 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
+ * @ctx: new DC state information
  *
  * With no plane level color management properties we're free to use any
  * of the HW blocks as long as the CRTC CTM always comes before the
@@ -422,7 +466,8 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
  * Returns:
  * 0 on success. Error code if setup fails.
  */
-int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
+int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
+				     struct dc_state *ctx)
 {
 	struct dc_stream_state *stream = crtc->stream;
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
@@ -481,6 +526,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else {
+		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
+						  NULL, 0, NULL, 0);
+		if (r)
+			return r;
+		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
+		 * See params and set_output_gamma in
+		 * dcn30_set_output_transfer_func()
+		 */
 		regamma_size = has_regamma ? regamma_size : 0;
 		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
 						 regamma_size, has_rom);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index 5ac2a272c380..a6d6fcaaca1c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -1258,6 +1258,30 @@ static struct display_stream_compressor *dcn301_dsc_create(
 	return &dsc->base;
 }
 
+static enum dc_status
+dcn301_remove_stream_from_ctx(struct dc *dc,
+			      struct dc_state *new_ctx,
+			      struct dc_stream_state *dc_stream)
+{
+	struct dc_3dlut *lut3d_func;
+	struct dc_transfer_func *func_shaper;
+
+	lut3d_func = (struct dc_3dlut *)dc_stream->lut3d_func;
+	func_shaper = (struct dc_transfer_func *)dc_stream->func_shaper;
+
+	ASSERT((lut3d_func && func_shaper) || (!lut3d_func && !func_shaper));
+	if (lut3d_func && func_shaper)
+	{
+		if (!dc_acquire_release_mpc_3dlut_for_ctx(dc, false, new_ctx, dc_stream,
+							&lut3d_func, &func_shaper))
+			return DC_ERROR_UNEXPECTED;
+	}
+
+	dc_stream->lut3d_func = lut3d_func;
+	dc_stream->func_shaper = func_shaper;
+
+	return dcn20_remove_stream_from_ctx(dc, new_ctx, dc_stream);
+}
 
 static void dcn301_destroy_resource_pool(struct resource_pool **pool)
 {
@@ -1406,7 +1430,7 @@ static struct resource_funcs dcn301_res_pool_funcs = {
 	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
 	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
 	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
-	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.remove_stream_from_ctx = dcn301_remove_stream_from_ctx,
 	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
 	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
 	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
-- 
2.39.2

