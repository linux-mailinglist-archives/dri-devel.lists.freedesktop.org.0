Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3EA373414
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A76E416;
	Wed,  5 May 2021 03:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFF86E40D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:45 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:43 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 8F3512047D;
 Tue,  4 May 2021 20:57:44 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/vmwgfx: Add basic support for SVGA3
Date: Tue, 4 May 2021 23:57:39 -0400
Message-ID: <20210505035740.286923-6-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505035740.286923-1-zackr@vmware.com>
References: <20210505035740.286923-1-zackr@vmware.com>
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SVGA3 is the next version of our PCI device. Some of the changes
include using MMIO for register accesses instead of ioports,
deprecating the FIFO MMIO and removing a lot of the old and
legacy functionality. SVGA3 doesn't support guest backed
objects right now so everything except 3D is working.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 .../gpu/drm/vmwgfx/device_include/svga_reg.h  |  55 ++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           | 114 +++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 136 ++++++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 120 ++++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  16 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h         |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |  49 +------
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c           |  75 ++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  23 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  36 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_reg.h           |   4 -
 13 files changed, 363 insertions(+), 271 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h b/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
index 19fb9e3299e7..193a57f6aae5 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**********************************************************
- * Copyright 1998-2015 VMware, Inc.
+ * Copyright 1998-2021 VMware, Inc.
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -98,6 +98,10 @@ typedef uint32 SVGAMobId;
 #define SVGA_MAGIC         0x900000UL
 #define SVGA_MAKE_ID(ver)  (SVGA_MAGIC << 8 | (ver))
 
+/* Version 3 has the control bar instead of the FIFO */
+#define SVGA_VERSION_3     3
+#define SVGA_ID_3          SVGA_MAKE_ID(SVGA_VERSION_3)
+
 /* Version 2 let the address of the frame buffer be unsigned on Win32 */
 #define SVGA_VERSION_2     2
 #define SVGA_ID_2          SVGA_MAKE_ID(SVGA_VERSION_2)
@@ -129,11 +133,12 @@ typedef uint32 SVGAMobId;
  * Interrupts are only supported when the
  * SVGA_CAP_IRQMASK capability is present.
  */
-#define SVGA_IRQFLAG_ANY_FENCE            0x1    /* Any fence was passed */
-#define SVGA_IRQFLAG_FIFO_PROGRESS        0x2    /* Made forward progress in the FIFO */
-#define SVGA_IRQFLAG_FENCE_GOAL           0x4    /* SVGA_FIFO_FENCE_GOAL reached */
-#define SVGA_IRQFLAG_COMMAND_BUFFER       0x8    /* Command buffer completed */
-#define SVGA_IRQFLAG_ERROR                0x10   /* Error while processing commands */
+#define SVGA_IRQFLAG_ANY_FENCE            (1 << 0) /* Any fence was passed */
+#define SVGA_IRQFLAG_FIFO_PROGRESS        (1 << 1) /* Made forward progress in the FIFO */
+#define SVGA_IRQFLAG_FENCE_GOAL           (1 << 2) /* SVGA_FIFO_FENCE_GOAL reached */
+#define SVGA_IRQFLAG_COMMAND_BUFFER       (1 << 3) /* Command buffer completed */
+#define SVGA_IRQFLAG_ERROR                (1 << 4) /* Error while processing commands */
+#define SVGA_IRQFLAG_MAX                  (1 << 5)
 
 /*
  * The byte-size is the size of the actual cursor data,
@@ -286,7 +291,32 @@ enum {
     */
    SVGA_REG_GBOBJECT_MEM_SIZE_KB = 76,
 
-   SVGA_REG_TOP = 77,               /* Must be 1 more than the last register */
+   /*
+    +    * These registers are for the addresses of the memory BARs for SVGA3
+    */
+   SVGA_REG_REGS_START_HIGH32 = 77,
+   SVGA_REG_REGS_START_LOW32 = 78,
+   SVGA_REG_FB_START_HIGH32 = 79,
+   SVGA_REG_FB_START_LOW32 = 80,
+
+   /*
+    * A hint register that recommends which quality level the guest should
+    * currently use to define multisample surfaces.
+    *
+    * If the register is SVGA_REG_MSHINT_DISABLED,
+    * the guest is only allowed to use SVGA3D_MS_QUALITY_FULL.
+    *
+    * Otherwise, this is a live value that can change while the VM is
+    * powered on with the hint suggestion for which quality level the guest
+    * should be using.  Guests are free to ignore the hint and use either
+    * RESOLVE or FULL quality.
+    */
+   SVGA_REG_MSHINT = 81,
+
+   SVGA_REG_IRQ_STATUS = 82,
+   SVGA_REG_DIRTY_TRACKING = 83,
+
+   SVGA_REG_TOP = 84,               /* Must be 1 more than the last register */
 
    SVGA_PALETTE_BASE = 1024,        /* Base of SVGA color map */
    /* Next 768 (== 256*3) registers exist for colormap */
@@ -310,6 +340,17 @@ typedef enum SVGARegGuestDriverId {
    SVGA_REG_GUEST_DRIVER_ID_SUBMIT  = MAX_UINT32,
 } SVGARegGuestDriverId;
 
+typedef enum SVGARegMSHint {
+   SVGA_REG_MSHINT_DISABLED = 0,
+   SVGA_REG_MSHINT_FULL     = 1,
+   SVGA_REG_MSHINT_RESOLVED = 2,
+} SVGARegMSHint;
+
+typedef enum SVGARegDirtyTracking {
+   SVGA_REG_DIRTY_TRACKING_PER_IMAGE = 0,
+   SVGA_REG_DIRTY_TRACKING_PER_SURFACE = 1,
+} SVGARegDirtyTracking;
+
 
 /*
  * Guest memory regions (GMRs):
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 20246a7c97c9..5dae8a7066b6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -31,15 +31,10 @@
 
 #include "vmwgfx_drv.h"
 
-struct vmw_temp_set_context {
-	SVGA3dCmdHeader header;
-	SVGA3dCmdDXTempSetContext body;
-};
-
 bool vmw_supports_3d(struct vmw_private *dev_priv)
 {
 	uint32_t fifo_min, hwversion;
-	const struct vmw_fifo_state *fifo = &dev_priv->fifo;
+	const struct vmw_fifo_state *fifo = dev_priv->fifo;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_3D))
 		return false;
@@ -61,6 +56,8 @@ bool vmw_supports_3d(struct vmw_private *dev_priv)
 	if (!(dev_priv->capabilities & SVGA_CAP_EXTENDED_FIFO))
 		return false;
 
+	BUG_ON(vmw_is_svga_v3(dev_priv));
+
 	fifo_min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
 	if (fifo_min <= SVGA_FIFO_3D_HWVERSION * sizeof(unsigned int))
 		return false;
@@ -98,16 +95,20 @@ bool vmw_fifo_have_pitchlock(struct vmw_private *dev_priv)
 	return false;
 }
 
-int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
+struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 {
+	struct vmw_fifo_state *fifo;
 	uint32_t max;
 	uint32_t min;
 
-	fifo->dx = false;
+	if (!dev_priv->fifo_mem)
+		return 0;
+
+	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
 	fifo->static_buffer_size = VMWGFX_FIFO_STATIC_SIZE;
 	fifo->static_buffer = vmalloc(fifo->static_buffer_size);
 	if (unlikely(fifo->static_buffer == NULL))
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	fifo->dynamic_buffer = NULL;
 	fifo->reserved_size = 0;
@@ -115,20 +116,6 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 
 	mutex_init(&fifo->fifo_mutex);
 	init_rwsem(&fifo->rwsem);
-
-	DRM_INFO("width %d\n", vmw_read(dev_priv, SVGA_REG_WIDTH));
-	DRM_INFO("height %d\n", vmw_read(dev_priv, SVGA_REG_HEIGHT));
-	DRM_INFO("bpp %d\n", vmw_read(dev_priv, SVGA_REG_BITS_PER_PIXEL));
-
-	dev_priv->enable_state = vmw_read(dev_priv, SVGA_REG_ENABLE);
-	dev_priv->config_done_state = vmw_read(dev_priv, SVGA_REG_CONFIG_DONE);
-	dev_priv->traces_state = vmw_read(dev_priv, SVGA_REG_TRACES);
-
-	vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE_ENABLE |
-		  SVGA_REG_ENABLE_HIDE);
-
-	vmw_write(dev_priv, SVGA_REG_TRACES, 0);
-
 	min = 4;
 	if (dev_priv->capabilities & SVGA_CAP_EXTENDED_FIFO)
 		min = vmw_read(dev_priv, SVGA_REG_MEM_REGS);
@@ -155,35 +142,23 @@ int vmw_fifo_init(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 		 (unsigned int) max,
 		 (unsigned int) min,
 		 (unsigned int) fifo->capabilities);
-
-	atomic_set(&dev_priv->marker_seq, dev_priv->last_read_seqno);
-	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, dev_priv->last_read_seqno);
-
-	return 0;
+	return fifo;
 }
 
 void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
 {
 	u32 *fifo_mem = dev_priv->fifo_mem;
-
-	if (cmpxchg(fifo_mem + SVGA_FIFO_BUSY, 0, 1) == 0)
+	if (fifo_mem && cmpxchg(fifo_mem + SVGA_FIFO_BUSY, 0, 1) == 0)
 		vmw_write(dev_priv, SVGA_REG_SYNC, reason);
+
 }
 
-void vmw_fifo_release(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
+void vmw_fifo_destroy(struct vmw_private *dev_priv)
 {
-	vmw_write(dev_priv, SVGA_REG_SYNC, SVGA_SYNC_GENERIC);
-	while (vmw_read(dev_priv, SVGA_REG_BUSY) != 0)
-		;
+	struct vmw_fifo_state *fifo = dev_priv->fifo;
 
-	dev_priv->last_read_seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
-
-	vmw_write(dev_priv, SVGA_REG_CONFIG_DONE,
-		  dev_priv->config_done_state);
-	vmw_write(dev_priv, SVGA_REG_ENABLE,
-		  dev_priv->enable_state);
-	vmw_write(dev_priv, SVGA_REG_TRACES,
-		  dev_priv->traces_state);
+	if (!fifo)
+		return;
 
 	if (likely(fifo->static_buffer != NULL)) {
 		vfree(fifo->static_buffer);
@@ -194,6 +169,8 @@ void vmw_fifo_release(struct vmw_private *dev_priv, struct vmw_fifo_state *fifo)
 		vfree(fifo->dynamic_buffer);
 		fifo->dynamic_buffer = NULL;
 	}
+	kfree(fifo);
+	dev_priv->fifo = NULL;
 }
 
 static bool vmw_fifo_is_full(struct vmw_private *dev_priv, uint32_t bytes)
@@ -289,7 +266,7 @@ static int vmw_fifo_wait(struct vmw_private *dev_priv,
 static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 				    uint32_t bytes)
 {
-	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
+	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
 	u32  *fifo_mem = dev_priv->fifo_mem;
 	uint32_t max;
 	uint32_t min;
@@ -438,16 +415,12 @@ static void vmw_fifo_slow_copy(struct vmw_fifo_state *fifo_state,
 
 static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
 {
-	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
+	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
 	uint32_t next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
 	uint32_t max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
 	uint32_t min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
 	bool reserveable = fifo_state->capabilities & SVGA_FIFO_CAP_RESERVE;
 
-	if (fifo_state->dx)
-		bytes += sizeof(struct vmw_temp_set_context);
-
-	fifo_state->dx = false;
 	BUG_ON((bytes & 3) != 0);
 	BUG_ON(bytes > fifo_state->reserved_size);
 
@@ -527,7 +500,6 @@ int vmw_cmd_flush(struct vmw_private *dev_priv, bool interruptible)
 
 int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 {
-	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
 	struct svga_fifo_cmd_fence *cmd_fence;
 	u32 *fm;
 	int ret = 0;
@@ -546,7 +518,7 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 		*seqno = atomic_add_return(1, &dev_priv->marker_seq);
 	} while (*seqno == 0);
 
-	if (!(fifo_state->capabilities & SVGA_FIFO_CAP_FENCE)) {
+	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE)) {
 
 		/*
 		 * Don't request hardware to send a fence. The
@@ -561,22 +533,22 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
 	cmd_fence->fence = *seqno;
 	vmw_cmd_commit_flush(dev_priv, bytes);
-	vmw_update_seqno(dev_priv, fifo_state);
+	vmw_update_seqno(dev_priv);
 
 out_err:
 	return ret;
 }
 
 /**
- * vmw_fifo_emit_dummy_legacy_query - emits a dummy query to the fifo using
+ * vmw_cmd_emit_dummy_legacy_query - emits a dummy query to the fifo using
  * legacy query commands.
  *
  * @dev_priv: The device private structure.
  * @cid: The hardware context id used for the query.
  *
- * See the vmw_fifo_emit_dummy_query documentation.
+ * See the vmw_cmd_emit_dummy_query documentation.
  */
-static int vmw_fifo_emit_dummy_legacy_query(struct vmw_private *dev_priv,
+static int vmw_cmd_emit_dummy_legacy_query(struct vmw_private *dev_priv,
 					    uint32_t cid)
 {
 	/*
@@ -614,16 +586,16 @@ static int vmw_fifo_emit_dummy_legacy_query(struct vmw_private *dev_priv,
 }
 
 /**
- * vmw_fifo_emit_dummy_gb_query - emits a dummy query to the fifo using
+ * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fifo using
  * guest-backed resource query commands.
  *
  * @dev_priv: The device private structure.
  * @cid: The hardware context id used for the query.
  *
- * See the vmw_fifo_emit_dummy_query documentation.
+ * See the vmw_cmd_emit_dummy_query documentation.
  */
-static int vmw_fifo_emit_dummy_gb_query(struct vmw_private *dev_priv,
-					uint32_t cid)
+static int vmw_cmd_emit_dummy_gb_query(struct vmw_private *dev_priv,
+				       uint32_t cid)
 {
 	/*
 	 * A query wait without a preceding query end will
@@ -656,7 +628,7 @@ static int vmw_fifo_emit_dummy_gb_query(struct vmw_private *dev_priv,
 
 
 /**
- * vmw_fifo_emit_dummy_gb_query - emits a dummy query to the fifo using
+ * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fifo using
  * appropriate resource query commands.
  *
  * @dev_priv: The device private structure.
@@ -677,7 +649,27 @@ int vmw_cmd_emit_dummy_query(struct vmw_private *dev_priv,
 			      uint32_t cid)
 {
 	if (dev_priv->has_mob)
-		return vmw_fifo_emit_dummy_gb_query(dev_priv, cid);
+		return vmw_cmd_emit_dummy_gb_query(dev_priv, cid);
+
+	return vmw_cmd_emit_dummy_legacy_query(dev_priv, cid);
+}
 
-	return vmw_fifo_emit_dummy_legacy_query(dev_priv, cid);
+
+/**
+ * vmw_cmd_supported - returns true if the given device supports
+ * command queues.
+ *
+ * @dev_priv: The device private structure.
+ *
+ * Returns true if we can issue commands.
+ */
+bool vmw_cmd_supported(struct vmw_private *vmw)
+{
+	if ((vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
+				  SVGA_CAP_CMD_BUFFERS_2)) != 0)
+		return true;
+	/*
+	 * We have FIFO cmd's
+	 */
+	return vmw->fifo_mem != 0;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 22a2874116c9..3c44091ff44f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -246,6 +246,7 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 
 static const struct pci_device_id vmw_pci_id_list[] = {
 	{ PCI_DEVICE(0x15ad, VMWGFX_PCI_ID_SVGA2) },
+	{ PCI_DEVICE(0x15ad, VMWGFX_PCI_ID_SVGA3) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, vmw_pci_id_list);
@@ -393,6 +394,60 @@ static int vmw_dummy_query_bo_create(struct vmw_private *dev_priv)
 	return ret;
 }
 
+static int vmw_device_init(struct vmw_private *dev_priv)
+{
+	bool uses_fb_traces = false;
+
+	DRM_INFO("width %d\n", vmw_read(dev_priv, SVGA_REG_WIDTH));
+	DRM_INFO("height %d\n", vmw_read(dev_priv, SVGA_REG_HEIGHT));
+	DRM_INFO("bpp %d\n", vmw_read(dev_priv, SVGA_REG_BITS_PER_PIXEL));
+
+	dev_priv->enable_state = vmw_read(dev_priv, SVGA_REG_ENABLE);
+	dev_priv->config_done_state = vmw_read(dev_priv, SVGA_REG_CONFIG_DONE);
+	dev_priv->traces_state = vmw_read(dev_priv, SVGA_REG_TRACES);
+
+	vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE_ENABLE |
+		  SVGA_REG_ENABLE_HIDE);
+
+	uses_fb_traces = !vmw_cmd_supported(dev_priv) &&
+			 (dev_priv->capabilities & SVGA_CAP_TRACES) != 0;
+
+	vmw_write(dev_priv, SVGA_REG_TRACES, uses_fb_traces);
+	dev_priv->fifo = vmw_fifo_create(dev_priv);
+	if (IS_ERR(dev_priv->fifo)) {
+		int err = PTR_ERR(dev_priv->fifo);
+		dev_priv->fifo = NULL;
+		return err;
+	} else if (!dev_priv->fifo) {
+		vmw_write(dev_priv, SVGA_REG_CONFIG_DONE, 1);
+	}
+
+	dev_priv->last_read_seqno = vmw_fence_read(dev_priv);
+	atomic_set(&dev_priv->marker_seq, dev_priv->last_read_seqno);
+	return 0;
+}
+
+static void vmw_device_fini(struct vmw_private *vmw)
+{
+	/*
+	 * Legacy sync
+	 */
+	vmw_write(vmw, SVGA_REG_SYNC, SVGA_SYNC_GENERIC);
+	while (vmw_read(vmw, SVGA_REG_BUSY) != 0)
+		;
+
+	vmw->last_read_seqno = vmw_fence_read(vmw);
+
+	vmw_write(vmw, SVGA_REG_CONFIG_DONE,
+		  vmw->config_done_state);
+	vmw_write(vmw, SVGA_REG_ENABLE,
+		  vmw->enable_state);
+	vmw_write(vmw, SVGA_REG_TRACES,
+		  vmw->traces_state);
+
+	vmw_fifo_destroy(vmw);
+}
+
 /**
  * vmw_request_device_late - Perform late device setup
  *
@@ -433,9 +488,9 @@ static int vmw_request_device(struct vmw_private *dev_priv)
 {
 	int ret;
 
-	ret = vmw_fifo_init(dev_priv, &dev_priv->fifo);
+	ret = vmw_device_init(dev_priv);
 	if (unlikely(ret != 0)) {
-		DRM_ERROR("Unable to initialize FIFO.\n");
+		DRM_ERROR("Unable to initialize the device.\n");
 		return ret;
 	}
 	vmw_fence_fifo_up(dev_priv->fman);
@@ -469,7 +524,7 @@ static int vmw_request_device(struct vmw_private *dev_priv)
 		vmw_cmdbuf_man_destroy(dev_priv->cman);
 out_no_mob:
 	vmw_fence_fifo_down(dev_priv->fman);
-	vmw_fifo_release(dev_priv, &dev_priv->fifo);
+	vmw_device_fini(dev_priv);
 	return ret;
 }
 
@@ -517,7 +572,7 @@ static void vmw_release_device_late(struct vmw_private *dev_priv)
 	if (dev_priv->cman)
 		vmw_cmdbuf_man_destroy(dev_priv->cman);
 
-	vmw_fifo_release(dev_priv, &dev_priv->fifo);
+	vmw_device_fini(dev_priv);
 }
 
 /*
@@ -638,6 +693,8 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 static int vmw_setup_pci_resources(struct vmw_private *dev,
 				   unsigned long pci_id)
 {
+	resource_size_t rmmio_start;
+	resource_size_t rmmio_size;
 	resource_size_t fifo_start;
 	resource_size_t fifo_size;
 	int ret;
@@ -649,23 +706,45 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 	if (ret)
 		return ret;
 
-	dev->io_start = pci_resource_start(pdev, 0);
-	dev->vram_start = pci_resource_start(pdev, 1);
-	dev->vram_size = pci_resource_len(pdev, 1);
-	fifo_start = pci_resource_start(pdev, 2);
-	fifo_size = pci_resource_len(pdev, 2);
-
-	DRM_INFO("FIFO at %pa size is %llu kiB\n",
-		 &fifo_start, (uint64_t)fifo_size / 1024);
-	dev->fifo_mem = devm_memremap(dev->drm.dev,
-				      fifo_start,
-				      fifo_size,
-				      MEMREMAP_WB);
-
-	if (IS_ERR(dev->fifo_mem)) {
-		DRM_ERROR("Failed mapping FIFO memory.\n");
+	dev->pci_id = pci_id;
+	if (pci_id == VMWGFX_PCI_ID_SVGA3) {
+		rmmio_start = pci_resource_start(pdev, 0);
+		rmmio_size = pci_resource_len(pdev, 0);
+		dev->vram_start = pci_resource_start(pdev, 2);
+		dev->vram_size = pci_resource_len(pdev, 2);
+
+		DRM_INFO("Register MMIO at 0x%pa size is %llu kiB\n",
+			 &rmmio_start, (uint64_t)rmmio_size / 1024);
+		dev->rmmio = devm_ioremap(dev->drm.dev,
+					  rmmio_start,
+					  rmmio_size);
+		if (IS_ERR(dev->rmmio)) {
+			DRM_ERROR("Failed mapping registers mmio memory.\n");
+			pci_release_regions(pdev);
+			return PTR_ERR(dev->rmmio);
+		}
+	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
+		dev->io_start = pci_resource_start(pdev, 0);
+		dev->vram_start = pci_resource_start(pdev, 1);
+		dev->vram_size = pci_resource_len(pdev, 1);
+		fifo_start = pci_resource_start(pdev, 2);
+		fifo_size = pci_resource_len(pdev, 2);
+
+		DRM_INFO("FIFO at %pa size is %llu kiB\n",
+			 &fifo_start, (uint64_t)fifo_size / 1024);
+		dev->fifo_mem = devm_memremap(dev->drm.dev,
+					      fifo_start,
+					      fifo_size,
+					      MEMREMAP_WB);
+
+		if (IS_ERR(dev->fifo_mem)) {
+			DRM_ERROR("Failed mapping FIFO memory.\n");
+			pci_release_regions(pdev);
+			return PTR_ERR(dev->fifo_mem);
+		}
+	} else {
 		pci_release_regions(pdev);
-		return PTR_ERR(dev->fifo_mem);
+		return -EINVAL;
 	}
 
 	/*
@@ -684,13 +763,16 @@ static int vmw_detect_version(struct vmw_private *dev)
 {
 	uint32_t svga_id;
 
-	vmw_write(dev, SVGA_REG_ID, SVGA_ID_2);
+	vmw_write(dev, SVGA_REG_ID, vmw_is_svga_v3(dev) ?
+			  SVGA_ID_3 : SVGA_ID_2);
 	svga_id = vmw_read(dev, SVGA_REG_ID);
-	if (svga_id != SVGA_ID_2) {
+	if (svga_id != SVGA_ID_2 && svga_id != SVGA_ID_3) {
 		DRM_ERROR("Unsupported SVGA ID 0x%x on chipset 0x%x\n",
 			  svga_id, dev->vmw_chipset);
 		return -ENOSYS;
 	}
+	BUG_ON(vmw_is_svga_v3(dev) && (svga_id != SVGA_ID_3));
+	DRM_INFO("Running on SVGA version %d.\n", (svga_id & 0xff));
 	return 0;
 }
 
@@ -703,7 +785,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	dev_priv->vmw_chipset = pci_id;
-	dev_priv->last_read_seqno = (uint32_t) -100;
 	dev_priv->drm.dev_private = dev_priv;
 
 	mutex_init(&dev_priv->cmdbuf_mutex);
@@ -824,6 +905,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	vmw_print_capabilities(dev_priv->capabilities);
 	if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER)
 		vmw_print_capabilities2(dev_priv->capabilities2);
+	DRM_INFO("Supports command queues = %d\n",
+		 vmw_cmd_supported((dev_priv)));
 
 	ret = vmw_dma_masks(dev_priv);
 	if (unlikely(ret != 0))
@@ -1390,8 +1473,7 @@ static int vmw_pm_restore(struct device *kdev)
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	int ret;
 
-	vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
-	(void) vmw_read(dev_priv, SVGA_REG_ID);
+	vmw_detect_version(dev_priv);
 
 	if (dev_priv->enable_fb)
 		vmw_fifo_resource_inc(dev_priv);
@@ -1428,8 +1510,8 @@ static const struct file_operations vmwgfx_driver_fops = {
 	.release = drm_release,
 	.unlocked_ioctl = vmw_unlocked_ioctl,
 	.mmap = vmw_mmap,
-	.poll = vmw_fops_poll,
-	.read = vmw_fops_read,
+	.poll = drm_poll,
+	.read = drm_read,
 #if defined(CONFIG_COMPAT)
 	.compat_ioctl = vmw_compat_ioctl,
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 2fb6898ceca9..696ea7086140 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -66,6 +66,7 @@
 #define VMWGFX_ENABLE_SCREEN_TARGET_OTABLE 1
 
 #define VMWGFX_PCI_ID_SVGA2              0x0405
+#define VMWGFX_PCI_ID_SVGA3              0x0406
 
 /*
  * Perhaps we should have sysfs entries for these.
@@ -284,7 +285,6 @@ struct vmw_fifo_state {
 	uint32_t capabilities;
 	struct mutex fifo_mutex;
 	struct rw_semaphore rwsem;
-	bool dx;
 };
 
 /**
@@ -485,14 +485,14 @@ struct vmw_private {
 	struct drm_device drm;
 	struct ttm_device bdev;
 
-	struct vmw_fifo_state fifo;
-
 	struct drm_vma_offset_manager vma_manager;
+	unsigned long pci_id;
 	u32 vmw_chipset;
 	resource_size_t io_start;
 	resource_size_t vram_start;
 	resource_size_t vram_size;
 	resource_size_t prim_bb_mem;
+	u32 *rmmio;
 	u32 *fifo_mem;
 	resource_size_t fifo_mem_size;
 	uint32_t fb_max_width;
@@ -623,6 +623,7 @@ struct vmw_private {
 	 */
 	struct vmw_otable_batch otable_batch;
 
+	struct vmw_fifo_state *fifo;
 	struct vmw_cmdbuf_man *cman;
 	DECLARE_BITMAP(irqthread_pending, VMW_IRQTHREAD_MAX);
 
@@ -645,6 +646,14 @@ static inline struct vmw_fpriv *vmw_fpriv(struct drm_file *file_priv)
 	return (struct vmw_fpriv *)file_priv->driver_priv;
 }
 
+/*
+ * SVGA v3 has mmio register access and lacks fifo cmds
+ */
+static inline bool vmw_is_svga_v3(const struct vmw_private *dev)
+{
+	return dev->pci_id == VMWGFX_PCI_ID_SVGA3;
+}
+
 /*
  * The locking here is fine-grained, so that it is performed once
  * for every read- and write operation. This is of course costly, but we
@@ -655,10 +664,14 @@ static inline struct vmw_fpriv *vmw_fpriv(struct drm_file *file_priv)
 static inline void vmw_write(struct vmw_private *dev_priv,
 			     unsigned int offset, uint32_t value)
 {
-	spin_lock(&dev_priv->hw_lock);
-	outl(offset, dev_priv->io_start + VMWGFX_INDEX_PORT);
-	outl(value, dev_priv->io_start + VMWGFX_VALUE_PORT);
-	spin_unlock(&dev_priv->hw_lock);
+	if (vmw_is_svga_v3(dev_priv)) {
+		iowrite32(value, dev_priv->rmmio + offset);
+	} else {
+		spin_lock(&dev_priv->hw_lock);
+		outl(offset, dev_priv->io_start + SVGA_INDEX_PORT);
+		outl(value, dev_priv->io_start + SVGA_VALUE_PORT);
+		spin_unlock(&dev_priv->hw_lock);
+	}
 }
 
 static inline uint32_t vmw_read(struct vmw_private *dev_priv,
@@ -666,10 +679,14 @@ static inline uint32_t vmw_read(struct vmw_private *dev_priv,
 {
 	u32 val;
 
-	spin_lock(&dev_priv->hw_lock);
-	outl(offset, dev_priv->io_start + VMWGFX_INDEX_PORT);
-	val = inl(dev_priv->io_start + VMWGFX_VALUE_PORT);
-	spin_unlock(&dev_priv->hw_lock);
+	if (vmw_is_svga_v3(dev_priv)) {
+		val = ioread32(dev_priv->rmmio + offset);
+	} else {
+		spin_lock(&dev_priv->hw_lock);
+		outl(offset, dev_priv->io_start + SVGA_INDEX_PORT);
+		val = inl(dev_priv->io_start + SVGA_VALUE_PORT);
+		spin_unlock(&dev_priv->hw_lock);
+	}
 
 	return val;
 }
@@ -932,19 +949,14 @@ extern int vmw_present_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv);
 extern int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
-extern __poll_t vmw_fops_poll(struct file *filp,
-				  struct poll_table_struct *wait);
-extern ssize_t vmw_fops_read(struct file *filp, char __user *buffer,
-			     size_t count, loff_t *offset);
 
 /**
  * Fifo utilities - vmwgfx_fifo.c
  */
 
-extern int vmw_fifo_init(struct vmw_private *dev_priv,
-			 struct vmw_fifo_state *fifo);
-extern void vmw_fifo_release(struct vmw_private *dev_priv,
-			     struct vmw_fifo_state *fifo);
+extern struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv);
+extern void vmw_fifo_destroy(struct vmw_private *dev_priv);
+extern bool vmw_cmd_supported(struct vmw_private *vmw);
 extern void *
 vmw_cmd_ctx_reserve(struct vmw_private *dev_priv, uint32_t bytes, int ctx_id);
 extern void vmw_cmd_commit(struct vmw_private *dev_priv, uint32_t bytes);
@@ -970,6 +982,31 @@ extern int vmw_cmd_flush(struct vmw_private *dev_priv,
 #define VMW_CMD_RESERVE(__priv, __bytes)                                     \
 	VMW_CMD_CTX_RESERVE(__priv, __bytes, SVGA3D_INVALID_ID)
 
+
+/**
+ * vmw_fifo_caps - Returns the capabilities of the FIFO command
+ * queue or 0 if fifo memory isn't present.
+ * @dev_priv: The device private context
+ */
+static inline uint32_t vmw_fifo_caps(const struct vmw_private *dev_priv)
+{
+	if (!dev_priv->fifo_mem || !dev_priv->fifo)
+		return 0;
+	return dev_priv->fifo->capabilities;
+}
+
+
+/**
+ * vmw_is_cursor_bypass3_enabled - Returns TRUE iff Cursor Bypass 3
+ * is enabled in the FIFO.
+ * @dev_priv: The device private context
+ */
+static inline bool
+vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
+{
+	return (vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_CURSOR_BYPASS_3) != 0;
+}
+
 /**
  * TTM glue - vmwgfx_ttm_glue.c
  */
@@ -1079,9 +1116,6 @@ bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd);
  * IRQs and wating - vmwgfx_irq.c
  */
 
-extern int vmw_wait_seqno(struct vmw_private *dev_priv, bool lazy,
-			  uint32_t seqno, bool interruptible,
-			  unsigned long timeout);
 extern int vmw_irq_install(struct drm_device *dev, int irq);
 extern void vmw_irq_uninstall(struct drm_device *dev);
 extern bool vmw_seqno_passed(struct vmw_private *dev_priv,
@@ -1092,8 +1126,7 @@ extern int vmw_fallback_wait(struct vmw_private *dev_priv,
 			     uint32_t seqno,
 			     bool interruptible,
 			     unsigned long timeout);
-extern void vmw_update_seqno(struct vmw_private *dev_priv,
-				struct vmw_fifo_state *fifo_state);
+extern void vmw_update_seqno(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_add(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
 extern void vmw_goal_waiter_add(struct vmw_private *dev_priv);
@@ -1572,6 +1605,7 @@ static inline void vmw_fifo_resource_dec(struct vmw_private *dev_priv)
  */
 static inline u32 vmw_fifo_mem_read(struct vmw_private *vmw, uint32 fifo_reg)
 {
+	BUG_ON(vmw_is_svga_v3(vmw));
 	return READ_ONCE(*(vmw->fifo_mem + fifo_reg));
 }
 
@@ -1586,6 +1620,44 @@ static inline u32 vmw_fifo_mem_read(struct vmw_private *vmw, uint32 fifo_reg)
 static inline void vmw_fifo_mem_write(struct vmw_private *vmw, u32 fifo_reg,
 				      u32 value)
 {
+	BUG_ON(vmw_is_svga_v3(vmw));
 	WRITE_ONCE(*(vmw->fifo_mem + fifo_reg), value);
 }
+
+static inline u32 vmw_fence_read(struct vmw_private *dev_priv)
+{
+	u32 fence;
+	if (vmw_is_svga_v3(dev_priv))
+		fence = vmw_read(dev_priv, SVGA_REG_FENCE);
+	else
+		fence = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
+	return fence;
+}
+
+static inline void vmw_fence_write(struct vmw_private *dev_priv,
+				  u32 fence)
+{
+	BUG_ON(vmw_is_svga_v3(dev_priv));
+	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, fence);
+}
+
+static inline u32 vmw_irq_status_read(struct vmw_private *vmw)
+{
+	u32 status;
+	if (vmw_is_svga_v3(vmw))
+		status = vmw_read(vmw, SVGA_REG_IRQ_STATUS);
+	else
+		status = inl(vmw->io_start + SVGA_IRQSTATUS_PORT);
+	return status;
+}
+
+static inline void vmw_irq_status_write(struct vmw_private *vmw,
+					uint32 status)
+{
+	if (vmw_is_svga_v3(vmw))
+		vmw_write(vmw, SVGA_REG_IRQ_STATUS, status);
+	else
+		outl(status, vmw->io_start + SVGA_IRQSTATUS_PORT);
+}
+
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 3ad07657b7d2..b79a2ba68411 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3841,7 +3841,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
 
 		fence_rep.handle = fence_handle;
 		fence_rep.seqno = fence->base.seqno;
-		vmw_update_seqno(dev_priv, &dev_priv->fifo);
+		vmw_update_seqno(dev_priv);
 		fence_rep.passed_seqno = dev_priv->last_read_seqno;
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 23523eb3cac2..7fe744da9919 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -139,12 +139,10 @@ static bool vmw_fence_enable_signaling(struct dma_fence *f)
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	struct vmw_private *dev_priv = fman->dev_priv;
 
-	u32 seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
+	u32 seqno = vmw_fence_read(dev_priv);
 	if (seqno - fence->base.seqno < VMW_FENCE_WRAP)
 		return false;
 
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-
 	return true;
 }
 
@@ -177,7 +175,6 @@ static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
 	if (likely(vmw_fence_obj_signaled(fence)))
 		return timeout;
 
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
 	vmw_seqno_waiter_add(dev_priv);
 
 	spin_lock(f->lock);
@@ -464,7 +461,7 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 	bool needs_rerun;
 	uint32_t seqno, new_seqno;
 
-	seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE);
+	seqno = vmw_fence_read(fman->dev_priv);
 rerun:
 	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
@@ -486,7 +483,7 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 
 	needs_rerun = vmw_fence_goal_new_locked(fman, seqno);
 	if (unlikely(needs_rerun)) {
-		new_seqno = vmw_fifo_mem_read(fman->dev_priv, SVGA_FIFO_FENCE);
+		new_seqno = vmw_fence_read(fman->dev_priv);
 		if (new_seqno != seqno) {
 			seqno = new_seqno;
 			goto rerun;
@@ -529,13 +526,6 @@ int vmw_fence_obj_wait(struct vmw_fence_obj *fence, bool lazy,
 		return ret;
 }
 
-void vmw_fence_obj_flush(struct vmw_fence_obj *fence)
-{
-	struct vmw_private *dev_priv = fman_from_fence(fence)->dev_priv;
-
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-}
-
 static void vmw_fence_destroy(struct vmw_fence_obj *fence)
 {
 	dma_fence_free(&fence->base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index 50e9fdd7acf1..079ab4f3ba51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -94,8 +94,6 @@ extern int vmw_fence_obj_wait(struct vmw_fence_obj *fence,
 			      bool lazy,
 			      bool interruptible, unsigned long timeout);
 
-extern void vmw_fence_obj_flush(struct vmw_fence_obj *fence);
-
 extern int vmw_fence_create(struct vmw_fence_manager *fman,
 			    uint32_t seqno,
 			    struct vmw_fence_obj **p_fence);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 6763d0638450..4fdacf9924e6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -60,15 +60,13 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 		param->value = dev_priv->capabilities2;
 		break;
 	case DRM_VMW_PARAM_FIFO_CAPS:
-		param->value = dev_priv->fifo.capabilities;
+		param->value = vmw_fifo_caps(dev_priv);
 		break;
 	case DRM_VMW_PARAM_MAX_FB_SIZE:
 		param->value = dev_priv->prim_bb_mem;
 		break;
 	case DRM_VMW_PARAM_FIFO_HW_VERSION:
 	{
-		const struct vmw_fifo_state *fifo = &dev_priv->fifo;
-
 		if ((dev_priv->capabilities & SVGA_CAP_GBOBJECTS)) {
 			param->value = SVGA3D_HWVERSION_WS8_B1;
 			break;
@@ -76,7 +74,7 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 
 		param->value =
 			vmw_fifo_mem_read(dev_priv,
-					  ((fifo->capabilities &
+					  ((vmw_fifo_caps(dev_priv) &
 					    SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
 						   SVGA_FIFO_3D_HWVERSION_REVISED :
 						   SVGA_FIFO_3D_HWVERSION));
@@ -398,46 +396,3 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 out_clips:
 	return ret;
 }
-
-
-/**
- * vmw_fops_poll - wrapper around the drm_poll function
- *
- * @filp: See the linux fops poll documentation.
- * @wait: See the linux fops poll documentation.
- *
- * Wrapper around the drm_poll function that makes sure the device is
- * processing the fifo if drm_poll decides to wait.
- */
-__poll_t vmw_fops_poll(struct file *filp, struct poll_table_struct *wait)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct vmw_private *dev_priv =
-		vmw_priv(file_priv->minor->dev);
-
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-	return drm_poll(filp, wait);
-}
-
-
-/**
- * vmw_fops_read - wrapper around the drm_read function
- *
- * @filp: See the linux fops read documentation.
- * @buffer: See the linux fops read documentation.
- * @count: See the linux fops read documentation.
- * @offset: See the linux fops read documentation.
- *
- * Wrapper around the drm_read function that makes sure the device is
- * processing the fifo if drm_read decides to wait.
- */
-ssize_t vmw_fops_read(struct file *filp, char __user *buffer,
-		      size_t count, loff_t *offset)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct vmw_private *dev_priv =
-		vmw_priv(file_priv->minor->dev);
-
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-	return drm_read(filp, buffer, count, offset);
-}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 6c2a569f1fcb..dafc5fa65bb2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -82,11 +82,11 @@ static irqreturn_t vmw_irq_handler(int irq, void *arg)
 	uint32_t status, masked_status;
 	irqreturn_t ret = IRQ_HANDLED;
 
-	status = inl(dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
+	status = vmw_irq_status_read(dev_priv);
 	masked_status = status & READ_ONCE(dev_priv->irq_mask);
 
 	if (likely(status))
-		outl(status, dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
+		vmw_irq_status_write(dev_priv, status);
 
 	if (!status)
 		return IRQ_NONE;
@@ -114,10 +114,9 @@ static bool vmw_fifo_idle(struct vmw_private *dev_priv, uint32_t seqno)
 	return (vmw_read(dev_priv, SVGA_REG_BUSY) == 0);
 }
 
-void vmw_update_seqno(struct vmw_private *dev_priv,
-			 struct vmw_fifo_state *fifo_state)
+void vmw_update_seqno(struct vmw_private *dev_priv)
 {
-	uint32_t seqno = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_FENCE);
+	uint32_t seqno = vmw_fence_read(dev_priv);
 
 	if (dev_priv->last_read_seqno != seqno) {
 		dev_priv->last_read_seqno = seqno;
@@ -128,18 +127,16 @@ void vmw_update_seqno(struct vmw_private *dev_priv,
 bool vmw_seqno_passed(struct vmw_private *dev_priv,
 			 uint32_t seqno)
 {
-	struct vmw_fifo_state *fifo_state;
 	bool ret;
 
 	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
 		return true;
 
-	fifo_state = &dev_priv->fifo;
-	vmw_update_seqno(dev_priv, fifo_state);
+	vmw_update_seqno(dev_priv);
 	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
 		return true;
 
-	if (!(fifo_state->capabilities & SVGA_FIFO_CAP_FENCE) &&
+	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE) &&
 	    vmw_fifo_idle(dev_priv, seqno))
 		return true;
 
@@ -161,7 +158,7 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 		      bool interruptible,
 		      unsigned long timeout)
 {
-	struct vmw_fifo_state *fifo_state = &dev_priv->fifo;
+	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
 
 	uint32_t count = 0;
 	uint32_t signal_seq;
@@ -221,7 +218,7 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 	}
 	finish_wait(&dev_priv->fence_queue, &__wait);
 	if (ret == 0 && fifo_idle)
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_FENCE, signal_seq);
+		vmw_fence_write(dev_priv, signal_seq);
 
 	wake_up_all(&dev_priv->fence_queue);
 out_err:
@@ -236,7 +233,7 @@ void vmw_generic_waiter_add(struct vmw_private *dev_priv,
 {
 	spin_lock_bh(&dev_priv->waiter_lock);
 	if ((*waiter_count)++ == 0) {
-		outl(flag, dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
+		vmw_irq_status_write(dev_priv, flag);
 		dev_priv->irq_mask |= flag;
 		vmw_write(dev_priv, SVGA_REG_IRQMASK, dev_priv->irq_mask);
 	}
@@ -278,59 +275,13 @@ void vmw_goal_waiter_remove(struct vmw_private *dev_priv)
 				  &dev_priv->goal_queue_waiters);
 }
 
-int vmw_wait_seqno(struct vmw_private *dev_priv,
-		      bool lazy, uint32_t seqno,
-		      bool interruptible, unsigned long timeout)
-{
-	long ret;
-	struct vmw_fifo_state *fifo = &dev_priv->fifo;
-
-	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
-		return 0;
-
-	if (likely(vmw_seqno_passed(dev_priv, seqno)))
-		return 0;
-
-	vmw_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
-
-	if (!(fifo->capabilities & SVGA_FIFO_CAP_FENCE))
-		return vmw_fallback_wait(dev_priv, lazy, true, seqno,
-					 interruptible, timeout);
-
-	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
-		return vmw_fallback_wait(dev_priv, lazy, false, seqno,
-					 interruptible, timeout);
-
-	vmw_seqno_waiter_add(dev_priv);
-
-	if (interruptible)
-		ret = wait_event_interruptible_timeout
-		    (dev_priv->fence_queue,
-		     vmw_seqno_passed(dev_priv, seqno),
-		     timeout);
-	else
-		ret = wait_event_timeout
-		    (dev_priv->fence_queue,
-		     vmw_seqno_passed(dev_priv, seqno),
-		     timeout);
-
-	vmw_seqno_waiter_remove(dev_priv);
-
-	if (unlikely(ret == 0))
-		ret = -EBUSY;
-	else if (likely(ret > 0))
-		ret = 0;
-
-	return ret;
-}
-
 static void vmw_irq_preinstall(struct drm_device *dev)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	uint32_t status;
 
-	status = inl(dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
-	outl(status, dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
+	status = vmw_irq_status_read(dev_priv);
+	vmw_irq_status_write(dev_priv, status);
 }
 
 void vmw_irq_uninstall(struct drm_device *dev)
@@ -346,8 +297,8 @@ void vmw_irq_uninstall(struct drm_device *dev)
 
 	vmw_write(dev_priv, SVGA_REG_IRQMASK, 0);
 
-	status = inl(dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
-	outl(status, dev_priv->io_start + VMWGFX_IRQSTATUS_PORT);
+	status = vmw_irq_status_read(dev_priv);
+	vmw_irq_status_write(dev_priv, status);
 
 	dev->irq_enabled = false;
 	free_irq(dev->irq, dev);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 67f693acea5f..2768ab1f60a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -38,8 +38,10 @@
 
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
+	struct vmw_private *dev_priv = vmw_priv(du->primary.dev);
 	drm_plane_cleanup(&du->primary);
-	drm_plane_cleanup(&du->cursor);
+	if (vmw_cmd_supported(dev_priv))
+		drm_plane_cleanup(&du->cursor);
 
 	drm_connector_unregister(&du->connector);
 	drm_crtc_cleanup(&du->crtc);
@@ -128,11 +130,17 @@ static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 	uint32_t count;
 
 	spin_lock(&dev_priv->cursor_lock);
-	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, show ? 1 : 0);
-	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
-	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
-	count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
-	vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++count);
+	if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, show ? 1 : 0);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
+		count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++count);
+	} else {
+		vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
+		vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
+		vmw_write(dev_priv, SVGA_REG_CURSOR_ON, show ? 1 : 0);
+	}
 	spin_unlock(&dev_priv->cursor_lock);
 }
 
@@ -1045,7 +1053,8 @@ static int vmw_framebuffer_bo_dirty_ext(struct drm_framebuffer *framebuffer,
 {
 	struct vmw_private *dev_priv = vmw_priv(framebuffer->dev);
 
-	if (dev_priv->active_display_unit == vmw_du_legacy)
+	if (dev_priv->active_display_unit == vmw_du_legacy &&
+	    vmw_cmd_supported(dev_priv))
 		return vmw_framebuffer_bo_dirty(framebuffer, file_priv, flags,
 						color, clips, num_clips);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 87e0b303d900..d85c7eab9469 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -404,19 +404,24 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 
 	drm_plane_helper_add(primary, &vmw_ldu_primary_plane_helper_funcs);
 
-	/* Initialize cursor plane */
-	ret = drm_universal_plane_init(dev, &ldu->base.cursor,
-			0, &vmw_ldu_cursor_funcs,
-			vmw_cursor_plane_formats,
-			ARRAY_SIZE(vmw_cursor_plane_formats),
-			NULL, DRM_PLANE_TYPE_CURSOR, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to initialize cursor plane");
-		drm_plane_cleanup(&ldu->base.primary);
-		goto err_free;
-	}
+	/*
+	 * We're going to be using traces and software cursors
+	 */
+	if (vmw_cmd_supported(dev_priv)) {
+		/* Initialize cursor plane */
+		ret = drm_universal_plane_init(dev, &ldu->base.cursor,
+					       0, &vmw_ldu_cursor_funcs,
+					       vmw_cursor_plane_formats,
+					       ARRAY_SIZE(vmw_cursor_plane_formats),
+					       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to initialize cursor plane");
+			drm_plane_cleanup(&ldu->base.primary);
+			goto err_free;
+		}
 
-	drm_plane_helper_add(cursor, &vmw_ldu_cursor_plane_helper_funcs);
+		drm_plane_helper_add(cursor, &vmw_ldu_cursor_plane_helper_funcs);
+	}
 
 	ret = drm_connector_init(dev, connector, &vmw_legacy_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
@@ -445,9 +450,10 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 		goto err_free_encoder;
 	}
 
-	ret = drm_crtc_init_with_planes(dev, crtc, &ldu->base.primary,
-					&ldu->base.cursor,
-					&vmw_legacy_crtc_funcs, NULL);
+	ret = drm_crtc_init_with_planes(
+		      dev, crtc, &ldu->base.primary,
+		      vmw_cmd_supported(dev_priv) ? &ldu->base.cursor : NULL,
+		      &vmw_legacy_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize CRTC\n");
 		goto err_free_unregister;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index ac4a9b722279..54c5d16eb3b7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -421,7 +421,7 @@ int vmw_overlay_pause_all(struct vmw_private *dev_priv)
 static bool vmw_overlay_available(const struct vmw_private *dev_priv)
 {
 	return (dev_priv->overlay_priv != NULL &&
-		((dev_priv->fifo.capabilities & VMW_OVERLAY_CAP_MASK) ==
+		((vmw_fifo_caps(dev_priv) & VMW_OVERLAY_CAP_MASK) ==
 		 VMW_OVERLAY_CAP_MASK));
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_reg.h b/drivers/gpu/drm/vmwgfx/vmwgfx_reg.h
index e99f6cdbb091..cf585dfe5669 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_reg.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_reg.h
@@ -34,10 +34,6 @@
 
 #include <linux/types.h>
 
-#define VMWGFX_INDEX_PORT     0x0
-#define VMWGFX_VALUE_PORT     0x1
-#define VMWGFX_IRQSTATUS_PORT 0x8
-
 struct svga_guest_mem_descriptor {
 	u32 ppn;
 	u32 num_pages;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
