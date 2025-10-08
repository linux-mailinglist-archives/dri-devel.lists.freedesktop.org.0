Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA6BC4B0E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6B10E7EF;
	Wed,  8 Oct 2025 12:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tiZ6pD2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC6110E7EE;
 Wed,  8 Oct 2025 12:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 157BC440C3;
 Wed,  8 Oct 2025 12:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B32C4CEFF;
 Wed,  8 Oct 2025 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925074;
 bh=ATIo7aCxpYnPYLVeX1sxl8hd7438azHjt8lHi90OYVA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tiZ6pD2fWIrj43W7Q2Lhx23fODiegTlzE3aZ3l4z5LgB+XpAJ1WDiXVeohV4eRq0K
 W8vazRp4PrVeHO3oIQZWD8BHlFHLOw5pPVZvKWFPRtPq+jxyvJzRZPwNXGUwGwoy6x
 VyFwiOt9uH3MRGCcAqjwExPmzi3M9+zVMVqEWwepdRdMxWp0m1mHJoW/hoE8z7cRFj
 KJfCtMidMOp+EB7KSK7aB/TTze+g9+PYNoBAUoyPDHOtyBgZs3yCHfy0URwNzsjj4S
 hjmgugUFJi4pPyKJq74tlgVLJlRm5Zv5aRNUTpvhmRc05KLG699wfH/x1owAyqlriO
 so82KgoSf8brw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:05 +0200
Subject: [PATCH 07/16] drm/amdgpu: Switch private_obj initialization to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251008-drm-private-obj-reset-v1-7-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3539; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ATIo7aCxpYnPYLVeX1sxl8hd7438azHjt8lHi90OYVA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgk2vLjwzkXvlro93Y1+eblma7FL15l/Xkhv/bhu7/
 jo55a/EhI6pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwEcEcxoYTr3Mf120zakmV
 CTt1IrQq6OOcMzPS5nBe/eMqOn3p9VMp6dyfhbh/JPSs6paeLfzmKTdjnenHzJ+NLjdb/nlMy9S
 ZbH1/PcfH5ZdCDFQtf/z4uG2ORuwr/zcCV77kTN9ws+O8D0+CAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
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
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 54 +++++++++++++----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 62defeccbb5ca09c89523fc4112d2085bbdbb0a9..1bcbfd814d53bb443b7503ffacb109c900b67b5f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4675,18 +4675,43 @@ static void dm_atomic_destroy_state(struct drm_private_obj *obj,
 		dc_state_release(dm_state->context);
 
 	kfree(dm_state);
 }
 
+static void dm_atomic_reset(struct drm_private_obj *obj)
+{
+	struct amdgpu_device *adev = drm_to_adev(obj->dev);
+	struct dm_atomic_state *dm_state;
+	struct dc_state *context;
+
+	if (obj->state) {
+		dm_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	dm_state = kzalloc(sizeof(*dm_state), GFP_KERNEL);
+	if (!dm_state)
+		return;
+
+	context = dc_state_create_current_copy(adev->dm.dc);
+	if (!context) {
+		kfree(dm_state);
+		return;
+	}
+
+	__drm_atomic_helper_private_obj_reset(obj, &dm_state->base);
+	dm_state->context = context;
+}
+
 static struct drm_private_state_funcs dm_atomic_state_funcs = {
 	.atomic_duplicate_state = dm_atomic_duplicate_state,
 	.atomic_destroy_state = dm_atomic_destroy_state,
+	.reset = dm_atomic_reset,
 };
 
 static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 {
-	struct dm_atomic_state *state;
 	int r;
 
 	adev->mode_info.mode_config_initialized = true;
 
 	adev_to_drm(adev)->mode_config.funcs = (void *)&amdgpu_dm_mode_funcs;
@@ -4702,46 +4727,27 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
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
2.51.0

