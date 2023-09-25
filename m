Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C07AE004
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2E910E30B;
	Mon, 25 Sep 2023 19:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D5C10E301;
 Mon, 25 Sep 2023 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uUY7UY3tgJOUDXzvxzSVyx1DT+NSWJ6q/Vk2w6EG5oM=; b=ZeXBig6lkqIUxOkVp3CZItYFGr
 JsLWS7/DRsdL6sTRLPyiRhmxu5r17rjLVBsVxyXtqVVOSEOTDFSLjmjBEE8lb2i97dTS+uwZHKHQn
 Vin57BZ83n7ix263yNEaXcMpGEAI15MIuiWREhzvZwXkiPYnH7YcO1ao8LNszsMGnSSrfLxfq8CIP
 PDcdFjN5YlH+4ZH2HqhQfGbyyU7FLo2kw+lpDorWmvSFIvSXjvy46IHHzpuMj89frSQbCQaDKDQEb
 XEDe8MgmOOq/GqFTpDu2YzcuAn1fewgtlMfOKV0rDmpCLkUrpbVyuU1xKN22TsHRR6yfcFPWBCiRV
 puC8tMnw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrb7-008GsG-Go; Mon, 25 Sep 2023 21:50:25 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 22/32] drm/amd/display: add HDR multiplier support
Date: Mon, 25 Sep 2023 18:49:22 -0100
Message-Id: <20230925194932.1329483-23-mwen@igalia.com>
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

With `dc_fixpt_from_s3132()` translation, we can just use it to set
hdr_mult.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 341cde61bf0b..455b690d6185 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8184,6 +8184,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].gamma = dc_plane->gamma_correction;
 			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
+			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c0b3ccd85a9f..577a9dc669a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -898,6 +898,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	bool has_crtc_cm_degamma;
 	int ret;
 
@@ -908,6 +909,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
+	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
 	if (ret == -ENOMEM)
 		return ret;
-- 
2.40.1

