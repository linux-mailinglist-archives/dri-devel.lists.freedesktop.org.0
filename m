Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C682EB280
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 19:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CAC6E086;
	Tue,  5 Jan 2021 18:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A856E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 18:26:18 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 5 Jan 2021 10:26:15 -0800
Received: from vertex.vmware.com (unknown [10.21.245.145])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 1D7F32088D;
 Tue,  5 Jan 2021 10:26:17 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/8] drm/vmwgfx: Remove the throttling code
Date: Tue, 5 Jan 2021 13:26:10 -0500
Message-ID: <20210105182612.46431-7-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105182612.46431-1-zackr@vmware.com>
References: <20210105182612.46431-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
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

Throttling was used before fencing to implement early vsync
support in the xorg state tracker a long time ago. The xorg
state tracker has been removed years ago and no one else
has ever used throttling. It's time to remove this code,
it hasn't been used or tested in years.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/Makefile         |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  21 ----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c    |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c     |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_marker.c  | 155 ------------------------
 6 files changed, 3 insertions(+), 188 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_marker.c

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index 31f85f09f1fc..ef455d6d7c3f 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -2,8 +2,8 @@
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
 	    vmwgfx_fifo.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
-	    vmwgfx_overlay.o vmwgfx_marker.o vmwgfx_gmrid_manager.o \
-	    vmwgfx_fence.o vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
+	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
+	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
 	    vmwgfx_surface.o vmwgfx_prime.o vmwgfx_mob.o vmwgfx_shader.o \
 	    vmwgfx_cmdbuf_res.o vmwgfx_cmdbuf.o vmwgfx_stdu.o \
 	    vmwgfx_cotable.o vmwgfx_so.o vmwgfx_binding.o vmwgfx_msg.o \
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 46ab748edb5d..f3775617a28c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -276,13 +276,6 @@ struct vmw_surface {
 	struct list_head view_list;
 };
 
-struct vmw_marker_queue {
-	struct list_head head;
-	u64 lag;
-	u64 lag_time;
-	spinlock_t lock;
-};
-
 struct vmw_fifo_state {
 	unsigned long reserved_size;
 	u32 *dynamic_buffer;
@@ -292,7 +285,6 @@ struct vmw_fifo_state {
 	uint32_t capabilities;
 	struct mutex fifo_mutex;
 	struct rw_semaphore rwsem;
-	struct vmw_marker_queue marker_queue;
 	bool dx;
 };
 
@@ -1120,19 +1112,6 @@ extern void vmw_generic_waiter_add(struct vmw_private *dev_priv, u32 flag,
 extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
 				      u32 flag, int *waiter_count);
 
-/**
- * Rudimentary fence-like objects currently used only for throttling -
- * vmwgfx_marker.c
- */
-
-extern void vmw_marker_queue_init(struct vmw_marker_queue *queue);
-extern void vmw_marker_queue_takedown(struct vmw_marker_queue *queue);
-extern int vmw_marker_push(struct vmw_marker_queue *queue,
-			   uint32_t seqno);
-extern int vmw_marker_pull(struct vmw_marker_queue *queue,
-			   uint32_t signaled_seqno);
-extern int vmw_wait_lag(struct vmw_private *dev_priv,
-			struct vmw_marker_queue *queue, uint32_t us);
 
 /**
  * Kernel framebuffer - vmwgfx_fb.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 6c016001721d..69cf0973bf28 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4046,11 +4046,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 	}
 
 	if (throttle_us) {
-		ret = vmw_wait_lag(dev_priv, &dev_priv->fifo.marker_queue,
-				   throttle_us);
-
-		if (ret)
-			goto out_free_fence_fd;
+		VMW_DEBUG_USER("Throttling is no longer supported.\n");
 	}
 
 	kernel_commands = vmw_execbuf_cmdbuf(dev_priv, user_commands,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index 4674bc1c32f0..f4b9af67551f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -157,7 +157,6 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 
 	atomic_set(&dev_priv->marker_seq, dev_priv->last_read_seqno);
 	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, dev_priv->last_read_seqno);
-	vmw_marker_queue_init(&fifo->marker_queue);
 
 	return 0;
 }
@@ -185,8 +184,6 @@ void vmw_fifo_release(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 	vmw_write(dev_priv, SVGA_REG_TRACES,
 		  dev_priv->traces_state);
 
-	vmw_marker_queue_takedown(&fifo->marker_queue);
-
 	if (likely(fifo->static_buffer != NULL)) {
 		vfree(fifo->static_buffer);
 		fifo->static_buffer = NULL;
@@ -563,7 +560,6 @@ int vmw_fifo_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
 	cmd_fence->fence = *seqno;
 	vmw_fifo_commit_flush(dev_priv, bytes);
-	(void) vmw_marker_push(&fifo_state->marker_queue, *seqno);
 	vmw_update_seqno(dev_priv, fifo_state);
 
 out_err:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index c62bbe1d2eb6..6c2a569f1fcb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -121,7 +121,6 @@ void vmw_update_seqno(struct vmw_private *dev_priv,
 
 	if (dev_priv->last_read_seqno != seqno) {
 		dev_priv->last_read_seqno = seqno;
-		vmw_marker_pull(&fifo_state->marker_queue, seqno);
 		vmw_fences_update(dev_priv->fman);
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_marker.c b/drivers/gpu/drm/vmwgfx/vmwgfx_marker.c
deleted file mode 100644
index e53bc639a754..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_marker.c
+++ /dev/null
@@ -1,155 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/**************************************************************************
- *
- * Copyright 2010 VMware, Inc., Palo Alto, CA., USA
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-
-
-#include "vmwgfx_drv.h"
-
-struct vmw_marker {
-	struct list_head head;
-	uint32_t seqno;
-	u64 submitted;
-};
-
-void vmw_marker_queue_init(struct vmw_marker_queue *queue)
-{
-	INIT_LIST_HEAD(&queue->head);
-	queue->lag = 0;
-	queue->lag_time = ktime_get_raw_ns();
-	spin_lock_init(&queue->lock);
-}
-
-void vmw_marker_queue_takedown(struct vmw_marker_queue *queue)
-{
-	struct vmw_marker *marker, *next;
-
-	spin_lock(&queue->lock);
-	list_for_each_entry_safe(marker, next, &queue->head, head) {
-		kfree(marker);
-	}
-	spin_unlock(&queue->lock);
-}
-
-int vmw_marker_push(struct vmw_marker_queue *queue,
-		   uint32_t seqno)
-{
-	struct vmw_marker *marker = kmalloc(sizeof(*marker), GFP_KERNEL);
-
-	if (unlikely(!marker))
-		return -ENOMEM;
-
-	marker->seqno = seqno;
-	marker->submitted = ktime_get_raw_ns();
-	spin_lock(&queue->lock);
-	list_add_tail(&marker->head, &queue->head);
-	spin_unlock(&queue->lock);
-
-	return 0;
-}
-
-int vmw_marker_pull(struct vmw_marker_queue *queue,
-		   uint32_t signaled_seqno)
-{
-	struct vmw_marker *marker, *next;
-	bool updated = false;
-	u64 now;
-
-	spin_lock(&queue->lock);
-	now = ktime_get_raw_ns();
-
-	if (list_empty(&queue->head)) {
-		queue->lag = 0;
-		queue->lag_time = now;
-		updated = true;
-		goto out_unlock;
-	}
-
-	list_for_each_entry_safe(marker, next, &queue->head, head) {
-		if (signaled_seqno - marker->seqno > (1 << 30))
-			continue;
-
-		queue->lag = now - marker->submitted;
-		queue->lag_time = now;
-		updated = true;
-		list_del(&marker->head);
-		kfree(marker);
-	}
-
-out_unlock:
-	spin_unlock(&queue->lock);
-
-	return (updated) ? 0 : -EBUSY;
-}
-
-static u64 vmw_fifo_lag(struct vmw_marker_queue *queue)
-{
-	u64 now;
-
-	spin_lock(&queue->lock);
-	now = ktime_get_raw_ns();
-	queue->lag += now - queue->lag_time;
-	queue->lag_time = now;
-	spin_unlock(&queue->lock);
-	return queue->lag;
-}
-
-
-static bool vmw_lag_lt(struct vmw_marker_queue *queue,
-		       uint32_t us)
-{
-	u64 cond = (u64) us * NSEC_PER_USEC;
-
-	return vmw_fifo_lag(queue) <= cond;
-}
-
-int vmw_wait_lag(struct vmw_private *dev_priv,
-		 struct vmw_marker_queue *queue, uint32_t us)
-{
-	struct vmw_marker *marker;
-	uint32_t seqno;
-	int ret;
-
-	while (!vmw_lag_lt(queue, us)) {
-		spin_lock(&queue->lock);
-		if (list_empty(&queue->head))
-			seqno = atomic_read(&dev_priv->marker_seq);
-		else {
-			marker = list_first_entry(&queue->head,
-						 struct vmw_marker, head);
-			seqno = marker->seqno;
-		}
-		spin_unlock(&queue->lock);
-
-		ret = vmw_wait_seqno(dev_priv, false, seqno, true,
-					3*HZ);
-
-		if (unlikely(ret != 0))
-			return ret;
-
-		(void) vmw_marker_pull(queue, seqno);
-	}
-	return 0;
-}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
