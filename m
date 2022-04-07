Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E14F7264
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7BC10E6D0;
	Thu,  7 Apr 2022 02:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A53910E6D2;
 Thu,  7 Apr 2022 02:57:07 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1BD8B28A5AD;
 Thu,  7 Apr 2022 03:57:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300226; bh=MJyVD/iMfXRk6vVc3NufqUnHwHBXkEJZwGtyTUoYVaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZfR8C/YBoyGabkpMln+bS2FtST2+FV9NVl9i8bg0cMp3Dc+UPdVW+5ya4llddewET
 f5Ho/zTfCUhwW34dZq7wwGyTcSBWTDRnhORRRzTZ+tJgUW08NgZ3bGSvQr8PxocBYC
 ADdpR4hQ+Skt4oVaiBlbSL2wW1MNa5bX6Ze/p2PqdNWFR5DsJXzCJCld8XIP9myczb
 AIU/3Unfp3p7oQQQwnT230oGAtKUFqjn4NZaQzh7ZK/uDDjmKc5Yfj+lfjI6Al8laM
 KRE+/Su+gz0MPV8Hx5sMbhbJieBWxLWjbq1tmiBDeoFJ3jYjZ+hJCRe7bkdbu3QXj+
 tDVG3aspZ7xnQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/radeon: Use TTM builtin resource manager debugfs code
Date: Wed,  6 Apr 2022 22:56:51 -0400
Message-Id: <20220407025652.146426-6-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Switch to using the TTM resource manager debugfs helpers. The
functionality is largely the same, except that the entries live under
/sys/kernel/debug/ttm/ and their lifetimes are managed by TTM.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 37 ++++++-----------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 44594d16611f..dc6250d5a9cf 100644
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
@@ -927,18 +903,19 @@ static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct drm_minor *minor = rdev->ddev->primary;
 	struct dentry *root = minor->debugfs_root;
+	const char * const ttm_placement_names[] = {
+		[TTM_PL_TT] = "radeon_gtt_mm",
+		[TTM_PL_VRAM] = "radeon_vram_mm"
+	};
 
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
+	ttm_resource_manager_debugfs_init(&rdev->mman.bdev,
+					  ttm_placement_names,
+					  ARRAY_SIZE(ttm_placement_names));
 #endif
 }
-- 
2.32.0

