Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3BADF7FA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBEE10E971;
	Wed, 18 Jun 2025 20:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KycBfeoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0242110E94E;
 Wed, 18 Jun 2025 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750279338;
 bh=1XW/wOssx1+NGNMnxfgS9DRDJKI+lffLVDEpogwkfqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KycBfeoXvcpAQkHaMOwup+Ln0KVtX/st80zL6g4512CcLkSsGsuPn7yIJiR6ZNG2v
 iFzHGcFMPJKEEaXpku7xo9pDOORCvTj+8QsNyQQNa5rwJUaueRXJE8/KAVYvmjYOqX
 BKG4Vh/QhMX0WiWRZ0eBCkvtBIVlwlJzNhciHRjtQc4K25U3VF21aZ327fJNLgLY7F
 RyOCPyPJOgqCJlll68k5SmdWhC+NN8fq+eBr44irh4gbFB/Dcjf0uFpkITRfbWaJa7
 0GtARa9tRgx/8o4Fhcf52Wmcw086eIZOfQBTalvR2ceknI/KBt1QwqRq6C3tjdfrhE
 tCCyNdcTKoFOA==
Received: from localhost.localdomain (unknown [89.186.158.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 070BD17E156E;
 Wed, 18 Jun 2025 22:42:18 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
Date: Wed, 18 Jun 2025 22:43:33 +0200
Message-ID: <20250618204400.21808-6-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
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

The PPU flop reset is required on some hardware to clear the
temporary registers. This implementation follows the code
implemented in the public galcore kernel module code to this
for the PPU.

v2: - Move flop reset data to etnaviv_drm_private and initialize it
      from etnaviv_gpu_bind (Lucas)
    - Prepare code for more chip IDs and other flop reset types
    - do some cleanups and function name renaming

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/Makefile             |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   6 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 205 +++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  25 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |   6 +
 7 files changed, 248 insertions(+)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h

diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 46e5ffad69a6..903101e8751a 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -14,6 +14,7 @@ etnaviv-y := \
 	etnaviv_iommu.o \
 	etnaviv_mmu.o \
 	etnaviv_perfmon.o \
+	etnaviv_flop_reset.o \
 	etnaviv_sched.o
 
 obj-$(CONFIG_DRM_ETNAVIV)	+= etnaviv.o
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 9e007d977efe..a2da3212592f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -18,6 +18,8 @@
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
 
+#include "etnaviv_flop_reset.h"
+
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
@@ -100,6 +102,10 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
 	/* initialize buffer */
 	buffer->user_size = 0;
 
+	/* Queue in PPU flop reset */
+	if (etnaviv_flop_reset_ppu_require(&gpu->identity))
+		etnaviv_flop_reset_ppu_run(gpu);
+
 	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..73dc1c00c027 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -604,6 +604,8 @@ static void etnaviv_unbind(struct device *dev)
 
 	xa_destroy(&priv->active_contexts);
 
+	kfree(priv->flop_reset_data_ppu);
+
 	drm->dev_private = NULL;
 	kfree(priv);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index b3eb1662e90c..20dad16fd554 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -48,6 +48,9 @@ struct etnaviv_drm_private {
 	/* list of GEM objects: */
 	struct mutex gem_lock;
 	struct list_head gem_list;
+
+	/* ppu flop reset data */
+	struct etnaviv_cmdbuf *flop_reset_data_ppu;
 };
 
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
new file mode 100644
index 000000000000..c33647e96636
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Etnaviv Project
+ */
+
+#include "asm-generic/int-ll64.h"
+#include "etnaviv_buffer.h"
+#include "etnaviv_cmdbuf.h"
+#include "state_3d.xml.h"
+
+#include "etnaviv_flop_reset.h"
+
+enum etnaviv_flop_reset_type {
+	flop_reset_ppu = 1 << 0,
+	flop_reset_nn = 1 << 1,
+	flop_reset_tp = 1 << 2
+};
+
+#define PPU_IMAGE_STRIDE 64
+#define PPU_IMAGE_XSIZE 64
+#define PPU_IMAGE_YSIZE 6
+
+#define PPU_FLOP_RESET_INSTR_DWORD_COUNT 16
+
+static void
+etnaviv_emit_flop_reset_state_ppu(struct etnaviv_cmdbuf *cmdbuf,
+				  u32 buffer_base,
+				  u32 input_offset,
+				  u32 output_offset,
+				  u32 shader_offset,
+				  u32 shader_size,
+				  u32 shader_register_count)
+{
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE,
+		               VIVS_GL_API_MODE_OPENCL);
+	CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+	CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
+
+	OUT(cmdbuf, buffer_base + input_offset);
+	OUT(cmdbuf, PPU_IMAGE_STRIDE);
+	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
+	OUT(cmdbuf, 0x444051f0);
+	OUT(cmdbuf, 0xffffffff);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
+	OUT(cmdbuf, buffer_base + output_offset);
+	OUT(cmdbuf, PPU_IMAGE_STRIDE);
+	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
+	OUT(cmdbuf, 0x444051f0);
+	OUT(cmdbuf, 0xffffffff);
+
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG,
+		               VIVS_CL_CONFIG_DIMENSIONS(2) |
+		               VIVS_CL_CONFIG_VALUE_ORDER(3));
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL,
+		               shader_register_count);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH,
+		               shader_size / 16);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR,
+		               buffer_base + shader_offset);
+	CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG,
+		               VIVS_SH_CONFIG_RTNE_ROUNDING);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL,
+		               VIVS_VS_ICACHE_CONTROL_ENABLE);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT,
+		               shader_size / 16 - 1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INPUT_COUNT, 0x1f01);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_HALTI5_UNK008A0, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PA_VS_OUTPUT_COUNT, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_VARYING_TOTAL_COMPONENTS, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_CONTROL_EXT, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_OUTPUT_COUNT, 0x1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_HALTI5_SH_SPECIALS, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_PREFETCH, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_UNK00924, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_THREAD_ALLOCATION, 0x1);
+
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_X, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Y, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Z, 0x0);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_CL_WORKGROUP_COUNT_X, 9);
+	OUT(cmdbuf, 0xf);
+	OUT(cmdbuf, 0x5);
+	OUT(cmdbuf, 0xffffffff);
+	OUT(cmdbuf, 0x0);
+	OUT(cmdbuf, 0x0);
+	OUT(cmdbuf, 0x3ff);
+	OUT(cmdbuf, 0x0);
+	OUT(cmdbuf, 0x4);
+	OUT(cmdbuf, 0x1);
+	OUT(cmdbuf, 0x0);
+
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_KICKER, 0xbadabeeb);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_FLUSH_CACHE,
+		               VIVS_GL_FLUSH_CACHE_SHADER_L1 |
+		               VIVS_GL_FLUSH_CACHE_UNK10 |
+		               VIVS_GL_FLUSH_CACHE_UNK11);
+}
+
+static void
+etnaviv_flop_reset_ppu_fill_input(u32 *buffer, u32 size)
+{
+	for (int i = 0; i < size/4; ++i, ++buffer)
+		*buffer = 0x01010101;
+}
+
+static void
+etnaviv_flop_reset_ppu_set_shader(u8 *dest)
+{
+	const u32 inst[PPU_FLOP_RESET_INSTR_DWORD_COUNT] = {
+		/* img_load.u8 r1, c0, r0.xy */
+		0x78011779, 0x39000804, 0x00A90050, 0x00000000,
+		/* img_load.u8 r2, c0, r0.xy */
+		0x78021779, 0x39000804, 0x00A90050, 0x00000000,
+		/* dp2x8 r1, r1, r2, c3_512 */
+		0xB8017145, 0x390018FC, 0x01C90140, 0x40390028,
+		/* img_store.u8 r1, c2, r0.xy, r1 */
+		0x380007BA, 0x39001804, 0x00A90050, 0x00390018,
+	};
+	memcpy(dest, inst, sizeof(inst));
+}
+
+static struct etnaviv_flop_reset_entry {
+	u16 chip_model;
+	u16 revision;
+	u32 flags;
+} etnaviv_flop_reset_db [] = {
+	{
+		.chip_model = 0x8000,
+		.revision = 0x6205,
+		.flags = flop_reset_ppu
+	},
+};
+
+bool
+etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
+{
+	const struct etnaviv_flop_reset_entry *e = etnaviv_flop_reset_db;
+
+	for (int i = 0; i < ARRAY_SIZE(etnaviv_flop_reset_db); ++i, ++e) {
+		if (chip_id->model == e->chip_model &&
+		    chip_id->revision == e->revision)
+			return (e->flags & flop_reset_ppu) != 0;
+	}
+
+	return false;
+}
+
+static const u32 image_data_size = PPU_IMAGE_STRIDE * PPU_IMAGE_YSIZE;
+static const u32 output_offset = ALIGN(image_data_size, 64);
+static const u32 shader_offset = ALIGN(output_offset + image_data_size, 64);
+static const u32 shader_size = PPU_FLOP_RESET_INSTR_DWORD_COUNT * sizeof(u32);
+static const u32 shader_register_count = 3;
+static const u32 buffer_size = shader_offset + shader_size;
+
+void
+etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv)
+{
+	/* Get some space from the rung buffer to put the payload
+	   (input and output image, and shader), we keep this buffer
+	   for the whole life time the driver is bound */
+	priv->flop_reset_data_ppu =
+	  kzalloc(sizeof(*priv->flop_reset_data_ppu), GFP_KERNEL);
+
+	etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
+			    priv->flop_reset_data_ppu, buffer_size);
+
+	void *buffer_base = priv->flop_reset_data_ppu->vaddr;
+
+	u32 *input_data = (u32 *)buffer_base;
+	etnaviv_flop_reset_ppu_fill_input(input_data, image_data_size);
+
+	u8 *shader_data = (u8 *)buffer_base + shader_offset;
+	etnaviv_flop_reset_ppu_set_shader(shader_data);
+}
+
+void
+etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu)
+{
+	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+
+	if (!priv->flop_reset_data_ppu) {
+		pr_err("Flop reset data was not initialized, skipping\n");
+		return;
+	}
+
+	u32 buffer_base = etnaviv_cmdbuf_get_va(priv->flop_reset_data_ppu,
+						&gpu->mmu_context->cmdbuf_mapping);
+
+	etnaviv_emit_flop_reset_state_ppu(&gpu->buffer,
+					  buffer_base,
+					  0,
+					  output_offset,
+					  shader_offset,
+					  shader_size,
+					  shader_register_count);
+}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
new file mode 100644
index 000000000000..f51cece75507
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Etnaviv Project
+ */
+
+
+#ifndef etnaviv_flop_reset_h
+#define etnaviv_flop_reset_h
+
+#include <linux/types.h>
+
+struct etnaviv_chip_identity;
+struct etnaviv_drm_private;
+struct etnaviv_gpu;
+
+bool
+etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id);
+
+void
+etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv);
+
+void
+etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu);
+
+#endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index dc8a7ff3e797..0d1dc1b1d98d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -18,6 +18,7 @@
 
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_dump.h"
+#include "etnaviv_flop_reset.h"
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
@@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 		ret = -ENXIO;
 		goto out_sched;
 	}
+
+	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
+	    !priv->flop_reset_data_ppu)
+		etnaviv_flop_reset_ppu_init(priv);
+
 	priv->gpu[priv->num_gpus++] = gpu;
 
 	return 0;
-- 
2.49.0

