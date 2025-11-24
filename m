Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351CBC7EE61
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 04:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8BA10E1C6;
	Mon, 24 Nov 2025 03:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="qyG2ReSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CFC10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Fb4uAKe98doAxEpq379jRK9y8558ix6zV32BDPkIjNQ=; b=qyG2ReSENhBuAs84PLUTcEhtoq
 Jl0dsxKEtZGDF1i6zbr+WJVcvvC5VdgCklxFJNx+ia6jk8e40AFctqcpLUpixqG0TNKtB9/N7LNUv
 DEj1QJMN5dhKyzRadAbmpfk5Mtrzcd0oz0LRVdRJcYJ7IfRLN4P97HZbv9NRY+tZIDCqat5ScoliD
 xdEK3CdOSjWLMSEzR0z0xulBwaAhYauIw3w939UEP9Q+ofj3ooEDNw2GmIoKClu/R41+YiwK0QMVm
 N69+87c0lJIR2bmyJEfRRg90ABE/ZzfXEmKE+LOH2fu5bqCLKWYaSeTf+pBvjQ5t1r94pITD1MTml
 smTcEYIg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vNNKF-0000000B2B7-0dhP; Mon, 24 Nov 2025 03:33:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/vmwgfx: fix kernel-doc warnings in vmwgfx_drv.h
Date: Sun, 23 Nov 2025 19:33:14 -0800
Message-ID: <20251124033314.2987196-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Fix 45+ kernel-doc warnings in vmwgfx_drv.h:
- spell a struct name correctly
- don't have structs between kernel-doc and its struct
- end description of struct members with ':'
- start all kernel-doc lines with " *"
- mark private struct member and enum value with "private:"
- add kernel-doc for enum vmw_dma_map_mode
- add missing struct member comments
- add missing function parameter comments
- convert "/**" to "/*" for non-kernel-doc comments
- add missing "Returns:" comments for several functions
- correct a function parameter name

to eliminate kernel-doc warnings (examples):

Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:128 struct vmw_bo; error:
 Cannot parse struct or union!
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:151 struct member 'used_prio'
 not described in 'vmw_resource'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:151 struct member 'mob_node'
 not described in 'vmw_resource'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:199 bad line: SM4 device.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:270 struct member 'private'
 not described in 'vmw_res_cache_entry'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:280 Enum value
 'vmw_dma_alloc_coherent' not described in enum 'vmw_dma_map_mode'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:280 Enum value
 'vmw_dma_map_bind' not described in enum 'vmw_dma_map_mode'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:295 struct member 'addrs'
 not described in 'vmw_sg_table'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:295 struct member 'mode'
 not described in 'vmw_sg_table'
vmwgfx_drv.h:309: warning: Excess struct member 'num_regions' description
 in 'vmw_sg_table'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:402 struct member 'filp'
 not described in 'vmw_sw_context'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:732 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:742 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:762 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:887 No description found for
 return value of 'vmw_fifo_caps'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:901 No description found for
 return value of 'vmw_is_cursor_bypass3_enabled'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:906 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:961 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:996 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1082 cannot understand
 function prototype: 'const struct dma_buf_ops vmw_prime_dmabuf_ops;'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1303 struct member 'do_cpy'
 not described in 'vmw_diff_cpy'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1385 function parameter 'fmt'
 not described in 'VMW_DEBUG_KMS'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1389 This comment starts with
 '/**', but isn't a kernel-doc comment.
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1426 function parameter 'vmw'
 not described in 'vmw_fifo_mem_read'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1426 No description found for
 return value of 'vmw_fifo_mem_read'
Warning: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:1441 function parameter
 'fifo_reg' not described in 'vmw_fifo_mem_write'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: <bcm-kernel-feedback-list@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |   93 +++++++++++++++-----------
 1 file changed, 57 insertions(+), 36 deletions(-)

--- linux-next-20251121.orig/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ linux-next-20251121/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -96,12 +96,17 @@ struct vmwgfx_hash_item {
 
 struct vmw_res_func;
 
+struct vmw_bo;
+struct vmw_bo;
+struct vmw_resource_dirty;
+
 /**
- * struct vmw-resource - base class for hardware resources
+ * struct vmw_resource - base class for hardware resources
  *
  * @kref: For refcounting.
  * @dev_priv: Pointer to the device private for this resource. Immutable.
  * @id: Device id. Protected by @dev_priv::resource_lock.
+ * @used_prio: Priority for this resource.
  * @guest_memory_size: Guest memory buffer size. Immutable.
  * @res_dirty: Resource contains data not yet in the guest memory buffer.
  * Protected by resource reserved.
@@ -117,18 +122,16 @@ struct vmw_res_func;
  * pin-count greater than zero. It is not on the resource LRU lists and its
  * guest memory buffer is pinned. Hence it can't be evicted.
  * @func: Method vtable for this resource. Immutable.
- * @mob_node; Node for the MOB guest memory rbtree. Protected by
+ * @mob_node: Node for the MOB guest memory rbtree. Protected by
  * @guest_memory_bo reserved.
  * @lru_head: List head for the LRU list. Protected by @dev_priv::resource_lock.
  * @binding_head: List head for the context binding list. Protected by
  * the @dev_priv::binding_mutex
+ * @dirty: resource's dirty tracker
  * @res_free: The resource destructor.
  * @hw_destroy: Callback to destroy the resource on the device, as part of
  * resource destruction.
  */
-struct vmw_bo;
-struct vmw_bo;
-struct vmw_resource_dirty;
 struct vmw_resource {
 	struct kref kref;
 	struct vmw_private *dev_priv;
@@ -196,8 +199,8 @@ struct vmw_surface_offset;
  * @quality_level: Quality level.
  * @autogen_filter: Filter for automatically generated mipmaps.
  * @array_size: Number of array elements for a 1D/2D texture. For cubemap
-                texture number of faces * array_size. This should be 0 for pre
-		SM4 device.
+ *              texture number of faces * array_size. This should be 0 for pre
+ *		SM4 device.
  * @buffer_byte_stride: Buffer byte stride.
  * @num_sizes: Size of @sizes. For GB surface this should always be 1.
  * @base_size: Surface dimension.
@@ -265,18 +268,24 @@ struct vmw_fifo_state {
 struct vmw_res_cache_entry {
 	uint32_t handle;
 	struct vmw_resource *res;
+	/* private: */
 	void *private;
+	/* public: */
 	unsigned short valid_handle;
 	unsigned short valid;
 };
 
 /**
  * enum vmw_dma_map_mode - indicate how to perform TTM page dma mappings.
+ * @vmw_dma_alloc_coherent: Use TTM coherent pages
+ * @vmw_dma_map_populate: Unmap from DMA just after unpopulate
+ * @vmw_dma_map_bind: Unmap from DMA just before unbind
  */
 enum vmw_dma_map_mode {
-	vmw_dma_alloc_coherent, /* Use TTM coherent pages */
-	vmw_dma_map_populate,   /* Unmap from DMA just after unpopulate */
-	vmw_dma_map_bind,       /* Unmap from DMA just before unbind */
+	vmw_dma_alloc_coherent,
+	vmw_dma_map_populate,
+	vmw_dma_map_bind,
+	/* private: */
 	vmw_dma_map_max
 };
 
@@ -284,8 +293,11 @@ enum vmw_dma_map_mode {
  * struct vmw_sg_table - Scatter/gather table for binding, with additional
  * device-specific information.
  *
+ * @mode: which page mapping mode to use
+ * @pages: Array of page pointers to the pages.
+ * @addrs: DMA addresses to the pages if coherent pages are used.
  * @sgt: Pointer to a struct sg_table with binding information
- * @num_regions: Number of regions with device-address contiguous pages
+ * @num_pages: Number of @pages
  */
 struct vmw_sg_table {
 	enum vmw_dma_map_mode mode;
@@ -353,6 +365,7 @@ struct vmw_ctx_validation_info;
  * than from user-space
  * @fp: If @kernel is false, points to the file of the client. Otherwise
  * NULL
+ * @filp: DRM state for this file
  * @cmd_bounce: Command bounce buffer used for command validation before
  * copying to fifo space
  * @cmd_bounce_size: Current command bounce buffer size
@@ -729,7 +742,7 @@ extern void vmw_svga_disable(struct vmw_
 bool vmwgfx_supported(struct vmw_private *vmw);
 
 
-/**
+/*
  * GMR utilities - vmwgfx_gmr.c
  */
 
@@ -739,7 +752,7 @@ extern int vmw_gmr_bind(struct vmw_priva
 			int gmr_id);
 extern void vmw_gmr_unbind(struct vmw_private *dev_priv, int gmr_id);
 
-/**
+/*
  * User handles
  */
 struct vmw_user_object {
@@ -759,7 +772,7 @@ void *vmw_user_object_map_size(struct vm
 void vmw_user_object_unmap(struct vmw_user_object *uo);
 bool vmw_user_object_is_mapped(struct vmw_user_object *uo);
 
-/**
+/*
  * Resource utilities - vmwgfx_resource.c
  */
 struct vmw_user_resource_conv;
@@ -819,7 +832,7 @@ static inline bool vmw_resource_mob_atta
 	return !RB_EMPTY_NODE(&res->mob_node);
 }
 
-/**
+/*
  * GEM related functionality - vmwgfx_gem.c
  */
 struct vmw_bo_params;
@@ -833,7 +846,7 @@ extern int vmw_gem_object_create_ioctl(s
 				       struct drm_file *filp);
 extern void vmw_debugfs_gem_init(struct vmw_private *vdev);
 
-/**
+/*
  * Misc Ioctl functionality - vmwgfx_ioctl.c
  */
 
@@ -846,7 +859,7 @@ extern int vmw_present_ioctl(struct drm_
 extern int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
 
-/**
+/*
  * Fifo utilities - vmwgfx_fifo.c
  */
 
@@ -880,9 +893,11 @@ extern int vmw_cmd_flush(struct vmw_priv
 
 
 /**
- * vmw_fifo_caps - Returns the capabilities of the FIFO command
+ * vmw_fifo_caps - Get the capabilities of the FIFO command
  * queue or 0 if fifo memory isn't present.
  * @dev_priv: The device private context
+ *
+ * Returns: capabilities of the FIFO command or %0 if fifo memory not present
  */
 static inline uint32_t vmw_fifo_caps(const struct vmw_private *dev_priv)
 {
@@ -893,9 +908,11 @@ static inline uint32_t vmw_fifo_caps(con
 
 
 /**
- * vmw_is_cursor_bypass3_enabled - Returns TRUE iff Cursor Bypass 3
- * is enabled in the FIFO.
+ * vmw_is_cursor_bypass3_enabled - check Cursor Bypass 3 enabled setting
+ * in the FIFO.
  * @dev_priv: The device private context
+ *
+ * Returns: %true iff Cursor Bypass 3 is enabled in the FIFO
  */
 static inline bool
 vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
@@ -903,7 +920,7 @@ vmw_is_cursor_bypass3_enabled(const stru
 	return (vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_CURSOR_BYPASS_3) != 0;
 }
 
-/**
+/*
  * TTM buffer object driver - vmwgfx_ttm_buffer.c
  */
 
@@ -927,7 +944,7 @@ extern void vmw_piter_start(struct vmw_p
  *
  * @viter: Pointer to the iterator to advance.
  *
- * Returns false if past the list of pages, true otherwise.
+ * Returns: false if past the list of pages, true otherwise.
  */
 static inline bool vmw_piter_next(struct vmw_piter *viter)
 {
@@ -939,7 +956,7 @@ static inline bool vmw_piter_next(struct
  *
  * @viter: Pointer to the iterator
  *
- * Returns the DMA address of the page pointed to by @viter.
+ * Returns: the DMA address of the page pointed to by @viter.
  */
 static inline dma_addr_t vmw_piter_dma_addr(struct vmw_piter *viter)
 {
@@ -951,14 +968,14 @@ static inline dma_addr_t vmw_piter_dma_a
  *
  * @viter: Pointer to the iterator
  *
- * Returns the DMA address of the page pointed to by @viter.
+ * Returns: the DMA address of the page pointed to by @viter.
  */
 static inline struct page *vmw_piter_page(struct vmw_piter *viter)
 {
 	return viter->pages[viter->i];
 }
 
-/**
+/*
  * Command submission - vmwgfx_execbuf.c
  */
 
@@ -993,7 +1010,7 @@ extern int vmw_execbuf_copy_fence_user(s
 					int32_t out_fence_fd);
 bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd);
 
-/**
+/*
  * IRQs and wating - vmwgfx_irq.c
  */
 
@@ -1016,7 +1033,7 @@ bool vmw_generic_waiter_add(struct vmw_p
 bool vmw_generic_waiter_remove(struct vmw_private *dev_priv,
 			       u32 flag, int *waiter_count);
 
-/**
+/*
  * Kernel modesetting - vmwgfx_kms.c
  */
 
@@ -1048,7 +1065,7 @@ extern int vmw_resource_pin(struct vmw_r
 extern void vmw_resource_unpin(struct vmw_resource *res);
 extern enum vmw_res_type vmw_res_type(const struct vmw_resource *res);
 
-/**
+/*
  * Overlay control - vmwgfx_overlay.c
  */
 
@@ -1063,20 +1080,20 @@ int vmw_overlay_unref(struct vmw_private
 int vmw_overlay_num_overlays(struct vmw_private *dev_priv);
 int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
 
-/**
+/*
  * GMR Id manager
  */
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
 void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type);
 
-/**
+/*
  * System memory manager
  */
 int vmw_sys_man_init(struct vmw_private *dev_priv);
 void vmw_sys_man_fini(struct vmw_private *dev_priv);
 
-/**
+/*
  * Prime - vmwgfx_prime.c
  */
 
@@ -1292,7 +1309,7 @@ extern void vmw_cmdbuf_irqthread(struct
  * @line: The current line of the blit.
  * @line_offset: Offset of the current line segment.
  * @cpp: Bytes per pixel (granularity information).
- * @memcpy: Which memcpy function to use.
+ * @do_cpy: Which memcpy function to use.
  */
 struct vmw_diff_cpy {
 	struct drm_rect rect;
@@ -1380,13 +1397,14 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_f
 
 /**
  * VMW_DEBUG_KMS - Debug output for kernel mode-setting
+ * @fmt: format string for the args
  *
  * This macro is for debugging vmwgfx mode-setting code.
  */
 #define VMW_DEBUG_KMS(fmt, ...)                                               \
 	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
-/**
+/*
  * Inline helper functions
  */
 
@@ -1417,11 +1435,13 @@ static inline void vmw_fifo_resource_dec
 
 /**
  * vmw_fifo_mem_read - Perform a MMIO read from the fifo memory
- *
+ * @vmw: The device private structure
  * @fifo_reg: The fifo register to read from
  *
  * This function is intended to be equivalent to ioread32() on
  * memremap'd memory, but without byteswapping.
+ *
+ * Returns: the value read
  */
 static inline u32 vmw_fifo_mem_read(struct vmw_private *vmw, uint32 fifo_reg)
 {
@@ -1431,8 +1451,9 @@ static inline u32 vmw_fifo_mem_read(stru
 
 /**
  * vmw_fifo_mem_write - Perform a MMIO write to volatile memory
- *
- * @addr: The fifo register to write to
+ * @vmw: The device private structure
+ * @fifo_reg: The fifo register to write to
+ * @value: The value to write
  *
  * This function is intended to be equivalent to iowrite32 on
  * memremap'd memory, but without byteswapping.
