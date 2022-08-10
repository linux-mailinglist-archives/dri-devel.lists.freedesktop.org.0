Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3058E7D7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 09:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3107A12BC29;
	Wed, 10 Aug 2022 07:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 867 seconds by postgrey-1.36 at gabe;
 Wed, 10 Aug 2022 05:05:07 UTC
Received: from mx5.cs.washington.edu (mx5.cs.washington.edu
 [IPv6:2607:4000:200:11::6a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32686E9818
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 05:05:07 +0000 (UTC)
Received: from mx5.cs.washington.edu (localhost [IPv6:0:0:0:0:0:0:0:1])
 by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTP id 27A4oVYD212469;
 Tue, 9 Aug 2022 21:50:31 -0700
Received: from attu4.cs.washington.edu (attu4.cs.washington.edu
 [IPv6:2607:4000:200:10:0:0:0:8c]) (authenticated bits=128)
 by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTPSA id 27A4oR7R212445
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 9 Aug 2022 21:50:27 -0700
Received: from attu4.cs.washington.edu (localhost [127.0.0.1])
 by attu4.cs.washington.edu (8.15.2/8.15.2/1.23) with ESMTP id 27A4oR1S2634744; 
 Tue, 9 Aug 2022 21:50:27 -0700
Received: (from klee33@localhost)
 by attu4.cs.washington.edu (8.15.2/8.15.2/Submit/1.2) id 27A4oPEJ2634732;
 Tue, 9 Aug 2022 21:50:25 -0700
From: Kenneth Lee <klee33@uw.edu>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie
Subject: [PATCH] drm: Use kzalloc for allocating only one element
Date: Tue,  9 Aug 2022 21:50:12 -0700
Message-Id: <20220810045012.2634661-1-klee33@uw.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Aug 2022 07:24:12 +0000
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
Cc: Kenneth Lee <klee33@uw.edu>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kzalloc(...) rather than kcalloc(1, ...) because the number of
elements we are specifying in this case is 1, so kzalloc would
accomplish the same thing and we can simplify.

Signed-off-by: Kenneth Lee <klee33@uw.edu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c         | 2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c              | 2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c        | 3 +--
 drivers/gpu/drm/radeon/radeon_combios.c         | 4 ++--
 drivers/gpu/drm/v3d/v3d_gem.c                   | 2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                   | 4 ++--
 drivers/gpu/drm/vc4/vc4_validate_shaders.c      | 2 +-
 9 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 6d72355ac492..4a6ef5cccddc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -279,7 +279,7 @@ static int acp_hw_init(void *handle)
 			goto failure;
 		}
 
-		i2s_pdata = kcalloc(1, sizeof(struct i2s_platform_data), GFP_KERNEL);
+		i2s_pdata = kzalloc(sizeof(struct i2s_platform_data), GFP_KERNEL);
 		if (!i2s_pdata) {
 			r = -ENOMEM;
 			goto failure;
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 6dc2a4e191d7..56dd1781925b 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -949,7 +949,7 @@ static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 		return NULL;
 	}
 
-	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 	input_fmts[0] = input_fmt;
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 8c6517d29b8e..11c6f4cb95ae 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -420,7 +420,7 @@ static int igt_evict_contexts(void *arg)
 		struct reserved *r;
 
 		mutex_unlock(&ggtt->vm.mutex);
-		r = kcalloc(1, sizeof(*r), GFP_KERNEL);
+		r = kzalloc(sizeof(*r), GFP_KERNEL);
 		mutex_lock(&ggtt->vm.mutex);
 		if (!r) {
 			err = -ENOMEM;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..4f83656cb52f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -658,7 +658,7 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 
 	*num_input_fmts = 0;
 
-	input_fmts = kcalloc(1, sizeof(*input_fmts),
+	input_fmts = kzalloc(sizeof(*input_fmts),
 			     GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 28c4413f4dc8..e8a4283614b2 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -2786,8 +2786,7 @@ void radeon_atombios_get_power_modes(struct radeon_device *rdev)
 		rdev->pm.power_state = kzalloc(sizeof(struct radeon_power_state), GFP_KERNEL);
 		if (rdev->pm.power_state) {
 			rdev->pm.power_state[0].clock_info =
-				kcalloc(1,
-				        sizeof(struct radeon_pm_clock_info),
+				kzalloc(sizeof(struct radeon_pm_clock_info),
 				        GFP_KERNEL);
 			if (rdev->pm.power_state[0].clock_info) {
 				/* add the default mode */
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 783a6b8802d5..b3147711e9f9 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -2650,10 +2650,10 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 	if (rdev->pm.power_state) {
 		/* allocate 1 clock mode per state */
 		rdev->pm.power_state[0].clock_info =
-			kcalloc(1, sizeof(struct radeon_pm_clock_info),
+			kzalloc(sizeof(struct radeon_pm_clock_info),
 				GFP_KERNEL);
 		rdev->pm.power_state[1].clock_info =
-			kcalloc(1, sizeof(struct radeon_pm_clock_info),
+			kzalloc(sizeof(struct radeon_pm_clock_info),
 				GFP_KERNEL);
 		if (!rdev->pm.power_state[0].clock_info ||
 		    !rdev->pm.power_state[1].clock_info)
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 725a252e837b..362d2e78365d 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -462,7 +462,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	bool has_multisync = se && (se->flags & DRM_V3D_EXT_ID_MULTI_SYNC);
 	int ret, i;
 
-	*container = kcalloc(1, size, GFP_KERNEL);
+	*container = kzalloc(size, GFP_KERNEL);
 	if (!*container) {
 		DRM_ERROR("Cannot allocate memory for v3d job.");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index fe10d9c3fff8..52c407147d33 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -159,7 +159,7 @@ vc4_save_hang_state(struct drm_device *dev)
 	unsigned long irqflags;
 	unsigned int i, j, k, unref_list_count;
 
-	kernel_state = kcalloc(1, sizeof(*kernel_state), GFP_KERNEL);
+	kernel_state = kzalloc(sizeof(*kernel_state), GFP_KERNEL);
 	if (!kernel_state)
 		return;
 
@@ -1194,7 +1194,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	exec = kcalloc(1, sizeof(*exec), GFP_KERNEL);
+	exec = kzalloc(sizeof(*exec), GFP_KERNEL);
 	if (!exec) {
 		DRM_ERROR("malloc failure on exec struct\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index e315aeb5fef5..e84c17615313 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -801,7 +801,7 @@ vc4_validate_shader(struct drm_gem_cma_object *shader_obj)
 	if (!validation_state.branch_targets)
 		goto fail;
 
-	validated_shader = kcalloc(1, sizeof(*validated_shader), GFP_KERNEL);
+	validated_shader = kzalloc(sizeof(*validated_shader), GFP_KERNEL);
 	if (!validated_shader)
 		goto fail;
 
-- 
2.31.1

