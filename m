Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A556CE18
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904D911AD80;
	Sun, 10 Jul 2022 08:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7965113302
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=2ARAS3YQkpnxk3GvKQ8xPro+NJJ+5ZSNmxmamrajCl8=;
 b=NATcRy20df50nkEj3NGnpNKLU60KGR8KGtjTMIy3MFcmo7CLx1xzADus4HKBjJRo/0o3mbfO7WFEm
 RR0VmF03xN6IN82w0dJyxGwSXXVP+HQxpqSyPuUCDWd7ZneB3H+O8Sc//3pEkxPA7M5CY7PMTHm7g0
 3YGU4swucxu9l4Z6T/alV3J8bfh9LQEXIYeF3ZbBvj4SmedTV5mAGQgqVL3UBjGnuGeFasCZA0EcRt
 wfm/EF2D++07/BNACz0rf2nWkkyMXfxoNzPhBgGZGpEGz+qYgrdV7JeYeT2OX5+l0wBl7ybiFTlKWU
 /fxYfC1c4VkKhCLb1M3oEsqh2qjZUew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=2ARAS3YQkpnxk3GvKQ8xPro+NJJ+5ZSNmxmamrajCl8=;
 b=9w0PzZ4gpsczbntzpKVwXcpUn2EOSMqIc7Pmh6ePafc3/3Kk7XJToXcDdfZmVp8fP5Tdb6BfE6Mh6
 J+4Tu7ADA==
X-HalOne-Cookie: 8961d6f8277b71d0b7e14470c30e3d7167dc6ed6
X-HalOne-ID: 1208b1ec-002e-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1208b1ec-002e-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 08:55:39 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 09/11] drm/via: Embed via_drv.h in via_dri1
Date: Sun, 10 Jul 2022 10:55:04 +0200
Message-Id: <20220710085506.1384056-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this change the driver is now a signle file driver.
The only remaning heder file describes the HW and can be shared with the
new openchrome driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/via/via_dri1.c | 229 +++++++++++++++++++++++++++-
 drivers/gpu/drm/via/via_drv.h  | 265 ---------------------------------
 2 files changed, 228 insertions(+), 266 deletions(-)
 delete mode 100644 drivers/gpu/drm/via/via_drv.h

diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/via/via_dri1.c
index f9285cc3e1c7..d695d9291ece 100644
--- a/drivers/gpu/drm/via/via_dri1.c
+++ b/drivers/gpu/drm/via/via_dri1.c
@@ -36,13 +36,240 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_legacy.h>
+#include <drm/drm_mm.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/via_drm.h>
 
-#include "via_drv.h"
 #include "via_3d_reg.h"
 
+#define DRIVER_AUTHOR	"Various"
+
+#define DRIVER_NAME		"via"
+#define DRIVER_DESC		"VIA Unichrome / Pro"
+#define DRIVER_DATE		"20070202"
+
+#define DRIVER_MAJOR		2
+#define DRIVER_MINOR		11
+#define DRIVER_PATCHLEVEL	1
+
+typedef enum {
+	no_sequence = 0,
+	z_address,
+	dest_address,
+	tex_address
+} drm_via_sequence_t;
+
+typedef struct {
+	unsigned texture;
+	uint32_t z_addr;
+	uint32_t d_addr;
+	uint32_t t_addr[2][10];
+	uint32_t pitch[2][10];
+	uint32_t height[2][10];
+	uint32_t tex_level_lo[2];
+	uint32_t tex_level_hi[2];
+	uint32_t tex_palette_size[2];
+	uint32_t tex_npot[2];
+	drm_via_sequence_t unfinished;
+	int agp_texture;
+	int multitex;
+	struct drm_device *dev;
+	drm_local_map_t *map_cache;
+	uint32_t vertex_count;
+	int agp;
+	const uint32_t *buf_start;
+} drm_via_state_t;
+
+#define VIA_PCI_BUF_SIZE 60000
+#define VIA_FIRE_BUF_SIZE  1024
+#define VIA_NUM_IRQS 4
+
+
+#define VIA_NUM_BLIT_ENGINES 2
+#define VIA_NUM_BLIT_SLOTS 8
+
+struct _drm_via_descriptor;
+
+typedef struct _drm_via_sg_info {
+	struct page **pages;
+	unsigned long num_pages;
+	struct _drm_via_descriptor **desc_pages;
+	int num_desc_pages;
+	int num_desc;
+	enum dma_data_direction direction;
+	unsigned char *bounce_buffer;
+	dma_addr_t chain_start;
+	uint32_t free_on_sequence;
+	unsigned int descriptors_per_page;
+	int aborted;
+	enum {
+		dr_via_device_mapped,
+		dr_via_desc_pages_alloc,
+		dr_via_pages_locked,
+		dr_via_pages_alloc,
+		dr_via_sg_init
+	} state;
+} drm_via_sg_info_t;
+
+typedef struct _drm_via_blitq {
+	struct drm_device *dev;
+	uint32_t cur_blit_handle;
+	uint32_t done_blit_handle;
+	unsigned serviced;
+	unsigned head;
+	unsigned cur;
+	unsigned num_free;
+	unsigned num_outstanding;
+	unsigned long end;
+	int aborting;
+	int is_active;
+	drm_via_sg_info_t *blits[VIA_NUM_BLIT_SLOTS];
+	spinlock_t blit_lock;
+	wait_queue_head_t blit_queue[VIA_NUM_BLIT_SLOTS];
+	wait_queue_head_t busy_queue;
+	struct work_struct wq;
+	struct timer_list poll_timer;
+} drm_via_blitq_t;
+
+typedef struct drm_via_ring_buffer {
+	drm_local_map_t map;
+	char *virtual_start;
+} drm_via_ring_buffer_t;
+
+typedef uint32_t maskarray_t[5];
+
+typedef struct drm_via_irq {
+	atomic_t irq_received;
+	uint32_t pending_mask;
+	uint32_t enable_mask;
+	wait_queue_head_t irq_queue;
+} drm_via_irq_t;
+
+typedef struct drm_via_private {
+	drm_via_sarea_t *sarea_priv;
+	drm_local_map_t *sarea;
+	drm_local_map_t *fb;
+	drm_local_map_t *mmio;
+	unsigned long agpAddr;
+	wait_queue_head_t decoder_queue[VIA_NR_XVMC_LOCKS];
+	char *dma_ptr;
+	unsigned int dma_low;
+	unsigned int dma_high;
+	unsigned int dma_offset;
+	uint32_t dma_wrap;
+	volatile uint32_t *last_pause_ptr;
+	volatile uint32_t *hw_addr_ptr;
+	drm_via_ring_buffer_t ring;
+	ktime_t last_vblank;
+	int last_vblank_valid;
+	ktime_t nsec_per_vblank;
+	atomic_t vbl_received;
+	drm_via_state_t hc_state;
+	char pci_buf[VIA_PCI_BUF_SIZE];
+	const uint32_t *fire_offsets[VIA_FIRE_BUF_SIZE];
+	uint32_t num_fire_offsets;
+	int chipset;
+	drm_via_irq_t via_irqs[VIA_NUM_IRQS];
+	unsigned num_irqs;
+	maskarray_t *irq_masks;
+	uint32_t irq_enable_mask;
+	uint32_t irq_pending_mask;
+	int *irq_map;
+	unsigned int idle_fault;
+	int vram_initialized;
+	struct drm_mm vram_mm;
+	int agp_initialized;
+	struct drm_mm agp_mm;
+	/** Mapping of userspace keys to mm objects */
+	struct idr object_idr;
+	unsigned long vram_offset;
+	unsigned long agp_offset;
+	drm_via_blitq_t blit_queues[VIA_NUM_BLIT_ENGINES];
+	uint32_t dma_diff;
+} drm_via_private_t;
+
+struct via_file_private {
+	struct list_head obj_list;
+};
+
+enum via_family {
+  VIA_OTHER = 0,     /* Baseline */
+  VIA_PRO_GROUP_A,   /* Another video engine and DMA commands */
+  VIA_DX9_0          /* Same video as pro_group_a, but 3D is unsupported */
+};
+
+/* VIA MMIO register access */
+static inline u32 via_read(struct drm_via_private *dev_priv, u32 reg)
+{
+	return readl((void __iomem *)(dev_priv->mmio->handle + reg));
+}
+
+static inline void via_write(struct drm_via_private *dev_priv, u32 reg,
+			     u32 val)
+{
+	writel(val, (void __iomem *)(dev_priv->mmio->handle + reg));
+}
+
+static inline void via_write8(struct drm_via_private *dev_priv, u32 reg,
+			      u32 val)
+{
+	writeb(val, (void __iomem *)(dev_priv->mmio->handle + reg));
+}
+
+static inline void via_write8_mask(struct drm_via_private *dev_priv,
+				   u32 reg, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readb((void __iomem *)(dev_priv->mmio->handle + reg));
+	tmp = (tmp & ~mask) | (val & mask);
+	writeb(tmp, (void __iomem *)(dev_priv->mmio->handle + reg));
+}
+
+/*
+ * Poll in a loop waiting for 'contidition' to be true.
+ * Note: A direct replacement with wait_event_interruptible_timeout()
+ *       will not work unless driver is updated to emit wake_up()
+ *       in relevant places that can impact the 'condition'
+ *
+ * Returns:
+ *   ret keeps current value if 'condition' becomes true
+ *   ret = -BUSY if timeout happens
+ *   ret = -EINTR if a signal interrupted the waiting period
+ */
+#define VIA_WAIT_ON( ret, queue, timeout, condition )		\
+do {								\
+	DECLARE_WAITQUEUE(entry, current);			\
+	unsigned long end = jiffies + (timeout);		\
+	add_wait_queue(&(queue), &entry);			\
+								\
+	for (;;) {						\
+		__set_current_state(TASK_INTERRUPTIBLE);	\
+		if (condition)					\
+			break;					\
+		if (time_after_eq(jiffies, end)) {		\
+			ret = -EBUSY;				\
+			break;					\
+		}						\
+		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
+		if (signal_pending(current)) {			\
+			ret = -EINTR;				\
+			break;					\
+		}						\
+	}							\
+	__set_current_state(TASK_RUNNING);			\
+	remove_wait_queue(&(queue), &entry);			\
+} while (0)
+
+int via_do_cleanup_map(struct drm_device *dev);
+
+int via_dma_cleanup(struct drm_device *dev);
+int via_driver_dma_quiescent(struct drm_device *dev);
+
 #define CMDBUF_ALIGNMENT_SIZE   (0x100)
 #define CMDBUF_ALIGNMENT_MASK   (0x0ff)
 
diff --git a/drivers/gpu/drm/via/via_drv.h b/drivers/gpu/drm/via/via_drv.h
deleted file mode 100644
index 640a7701f606..000000000000
--- a/drivers/gpu/drm/via/via_drv.h
+++ /dev/null
@@ -1,265 +0,0 @@
-/*
- * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
- * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-#ifndef _VIA_DRV_H_
-#define _VIA_DRV_H_
-
-#include <linux/dma-mapping.h>
-#include <linux/irqreturn.h>
-#include <linux/jiffies.h>
-#include <linux/sched.h>
-#include <linux/sched/signal.h>
-#include <linux/wait.h>
-
-#include <drm/drm_ioctl.h>
-#include <drm/drm_legacy.h>
-#include <drm/drm_mm.h>
-#include <drm/via_drm.h>
-
-#define DRIVER_AUTHOR	"Various"
-
-#define DRIVER_NAME		"via"
-#define DRIVER_DESC		"VIA Unichrome / Pro"
-#define DRIVER_DATE		"20070202"
-
-#define DRIVER_MAJOR		2
-#define DRIVER_MINOR		11
-#define DRIVER_PATCHLEVEL	1
-
-typedef enum {
-	no_sequence = 0,
-	z_address,
-	dest_address,
-	tex_address
-} drm_via_sequence_t;
-
-typedef struct {
-	unsigned texture;
-	uint32_t z_addr;
-	uint32_t d_addr;
-	uint32_t t_addr[2][10];
-	uint32_t pitch[2][10];
-	uint32_t height[2][10];
-	uint32_t tex_level_lo[2];
-	uint32_t tex_level_hi[2];
-	uint32_t tex_palette_size[2];
-	uint32_t tex_npot[2];
-	drm_via_sequence_t unfinished;
-	int agp_texture;
-	int multitex;
-	struct drm_device *dev;
-	drm_local_map_t *map_cache;
-	uint32_t vertex_count;
-	int agp;
-	const uint32_t *buf_start;
-} drm_via_state_t;
-
-#define VIA_PCI_BUF_SIZE 60000
-#define VIA_FIRE_BUF_SIZE  1024
-#define VIA_NUM_IRQS 4
-
-
-#define VIA_NUM_BLIT_ENGINES 2
-#define VIA_NUM_BLIT_SLOTS 8
-
-struct _drm_via_descriptor;
-
-typedef struct _drm_via_sg_info {
-	struct page **pages;
-	unsigned long num_pages;
-	struct _drm_via_descriptor **desc_pages;
-	int num_desc_pages;
-	int num_desc;
-	enum dma_data_direction direction;
-	unsigned char *bounce_buffer;
-	dma_addr_t chain_start;
-	uint32_t free_on_sequence;
-	unsigned int descriptors_per_page;
-	int aborted;
-	enum {
-		dr_via_device_mapped,
-		dr_via_desc_pages_alloc,
-		dr_via_pages_locked,
-		dr_via_pages_alloc,
-		dr_via_sg_init
-	} state;
-} drm_via_sg_info_t;
-
-typedef struct _drm_via_blitq {
-	struct drm_device *dev;
-	uint32_t cur_blit_handle;
-	uint32_t done_blit_handle;
-	unsigned serviced;
-	unsigned head;
-	unsigned cur;
-	unsigned num_free;
-	unsigned num_outstanding;
-	unsigned long end;
-	int aborting;
-	int is_active;
-	drm_via_sg_info_t *blits[VIA_NUM_BLIT_SLOTS];
-	spinlock_t blit_lock;
-	wait_queue_head_t blit_queue[VIA_NUM_BLIT_SLOTS];
-	wait_queue_head_t busy_queue;
-	struct work_struct wq;
-	struct timer_list poll_timer;
-} drm_via_blitq_t;
-
-typedef struct drm_via_ring_buffer {
-	drm_local_map_t map;
-	char *virtual_start;
-} drm_via_ring_buffer_t;
-
-typedef uint32_t maskarray_t[5];
-
-typedef struct drm_via_irq {
-	atomic_t irq_received;
-	uint32_t pending_mask;
-	uint32_t enable_mask;
-	wait_queue_head_t irq_queue;
-} drm_via_irq_t;
-
-typedef struct drm_via_private {
-	drm_via_sarea_t *sarea_priv;
-	drm_local_map_t *sarea;
-	drm_local_map_t *fb;
-	drm_local_map_t *mmio;
-	unsigned long agpAddr;
-	wait_queue_head_t decoder_queue[VIA_NR_XVMC_LOCKS];
-	char *dma_ptr;
-	unsigned int dma_low;
-	unsigned int dma_high;
-	unsigned int dma_offset;
-	uint32_t dma_wrap;
-	volatile uint32_t *last_pause_ptr;
-	volatile uint32_t *hw_addr_ptr;
-	drm_via_ring_buffer_t ring;
-	ktime_t last_vblank;
-	int last_vblank_valid;
-	ktime_t nsec_per_vblank;
-	atomic_t vbl_received;
-	drm_via_state_t hc_state;
-	char pci_buf[VIA_PCI_BUF_SIZE];
-	const uint32_t *fire_offsets[VIA_FIRE_BUF_SIZE];
-	uint32_t num_fire_offsets;
-	int chipset;
-	drm_via_irq_t via_irqs[VIA_NUM_IRQS];
-	unsigned num_irqs;
-	maskarray_t *irq_masks;
-	uint32_t irq_enable_mask;
-	uint32_t irq_pending_mask;
-	int *irq_map;
-	unsigned int idle_fault;
-	int vram_initialized;
-	struct drm_mm vram_mm;
-	int agp_initialized;
-	struct drm_mm agp_mm;
-	/** Mapping of userspace keys to mm objects */
-	struct idr object_idr;
-	unsigned long vram_offset;
-	unsigned long agp_offset;
-	drm_via_blitq_t blit_queues[VIA_NUM_BLIT_ENGINES];
-	uint32_t dma_diff;
-} drm_via_private_t;
-
-struct via_file_private {
-	struct list_head obj_list;
-};
-
-enum via_family {
-  VIA_OTHER = 0,     /* Baseline */
-  VIA_PRO_GROUP_A,   /* Another video engine and DMA commands */
-  VIA_DX9_0          /* Same video as pro_group_a, but 3D is unsupported */
-};
-
-/* VIA MMIO register access */
-static inline u32 via_read(struct drm_via_private *dev_priv, u32 reg)
-{
-	return readl((void __iomem *)(dev_priv->mmio->handle + reg));
-}
-
-static inline void via_write(struct drm_via_private *dev_priv, u32 reg,
-			     u32 val)
-{
-	writel(val, (void __iomem *)(dev_priv->mmio->handle + reg));
-}
-
-static inline void via_write8(struct drm_via_private *dev_priv, u32 reg,
-			      u32 val)
-{
-	writeb(val, (void __iomem *)(dev_priv->mmio->handle + reg));
-}
-
-static inline void via_write8_mask(struct drm_via_private *dev_priv,
-				   u32 reg, u32 mask, u32 val)
-{
-	u32 tmp;
-
-	tmp = readb((void __iomem *)(dev_priv->mmio->handle + reg));
-	tmp = (tmp & ~mask) | (val & mask);
-	writeb(tmp, (void __iomem *)(dev_priv->mmio->handle + reg));
-}
-
-/*
- * Poll in a loop waiting for 'contidition' to be true.
- * Note: A direct replacement with wait_event_interruptible_timeout()
- *       will not work unless driver is updated to emit wake_up()
- *       in relevant places that can impact the 'condition'
- *
- * Returns:
- *   ret keeps current value if 'condition' becomes true
- *   ret = -BUSY if timeout happens
- *   ret = -EINTR if a signal interrupted the waiting period
- */
-#define VIA_WAIT_ON( ret, queue, timeout, condition )		\
-do {								\
-	DECLARE_WAITQUEUE(entry, current);			\
-	unsigned long end = jiffies + (timeout);		\
-	add_wait_queue(&(queue), &entry);			\
-								\
-	for (;;) {						\
-		__set_current_state(TASK_INTERRUPTIBLE);	\
-		if (condition)					\
-			break;					\
-		if (time_after_eq(jiffies, end)) {		\
-			ret = -EBUSY;				\
-			break;					\
-		}						\
-		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
-		if (signal_pending(current)) {			\
-			ret = -EINTR;				\
-			break;					\
-		}						\
-	}							\
-	__set_current_state(TASK_RUNNING);			\
-	remove_wait_queue(&(queue), &entry);			\
-} while (0)
-
-extern int via_init_context(struct drm_device *dev, int context);
-
-extern int via_do_cleanup_map(struct drm_device *dev);
-
-extern int via_dma_cleanup(struct drm_device *dev);
-extern int via_driver_dma_quiescent(struct drm_device *dev);
-
-#endif
-- 
2.34.1

