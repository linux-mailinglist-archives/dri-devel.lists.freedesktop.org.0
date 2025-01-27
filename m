Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AACA1DD1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7370110E5B0;
	Mon, 27 Jan 2025 20:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Jm22EwXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1EF10E5AF;
 Mon, 27 Jan 2025 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pa3SZ7L50Y0lXYUgdj505ZfwHnWXpSih8ecBGczhR2o=; b=Jm22EwXBD/j2dD1NwM1WV5s/d2
 zN1oXIP/1nNB4fmGIbAtzNORf2dtTHhfYOCQpnuARnYL/mxC8kQGxRJiSqIfrhok+eqdZPl7cRRxn
 fgS9ECiMXaTqYKw+qnbuTKJsTFNrRcjG4ypExL+ArOTGDwgbGXqTyuUBDVMtF0BembLMLCyAyYi8C
 9+4XBD3U7Z7oiqZYGiE2qEqhi9y/ZSzvpUV67QuytfzTSA15EGef6DSVbva3k0ukYgnesok6kIKbF
 iuPHGVOi2W8A7avpQiGGMbjnLTcX2Xc0V2lJn6HlxUXzG79AjOTtSMu+vn60UdmOgOC9FzhMhDLI1
 PcG2kscA==;
Received: from 189-68-33-219.dsl.telesp.net.br ([189.68.33.219]
 helo=[192.168.15.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tcVHL-003NsK-Uf; Mon, 27 Jan 2025 21:00:15 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Mon, 27 Jan 2025 16:59:40 -0300
Subject: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
In-Reply-To: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.14.2
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

amdgpu can handle async flips on overlay planes, so allow it for atomic
async checks.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 774cc3f4f3fd9a964fe48c66eb596d2f6dfee602..6bfed3d1530e6610eea025b477f409ee505870da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1258,21 +1258,23 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
 }
 
 static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
-					      struct drm_atomic_state *state)
+					      struct drm_atomic_state *state, bool flip)
 {
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_plane_state *new_plane_state;
 	struct dm_crtc_state *dm_new_crtc_state;
 
-	/* Only support async updates on cursor planes. */
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+	if (flip) {
+		if (plane->type != DRM_PLANE_TYPE_OVERLAY)
+			return -EINVAL;
+	} else if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		return -EINVAL;
 
 	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 	/* Reject overlay cursors for now*/
-	if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+	if (!flip && dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
 		return -EINVAL;
 
 	return 0;

-- 
2.48.0

