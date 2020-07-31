Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC15233E00
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776E46E9A2;
	Fri, 31 Jul 2020 04:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BA46E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-k0SelrAAOHGHcVd3mGDj_Q-1; Fri, 31 Jul 2020 00:06:37 -0400
X-MC-Unique: k0SelrAAOHGHcVd3mGDj_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9910A1DE0;
 Fri, 31 Jul 2020 04:06:36 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B8361001281;
 Fri, 31 Jul 2020 04:06:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 31/49] drm/radeon/ttm: use wrapper to access memory manager
Date: Fri, 31 Jul 2020 14:05:02 +1000
Message-Id: <20200731040520.3701599-32-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

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
index e65297b4b678..3849d0e852bc 100644
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
@@ -379,7 +379,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	mem->bus.addr = NULL;
@@ -826,8 +825,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
 		}
 		radeon_bo_unref(&rdev->stolen_vga_memory);
 	}
-	ttm_bo_man_takedown(&rdev->mman.bdev, &rdev->mman.bdev.man[TTM_PL_VRAM]);
-	ttm_bo_man_takedown(&rdev->mman.bdev, &rdev->mman.bdev.man[TTM_PL_TT]);
+	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM));
+	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT));
 	ttm_bo_device_release(&rdev->mman.bdev);
 	radeon_gart_fini(rdev);
 	rdev->mman.initialized = false;
@@ -843,7 +842,7 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 	if (!rdev->mman.initialized)
 		return;
 
-	man = &rdev->mman.bdev.man[TTM_PL_VRAM];
+	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
 	man->size = size >> PAGE_SHIFT;
 }
@@ -897,7 +896,7 @@ static int radeon_mm_dump_table(struct seq_file *m, void *data)
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
