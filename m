Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2524178C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595526E29D;
	Tue, 11 Aug 2020 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD596E167
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-9XRZ2ewyMi6Uz-gh3JC9bA-1; Tue, 11 Aug 2020 03:47:02 -0400
X-MC-Unique: 9XRZ2ewyMi6Uz-gh3JC9bA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01FD319057A2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:02 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-101.bne.redhat.com
 [10.64.54.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 554E3920CA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:47:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: drop bus.size from bus placement.
Date: Tue, 11 Aug 2020 17:46:58 +1000
Message-Id: <20200811074658.58309-2-airlied@gmail.com>
In-Reply-To: <20200811074658.58309-1-airlied@gmail.com>
References: <20200811074658.58309-1-airlied@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This is always calculated the same, and only used in a couple of places.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 7 ++++---
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 7 ++++---
 include/drm/ttm/ttm_bo_api.h            | 2 --
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 324abf7a3cba..c16c52cc4757 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -750,6 +750,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct drm_mm_node *mm_node = mem->mm_node;
+	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
 
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
@@ -760,7 +761,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 	case TTM_PL_VRAM:
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 		/* check if it's visible */
-		if ((mem->bus.offset + mem->bus.size) > adev->gmc.visible_vram_size)
+		if ((mem->bus.offset + bus_size) > adev->gmc.visible_vram_size)
 			return -EINVAL;
 		/* Only physically contiguous buffers apply. In a contiguous
 		 * buffer, size of the first mm_node would match the number of
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 1f1e025b9f06..ca87abb4ac66 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -379,6 +379,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
 {
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
+	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
 
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
@@ -397,7 +398,7 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 	case TTM_PL_VRAM:
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 		/* check if it's visible */
-		if ((mem->bus.offset + mem->bus.size) > rdev->mc.visible_vram_size)
+		if ((mem->bus.offset + bus_size) > rdev->mc.visible_vram_size)
 			return -EINVAL;
 		mem->bus.base = rdev->mc.aper_base;
 		mem->bus.is_iomem = true;
@@ -409,11 +410,11 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
 		if (mem->placement & TTM_PL_FLAG_WC)
 			mem->bus.addr =
 				ioremap_wc(mem->bus.base + mem->bus.offset,
-					   mem->bus.size);
+					   bus_size);
 		else
 			mem->bus.addr =
 				ioremap(mem->bus.base + mem->bus.offset,
-						mem->bus.size);
+					bus_size);
 		if (!mem->bus.addr)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 023f0a2d07c9..670bd7418349 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -140,7 +140,6 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 
 	mem->bus.addr = NULL;
 	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
 	mem->bus.base = 0;
 	mem->bus.is_iomem = false;
 retry:
@@ -214,12 +213,14 @@ static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
 	if (mem->bus.addr) {
 		addr = mem->bus.addr;
 	} else {
+		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
+
 		if (mem->placement & TTM_PL_FLAG_WC)
 			addr = ioremap_wc(mem->bus.base + mem->bus.offset,
-					  mem->bus.size);
+					  bus_size);
 		else
 			addr = ioremap(mem->bus.base + mem->bus.offset,
-				       mem->bus.size);
+				       bus_size);
 		if (!addr) {
 			(void) ttm_mem_io_lock(man, false);
 			ttm_mem_io_free(bdev, mem);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 770ad2195875..e1c16c9a6c71 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -62,7 +62,6 @@ struct ttm_resource_manager;
  * @addr:		mapped virtual address
  * @base:		bus base address
  * @is_iomem:		is this io memory ?
- * @size:		size in byte
  * @offset:		offset from the base address
  * @io_reserved_vm:     The VM system has a refcount in @io_reserved_count
  * @io_reserved_count:  Refcounting the numbers of callers to ttm_mem_io_reserve
@@ -72,7 +71,6 @@ struct ttm_resource_manager;
 struct ttm_bus_placement {
 	void		*addr;
 	phys_addr_t	base;
-	unsigned long	size;
 	unsigned long	offset;
 	bool		is_iomem;
 	bool		io_reserved_vm;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
