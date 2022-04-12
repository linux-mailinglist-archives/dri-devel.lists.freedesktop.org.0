Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69B4FCD29
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F1810FB78;
	Tue, 12 Apr 2022 03:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8FC10FB4A;
 Tue, 12 Apr 2022 03:35:36 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E123028BCA7;
 Tue, 12 Apr 2022 04:35:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649734535; bh=zkzByDrF26DGWLnIirOSAU1WUQF3cJVg6KcINgo2HtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MLRuC6IWahayVU4T8MFfoduNEA3dEpScOZ4SscRiBPe03TxXlq6ekEObY661LsJzX
 i7DICK5EqavCQZlWUuZ1epnVrRkcgTVpNd7kBn208nBUGo3jG4Sx5YQdo3G/2aaTLC
 7G2yCVhIgURKWBEEYg6Bn4gC0rrRpn68vVULqItf3o1oF1WiLx8lN0vnCgsW8g/fYy
 ogRUoXLwEK82wXZVS28hcneOYRlCfma+rtHnSwUHSs5d1LWLmJOnGNgKERbGwbZ2tp
 pKdLWZZGIuy86sxFalKWFpcnWyHV1h9f0/Uohwj3z+SL8Odrm7PlOwF2YqeHj8CyMm
 xLIin4n2z4Wrg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/amdgpu: Use TTM builtin resource manager debugfs
 code
Date: Mon, 11 Apr 2022 23:35:24 -0400
Message-Id: <20220412033526.369115-4-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220412033526.369115-1-zack@kde.org>
References: <20220412033526.369115-1-zack@kde.org>
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
exactly the same functionality but the debugfs code is shared with
other drivers.

The TTM resource managers need to stay valid for as long as the
drm debugfs_root is valid.

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 86 +++++--------------------
 1 file changed, 16 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 57ac118fc266..37fe9fb3f8e5 100644
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
@@ -2355,17 +2295,23 @@ void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
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
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&adev->mman.bdev,
+							     TTM_PL_VRAM),
+					    root, "amdgpu_vram_mm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&adev->mman.bdev,
+							     TTM_PL_TT),
+					    root, "amdgpu_gtt_mm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&adev->mman.bdev,
+							     AMDGPU_PL_GDS),
+					    root, "amdgpu_gds_mm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&adev->mman.bdev,
+							     AMDGPU_PL_GWS),
+					    root, "amdgpu_gws_mm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&adev->mman.bdev,
+							     AMDGPU_PL_OA),
+					    root, "amdgpu_oa_mm");
+
 #endif
 }
-- 
2.32.0

