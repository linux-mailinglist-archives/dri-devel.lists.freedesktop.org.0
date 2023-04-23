Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E045E6EC01B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412E210E3FB;
	Sun, 23 Apr 2023 14:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9683210E3F6;
 Sun, 23 Apr 2023 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TkoBdE0X3JiudIF9hpBBDC0wbNFTzIx5OXQ++chrLeo=; b=K7t8DRab4ba2O6sQ8flMCap/jg
 MbIBrWb2oJRrYL+zIaN6wsWzQKvFw3XPIMbWoR+ft1KLS8AC16xbBEVtcZqZ29N3ACQz29GOCaSr8
 XibuFKF/stNWtQ8BBdo8HQXPcdOtOMuQu3W4Fkaf4s8WD5Iob0R3wZaMn8UeTQz0I7qRWFI0ILxZw
 5UtY8Onr6TcbCuX2HPs0tPcGSh08858GNfxfXTvuzmNzV2unIuLOtpMdZ4b9IY2Zks5SFvAY1HKb2
 ulgAF8P7luDZi6fvelSzxi3nAhfFnS+LTAVRSUUzFsUI/BARCZtZgageWILE2q46M1/xc3T6Ry2OY
 m7Z23uWA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaSt-00ANVs-1f; Sun, 23 Apr 2023 16:13:19 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 24/40] drm/amd/display: add CRTC 3D LUT support to amd
 color pipeline
Date: Sun, 23 Apr 2023 13:10:36 -0100
Message-Id: <20230423141051.702990-25-mwen@igalia.com>
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
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Map DRM CRTC 3D LUT in the atomic color mgmt pipeline to DC
(post-blending). 3D LUT works better in a non-linear color space,
therefore using a degamma to linearize the input space may produce
unexpected results. The next patch introduces shaper LUT support that
can be used to delinearize the color space before applying 3D LUT
conversion.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   5 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 185 +++++++++++++++---
 3 files changed, 174 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6b40e17892e5..760080e4a4da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9945,7 +9945,13 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			DRM_DEBUG_DRIVER("amdgpu_dm_verify_lut_sizes() failed\n");
 			goto fail;
 		}
-
+#ifdef CONFIG_STEAM_DECK
+		ret = amdgpu_dm_verify_lut3d_size(adev, new_crtc_state);
+		if (ret) {
+			DRM_DEBUG_DRIVER("amdgpu_dm_verify_lut_sizes() failed\n");
+			goto fail;
+		}
+#endif
 		if (!new_crtc_state->enable)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 5faf4fc87701..b9840c1f3cdf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -894,9 +894,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
+#ifdef CONFIG_STEAM_DECK
 /* 3D LUT max size is 17x17x17 */
 #define MAX_COLOR_3DLUT_ENTRIES 4913
 #define MAX_COLOR_3DLUT_BITDEPTH 12
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				const struct drm_crtc_state *crtc_state);
+#endif
+
 /* 1D LUT degamma, regamma and shaper*/
 #define MAX_COLOR_LUT_ENTRIES 4096
 /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 99b1738c98d3..25010fa19bc8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -332,6 +332,117 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 	return ret;
 }
 
+/**
+ * __set_input_tf - calculates the input transfer function based on expected
+ * input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut.
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
+static int __set_input_tf(struct dc_transfer_func *func,
+			  const struct drm_color_lut *lut, uint32_t lut_size)
+{
+	struct dc_gamma *gamma = NULL;
+	bool res;
+
+	gamma = dc_create_gamma();
+	if (!gamma)
+		return -ENOMEM;
+
+	gamma->type = GAMMA_CUSTOM;
+	gamma->num_entries = lut_size;
+
+	__drm_lut_to_dc_gamma(lut, gamma, false);
+
+	res = mod_color_calculate_degamma_params(NULL, func, gamma, true);
+	dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
+#ifdef CONFIG_STEAM_DECK
+static void __to_dc_lut3d_color(struct dc_rgb *rgb,
+				const struct drm_color_lut lut,
+				int bit_precision)
+{
+	rgb->red = drm_color_lut_extract(lut.red, bit_precision);
+	rgb->green = drm_color_lut_extract(lut.green, bit_precision);
+	rgb->blue  = drm_color_lut_extract(lut.blue, bit_precision);
+}
+
+static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
+				    uint32_t lut3d_size,
+				    struct tetrahedral_params *params,
+				    bool use_tetrahedral_9,
+				    int bit_depth)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_i, i;
+
+
+	if (use_tetrahedral_9) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+	}
+
+	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
+		/* We should consider the 3dlut RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The bit depth supported for 3dlut channel is
+		 * 12-bit, but DC also supports 10-bit.
+		 *
+		 * TODO: improve color pipeline API to enable the userspace set
+		 * bit depth and 3D LUT size/stride, as specified by VA-API.
+		 */
+		__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
+		__to_dc_lut3d_color(&lut1[lut_i], lut[i + 1], bit_depth);
+		__to_dc_lut3d_color(&lut2[lut_i], lut[i + 2], bit_depth);
+		__to_dc_lut3d_color(&lut3[lut_i], lut[i + 3], bit_depth);
+	}
+	/* lut0 has 1229 points (lut_size/4 + 1) */
+	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
+}
+
+/* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
+ * @drm_lut3d: DRM CRTC (user) 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map DRM CRTC 3D LUT to DC 3D LUT and all necessary bits to program it
+ * on DCN MPC accordingly.
+ */
+static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
+				   uint32_t drm_lut3d_size,
+				   struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+	} else {
+		/* Stride and bit depth are not programmable by API yet.
+		 * Therefore, only supports 17x17x17 3D LUT (12-bit).
+		 */
+		lut->lut_3d.use_tetrahedral_9 = false;
+		lut->lut_3d.use_12bits = true;
+		lut->state.bits.initialized = 1;
+		__drm_3dlut_to_dc_3dlut(drm_lut, drm_lut3d_size, &lut->lut_3d,
+					lut->lut_3d.use_tetrahedral_9,
+					MAX_COLOR_3DLUT_BITDEPTH);
+	}
+}
+
 /* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
  * interface
  * @dc: Display Core control structure
@@ -355,7 +466,7 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 {
 	struct dc_3dlut *lut3d_func;
 	struct dc_transfer_func *func_shaper;
-	bool acquire = drm_shaper_size && drm_lut3d_size;
+	bool acquire = drm_shaper_size || drm_lut3d_size;
 
 	lut3d_func = (struct dc_3dlut *)stream->lut3d_func;
 	func_shaper = (struct dc_transfer_func *)stream->func_shaper;
@@ -369,42 +480,56 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 			return DC_ERROR_UNEXPECTED;
 	}
 
-	stream->lut3d_func = lut3d_func;
 	stream->func_shaper = func_shaper;
+	stream->lut3d_func = lut3d_func;
+
+	if (!acquire)
+		return 0;
+
+	/* We don't get DRM shaper LUT yet. We assume the input color
+	 * space is already delinearized, so we don't need a shaper LUT
+	 * and we can just BYPASS.
+	 */
+	func_shaper->type = TF_TYPE_BYPASS;
+	func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
 
 	return 0;
 }
 
 /**
- * __set_input_tf - calculates the input transfer function based on expected
- * input space.
- * @func: transfer function
- * @lut: lookup table that defines the color space
- * @lut_size: size of respective lut.
+ * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if DRM 3D
+ * LUT matches the hw supported size
+ * @adev: amdgpu device
+ * @crtc_state: the DRM CRTC state
+ *
+ * Verifies if post-blending (MPC) 3D LUT is supported by the HW (DCN 3.0 or
+ * newer) and if the DRM 3D LUT matches the supported size.
  *
  * Returns:
- * 0 in case of success. -ENOMEM if fails.
+ * 0 on success. -EINVAL if lut size are invalid.
  */
-static int __set_input_tf(struct dc_transfer_func *func,
-			  const struct drm_color_lut *lut, uint32_t lut_size)
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				const struct drm_crtc_state *crtc_state)
 {
-	struct dc_gamma *gamma = NULL;
-	bool res;
+	const struct drm_color_lut *lut3d = NULL;
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc_state);
+	uint32_t exp_size, size;
 
-	gamma = dc_create_gamma();
-	if (!gamma)
-		return -ENOMEM;
+	exp_size = adev->dm.dc->caps.color.mpc.num_3dluts ?
+		   MAX_COLOR_3DLUT_ENTRIES : 0;
 
-	gamma->type = GAMMA_CUSTOM;
-	gamma->num_entries = lut_size;
-
-	__drm_lut_to_dc_gamma(lut, gamma, false);
+	lut3d = __extract_blob_lut(acrtc_state->lut3d, &size);
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, true);
-	dc_gamma_release(&gamma);
+	if (lut3d && size != exp_size) {
+		DRM_DEBUG_DRIVER("Invalid Gamma 3D LUT size. Should be %u but got %u.\n",
+				 exp_size, size);
+		return -EINVAL;
+	}
 
-	return res ? 0 : -ENOMEM;
+	return 0;
 }
+#endif
 
 /**
  * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
@@ -477,6 +602,16 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 	bool has_regamma, has_degamma;
 	bool is_legacy;
 	int r;
+#ifdef CONFIG_STEAM_DECK
+	const struct drm_color_lut *lut3d;
+	uint32_t lut3d_size;
+
+	r =  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
+	if (r)
+		return r;
+
+	lut3d = __extract_blob_lut(crtc->lut3d, &lut3d_size);
+#endif
 
 	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
 	if (r)
@@ -525,10 +660,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 		if (r)
 			return r;
 	} else {
+#ifdef CONFIG_STEAM_DECK
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
 		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
-						  NULL, 0, NULL, 0);
+						  NULL, 0,
+						  lut3d, lut3d_size);
 		if (r)
 			return r;
+#endif
 		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
 		 * See params and set_output_gamma in
 		 * dcn30_set_output_transfer_func()
-- 
2.39.2

