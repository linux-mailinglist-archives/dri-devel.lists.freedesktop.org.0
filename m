Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03796D3A966
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D84710E43C;
	Mon, 19 Jan 2026 12:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jxOtUO6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023910E43A;
 Mon, 19 Jan 2026 12:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6822743473;
 Mon, 19 Jan 2026 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93A7C116C6;
 Mon, 19 Jan 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827031;
 bh=HcoiydEFXKmQ01XABtNCd1uktwZQEpD5iwFOQjj3UJU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jxOtUO6GC/iyuLJGhCchxpe9UEofrYTrOSwHyHBfvJeYodQbE7hkOplKj/Kl5GlLH
 W62amQORtpnWWepMWvAJs3FxxB1OqUcN9UhhuzAy5W/faVSuCgQxPD0g/K+/uciZzt
 E/RjLJGZ0A8KWFu4Tiw0VMhnM/3901RoVMZeLM1MqqRUL22iiJs+wp+uigDbfYGvG+
 xR7VGv5V+hVMcaGPaHS+99chtsiS94o+S5+QFrOkjxXrRHjt0ghyr0IpdXwZKz8SVK
 OOQDuzpxqkcdDG5gTTX5o+vSF3MEvkc38wUs9Xdvq9U1im/VlXsBXAUJBsCuyZXWq0
 GeCJY8gUbitkw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:03 +0100
Subject: [PATCH v3 07/15] drm/amdgpu: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260119-drm-private-obj-reset-v3-7-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3578; i=mripard@redhat.com;
 h=from:subject:message-id; bh=HcoiydEFXKmQ01XABtNCd1uktwZQEpD5iwFOQjj3UJU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GjWhTgwsSwPUJ+i9DJofteVf6br+0uxlFjFbG89PX
 Vv42PNOx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIlEzG+qygu+Gn3BcmCVyw
 KJS5YHooP+RQ0zaj61l1h5XyKq5snPrm9J/sv7w7RFye9Cb9Z+h8zNiwyE43vNU4s6Li9+elxv8
 8Xl/Y1/tvbmrK2VRtTdFjKy3kM9+ed85SNQxKU3kpW5P+5j4A
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The amdgpu driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 ++++++++++++-----------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 740711ac1037ce14eda589324a26f312f8560da6..a97e1bf1bfdc6384a6ac83f907878807bb3b62a0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4880,18 +4880,41 @@ static void dm_atomic_destroy_state(struct drm_private_obj *obj,
 		dc_state_release(dm_state->context);
 
 	kfree(dm_state);
 }
 
+static struct drm_private_state *
+dm_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct amdgpu_device *adev = drm_to_adev(obj->dev);
+	struct dm_atomic_state *dm_state;
+	struct dc_state *context;
+
+	dm_state = kzalloc(sizeof(*dm_state), GFP_KERNEL);
+	if (!dm_state)
+		return ERR_PTR(-ENOMEM);
+
+	context = dc_state_create_current_copy(adev->dm.dc);
+	if (!context) {
+		kfree(dm_state);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	__drm_atomic_helper_private_obj_create_state(obj, &dm_state->base);
+	dm_state->context = context;
+
+	return &dm_state->base;
+}
+
 static struct drm_private_state_funcs dm_atomic_state_funcs = {
+	.atomic_create_state = dm_atomic_create_state,
 	.atomic_duplicate_state = dm_atomic_duplicate_state,
 	.atomic_destroy_state = dm_atomic_destroy_state,
 };
 
 static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 {
-	struct dm_atomic_state *state;
 	int r;
 
 	adev->mode_info.mode_config_initialized = true;
 
 	adev_to_drm(adev)->mode_config.funcs = (void *)&amdgpu_dm_mode_funcs;
@@ -4907,46 +4930,27 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	else
 		adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 	/* indicates support for immediate flip */
 	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->context = dc_state_create_current_copy(adev->dm.dc);
-	if (!state->context) {
-		kfree(state);
-		return -ENOMEM;
-	}
-
 	drm_atomic_private_obj_init(adev_to_drm(adev),
 				    &adev->dm.atomic_obj,
-				    &state->base,
+				    NULL,
 				    &dm_atomic_state_funcs);
 
 	r = amdgpu_display_modeset_create_props(adev);
-	if (r) {
-		dc_state_release(state->context);
-		kfree(state);
+	if (r)
 		return r;
-	}
 
 #ifdef AMD_PRIVATE_COLOR
-	if (amdgpu_dm_create_color_properties(adev)) {
-		dc_state_release(state->context);
-		kfree(state);
+	if (amdgpu_dm_create_color_properties(adev))
 		return -ENOMEM;
-	}
 #endif
 
 	r = amdgpu_dm_audio_init(adev);
-	if (r) {
-		dc_state_release(state->context);
-		kfree(state);
+	if (r)
 		return r;
-	}
 
 	return 0;
 }
 
 #define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12

-- 
2.52.0

