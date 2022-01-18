Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE414914C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0FD1128C9;
	Tue, 18 Jan 2022 02:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68791128C7;
 Tue, 18 Jan 2022 02:24:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C30D60FAA;
 Tue, 18 Jan 2022 02:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE1C36AE3;
 Tue, 18 Jan 2022 02:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472661;
 bh=capFOdoYMT5zuDsGokY1Gk/LSUmBH/rwoQ/95rHsKq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3ljuf9L9ekzY0xUtaO7baI+JIOjLLi38LsrCFWFP5je2DrLIH+skXlP+qhlfQIQZ
 7mRJeBFobOiNWOMRct4/PVi6iHCChEEf/U5VBe1RjbXDFKmWfBttw+0RUyVCBCfMdl
 S2pXdNZhzT7UVKZQoxQehgIOtQefX7b3py7RdbKNhakCN/VivPXreGCAA1PKSJyWgf
 LOadXLQSz20uTcnnUte8EI5z+PCTOPbtuxz/TkFOAoI7G7lcVEZS+Xj6hry7UHjneK
 eg58Zodg9NY3oKOp2DotHlGUW9arLWxZXezkUOsaop2SHH4rJ4oCf3eQzRtxA+QlXw
 4B5X6tFrEmrpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 089/217] drm/amd/display: Use oriented source
 size when checking cursor scaling
Date: Mon, 17 Jan 2022 21:17:32 -0500
Message-Id: <20220118021940.1942199-89-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Vlad Zahorodnii <vlad.zahorodnii@kde.org>,
 Anson.Jacob@amd.com, sunpeng.li@amd.com, shenshih@amd.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Roman.Li@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 airlied@linux.ie, aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 nikola.cornij@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vlad Zahorodnii <vlad.zahorodnii@kde.org>

[ Upstream commit 69cb56290d9d10cdcc461aa2685e67e540507a96 ]

dm_check_crtc_cursor() doesn't take into account plane transforms when
calculating plane scaling, this can result in false positives.

For example, if there's an output with resolution 3840x2160 and the
output is rotated 90 degrees, CRTC_W and CRTC_H will be 3840 and 2160,
respectively, but SRC_W and SRC_H will be 2160 and 3840, respectively.

Since the cursor plane usually has a square buffer attached to it, the
dm_check_crtc_cursor() will think that there's a scale factor mismatch
even though there isn't really.

This fixes an issue where kwin fails to use hardware plane transforms.

Changes since version 1:
- s/orientated/oriented/g

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Vlad Zahorodnii <vlad.zahorodnii@kde.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e08ac474e9d59..21ff6b232fb62 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10661,6 +10661,24 @@ static int dm_update_plane_state(struct dc *dc,
 	return ret;
 }
 
+static void dm_get_oriented_plane_size(struct drm_plane_state *plane_state,
+				       int *src_w, int *src_h)
+{
+	switch (plane_state->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+	case DRM_MODE_ROTATE_270:
+		*src_w = plane_state->src_h >> 16;
+		*src_h = plane_state->src_w >> 16;
+		break;
+	case DRM_MODE_ROTATE_0:
+	case DRM_MODE_ROTATE_180:
+	default:
+		*src_w = plane_state->src_w >> 16;
+		*src_h = plane_state->src_h >> 16;
+		break;
+	}
+}
+
 static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 				struct drm_crtc *crtc,
 				struct drm_crtc_state *new_crtc_state)
@@ -10669,6 +10687,8 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 	struct drm_plane_state *new_cursor_state, *new_underlying_state;
 	int i;
 	int cursor_scale_w, cursor_scale_h, underlying_scale_w, underlying_scale_h;
+	int cursor_src_w, cursor_src_h;
+	int underlying_src_w, underlying_src_h;
 
 	/* On DCE and DCN there is no dedicated hardware cursor plane. We get a
 	 * cursor per pipe but it's going to inherit the scaling and
@@ -10680,10 +10700,9 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 		return 0;
 	}
 
-	cursor_scale_w = new_cursor_state->crtc_w * 1000 /
-			 (new_cursor_state->src_w >> 16);
-	cursor_scale_h = new_cursor_state->crtc_h * 1000 /
-			 (new_cursor_state->src_h >> 16);
+	dm_get_oriented_plane_size(new_cursor_state, &cursor_src_w, &cursor_src_h);
+	cursor_scale_w = new_cursor_state->crtc_w * 1000 / cursor_src_w;
+	cursor_scale_h = new_cursor_state->crtc_h * 1000 / cursor_src_h;
 
 	for_each_new_plane_in_state_reverse(state, underlying, new_underlying_state, i) {
 		/* Narrow down to non-cursor planes on the same CRTC as the cursor */
@@ -10694,10 +10713,10 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 		if (!new_underlying_state->fb)
 			continue;
 
-		underlying_scale_w = new_underlying_state->crtc_w * 1000 /
-				     (new_underlying_state->src_w >> 16);
-		underlying_scale_h = new_underlying_state->crtc_h * 1000 /
-				     (new_underlying_state->src_h >> 16);
+		dm_get_oriented_plane_size(new_underlying_state,
+					   &underlying_src_w, &underlying_src_h);
+		underlying_scale_w = new_underlying_state->crtc_w * 1000 / underlying_src_w;
+		underlying_scale_h = new_underlying_state->crtc_h * 1000 / underlying_src_h;
 
 		if (cursor_scale_w != underlying_scale_w ||
 		    cursor_scale_h != underlying_scale_h) {
-- 
2.34.1

