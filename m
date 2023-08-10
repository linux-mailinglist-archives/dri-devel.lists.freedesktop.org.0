Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930AB777D6B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186110E59E;
	Thu, 10 Aug 2023 16:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBB310E599;
 Thu, 10 Aug 2023 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9D+sOG90D4swtOov18+zIz0GOUaWYMvws/wo1WCwL5I=; b=DxdrX/dLbfzG23bLvw11clvFMg
 DO3hen4LLZDo8qfjYm61Wb4vBEbPqwPLNOxgMrMqw/f3K7lo7jiEl4dkoPPiL1W05s60Zk8nJiQ9/
 WYAgHH+9nTKDyD62CB30jgevAPymqvJTTTPuIout/CVr9WBgkOotBE8ule0ljmGa0jKlzMOGOim3s
 CpiaTBmpbzuou5wKLHK3wegBFQjlzAcOJDgE70JQmT5K723f4oGCIMBngMiRFnGGIAL9uHilGSBX1
 tpET4LuB4Mp+tegxHIE4sqA0OwCZXE/pfx0xIkILE8K7erIHwlIfO+cHyDI5W6YRo/HsojaR0cfO0
 exXAiIxw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU890-00GjYD-Cs; Thu, 10 Aug 2023 18:04:14 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 26/34] drm/amd/display: add plane 3D LUT support
Date: Thu, 10 Aug 2023 15:03:06 -0100
Message-Id: <20230810160314.48225-27-mwen@igalia.com>
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

Wire up DC 3D LUT to DM plane color management (pre-blending). On AMD
display HW, 3D LUT comes after a shaper curve and we always have to
program a shaper curve to delinearize or normalize the color space
before applying a 3D LUT (since we have a reduced number of LUT
entries).

In this version, the default values of 3D LUT for size and bit_depth are
17x17x17 and 12-bit, but we already provide here a more generic
mechanisms to program other supported values (9x9x9 size and 10-bit).

v2:
- started with plane 3D LUT instead of CRTC 3D LUT support

Reviewed-by: Harry Wentland <harry.wentland@amd.com> (v1)
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 96 ++++++++++++++++++-
 2 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 347ecff2c920..025a7eb5c8aa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8062,6 +8062,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
 			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
 			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
+			bundle->surface_updates[planes_count].lut3d_func = dc_plane->lut3d_func;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 90ec09ca4118..58c4797f506e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -598,6 +598,85 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
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
 static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
 				       bool has_rom,
 				       enum dc_transfer_func_predefined tf,
@@ -652,7 +731,7 @@ int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 				struct drm_plane_state *plane_state)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
-	const struct drm_color_lut *shaper = NULL;
+	const struct drm_color_lut *shaper = NULL, *lut3d = NULL;
 	uint32_t exp_size, size;
 
 	/* shaper LUT is only available if 3D LUT color caps*/
@@ -663,6 +742,14 @@ int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 		drm_dbg(&adev->ddev,
 			"Invalid Shaper LUT size. Should be %u but got %u.\n",
 			exp_size, size);
+	}
+
+	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &size);
+
+	if (lut3d && size != exp_size) {
+		drm_dbg(&adev->ddev, "Invalid 3D LUT size. Should be %u but got %u.\n",
+			exp_size, size);
 		return -EINVAL;
 	}
 
@@ -962,8 +1049,8 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
-	const struct drm_color_lut *shaper_lut;
-	uint32_t shaper_size;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t shaper_size, lut3d_size;
 	int ret;
 
 	/* We have nothing to do here, return */
@@ -975,7 +1062,10 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
 	shaper_size = shaper_lut != NULL ? shaper_size : 0;
 	shaper_tf = dm_plane_state->shaper_tf;
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &lut3d_size);
+	lut3d_size = lut3d != NULL ? lut3d_size : 0;
 
+	amdgpu_dm_atomic_lut3d(lut3d, lut3d_size, dc_plane_state->lut3d_func);
 	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, false,
 					  amdgpu_tf_to_dc_tf(shaper_tf),
 					  shaper_size,
-- 
2.40.1

