Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB569677E9
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 18:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01D10E168;
	Sun,  1 Sep 2024 16:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pnjlPKxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE210E168
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 16:25:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F1A85C3F14;
 Sun,  1 Sep 2024 16:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F6C4CEC3;
 Sun,  1 Sep 2024 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725207947;
 bh=ePoorId5HzPEfgUBY+GfG+e53pXXh+CIHbHwo92lG1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pnjlPKxTzvi+of+IL4awzYviFkwV9GpowtKzIJHmaQxEy9OZli0yUNGyvL6Fn345n
 XV8ljbZi1Xvo6/ePT+Qb71FVT+TRv3UiMId+xncV4FWKNXib1Z3csmvQ1tv0l/K41v
 ogVt7CefyldpdhoUZotXByTnGkFtLivG3lqf1LOU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org,
 Martin Krastev <martin.krastev@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH 6.6 26/93] drm/vmwgfx: Fix prime with external buffers
Date: Sun,  1 Sep 2024 18:16:13 +0200
Message-ID: <20240901160808.343211809@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901160807.346406833@linuxfoundation.org>
References: <20240901160807.346406833@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Zack Rusin <zack.rusin@broadcom.com>

commit 50f1199250912568606b3778dc56646c10cb7b04 upstream.

Make sure that for external buffers mapping goes through the dma_buf
interface instead of trying to access pages directly.

External buffers might not provide direct access to readable/writable
pages so to make sure the bo's created from external dma_bufs can be
read dma_buf interface has to be used.

Fixes crashes in IGT's kms_prime with vgem. Regular desktop usage won't
trigger this due to the fact that virtual machines will not have
multiple GPUs but it enables better test coverage in IGT.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
Cc: <stable@vger.kernel.org> # v6.6+
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.9+
Link: https://patchwork.freedesktop.org/patch/msgid/20240816183332.31961-3-zack.rusin@broadcom.com
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c |  114 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |    4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   12 +--
 3 files changed, 118 insertions(+), 12 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -27,6 +27,8 @@
  **************************************************************************/
 
 #include "vmwgfx_drv.h"
+
+#include "vmwgfx_bo.h"
 #include <linux/highmem.h>
 
 /*
@@ -420,13 +422,105 @@ static int vmw_bo_cpu_blit_line(struct v
 	return 0;
 }
 
+static void *map_external(struct vmw_bo *bo, struct iosys_map *map)
+{
+	struct vmw_private *vmw =
+		container_of(bo->tbo.bdev, struct vmw_private, bdev);
+	void *ptr = NULL;
+	int ret;
+
+	if (bo->tbo.base.import_attach) {
+		ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
+		if (ret) {
+			drm_dbg_driver(&vmw->drm,
+				       "Wasn't able to map external bo!\n");
+			goto out;
+		}
+		ptr = map->vaddr;
+	} else {
+		ptr = vmw_bo_map_and_cache(bo);
+	}
+
+out:
+	return ptr;
+}
+
+static void unmap_external(struct vmw_bo *bo, struct iosys_map *map)
+{
+	if (bo->tbo.base.import_attach)
+		dma_buf_vunmap(bo->tbo.base.dma_buf, map);
+	else
+		vmw_bo_unmap(bo);
+}
+
+static int vmw_external_bo_copy(struct vmw_bo *dst, u32 dst_offset,
+				u32 dst_stride, struct vmw_bo *src,
+				u32 src_offset, u32 src_stride,
+				u32 width_in_bytes, u32 height,
+				struct vmw_diff_cpy *diff)
+{
+	struct vmw_private *vmw =
+		container_of(dst->tbo.bdev, struct vmw_private, bdev);
+	size_t dst_size = dst->tbo.resource->size;
+	size_t src_size = src->tbo.resource->size;
+	struct iosys_map dst_map = {0};
+	struct iosys_map src_map = {0};
+	int ret, i;
+	int x_in_bytes;
+	u8 *vsrc;
+	u8 *vdst;
+
+	vsrc = map_external(src, &src_map);
+	if (!vsrc) {
+		drm_dbg_driver(&vmw->drm, "Wasn't able to map src\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	vdst = map_external(dst, &dst_map);
+	if (!vdst) {
+		drm_dbg_driver(&vmw->drm, "Wasn't able to map dst\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	vsrc += src_offset;
+	vdst += dst_offset;
+	if (src_stride == dst_stride) {
+		dst_size -= dst_offset;
+		src_size -= src_offset;
+		memcpy(vdst, vsrc,
+		       min(dst_stride * height, min(dst_size, src_size)));
+	} else {
+		WARN_ON(dst_stride < width_in_bytes);
+		for (i = 0; i < height; ++i) {
+			memcpy(vdst, vsrc, width_in_bytes);
+			vsrc += src_stride;
+			vdst += dst_stride;
+		}
+	}
+
+	x_in_bytes = (dst_offset % dst_stride);
+	diff->rect.x1 =  x_in_bytes / diff->cpp;
+	diff->rect.y1 = ((dst_offset - x_in_bytes) / dst_stride);
+	diff->rect.x2 = diff->rect.x1 + width_in_bytes / diff->cpp;
+	diff->rect.y2 = diff->rect.y1 + height;
+
+	ret = 0;
+out:
+	unmap_external(src, &src_map);
+	unmap_external(dst, &dst_map);
+
+	return ret;
+}
+
 /**
  * vmw_bo_cpu_blit - in-kernel cpu blit.
  *
- * @dst: Destination buffer object.
+ * @vmw_dst: Destination buffer object.
  * @dst_offset: Destination offset of blit start in bytes.
  * @dst_stride: Destination stride in bytes.
- * @src: Source buffer object.
+ * @vmw_src: Source buffer object.
  * @src_offset: Source offset of blit start in bytes.
  * @src_stride: Source stride in bytes.
  * @w: Width of blit.
@@ -444,13 +538,15 @@ static int vmw_bo_cpu_blit_line(struct v
  * Neither of the buffer objects may be placed in PCI memory
  * (Fixed memory in TTM terminology) when using this function.
  */
-int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
+int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
 		    u32 dst_offset, u32 dst_stride,
-		    struct ttm_buffer_object *src,
+		    struct vmw_bo *vmw_src,
 		    u32 src_offset, u32 src_stride,
 		    u32 w, u32 h,
 		    struct vmw_diff_cpy *diff)
 {
+	struct ttm_buffer_object *src = &vmw_src->tbo;
+	struct ttm_buffer_object *dst = &vmw_dst->tbo;
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = false
@@ -460,6 +556,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_ob
 	int ret = 0;
 	struct page **dst_pages = NULL;
 	struct page **src_pages = NULL;
+	bool src_external = (src->ttm->page_flags & TTM_TT_FLAG_EXTERNAL) != 0;
+	bool dst_external = (dst->ttm->page_flags & TTM_TT_FLAG_EXTERNAL) != 0;
+
+	if (WARN_ON(dst == src))
+		return -EINVAL;
 
 	/* Buffer objects need to be either pinned or reserved: */
 	if (!(dst->pin_count))
@@ -479,6 +580,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_ob
 			return ret;
 	}
 
+	if (src_external || dst_external)
+		return vmw_external_bo_copy(vmw_dst, dst_offset, dst_stride,
+					    vmw_src, src_offset, src_stride,
+					    w, h, diff);
+
 	if (!src->ttm->pages && src->ttm->sg) {
 		src_pages = kvmalloc_array(src->ttm->num_pages,
 					   sizeof(struct page *), GFP_KERNEL);
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1355,9 +1355,9 @@ void vmw_diff_memcpy(struct vmw_diff_cpy
 
 void vmw_memcpy(struct vmw_diff_cpy *diff, u8 *dest, const u8 *src, size_t n);
 
-int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
+int vmw_bo_cpu_blit(struct vmw_bo *dst,
 		    u32 dst_offset, u32 dst_stride,
-		    struct ttm_buffer_object *src,
+		    struct vmw_bo *src,
 		    u32 src_offset, u32 src_stride,
 		    u32 w, u32 h,
 		    struct vmw_diff_cpy *diff);
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -497,7 +497,7 @@ static void vmw_stdu_bo_cpu_commit(struc
 		container_of(dirty->unit, typeof(*stdu), base);
 	s32 width, height;
 	s32 src_pitch, dst_pitch;
-	struct ttm_buffer_object *src_bo, *dst_bo;
+	struct vmw_bo *src_bo, *dst_bo;
 	u32 src_offset, dst_offset;
 	struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(stdu->cpp);
 
@@ -512,11 +512,11 @@ static void vmw_stdu_bo_cpu_commit(struc
 
 	/* Assume we are blitting from Guest (bo) to Host (display_srf) */
 	src_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
-	src_bo = &stdu->display_srf->res.guest_memory_bo->tbo;
+	src_bo = stdu->display_srf->res.guest_memory_bo;
 	src_offset = ddirty->top * src_pitch + ddirty->left * stdu->cpp;
 
 	dst_pitch = ddirty->pitch;
-	dst_bo = &ddirty->buf->tbo;
+	dst_bo = ddirty->buf;
 	dst_offset = ddirty->fb_top * dst_pitch + ddirty->fb_left * stdu->cpp;
 
 	(void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
@@ -1136,7 +1136,7 @@ vmw_stdu_bo_populate_update_cpu(struct v
 	struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(0);
 	struct vmw_stdu_update_gb_image *cmd_img = cmd;
 	struct vmw_stdu_update *cmd_update;
-	struct ttm_buffer_object *src_bo, *dst_bo;
+	struct vmw_bo *src_bo, *dst_bo;
 	u32 src_offset, dst_offset;
 	s32 src_pitch, dst_pitch;
 	s32 width, height;
@@ -1150,11 +1150,11 @@ vmw_stdu_bo_populate_update_cpu(struct v
 
 	diff.cpp = stdu->cpp;
 
-	dst_bo = &stdu->display_srf->res.guest_memory_bo->tbo;
+	dst_bo = stdu->display_srf->res.guest_memory_bo;
 	dst_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
 	dst_offset = bb->y1 * dst_pitch + bb->x1 * stdu->cpp;
 
-	src_bo = &vfbbo->buffer->tbo;
+	src_bo = vfbbo->buffer;
 	src_pitch = update->vfb->base.pitches[0];
 	src_offset = bo_update->fb_top * src_pitch + bo_update->fb_left *
 		stdu->cpp;


