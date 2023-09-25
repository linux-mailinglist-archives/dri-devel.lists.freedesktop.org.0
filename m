Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED857AE005
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E319F10E30E;
	Mon, 25 Sep 2023 19:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8D10E307;
 Mon, 25 Sep 2023 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+sDMhQfGTAJaMxdArU/jGdKeiFDfWD2SuuYunmoKLT4=; b=oefIML4fiawsjF0BqR2XMRZkC/
 wP5zGs5n+k239hl9HkdpS+6slrnpGX0lGe1DeDkjqtjD6nJbhtS0lmLrMI0ikSGSvtja8bpSfblpt
 6McjIWwQh4VKVhfp9Ex8KgTpWyQKeME4mSRH/hjh9e8v01WJ63SFakLneXBrSDlkU+5Oco7yETIEk
 BNmsNq1K1LcEf9us142kJi34NU26BBcL+zSlIZ56rNaOkEBaKKDcjXnRtw06BjZKGM9MU7gQpuPws
 m3oeRt1vJ7Jhr3hf3vNRuiX7Lkf7re7/eR0eWqx6xelkw61E62nupTo50X1z773oqTkgrReyubO4U
 NveS1IWg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrbT-008GsG-N2; Mon, 25 Sep 2023 21:50:47 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH v3 32/32] drm/amd/display: Add 3x4 CTM support for plane CTM
Date: Mon, 25 Sep 2023 18:49:32 -0100
Message-Id: <20230925194932.1329483-33-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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

Create drm_color_ctm_3x4 to support 3x4-dimension plane CTM matrix and
convert DRM CTM to DC CSC float matrix.

v3:
- rename ctm2 to ctm_3x4 (Harry)

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 28 +++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
 include/uapi/drm/drm_mode.h                   |  8 ++++++
 3 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 944dccd483de..774a83a9dee7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -410,6 +410,28 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
 	}
 }
 
+/**
+ * __drm_ctm_3x4_to_dc_matrix - converts a DRM CTM 3x4 to a DC CSC float matrix
+ * @ctm: DRM color transformation matrix with 3x4 dimensions
+ * @matrix: DC CSC float matrix
+ *
+ * The matrix needs to be a 3x4 (12 entry) matrix.
+ */
+static void __drm_ctm_3x4_to_dc_matrix(const struct drm_color_ctm_3x4 *ctm,
+				       struct fixed31_32 *matrix)
+{
+	int i;
+
+	/* The format provided is S31.32, using signed-magnitude representation.
+	 * Our fixed31_32 is also S31.32, but is using 2's complement. We have
+	 * to convert from signed-magnitude to 2's complement.
+	 */
+	for (i = 0; i < 12; i++) {
+		/* gamut_remap_matrix[i] = ctm[i - floor(i/4)] */
+		matrix[i] = dc_fixpt_from_s3132(ctm->matrix[i]);
+	}
+}
+
 /**
  * __set_legacy_tf - Calculates the legacy transfer function
  * @func: transfer function
@@ -1154,7 +1176,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
-	struct drm_color_ctm *ctm = NULL;
+	struct drm_color_ctm_3x4 *ctm = NULL;
 	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
@@ -1208,7 +1230,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 
 	/* Setup CRTC CTM. */
 	if (dm_plane_state->ctm) {
-		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
+		ctm = (struct drm_color_ctm_3x4 *)dm_plane_state->ctm->data;
 		/* DCN2 and older don't support both pre-blending and
 		 * post-blending gamut remap. For this HW family, if we have
 		 * the plane and CRTC CTMs simultaneously, CRTC CTM takes
@@ -1219,7 +1241,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * mapping CRTC CTM to MPC and keeping plane CTM setup at DPP,
 		 * as it's done by dcn30_program_gamut_remap().
 		 */
-		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+		__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
 
 		dc_plane_state->gamut_remap_matrix.enable_remap = true;
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 98501f5044c2..a1f087b0f7e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1551,7 +1551,7 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->ctm,
 							val,
-							sizeof(struct drm_color_ctm), -1,
+							sizeof(struct drm_color_ctm_3x4), -1,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..a811d24e8ed5 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -838,6 +838,14 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
-- 
2.40.1

