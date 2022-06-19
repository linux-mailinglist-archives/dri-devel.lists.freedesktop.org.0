Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF8550D7B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 00:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DDD10E3CD;
	Sun, 19 Jun 2022 22:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6462010E3CD;
 Sun, 19 Jun 2022 22:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SxhspAKE7SzQn5FJuFHB9m9JcLfDn2Aj35mp7jzgkM0=; b=DU/dQCJtGW7lm5B02H3kt4PsAS
 cMeCaDGoEMyjfdPToEhpjb8RB1O7ZnhvOSE6rdx9La4hjwLAjnagbDTbyU0HA8RyDbmlWGBxHZqYo
 jDI8xshR+7VOqCNNdOvUzppxu/aM46pmzKfMFrHQbF1Aov0uz1ACRHp11pTQhYme+RK8trKaz7V3m
 KQ41BvNvOrzMKPFmaq9yfkhJ3HsxnillhToe6p6eloO4A6EwbPt0cMn+sFD1XUKjI9+wqbGbtx3/I
 zqAq1lG2o5e34V6EW3eH8TuHB3Q3Dj8MBbwF+U/JcMlL0g+Ur4/sSb44neBHe1IE0R2/l9Pj+EksQ
 Efq7ZEag==;
Received: from [195.77.82.244] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o33UH-005lHy-G6; Mon, 20 Jun 2022 00:33:47 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [RFC PATCH 5/5] drm/amd/display: mapping new DRM 3D LUT properties to
 AMD hw blocks
Date: Sun, 19 Jun 2022 21:31:04 -0100
Message-Id: <20220619223104.667413-6-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619223104.667413-1-mwen@igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After adding 3D LUT (and shaper LUT) to DRM CRTC color management
properties, map shaper lut and 3d lut properties to MPC blocks if DC hw
is capable to handle 3dlut after-blending. In this case, the property
only applies to DCN 3 family, as DCN 2 only has 3D support pre-blending
and should be exposed by a DRM per-plane property in the future.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 153 +++++++++++++++---
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   4 +-
 4 files changed, 137 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 06da4f2ed7ad..02ed3991a803 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11221,7 +11221,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			dm_old_crtc_state->dsc_force_changed == false)
 			continue;
 
-		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
+		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state, adev);
 		if (ret) {
 			DRM_DEBUG_DRIVER("amdgpu_dm_verify_lut_sizes() failed\n");
 			goto fail;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 8fd1be7f2583..205503f12d87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -721,9 +721,10 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 #define MAX_COLOR_LUT_ENTRIES 4096
 /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
+#define COLOR_3DLUT_ENTRIES 17
 
 void amdgpu_dm_init_color_mod(void);
-int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state, struct amdgpu_device *adev);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1f4a7c908587..d22396976c7a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -210,6 +210,45 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 	}
 }
 
+static void __to_dc_lut3d_color(struct dc_rgb *rgb,
+				const struct drm_color_lut lut,
+				int bit_precision)
+{
+	rgb->red = drm_color_lut_extract(lut.red, 12);
+	rgb->green = drm_color_lut_extract(lut.green, 12);
+	rgb->blue  = drm_color_lut_extract(lut.blue, 12);
+
+}
+
+static void __drm_lut3d_to_dc_lut3d(const struct drm_color_lut *lut,
+				    struct dc_3dlut *lut3d)
+{
+        int lut3d_size = COLOR_3DLUT_ENTRIES*COLOR_3DLUT_ENTRIES*COLOR_3DLUT_ENTRIES;
+	int lutn_size = (lut3d_size - 1)/4 + 1;
+	int i;
+
+	ASSERT(lut3d && lut3d_size == MAX_COLOR_LUT_ENTRIES);
+
+	/* So far, only supports 17x17x17 3D LUT with 12-bit*/
+	lut3d->lut_3d.use_tetrahedral_9 = false;
+	lut3d->lut_3d.use_12bits = true;
+
+	for (i = 0; i < lutn_size - 1 ; i++) {
+		/* We should consider the 3dlut RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The max bit precision supported for 3dlut
+		 * channel is 12-bit, but can be 10-bit. Still need to verify
+		 * where it is setup */
+		__to_dc_lut3d_color(&lut3d->lut_3d.tetrahedral_17.lut0[i], lut[i], 12);
+		__to_dc_lut3d_color(&lut3d->lut_3d.tetrahedral_17.lut1[i], lut[i+lutn_size], 12);
+		__to_dc_lut3d_color(&lut3d->lut_3d.tetrahedral_17.lut2[i], lut[i+lutn_size*2], 12);
+		__to_dc_lut3d_color(&lut3d->lut_3d.tetrahedral_17.lut3[i], lut[i+lutn_size*3], 12);
+	}
+
+	/* lut0 goes to lutn_size == 1229 */
+	__to_dc_lut3d_color(&lut3d->lut_3d.tetrahedral_17.lut0[i], lut[i], 12);
+};
+
 /**
  * __set_legacy_tf - Calculates the legacy transfer function
  * @func: transfer function
@@ -335,7 +374,20 @@ static int __set_input_tf(struct dc_transfer_func *func,
 }
 
 /**
- * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
+ * amdgpu_dm_3dlut_size - get expected size according to hw color caps
+ * @lut_size: default size
+ * @adev: amdgpu device
+ *
+ * Return:
+ * lut_size if 3dlut is supported, zero otherwise
+ */
+static int amdgpu_dm_3dlut_size(int lut_size, struct amdgpu_device *adev)
+{
+	return adev->dm.dc->caps.color.mpc.num_3dluts ? lut_size : 0;
+}
+
+/**
+ * amdgpu_dm_verify_lut_sizes
  * @crtc_state: the DRM CRTC state
  * @adev: amdgpu device
  *
@@ -346,10 +398,11 @@ static int __set_input_tf(struct dc_transfer_func *func,
  * 0 on success.
  * -EINVAL if any lut sizes are invalid.
  */
-int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state,
+			       struct amdgpu_device *adev)
 {
 	const struct drm_color_lut *lut = NULL;
-	uint32_t size = 0;
+	uint32_t size = 0, exp_size;
 
 	lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
 	if (lut && size != MAX_COLOR_LUT_ENTRIES) {
@@ -359,6 +412,24 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 		return -EINVAL;
 	}
 
+	lut = __extract_blob_lut(crtc_state->shaper_lut, &size);
+	exp_size = amdgpu_dm_3dlut_size(MAX_COLOR_LUT_ENTRIES, adev);
+	if (lut && size != exp_size) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Shaper LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
+	lut = __extract_blob_lut(crtc_state->lut3d, &size);
+	exp_size = amdgpu_dm_3dlut_size(COLOR_3DLUT_ENTRIES, adev);
+	if (lut && size != exp_size) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Gamma 3D LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
 	lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
 	if (lut && size != MAX_COLOR_LUT_ENTRIES &&
 	    size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
@@ -401,17 +472,19 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
 	struct drm_color_ctm *ctm = NULL;
-	const struct drm_color_lut *degamma_lut, *regamma_lut;
-	uint32_t degamma_size, regamma_size;
-	bool has_regamma, has_degamma;
+	const struct drm_color_lut *degamma_lut, *shaper_lut, *lut3d, *regamma_lut;
+	uint32_t degamma_size, regamma_size, shaper_size, lut3d_size;
+	bool has_regamma, has_degamma, has_lut3d, has_shaper_lut;
 	bool is_legacy;
 	int r;
 
-	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
+	r = amdgpu_dm_verify_lut_sizes(&crtc->base, adev);
 	if (r)
 		return r;
 
 	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
+	shaper_lut =  __extract_blob_lut(crtc->base.shaper_lut, &shaper_size);
+	lut3d = __extract_blob_lut(crtc->base.lut3d, &lut3d_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
 
 	has_degamma =
@@ -420,6 +493,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	has_regamma =
 		regamma_lut && !__is_lut_linear(regamma_lut, regamma_size);
 
+	has_shaper_lut =
+		shaper_lut && !__is_lut_linear(shaper_lut, shaper_size);
+
+	has_lut3d = shaper_lut && lut3d &&
+			    !__is_lut_linear(lut3d, lut3d_size);
+
 	is_legacy = regamma_size == MAX_COLOR_LEGACY_LUT_ENTRIES;
 
 	/* Reset all adjustments. */
@@ -447,23 +526,55 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 				    regamma_size, has_rom);
 		if (r)
 			return r;
-	} else if (has_regamma) {
-		/**
-		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
-		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
-		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
-
-		r = __set_output_tf(stream->out_transfer_func, regamma_lut,
-				    regamma_size, has_rom);
-		if (r)
-			return r;
 	} else {
-		/**
-		 * No CRTC RGM means we can just put the block into bypass
-		 * since we don't have any plane level adjustments using it.
+		/* If no 3D LUT, use regamma original settings that means
+		 * linear input space.
 		 */
-		stream->out_transfer_func->type = TF_TYPE_BYPASS;
 		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
+
+		if (has_lut3d && has_shaper_lut) {
+			/* 3D LUT always implies a shaper 1D LUT to
+			 * de-linearize and shape the content.
+			 * Q: I see func_shaper and lut3d_func is originally
+			 * const, is it expected? If so, where is the point to
+			 * update them?
+			 */
+			stream->func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
+			stream->func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+			r = __set_output_tf(stream->func_shaper, shaper_lut,
+					    shaper_size, has_rom);
+			if (r)
+				return r;
+
+			/* Function to convert DRM 3D LUT to DC 3D LUT*/
+			 __drm_lut3d_to_dc_lut3d(lut3d, stream->lut3d_func);
+
+			/* Set different input space to gamma lut, since gamma
+			 * 1D LUT will be applied in a non-linear space after
+			 * 3D LUT. But which predefined function to select for
+			 * gamma after 3D LUT?
+			 */
+			stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
+		}
+
+		if (has_regamma) {
+			/**
+			 * CRTC RGM goes into RGM LUT.
+			 */
+			stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
+
+			r = __set_output_tf(stream->out_transfer_func, regamma_lut,
+					    regamma_size, has_rom);
+			if (r)
+				return r;
+		} else {
+			/**
+			 * No CRTC RGM means we can just put the block into
+			 * bypass since we don't have any plane level
+			 * adjustments using it.
+		 	 */
+			stream->out_transfer_func->type = TF_TYPE_BYPASS;
+		}
 	}
 
 	/**
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index f8f66790d09b..a7cc6ace5904 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -246,8 +246,8 @@ struct dc_stream_state {
 	/* writeback */
 	unsigned int num_wb_info;
 	struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
-	const struct dc_transfer_func *func_shaper;
-	const struct dc_3dlut *lut3d_func;
+	struct dc_transfer_func *func_shaper;
+	struct dc_3dlut *lut3d_func;
 	/* Computed state bits */
 	bool mode_changed : 1;
 
-- 
2.35.1

