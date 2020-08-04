Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDD23B31C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3CC6E41A;
	Tue,  4 Aug 2020 02:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07C06E426
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-L9uN0kJrP-q1_DWw_5DK7Q-1; Mon, 03 Aug 2020 22:58:23 -0400
X-MC-Unique: L9uN0kJrP-q1_DWw_5DK7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A1E11005504;
 Tue,  4 Aug 2020 02:58:22 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6C78AD1C;
 Tue,  4 Aug 2020 02:58:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 41/59] drm/radeon/ttm: use wrapper to access memory manager
Date: Tue,  4 Aug 2020 12:56:14 +1000
Message-Id: <20200804025632.3868079-42-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 44157ada9b0e..3ec028dba739 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -226,7 +226,7 @@ int radeon_gem_info_ioctl(struct drm_device *dev, void *data,
 	struct drm_radeon_gem_info *args = data;
 	struct ttm_mem_type_manager *man;
 
-	man = &rdev->mman.bdev.man[TTM_PL_VRAM];
+	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 
 	args->vram_size = (u64)man->size << PAGE_SHIFT;
 	args->vram_visible = rdev->mc.visible_vram_size;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 76b409af9476..03c0a24e74c4 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -68,7 +68,7 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
-	struct ttm_mem_type_manager *man = &rdev->mman.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
@@ -79,7 +79,7 @@ static int radeon_ttm_init_vram(struct radeon_device *rdev)
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
-	struct ttm_mem_type_manager *man = &rdev->mman.bdev.man[TTM_PL_TT];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
 
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
@@ -825,8 +825,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
 		}
 		radeon_bo_unref(&rdev->stolen_vga_memory);
 	}
-	ttm_range_man_fini(&rdev->mman.bdev, &rdev->mman.bdev.man[TTM_PL_VRAM]);
-	ttm_range_man_fini(&rdev->mman.bdev, &rdev->mman.bdev.man[TTM_PL_TT]);
+	ttm_range_man_fini(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM));
+	ttm_range_man_fini(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT));
 	ttm_bo_device_release(&rdev->mman.bdev);
 	radeon_gart_fini(rdev);
 	rdev->mman.initialized = false;
@@ -842,7 +842,7 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 	if (!rdev->mman.initialized)
 		return;
 
-	man = &rdev->mman.bdev.man[TTM_PL_VRAM];
+	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
 	man->size = size >> PAGE_SHIFT;
 }
@@ -896,7 +896,7 @@ static int radeon_mm_dump_table(struct seq_file *m, void *data)
 	unsigned ttm_pl = *(int*)node->info_ent->data;
 	struct drm_device *dev = node->minor->dev;
 	struct radeon_device *rdev = dev->dev_private;
-	struct ttm_mem_type_manager *man = &rdev->mman.bdev.man[ttm_pl];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, ttm_pl);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	man->func->debug(man, &p);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
