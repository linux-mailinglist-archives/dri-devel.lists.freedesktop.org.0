Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABF4F7265
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8910E6DD;
	Thu,  7 Apr 2022 02:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0910E6BF;
 Thu,  7 Apr 2022 02:57:04 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4967928A5AC;
 Thu,  7 Apr 2022 03:57:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300223; bh=HJUAxAxgi2odZto+GSDNmiZlLQE7sarzm8viYl7J8xA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ONCY8k7b5mHo/n/w0Bn3cQ2sdjbLV2doKJygge3+6+SsVfipVbbc3ElGKOePwtWCZ
 53Wci9MBo0BQmOw2ZoyKxhD0hwhY4IKFjlHIEYA3I4wbpnmR8ZGpFoZXVxFH44hwU0
 jnFhrEdj7JAhl5oaeIwKsaIUmDulwowczVMnY9LH/gkKoYogWnMsCltWCJYSvyzCqg
 79vvkTKY/mIWmpmC5kBhnNA0T8LUXwbXiL+qnnwxs+y7Fou228PWv60vbxW+fm58K9
 rKEWzvNWzgG8oujCXEZI+WIpV2d8vfVcumV3rDa5yg+ViEcZVLObOU92CuEjJvYZcz
 b7kWmap0unw8w==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu: Use TTM builtin resource manager debugfs code
Date: Wed,  6 Apr 2022 22:56:49 -0400
Message-Id: <20220407025652.146426-4-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407025652.146426-1-zack@kde.org>
References: <20220407025652.146426-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 krastevm@vmware.com, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Switch to using the TTM resource manager debugfs helpers. It's
exactly the same functionality, except that the entries live under
/sys/kernel/debug/ttm/.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 81 ++++---------------------
 1 file changed, 11 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 57ac118fc266..9852a11a5758 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2079,17 +2079,6 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 
 #if defined(CONFIG_DEBUG_FS)
 
-static int amdgpu_mm_vram_table_show(struct seq_file *m, void *unused)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev,
-							    TTM_PL_VRAM);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
 static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
@@ -2097,55 +2086,6 @@ static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
 	return ttm_pool_debugfs(&adev->mman.bdev.pool, m);
 }
 
-static int amdgpu_mm_tt_table_show(struct seq_file *m, void *unused)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev,
-							    TTM_PL_TT);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
-static int amdgpu_mm_gds_table_show(struct seq_file *m, void *unused)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev,
-							    AMDGPU_PL_GDS);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
-static int amdgpu_mm_gws_table_show(struct seq_file *m, void *unused)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev,
-							    AMDGPU_PL_GWS);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
-static int amdgpu_mm_oa_table_show(struct seq_file *m, void *unused)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev,
-							    AMDGPU_PL_OA);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_vram_table);
-DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_tt_table);
-DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gds_table);
-DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_gws_table);
-DEFINE_SHOW_ATTRIBUTE(amdgpu_mm_oa_table);
 DEFINE_SHOW_ATTRIBUTE(amdgpu_ttm_page_pool);
 
 /*
@@ -2350,22 +2290,23 @@ void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 #if defined(CONFIG_DEBUG_FS)
 	struct drm_minor *minor = adev_to_drm(adev)->primary;
 	struct dentry *root = minor->debugfs_root;
+	const char * const ttm_placement_names[] = {
+		[TTM_PL_SYSTEM] = "system_ttm",
+		[TTM_PL_VRAM] = "amdgpu_vram_mm",
+		[TTM_PL_TT] = "amdgpu_gtt_mm",
+		[AMDGPU_PL_GDS] = "amdgpu_gds_mm",
+		[AMDGPU_PL_GWS] = "amdgpu_gws_mm",
+		[AMDGPU_PL_OA] = "amdgpu_oa_mm"
+	};
 
 	debugfs_create_file_size("amdgpu_vram", 0444, root, adev,
 				 &amdgpu_ttm_vram_fops, adev->gmc.mc_vram_size);
 	debugfs_create_file("amdgpu_iomem", 0444, root, adev,
 			    &amdgpu_ttm_iomem_fops);
-	debugfs_create_file("amdgpu_vram_mm", 0444, root, adev,
-			    &amdgpu_mm_vram_table_fops);
-	debugfs_create_file("amdgpu_gtt_mm", 0444, root, adev,
-			    &amdgpu_mm_tt_table_fops);
-	debugfs_create_file("amdgpu_gds_mm", 0444, root, adev,
-			    &amdgpu_mm_gds_table_fops);
-	debugfs_create_file("amdgpu_gws_mm", 0444, root, adev,
-			    &amdgpu_mm_gws_table_fops);
-	debugfs_create_file("amdgpu_oa_mm", 0444, root, adev,
-			    &amdgpu_mm_oa_table_fops);
 	debugfs_create_file("ttm_page_pool", 0444, root, adev,
 			    &amdgpu_ttm_page_pool_fops);
+	ttm_resource_manager_debugfs_init(&adev->mman.bdev,
+					  ttm_placement_names,
+					  ARRAY_SIZE(ttm_placement_names));
 #endif
 }
-- 
2.32.0

