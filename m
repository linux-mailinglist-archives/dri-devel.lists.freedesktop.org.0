Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5AB53A6A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9553510E3E3;
	Thu, 11 Sep 2025 17:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Io9C0Pom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A1010E3DE;
 Thu, 11 Sep 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7gK6RVcZBhstyO6i4wXcE8bmFxH9mlMFmdVrHOC2pDk=; b=Io9C0PomYDwQHecBtJIcs3j7nl
 14OMQFh6ypH5ujGfIgCy9MD7fb0aXfYqzmUDk23r+BVrWve0pfSM2pCgdcp6ZSlTZ83v4ZyLXgCPb
 O8Gn3x8eFTdkNADDFxnOv4fFNLxl4ziQhxzoApBRXN6RQ/rUl5ngqp40mOA0mMwsxvYTyd5gYKxPC
 HEU/thI5cXy3R3pueyssCGHnYaLxEQBZvW9rd2+hNJUfISipXaM8wTSN7hKeKPQTT3tX3KkWMfgeL
 ijzqWbFuE/3uKxCOgj7HXT30ZCNHQmQNrtcD0wpybuTHOdIeMxY/Kf7ndOlgZRYT9Fq3omNiqHlBt
 B3ZdHR0Q==;
Received: from [189.6.16.239] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwl8h-009uA8-OZ; Thu, 11 Sep 2025 19:31:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 2/2] drm/amd/display: change dc stream color settings only
 in atomic commit
Date: Thu, 11 Sep 2025 14:21:20 -0300
Message-ID: <20250911173101.1960156-3-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911173101.1960156-1-mwen@igalia.com>
References: <20250911173101.1960156-1-mwen@igalia.com>
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

Don't update DC stream color components during atomic check. The driver
will continue validating the new CRTC color state but will not change DC
stream color components. The DC stream color state will only be
programmed at commit time in the `atomic_setup_commit` stage.

It fixes gamma LUT loss reported by KDE users when changing brightness
quickly or changing Display settings (such as overscan) with nightlight
on and HDR. As KWin can do a test commit with color settings different
from those that should be applied in a non-test-only commit, if the
driver changes DC stream color state in atomic check, this state can be
eventually HW programmed in commit tail, instead of the respective state
set by the non-blocking commit.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v2
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 ++++++++++++++-----
 3 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f6462ff7251f..50b3bd0e32dd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11118,7 +11118,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	if (dm_new_crtc_state->base.color_mgmt_changed ||
 	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
 	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
-		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
+		ret = amdgpu_dm_check_crtc_color_mgmt(dm_new_crtc_state, true);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ce74125c713e..69125c3f08d5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -1041,6 +1041,8 @@ void amdgpu_dm_init_color_mod(void);
 int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
+int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
+				    bool check_only);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c7387af725d6..427bf8877df7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -566,12 +566,11 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
+static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
 					const struct drm_color_lut *regamma_lut,
 					uint32_t regamma_size, bool has_rom,
 					enum dc_transfer_func_predefined tf)
 {
-	struct dc_transfer_func *out_tf = &stream->out_transfer_func;
 	int ret = 0;
 
 	if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
@@ -885,33 +884,33 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 }
 
 /**
- * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
+ * amdgpu_dm_check_crtc_color_mgmt: Check if DRM color props are programmable by DC.
  * @crtc: amdgpu_dm crtc state
+ * @check_only: only check color state without update dc stream
  *
- * With no plane level color management properties we're free to use any
- * of the HW blocks as long as the CRTC CTM always comes before the
- * CRTC RGM and after the CRTC DGM.
- *
- * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
- * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
- * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
+ * This function just verifies CRTC LUT sizes, if there is enough space for
+ * output transfer function and if its parameters can be calculated by AMD
+ * color module. It also adjusts some settings for programming CRTC degamma at
+ * plane stage, using plane DGM block.
  *
  * The RGM block is typically more fully featured and accurate across
  * all ASICs - DCE can't support a custom non-linear CRTC DGM.
  *
  * For supporting both plane level color management and CRTC level color
- * management at once we have to either restrict the usage of CRTC properties
- * or blend adjustments together.
+ * management at once we have to either restrict the usage of some CRTC
+ * properties or blend adjustments together.
  *
  * Returns:
- * 0 on success. Error code if setup fails.
+ * 0 on success. Error code if validation fails.
  */
-int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
+
+int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
+				    bool check_only)
 {
 	struct dc_stream_state *stream = crtc->stream;
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
-	struct drm_color_ctm *ctm = NULL;
+	struct dc_transfer_func *out_tf;
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
 	uint32_t degamma_size, regamma_size;
 	bool has_regamma, has_degamma;
@@ -940,6 +939,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	crtc->cm_has_degamma = false;
 	crtc->cm_is_degamma_srgb = false;
 
+	if (check_only) {
+		out_tf = kvzalloc(sizeof(*out_tf), GFP_KERNEL);
+		if (!out_tf)
+			return -ENOMEM;
+	} else {
+		out_tf = &stream->out_transfer_func;
+	}
+
 	/* Setup regamma and degamma. */
 	if (is_legacy) {
 		/*
@@ -954,8 +961,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		 * inverse color ramp in legacy userspace.
 		 */
 		crtc->cm_is_degamma_srgb = true;
-		stream->out_transfer_func.type = TF_TYPE_DISTRIBUTED_POINTS;
-		stream->out_transfer_func.tf = TRANSFER_FUNCTION_SRGB;
+		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		out_tf->tf = TRANSFER_FUNCTION_SRGB;
 		/*
 		 * Note: although we pass has_rom as parameter here, we never
 		 * actually use ROM because the color module only takes the ROM
@@ -963,16 +970,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		 *
 		 * See more in mod_color_calculate_regamma_params()
 		 */
-		r = __set_legacy_tf(&stream->out_transfer_func, regamma_lut,
+		r = __set_legacy_tf(out_tf, regamma_lut,
 				    regamma_size, has_rom);
-		if (r)
-			return r;
 	} else {
 		regamma_size = has_regamma ? regamma_size : 0;
-		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
+		r = amdgpu_dm_set_atomic_regamma(out_tf, regamma_lut,
 						 regamma_size, has_rom, tf);
-		if (r)
-			return r;
 	}
 
 	/*
@@ -981,6 +984,43 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	 * have to place the CTM in the OCSC in that case.
 	 */
 	crtc->cm_has_degamma = has_degamma;
+	if (check_only)
+		kvfree(out_tf);
+
+	return r;
+}
+
+/**
+ * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
+ * @crtc: amdgpu_dm crtc state
+ *
+ * With no plane level color management properties we're free to use any
+ * of the HW blocks as long as the CRTC CTM always comes before the
+ * CRTC RGM and after the CRTC DGM.
+ *
+ * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
+ * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
+ * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
+ *
+ * The RGM block is typically more fully featured and accurate across
+ * all ASICs - DCE can't support a custom non-linear CRTC DGM.
+ *
+ * For supporting both plane level color management and CRTC level color
+ * management at once we have to either restrict the usage of CRTC properties
+ * or blend adjustments together.
+ *
+ * Returns:
+ * 0 on success. Error code if setup fails.
+ */
+int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
+{
+	struct dc_stream_state *stream = crtc->stream;
+	struct drm_color_ctm *ctm = NULL;
+	int ret;
+
+	ret = amdgpu_dm_check_crtc_color_mgmt(crtc, false);
+	if (ret)
+		return ret;
 
 	/* Setup CRTC CTM. */
 	if (crtc->base.ctm) {
-- 
2.47.2

