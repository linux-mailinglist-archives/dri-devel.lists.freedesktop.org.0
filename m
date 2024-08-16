Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08F9550EB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37FD10E820;
	Fri, 16 Aug 2024 18:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Z+9aZ1I0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B54A10E81F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:33:38 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4f89c9a1610so823159e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723833217; x=1724438017;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYWUUg7NqfFpMWHrS5ST33hphvYoId+HX6paVNnT26A=;
 b=Z+9aZ1I0AjOVKLZEY/UvgDWYvJ8BTyM78aJGb+nSyKiPCDGWPl+bZqjvaI8C6l4VyB
 eB2z2+HAIweBSqLqMq3MLYAkQZkP4XenNm2YBx0jXkh+T18JcSCXgr6JEe2p1qq0Uxt+
 5x64mAYzkiwexUy6FLYZj0iztgJnjYcezAXAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723833217; x=1724438017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aYWUUg7NqfFpMWHrS5ST33hphvYoId+HX6paVNnT26A=;
 b=bnMZEhS2+j7MI0AM15DWTqoR97dqDqz8jPpHynKPH/Q1dkDKo/RkZ+Bp7yLPNTfIxE
 hHjLd0TDnXngd9nSH+D1gCPv8I1vsEQD2YAaTjAfOnHvbqiSqop5WXod5m+LtN3Q10tQ
 N5FzcvpJVnOA83feiIRASdEV2qK+aXi5q3FghW8AomOYPAjDctx7jN7JtABSokJ+Siv+
 M93IxF7gVofeIYTJ9H+y9rzT4KDhyIISWDhyarMC4q1mciM71uiSPahUjNxqWMTsBTYd
 eua8PATjH0mrSK8pcLKMWSy5v2zrM4WWohfrZrv+DcpjTX7/W7asC/fJkCox455LYaMk
 grig==
X-Gm-Message-State: AOJu0YxUTKX+5jxMDOGhy9q720PFv/k3Oj5gV2g2YV4xsiIF/oFDBWi1
 6YnqIKctG8eSLR7gsRYS/Tpwm+UUX/FxxZD0MEL5dacSSTCy5VOAGYpmO/g/VSo20d7SnhM/O+d
 2BpJIRooYjnY5dIr8N4aEamkvJw3azJvCHja6t6pzkRrpnY535gdG6TNZhbB0QcgGa8upf0T8u6
 dyNGmiY8+l+FwA1k0sgMx8msXm246yZAo3asIJ05wL/Yli1rxMKw==
X-Google-Smtp-Source: AGHT+IEJN6SqabK0hXe4/wuk8ON4Xn26kMUnOPhCQagh51AfPPmbe9A1X5WVVFoIJIGC62rF+8iWRw==
X-Received: by 2002:a05:6122:3189:b0:4f5:cd00:e492 with SMTP id
 71dfb90a1353d-4fc6c981e94mr4519312e0c.7.1723833216756; 
 Fri, 16 Aug 2024 11:33:36 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fe26c71sm20164106d6.61.2024.08.16.11.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 11:33:36 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 2/3] drm/vmwgfx: Fix prime with external buffers
Date: Fri, 16 Aug 2024 14:32:06 -0400
Message-ID: <20240816183332.31961-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
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
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 114 ++++++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  12 +--
 3 files changed, 118 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 717d624e9a05..890a66a2361f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -27,6 +27,8 @@
  **************************************************************************/
 
 #include "vmwgfx_drv.h"
+
+#include "vmwgfx_bo.h"
 #include <linux/highmem.h>
 
 /*
@@ -420,13 +422,105 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
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
@@ -444,13 +538,15 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
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
@@ -460,6 +556,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
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
@@ -479,6 +580,11 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
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
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 32f50e595809..3f4719b3c268 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1353,9 +1353,9 @@ void vmw_diff_memcpy(struct vmw_diff_cpy *diff, u8 *dest, const u8 *src,
 
 void vmw_memcpy(struct vmw_diff_cpy *diff, u8 *dest, const u8 *src, size_t n);
 
-int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
+int vmw_bo_cpu_blit(struct vmw_bo *dst,
 		    u32 dst_offset, u32 dst_stride,
-		    struct ttm_buffer_object *src,
+		    struct vmw_bo *src,
 		    u32 src_offset, u32 src_stride,
 		    u32 w, u32 h,
 		    struct vmw_diff_cpy *diff);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 5106413c14b7..3cc664384b66 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -502,7 +502,7 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
 		container_of(dirty->unit, typeof(*stdu), base);
 	s32 width, height;
 	s32 src_pitch, dst_pitch;
-	struct ttm_buffer_object *src_bo, *dst_bo;
+	struct vmw_bo *src_bo, *dst_bo;
 	u32 src_offset, dst_offset;
 	struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(stdu->cpp);
 
@@ -517,11 +517,11 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
 
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
@@ -1143,7 +1143,7 @@ vmw_stdu_bo_populate_update_cpu(struct vmw_du_update_plane  *update, void *cmd,
 	struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(0);
 	struct vmw_stdu_update_gb_image *cmd_img = cmd;
 	struct vmw_stdu_update *cmd_update;
-	struct ttm_buffer_object *src_bo, *dst_bo;
+	struct vmw_bo *src_bo, *dst_bo;
 	u32 src_offset, dst_offset;
 	s32 src_pitch, dst_pitch;
 	s32 width, height;
@@ -1157,11 +1157,11 @@ vmw_stdu_bo_populate_update_cpu(struct vmw_du_update_plane  *update, void *cmd,
 
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
-- 
2.43.0

