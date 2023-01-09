Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C96628E1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1510E44A;
	Mon,  9 Jan 2023 14:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9010E43C;
 Mon,  9 Jan 2023 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HeVvASVwSPvTBBOKCtKle28VHGRGJ5Bf1epIXUPS7F8=; b=GybGvlWqfm6ovfBUhiN4m7QaBC
 yHuX0i7B2fggXdbV1+pVjWEQsWb0TktWrKmzjra1hUFrJDs6eE96WES99JfRnWQCl0F+/KCwwq2j7
 GKD5aBqcho/K+4Cxd83yHeqoVDtDIbydeZypcMhT3c/ymRGzJZ1K2ClwagI4jkb3Pf/M2n5jUY+wT
 E+iA9/x7RF/TX476mmK/Ft7sWH6Py8Bm/fsryd3cuVCnn5B2j6rV7eRDnHU7+XS69DTn7lumiTuey
 aO8Vz4vjJo5/GoCb3RVfI7LGvg6JwzELF1C7NzoylJysyMxyF+ZkQtuhrlQCWCCj0FjQS2D9Kv7NB
 Zm3+bUUw==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtO4-003TyM-6y; Mon, 09 Jan 2023 15:44:32 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 16/18] drm/amd/display: add user 3D LUT support to the
 amdgpu_dm color pipeline
Date: Mon,  9 Jan 2023 13:38:44 -0100
Message-Id: <20230109143846.1966301-17-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Map DRM 3D LUT in the atomic color mgmt pipeline to DC. 3D LUT works
better in a non-linear color space, therefore using a degamma to
linearize the input space may produce unexpected results. The next patch
introduces shaper LUT support that can be used to delinearize the color
space before applying 3D LUT conversion.

Note that there is no implicit sRGB degamma/regamma in the current
implementation for DRM atomic color mgmt. Atomic degamma/regamma 1D LUT
is applied considering a linear base.

For reference, see IGT test amdgpu/amd_color and commit
cf020d49b3c4 ("drm/amd/display: Rework CRTC color management")

dc_acquire_release_mpc_3dlut initializes the bits required to program
3DLUT in DC MPC hw block, that is applied by set_output_transfer_func().
I still need to double check the timing to acquire and release shaper
and 3D LUTs from the resource pool.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 189 ++++++++++++++++++
 3 files changed, 197 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b8638f0508b0..7aa41dd2143b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9704,6 +9704,12 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 		}
 
+		ret = amdgpu_dm_verify_lut3d_size(adev, new_crtc_state);
+		if (ret) {
+			DRM_DEBUG_DRIVER("amdgpu_dm_verify_lut_sizes() failed\n");
+			goto fail;
+		}
+
 		if (!new_crtc_state->enable)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 6f04719d0c1f..59ab1b8f7b05 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -786,6 +786,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
 void amdgpu_dm_init_color_mod(void);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				const struct drm_crtc_state *crtc_state);
 void amdgpu_dm_enable_lut3d_prop(struct amdgpu_display_manager *dm, struct drm_crtc *crtc);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c547957acd73..0fb1244c8aef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -413,6 +413,175 @@ void amdgpu_dm_enable_lut3d_prop(struct amdgpu_display_manager *dm, struct drm_c
 	drm_crtc_enable_lut3d(crtc, MAX_COLOR_LUT_ENTRIES, true);
 }
 
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
+ * @stream: DC stream state to set shaper LUT and 3D LUT
+ * @drm_lut3d: DRM CRTC (user) 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map DRM CRTC 3D LUT to DC 3D LUT and all necessary bits to program it
+ * on DCN MPC accordingly.
+ */
+static void amdgpu_dm_atomic_lut3d(struct dc_stream_state *stream,
+				   const struct drm_color_lut *drm_lut,
+				   uint32_t drm_lut3d_size,
+				   const struct drm_mode_lut3d_mode *mode,
+				   struct dc_3dlut *lut)
+{
+	int size = mode->lut_size * mode->lut_size * mode->lut_size;
+
+	ASSERT(lut && drm_lut3d_size == size);
+
+	/* Stride and bit depth is not programmable by API so far. Therefore,
+	 * only supports 17x17x17 3D LUT with 12-bit.
+	 */
+	lut->lut_3d.use_tetrahedral_9 = mode->lut_size == 9;
+	lut->lut_3d.use_12bits = mode->bit_depth == 12;
+	lut->state.bits.initialized = 1;
+
+	__drm_3dlut_to_dc_3dlut(drm_lut, size, &lut->lut_3d,
+				lut->lut_3d.use_tetrahedral_9, mode->bit_depth);
+
+	stream->lut3d_func = lut;
+}
+
+/* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
+ * interface
+ * @dc: Display Core control structure
+ * @stream: DC stream state to set shaper LUT and 3D LUT
+ * @drm_lut3d: DRM CRTC (user) 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ *
+ * Returns:
+ * 0 on success.
+ */
+static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
+					 struct dc_stream_state *stream,
+					 const struct drm_color_lut *drm_lut3d,
+					 uint32_t drm_lut3d_size,
+					 const struct drm_mode_lut3d_mode *mode)
+{
+	struct dc_3dlut *lut3d_func_new;
+	struct dc_transfer_func *func_shaper_new;
+
+	lut3d_func_new = (struct dc_3dlut *) stream->lut3d_func;
+	func_shaper_new = (struct dc_transfer_func *) stream->func_shaper;
+
+	/* We don't get DRM shaper LUT yet. We assume the input color space is
+	 * already delinearized, so we don't need a shaper LUT and we can just
+	 * BYPASS.
+	 */
+	func_shaper_new->type = TF_TYPE_BYPASS;
+	func_shaper_new->tf = TRANSFER_FUNCTION_LINEAR;
+	stream->func_shaper = func_shaper_new;
+
+	amdgpu_dm_atomic_lut3d(stream, drm_lut3d, drm_lut3d_size,
+			       mode, lut3d_func_new);
+
+	return 0;
+}
+
+static const struct drm_mode_lut3d_mode *
+get_lut3d_mode(struct amdgpu_device *adev,
+	       const struct drm_crtc_state *crtc_state)
+{
+	struct drm_property_blob *blob;
+
+	if (!has_mpc_lut3d_caps(&adev->dm))
+		return NULL;
+
+	blob =  drm_property_lookup_blob(crtc_state->state->dev,
+					 crtc_state->lut3d_mode);
+
+	return blob ? (const struct drm_mode_lut3d_mode *)blob->data : NULL;
+}
+
+/**
+ * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if DRM 3D
+ * LUT matches the hw supported size
+ * @adev: amdgpu device
+ * @crtc_state: the DRM CRTC state
+ *
+ * Verifies if post-blending (MPC) 3D LUT is supported by the HW (DCN 3.0 or
+ * newer) and if the DRM 3D LUT matches the supported size.
+ *
+ * Returns:
+ * 0 on success. -EINVAL if lut size are invalid.
+ */
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				const struct drm_crtc_state *crtc_state)
+{
+	const struct drm_color_lut *lut3d = NULL;
+	const struct drm_mode_lut3d_mode *mode;
+	uint32_t exp_size, size;
+
+	mode = get_lut3d_mode(adev, crtc_state);
+	exp_size = mode ? mode->lut_size * mode->lut_size * mode->lut_size : 0;
+
+	lut3d = __extract_blob_lut(crtc_state->lut3d, &size);
+
+	if (lut3d && size != exp_size) {
+		DRM_DEBUG_DRIVER("Invalid Gamma 3D LUT size. Should be %u but got %u.\n",
+				 exp_size, size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
@@ -442,8 +611,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
 	struct drm_color_ctm *ctm = NULL;
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
+	const struct drm_color_lut *lut3d;
 	uint32_t degamma_size, regamma_size;
+	uint32_t lut3d_size;
 	bool has_regamma, has_degamma;
+	bool has_lut3d;
 	bool is_legacy;
 	int r;
 
@@ -451,12 +623,19 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	if (r)
 		return r;
 
+	r =  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
+	if (r)
+		return r;
+
 	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
+	lut3d = __extract_blob_lut(crtc->base.lut3d, &lut3d_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
 
 	has_degamma =
 		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
 
+	has_lut3d = lut3d != NULL;
+
 	has_regamma =
 		regamma_lut && !__is_lut_linear(regamma_lut, regamma_size);
 
@@ -494,6 +673,16 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		if (r)
 			return r;
 	} else {
+		if (has_lut3d) {
+			r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, stream, lut3d, lut3d_size,
+							  get_lut3d_mode(adev, &crtc->base));
+			if (r)
+				return r;
+		}
+		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
+		 * See params and set_output_gamma in
+		 * dcn30_set_output_transfer_func()
+		 */
 		regamma_size = has_regamma ? regamma_size : 0;
 		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut, regamma_size);
 		if (r)
-- 
2.35.1

