Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EA4CA902
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A36310E1BD;
	Wed,  2 Mar 2022 15:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94C110E1AF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:43 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 254212838F8;
 Wed,  2 Mar 2022 15:24:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234682; bh=a/kdsXXu50lp51RCBkDK6wtbdrrgM2dvImCzCH8Qkw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OCZNohNWsNBFWhUX6RT6zUeeCY8bHf3IJ31uQqskjyegrNNTgDMaeD9l3P22hxnXZ
 lC9Hw5nJjIxiyhH/icOJ99klUrNxpArCIvAC0jRFoC4EFenP2XS2t8ViTeIPmSVUUS
 QhNOrKqz56KxRIf4IoQtZ4rplgRSvtOzeLW0j/vxEQ70GMqFStgEwuUSf4eoXEztJl
 bBzxIQcv+zGJry63ko06gBLe9Xdl1T4yfuxMtwUtvP651aKORVjta5Gg8Q3GMm1DPR
 1gOJYy0z3w3NvRBLE7LOhPCDH5JEDtG/4VS3iGd34iuShACxeA97vCI7KKPYe8Jfu8
 wI43w5inizxzg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/vmwgfx: Fix fencing on SVGAv3
Date: Wed,  2 Mar 2022 10:24:22 -0500
Message-Id: <20220302152426.885214-5-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302152426.885214-1-zack@kde.org>
References: <20220302152426.885214-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Port of the vmwgfx to SVGAv3 lacked support for fencing. SVGAv3 removed
FIFO's and replaced them with command buffers and extra registers.
The initial version of SVGAv3 lacked support for most advanced features
(e.g. 3D) which made fences unnecessary. That is no longer the case,
especially as 3D support is being turned on.

Switch from FIFO commands and capabilities to command buffers and extra
registers to enable fences on SVGAv3.

Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c   |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h   |  8 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 28 ++++++++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c   | 26 +++++++++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c   |  8 +++++---
 5 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index a3bfbb6c3e14..bf1b394753da 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -528,7 +528,7 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 		*seqno = atomic_add_return(1, &dev_priv->marker_seq);
 	} while (*seqno == 0);
 
-	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE)) {
+	if (!vmw_has_fences(dev_priv)) {
 
 		/*
 		 * Don't request hardware to send a fence. The
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 780da6147cf9..12eb4de41036 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1683,4 +1683,12 @@ static inline void vmw_irq_status_write(struct vmw_private *vmw,
 		outl(status, vmw->io_start + SVGA_IRQSTATUS_PORT);
 }
 
+static inline bool vmw_has_fences(struct vmw_private *vmw)
+{
+	if ((vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
+				  SVGA_CAP_CMD_BUFFERS_2)) != 0)
+		return true;
+	return (vmw_fifo_caps(vmw) & SVGA_FIFO_CAP_FENCE) != 0;
+}
+
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 59d6a2dd4c2e..66cc35dc223e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -82,6 +82,22 @@ fman_from_fence(struct vmw_fence_obj *fence)
 	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
 }
 
+static u32 vmw_fence_goal_read(struct vmw_private *vmw)
+{
+	if ((vmw->capabilities2 & SVGA_CAP2_EXTRA_REGS) != 0)
+		return vmw_read(vmw, SVGA_REG_FENCE_GOAL);
+	else
+		return vmw_fifo_mem_read(vmw, SVGA_FIFO_FENCE_GOAL);
+}
+
+static void vmw_fence_goal_write(struct vmw_private *vmw, u32 value)
+{
+	if ((vmw->capabilities2 & SVGA_CAP2_EXTRA_REGS) != 0)
+		vmw_write(vmw, SVGA_REG_FENCE_GOAL, value);
+	else
+		vmw_fifo_mem_write(vmw, SVGA_FIFO_FENCE_GOAL, value);
+}
+
 /*
  * Note on fencing subsystem usage of irqs:
  * Typically the vmw_fences_update function is called
@@ -392,7 +408,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 	if (likely(!fman->seqno_valid))
 		return false;
 
-	goal_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE_GOAL);
+	goal_seqno = vmw_fence_goal_read(fman->dev_priv);
 	if (likely(passed_seqno - goal_seqno >= VMW_FENCE_WRAP))
 		return false;
 
@@ -400,9 +416,8 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 	list_for_each_entry(fence, &fman->fence_list, head) {
 		if (!list_empty(&fence->seq_passed_actions)) {
 			fman->seqno_valid = true;
-			vmw_fifo_mem_write(fman->dev_priv,
-					   SVGA_FIFO_FENCE_GOAL,
-					   fence->base.seqno);
+			vmw_fence_goal_write(fman->dev_priv,
+					     fence->base.seqno);
 			break;
 		}
 	}
@@ -434,13 +449,12 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
 	if (dma_fence_is_signaled_locked(&fence->base))
 		return false;
 
-	goal_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE_GOAL);
+	goal_seqno = vmw_fence_goal_read(fman->dev_priv);
 	if (likely(fman->seqno_valid &&
 		   goal_seqno - fence->base.seqno < VMW_FENCE_WRAP))
 		return false;
 
-	vmw_fifo_mem_write(fman->dev_priv, SVGA_FIFO_FENCE_GOAL,
-			   fence->base.seqno);
+	vmw_fence_goal_write(fman->dev_priv, fence->base.seqno);
 	fman->seqno_valid = true;
 
 	return true;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index c5191de365ca..fe4732bf2c9d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -32,6 +32,14 @@
 
 #define VMW_FENCE_WRAP (1 << 24)
 
+static u32 vmw_irqflag_fence_goal(struct vmw_private *vmw)
+{
+	if ((vmw->capabilities2 & SVGA_CAP2_EXTRA_REGS) != 0)
+		return SVGA_IRQFLAG_REG_FENCE_GOAL;
+	else
+		return SVGA_IRQFLAG_FENCE_GOAL;
+}
+
 /**
  * vmw_thread_fn - Deferred (process context) irq handler
  *
@@ -96,7 +104,7 @@ static irqreturn_t vmw_irq_handler(int irq, void *arg)
 		wake_up_all(&dev_priv->fifo_queue);
 
 	if ((masked_status & (SVGA_IRQFLAG_ANY_FENCE |
-			      SVGA_IRQFLAG_FENCE_GOAL)) &&
+			      vmw_irqflag_fence_goal(dev_priv))) &&
 	    !test_and_set_bit(VMW_IRQTHREAD_FENCE, dev_priv->irqthread_pending))
 		ret = IRQ_WAKE_THREAD;
 
@@ -137,8 +145,7 @@ bool vmw_seqno_passed(struct vmw_private *dev_priv,
 	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
 		return true;
 
-	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE) &&
-	    vmw_fifo_idle(dev_priv, seqno))
+	if (!vmw_has_fences(dev_priv) && vmw_fifo_idle(dev_priv, seqno))
 		return true;
 
 	/**
@@ -160,6 +167,7 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 		      unsigned long timeout)
 {
 	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
+	bool fifo_down = false;
 
 	uint32_t count = 0;
 	uint32_t signal_seq;
@@ -176,12 +184,14 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 	 */
 
 	if (fifo_idle) {
-		down_read(&fifo_state->rwsem);
 		if (dev_priv->cman) {
 			ret = vmw_cmdbuf_idle(dev_priv->cman, interruptible,
 					      10*HZ);
 			if (ret)
 				goto out_err;
+		} else if (fifo_state) {
+			down_read(&fifo_state->rwsem);
+			fifo_down = true;
 		}
 	}
 
@@ -218,12 +228,12 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 		}
 	}
 	finish_wait(&dev_priv->fence_queue, &__wait);
-	if (ret == 0 && fifo_idle)
+	if (ret == 0 && fifo_idle && fifo_state)
 		vmw_fence_write(dev_priv, signal_seq);
 
 	wake_up_all(&dev_priv->fence_queue);
 out_err:
-	if (fifo_idle)
+	if (fifo_down)
 		up_read(&fifo_state->rwsem);
 
 	return ret;
@@ -266,13 +276,13 @@ void vmw_seqno_waiter_remove(struct vmw_private *dev_priv)
 
 void vmw_goal_waiter_add(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_add(dev_priv, SVGA_IRQFLAG_FENCE_GOAL,
+	vmw_generic_waiter_add(dev_priv, vmw_irqflag_fence_goal(dev_priv),
 			       &dev_priv->goal_queue_waiters);
 }
 
 void vmw_goal_waiter_remove(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_remove(dev_priv, SVGA_IRQFLAG_FENCE_GOAL,
+	vmw_generic_waiter_remove(dev_priv, vmw_irqflag_fence_goal(dev_priv),
 				  &dev_priv->goal_queue_waiters);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 9d82a7b49aed..af252210ef84 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1593,7 +1593,6 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 		ret = vmw_kms_new_framebuffer_surface(dev_priv, surface, &vfb,
 						      mode_cmd,
 						      is_bo_proxy);
-
 		/*
 		 * vmw_create_bo_proxy() adds a reference that is no longer
 		 * needed
@@ -1634,13 +1633,16 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	ret = vmw_user_lookup_handle(dev_priv, file_priv,
 				     mode_cmd->handles[0],
 				     &surface, &bo);
-	if (ret)
+	if (ret) {
+		DRM_ERROR("Invalid buffer object handle %u (0x%x).\n",
+			  mode_cmd->handles[0], mode_cmd->handles[0]);
 		goto err_out;
+	}
 
 
 	if (!bo &&
 	    !vmw_kms_srf_ok(dev_priv, mode_cmd->width, mode_cmd->height)) {
-		DRM_ERROR("Surface size cannot exceed %dx%d",
+		DRM_ERROR("Surface size cannot exceed %dx%d\n",
 			dev_priv->texture_max_width,
 			dev_priv->texture_max_height);
 		goto err_out;
-- 
2.32.0

