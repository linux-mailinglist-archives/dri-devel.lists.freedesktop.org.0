Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C9A7EE800
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B29610E6D6;
	Thu, 16 Nov 2023 19:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF79310E6CE;
 Thu, 16 Nov 2023 19:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vAjqkvmADD8hhmSRG2zlvMMF4QeHywhY4AUqwqbLSt4=; b=SmoAX4YdYlm4s99P3YXA5SL00o
 g2oYjFnSokbjQI7XzvzU99y2MnUCzqEPGQ2/Wp0vJdAJ7C0RN9LRE8C9jj9rOJtIDCODS/yWa89/C
 EOU9KDvYBmOYpTPMPi6IHX6CmLVtDkxIWEEigmZE9kYyrMbN0dr74TEh/v6rIJxKZwcWu0AE4Jmgl
 n34PzKT/40qw7iDx3qXZ+VO+EQggX5FYUuItiNe904ck+Mvx3WbHfH4A5oTZ8lsrTpTL35Ir9Ozi6
 baobgr8W5gFntYSL6wO0MoYLwMWy5TWrGkRb8Ihh09FQCyb6rkBl/1Om3e7e5ANIaVuHm5AGOhHYt
 YVqkKY/A==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iWK-0048Yy-Jl; Thu, 16 Nov 2023 20:59:24 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 31/32] drm/amd/display: add plane CTM support
Date: Thu, 16 Nov 2023 18:58:11 -0100
Message-Id: <20231116195812.906115-32-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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

Map the plane CTM driver-specific property to DC plane, instead of DC
stream. The remaining steps to program DPP block are already implemented
on DC shared-code.

v3:
- fix comment about plane and CRTC CTMs priorities (Harry)

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ef39255bb37e..e5f1086da09f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9686,6 +9686,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
 		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
 		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
+		    dm_old_other_state->ctm != dm_new_other_state->ctm ||
 		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
 		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
 		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 3eed47736b26..d52c3333ea13 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1172,6 +1172,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	struct drm_color_ctm *ctm = NULL;
 	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
@@ -1224,5 +1226,29 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
+	/* Setup CRTC CTM. */
+	if (dm_plane_state->ctm) {
+		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
+		/*
+		 * DCN2 and older don't support both pre-blending and
+		 * post-blending gamut remap. For this HW family, if we have
+		 * the plane and CRTC CTMs simultaneously, CRTC CTM takes
+		 * priority, and we discard plane CTM, as implemented in
+		 * dcn10_program_gamut_remap(). However, DCN3+ has DPP
+		 * (pre-blending) and MPC (post-blending) `gamut remap` blocks;
+		 * therefore, we can program plane and CRTC CTMs together by
+		 * mapping CRTC CTM to MPC and keeping plane CTM setup at DPP,
+		 * as it's done by dcn30_program_gamut_remap().
+		 */
+		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+
+		dc_plane_state->gamut_remap_matrix.enable_remap = true;
+		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+	} else {
+		/* Bypass CTM. */
+		dc_plane_state->gamut_remap_matrix.enable_remap = false;
+		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+	}
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
-- 
2.40.1

