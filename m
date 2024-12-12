Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8599EFC39
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 20:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0547A10EE80;
	Thu, 12 Dec 2024 19:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mk3VbTqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7299B10EE83;
 Thu, 12 Dec 2024 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z2ipejCRyWSKv27ShitN4KY4MHhmTPh5W2J+LTJowRg=; b=Mk3VbTqksrdXuSWlApUZxWrQ84
 emq5DahrVJA8WVYeNFS5rlee5JvOMKSr7Zx1Bbzl5vEqGMxlKe2eTI5DSSgkOgzE3XC/61ehur+Yb
 q+iPttpGsVraPNhXISNtDiSdV7bFdHzgdsdJra0rUWOiwD5NBRcT32JseKjpftfBqkb/pYhECpb3e
 5qqWuKzlmGwcVLLBJvP2kTS+0rgXXsevzHEL7d2shc4uUMchDvmHfqi+q9IFz+9TyiHDEKrLotsY5
 RLcsmTWmSdZSfB39K1sicw9z1H5mWinMBIqzynlXYuyTm5liQF8a46AFWxZVDz/vOAqJ0aV5GpgIm
 gYw0rRAw==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLojT-002MsO-O1; Thu, 12 Dec 2024 20:20:19 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 12 Dec 2024 16:19:34 -0300
Subject: [PATCH v11 2/2] drm/amdgpu: Enable async flip on overlay planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241212-tonyk-async_flip-v11-2-14379434be70@igalia.com>
References: <20241212-tonyk-async_flip-v11-0-14379434be70@igalia.com>
In-Reply-To: <20241212-tonyk-async_flip-v11-0-14379434be70@igalia.com>
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 495e3cd70426db0182cb2811bc6d5d09f52f8a4b..2792d393157beec12d6e96843c43158c03f16027 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1260,22 +1260,25 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
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
+	if (!flip && dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE) {
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.47.1

