Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C232E3CA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645926EB1B;
	Fri,  5 Mar 2021 08:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Thu, 04 Mar 2021 15:20:12 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107146E4BB;
 Thu,  4 Mar 2021 15:20:12 +0000 (UTC)
Message-Id: <20210303132711.754979779@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=9faHMiVNywi4bTvkQWsVt6JBdbgbuuop7i9PAkb1cms=;
 b=SVWS5Bolf5CbdytCwu1g8bpTWgjuGONk/1VvoNwioM0r2jP2mzpDCzTlalsnz/mJOYDNoU
 xsnVCuWb4XBOyyhedwfgM9RWywj9Qax2o4rQIMUDt7LVMcTIP3DxHFTwB1p3GEy6oSxI0T
 V9KMagRFL9ukycpqQxG6d8PG1LKrYj5FW3Ev5X62zBdF/X5ssjfOYcqasHBYGAXOqfM5YT
 Q9Ojyqx4JFIJC0D6MvFxaZMFkLnEiuINYcJqf19B38N6zPs1TW96JJOPlgn7JTmx7/8BwV
 qTkwfWwuNLCCX6aZ+R/X6D1CZVdX1+TrzufT4hq34parLO/hrcR+iAvR+21XKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=9faHMiVNywi4bTvkQWsVt6JBdbgbuuop7i9PAkb1cms=;
 b=cLdq3aFswHqDjXNn0aTKV7h/d8u13KzZkkxyaFKX8IT3A45rlMfbQ+7AzSIcaXaIQEwr/m
 FoS0nqDw2VyG2qCw==
Date: Wed, 03 Mar 2021 14:20:27 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 4/7] drm/qxl: Replace io_mapping_map_atomic_wc()
References: <20210303132023.077167457@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner <tglx@linutronix.de>

None of these mapping requires the side effect of disabling pagefaults and
preemption.

Use io_mapping_map_local_wc() instead, rename the related functions
accordingly and clean up qxl_process_single_command() to use a plain
copy_from_user() as the local maps are not disabling pagefaults.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_image.c   |   18 +++++++++---------
 drivers/gpu/drm/qxl/qxl_ioctl.c   |   27 +++++++++++++--------------
 drivers/gpu/drm/qxl/qxl_object.c  |   12 ++++++------
 drivers/gpu/drm/qxl/qxl_object.h  |    4 ++--
 drivers/gpu/drm/qxl/qxl_release.c |    4 ++--
 5 files changed, 32 insertions(+), 33 deletions(-)

--- a/drivers/gpu/drm/qxl/qxl_image.c
+++ b/drivers/gpu/drm/qxl/qxl_image.c
@@ -124,12 +124,12 @@ qxl_image_init_helper(struct qxl_device
 				  wrong (check the bitmaps are sent correctly
 				  first) */
 
-	ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, 0);
+	ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, 0);
 	chunk = ptr;
 	chunk->data_size = height * chunk_stride;
 	chunk->prev_chunk = 0;
 	chunk->next_chunk = 0;
-	qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 
 	{
 		void *k_data, *i_data;
@@ -143,7 +143,7 @@ qxl_image_init_helper(struct qxl_device
 			i_data = (void *)data;
 
 			while (remain > 0) {
-				ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, page << PAGE_SHIFT);
+				ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, page << PAGE_SHIFT);
 
 				if (page == 0) {
 					chunk = ptr;
@@ -157,7 +157,7 @@ qxl_image_init_helper(struct qxl_device
 
 				memcpy(k_data, i_data, size);
 
-				qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+				qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 				i_data += size;
 				remain -= size;
 				page++;
@@ -175,10 +175,10 @@ qxl_image_init_helper(struct qxl_device
 					page_offset = offset_in_page(out_offset);
 					size = min((int)(PAGE_SIZE - page_offset), remain);
 
-					ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, page_base);
+					ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, page_base);
 					k_data = ptr + page_offset;
 					memcpy(k_data, i_data, size);
-					qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+					qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 					remain -= size;
 					i_data += size;
 					out_offset += size;
@@ -189,7 +189,7 @@ qxl_image_init_helper(struct qxl_device
 	qxl_bo_kunmap(chunk_bo);
 
 	image_bo = dimage->bo;
-	ptr = qxl_bo_kmap_atomic_page(qdev, image_bo, 0);
+	ptr = qxl_bo_kmap_local_page(qdev, image_bo, 0);
 	image = ptr;
 
 	image->descriptor.id = 0;
@@ -212,7 +212,7 @@ qxl_image_init_helper(struct qxl_device
 		break;
 	default:
 		DRM_ERROR("unsupported image bit depth\n");
-		qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
+		qxl_bo_kunmap_local_page(qdev, image_bo, ptr);
 		return -EINVAL;
 	}
 	image->u.bitmap.flags = QXL_BITMAP_TOP_DOWN;
@@ -222,7 +222,7 @@ qxl_image_init_helper(struct qxl_device
 	image->u.bitmap.palette = 0;
 	image->u.bitmap.data = qxl_bo_physical_address(qdev, chunk_bo, 0);
 
-	qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, image_bo, ptr);
 
 	return 0;
 }
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -89,11 +89,11 @@ apply_reloc(struct qxl_device *qdev, str
 {
 	void *reloc_page;
 
-	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	reloc_page = qxl_bo_kmap_local_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
 	*(uint64_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = qxl_bo_physical_address(qdev,
 											      info->src_bo,
 											      info->src_offset);
-	qxl_bo_kunmap_atomic_page(qdev, info->dst_bo, reloc_page);
+	qxl_bo_kunmap_local_page(qdev, info->dst_bo, reloc_page);
 }
 
 static void
@@ -105,9 +105,9 @@ apply_surf_reloc(struct qxl_device *qdev
 	if (info->src_bo && !info->src_bo->is_primary)
 		id = info->src_bo->surface_id;
 
-	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	reloc_page = qxl_bo_kmap_local_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
 	*(uint32_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = id;
-	qxl_bo_kunmap_atomic_page(qdev, info->dst_bo, reloc_page);
+	qxl_bo_kunmap_local_page(qdev, info->dst_bo, reloc_page);
 }
 
 /* return holding the reference to this object */
@@ -149,7 +149,6 @@ static int qxl_process_single_command(st
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
 	int i, ret, num_relocs;
-	int unwritten;
 
 	switch (cmd->type) {
 	case QXL_CMD_DRAW:
@@ -184,21 +183,21 @@ static int qxl_process_single_command(st
 		goto out_free_reloc;
 
 	/* TODO copy slow path code from i915 */
-	fb_cmd = qxl_bo_kmap_atomic_page(qdev, cmd_bo, (release->release_offset & PAGE_MASK));
-	unwritten = __copy_from_user_inatomic_nocache
-		(fb_cmd + sizeof(union qxl_release_info) + (release->release_offset & ~PAGE_MASK),
-		 u64_to_user_ptr(cmd->command), cmd->command_size);
+	fb_cmd = qxl_bo_kmap_local_page(qdev, cmd_bo, (release->release_offset & PAGE_MASK));
 
-	{
+	if (copy_from_user(fb_cmd + sizeof(union qxl_release_info) +
+			   (release->release_offset & ~PAGE_MASK),
+			   u64_to_user_ptr(cmd->command), cmd->command_size)) {
+		ret = -EFAULT;
+	} else {
 		struct qxl_drawable *draw = fb_cmd;
 
 		draw->mm_time = qdev->rom->mm_clock;
 	}
 
-	qxl_bo_kunmap_atomic_page(qdev, cmd_bo, fb_cmd);
-	if (unwritten) {
-		DRM_ERROR("got unwritten %d\n", unwritten);
-		ret = -EFAULT;
+	qxl_bo_kunmap_local_page(qdev, cmd_bo, fb_cmd);
+	if (ret) {
+		DRM_ERROR("copy from user failed %d\n", ret);
 		goto out_free_release;
 	}
 
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -178,8 +178,8 @@ int qxl_bo_kmap(struct qxl_bo *bo, struc
 	return 0;
 }
 
-void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
-			      struct qxl_bo *bo, int page_offset)
+void *qxl_bo_kmap_local_page(struct qxl_device *qdev,
+			     struct qxl_bo *bo, int page_offset)
 {
 	unsigned long offset;
 	void *rptr;
@@ -195,7 +195,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl
 		goto fallback;
 
 	offset = bo->tbo.mem.start << PAGE_SHIFT;
-	return io_mapping_map_atomic_wc(map, offset + page_offset);
+	return io_mapping_map_local_wc(map, offset + page_offset);
 fallback:
 	if (bo->kptr) {
 		rptr = bo->kptr + (page_offset * PAGE_SIZE);
@@ -222,14 +222,14 @@ void qxl_bo_kunmap(struct qxl_bo *bo)
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
-void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
-			       struct qxl_bo *bo, void *pmap)
+void qxl_bo_kunmap_local_page(struct qxl_device *qdev,
+			      struct qxl_bo *bo, void *pmap)
 {
 	if ((bo->tbo.mem.mem_type != TTM_PL_VRAM) &&
 	    (bo->tbo.mem.mem_type != TTM_PL_PRIV))
 		goto fallback;
 
-	io_mapping_unmap_atomic(pmap);
+	io_mapping_unmap_local(pmap);
 	return;
  fallback:
 	qxl_bo_kunmap(bo);
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -65,8 +65,8 @@ extern int qxl_bo_create(struct qxl_devi
 			 struct qxl_bo **bo_ptr);
 extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
 extern void qxl_bo_kunmap(struct qxl_bo *bo);
-void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
-void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
+void *qxl_bo_kmap_local_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
+void qxl_bo_kunmap_local_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
 extern struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo);
 extern void qxl_bo_unref(struct qxl_bo **bo);
 extern int qxl_bo_pin(struct qxl_bo *bo);
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -408,7 +408,7 @@ union qxl_release_info *qxl_release_map(
 	union qxl_release_info *info;
 	struct qxl_bo *bo = release->release_bo;
 
-	ptr = qxl_bo_kmap_atomic_page(qdev, bo, release->release_offset & PAGE_MASK);
+	ptr = qxl_bo_kmap_local_page(qdev, bo, release->release_offset & PAGE_MASK);
 	if (!ptr)
 		return NULL;
 	info = ptr + (release->release_offset & ~PAGE_MASK);
@@ -423,7 +423,7 @@ void qxl_release_unmap(struct qxl_device
 	void *ptr;
 
 	ptr = ((void *)info) - (release->release_offset & ~PAGE_MASK);
-	qxl_bo_kunmap_atomic_page(qdev, bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, bo, ptr);
 }
 
 void qxl_release_fence_buffer_objects(struct qxl_release *release)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
