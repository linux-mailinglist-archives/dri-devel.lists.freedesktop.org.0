Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E67AE012
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651A510E31E;
	Mon, 25 Sep 2023 19:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DE610E304;
 Mon, 25 Sep 2023 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CP1mEJs8jbYVCzuOEDU4JlHqX9sbzfsTCAPvK8QXEU4=; b=XwlmUJCwEiJeMJ/IZYPpaeusmI
 VJqqggzjxtvh2aIG+vZAs5/Rf9MeGxHPqPmKyG3CNwb+w+LgDV/7fCLSQzXExTG19CYzG9b9i9ECo
 4/uyeyu7AqschtdOoDzUdzMWN0qQIRzL0IRVX1/Z5t3AdirjIRkuJxd5xq4G9Qt6Pj7HMEN9XIbu3
 t7DaQIgzIC8RkqfGUAeTZfUtCF766LAwG/eGkjf5dpFSu32KXgPoiNGs7uRcW5GD6bsisp5ePoJ0Y
 x7oiMtsTGZQHGCl0MYPsr90CV1ZZ/zncAqiWLME+3oiTDNsL7wGtNg415w37JR7yq8BXBjSw5kZGO
 W673M1Mg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrbR-008GsG-82; Mon, 25 Sep 2023 21:50:45 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 31/32] drm/amd/display: add plane CTM support
Date: Mon, 25 Sep 2023 18:49:31 -0100
Message-Id: <20230925194932.1329483-32-mwen@igalia.com>
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

Map the plane CTM driver-specific property to DC plane, instead of DC
stream. The remaining steps to program DPP block are already implemented
on DC shared-code.

v3:
- fix comment about plane and CRTC CTMs priorities (Harry)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 581afa7c5f8c..e4edd97982a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9714,6 +9714,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
 		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
 		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
+		    dm_old_other_state->ctm != dm_new_other_state->ctm ||
 		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
 		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
 		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 26338f565574..944dccd483de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1153,6 +1153,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	struct drm_color_ctm *ctm = NULL;
 	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
@@ -1204,5 +1206,28 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
+	/* Setup CRTC CTM. */
+	if (dm_plane_state->ctm) {
+		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
+		/* DCN2 and older don't support both pre-blending and
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

