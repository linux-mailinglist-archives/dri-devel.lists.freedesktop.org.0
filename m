Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F570E8F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4410E53A;
	Tue, 23 May 2023 22:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF810E52D;
 Tue, 23 May 2023 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JhIHyGvaiWh822fSCxfqflstipbGqTYxG4AU92LTpKs=; b=aRsEhZAC3HUGg7xHJqKHYJkLi6
 0lK6SuRWdmvcjnQ12mEHTqbuovpoLjA0mr9+eHyOG7NBIf3tIPjVRGUD98tp+yljWlHWPlWzSOYTf
 UEdXyme3SqST1DyyBUnXMR/bKvDEDEwCYQYrVuHZaL9xA/LEIHkI1o/1XVNZt6ulUcBme9fysXaC8
 ncv0y4aIpmV8TA8YFuO7Uq2dgQS9szBnG3v34dcSeuz+4TVuJbFkucMOQki2FtzRXvl7nC8ysNGZp
 dIY6Mm3c6cNtBqUyFllYuYw0FuY6dong4XkjNvHxW0xRZLhgyxsJrCjjWQZe8o7YuiQJAGZR2lsxa
 qfxW/C/w==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIg-00HEOv-3Z; Wed, 24 May 2023 00:16:14 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 33/36] drm/amd/display: add plane shaper/3D LUT and shaper TF
 support
Date: Tue, 23 May 2023 21:15:17 -0100
Message-Id: <20230523221520.3115570-34-mwen@igalia.com>
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

We already have the steps to program post-blending shaper/3D LUT on AMD
display driver, but unlike MPC 3D LUT, we don't need to acquire/release
DPP 3D LUT. We can reuse programming steps to map plane properties to
DC plane for pre-blending (plane) shaper/3D LUT setup.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++++++---
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 11135c3db6cc..2674ecdad717 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8022,6 +8022,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
 			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
+			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
+			bundle->surface_updates[planes_count].lut3d_func = dc_plane->lut3d_func;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 57d6aab76295..b075c9f6e717 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -911,6 +911,35 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
+				     struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	enum drm_transfer_function shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t lut3d_size, shaper_size;
+
+	/* We have nothing to do here, return */
+	if (!plane_state->color_mgmt_changed)
+		return 0;
+
+	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+
+	shaper_tf = dm_plane_state->shaper_tf;
+	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
+	lut3d = __extract_blob_lut(dm_plane_state->lut3d, &lut3d_size);
+	lut3d_size = lut3d != NULL ? lut3d_size : 0;
+	shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+	amdgpu_dm_atomic_lut3d(lut3d, lut3d_size, dc_plane_state->lut3d_func);
+	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, false,
+					  drm_tf_to_dc_tf(shaper_tf),
+					  shaper_size, dc_plane_state->in_shaper_func);
+
+	return ret;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -928,7 +957,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
-	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	bool has_crtc_cm_degamma;
 	int ret;
 
@@ -939,8 +967,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
-	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
-
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
 	if (ret == -ENOMEM)
 		return ret;
@@ -972,5 +998,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
-	return 0;
+	return amdgpu_dm_plane_set_color_properties(plane_state,
+						    dc_plane_state);
 }
-- 
2.39.2

