Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172A2CAD65
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25576E8F1;
	Tue,  1 Dec 2020 20:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F8E6E8E6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:33:37 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 1 Dec 2020 12:18:28 -0800
Received: from vertex.vmware.com (unknown [10.21.244.133])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id E57D820AB9;
 Tue,  1 Dec 2020 12:18:30 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/vmwgfx: Cleanup fifo mmio handling
Date: Tue, 1 Dec 2020 15:18:24 -0500
Message-ID: <20201201201828.808888-4-zackr@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201201828.808888-1-zackr@vmware.com>
References: <20201201201828.808888-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Going forward the svga device might reuse mmio for general
register accesses, in order to prepare for that we need to
cleanup our naming and handling of fifo specific mmio reads
and writes. As part of this work lets switch to managed
mapping of the fifo mmio to make the error handling cleaner.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c   | 29 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h   | 31 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 24 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c  | 83 +++++++++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 13 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c   |  9 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c   | 14 ++---
 7 files changed, 94 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index a2617422a612..23ae86ab9250 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -681,7 +681,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 
 	dev_priv->io_start = pci_resource_start(dev_priv->drm.pdev, 0);
 	dev_priv->vram_start = pci_resource_start(dev_priv->drm.pdev, 1);
-	dev_priv->mmio_start = pci_resource_start(dev_priv->drm.pdev, 2);
+	dev_priv->fifo_mem_start = pci_resource_start(dev_priv->drm.pdev, 2);
 
 	dev_priv->assume_16bpp = !!vmw_assume_16bpp;
 
@@ -711,7 +711,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 	}
 
 	dev_priv->vram_size = vmw_read(dev_priv, SVGA_REG_VRAM_SIZE);
-	dev_priv->mmio_size = vmw_read(dev_priv, SVGA_REG_MEM_SIZE);
+	dev_priv->fifo_mem_size = vmw_read(dev_priv, SVGA_REG_MEM_SIZE);
 	dev_priv->fb_max_width = vmw_read(dev_priv, SVGA_REG_MAX_WIDTH);
 	dev_priv->fb_max_height = vmw_read(dev_priv, SVGA_REG_MAX_HEIGHT);
 
@@ -796,19 +796,21 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 		DRM_INFO("Max dedicated hypervisor surface memory is %u kiB\n",
 			 (unsigned)dev_priv->memory_size / 1024);
 	}
-	DRM_INFO("Maximum display memory size is %u kiB\n",
+	DRM_INFO("Maximum display memory size is %llu kiB\n",
 		 dev_priv->prim_bb_mem / 1024);
-	DRM_INFO("VRAM at 0x%08x size is %u kiB\n",
+	DRM_INFO("VRAM at 0x%08llx size is %llu kiB\n",
 		 dev_priv->vram_start, dev_priv->vram_size / 1024);
-	DRM_INFO("MMIO at 0x%08x size is %u kiB\n",
-		 dev_priv->mmio_start, dev_priv->mmio_size / 1024);
+	DRM_INFO("MMIO at 0x%08llx size is %llu kiB\n",
+		 dev_priv->fifo_mem_start, dev_priv->fifo_mem_size / 1024);
 
-	dev_priv->mmio_virt = memremap(dev_priv->mmio_start,
-				       dev_priv->mmio_size, MEMREMAP_WB);
+	dev_priv->fifo_mem = devm_memremap(dev_priv->drm.dev,
+					   dev_priv->fifo_mem_start,
+					   dev_priv->fifo_mem_size,
+					   MEMREMAP_WB);
 
-	if (unlikely(dev_priv->mmio_virt == NULL)) {
+	if (unlikely(dev_priv->fifo_mem == NULL)) {
 		ret = -ENOMEM;
-		DRM_ERROR("Failed mapping MMIO.\n");
+		DRM_ERROR("Failed mapping the FIFO MMIO.\n");
 		goto out_err0;
 	}
 
@@ -818,7 +820,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 	    !vmw_fifo_have_pitchlock(dev_priv)) {
 		ret = -ENOSYS;
 		DRM_ERROR("Hardware has no pitchlock\n");
-		goto out_err4;
+		goto out_err0;
 	}
 
 	dev_priv->tdev = ttm_object_device_init(&ttm_mem_glob, 12,
@@ -827,7 +829,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 	if (unlikely(dev_priv->tdev == NULL)) {
 		DRM_ERROR("Unable to initialize TTM object management.\n");
 		ret = -ENOMEM;
-		goto out_err4;
+		goto out_err0;
 	}
 
 	dev_priv->drm.dev_private = dev_priv;
@@ -986,8 +988,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 	pci_release_regions(dev_priv->drm.pdev);
 out_no_device:
 	ttm_object_device_release(&dev_priv->tdev);
-out_err4:
-	memunmap(dev_priv->mmio_virt);
 out_err0:
 	for (i = vmw_res_context; i < vmw_res_max; ++i)
 		idr_destroy(&dev_priv->res_idr[i]);
@@ -1034,7 +1034,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 	pci_release_regions(dev->pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
-	memunmap(dev_priv->mmio_virt);
 	if (dev_priv->ctx.staged_bindings)
 		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b9669867e177..e388edb9e50f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -499,12 +499,13 @@ struct vmw_private {
 
 	struct drm_vma_offset_manager vma_manager;
 	unsigned long vmw_chipset;
-	unsigned int io_start;
-	uint32_t vram_start;
-	uint32_t vram_size;
-	uint32_t prim_bb_mem;
-	uint32_t mmio_start;
-	uint32_t mmio_size;
+	resource_size_t io_start;
+	resource_size_t vram_start;
+	resource_size_t vram_size;
+	resource_size_t prim_bb_mem;
+	u32 *fifo_mem;
+	resource_size_t fifo_mem_start;
+	resource_size_t fifo_mem_size;
 	uint32_t fb_max_width;
 	uint32_t fb_max_height;
 	uint32_t texture_max_width;
@@ -513,7 +514,6 @@ struct vmw_private {
 	uint32_t stdu_max_height;
 	uint32_t initial_width;
 	uint32_t initial_height;
-	u32 *mmio_virt;
 	uint32_t capabilities;
 	uint32_t capabilities2;
 	uint32_t max_gmr_ids;
@@ -1578,28 +1578,29 @@ static inline void vmw_fifo_resource_dec(struct vmw_private *dev_priv)
 }
 
 /**
- * vmw_mmio_read - Perform a MMIO read from volatile memory
+ * vmw_fifo_mem_read - Perform a MMIO read from the fifo memory
  *
- * @addr: The address to read from
+ * @fifo_reg: The fifo register to read from
  *
  * This function is intended to be equivalent to ioread32() on
  * memremap'd memory, but without byteswapping.
  */
-static inline u32 vmw_mmio_read(u32 *addr)
+static inline u32 vmw_fifo_mem_read(struct vmw_private *vmw, uint32 fifo_reg)
 {
-	return READ_ONCE(*addr);
+	return READ_ONCE(*(vmw->fifo_mem + fifo_reg));
 }
 
 /**
- * vmw_mmio_write - Perform a MMIO write to volatile memory
+ * vmw_fifo_mem_write - Perform a MMIO write to volatile memory
  *
- * @addr: The address to write to
+ * @addr: The fifo register to write to
  *
  * This function is intended to be equivalent to iowrite32 on
  * memremap'd memory, but without byteswapping.
  */
-static inline void vmw_mmio_write(u32 value, u32 *addr)
+static inline void vmw_fifo_mem_write(struct vmw_private *vmw, u32 fifo_reg,
+				      u32 value)
 {
-	WRITE_ONCE(*addr, value);
+	WRITE_ONCE(*(vmw->fifo_mem + fifo_reg), value);
 }
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 66fa81e20990..378ec7600154 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -141,8 +141,7 @@ static bool vmw_fence_enable_signaling(struct dma_fence *f)
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	struct vmw_private *dev_priv = fman->dev_priv;
 
-	u32 *fifo_mem = dev_priv->mmio_virt;
-	u32 seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE);
+	u32 seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
 	if (seqno - fence->base.seqno < VMW_FENCE_WRAP)
 		return false;
 
@@ -401,14 +400,12 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 				      u32 passed_seqno)
 {
 	u32 goal_seqno;
-	u32 *fifo_mem;
 	struct vmw_fence_obj *fence;
 
 	if (likely(!fman->seqno_valid))
 		return false;
 
-	fifo_mem = fman->dev_priv->mmio_virt;
-	goal_seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE_GOAL);
+	goal_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE_GOAL);
 	if (likely(passed_seqno - goal_seqno >= VMW_FENCE_WRAP))
 		return false;
 
@@ -416,8 +413,9 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 	list_for_each_entry(fence, &fman->fence_list, head) {
 		if (!list_empty(&fence->seq_passed_actions)) {
 			fman->seqno_valid = true;
-			vmw_mmio_write(fence->base.seqno,
-				       fifo_mem + SVGA_FIFO_FENCE_GOAL);
+			vmw_fifo_mem_write(fman->dev_priv,
+					   SVGA_FIFO_FENCE_GOAL,
+					   fence->base.seqno);
 			break;
 		}
 	}
@@ -445,18 +443,17 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
 {
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	u32 goal_seqno;
-	u32 *fifo_mem;
 
 	if (dma_fence_is_signaled_locked(&fence->base))
 		return false;
 
-	fifo_mem = fman->dev_priv->mmio_virt;
-	goal_seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE_GOAL);
+	goal_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE_GOAL);
 	if (likely(fman->seqno_valid &&
 		   goal_seqno - fence->base.seqno < VMW_FENCE_WRAP))
 		return false;
 
-	vmw_mmio_write(fence->base.seqno, fifo_mem + SVGA_FIFO_FENCE_GOAL);
+	vmw_fifo_mem_write(fman->dev_priv, SVGA_FIFO_FENCE_GOAL,
+			   fence->base.seqno);
 	fman->seqno_valid = true;
 
 	return true;
@@ -468,9 +465,8 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 	struct list_head action_list;
 	bool needs_rerun;
 	uint32_t seqno, new_seqno;
-	u32 *fifo_mem = fman->dev_priv->mmio_virt;
 
-	seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE);
+	seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE);
 rerun:
 	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
@@ -492,7 +488,7 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 
 	needs_rerun = vmw_fence_goal_new_locked(fman, seqno);
 	if (unlikely(needs_rerun)) {
-		new_seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE);
+		new_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE);
 		if (new_seqno != seqno) {
 			seqno = new_seqno;
 			goto rerun;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index a95156fc5db7..4674bc1c32f0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -38,7 +38,6 @@ struct vmw_temp_set_context {
 
 bool vmw_fifo_have_3d(struct vmw_private *dev_priv)
 {
-	u32 *fifo_mem = dev_priv->mmio_virt;
 	uint32_t fifo_min, hwversion;
 	const struct vmw_fifo_state *fifo = &dev_priv->fifo;
 
@@ -62,11 +61,11 @@ bool vmw_fifo_have_3d(struct vmw_private *dev_priv)
 	if (!(dev_priv->capabilities & SVGA_CAP_EXTENDED_FIFO))
 		return false;
 
-	fifo_min = vmw_mmio_read(fifo_mem  + SVGA_FIFO_MIN);
+	fifo_min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
 	if (fifo_min <= SVGA_FIFO_3D_HWVERSION * sizeof(unsigned int))
 		return false;
 
-	hwversion = vmw_mmio_read(fifo_mem +
+	hwversion = vmw_fifo_mem_read(dev_priv,
 				  ((fifo->capabilities &
 				    SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
 				   SVGA_FIFO_3D_HWVERSION_REVISED :
@@ -87,13 +86,12 @@ bool vmw_fifo_have_3d(struct vmw_private *dev_priv)
 
 bool vmw_fifo_have_pitchlock(struct vmw_private *dev_priv)
 {
-	u32  *fifo_mem = dev_priv->mmio_virt;
 	uint32_t caps;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_EXTENDED_FIFO))
 		return false;
 
-	caps = vmw_mmio_read(fifo_mem + SVGA_FIFO_CAPABILITIES);
+	caps = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CAPABILITIES);
 	if (caps & SVGA_FIFO_CAP_PITCHLOCK)
 		return true;
 
@@ -102,7 +100,6 @@ bool vmw_fifo_have_pitchlock(struct vmw_private *dev_priv)
 
 int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 {
-	u32  *fifo_mem = dev_priv->mmio_virt;
 	uint32_t max;
 	uint32_t min;
 
@@ -139,19 +136,19 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 	if (min < PAGE_SIZE)
 		min = PAGE_SIZE;
 
-	vmw_mmio_write(min, fifo_mem + SVGA_FIFO_MIN);
-	vmw_mmio_write(dev_priv->mmio_size, fifo_mem + SVGA_FIFO_MAX);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_MIN, min);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_MAX, dev_priv->fifo_mem_size);
 	wmb();
-	vmw_mmio_write(min,  fifo_mem + SVGA_FIFO_NEXT_CMD);
-	vmw_mmio_write(min,  fifo_mem + SVGA_FIFO_STOP);
-	vmw_mmio_write(0, fifo_mem + SVGA_FIFO_BUSY);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_NEXT_CMD, min);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_STOP, min);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_BUSY, 0);
 	mb();
 
 	vmw_write(dev_priv, SVGA_REG_CONFIG_DONE, 1);
 
-	max = vmw_mmio_read(fifo_mem + SVGA_FIFO_MAX);
-	min = vmw_mmio_read(fifo_mem  + SVGA_FIFO_MIN);
-	fifo->capabilities = vmw_mmio_read(fifo_mem + SVGA_FIFO_CAPABILITIES);
+	max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
+	fifo->capabilities = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CAPABILITIES);
 
 	DRM_INFO("Fifo max 0x%08x min 0x%08x cap 0x%08x\n",
 		 (unsigned int) max,
@@ -159,7 +156,7 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 		 (unsigned int) fifo->capabilities);
 
 	atomic_set(&dev_priv->marker_seq, dev_priv->last_read_seqno);
-	vmw_mmio_write(dev_priv->last_read_seqno, fifo_mem + SVGA_FIFO_FENCE);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, dev_priv->last_read_seqno);
 	vmw_marker_queue_init(&fifo->marker_queue);
 
 	return 0;
@@ -167,7 +164,7 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 
 void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
 {
-	u32 *fifo_mem = dev_priv->mmio_virt;
+	u32 *fifo_mem = dev_priv->fifo_mem;
 
 	if (cmpxchg(fifo_mem + SVGA_FIFO_BUSY, 0, 1) == 0)
 		vmw_write(dev_priv, SVGA_REG_SYNC, reason);
@@ -175,13 +172,11 @@ void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
 
 void vmw_fifo_release(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 {
-	u32  *fifo_mem = dev_priv->mmio_virt;
-
 	vmw_write(dev_priv, SVGA_REG_SYNC, SVGA_SYNC_GENERIC);
 	while (vmw_read(dev_priv, SVGA_REG_BUSY) != 0)
 		;
 
-	dev_priv->last_read_seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE);
+	dev_priv->last_read_seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
 
 	vmw_write(dev_priv, SVGA_REG_CONFIG_DONE,
 		  dev_priv->config_done_state);
@@ -205,11 +200,10 @@ void vmw_fifo_release(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 
 static bool vmw_fifo_is_full(struct vmw_private *dev_priv, uint32_t bytes)
 {
-	u32  *fifo_mem = dev_priv->mmio_virt;
-	uint32_t max = vmw_mmio_read(fifo_mem + SVGA_FIFO_MAX);
-	uint32_t next_cmd = vmw_mmio_read(fifo_mem + SVGA_FIFO_NEXT_CMD);
-	uint32_t min = vmw_mmio_read(fifo_mem + SVGA_FIFO_MIN);
-	uint32_t stop = vmw_mmio_read(fifo_mem + SVGA_FIFO_STOP);
+	uint32_t max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	uint32_t next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
+	uint32_t min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
+	uint32_t stop = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_STOP);
 
 	return ((max - next_cmd) + (stop - min) <= bytes);
 }
@@ -298,7 +292,7 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 				    uint32_t bytes)
 {
 	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
-	u32  *fifo_mem = dev_priv->mmio_virt;
+	u32  *fifo_mem = dev_priv->fifo_mem;
 	uint32_t max;
 	uint32_t min;
 	uint32_t next_cmd;
@@ -306,9 +300,9 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 	int ret;
 
 	mutex_lock(&fifo_state->fifo_mutex);
-	max = vmw_mmio_read(fifo_mem + SVGA_FIFO_MAX);
-	min = vmw_mmio_read(fifo_mem + SVGA_FIFO_MIN);
-	next_cmd = vmw_mmio_read(fifo_mem + SVGA_FIFO_NEXT_CMD);
+	max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
+	next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
 
 	if (unlikely(bytes >= (max - min)))
 		goto out_err;
@@ -319,7 +313,7 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 	fifo_state->reserved_size = bytes;
 
 	while (1) {
-		uint32_t stop = vmw_mmio_read(fifo_mem + SVGA_FIFO_STOP);
+		uint32_t stop = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_STOP);
 		bool need_bounce = false;
 		bool reserve_in_place = false;
 
@@ -353,8 +347,9 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 				fifo_state->using_bounce_buffer = false;
 
 				if (reserveable)
-					vmw_mmio_write(bytes, fifo_mem +
-						       SVGA_FIFO_RESERVED);
+					vmw_fifo_mem_write(dev_priv,
+							   SVGA_FIFO_RESERVED,
+							   bytes);
 				return (void __force *) (fifo_mem +
 							 (next_cmd >> 2));
 			} else {
@@ -402,10 +397,11 @@ void *vmw_fifo_reserve_dx(struct vmw_private *dev_priv, uint32_t bytes,
 }
 
 static void vmw_fifo_res_copy(struct vmw_fifo_state *fifo_state,
-			      u32  *fifo_mem,
+			      struct vmw_private *vmw,
 			      uint32_t next_cmd,
 			      uint32_t max, uint32_t min, uint32_t bytes)
 {
+	u32 *fifo_mem = vmw->fifo_mem;
 	uint32_t chunk_size = max - next_cmd;
 	uint32_t rest;
 	uint32_t *buffer = (fifo_state->dynamic_buffer != NULL) ?
@@ -414,7 +410,7 @@ static void vmw_fifo_res_copy(struct vmw_fifo_state *fifo_state,
 	if (bytes < chunk_size)
 		chunk_size = bytes;
 
-	vmw_mmio_write(bytes, fifo_mem + SVGA_FIFO_RESERVED);
+	vmw_fifo_mem_write(vmw, SVGA_FIFO_RESERVED, bytes);
 	mb();
 	memcpy(fifo_mem + (next_cmd >> 2), buffer, chunk_size);
 	rest = bytes - chunk_size;
@@ -423,7 +419,7 @@ static void vmw_fifo_res_copy(struct vmw_fifo_state *fifo_state,
 }
 
 static void vmw_fifo_slow_copy(struct vmw_fifo_state *fifo_state,
-			       u32  *fifo_mem,
+			       struct vmw_private *vmw,
 			       uint32_t next_cmd,
 			       uint32_t max, uint32_t min, uint32_t bytes)
 {
@@ -431,12 +427,12 @@ static void vmw_fifo_slow_copy(struct vmw_fifo_state *fifo_state,
 	    fifo_state->dynamic_buffer : fifo_state->static_buffer;
 
 	while (bytes > 0) {
-		vmw_mmio_write(*buffer++, fifo_mem + (next_cmd >> 2));
+		vmw_fifo_mem_write(vmw, (next_cmd >> 2), *buffer++);
 		next_cmd += sizeof(uint32_t);
 		if (unlikely(next_cmd == max))
 			next_cmd = min;
 		mb();
-		vmw_mmio_write(next_cmd, fifo_mem + SVGA_FIFO_NEXT_CMD);
+		vmw_fifo_mem_write(vmw, SVGA_FIFO_NEXT_CMD, next_cmd);
 		mb();
 		bytes -= sizeof(uint32_t);
 	}
@@ -445,10 +441,9 @@ static void vmw_fifo_slow_copy(struct vmw_fifo_state *fifo_state,
 static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
 {
 	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
-	u32  *fifo_mem = dev_priv->mmio_virt;
-	uint32_t next_cmd = vmw_mmio_read(fifo_mem + SVGA_FIFO_NEXT_CMD);
-	uint32_t max = vmw_mmio_read(fifo_mem + SVGA_FIFO_MAX);
-	uint32_t min = vmw_mmio_read(fifo_mem + SVGA_FIFO_MIN);
+	uint32_t next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
+	uint32_t max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	uint32_t min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
 	bool reserveable = fifo_state->capabilities & SVGA_FIFO_CAP_RESERVE;
 
 	if (fifo_state->dx)
@@ -462,10 +457,10 @@ static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
 
 	if (fifo_state->using_bounce_buffer) {
 		if (reserveable)
-			vmw_fifo_res_copy(fifo_state, fifo_mem,
+			vmw_fifo_res_copy(fifo_state, dev_priv,
 					  next_cmd, max, min, bytes);
 		else
-			vmw_fifo_slow_copy(fifo_state, fifo_mem,
+			vmw_fifo_slow_copy(fifo_state, dev_priv,
 					   next_cmd, max, min, bytes);
 
 		if (fifo_state->dynamic_buffer) {
@@ -481,11 +476,11 @@ static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
 		if (next_cmd >= max)
 			next_cmd -= max - min;
 		mb();
-		vmw_mmio_write(next_cmd, fifo_mem + SVGA_FIFO_NEXT_CMD);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_NEXT_CMD, next_cmd);
 	}
 
 	if (reserveable)
-		vmw_mmio_write(0, fifo_mem + SVGA_FIFO_RESERVED);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_RESERVED, 0);
 	mb();
 	up_write(&fifo_state->rwsem);
 	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index f681b7b4df1b..c21a841dfc6d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -67,7 +67,6 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 		break;
 	case DRM_VMW_PARAM_FIFO_HW_VERSION:
 	{
-		u32 *fifo_mem = dev_priv->mmio_virt;
 		const struct vmw_fifo_state *fifo = &dev_priv->fifo;
 
 		if ((dev_priv->capabilities & SVGA_CAP_GBOBJECTS)) {
@@ -76,11 +75,11 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 		}
 
 		param->value =
-			vmw_mmio_read(fifo_mem +
-				      ((fifo->capabilities &
-					SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
-				       SVGA_FIFO_3D_HWVERSION_REVISED :
-				       SVGA_FIFO_3D_HWVERSION));
+			vmw_fifo_mem_read(dev_priv,
+					  ((fifo->capabilities &
+					    SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
+						   SVGA_FIFO_3D_HWVERSION_REVISED :
+						   SVGA_FIFO_3D_HWVERSION));
 		break;
 	}
 	case DRM_VMW_PARAM_MAX_SURF_MEMORY:
@@ -235,7 +234,7 @@ int vmw_get_cap_3d_ioctl(struct drm_device *dev, void *data,
 		if (unlikely(ret != 0))
 			goto out_err;
 	} else {
-		fifo_mem = dev_priv->mmio_virt;
+		fifo_mem = dev_priv->fifo_mem;
 		memcpy(bounce, &fifo_mem[SVGA_FIFO_3D_CAPS], size);
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 75f3efee21a4..c62bbe1d2eb6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -117,8 +117,7 @@ static bool vmw_fifo_idle(struct vmw_private *dev_priv, uint32_t seqno)
 void vmw_update_seqno(struct vmw_private *dev_priv,
 			 struct vmw_fifo_state *fifo_state)
 {
-	u32 *fifo_mem = dev_priv->mmio_virt;
-	uint32_t seqno = vmw_mmio_read(fifo_mem + SVGA_FIFO_FENCE);
+	uint32_t seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
 
 	if (dev_priv->last_read_seqno != seqno) {
 		dev_priv->last_read_seqno = seqno;
@@ -222,11 +221,9 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 		}
 	}
 	finish_wait(&dev_priv->fence_queue, &__wait);
-	if (ret == 0 && fifo_idle) {
-		u32 *fifo_mem = dev_priv->mmio_virt;
+	if (ret == 0 && fifo_idle)
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, signal_seq);
 
-		vmw_mmio_write(signal_seq, fifo_mem + SVGA_FIFO_FENCE);
-	}
 	wake_up_all(&dev_priv->fence_queue);
 out_err:
 	if (fifo_idle)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 9c285c799fc8..2c72f87173c3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -128,15 +128,14 @@ static int vmw_cursor_update_bo(struct vmw_private *dev_priv,
 static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 				       bool show, int x, int y)
 {
-	u32 *fifo_mem = dev_priv->mmio_virt;
 	uint32_t count;
 
 	spin_lock(&dev_priv->cursor_lock);
-	vmw_mmio_write(show ? 1 : 0, fifo_mem + SVGA_FIFO_CURSOR_ON);
-	vmw_mmio_write(x, fifo_mem + SVGA_FIFO_CURSOR_X);
-	vmw_mmio_write(y, fifo_mem + SVGA_FIFO_CURSOR_Y);
-	count = vmw_mmio_read(fifo_mem + SVGA_FIFO_CURSOR_COUNT);
-	vmw_mmio_write(++count, fifo_mem + SVGA_FIFO_CURSOR_COUNT);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, show ? 1 : 0);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
+	count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++count);
 	spin_unlock(&dev_priv->cursor_lock);
 }
 
@@ -1874,8 +1873,7 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 	if (vmw_priv->capabilities & SVGA_CAP_PITCHLOCK)
 		vmw_write(vmw_priv, SVGA_REG_PITCHLOCK, pitch);
 	else if (vmw_fifo_have_pitchlock(vmw_priv))
-		vmw_mmio_write(pitch, vmw_priv->mmio_virt +
-			       SVGA_FIFO_PITCHLOCK);
+		vmw_fifo_mem_write(vmw_priv, SVGA_FIFO_PITCHLOCK, pitch);
 	vmw_write(vmw_priv, SVGA_REG_WIDTH, width);
 	vmw_write(vmw_priv, SVGA_REG_HEIGHT, height);
 	vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, bpp);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
