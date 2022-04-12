Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69C4FCD28
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FE010FB71;
	Tue, 12 Apr 2022 03:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AE810FB4E;
 Tue, 12 Apr 2022 03:35:38 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id BF9A928384A;
 Tue, 12 Apr 2022 04:35:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649734537; bh=Nh5GIWhbYavhYAJ2lM1dTmT1hu102mSZDvX1E9H0yoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MobUAWlBaoQwv6v7q238iOxMJ/UF4KO3CedZ+8NI6ZV69WRr2H7kUNbZnazIAkS15
 Q6ksU85luE5oGZmCALGo6GvPnQLz4RLGF2fvm26fZQ6kvRws2mJBN0lxoqCpp4Hfn+
 6x3mjYcSB1qsYSoVeWEKEMR4vZfvCYTbZRnwRzK6f2GC3yxjYNL+Mif1a1j1blrT2t
 UxP2/7xwgYHqUuwkwH+iLLBw823x6w9Q+WtgyFGKnDwkiLqbAwh06TW+9NvkioSj6K
 ysBjhgzfafTpcW3yyYRu9mavLoTTX2ViOqmRmvS1qcqD/r620STUVgGkqhU54z6N7w
 +nLQIlcAJnygA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/radeon: Use TTM builtin resource manager debugfs
 code
Date: Mon, 11 Apr 2022 23:35:26 -0400
Message-Id: <20220412033526.369115-6-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Switch to using the TTM resource manager debugfs helpers. The
functionality is largely the same.
The TTM resource managers need to stay valid for as long as the
drm debugfs_root is valid.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 36 +++++------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 44594d16611f..d33fec488713 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -781,17 +781,6 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 
 #if defined(CONFIG_DEBUG_FS)
 
-static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
-{
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&rdev->mman.bdev,
-							    TTM_PL_VRAM);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
 static int radeon_ttm_page_pool_show(struct seq_file *m, void *data)
 {
 	struct radeon_device *rdev = (struct radeon_device *)m->private;
@@ -799,19 +788,6 @@ static int radeon_ttm_page_pool_show(struct seq_file *m, void *data)
 	return ttm_pool_debugfs(&rdev->mman.bdev.pool, m);
 }
 
-static int radeon_mm_gtt_dump_table_show(struct seq_file *m, void *unused)
-{
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
-	struct ttm_resource_manager *man = ttm_manager_type(&rdev->mman.bdev,
-							    TTM_PL_TT);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(radeon_mm_vram_dump_table);
-DEFINE_SHOW_ATTRIBUTE(radeon_mm_gtt_dump_table);
 DEFINE_SHOW_ATTRIBUTE(radeon_ttm_page_pool);
 
 static int radeon_ttm_vram_open(struct inode *inode, struct file *filep)
@@ -930,15 +906,15 @@ static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
 
 	debugfs_create_file("radeon_vram", 0444, root, rdev,
 			    &radeon_ttm_vram_fops);
-
 	debugfs_create_file("radeon_gtt", 0444, root, rdev,
 			    &radeon_ttm_gtt_fops);
-
-	debugfs_create_file("radeon_vram_mm", 0444, root, rdev,
-			    &radeon_mm_vram_dump_table_fops);
-	debugfs_create_file("radeon_gtt_mm", 0444, root, rdev,
-			    &radeon_mm_gtt_dump_table_fops);
 	debugfs_create_file("ttm_page_pool", 0444, root, rdev,
 			    &radeon_ttm_page_pool_fops);
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&rdev->mman.bdev,
+							     TTM_PL_VRAM),
+					    root, "radeon_vram_mm");
+	ttm_resource_manager_create_debugfs(ttm_manager_type(&rdev->mman.bdev,
+							     TTM_PL_TT),
+					    root, "radeon_gtt_mm");
 #endif
 }
-- 
2.32.0

