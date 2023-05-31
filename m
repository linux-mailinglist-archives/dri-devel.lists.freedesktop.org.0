Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62301717BB1
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F310E49D;
	Wed, 31 May 2023 09:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56ED10E499
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685524883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ucf/fqI4XS3QEymZ7YuNeIs+/+0aojFHAwVEh7fTeU=;
 b=CrSZ4I6tvjV2mH24rvdv0lKUqczmTKWkoEUCvEuZFczuJEl5Dm3nFXzo37ga4QDJc72/lr
 8eMjWih80voGWHtpLMDT12fy3/1qPKIle/mAxp7w4rb3gGafD9pMtari60XFQEEWe4MxSP
 oRPqk05kZaGmWkdtXQEC15czHB/VpFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Yz7NkrWLPGGx3Jz3YemxZA-1; Wed, 31 May 2023 05:21:21 -0400
X-MC-Unique: Yz7NkrWLPGGx3Jz3YemxZA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FDD8101A52C;
 Wed, 31 May 2023 09:21:21 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38DA2492B00;
 Wed, 31 May 2023 09:21:20 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH v2 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
Date: Wed, 31 May 2023 11:21:10 +0200
Message-Id: <20230531092110.140564-5-jfalempe@redhat.com>
In-Reply-To: <20230531092110.140564-1-jfalempe@redhat.com>
References: <20230531092110.140564-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if the transfer is not faster, it brings significant
improvement in latencies and CPU usage.

CPU usage drops from 100% of one core to 3% when continuously
refreshing the screen.

The primary DMA is used to send commands (register write), and
the secondary DMA to send the pixel data.
It uses the ILOAD command (chapter 4.5.7 in G200 specification),
which allows to load an image, or a part of an image from system
memory to VRAM.
The last command sent, is a softrap command, which triggers an IRQ
when the DMA transfer is complete.
For 16bits and 24bits pixel width, each line is padded to make sure,
the DMA transfer is a multiple of 32bits. The padded bytes won't be
drawn on the screen, so they don't need to be initialized.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/Makefile          |   3 +-
 drivers/gpu/drm/mgag200/mgag200_dma.c     | 237 ++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  29 +++
 drivers/gpu/drm/mgag200/mgag200_g200.c    |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  15 +-
 drivers/gpu/drm/mgag200/mgag200_reg.h     |  25 +++
 14 files changed, 333 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_dma.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 182e224c460d..96e23dc5572c 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -11,6 +11,7 @@ mgag200-y := \
 	mgag200_g200se.o \
 	mgag200_g200wb.o \
 	mgag200_i2c.o \
-	mgag200_mode.o
+	mgag200_mode.o \
+	mgag200_dma.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_dma.c b/drivers/gpu/drm/mgag200/mgag200_dma.c
new file mode 100644
index 000000000000..7e9b59ef08d9
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_dma.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2023 Red Hat
+ *
+ * Authors: Jocelyn Falempe
+ *
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/iosys-map.h>
+#include <linux/wait.h>
+
+#include <drm/drm_framebuffer.h>
+
+#include "mgag200_drv.h"
+#include "mgag200_reg.h"
+
+/* Maximum number of command block for one DMA transfer
+ * iload should only use 4 blocks
+ */
+#define MGA_MAX_CMD		50
+
+#define MGA_DMA_SIZE		(4 * 1024 * 1024)
+#define MGA_MIN_DMA_SIZE	(64 * 1024)
+
+/*
+ * Allocate coherent buffers for DMA transfer.
+ * We need two buffers, one for the commands, and one for the data.
+ */
+int mgag200_dma_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct mga_dma *dma = &mdev->dma;
+	int size;
+	/* Allocate the command buffer */
+	dma->cmd = dmam_alloc_coherent(dev->dev, MGA_MAX_CMD * sizeof(*dma->cmd),
+					&dma->cmd_handle, GFP_KERNEL);
+
+	if (!dma->cmd) {
+		drm_err(dev, "DMA command buffer allocation failed\n");
+		return -ENOMEM;
+	}
+
+	for (size = MGA_DMA_SIZE; size >= MGA_MIN_DMA_SIZE; size = size >> 1) {
+		dma->buf = dmam_alloc_coherent(dev->dev, size, &dma->handle, GFP_KERNEL);
+		if (dma->buf)
+			break;
+	}
+	if (!dma->buf) {
+		drm_err(dev, "DMA data buffer allocation failed\n");
+		return -ENOMEM;
+	}
+	dma->size = size;
+	drm_info(dev, "Using DMA with a %dk data buffer\n", size / 1024);
+
+	init_waitqueue_head(&dma->waitq);
+	return 0;
+}
+
+/*
+ * Matrox uses a command block to program the hardware through DMA.
+ * Each command is a register write, and each block contains 4 commands
+ * packed in 5 dwords(u32).
+ * First dword is the 4 register index (8bit) to write for the 4 commands,
+ * followed by the four values to be written.
+ */
+static void mgag200_dma_add_block(struct mga_device *mdev,
+			   u32 reg0, u32 val0,
+			   u32 reg1, u32 val1,
+			   u32 reg2, u32 val2,
+			   u32 reg3, u32 val3)
+{
+	if (mdev->dma.cmd_idx >= MGA_MAX_CMD) {
+		pr_err("mgag200: exceeding the DMA command buffer size\n");
+		return;
+	}
+
+	mdev->dma.cmd[mdev->dma.cmd_idx] = (struct mga_cmd_block) {
+		.cmd = DMAREG(reg0) | DMAREG(reg1) << 8 | DMAREG(reg2) << 16 | DMAREG(reg3) << 24,
+		.v0 = val0,
+		.v1 = val1,
+		.v2 = val2,
+		.v3 = val3};
+	mdev->dma.cmd_idx++;
+}
+
+static void mgag200_dma_run_cmd(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	u32 primend;
+
+	/* Add a last block to trigger the softrap interrupt */
+	mgag200_dma_add_block(mdev,
+			MGAREG_DMAPAD, 0,
+			MGAREG_DMAPAD, 0,
+			MGAREG_DMAPAD, 0,
+			MGAREG_SOFTRAP, 0);
+
+	primend = mdev->dma.cmd_handle + mdev->dma.cmd_idx * sizeof(struct mga_cmd_block);
+
+	// Use primary DMA to send the commands
+	WREG32(MGAREG_PRIMADDR, (u32) mdev->dma.cmd_handle);
+	mdev->dma.in_use = 1;
+	WREG32(MGAREG_PRIMEND, primend);
+
+	wait_event_timeout(mdev->dma.waitq, mdev->dma.in_use == 0, HZ);
+
+	if (mdev->dma.in_use) {
+		drm_err(dev, "DMA transfer timed out\n");
+		/* something goes wrong, reset the DMA engine */
+		WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
+		mdev->dma.in_use = 0;
+	}
+
+	/* reset command index to start a new sequence */
+	mdev->dma.cmd_idx = 0;
+}
+
+/*
+ * ILOAD allows to load an image from system memory to the VRAM, and with FXBNDRY, YDST and YDSTLEN,
+ * you can transfer a rectangle, so it's perfect when used with a damage clip.
+ */
+static void mgag200_iload_cmd(struct mga_device *mdev, int x, int y, int width, int height,
+			      int width_padded, int cpp)
+{
+	int size = width_padded * height;
+	u32 iload;
+
+	iload = MGADWG_ILOAD | MGADWG_SGNZERO | MGADWG_SHIFTZERO | MGADWG_REPLACE | MGADWG_CLIPDIS
+		| MGADWG_BFCOL;
+
+	mgag200_dma_add_block(mdev,
+		MGAREG_DWGCTL, iload,
+		MGAREG_FXBNDRY, (((x + width - 1) << 16) | x),
+		MGAREG_AR0, (width_padded / cpp) - 1,
+		MGAREG_AR3, 0);
+
+	mgag200_dma_add_block(mdev,
+		MGAREG_AR5, 0,
+		MGAREG_YDST, y,
+		MGAREG_DMAPAD, 0,
+		MGAREG_DMAPAD, 0);
+
+	mgag200_dma_add_block(mdev,
+		MGAREG_DMAPAD, 0,
+		MGAREG_LEN | MGAREG_EXEC, height,
+		MGAREG_SECADDR, mdev->dma.handle | 1,
+		/* Writing SECEND should always be the last command of a block */
+		MGAREG_SECEND, mdev->dma.handle + size);
+}
+
+static void mgag200_dma_copy(struct mga_device *mdev, const void *src, u32 pitch,
+				struct drm_rect *clip, int cpp)
+{
+	int i;
+	int width = drm_rect_width(clip);
+	int height = drm_rect_height(clip);
+
+	/* pad each line to 32bits boundaries see section 4.5.7 of G200 Specification */
+	int width_padded = round_up(width * cpp, 4);
+
+	for (i = 0; i < height; i++)
+		memcpy(mdev->dma.buf + width_padded * i,
+		       src + (((clip->y1 + i) * pitch) + clip->x1 * cpp),
+		       width * cpp);
+
+	mgag200_iload_cmd(mdev, clip->x1, clip->y1, width, height, width_padded, cpp);
+	mgag200_dma_run_cmd(mdev);
+}
+
+/*
+ * If the DMA coherent buffer is smaller than damage rectangle, we need to
+ * split it into multiple DMA transfers.
+ */
+void mgag200_dma_damage(struct mga_device *mdev, const struct iosys_map *vmap,
+			struct drm_framebuffer *fb, struct drm_rect *clip)
+{
+	u32 pitch = fb->pitches[0];
+	const void *src = vmap[0].vaddr;
+	struct drm_rect subclip;
+	int y1;
+	int lines;
+	int cpp = fb->format->cpp[0];
+
+	/* Number of lines that fit in one DMA buffer */
+	lines = min(drm_rect_height(clip), (int) mdev->dma.size / (drm_rect_width(clip) * cpp));
+
+	subclip.x1 = clip->x1;
+	subclip.x2 = clip->x2;
+
+	for (y1 = clip->y1; y1 < clip->y2; y1 += lines) {
+		subclip.y1 = y1;
+		subclip.y2 = min(clip->y2, y1 + lines);
+		mgag200_dma_copy(mdev, src, pitch, &subclip, cpp);
+	}
+}
+
+/*
+ * Setup the drawing engine (DWG) registers
+ * Color format, framebuffer width, ...
+ * This must be done before using any DWGCTL command
+ */
+void mgag200_dma_dwg_setup(struct mga_device *mdev, struct drm_framebuffer *fb)
+{
+	u32 maccess;
+
+	drm_dbg(&mdev->base, "Setup DWG with %dx%d %p4cc\n",
+		fb->width, fb->height, &fb->format->format);
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_RGB565:
+		maccess = MGAMAC_PW16;
+		break;
+	case DRM_FORMAT_RGB888:
+		maccess = MGAMAC_PW24;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		maccess = MGAMAC_PW32;
+		break;
+	}
+	WREG32(MGAREG_MACCESS, maccess);
+
+	/* Framebuffer width in pixel */
+	WREG32(MGAREG_PITCH, fb->width);
+
+	/* Sane default value for the drawing engine registers */
+	WREG32(MGAREG_DSTORG, 0);
+	WREG32(MGAREG_YDSTORG, 0);
+	WREG32(MGAREG_SRCORG, 0);
+	WREG32(MGAREG_CXBNDRY, 0x0FFF0000);
+	WREG32(MGAREG_YTOP, 0);
+	WREG32(MGAREG_YBOT, 0x00FFFFFF);
+
+	/* Activate blit mode DMA, only write the low part of the register */
+	WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
+}
+
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a5851dcc6bdd..07f34e4df1b0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -119,6 +119,8 @@ static irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
 
 	if (status & MGAIRQ_SOFTRAP) {
 		WREG32(MGAREG_ICLEAR, MGAIRQ_SOFTRAP);
+		mdev->dma.in_use = 0;
+		wake_up(&mdev->dma.waitq);
 		return IRQ_HANDLED;
 	}
 	return IRQ_NONE;
@@ -187,7 +189,7 @@ int mgag200_device_preinit(struct mga_device *mdev)
 			       IRQF_SHARED, "mgag200_irq", mdev);
 	if (ret < 0) {
 		drm_err(dev, "devm_request_irq(VRAM) failed %d\n", ret);
-		return -ENXIO;
+		return ret;
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 9e604dbb8e44..af69f61a11b7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -277,6 +277,27 @@ struct mgag200_device_funcs {
 	void (*pixpllc_atomic_update)(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
 };
 
+struct mga_cmd_block {
+	u32 cmd;
+	u32 v0;
+	u32 v1;
+	u32 v2;
+	u32 v3;
+} __packed;
+
+struct mga_dma {
+	void *buf;
+	size_t size;
+	dma_addr_t handle;
+
+	struct mga_cmd_block *cmd;
+	int cmd_idx;
+	dma_addr_t cmd_handle;
+
+	wait_queue_head_t waitq;
+	int in_use;
+};
+
 struct mga_device {
 	struct drm_device base;
 
@@ -291,6 +312,8 @@ struct mga_device {
 	void __iomem			*vram;
 	resource_size_t			vram_available;
 
+	struct mga_dma dma;
+
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -443,4 +466,10 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
 				/* mgag200_i2c.c */
 int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c);
 
+/* mgag200_dma.c */
+int mgag200_dma_init(struct mga_device *mdev);
+void mgag200_dma_damage(struct mga_device *mdev, const struct iosys_map *vmap,
+			struct drm_framebuffer *fb, struct drm_rect *clip);
+void mgag200_dma_dwg_setup(struct mga_device *mdev, struct drm_framebuffer *fb);
+
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index bf5d7fe525a3..4e972518733a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -424,6 +424,10 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
 	mgag200_g200_init_refclk(g200);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200_device_info,
 				  &mgag200_g200_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index fad62453a91d..6628b891118d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -296,6 +296,10 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200eh_device_info,
 				  &mgag200_g200eh_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 0f7d8112cd49..35219fbe364f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -201,6 +201,10 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200eh3_device_info,
 				  &mgag200_g200eh3_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index bce267e0f7de..fc6df2ffd99d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -330,6 +330,10 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200er_device_info,
 				  &mgag200_g200er_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ac957f42abe1..190c358aba7e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -335,6 +335,10 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200ev_device_info,
 				  &mgag200_g200ev_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 170934414d7d..5de7ccbc575c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -221,6 +221,10 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200ew3_device_info,
 				  &mgag200_g200ew3_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index bd6e573c9a1a..3edb930598dd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -506,6 +506,10 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_g200se_init_unique_rev_id(g200se);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 9baa727ac6f9..6e731da89a5f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -345,6 +345,10 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_dma_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = mgag200_device_init(mdev, &mgag200_g200wb_device_info,
 				  &mgag200_g200wb_device_funcs);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7d8c65372ac4..adfc61428df6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -398,15 +398,6 @@ static void mgag200_disable_display(struct mga_device *mdev)
 	WREG_ECRT(0x01, crtcext1);
 }
 
-static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_map *vmap,
-				  struct drm_framebuffer *fb, struct drm_rect *clip)
-{
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
-
-	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
-}
-
 /*
  * Primary plane
  */
@@ -475,9 +466,13 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (!fb)
 		return;
 
+	if (!old_plane_state->fb || fb->format != old_plane_state->fb->format
+	    || fb->width != old_plane_state->fb->width)
+		mgag200_dma_dwg_setup(mdev, fb);
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
+		mgag200_dma_damage(mdev, shadow_plane_state->data, fb, &damage);
 	}
 
 	/* Always scanout image at VRAM offset 0 */
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 748c8e18e938..256ac92dae56 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -116,6 +116,9 @@
 
 #define	MGAREG_OPMODE		0x1e54
 
+#define MGAREG_PRIMADDR		0x1e58
+#define MGAREG_PRIMEND		0x1e5c
+
 /* Warp Registers */
 #define MGAREG_WIADDR           0x1dc0
 #define MGAREG_WIADDR2          0x1dd8
@@ -200,6 +203,8 @@
 
 /* See table on 4-43 for bop ALU operations */
 
+#define MGADWG_REPLACE	(0xC << 16)
+
 /* See table on 4-44 for translucidity masks */
 
 #define MGADWG_BMONOLEF		( 0x00 << 25 )
@@ -218,6 +223,8 @@
 
 #define MGADWG_PATTERN		( 0x01 << 29 )
 #define MGADWG_TRANSC		( 0x01 << 30 )
+#define MGADWG_CLIPDIS		( 0x01 << 31 )
+
 #define MGAREG_MISC_WRITE	0x3c2
 #define MGAREG_MISC_READ	0x3cc
 #define MGAREG_MEM_MISC_WRITE       0x1fc2
@@ -605,6 +612,9 @@
 #    define MGA_TC2_SELECT_TMU1                 (0x80000000)
 #define MGAREG_TEXTRANS		0x2c34
 #define MGAREG_TEXTRANSHIGH	0x2c38
+#define MGAREG_SECADDR		0x2c40
+#define MGAREG_SECEND		0x2c44
+#define MGAREG_SOFTRAP		0x2c48
 #define MGAREG_TEXFILTER	0x2c58
 #    define MGA_MIN_NRST                        (0x00000000)
 #    define MGA_MIN_BILIN                       (0x00000002)
@@ -691,4 +701,19 @@
 #define MGA_AGP2XPLL_ENABLE		0x1
 #define MGA_AGP2XPLL_DISABLE		0x0
 
+
+#define DWGREG0		0x1c00
+#define DWGREG0_END	0x1dff
+#define DWGREG1		0x2c00
+#define DWGREG1_END	0x2dff
+
+/* These macros convert register address to the 8 bit command index used with DMA
+ * It remaps 0x1c00-0x1dff to 0x00-0x7f (REG0)
+ * and 0x2c00-0x2dff to 0x80-0xff (REG1)
+ */
+#define ISREG0(r)	(r >= DWGREG0 && r <= DWGREG0_END)
+#define DMAREG0(r)	((u8)((r - DWGREG0) >> 2))
+#define DMAREG1(r)	((u8)(((r - DWGREG1) >> 2) | 0x80))
+#define DMAREG(r)	(ISREG0((r)) ? DMAREG0((r)) : DMAREG1((r)))
+
 #endif
-- 
2.40.1

