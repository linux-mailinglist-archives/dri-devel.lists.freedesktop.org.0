Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076BB8575B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF0910E204;
	Thu, 18 Sep 2025 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="MiHTlx7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C6E10E200
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1758208144; x=1789744144;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=SixyqBrrvj6KAhxMz3x8D5Og/vSDhHl0cM93vdTNBUU=;
 b=MiHTlx7NlxPOJiM0olHCz+Das+v+D2pVDvsGl/tuywWxdGNqe4NLzO64
 o+7+aZ8NjXLcd2qW0scPsqRg5JRsZXZLqQ54lHxJOZ+xuMVVZHsbxYK/U
 nz4lkulPG2od0vI+hTxJ4LYuQ6nIZ3LjYZg4E22IV0PabQdHt0MDeVWNs
 9RvGbTLVNluyeSERegaTLtrk9naedbZ1/4tx+lE6wDFgSoTYo8t3nLCKk
 FdGIplHu2fy3sl8kLBRvQNsTeFOCKmavKll7ku2OtAN7wxwPr3v1ci86K
 N5hNfdDlbrEOllEYvVQ03SVxBdqyqLpCtvEtAQPenTzDnI7xQ/jLJgGUd w==;
X-CSE-ConnectionGUID: ugeKBCocT/GeJhh6l5hQPQ==
X-CSE-MsgGUID: QRSG/7EaRpWysuP40aQ6kg==
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="47215037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2025 08:09:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 08:08:32 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 08:08:28 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 18 Sep 2025 17:07:36 +0200
Subject: [PATCH v2 2/5] drm/microchip: add a driver for the Microchip GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-cpitchen-mainline_gfx2d-v2-2-6cfac9d56612@microchip.com>
References: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
In-Reply-To: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=109742;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=SixyqBrrvj6KAhxMz3x8D5Og/vSDhHl0cM93vdTNBUU=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8YZheR99jJeYeUCytqpMufn7RVZcGsC703lxwmbNwRtn
 bp9hnNhRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZgIVxXD//Jqo+6n0db83WG3
 dlxXZn8eXvFbSzRD2IjjzVuBlQwhhxj+B+xpTb0nsV8gwVrzzyURf9uThovnWYhHv7PzCrz0Nze
 CBwA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
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

The Microchip GFX2D is a 2D GPU, which supports very basic graphics
instructions. Each intruction process a single rectangle defined by:
- its width and height.
- the coordinates of its top-left corner relative to each surface
  involved in the operation.

Indeed, each graphics instruction works on one surface at least, the
target surface where the rectangle is drawn. More surfaces may be
required as sources depending on the type of graphics instruction.

The supported graphics instructions are:
- FILL: uniformly fills the rectangle in the target surface with a
  color.
- COPY: copies the rectangle from one source surface into the target
  surface.
- BLEND: blends the rectangles from two source surfaces into a single
  rectangle within the target surface, according to blend parameters
 (blend function, blend factors, blend colors, ...).
- ROP: operates on rasters taking two or three surfaces as inputs with
  additional parameters and fills the rectangle in the target surface
  based on the requested raster operation.

GFX2D instructions are ordered by being queued into a ring buffer in
the system memory. This driver updates the ring buffer head pointer to
notify the GPU about new instructions to process, while the GPU updates
the tail pointer when the instructions have been fetched (but not
necessarily completed yet).

A trick with LDR (load) and STR (store) instructions has been
implemented to precisely know whether a given GFX2D instruction has
completed. Indeed, with its interrupt or status register only, the GFX2D
can only notify that some instruction has completed but that's not
enough to find out which one precisely.

Therefore, after each batch a graphics instructions named as a command,
a LDR instruction loads the command ID (a uint32_t monotonically
increasing) into a GFX2D internal general purpose register.
This LDR instruction is immediately followed by a STR instruction, which
writes the value in the GFX2D internal register, hence the command ID,
into some fixed address in the system memory which is used as a mailbox.
Also, when the STR instruction completes, it triggers an interrupt in the
GFX2D, if this interrupt is enabled, to wake up the interrupt thread as
needed and to serve waiting tasks.

So, at any moment, the driver can read the mailbox; any command with an
ID lower than or equal to the value read in the mailbox is guaranteed to
be completed by the GPU. Actually, integer overflows are handled by
comparing both the mailbox value and the command ID to a third value,
the ID of the latest command completed by the driver, which is known to
be lower than or equal to both the mailbox value and the ID of the
command being tested for completion.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 MAINTAINERS                                  |   10 +
 drivers/gpu/drm/Kconfig                      |    2 +
 drivers/gpu/drm/Makefile                     |    1 +
 drivers/gpu/drm/microchip/Kconfig            |   21 +
 drivers/gpu/drm/microchip/Makefile           |    8 +
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c   | 1808 ++++++++++++++++++++++++++
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h   |  169 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.c   |  350 +++++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.h   |  132 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.c   |  263 ++++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.h   |   90 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c |  274 ++++
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h |   17 +
 include/uapi/drm/microchip_drm.h             |  286 ++++
 14 files changed, 3431 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5257d52679d60d084b85e2f023730286aa79311d..d9d214a4ee7282b9f24523de31864edf6e2e1e83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8113,6 +8113,7 @@ X:	drivers/gpu/drm/exynos/
 X:	drivers/gpu/drm/i915/
 X:	drivers/gpu/drm/kmb/
 X:	drivers/gpu/drm/mediatek/
+X:	drivers/gpu/drm/microchip/
 X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nova/
 X:	drivers/gpu/drm/radeon/
@@ -8274,6 +8275,15 @@ F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
+DRM DRIVERS FOR MICROCHIP
+M:	Cyrille Pitchen <cyrille.pitchen@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
+F:	drivers/gpu/drm/microchip/
+F:	include/uapi/drm/microchip_drm.h
+
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
 M:	Mikko Perttunen <mperttunen@nvidia.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c0e17ee39364e0e832cd17571358f..ab7faea334d870ca12bfde68be1b4a8441cfab73 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -312,6 +312,8 @@ source "drivers/gpu/drm/armada/Kconfig"
 
 source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
 
+source "drivers/gpu/drm/microchip/Kconfig"
+
 source "drivers/gpu/drm/renesas/Kconfig"
 
 source "drivers/gpu/drm/sun4i/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86acc2d31177f8d68e74698e7533587..6cbbf28faae9e0f544d8ef82e42f9b250b1fe3c8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -189,6 +189,7 @@ obj-$(CONFIG_DRM_UDL) += udl/
 obj-$(CONFIG_DRM_AST) += ast/
 obj-$(CONFIG_DRM_ARMADA) += armada/
 obj-$(CONFIG_DRM_ATMEL_HLCDC)	+= atmel-hlcdc/
+obj-$(CONFIG_DRM_MICROCHIP_GFX2D) += microchip/
 obj-y			+= renesas/
 obj-y			+= omapdrm/
 obj-$(CONFIG_DRM_SUN4I) += sun4i/
diff --git a/drivers/gpu/drm/microchip/Kconfig b/drivers/gpu/drm/microchip/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..976843713f38bf0e6557c3018de064936b9f252a
--- /dev/null
+++ b/drivers/gpu/drm/microchip/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_MICROCHIP_GFX2D
+	tristate "DRM support for Microchip GFX2D GPU"
+	depends on DRM && OF && COMMON_CLK && ARM
+	help
+	  Choose this option if you have a Microchip SoC with a GFX2D GPU
+	  (i.e. SAM9X60 or SAM9X7 families). The GFX2D supports basic 2D
+	  graphics instructions, each working on a single rectangle defined
+	  by its width and height plus the coordinates of its top-left
+	  corner in each of the surface (behind a DRM GEM object) involved
+	  in the graphics instructions. There are four types of graphics
+	  instructions:
+	  - FILL: the rectangle is filled in the target surface with a
+	  uniform color.
+	  - COPY: the rectangle is copied from a single source surface into
+	  the target surface.
+	  - BLEND: the rectangle in the target surface is the result of a
+	  blending from rectangles of the same size in two source surfaces.
+	  - ROP: the rectangle in the target surface is the result of a
+	  raster operation on two (ROP2), three (ROP3), or four (ROP4)
+	  source surfaces, depending on the selected raster mode.
diff --git a/drivers/gpu/drm/microchip/Makefile b/drivers/gpu/drm/microchip/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..e60d4994d1d9dc1ebedf5b08c13972dfd7a82284
--- /dev/null
+++ b/drivers/gpu/drm/microchip/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+microchip-gfx2d-y := \
+	mchp_gfx2d_cmd.o \
+	mchp_gfx2d_drv.o \
+	mchp_gfx2d_gem.o \
+	mchp_gfx2d_ioctl.o
+
+obj-$(CONFIG_DRM_MICROCHIP_GFX2D) += microchip-gfx2d.o
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c b/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c
new file mode 100644
index 0000000000000000000000000000000000000000..f94e8963e6a08e331b4469e318c2b68a7a3c5d40
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c
@@ -0,0 +1,1808 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <linux/circ_buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_file.h>
+
+#include "mchp_gfx2d_cmd.h"
+#include "mchp_gfx2d_drv.h"
+#include "mchp_gfx2d_gem.h"
+
+#define MCHP_GFX2D_TIMEOUT                  1000 /* ms */
+#define MCHP_GFX2D_NB_WORDS_LDR             2
+#define MCHP_GFX2D_NB_WORDS_STR             1
+
+/*
+ * 3 LDR commands, 2 words each, to set GFX2D_PAx, GFX2D_PITCHx and
+ * GFX2D_CFGx registers, when changing a surface.
+ */
+#define MCHP_GFX2D_NB_WORDS_SET_SURFACE     (3 * MCHP_GFX2D_NB_WORDS_LDR)
+
+#define MCHP_GFX2D_NB_WORDS_EPILOGUE        (MCHP_GFX2D_NB_WORDS_LDR + MCHP_GFX2D_NB_WORDS_STR)
+
+#define MCHP_GFX2D_NB_WORDS_FILL            4
+#define MCHP_GFX2D_NB_WORDS_COPY            4
+#define MCHP_GFX2D_NB_WORDS_BLEND           6
+#define MCHP_GFX2D_NB_WORDS_ROP             7
+
+#define BLEND_SREG                          REG_GPREG0
+#define BLEND_DREG                          REG_GPREG1
+#define CMD_END_REG                         REG_GPREG4
+#define MBX_ADDR_REG                        REG_GPREG5
+
+static void mchp_gfx2d_enable_exend(struct mchp_gfx2d_device *priv)
+{
+	drm_dbg(&priv->drm, "enable EXEND interrupt\n");
+	writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_IE);
+}
+
+static void mchp_gfx2d_push(struct mchp_gfx2d_device *priv, uint32_t value)
+{
+	priv->rb.data[priv->rb.head] = value;
+	priv->rb.head = (priv->rb.head + 1) & (priv->rb.size - 1);
+}
+
+static inline void mchp_gfx2d_trigger(struct mchp_gfx2d_device *priv)
+{
+	writel(priv->rb.head, priv->regs + GFX2D_HEAD);
+}
+
+static void mchp_gfx2d_ldr(struct mchp_gfx2d_device *priv,
+			   enum mchp_gfx2d_reg_id reg, uint32_t value)
+{
+	uint32_t word0 = GFX2D_WD0_OPCODE(GFX2D_OPCODE_LDR) | GFX2D_WD0_REG(reg);
+
+	mchp_gfx2d_push(priv, word0);
+	mchp_gfx2d_push(priv, value);
+}
+
+static void mchp_gfx2d_epilogue(struct mchp_gfx2d_device *priv,
+				struct mchp_gfx2d_command *cmd)
+{
+	mchp_gfx2d_ldr(priv, CMD_END_REG, cmd->id);
+	mchp_gfx2d_push(priv,
+			GFX2D_WD0_OPCODE(GFX2D_OPCODE_STR) |
+			GFX2D_WD0_IE |
+			GFX2D_WD0_REG(CMD_END_REG) |
+			GFX2D_WD0_REGAD(MBX_ADDR_REG));
+	mchp_gfx2d_trigger(priv);
+}
+
+/**
+ * mchp_gfx2d_alloc_rectangles - reserve rectangles for a command
+ * @cmd: the command which the rectangles are reserved for
+ * @num_rectangles: the number of rectangles to reserve
+ *
+ * If requested rectangles fit into the 'cmd->ctx->rectangles' array, this
+ * array is returned (as a temporary storage). Otherwise, memory is allocated
+ * with kvmalloc_array(), hence should be freed later.
+ *
+ * In any case, mchp_gfx2d_free_rectangles() MUST be called on @cmd from
+ * mchp_gfx2d_release_command().
+ *
+ * RETURNS:
+ * 0 if the reservation was successful, -ENOMEM otherwise.
+ */
+static int mchp_gfx2d_alloc_rectangles(struct mchp_gfx2d_command *cmd,
+				       size_t num_rectangles)
+{
+	cmd->num_rects = num_rectangles;
+
+	if (num_rectangles <= ARRAY_SIZE(cmd->ctx->rectangles)) {
+		cmd->can_free_rects = false;
+		cmd->rects = cmd->ctx->rectangles;
+		return 0;
+	}
+
+	cmd->rects = kvmalloc_array(num_rectangles,
+				    sizeof(struct drm_mchp_gfx2d_rectangle),
+				    GFP_KERNEL);
+	cmd->can_free_rects = (cmd->rects != NULL);
+	return cmd->can_free_rects ? 0 : -ENOMEM;
+}
+
+/**
+ * mchp_gfx2d_dup_rectangles - duplicate rectangles for a command, if needed
+ * @cmd: the command which the rectangles are duplicated for
+ *
+ * If 'cmd->rects' points to 'cmd->ctx->rectangles' ('cmd->can_free_rect'
+ * is false) this functions allocates memory then copy the command rectangles
+ * into the new array.
+ *
+ * If 'cmd->rects' has already been allocated with kvmalloc_array() from
+ * mchp_gfx2d_alloc_rectangles() then this function does nothing.
+ *
+ * RETURNS:
+ * 0 on success, -ENOMEM otherwise.
+ */
+static int mchp_gfx2d_dup_rectangles(struct mchp_gfx2d_command *cmd)
+{
+	struct drm_mchp_gfx2d_rectangle *dup;
+
+	if (cmd->can_free_rects)
+		return 0;
+
+	dup = kvmalloc_array(cmd->num_rects, sizeof(*cmd->rects), GFP_KERNEL);
+	if (!dup)
+		return -ENOMEM;
+
+	memcpy(dup, cmd->rects, cmd->num_rects * sizeof(*cmd->rects));
+	cmd->rects = dup;
+	cmd->can_free_rects = true;
+	return 0;
+}
+
+/**
+ * mchp_gfx2d_free_rectangles - free the rectangles for a command, if needed
+ * @cmd: the command which the rectangles are freed for
+ *
+ * If 'cmd->can_free_rects' is true, call kvfree() on 'cmd->rects'.
+ * Otherwise, either 'cmd->rects' is NULL or points to 'cmd->ctx->rectangles',
+ * so nothing has to be done.
+ */
+static void mchp_gfx2d_free_rectangles(struct mchp_gfx2d_command *cmd)
+{
+	if (cmd->can_free_rects)
+		kvfree(cmd->rects);
+}
+
+/**
+ * mchp_gfx2d_release_command - release a command
+ * @priv: the GFX2D device
+ * @cmd: the command to release
+ * @recycle: if true, insert @cmd into 'priv->free_cmdlist' for reuse
+ *
+ * This function releases a command and its resources.
+ *
+ * It MAY be called with the 'priv->cmdlist_mutex' held.
+ */
+static void mchp_gfx2d_release_command(struct mchp_gfx2d_device *priv,
+				       struct mchp_gfx2d_command *cmd,
+				       bool recycle)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	int i;
+
+	drm_dbg(&priv->drm, "cmd %u: release command\n", cmd->id);
+
+	gfx2d_obj = cmd->target;
+	if (gfx2d_obj) {
+		mchp_gfx2d_gem_unref(gfx2d_obj);
+		drm_dbg(&priv->drm,
+			"cmd %u: unref object %u (%d) as target\n",
+			cmd->id,
+			gfx2d_obj->id, atomic_read(&gfx2d_obj->gpu_active));
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cmd->sources); i++) {
+		struct mchp_gfx2d_source *src = &cmd->sources[i];
+
+		gfx2d_obj = src->gfx2d_obj;
+
+		if (!gfx2d_obj)
+			continue;
+
+		mchp_gfx2d_gem_unref(gfx2d_obj);
+		drm_dbg(&priv->drm,
+			"cmd %u: unref object %u (%d) as source %d at (%d,%d)\n",
+			cmd->id,
+			gfx2d_obj->id, atomic_read(&gfx2d_obj->gpu_active),
+			i, src->x, src->y);
+	}
+
+	gfx2d_obj = cmd->mask;
+	if (gfx2d_obj) {
+		mchp_gfx2d_gem_unref(gfx2d_obj);
+		drm_dbg(&priv->drm,
+			"cmd %u: unref object %u (%d) as mask\n",
+			cmd->id,
+			gfx2d_obj->id, atomic_read(&gfx2d_obj->gpu_active));
+	}
+
+	mchp_gfx2d_free_rectangles(cmd);
+
+	if (recycle) {
+		mutex_lock(&priv->free_cmdlist_mutex);
+		list_add_tail(&cmd->cmd_node, &priv->free_cmdlist);
+		mutex_unlock(&priv->free_cmdlist_mutex);
+	}
+}
+
+/**
+ * mchp_gfx2d_cmd_remaining_rects - get the number of remaining rects to process
+ * @cmd: the command gathering graphics instructions with the same op code
+ *
+ * RETURNS:
+ * number of rectangles that have not been appended yet into the ring buffer.
+ */
+static inline size_t
+mchp_gfx2d_cmd_remaining_rects(const struct mchp_gfx2d_command *cmd)
+{
+	return cmd->num_rects - cmd->next_rect;
+}
+
+/**
+ * mchp_gfx2d_cmd_is_fully_scheduled - tell whether there are remaining graphics
+ * instructions for this command that have not been appended into the ring
+ * buffer yet
+ * @cmd: the command gathering graphics instructions with the same op code
+ *
+ * RETURNS:
+ * true if all graphics instructions (or rectangles) have already been appended
+ * into the ring buffer, false otherwise.
+ */
+static inline bool
+mchp_gfx2d_cmd_is_fully_scheduled(const struct mchp_gfx2d_command *cmd)
+{
+	return mchp_gfx2d_cmd_remaining_rects(cmd) == 0;
+}
+
+/**
+ * mchp_gfx2d_set_surface - change a surface in the GFX2D hardware, if needed
+ * @priv: the GFX2D device
+ * @index: the surface index to be changed (MUST be in [0..2])
+ * @gfx2d_obj: the GFX2D object to be set as a surface
+ *
+ * If the current surface @index is already fetched from the @gfx2d_obj object,
+ * then this function does nothing. Otherwise, it appends LDR instructions into
+ * the ring buffer to load the GFX2D_PAx, GFX2D_PITCHx and GFX2D_CFGx registers
+ * (x being the @index value) with the proper values before executing further
+ * graphics instructions.
+ *
+ * Called from mchp_gfx2d_run_command().
+ */
+static void mchp_gfx2d_set_surface(struct mchp_gfx2d_device *priv,
+				   uint32_t index,
+				   struct mchp_gfx2d_gem_object *gfx2d_obj)
+{
+	enum drm_mchp_gfx2d_pixel_format format = gfx2d_obj->format;
+	u16 stride = gfx2d_obj->stride;
+
+	if (priv->surfaces[index] == gfx2d_obj)
+		return;
+
+	drm_gem_object_get(&gfx2d_obj->base);
+
+	drm_dbg(&priv->drm, "load object %u into surface %u\n",
+		gfx2d_obj->id, index);
+
+	mchp_gfx2d_ldr(priv, REG_PA(index), gfx2d_obj->dma_addr);
+	mchp_gfx2d_ldr(priv, REG_PITCH(index), GFX2D_PITCH_DAT(stride));
+	mchp_gfx2d_ldr(priv, REG_CFG(index), GFX2D_CFG_PF(format));
+	mchp_gfx2d_trigger(priv);
+
+	/*
+	 * If the previous gfx2d_obj pointed by priv->surfaces[index] is
+	 * still accessed by the GPU, it means at least some command still
+	 * has a reference to it. Hence, we can safely release another
+	 * reference to it here.
+	 */
+	mchp_gfx2d_gem_put(priv->surfaces[index]);
+	priv->surfaces[index] = gfx2d_obj;
+}
+
+/**
+ * mchp_gfx2d_intersection - compute the intersection of two rectangles
+ * @a: the first rectangle
+ * @b: the second rectangle
+ * @result: the intersection rectangle, if not empty
+ *
+ * Called from mchp_gfx2d_clip_rect().
+ *
+ * RETURNS:
+ * true if the resulting rectangle is not empty, false otherwise.
+ */
+static bool mchp_gfx2d_intersection(const struct drm_mchp_gfx2d_rectangle *a,
+				    const struct drm_mchp_gfx2d_rectangle *b,
+				    struct drm_mchp_gfx2d_rectangle *result)
+{
+	int min_x = max(a->x, b->x);
+	int max_x = min(a->x + a->w, b->x + b->w);
+	int min_y = max(a->y, b->y);
+	int max_y = min(a->y + a->h, b->y + b->h);
+
+	if (min_x >= max_x)
+		return false;
+
+	if (min_y >= max_y)
+		return false;
+
+	result->x = min_x;
+	result->y = min_y;
+	result->w = max_x - min_x;
+	result->h = max_y - min_y;
+	return true;
+}
+
+/**
+ * mchp_gfx2d_clip_rect - clip a rectangle based on a command target and sources
+ * @cmd: the command being prepared for execution
+ * @r: the coordinates to be written into the WDx words of a graphics instruction
+ * @rect: the rectangle coming from the submit ioctl
+ * @num_sources: the number of sources to consider for this @cmd command
+ *
+ * This function clips the @rect rectangle computing its intersection with
+ * the @cmd command target surface and all its source surfaces (the actual
+ * sources taken into account depend on the @cmd command operation, hence on
+ * @num_sources).
+ *
+ * If the intersection is not empty, then it fills the @r output parameter with
+ * the proper coordinates to be written in the WDx words of the FILL, COPY,
+ * BLEND or ROP instruction to be appened into the GFX2D ring buffer.
+ *
+ * This function is called from mchp_gfx2d_run_instructions().
+ *
+ * RESULTS:
+ * true if the clipped rectangle is not empty and should be sent to the GFX2D
+ * through its rinb buffer, false otherwise (meaning the rectangle will be
+ * discarded).
+ */
+static bool mchp_gfx2d_clip_rect(const struct mchp_gfx2d_command *cmd,
+				 struct mchp_gfx2d_rectangle *r,
+				 const struct drm_mchp_gfx2d_rectangle *rect,
+				 uint32_t num_sources)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj = cmd->target;
+	struct drm_mchp_gfx2d_rectangle target, clip;
+	uint32_t i;
+
+	target.x = 0;
+	target.y = 0;
+	target.w = gfx2d_obj->width;
+	target.h = gfx2d_obj->height;
+	if (!mchp_gfx2d_intersection(rect, &target, &clip))
+		return false;
+
+	for (i = 0; i < num_sources; i++) {
+		const struct mchp_gfx2d_source *src = &cmd->sources[i];
+		struct drm_mchp_gfx2d_rectangle source;
+
+		gfx2d_obj = src->gfx2d_obj;
+
+		source.x = src->x;
+		source.y = src->y;
+		source.w = gfx2d_obj->width;
+		source.h = gfx2d_obj->height;
+		if (!mchp_gfx2d_intersection(&clip, &source, &clip))
+			return false;
+	}
+
+	r->dst_x = clip.x;
+	r->dst_y = clip.y;
+	r->width = clip.w;
+	r->height = clip.h;
+	for (i = 0; i < num_sources; i++) {
+		const struct mchp_gfx2d_source *src = &cmd->sources[i];
+
+		r->src_x[i] = clip.x - src->x;
+		r->src_y[i] = clip.y - src->y;
+	}
+
+	return true;
+}
+
+/**
+ * mchp_gfx2d_fill - append a FILL instruction into the ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the FILL command to be appended
+ * @r: the coordinates to set into the FILL WD1 and WD2 words
+ *
+ * This function is called from mchp_gfx2d_run_instructions().
+ */
+static void mchp_gfx2d_fill(struct mchp_gfx2d_device *priv,
+			    const struct mchp_gfx2d_command *cmd,
+			    const struct mchp_gfx2d_rectangle *r)
+{
+	mchp_gfx2d_push(priv, GFX2D_WD0_OPCODE(GFX2D_OPCODE_FILL) |
+			GFX2D_WD0_ARGS(2));
+	mchp_gfx2d_push(priv, GFX2D_WD1_SIZE(r));
+	mchp_gfx2d_push(priv, GFX2D_WD2_DPOS(r));
+	mchp_gfx2d_push(priv, cmd->fill.color);
+}
+
+/**
+ * mchp_gfx2d_copy - append a COPY instruction into the ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the COPY command to be appended
+ * @r: the coordinates to set into the COPY WD1, WD2, and WD3 words
+ *
+ * This function is called from mchp_gfx2d_run_instructions().
+ */
+static void mchp_gfx2d_copy(struct mchp_gfx2d_device *priv,
+			    const struct mchp_gfx2d_command *cmd,
+			    const struct mchp_gfx2d_rectangle *r)
+{
+	(void)cmd;
+
+	mchp_gfx2d_push(priv, GFX2D_WD0_OPCODE(GFX2D_OPCODE_COPY) |
+			GFX2D_WD0_ARGS(2));
+	mchp_gfx2d_push(priv, GFX2D_WD1_SIZE(r));
+	mchp_gfx2d_push(priv, GFX2D_WD2_DPOS(r));
+	mchp_gfx2d_push(priv, GFX2D_WD3_SPOS(r));
+}
+
+/**
+ * mchp_gfx2d_blend - append a BLEND instruction into the ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the BLEND command to be appended
+ * @r: the coordinates to set into the BLEND WD1, WD2, WD3 and WD4 words
+ *
+ * This function is called from mchp_gfx2d_run_instructions().
+ */
+static void mchp_gfx2d_blend(struct mchp_gfx2d_device *priv,
+			     const struct mchp_gfx2d_command *cmd,
+			     const struct mchp_gfx2d_rectangle *r)
+{
+	uint32_t word0, word5;
+
+	word0 = GFX2D_WD0_OPCODE(GFX2D_OPCODE_BLEND) |
+		GFX2D_WD0_REG(BLEND_SREG) |
+		GFX2D_WD0_ARGS(4);
+	if (priv->caps->has_dreg)
+		word0 |= GFX2D_WD0_DREG(BLEND_DREG);
+
+	word5 = GFX2D_WD5_DPRE(FIELD_GET(GFX2D_BLEND_DPRE, cmd->blend.flags)) |
+		GFX2D_WD5_DAFACT(cmd->blend.dafact) |
+		GFX2D_WD5_SPRE(FIELD_GET(GFX2D_BLEND_SPRE, cmd->blend.flags)) |
+		GFX2D_WD5_SAFACT(cmd->blend.safact) |
+		GFX2D_WD5_DCFACT(cmd->blend.dcfact) |
+		GFX2D_WD5_SCFACT(cmd->blend.scfact) |
+		GFX2D_WD5_FUNC(cmd->blend.func);
+
+	mchp_gfx2d_push(priv, word0);
+	mchp_gfx2d_push(priv, GFX2D_WD1_SIZE(r));
+	mchp_gfx2d_push(priv, GFX2D_WD2_DPOS(r));
+	mchp_gfx2d_push(priv, GFX2D_WD3_S0POS(r));
+	mchp_gfx2d_push(priv, GFX2D_WD4_S1POS(r));
+	mchp_gfx2d_push(priv, word5);
+}
+
+/**
+ * mchp_gfx2d_rop - append a ROP instruction into the ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the ROP command to be appended
+ * @r: the coordinates to set into the ROP WD1, WD2, WD3 and WD4 words
+ *
+ * This function is called from mchp_gfx2d_run_instructions().
+ */
+static void mchp_gfx2d_rop(struct mchp_gfx2d_device *priv,
+			   const struct mchp_gfx2d_command *cmd,
+			   const struct mchp_gfx2d_rectangle *r)
+{
+	const struct mchp_gfx2d_gem_object *gfx2d_obj = cmd->mask;
+	uint32_t word6;
+
+	word6 = GFX2D_WD6_ROPM(cmd->rop.mode) |
+		GFX2D_WD6_ROPH(cmd->rop.high) |
+		GFX2D_WD6_ROPL(cmd->rop.low);
+
+	mchp_gfx2d_push(priv, GFX2D_WD0_OPCODE(GFX2D_OPCODE_ROP) |
+			GFX2D_WD0_ARGS(5));
+	mchp_gfx2d_push(priv, GFX2D_WD1_SIZE(r));
+	mchp_gfx2d_push(priv, GFX2D_WD2_DPOS(r));
+	mchp_gfx2d_push(priv, GFX2D_WD3_S0POS(r));
+	mchp_gfx2d_push(priv, GFX2D_WD4_S1POS(r));
+	mchp_gfx2d_push(priv, gfx2d_obj ? gfx2d_obj->dma_addr : 0);
+	mchp_gfx2d_push(priv, word6);
+}
+
+/**
+ * mchp_gfx2d_run_instructions - append graphics instructions
+ * @priv: the GFX2D device
+ * @cmd: the command gathering all the rectangles to process
+ * @num_rects: the exact number of rectangles to process
+ *
+ * This function appends up to @num_rects graphics instructions into the ring
+ * buffer (one graphics instruction per rectangle). If @cmd has no more
+ * rectangle to append then this function also appends the command epilogue.
+ *
+ * It triggers the GFX2D after each graphics instruction by updating its
+ * GFX2D_HEAD register but sets the IE bit of the WD0 word only for the last
+ * graphics instruction, hence limiting the number of interrupts when they are
+ * enabled.
+ *
+ * It is called from mchp_gfx2d_run_command().
+ */
+static void mchp_gfx2d_run_instructions(struct mchp_gfx2d_device *priv,
+					struct mchp_gfx2d_command *cmd,
+					size_t num_rects)
+{
+	u32 num_sources;
+	const struct drm_mchp_gfx2d_rectangle *rect;
+	uint32_t *latest_command = NULL;
+	void (*op_func)(struct mchp_gfx2d_device *priv,
+			const struct mchp_gfx2d_command *cmd,
+			const struct mchp_gfx2d_rectangle *r);
+	size_t cnt = 0;
+
+	switch (cmd->operation) {
+	case DRM_MCHP_GFX2D_OP_FILL:
+		num_sources = 0;
+		op_func = mchp_gfx2d_fill;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_COPY:
+		num_sources = 1;
+		op_func = mchp_gfx2d_copy;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_BLEND:
+		num_sources = 2;
+		op_func = mchp_gfx2d_blend;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_ROP:
+		num_sources = 2;
+		op_func = mchp_gfx2d_rop;
+		break;
+
+	default:
+		/* Should not happen... */
+		cmd->next_rect += num_rects;
+		goto exit;
+	}
+
+	while (num_rects--) {
+		struct mchp_gfx2d_rectangle r;
+
+		rect = &cmd->rects[cmd->next_rect++];
+
+		if (!mchp_gfx2d_clip_rect(cmd, &r, rect, num_sources))
+			continue;
+
+		if (latest_command)
+			mchp_gfx2d_trigger(priv);
+
+		latest_command = &priv->rb.data[priv->rb.head];
+		op_func(priv, cmd, &r);
+
+		cnt++;
+	}
+
+	if (latest_command) {
+		*latest_command |= GFX2D_WD0_IE;
+		mchp_gfx2d_trigger(priv);
+	}
+
+exit:
+	drm_dbg(&priv->drm, "cmd %u: append %zu rectangle(s)\n", cmd->id, cnt);
+
+	if (mchp_gfx2d_cmd_is_fully_scheduled(cmd))
+		mchp_gfx2d_epilogue(priv, cmd);
+}
+
+/**
+ * mchp_gfx2d_run_command - append GFX2D instructions into its ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the command gathering all the rectangles to process
+ * @num_rects: the exact number of rectangles to process
+ *
+ * This function appends LDRS instructions into the ring buffer to set the surfaces
+ * as needed in the GFX2D hardware, before appending the graphics instructions to
+ * follow by calling mchp_gfx2d_run_instructions().
+ *
+ * It is called from either mchp_gfx2d_run_pending_commands() or
+ * mchp_gfx2d_schedule(), with the 'priv->cmdlist_mutex' held in both cases.
+ */
+static void mchp_gfx2d_run_command(struct mchp_gfx2d_device *priv,
+				   struct mchp_gfx2d_command *cmd,
+				   size_t num_rects)
+{
+	/* Append all instructions for the command prologue, if needed. */
+	mchp_gfx2d_set_surface(priv, 0, cmd->target);
+
+	switch (cmd->operation) {
+	case DRM_MCHP_GFX2D_OP_FILL:
+		break;
+
+	case DRM_MCHP_GFX2D_OP_COPY:
+		mchp_gfx2d_set_surface(priv, 1, cmd->sources[0].gfx2d_obj);
+		break;
+
+	case DRM_MCHP_GFX2D_OP_BLEND:
+		mchp_gfx2d_set_surface(priv, 1, cmd->sources[0].gfx2d_obj);
+		mchp_gfx2d_set_surface(priv, 2, cmd->sources[1].gfx2d_obj);
+		if (cmd->blend.flags & GFX2D_BLEND_SET_DST_COLOR) {
+			enum mchp_gfx2d_reg_id reg = priv->caps->has_dreg ?
+				BLEND_DREG :
+				BLEND_SREG;
+			mchp_gfx2d_ldr(priv, reg, cmd->blend.dst_color);
+			mchp_gfx2d_trigger(priv);
+			cmd->blend.flags &= ~GFX2D_BLEND_SET_DST_COLOR;
+		}
+		if (cmd->blend.flags & GFX2D_BLEND_SET_SRC_COLOR) {
+			mchp_gfx2d_ldr(priv, BLEND_SREG, cmd->blend.src_color);
+			mchp_gfx2d_trigger(priv);
+			cmd->blend.flags &= ~GFX2D_BLEND_SET_SRC_COLOR;
+		}
+		break;
+
+	case DRM_MCHP_GFX2D_OP_ROP:
+		mchp_gfx2d_set_surface(priv, 1, cmd->sources[0].gfx2d_obj);
+		mchp_gfx2d_set_surface(priv, 2, cmd->sources[1].gfx2d_obj);
+		break;
+
+	default:
+		/* Should not happen... */
+		cmd->next_rect += num_rects;
+		return;
+	}
+
+	/* Then append graphics instructions and eventually the epilogue. */
+	mchp_gfx2d_run_instructions(priv, cmd, num_rects);
+}
+
+/**
+ * mchp_gfx2d_cmd_instructions_have_completed - tell whether all instructions
+ *     already appended into the ring buffer for this command have completed
+ * @priv: the GFX2D device
+ * @cmd: the command gathering graphics instructions with the same op code.
+ *
+ * RETURNS:
+ * true if all instructions already appended into the ring buffer for this
+ * command have completed, false otherwise.
+ */
+static bool
+mchp_gfx2d_cmd_instructions_have_completed(const struct mchp_gfx2d_device *priv,
+					   const struct mchp_gfx2d_command *cmd)
+{
+	uint32_t origin = priv->cpu_latest_completed_cmd;
+	uint32_t gpu_id = *priv->mbx; /* GPU latest completed cmd. */
+
+	drm_dbg(&priv->drm, "cmd %u: gpu_id = %u, origin = %u\n",
+		cmd->id, gpu_id, origin);
+
+	return (cmd->id - origin) <= (gpu_id - origin);
+}
+
+/**
+ * mchp_gfx2d_cmd_has_completed - tell whether all graphics instructions have completed
+ * @priv: the GFX2D device
+ * @cmd: the command gathering graphics instructions with the same op code.
+ *
+ * This function is called from mchp_gfx2d_process_completed_commands(), with
+ * the 'priv->cmdlist_mutex' held.
+ *
+ * RETURNS:
+ * true if all graphics instructions (or rectangles) have completed, false otherwise.
+ */
+static bool mchp_gfx2d_cmd_has_completed(const struct mchp_gfx2d_device *priv,
+					 const struct mchp_gfx2d_command *cmd)
+{
+	return mchp_gfx2d_cmd_is_fully_scheduled(cmd) &&
+		mchp_gfx2d_cmd_instructions_have_completed(priv, cmd);
+}
+
+/**
+ * mchp_gfx2d_process_completed_commands - release all completed commands
+ * @priv: the GFX2D device
+ *
+ * This function iterates on the running list, releasing completed commands and
+ * stops on the very first command that has not completed yet.
+ *
+ * It is called from mchp_gfx2d_progress(), with the 'priv->cmdlist_mutex'
+ * unlocked as it locks itself this mutex.
+ *
+ * RETURNS:
+ true if at least one command has completed then has been released.
+ */
+static bool mchp_gfx2d_process_completed_commands(struct mchp_gfx2d_device *priv)
+{
+	struct mchp_gfx2d_command *cmd, *tmp;
+	struct device *dev = priv->drm.dev;
+	bool did_something = false;
+
+	mutex_lock(&priv->cmdlist_mutex);
+
+	list_for_each_entry_safe(cmd, tmp, &priv->running_cmdlist, cmd_node) {
+		if (!mchp_gfx2d_cmd_has_completed(priv, cmd))
+			break;
+
+		drm_dbg(&priv->drm, "cmd %u: command has completed\n", cmd->id);
+		priv->cpu_latest_completed_cmd = cmd->id;
+
+		list_del(&cmd->cmd_node);
+		pm_runtime_put_noidle(dev);
+
+		mchp_gfx2d_release_command(priv, cmd, true);
+		did_something = true;
+	}
+
+	if (priv->is_suspended) {
+		if (list_empty(&priv->running_cmdlist)) {
+			complete(&priv->running_cmdlist_empty);
+			/*
+			 * Prevent mchp_gfx2d_thread() from calling
+			 * mchp_gfx2d_progress() again, unless
+			 * mchp_gfx2d_run_pending_commands() returns true just
+			 * after.
+			 */
+			did_something = false;
+		} else {
+			mchp_gfx2d_enable_exend(priv);
+		}
+	}
+
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	return did_something;
+}
+
+/**
+ * mchp_gfx2d_rooms_for_rects - tell how many rectangles can be appended into
+ * the ring buffer
+ * @priv: the GFX2D device
+ * @cmd: the command gathering graphics instructions with the same op code.
+ *
+ * This function MUST be called before calling mchp_gfx2d_run_command() the verify
+ * there is enough space in the ring buffer before appending more instructions.
+ *
+ * It is called from either mchp_gfx2d_run_pending_command() or
+ * mchp_gfx2d_schedule(), with the 'priv->cmdlist_mutex' held in both cases.
+ *
+ * RETURNS:
+ * the number of rectangles that can be appended by mchp_gfx2d_run_command().
+ */
+static size_t mchp_gfx2d_rooms_for_rects(const struct mchp_gfx2d_device *priv,
+					 const struct mchp_gfx2d_command *cmd)
+{
+	size_t remaining_rects = mchp_gfx2d_cmd_remaining_rects(cmd);
+	size_t prologue_words = 0;
+	size_t nb_words_per_rect;
+	size_t available;
+	u32 tail;
+
+	if (!remaining_rects)
+		return 0;
+
+	if (priv->surfaces[0] != cmd->target)
+		prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+
+	switch (cmd->operation) {
+	case DRM_MCHP_GFX2D_OP_FILL:
+		nb_words_per_rect = MCHP_GFX2D_NB_WORDS_FILL;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_COPY:
+		nb_words_per_rect = MCHP_GFX2D_NB_WORDS_COPY;
+		if (priv->surfaces[1] != cmd->sources[0].gfx2d_obj)
+			prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_BLEND:
+		nb_words_per_rect = MCHP_GFX2D_NB_WORDS_BLEND;
+		if (cmd->blend.flags & GFX2D_BLEND_SET_DST_COLOR)
+			prologue_words += MCHP_GFX2D_NB_WORDS_LDR;
+		if (cmd->blend.flags & GFX2D_BLEND_SET_SRC_COLOR)
+			prologue_words += MCHP_GFX2D_NB_WORDS_LDR;
+		if (priv->surfaces[1] != cmd->sources[0].gfx2d_obj)
+			prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+		if (priv->surfaces[2] != cmd->sources[1].gfx2d_obj)
+			prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_ROP:
+		nb_words_per_rect = MCHP_GFX2D_NB_WORDS_ROP;
+		if (priv->surfaces[1] != cmd->sources[0].gfx2d_obj)
+			prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+		if (priv->surfaces[2] != cmd->sources[1].gfx2d_obj)
+			prologue_words += MCHP_GFX2D_NB_WORDS_SET_SURFACE;
+		break;
+
+	default:
+		/* Should not happen... */
+		return 0;
+	}
+
+	tail = readl(priv->regs + GFX2D_TAIL);
+	available = CIRC_SPACE(priv->rb.head, tail, priv->rb.size);
+
+	/* The prologue should not be appended alone, without any rect. */
+	if (prologue_words + nb_words_per_rect > available)
+		return 0;
+
+	if ((prologue_words +
+	     remaining_rects * nb_words_per_rect +
+	     MCHP_GFX2D_NB_WORDS_EPILOGUE) <= available)
+		return remaining_rects;
+
+	/* The epilogue should not be appended alone, without any rect. */
+	return min(remaining_rects - 1,
+		   (available - prologue_words) / nb_words_per_rect);
+}
+
+/**
+ * mchp_gfx2d_run_pending_commands - execute as much commands as possible
+ * @priv: the GFX2D device
+ *
+ * This function resumes the partially running command, if any, then
+ * move commands from the pending into the running list.
+ *
+ * It MUST be called with the 'priv->cmdlist_mutex' unlocked as it locks itself
+ * this mutex.
+ *
+ * RETURNS:
+ * true if at least one command has progressed, meaning some graphics instructions
+ * have been appended into the GFX2D ring buffer.
+ */
+static bool mchp_gfx2d_run_pending_commands(struct mchp_gfx2d_device *priv)
+{
+	struct mchp_gfx2d_command *cmd, *tmp;
+	struct device *dev = priv->drm.dev;
+	bool did_something = false;
+	size_t num_rects;
+
+	mutex_lock(&priv->cmdlist_mutex);
+
+	/* Only the latest running command may be partial. */
+	if (!list_empty(&priv->running_cmdlist)) {
+		cmd = list_last_entry(&priv->running_cmdlist,
+				      typeof(*cmd), cmd_node);
+
+		num_rects = mchp_gfx2d_rooms_for_rects(priv, cmd);
+		if (num_rects) {
+			did_something = true;
+			mchp_gfx2d_run_command(priv, cmd, num_rects);
+			drm_dbg(&priv->drm, "cmd %u: make command progress\n",
+				cmd->id);
+		}
+
+		if (!mchp_gfx2d_cmd_is_fully_scheduled(cmd)) {
+			/*
+			 * If the latest running command is not yet
+			 * fully scheduled, then we can't move any other
+			 * command from the pending into the running
+			 * list.
+			 */
+			goto unlock;
+		}
+	}
+
+	/*
+	 * If being suspended, don't move any more command from the pending list
+	 * into the running list.
+	 */
+	if (priv->is_suspended)
+		goto unlock;
+
+	list_for_each_entry_safe(cmd, tmp, &priv->pending_cmdlist, cmd_node) {
+		struct list_head *node = &cmd->cmd_node;
+
+		num_rects = mchp_gfx2d_rooms_for_rects(priv, cmd);
+		if (!num_rects)
+			break;
+
+		drm_dbg(&priv->drm,
+			"cmd %u: move command from pending to running list\n",
+			cmd->id);
+
+		list_del(node);
+		list_add_tail(node, &priv->running_cmdlist);
+		pm_runtime_get_noresume(dev);
+
+		did_something = true;
+		mchp_gfx2d_run_command(priv, cmd, num_rects);
+
+		if (!mchp_gfx2d_cmd_is_fully_scheduled(cmd))
+			break;
+	}
+
+unlock:
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	return did_something;
+}
+
+/**
+ * mchp_gfx2d_blend_cfact - set some Color Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the SCFACT or DCFACT bitfield value to write into the WD5 word of the
+ *        BLEND command.
+ * @is_source: if true, @fact will be written into SCFACT, otherwise into DCFACT
+ *
+ * RETURNS:
+ * 0 if the color factor is valid, -EINVAL otherwise.
+ */
+static int mchp_gfx2d_blend_cfact(struct mchp_gfx2d_device *priv,
+				  enum drm_mchp_gfx2d_blend_factor factor,
+				  u8 *fact,
+				  bool is_source)
+{
+	switch (factor) {
+	case DRM_MCHP_GFX2D_BFACTOR_ZERO:
+		*fact = 0;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE:
+		*fact = 1;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_SRC_COLOR:
+		*fact = 2;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_SRC_COLOR:
+		*fact = 3;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_DST_COLOR:
+		*fact = 4;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_DST_COLOR:
+		*fact = 5;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_SRC_ALPHA:
+		*fact = 6;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_SRC_ALPHA:
+		*fact = 7;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_DST_ALPHA:
+		*fact = 8;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_DST_ALPHA:
+		*fact = 9;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_CONSTANT_COLOR:
+		*fact = 10;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_COLOR:
+		*fact = 11;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_CONSTANT_ALPHA:
+		*fact = 12;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_ALPHA:
+		*fact = 13;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_SRC_ALPHA_SATURATE:
+		*fact = 14;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * mchp_gfx2d_blend_scfact - set the Source Color Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the SCFACT bitfield value to write into the WD5 word of the BLEND
+ *        command.
+ *
+ * RETURNS:
+ * 0 if the source color factor is valid, -EINVAL otherwise.
+ */
+static inline int
+mchp_gfx2d_blend_scfact(struct mchp_gfx2d_device *priv,
+			enum drm_mchp_gfx2d_blend_factor factor, u8 *fact)
+{
+	return mchp_gfx2d_blend_cfact(priv, factor, fact, true);
+}
+
+/**
+ * mchp_gfx2d_blend_dcfact - set the Destination Color Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the DCFACT bitfield value to write into the WD5 word of the BLEND
+ *        command.
+ *
+ * RETURNS:
+ * 0 if the destination color factor is valid, -EINVAL otherwise.
+ */
+static inline int
+mchp_gfx2d_blend_dcfact(struct mchp_gfx2d_device *priv,
+			enum drm_mchp_gfx2d_blend_factor factor, u8 *fact)
+{
+	return mchp_gfx2d_blend_cfact(priv, factor, fact, false);
+}
+
+/**
+ * mchp_gfx2d_blend_afact - set some Alpha Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the SAFACT or DAFACT bitfield value to write into the WD5 word of the
+ *        BLEND command.
+ * @is_source: if true, @fact will be written into SAFACT, otherwise into DAFACT
+ *
+ * RETURNS:
+ * 0 if the alpha factor is valid, -EINVAL otherwise.
+ */
+static int mchp_gfx2d_blend_afact(struct mchp_gfx2d_device *priv,
+				  enum drm_mchp_gfx2d_blend_factor factor,
+				  u8 *fact,
+				  bool is_source)
+{
+	switch (factor) {
+	case DRM_MCHP_GFX2D_BFACTOR_ZERO:
+		*fact = 0;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE:
+		*fact = 1;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_SRC_ALPHA:
+		*fact = 2;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_SRC_ALPHA:
+		*fact = 3;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_DST_ALPHA:
+		*fact = 4;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_DST_ALPHA:
+		*fact = 5;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_CONSTANT_ALPHA:
+		*fact = 6;
+		break;
+
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_ALPHA:
+		*fact = 7;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * mchp_gfx2d_blend_safact - set the Source Alpha Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the SAFACT bitfield value to write into the WD5 word of the BLEND
+ *        command.
+ *
+ * RETURNS:
+ * 0 if the source alpha factor is valid, -EINVAL otherwise.
+ */
+static inline int
+mchp_gfx2d_blend_safact(struct mchp_gfx2d_device *priv,
+			enum drm_mchp_gfx2d_blend_factor factor, u8 *fact)
+{
+	return mchp_gfx2d_blend_afact(priv, factor, fact, true);
+}
+
+/**
+ * mchp_gfx2d_blend_dafact - set the Destination Alpha Factor of a command
+ * @priv: the GFX2D device
+ * @factor: the blend factor coming from the submit ioctl arguments
+ * @fact: the DAFACT bitfield value to write into the WD5 word of the BLEND
+ *        command.
+ *
+ * RETURNS:
+ * 0 if the destination alpha factor is valid, -EINVAL otherwise.
+ */
+static inline int
+mchp_gfx2d_blend_dafact(struct mchp_gfx2d_device *priv,
+			enum drm_mchp_gfx2d_blend_factor factor, u8 *fact)
+{
+	return mchp_gfx2d_blend_afact(priv, factor, fact, false);
+}
+
+/**
+ * mchp_gfx2d_set_blend_factors - initialize the blend factors of a command
+ * @priv: the GFX2D device
+ * @args: the submit ioctl arguments for the new submitted command
+ * @cmd: the command to initialize before scheduling
+ *
+ * This function initializes the blend factors of the @cmd command from the
+ * @args submit ioctl parameters.
+ *
+ * RETURNS:
+ * 0 if all blend factors are valid, -EINVAL otherwise.
+ */
+static int
+mchp_gfx2d_set_blend_factors(struct mchp_gfx2d_device *priv,
+			     const struct drm_mchp_gfx2d_submit *args,
+			     struct mchp_gfx2d_command *cmd)
+{
+	int ret;
+
+	ret = mchp_gfx2d_blend_scfact(priv, args->blend.scfactor,
+				      &cmd->blend.scfact);
+	if (ret)
+		return ret;
+
+	ret = mchp_gfx2d_blend_dcfact(priv, args->blend.dcfactor,
+				      &cmd->blend.dcfact);
+	if (ret)
+		return ret;
+
+	ret = mchp_gfx2d_blend_safact(priv, args->blend.safactor,
+				      &cmd->blend.safact);
+	if (ret)
+		return ret;
+
+	return mchp_gfx2d_blend_dafact(priv, args->blend.dafactor,
+				       &cmd->blend.dafact);
+}
+
+/**
+ * mchp_gfx2d_blend_factor_uses_constant - tell whether the @factor refers to a
+ * constant color.
+ * @factor: A blend factor
+ *
+ * RETURNS:
+ * true if the blend factor implies the use of a constant color.
+ */
+static bool
+mchp_gfx2d_blend_factor_uses_constant(enum drm_mchp_gfx2d_blend_factor factor)
+{
+	switch (factor) {
+	case DRM_MCHP_GFX2D_BFACTOR_CONSTANT_COLOR:
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_COLOR:
+	case DRM_MCHP_GFX2D_BFACTOR_CONSTANT_ALPHA:
+	case DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_ALPHA:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+/**
+ * mchp_gfx2d_set_blend_params - initialize the blend parameters of a command
+ * @priv: the GFX2D device
+ * @args: the submit ioctl arguments for the new submitted command
+ * @cmd: the command to initialize before scheduling
+ *
+ * This function initializes the blend parameters of the @cmd command from the
+ * @args submit ioctl parameters.
+ *
+ * RETURNS:
+ * 0 if all blend parameters are valid, -EINVAL otherwise.
+ */
+static int
+mchp_gfx2d_set_blend_params(struct mchp_gfx2d_device *priv,
+			    const struct drm_mchp_gfx2d_submit *args,
+			    struct mchp_gfx2d_command *cmd)
+{
+	bool src_c, dst_c, spre, dpre;
+	int ret;
+
+	if (args->blend.flags & ~(DRM_MCHP_GFX2D_BLEND_DPRE |
+				  DRM_MCHP_GFX2D_BLEND_SPRE))
+		return -EINVAL;
+
+	ret = mchp_gfx2d_set_blend_factors(priv, args, cmd);
+	if (ret)
+		return ret;
+
+	cmd->blend.func = (u8)args->blend.function;
+	if (cmd->blend.func > DRM_MCHP_GFX2D_BFUNC_SPE)
+		return -EINVAL;
+
+	spre = FIELD_GET(DRM_MCHP_GFX2D_BLEND_SPRE, args->blend.flags);
+	dpre = FIELD_GET(DRM_MCHP_GFX2D_BLEND_DPRE, args->blend.flags);
+
+	cmd->blend.src_color = args->blend.src_color;
+	src_c = spre ||
+		mchp_gfx2d_blend_factor_uses_constant(args->blend.scfactor) ||
+		mchp_gfx2d_blend_factor_uses_constant(args->blend.safactor);
+
+	cmd->blend.dst_color = args->blend.dst_color;
+	dst_c = dpre ||
+		mchp_gfx2d_blend_factor_uses_constant(args->blend.dcfactor) ||
+		mchp_gfx2d_blend_factor_uses_constant(args->blend.dafactor);
+
+	cmd->blend.flags = FIELD_PREP(GFX2D_BLEND_SET_SRC_COLOR, src_c) |
+		FIELD_PREP(GFX2D_BLEND_SET_DST_COLOR, dst_c) |
+		FIELD_PREP(GFX2D_BLEND_SPRE, spre) |
+		FIELD_PREP(GFX2D_BLEND_DPRE, dpre);
+
+	return 0;
+}
+
+/**
+ * mchp_gfx2d_set_rop_params - initialize the rop parameters of a command
+ * @priv: the GFX2D device
+ * @file_priv: the DRM file-private structure
+ * @args: the submit ioctl arguments for the new submitted command
+ * @cmd: the command to initialize before scheduling
+ *
+ * This function initializes the rop parameters of the @cmd command from the
+ * @args submit ioctl parameters.
+ *
+ * RETURNS:
+ * 0 if all rop parameters are valid, an error code otherwise.
+ */
+static int
+mchp_gfx2d_set_rop_params(struct mchp_gfx2d_device *priv,
+			  struct drm_file *file_priv,
+			  const struct drm_mchp_gfx2d_submit *args,
+			  struct mchp_gfx2d_command *cmd)
+{
+	uint32_t handle = args->rop.mask_handle;
+
+	cmd->rop.mode = (u8)args->rop.mode;
+	if (cmd->rop.mode > DRM_MCHP_GFX2D_ROP4)
+		return -EINVAL;
+
+	if (args->rop.mode == DRM_MCHP_GFX2D_ROP2 && args->rop.low > 15)
+		return -EINVAL;
+
+	if (((args->rop.mode == DRM_MCHP_GFX2D_ROP4) && !handle) ||
+	    ((args->rop.mode != DRM_MCHP_GFX2D_ROP4) && handle))
+		return -EINVAL;
+
+	if (handle) {
+		cmd->mask = mchp_gfx2d_gem_addref(file_priv, handle);
+		if (!cmd->mask)
+			return -ENOENT;
+
+		drm_dbg(&priv->drm,
+			"cmd %u: add ref to object %u (%d) as mask\n",
+			cmd->id,
+			cmd->mask->id, atomic_read(&cmd->mask->gpu_active));
+	}
+
+	cmd->rop.high = args->rop.high;
+	cmd->rop.low = args->rop.low;
+
+	return 0;
+}
+
+/**
+ * mchp_gfx2d_alloc_command - get a free command to be scheduled
+ * @priv: the GFX2D device
+ *
+ * This function first tries to get a free command from the 'priv->free_cmdlist'
+ * list, then allocated a new command from 'priv->cmd_cache'.
+ *
+ * It is called from @mchp_gfx2d_submit() and MAY be called with
+ * 'priv->cmdlist_mutex' held.
+ *
+ * RETURNS:
+ * Pointer to newly allocated command, NULL on failure.
+ */
+static struct mchp_gfx2d_command *
+mchp_gfx2d_alloc_command(struct mchp_gfx2d_device *priv)
+{
+	static uint32_t next_id;
+	struct mchp_gfx2d_command *cmd = NULL;
+
+	mutex_lock(&priv->free_cmdlist_mutex);
+	if (!list_empty(&priv->free_cmdlist)) {
+		cmd = list_first_entry(&priv->free_cmdlist,
+				       typeof(*cmd), cmd_node);
+		list_del(&cmd->cmd_node);
+	}
+	mutex_unlock(&priv->free_cmdlist_mutex);
+
+	if (!cmd)
+		cmd = kmem_cache_alloc(priv->cmd_cache, GFP_KERNEL);
+	if (!cmd)
+		return NULL;
+
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->id = next_id++;
+
+	return cmd;
+}
+
+/**
+ * mchp_gfx2d_has_pending_commands_locked - check whether some commands are
+ *     waiting for being executed
+ * @priv: the GFX2D device
+ *
+ * This function MUST be called with 'priv->cmdlist_mutex' held, otherwise
+ * call mchp_gfx2d_has_pending_commands() instead.
+ *
+ * RETURNS:
+ * true if there is at least one pending command, otherwise false.
+ */
+static bool
+mchp_gfx2d_has_pending_commands_locked(struct mchp_gfx2d_device *priv)
+{
+	if (!list_empty(&priv->running_cmdlist)) {
+		struct mchp_gfx2d_command *cmd;
+
+		cmd = list_last_entry(&priv->running_cmdlist,
+				      typeof(*cmd), cmd_node);
+		if (!mchp_gfx2d_cmd_is_fully_scheduled(cmd))
+			return true;
+	}
+
+	return !list_empty(&priv->pending_cmdlist);
+}
+
+/**
+ * mchp_gfx2d_schedule - insert @cmd into the relevant queue
+ * @priv: the GFX2D device
+ * @cmd: the new command to schedule
+ *
+ * This function inserts the @cmd command into the running list if possible,
+ * otherwise into the pending list.
+ *
+ * It is called from mchp_gfx2d_submit(), hence with 'priv->cmdlist_mutex'
+ * unlocked so it can lock this mutex itself.
+ *
+ * RETURNS:
+ * 0 if successful, otherwise an error code.
+ */
+static int mchp_gfx2d_schedule(struct mchp_gfx2d_device *priv,
+			       struct mchp_gfx2d_command *cmd)
+{
+	struct device *dev = priv->drm.dev;
+	size_t num_rects;
+	bool to_pending;
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	(void)mchp_gfx2d_progress(priv);
+
+	mutex_lock(&priv->cmdlist_mutex);
+
+	to_pending = mchp_gfx2d_has_pending_commands_locked(priv);
+	if (!to_pending) {
+		num_rects = mchp_gfx2d_rooms_for_rects(priv, cmd);
+		to_pending = !num_rects;
+	}
+
+	if (to_pending) {
+		ret = mchp_gfx2d_dup_rectangles(cmd);
+		if (!ret) {
+			/* Enqueue this command into the pending list. */
+			list_add_tail(&cmd->cmd_node, &priv->pending_cmdlist);
+			drm_dbg(&priv->drm,
+				"cmd %u: enqueue command into pending list\n",
+				cmd->id);
+
+			mchp_gfx2d_enable_exend(priv);
+		}
+		goto unlock;
+	}
+
+	/*
+	 * If here, there is no previous command in the queue waiting for
+	 * being executed and 'cmd' can be executed, at least partially.
+	 *
+	 * So, if not all instructions can fit into the ring buffer, then
+	 * duplicate the array of rectangles if needed; that is to say if the
+	 * current rectangle array is 'cmd->ctx->rectangles'.
+	 */
+	if (num_rects < mchp_gfx2d_cmd_remaining_rects(cmd)) {
+		ret = mchp_gfx2d_dup_rectangles(cmd);
+		if (ret)
+			goto unlock;
+	}
+
+	/* Fill the ring buffer with some, if not all, command instructions. */
+	mchp_gfx2d_run_command(priv, cmd, num_rects);
+
+	/* All scheduled; cmd->ctx->rectangles' is no longer needed for sure. */
+	if (mchp_gfx2d_cmd_is_fully_scheduled(cmd) && !cmd->can_free_rects)
+		cmd->rects = NULL;
+
+	/* Enqueue this command into the running list. */
+	list_add_tail(&cmd->cmd_node, &priv->running_cmdlist);
+	pm_runtime_get_noresume(dev);
+
+	drm_dbg(&priv->drm, "cmd %u: enqueue command into running list\n",
+		cmd->id);
+
+unlock:
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+/**
+ * init_gfx2d_init_command_queue - init the command queue and the ring buffer
+ * @priv: the GFX2D device
+ *
+ * This function is called from mchp_gfx2d_probe().
+ *
+ * RETURNS:
+ * 0 on success, -ENOMEM otherwise.
+ */
+int mchp_gfx2d_init_command_queue(struct mchp_gfx2d_device *priv)
+{
+	struct device *dev = priv->drm.dev;
+	int ret;
+
+	init_completion(&priv->running_cmdlist_empty);
+
+	mutex_init(&priv->wlist_mutex);
+	INIT_LIST_HEAD(&priv->wlist);
+
+	mutex_init(&priv->free_cmdlist_mutex);
+	INIT_LIST_HEAD(&priv->free_cmdlist);
+
+	mutex_init(&priv->cmdlist_mutex);
+	INIT_LIST_HEAD(&priv->pending_cmdlist);
+	INIT_LIST_HEAD(&priv->running_cmdlist);
+
+	priv->cmd_cache = kmem_cache_create("gfx2d_cmd_cache",
+					    sizeof(struct mchp_gfx2d_command),
+					    0, 0, NULL);
+	if (!priv->cmd_cache) {
+		dev_err(dev, "failed to create kmem cache for commands\n");
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	priv->rb.size_in_bytes = PAGE_SIZE;
+	priv->rb.size = priv->rb.size_in_bytes / sizeof(uint32_t);
+	priv->rb.data = dma_alloc_wc(dev, priv->rb.size_in_bytes,
+				     &priv->rb_dma_addr, GFP_KERNEL);
+	if (!priv->rb.data) {
+		dev_err(dev, "failed to allocate memory for the command ring buffer\n");
+		ret = -ENOMEM;
+		goto err_destroy_cache;
+	}
+	priv->rb.head = 0;
+
+	priv->mbx = dma_alloc_coherent(dev, sizeof(uint32_t),
+				       &priv->mbx_dma_addr, GFP_KERNEL);
+	if (!priv->mbx) {
+		ret = -ENOMEM;
+		goto err_free_rb;
+	}
+
+	writel(GFX2D_GD_DISABLE, priv->regs + GFX2D_GD);
+	writel(0, priv->regs + GFX2D_HEAD);
+	writel(0, priv->regs + GFX2D_TAIL);
+	writel((u32)priv->rb_dma_addr, priv->regs + GFX2D_BASE);
+	writel((priv->rb.size_in_bytes >> 8) - 1, priv->regs + GFX2D_LEN);
+	writel(GFX2D_GE_ENABLE, priv->regs + GFX2D_GE);
+
+	mchp_gfx2d_ldr(priv, MBX_ADDR_REG, (u32)priv->mbx_dma_addr);
+	mchp_gfx2d_trigger(priv);
+
+	priv->cpu_latest_completed_cmd = ~0;
+	*((uint32_t *)priv->mbx) = priv->cpu_latest_completed_cmd;
+
+	return 0;
+
+err_free_rb:
+	dma_free_wc(dev, priv->rb.size_in_bytes,
+		    (void *)priv->rb.data, priv->rb_dma_addr);
+err_destroy_cache:
+	kmem_cache_destroy(priv->cmd_cache);
+err_exit:
+	return ret;
+}
+
+/**
+ * mchp_gfx2d_cleanup_command_queue - stop the GFX2D and deinit the command queue
+ * @priv: the GFX2D device
+ *
+ * This function is called from mchp_gfx2d_remove() and from mchp_gfx2d_probe() if
+ * an error occurred.
+ */
+void mchp_gfx2d_cleanup_command_queue(struct mchp_gfx2d_device *priv)
+{
+	struct device *dev = priv->drm.dev;
+	struct mchp_gfx2d_command *cmd, *tmp;
+	uint32_t i;
+
+	writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_ID);
+	writel(GFX2D_GD_DISABLE, priv->regs + GFX2D_GD);
+
+	mutex_lock(&priv->cmdlist_mutex);
+	list_for_each_entry_safe(cmd, tmp, &priv->running_cmdlist, cmd_node) {
+		list_del(&cmd->cmd_node);
+		mchp_gfx2d_release_command(priv, cmd, false);
+		kmem_cache_free(priv->cmd_cache, cmd);
+	}
+
+	list_for_each_entry_safe(cmd, tmp, &priv->pending_cmdlist, cmd_node) {
+		list_del(&cmd->cmd_node);
+		mchp_gfx2d_release_command(priv, cmd, false);
+		kmem_cache_free(priv->cmd_cache, cmd);
+	}
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	mutex_lock(&priv->free_cmdlist_mutex);
+	list_for_each_entry_safe(cmd, tmp, &priv->free_cmdlist, cmd_node) {
+		list_del(&cmd->cmd_node);
+		mchp_gfx2d_release_command(priv, cmd, false);
+		kmem_cache_free(priv->cmd_cache, cmd);
+	}
+	mutex_unlock(&priv->free_cmdlist_mutex);
+
+	for (i = 0; i < ARRAY_SIZE(priv->surfaces); i++)
+		mchp_gfx2d_gem_put(priv->surfaces[i]);
+
+	dma_free_coherent(dev, sizeof(uint32_t),
+			  (void *)priv->mbx, priv->mbx_dma_addr);
+	dma_free_wc(dev, priv->rb.size_in_bytes,
+		    (void *)priv->rb.data, priv->rb_dma_addr);
+	kmem_cache_destroy(priv->cmd_cache);
+}
+
+/**
+ * mchp_gfx2d_submit - enqueue a new command gathering graphics instructions
+ * @priv: the GFX2D device
+ * @file_priv: the DRM file-private structure
+ * @args: the submit ioctl arguments
+ *
+ * All graphics instructions of this new command share the same op code (FILL,
+ * COPY, BLEND or ROP) and the same surfaces.
+ *
+ * This function is called from mchp_gfx2d_ioctl_submit().
+ *
+ * RETURNS:
+ * 0 on success, an error code otherwise.
+ */
+int mchp_gfx2d_submit(struct mchp_gfx2d_device *priv,
+		      struct drm_file *file_priv,
+		      const struct drm_mchp_gfx2d_submit *args)
+{
+	struct mchp_gfx2d_file *ctx = file_priv->driver_priv;
+	struct mchp_gfx2d_command *cmd;
+	size_t i, num_sources;
+	int ret;
+
+	if (!args->num_rectangles)
+		return -EINVAL;
+
+	cmd = mchp_gfx2d_alloc_command(priv);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->ctx = ctx;
+	cmd->operation = (u8)args->operation;
+	drm_dbg(&priv->drm, "cmd %u: allocate command (operation = %u)\n",
+		cmd->id, cmd->operation);
+
+	ret = mchp_gfx2d_alloc_rectangles(cmd, args->num_rectangles);
+	if (ret)
+		goto err_release_command;
+
+	ret = copy_from_user(cmd->rects, u64_to_user_ptr(args->rectangles),
+			     args->num_rectangles * sizeof(*cmd->rects));
+	if (ret) {
+		ret = -EFAULT;
+		goto err_release_command;
+	}
+	drm_dbg(&priv->drm, "cmd %u: copy %zu rectangle(s)\n",
+		cmd->id, cmd->num_rects);
+
+	cmd->target = mchp_gfx2d_gem_addref(file_priv, args->target_handle);
+	if (!cmd->target) {
+		ret = -ENOENT;
+		goto err_release_command;
+	}
+	drm_dbg(&priv->drm,
+		"cmd %u: add ref to object %u (%d) as target\n",
+		cmd->id,
+		cmd->target->id, atomic_read(&cmd->target->gpu_active));
+
+	switch (cmd->operation) {
+	case DRM_MCHP_GFX2D_OP_FILL:
+		num_sources = 0;
+		cmd->fill.color = args->fill.color;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_COPY:
+		num_sources = 1;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_BLEND:
+		num_sources = 2;
+		ret = mchp_gfx2d_set_blend_params(priv, args, cmd);
+		if (ret)
+			goto err_release_command;
+		break;
+
+	case DRM_MCHP_GFX2D_OP_ROP:
+		num_sources = 2;
+		ret = mchp_gfx2d_set_rop_params(priv, file_priv, args, cmd);
+		if (ret)
+			goto err_release_command;
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto err_release_command;
+	}
+
+	for (i = 0; i < num_sources; i++) {
+		const struct drm_mchp_gfx2d_source *from = &args->sources[i];
+		struct mchp_gfx2d_source *to = &cmd->sources[i];
+
+		to->gfx2d_obj = mchp_gfx2d_gem_addref(file_priv, from->handle);
+		if (!to->gfx2d_obj) {
+			ret = -ENOENT;
+			goto err_release_command;
+		}
+
+		to->x = from->x;
+		to->y = from->y;
+
+		drm_dbg(&priv->drm,
+			"cmd %u: add ref to object %u (%d) as source %zu at (%d,%d)\n",
+			cmd->id,
+			to->gfx2d_obj->id, atomic_read(&cmd->target->gpu_active),
+			i, to->x, to->y);
+	}
+
+	ret = mchp_gfx2d_schedule(priv, cmd);
+	if (ret)
+		goto err_release_command;
+
+	return 0;
+
+err_release_command:
+	mchp_gfx2d_release_command(priv, cmd, true);
+	return ret;
+}
+
+/**
+ * mchp_gfx2d_wait - wait for a GFX2D object to be inactive
+ * @priv: the GFX2D device
+ * @gfx2d_obj: the GFX2D object to wait for
+ * @timeout: the timeout
+ *
+ * This function waits for a given GFX2D object to be inactive, that is to say
+ * this GFX2D object is not involved in any graphics instructions currently
+ * running in the ring buffer or queued in the pending list.
+ *
+ * It is called from:
+ * - mchp_gfx2d_ioctl_wait()
+ * - mchp_gfx2d_iocl_sync_for_cpu()
+ *
+ * RETURNS:
+ * 0 on success, on error code otherwise.
+ */
+int mchp_gfx2d_wait(struct mchp_gfx2d_device *priv,
+		    struct mchp_gfx2d_gem_object *gfx2d_obj,
+		    const struct drm_mchp_timespec *timeout)
+{
+	struct device *dev = priv->drm.dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	(void)mchp_gfx2d_progress(priv);
+
+	drm_dbg(&priv->drm, "obj %u: poll object\n", gfx2d_obj->id);
+
+	ret = mchp_gfx2d_gem_wait(gfx2d_obj, NULL);
+	if (!ret || !timeout)
+		goto put_autosuspend;
+
+	drm_dbg(&priv->drm, "obj %u: wait for object\n", gfx2d_obj->id);
+
+	mutex_lock(&priv->wlist_mutex);
+	list_add_tail(&gfx2d_obj->w_node, &priv->wlist);
+	mutex_unlock(&priv->wlist_mutex);
+
+	mchp_gfx2d_enable_exend(priv);
+
+	ret = mchp_gfx2d_gem_wait(gfx2d_obj, timeout);
+
+	mutex_lock(&priv->wlist_mutex);
+	list_del(&gfx2d_obj->w_node);
+	mutex_unlock(&priv->wlist_mutex);
+
+	drm_dbg(&priv->drm, "obj %u: %s for object\n",
+		gfx2d_obj->id,
+		ret ? "failed to wait" : "successfully waited");
+
+put_autosuspend:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+/**
+ * mchp_gfx2d_cancel_commands - cancel all commands for a give context
+ * @priv: the GFX2D device
+ * @ctx: the GFX2D context
+ *
+ * This function is called from mchp_gfx2d_postclose().
+ */
+void mchp_gfx2d_cancel_commands(struct mchp_gfx2d_device *priv,
+				struct mchp_gfx2d_file *ctx)
+{
+	struct mchp_gfx2d_command *cmd, *tmp;
+
+	mutex_lock(&priv->cmdlist_mutex);
+
+	list_for_each_entry(cmd, &priv->running_cmdlist, cmd_node) {
+		if (cmd->ctx == ctx)
+			cmd->ctx = NULL;
+	}
+
+	list_for_each_entry_safe(cmd, tmp, &priv->pending_cmdlist, cmd_node) {
+		if (cmd->ctx == ctx) {
+			list_del(&cmd->cmd_node);
+			mchp_gfx2d_release_command(priv, cmd, true);
+		}
+	}
+
+	mutex_unlock(&priv->cmdlist_mutex);
+}
+
+/**
+ * mchp_gfx2d_has_pending_commands - check whether some commands are waiting for
+ *     being executed
+ * @priv: the GFX2D device
+ *
+ * This function MUST be called with the 'priv->cmdlist_mutex' unlocked as it
+ * locks this mutex itself. Otherwise, call mchp_gfx2d_has_pending_command_locked()
+ * instead.
+ *
+ * RETURNS:
+ * true if there is at least one pending command, otherwise false.
+ */
+bool mchp_gfx2d_has_pending_commands(struct mchp_gfx2d_device *priv)
+{
+	bool ret;
+
+	mutex_lock(&priv->cmdlist_mutex);
+	ret = mchp_gfx2d_has_pending_commands_locked(priv);
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	return ret;
+}
+
+/**
+ * mchp_gfx2d_progress - make the command queue progress
+ * @priv: the GFX2D device
+ *
+ * This function first processes completed commands then append
+ * as much graphics instructions as possible in the ring buffer.
+ *
+ * It is called from:
+ * - mchp_gfx2d_schedule()
+ * - mchp_gfx2d_wait()
+ * - mchp_gfx2d_thread()
+ *
+ * RETURNS:
+ * true if at least one command has progressed in the queue.
+ */
+bool mchp_gfx2d_progress(struct mchp_gfx2d_device *priv)
+{
+	bool did_something;
+
+	/* Clear pending interrupts */
+	(void)readl(priv->regs + GFX2D_IS);
+
+	did_something = mchp_gfx2d_process_completed_commands(priv);
+	return mchp_gfx2d_run_pending_commands(priv) || did_something;
+}
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h b/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e64dfcd8ce7cd277cdb16b2ea99c0ac5f98163b
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+struct drm_file;
+
+struct drm_mchp_timespec;
+struct drm_mchp_gfx2d_rectangle;
+struct drm_mchp_gfx2d_submit;
+
+struct mchp_gfx2d_device;
+struct mchp_gfx2d_file;
+struct mchp_gfx2d_gem_object;
+
+#define GFX2D_WD0_OPCODE(op)    FIELD_PREP(GENMASK(31, 28), (op))
+#define GFX2D_WD0_IE            BIT(24)
+#define GFX2D_WD0_DREG(reg)     FIELD_PREP(GENMASK(23, 20), (reg))
+#define GFX2D_WD0_REG(reg)      FIELD_PREP(GENMASK(19, 16), (reg))
+#define GFX2D_WD0_REGAD(reg)    FIELD_PREP(GENMASK(15, 12), (reg))
+#define GFX2D_WD0_ARGS(nargs)   FIELD_PREP(GENMASK(2, 0), (nargs))
+
+#define GFX2D_WD1_HEIGHT(h)     FIELD_PREP(GENMASK(28, 16), (h) - 1)
+#define GFX2D_WD1_WIDTH(w)      FIELD_PREP(GENMASK(12, 0), (w) - 1)
+#define GFX2D_WD1_SIZE(rect)    (GFX2D_WD1_HEIGHT((rect)->height) | \
+				 GFX2D_WD1_WIDTH((rect)->width))
+
+#define GFX2D_Y(y)              FIELD_PREP(GENMASK(28, 16), (y))
+#define GFX2D_X(x)              FIELD_PREP(GENMASK(12, 0), (x))
+#define GFX2D_DPOS(rect)        (GFX2D_Y((rect)->dst_y) | GFX2D_X((rect)->dst_x))
+#define GFX2D_SPOS(rect, index) (GFX2D_Y((rect)->src_y[(index)]) | \
+				 GFX2D_X((rect)->src_x[(index)]))
+
+#define GFX2D_WD2_DPOS(rect)    GFX2D_DPOS(rect)
+#define GFX2D_WD3_SPOS(rect)    GFX2D_SPOS(rect, 0)
+#define GFX2D_WD3_S0POS(rect)   GFX2D_SPOS(rect, 0)
+#define GFX2D_WD4_S1POS(rect)   GFX2D_SPOS(rect, 1)
+
+#define GFX2D_WD5_DPRE(b)       FIELD_PREP(BIT(23), (b))
+#define GFX2D_WD5_DAFACT(f)     FIELD_PREP(GENMASK(22, 20), (f))
+#define GFX2D_WD5_SPRE(b)       FIELD_PREP(BIT(19), (b))
+#define GFX2D_WD5_SAFACT(f)     FIELD_PREP(GENMASK(18, 16), (f))
+#define GFX2D_WD5_FUNC(func)    FIELD_PREP(GENMASK(15, 8), (func))
+#define GFX2D_WD5_DCFACT(f)     FIELD_PREP(GENMASK(7, 4), (f))
+#define GFX2D_WD5_SCFACT(f)     FIELD_PREP(GENMASK(3, 0), (f))
+
+#define GFX2D_WD6_ROPM(mode)    FIELD_PREP(GENMASK(17, 16), (mode))
+#define GFX2D_WD6_ROPH(h)       FIELD_PREP(GENMASK(15, 8), (h))
+#define GFX2D_WD6_ROPL(l)       FIELD_PREP(GENMASK(7, 0), (l))
+
+enum mchp_gfx2d_opcode {
+	GFX2D_OPCODE_LDR = 8,
+	GFX2D_OPCODE_STR = 9,
+	GFX2D_OPCODE_FILL = 11,
+	GFX2D_OPCODE_COPY = 12,
+	GFX2D_OPCODE_BLEND = 13,
+	GFX2D_OPCODE_ROP = 14,
+};
+
+enum mchp_gfx2d_reg_id {
+	REG_PA0,
+	REG_PITCH0,
+	REG_CFG0,
+	REG_PA1,
+	REG_PITCH1,
+	REG_CFG1,
+	REG_PA2,
+	REG_PITCH2,
+	REG_CFG2,
+	REG_PA3,
+	REG_GPREG0,
+	REG_GPREG1,
+	REG_GPREG2,
+	REG_GPREG3,
+	REG_GPREG4,
+	REG_GPREG5,
+};
+
+#define REG_PA(i)       ((enum mchp_gfx2d_reg_id)(REG_PA0 + 3 * (i)))
+#define REG_PITCH(i)    ((enum mchp_gfx2d_reg_id)(REG_PITCH0 + 3 * (i)))
+#define REG_CFG(i)      ((enum mchp_gfx2d_reg_id)(REG_CFG0 + 3 * (i)))
+
+struct mchp_gfx2d_rectangle {
+	u16 dst_x;
+	u16 dst_y;
+	u16 src_x[2];
+	u16 src_y[2];
+	u16 width;
+	u16 height;
+};
+
+struct mchp_gfx2d_source {
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	int x;
+	int y;
+};
+
+struct mchp_gfx2d_fill {
+	u32 color;
+};
+
+#define GFX2D_BLEND_DPRE                BIT(0)
+#define GFX2D_BLEND_SPRE                BIT(1)
+#define GFX2D_BLEND_SET_DST_COLOR       BIT(2)
+#define GFX2D_BLEND_SET_SRC_COLOR       BIT(3)
+
+struct mchp_gfx2d_blend {
+	u32 flags;
+	u32 dst_color;
+	u32 src_color;
+	u8 func;
+	u8 safact;
+	u8 dafact;
+	u8 scfact;
+	u8 dcfact;
+};
+
+struct mchp_gfx2d_rop {
+	u8 mode;
+	u8 high;
+	u8 low;
+};
+
+struct mchp_gfx2d_command {
+	struct list_head cmd_node;
+
+	struct mchp_gfx2d_file *ctx;
+
+	struct mchp_gfx2d_gem_object *target;
+	struct mchp_gfx2d_source sources[2];
+	struct mchp_gfx2d_gem_object *mask;
+
+	struct drm_mchp_gfx2d_rectangle *rects;
+	size_t num_rects;
+	size_t next_rect;
+
+	uint32_t id;
+
+	bool can_free_rects;
+	u8 operation;
+	union {
+		struct mchp_gfx2d_fill fill;
+		struct mchp_gfx2d_blend blend;
+		struct mchp_gfx2d_rop rop;
+	};
+};
+
+int mchp_gfx2d_init_command_queue(struct mchp_gfx2d_device *priv);
+void mchp_gfx2d_cleanup_command_queue(struct mchp_gfx2d_device *priv);
+
+int mchp_gfx2d_submit(struct mchp_gfx2d_device *priv,
+		      struct drm_file *file_priv,
+		      const struct drm_mchp_gfx2d_submit *args);
+
+int mchp_gfx2d_wait(struct mchp_gfx2d_device *priv,
+		    struct mchp_gfx2d_gem_object *gfx2d_obj,
+		    const struct drm_mchp_timespec *timeout);
+
+void mchp_gfx2d_cancel_commands(struct mchp_gfx2d_device *priv,
+				struct mchp_gfx2d_file *ctx);
+
+bool mchp_gfx2d_has_pending_commands(struct mchp_gfx2d_device *priv);
+
+bool mchp_gfx2d_progress(struct mchp_gfx2d_device *priv);
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_drv.c b/drivers/gpu/drm/microchip/mchp_gfx2d_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..aa4fced307f213337cf34b619712abb58bf6701d
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_drv.c
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_module.h>
+
+#include "mchp_gfx2d_cmd.h"
+#include "mchp_gfx2d_drv.h"
+#include "mchp_gfx2d_gem.h"
+#include "mchp_gfx2d_ioctl.h"
+
+#define GFX2D_PM_RUNTIME_DELAY          5000
+#define GFX2D_PM_RUNTIME_SUSPEND_DELAY  500
+
+static int mchp_gfx2d_open(struct drm_device *dev, struct drm_file *file_priv)
+{
+	struct mchp_gfx2d_file *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	file_priv->driver_priv = ctx;
+
+	return 0;
+}
+
+static void mchp_gfx2d_postclose(struct drm_device *dev, struct drm_file *file_priv)
+{
+	struct mchp_gfx2d_file *ctx = file_priv->driver_priv;
+	struct mchp_gfx2d_device *priv = drm_to_dev(dev);
+
+	mchp_gfx2d_cancel_commands(priv, ctx);
+
+	kfree(ctx);
+}
+
+DEFINE_DRM_GEM_FOPS(mchp_gfx2d_drm_fops);
+
+static const struct drm_driver mchp_gfx2d_drm_driver = {
+	.major = 1,
+	.minor = 0,
+	.name = "microchip-gfx2d",
+	.desc = "Microchip GFX2D DRM",
+	.date = "20240716",
+	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+	.open = mchp_gfx2d_open,
+	.postclose = mchp_gfx2d_postclose,
+	.gem_prime_import_sg_table = mchp_gfx2d_gem_prime_import_sg_table,
+	.ioctls = mchp_gfx2d_ioctls,
+	.num_ioctls = ARRAY_SIZE(mchp_gfx2d_ioctls),
+	.fops = &mchp_gfx2d_drm_fops,
+};
+
+static irqreturn_t mchp_gfx2d_interrupt(int irq, void *dev_id)
+{
+	struct mchp_gfx2d_device *priv = dev_id;
+	u32 status, mask, pending;
+
+	status = readl(priv->regs + GFX2D_IS);
+	mask = readl(priv->regs + GFX2D_IM);
+	pending = status & mask;
+
+	if (!pending)
+		return IRQ_NONE;
+
+	if (pending & GFX2D_IRQ_EXEND)
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mchp_gfx2d_thread(int irq, void *dev_id)
+{
+	struct mchp_gfx2d_device *priv = dev_id;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	struct device *dev = priv->drm.dev;
+	bool is_suspended = false;
+	bool enable_exend = false;
+	int ret;
+
+	drm_dbg(&priv->drm, "enter IRQ thread\n");
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto exit;
+
+	writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_ID);
+
+	do {} while (mchp_gfx2d_progress(priv));
+
+	mutex_lock(&priv->cmdlist_mutex);
+	is_suspended = priv->is_suspended;
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	/*
+	 * When suspended, the EXEND interrupt is already enabled from
+	 * mchp_gfx2d_process_completed_commands() if needed.
+	 */
+	if (is_suspended)
+		goto put_autosuspend;
+
+	mutex_lock(&priv->wlist_mutex);
+	list_for_each_entry(gfx2d_obj, &priv->wlist, w_node) {
+		if (is_active(gfx2d_obj)) {
+			enable_exend = true;
+			break;
+		}
+	}
+	mutex_unlock(&priv->wlist_mutex);
+
+	if (enable_exend) {
+		drm_dbg(&priv->drm,
+			"enable EXEND interrupt: still waiting for object %u (%d)\n",
+			gfx2d_obj->id, atomic_read(&gfx2d_obj->gpu_active));
+	} else {
+		enable_exend = mchp_gfx2d_has_pending_commands(priv);
+		if (enable_exend)
+			drm_dbg(&priv->drm,
+				"enable EXEND interrupt: some commands are pending\n");
+	}
+
+	if (enable_exend)
+		writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_IE);
+
+put_autosuspend:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+exit:
+	drm_dbg(&priv->drm, "leave IRQ thread\n");
+
+	return IRQ_HANDLED;
+}
+
+static int mchp_gfx2d_probe(struct platform_device *pdev)
+{
+	struct mchp_gfx2d_device *priv;
+	struct resource *res;
+	int irq;
+	int ret;
+
+	priv = devm_drm_dev_alloc(&pdev->dev, &mchp_gfx2d_drm_driver,
+				  struct mchp_gfx2d_device, drm);
+	if (IS_ERR(priv)) {
+		dev_err(&pdev->dev, "failed to allocate the DRM device\n");
+		ret = PTR_ERR(priv);
+		goto err_exit;
+	}
+	platform_set_drvdata(pdev, priv);
+
+	priv->caps = of_device_get_match_data(&pdev->dev);
+	if (!priv->caps) {
+		dev_err(&pdev->dev, "could not retrieve GFX2D caps\n");
+		ret = -EINVAL;
+		goto err_exit;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(&pdev->dev, "missing registers\n");
+		ret = PTR_ERR(priv->regs);
+		goto err_exit;
+	}
+
+	/* Request the IRQ */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "failed to get the IRQ\n");
+		ret = irq;
+		goto err_exit;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					mchp_gfx2d_interrupt,
+					mchp_gfx2d_thread,
+					0, dev_name(&pdev->dev), priv);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request the IRQ\n");
+		goto err_exit;
+	}
+
+	priv->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->pclk)) {
+		dev_err(&pdev->dev, "missing peripheral clock\n");
+		ret = PTR_ERR(priv->pclk);
+		goto err_exit;
+	}
+
+	/* Enable the peripheral clock */
+	ret = clk_prepare_enable(priv->pclk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable the peripheral clock\n");
+		goto err_exit;
+	}
+
+	ret = mchp_gfx2d_init_command_queue(priv);
+	if (ret)
+		goto err_disable_unprepare_clock;
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, GFX2D_PM_RUNTIME_DELAY);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	ret = drm_dev_register(&priv->drm, 0);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_dont_use_autosuspend(&pdev->dev);
+		dev_err(&pdev->dev, "failed to register the DRM device\n");
+		goto err_cleanup_cmd_queue;
+	}
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+
+err_cleanup_cmd_queue:
+	mchp_gfx2d_cleanup_command_queue(priv);
+err_disable_unprepare_clock:
+	clk_disable_unprepare(priv->pclk);
+err_exit:
+	return ret;
+}
+
+static void mchp_gfx2d_remove(struct platform_device *pdev)
+{
+	struct mchp_gfx2d_device *priv = platform_get_drvdata(pdev);
+	int ret;
+
+	drm_dev_unregister(&priv->drm);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	mchp_gfx2d_cleanup_command_queue(priv);
+	if (ret) {
+		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
+	} else {
+		pm_runtime_put_noidle(&pdev->dev);
+		clk_disable(priv->pclk);
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
+	clk_unprepare(priv->pclk);
+}
+
+static int __maybe_unused mchp_gfx2d_runtime_suspend(struct device *dev)
+{
+	struct mchp_gfx2d_device *priv = dev_get_drvdata(dev);
+	unsigned long to;
+
+	mutex_lock(&priv->cmdlist_mutex);
+	priv->is_suspended = true;
+	reinit_completion(&priv->running_cmdlist_empty);
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	(void)mchp_gfx2d_progress(priv);
+	to = msecs_to_jiffies(GFX2D_PM_RUNTIME_SUSPEND_DELAY);
+	if (!wait_for_completion_timeout(&priv->running_cmdlist_empty, to)) {
+		mutex_lock(&priv->cmdlist_mutex);
+		priv->is_suspended = false;
+		pm_runtime_mark_last_busy(dev);
+		mutex_unlock(&priv->cmdlist_mutex);
+		writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_IE);
+		return -EBUSY;
+	}
+
+	clk_disable(priv->pclk);
+
+	return 0;
+}
+
+static int __maybe_unused mchp_gfx2d_runtime_resume(struct device *dev)
+{
+	struct mchp_gfx2d_device *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(priv->pclk);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->cmdlist_mutex);
+	priv->is_suspended = false;
+	pm_runtime_mark_last_busy(dev);
+	mutex_unlock(&priv->cmdlist_mutex);
+
+	(void)mchp_gfx2d_progress(priv);
+
+	return 0;
+}
+
+static const struct dev_pm_ops __maybe_unused mchp_gfx2d_pm_ops = {
+	SET_RUNTIME_PM_OPS(mchp_gfx2d_runtime_suspend, mchp_gfx2d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct mchp_gfx2d_caps mchp_sam9x60_gfx2d_caps = {
+	.has_dreg = false,
+};
+
+static const struct mchp_gfx2d_caps mchp_sam9x75_gfx2d_caps = {
+	.has_dreg = true,
+};
+
+static const struct of_device_id mchp_gfx2d_of_match[] = {
+	{
+		.compatible = "microchip,sam9x60-gfx2d",
+		.data = &mchp_sam9x60_gfx2d_caps,
+	},
+	{
+		.compatible = "microchip,sam9x7-gfx2d",
+		.data = &mchp_sam9x75_gfx2d_caps,
+	},
+	{ /* sentinel */ },
+};
+
+static struct platform_driver mchp_gfx2d_platform_driver = {
+	.driver = {
+		.name = "mchp-gfx2d",
+		.of_match_table = mchp_gfx2d_of_match,
+		.pm = pm_ptr(&mchp_gfx2d_pm_ops),
+	},
+	.probe = mchp_gfx2d_probe,
+	.remove_new = mchp_gfx2d_remove,
+};
+drm_module_platform_driver(mchp_gfx2d_platform_driver);
+
+MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@microchip.com>");
+MODULE_DESCRIPTION("Microchip GFX2D Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_drv.h b/drivers/gpu/drm/microchip/mchp_gfx2d_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..21e83198d6008a9f331a900947f62683ca70bd2d
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_drv.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#ifndef MCHP_GFX2D_H
+#define MCHP_GFX2D_H
+
+#include <drm/drm_device.h>
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include <uapi/drm/microchip_drm.h>
+
+struct mchp_gfx2d_gem_object;
+
+#define MCHP_GFX2D_MAX_RECTANGLES       32
+#define MCHP_GFX2D_MAX_SURFACES         3
+
+struct mchp_gfx2d_caps {
+	bool has_dreg;
+};
+
+struct mchp_gfx2d_ring_buffer {
+	uint32_t *data;
+	u32 head;
+	size_t size;
+	size_t size_in_bytes;
+};
+
+struct mchp_gfx2d_device {
+	struct drm_device drm;
+	void __iomem *regs;
+	struct clk *pclk;
+
+	/* Waiters management. */
+	struct mutex wlist_mutex;
+	struct list_head wlist;
+
+	/* Command ring buffer management. */
+	dma_addr_t rb_dma_addr;
+	struct mchp_gfx2d_ring_buffer rb;
+	dma_addr_t mbx_dma_addr;
+	const uint32_t *mbx;
+	uint32_t cpu_latest_completed_cmd;
+
+	/* Command queue management. */
+	struct mutex free_cmdlist_mutex;
+	struct list_head free_cmdlist;
+	struct mutex cmdlist_mutex;
+	struct list_head pending_cmdlist;
+	struct list_head running_cmdlist;
+	struct kmem_cache *cmd_cache;
+	struct completion running_cmdlist_empty;
+	bool is_suspended;
+
+	/*
+	 * Latest surfaces queued to be loaded into the GFX2D registers.
+	 * LDR commands may still be queued, hence not executed yet,
+	 * so the GFX2D_PAx, GFX2D_PITCHx and GFX2D_GFGx registers may
+	 * still have different values.
+	 * This is used to know whether some LDR commands should be queued
+	 * to change a surface inside the GFX2D before executed other
+	 * operations.
+	 */
+	struct mchp_gfx2d_gem_object *surfaces[MCHP_GFX2D_MAX_SURFACES];
+
+	const struct mchp_gfx2d_caps *caps;
+};
+
+#define drm_to_dev(dev) container_of(dev, struct mchp_gfx2d_device, drm)
+
+struct mchp_gfx2d_file {
+	struct drm_mchp_gfx2d_rectangle rectangles[MCHP_GFX2D_MAX_RECTANGLES];
+};
+
+/* GFX2D register offsets */
+#define GFX2D_GC                0x00    /* Global Configuration Register */
+#define GFX2D_GE                0x04    /* Global Enable Register */
+#define GFX2D_GD                0x08    /* Global Disable Register */
+#define GFX2D_GS                0x0C    /* Global Status Register */
+#define GFX2D_IE                0x10    /* Interrupt Enable Register */
+#define GFX2D_ID                0x14    /* Interrupt Disable Register */
+#define GFX2D_IM                0x18    /* Interrupt Mask Register */
+#define GFX2D_IS                0x1c    /* Interrupt Status Register */
+#define GFX2D_PC0               0x20    /* Performance Configuration 0 Register */
+#define GFX2D_MC0               0x24    /* Metrics Counter 0 Register */
+#define GFX2D_PC1               0x28    /* Performance Configuration 1 Register */
+#define GFX2D_MC1               0x2c    /* Metrics Counter 1 Register */
+#define GFX2D_BASE              0x30    /* Ring Buffer Base Physical Address Register */
+#define GFX2D_LEN               0x34    /* Ring Buffer Length Register */
+#define GFX2D_HEAD              0x38    /* Ring Buffer Head Register */
+#define GFX2D_TAIL              0x3c    /* Ring Buffer Tail Register */
+
+/* Surface x Physical Address Register [x=0..3] */
+#define GFX2D_PA(x)             (0x40 + 0x10 * (x))
+
+/* Surface x Pitch Register [x=0..3] */
+#define GFX2D_PITCH(x)          (0x44 + 0x10 * (x))
+#define GFX2D_PITCH_DAT(stride) FIELD_PREP(GENMASK(15, 0), (stride))
+
+/* Surface x Configuration Register [x=0..3] */
+#define GFX2D_CFG(x)            (0x48 + 0x10 * (x))
+#define GFX2D_CFG_IDXCX         BIT(4)
+#define GFX2D_CFG_PF(format)    FIELD_PREP(GENMASK(3, 0), (format))
+
+/* Bitfields in GFX2D_GE (Global Enable Register) */
+#define GFX2D_GE_ENABLE         BIT(0)  /* GFX2D Enable */
+
+/* Bitfields in GFX2D_GD (Global Disable Register) */
+#define GFX2D_GD_DISABLE        BIT(0)  /* GFX2D Disable Bit */
+#define GFX2D_GD_WFERES         BIT(8)  /* WFE Software Resume Bit */
+
+/* Bitfields in GFX2D_GS (Global Status Register) */
+#define GFX2D_GS_STATUS         BIT(0)  /* GFX2D Status Bit */
+#define GFX2D_GS_BUSY           BIT(4)  /* GFX2D Busy Bit */
+#define GFX2D_GS_WFEIP          BIT(8)  /* Wait For Event Status bit */
+
+/* Bitfields in GFX2D_I{S,E,D,M} (Interrupt Status/Enable/Disable/Mask Register */
+#define GFX2D_IRQ_RBEMPTY       BIT(0)  /* Ring Buffer Empty */
+#define GFX2D_IRQ_EXEND         BIT(1)  /* End of Execution */
+#define GFX2D_IRQ_RERR          BIT(2)  /* Read Error */
+#define GFX2D_IRQ_BERR          BIT(3)  /* Write Error */
+#define GFX2D_IRQ_IERR          BIT(4)  /* Illegal Instruction Error */
+
+#endif /* MCHP_GFX2D_H */
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_gem.c b/drivers/gpu/drm/microchip/mchp_gfx2d_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..f133c4e1d9fec288ba0e1fc595e7d9d9a4df6be8
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_gem.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+
+#include "mchp_gfx2d_gem.h"
+#include "mchp_gfx2d_ioctl.h"
+
+static void mchp_gfx2d_gem_object_free(struct drm_gem_object *obj)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj = to_mchp_gfx2d_bo(obj);
+
+	mchp_gfx2d_gem_free(gfx2d_obj);
+}
+
+static int mchp_gfx2d_gem_object_mmap(struct drm_gem_object *obj,
+				      struct vm_area_struct *vma)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj = to_mchp_gfx2d_bo(obj);
+	int ret;
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vm_flags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
+
+	if (gfx2d_obj->direction == DMA_NONE) {
+		ret = dma_mmap_wc(obj->dev->dev, vma, gfx2d_obj->vaddr,
+				  gfx2d_obj->dma_addr,
+				  vma->vm_end - vma->vm_start);
+	} else {
+		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+		ret = dma_mmap_pages(obj->dev->dev,
+				     vma, vma->vm_end - vma->vm_start,
+				     virt_to_page(gfx2d_obj->vaddr));
+	}
+	if (ret)
+		drm_gem_vm_close(vma);
+	else
+		memcpy(&gfx2d_obj->vma, vma, sizeof(gfx2d_obj->vma));
+
+	return ret;
+}
+
+static const struct vm_operations_struct mchp_gfx2d_gem_object_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs mchp_gfx2d_gem_object_funcs = {
+	.free = mchp_gfx2d_gem_object_free,
+	.mmap = mchp_gfx2d_gem_object_mmap,
+	.vm_ops = &mchp_gfx2d_gem_object_vm_ops,
+};
+
+static struct mchp_gfx2d_gem_object *
+__mchp_gfx2d_gem_create(struct drm_device *dev, size_t size)
+{
+	static u32 next_id;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	gfx2d_obj = kzalloc(sizeof(*gfx2d_obj), GFP_KERNEL);
+	if (!gfx2d_obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj = &gfx2d_obj->base;
+	obj->funcs = &mchp_gfx2d_gem_object_funcs;
+
+	drm_gem_private_object_init(dev, obj, size);
+
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret) {
+		drm_gem_object_release(obj);
+		goto error;
+	}
+
+	init_waitqueue_head(&gfx2d_obj->event);
+
+	gfx2d_obj->id = next_id++;
+
+	return gfx2d_obj;
+
+error:
+	kfree(gfx2d_obj);
+	return ERR_PTR(ret);
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_create(struct drm_device *dev, size_t size,
+		      enum dma_data_direction dir)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+
+	size = round_up(size, PAGE_SIZE);
+
+	gfx2d_obj = __mchp_gfx2d_gem_create(dev, size);
+	if (IS_ERR(gfx2d_obj))
+		return gfx2d_obj;
+
+	gfx2d_obj->direction = dir;
+	if (dir == DMA_NONE) {
+		gfx2d_obj->vaddr = dma_alloc_wc(dev->dev, size,
+						&gfx2d_obj->dma_addr,
+						GFP_KERNEL | __GFP_NOWARN);
+	} else {
+		gfx2d_obj->vaddr = dma_alloc_noncoherent(dev->dev, size,
+							 &gfx2d_obj->dma_addr,
+							 dir,
+							 GFP_KERNEL | __GFP_NOWARN);
+	}
+	if (!gfx2d_obj->vaddr) {
+		drm_dbg(dev, "failed to allocate buffer with size %zu\n", size);
+		drm_gem_object_put(&gfx2d_obj->base);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return gfx2d_obj;
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_create_with_handle(struct drm_file *file_priv,
+				  struct drm_device *dev, size_t size,
+				  enum dma_data_direction dir,
+				  uint32_t *handle)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	gfx2d_obj = mchp_gfx2d_gem_create(dev, size, dir);
+	if (IS_ERR(gfx2d_obj))
+		return gfx2d_obj;
+
+	obj = &gfx2d_obj->base;
+
+	ret = drm_gem_handle_create(file_priv, obj, handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(obj);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gfx2d_obj;
+}
+
+void mchp_gfx2d_gem_free(struct mchp_gfx2d_gem_object *gfx2d_obj)
+{
+	struct drm_gem_object *obj = &gfx2d_obj->base;
+
+	if (obj->import_attach) {
+		drm_prime_gem_destroy(obj, gfx2d_obj->sgt);
+	} else if (gfx2d_obj->vaddr) {
+		if (gfx2d_obj->direction == DMA_NONE) {
+			dma_free_wc(obj->dev->dev, obj->size,
+				    gfx2d_obj->vaddr, gfx2d_obj->dma_addr);
+		} else {
+			dma_free_noncoherent(obj->dev->dev, obj->size,
+					     gfx2d_obj->vaddr,
+					     gfx2d_obj->dma_addr,
+					     gfx2d_obj->direction);
+		}
+	}
+
+	drm_gem_object_release(obj);
+
+	kfree(gfx2d_obj);
+}
+
+struct drm_gem_object *
+mchp_gfx2d_gem_prime_import_sg_table(struct drm_device *dev,
+	struct dma_buf_attachment *attach, struct sg_table *sgt)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+
+	/* Check if the entries in the sg_table are contiguous. */
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
+		return ERR_PTR(-EINVAL);
+
+	/* Create a GFX2D GEM buffer. */
+	gfx2d_obj = __mchp_gfx2d_gem_create(dev, attach->dmabuf->size);
+	if (IS_ERR(gfx2d_obj))
+		return ERR_CAST(gfx2d_obj);
+
+	gfx2d_obj->dma_addr = sg_dma_address(sgt->sgl);
+	gfx2d_obj->sgt = sgt;
+
+	drm_dbg_prime(dev, "dma_addr = %pad, size = %zu\n",
+		      &gfx2d_obj->dma_addr,
+		      attach->dmabuf->size);
+
+	return &gfx2d_obj->base;
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_get(struct drm_file *file_priv, uint32_t handle)
+{
+	struct drm_gem_object *obj;
+
+	obj = drm_gem_object_lookup(file_priv, handle);
+	if (!obj)
+		return NULL;
+	return to_mchp_gfx2d_bo(obj);
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_addref(struct drm_file *file_priv, uint32_t handle)
+{
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+
+	gfx2d_obj = mchp_gfx2d_gem_get(file_priv, handle);
+	if (gfx2d_obj)
+		atomic_inc(&gfx2d_obj->gpu_active);
+
+	return gfx2d_obj;
+}
+
+void mchp_gfx2d_gem_unref(struct mchp_gfx2d_gem_object *gfx2d_obj)
+{
+	if (!gfx2d_obj)
+		return;
+
+	atomic_dec(&gfx2d_obj->gpu_active);
+	if (!is_active(gfx2d_obj))
+		wake_up_all(&gfx2d_obj->event);
+
+	mchp_gfx2d_gem_put(gfx2d_obj);
+}
+
+int mchp_gfx2d_gem_wait(struct mchp_gfx2d_gem_object *gfx2d_obj,
+			const struct drm_mchp_timespec *timeout)
+{
+	unsigned long remaining;
+	long ret;
+
+	if (!timeout)
+		return !is_active(gfx2d_obj) ? 0 : -EBUSY;
+
+	remaining = mchp_timeout_to_jiffies(timeout);
+
+	ret = wait_event_interruptible_timeout(gfx2d_obj->event,
+					       !is_active(gfx2d_obj),
+					       remaining);
+	if (ret > 0)
+		return 0;
+	else if (ret == -ERESTARTSYS)
+		return -ERESTARTSYS;
+	else
+		return -ETIMEDOUT;
+}
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_gem.h b/drivers/gpu/drm/microchip/mchp_gfx2d_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..4d36d3b964950d5272d4c57bef643d049204fe0d
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_gem.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <linux/dma-direction.h>
+#include <linux/mm_types.h>
+
+#include <drm/drm_gem.h>
+
+#include <uapi/drm/microchip_drm.h>
+
+struct dma_buf_attachment;
+struct sg_table;
+
+struct drm_mchp_timespec;
+
+#ifndef MCHP_GFX2D_GEM_H
+#define MCHP_GFX2D_GEM_H
+
+struct mchp_gfx2d_gem_object {
+	struct drm_gem_object base;
+	u32 id;
+
+	dma_addr_t dma_addr;
+	struct sg_table *sgt;
+
+	void *vaddr;
+	enum dma_data_direction direction;
+
+	u16 width;
+	u16 height;
+	u16 stride;
+	enum drm_mchp_gfx2d_pixel_format format;
+
+	struct vm_area_struct vma;
+
+	atomic_t gpu_active;
+	wait_queue_head_t event;
+	struct list_head w_node;
+};
+
+static inline
+struct mchp_gfx2d_gem_object *to_mchp_gfx2d_bo(struct drm_gem_object *obj)
+{
+	return container_of(obj, struct mchp_gfx2d_gem_object, base);
+}
+
+static inline bool is_active(struct mchp_gfx2d_gem_object *gfx2d_obj)
+{
+	return atomic_read(&gfx2d_obj->gpu_active) != 0;
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_create(struct drm_device *dev, size_t size,
+		      enum dma_data_direction dir);
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_create_with_handle(struct drm_file *file_priv,
+				  struct drm_device *dev, size_t size,
+				  enum dma_data_direction dir,
+				  uint32_t *handle);
+
+void mchp_gfx2d_gem_free(struct mchp_gfx2d_gem_object *gfx2d_obj);
+
+struct drm_gem_object *
+mchp_gfx2d_gem_prime_import_sg_table(struct drm_device *dev,
+				     struct dma_buf_attachment *attach,
+				     struct sg_table *sgt);
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_get(struct drm_file *file_priv, uint32_t handle);
+
+static inline void mchp_gfx2d_gem_put(struct mchp_gfx2d_gem_object *gfx2d_obj)
+{
+	if (gfx2d_obj)
+		drm_gem_object_put(&gfx2d_obj->base);
+}
+
+struct mchp_gfx2d_gem_object *
+mchp_gfx2d_gem_addref(struct drm_file *file_priv, uint32_t handle);
+
+void mchp_gfx2d_gem_unref(struct mchp_gfx2d_gem_object *gfx2d_obj);
+
+int mchp_gfx2d_gem_wait(struct mchp_gfx2d_gem_object *gfx2d_obj,
+			const struct drm_mchp_timespec *timeout);
+
+#endif /* MCHP_GFX2D_GEM_H */
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c b/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c
new file mode 100644
index 0000000000000000000000000000000000000000..43ddac3836585e7cc0563c0dd8dbe709aac873c8
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+
+#include <linux/cacheflush.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+
+#include <drm/drm_prime.h>
+
+#include <uapi/drm/microchip_drm.h>
+
+#include "mchp_gfx2d_drv.h"
+#include "mchp_gfx2d_cmd.h"
+#include "mchp_gfx2d_gem.h"
+#include "mchp_gfx2d_ioctl.h"
+
+/*
+ * GFX2D timeouts are specified wrt CLOCK_MONOTONIC, not jiffies.
+ * We need to calculate the timeout in terms of number of jiffies
+ * between the specified timeout and the current CLOCK_MONOTONIC time.
+ */
+unsigned long mchp_timeout_to_jiffies(const struct drm_mchp_timespec *timeout)
+{
+	struct timespec64 ts, to = {
+		.tv_sec = timeout->tv_sec,
+		.tv_nsec = timeout->tv_nsec,
+	};
+
+	ktime_get_ts64(&ts);
+
+	/* timeots before "now" have already expired */
+	if (timespec64_compare(&to, &ts) <= 0)
+		return 0;
+
+	ts = timespec64_sub(to, ts);
+
+	return timespec64_to_jiffies(&ts);
+}
+
+static int mchp_gfx2d_ioctl_submit(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
+{
+	struct mchp_gfx2d_device *priv = drm_to_dev(dev);
+	struct drm_mchp_gfx2d_submit *args = data;
+
+	return mchp_gfx2d_submit(priv, file_priv, args);
+}
+
+static int mchp_gfx2d_ioctl_wait(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
+{
+	struct mchp_gfx2d_device *priv = drm_to_dev(dev);
+	struct drm_mchp_gfx2d_wait *args = data;
+	const struct drm_mchp_timespec *timeout = &args->timeout;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (args->flags & ~DRM_MCHP_GFX2D_WAIT_NONBLOCK)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->flags & DRM_MCHP_GFX2D_WAIT_NONBLOCK)
+		timeout = NULL;
+
+	ret = mchp_gfx2d_wait(priv, to_mchp_gfx2d_bo(obj), timeout);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static int to_dma_data_direction(enum drm_mchp_gfx2d_direction gfx2d_dir,
+				 enum dma_data_direction *dir)
+{
+	switch (gfx2d_dir) {
+	case DRM_MCHP_GFX2D_DIR_BIDIRECTIONAL:
+		*dir = DMA_BIDIRECTIONAL;
+		break;
+
+	case DRM_MCHP_GFX2D_DIR_TO_DEVICE:
+		*dir = DMA_TO_DEVICE;
+		break;
+
+	case DRM_MCHP_GFX2D_DIR_FROM_DEVICE:
+		*dir = DMA_FROM_DEVICE;
+		break;
+
+	case DRM_MCHP_GFX2D_DIR_NONE:
+		*dir = DMA_NONE;
+		break;
+
+	default:
+		return -EINVAL;
+		//break;
+	}
+
+	return 0;
+}
+
+static bool valid_pixel_format(enum drm_mchp_gfx2d_pixel_format format)
+{
+	switch (format) {
+	case DRM_MCHP_GFX2D_PF_A4IDX4:
+	case DRM_MCHP_GFX2D_PF_A8:
+	case DRM_MCHP_GFX2D_PF_IDX8:
+	case DRM_MCHP_GFX2D_PF_A8IDX8:
+	case DRM_MCHP_GFX2D_PF_RGB12:
+	case DRM_MCHP_GFX2D_PF_ARGB16:
+	case DRM_MCHP_GFX2D_PF_RGB15:
+	case DRM_MCHP_GFX2D_PF_TRGB16:
+	case DRM_MCHP_GFX2D_PF_RGBT16:
+	case DRM_MCHP_GFX2D_PF_RGB16:
+	case DRM_MCHP_GFX2D_PF_RGB24:
+	case DRM_MCHP_GFX2D_PF_ARGB32:
+	case DRM_MCHP_GFX2D_PF_RGBA32:
+		break;
+	default:
+		return false;
+		//break;
+	}
+
+	return true;
+}
+
+static int mchp_gfx2d_ioctl_alloc_buffer(struct drm_device *dev, void *data,
+					 struct drm_file *file_priv)
+{
+	struct drm_mchp_gfx2d_alloc_buffer *args = data;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	enum dma_data_direction dir;
+	struct drm_gem_object *obj;
+	int ret;
+
+	ret = to_dma_data_direction(args->direction, &dir);
+	if (ret)
+		return ret;
+
+	if (!valid_pixel_format(args->format))
+		return -EINVAL;
+
+	gfx2d_obj = mchp_gfx2d_gem_create_with_handle(file_priv, dev,
+						      args->size, dir,
+						      &args->handle);
+	if (IS_ERR(gfx2d_obj))
+		return PTR_ERR(gfx2d_obj);
+
+	gfx2d_obj->width = args->width;
+	gfx2d_obj->height = args->height;
+	gfx2d_obj->stride = args->stride;
+	gfx2d_obj->format = args->format;
+
+	obj = &gfx2d_obj->base;
+
+	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+
+	if (valid_dma_direction(dir))
+		dma_sync_single_for_device(dev->dev, gfx2d_obj->dma_addr,
+					   obj->size, dir);
+
+	return 0;
+}
+
+static int mchp_gfx2d_ioctl_import_buffer(struct drm_device *dev, void *data,
+					  struct drm_file *file_priv)
+{
+	struct drm_mchp_gfx2d_import_buffer *args = data;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (!valid_pixel_format(args->format))
+		return -EINVAL;
+
+	ret = drm_gem_prime_fd_to_handle(dev, file_priv, args->fd, &args->handle);
+	if (ret)
+		return ret;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	gfx2d_obj = to_mchp_gfx2d_bo(obj);
+	gfx2d_obj->width = args->width;
+	gfx2d_obj->height = args->height;
+	gfx2d_obj->stride = args->stride;
+	gfx2d_obj->format = args->format;
+
+	drm_gem_object_put(obj);
+
+	return 0;
+}
+
+static int mchp_gfx2d_ioctl_free_buffer(struct drm_device *dev, void *data,
+					struct drm_file *file_priv)
+{
+	struct drm_mchp_gfx2d_free_buffer *args = data;
+
+	return drm_gem_handle_delete(file_priv, args->handle);
+}
+
+static int mchp_gfx2d_ioctl_sync_for_cpu(struct drm_device *dev, void *data,
+					 struct drm_file *file_priv)
+{
+	struct mchp_gfx2d_device *priv = drm_to_dev(dev);
+	struct drm_mchp_gfx2d_sync_for_cpu *args = data;
+	const struct drm_mchp_timespec *timeout = &args->timeout;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (args->flags & ~DRM_MCHP_GFX2D_WAIT_NONBLOCK)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	gfx2d_obj = to_mchp_gfx2d_bo(obj);
+
+	if (args->flags & DRM_MCHP_GFX2D_WAIT_NONBLOCK)
+		timeout = NULL;
+
+	ret = mchp_gfx2d_wait(priv, gfx2d_obj, timeout);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static int mchp_gfx2d_ioctl_sync_for_gpu(struct drm_device *dev, void *data,
+					 struct drm_file *file_priv)
+{
+	struct drm_mchp_gfx2d_sync_for_gpu *args = data;
+	struct mchp_gfx2d_gem_object *gfx2d_obj;
+	enum dma_data_direction dir;
+	struct drm_gem_object *obj;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	gfx2d_obj = to_mchp_gfx2d_bo(obj);
+
+	dir = gfx2d_obj->direction;
+	if (valid_dma_direction(dir)) {
+		struct vm_area_struct *vma = &gfx2d_obj->vma;
+
+		flush_cache_range(vma, vma->vm_start, vma->vm_end);
+	}
+
+	drm_gem_object_put(obj);
+
+	return 0;
+}
+
+const struct drm_ioctl_desc mchp_gfx2d_ioctls[] = {
+#define GFX2D_IOCTL(n, func, flags) \
+	DRM_IOCTL_DEF_DRV(MCHP_GFX2D_##n, mchp_gfx2d_ioctl_##func, flags)
+	GFX2D_IOCTL(SUBMIT,             submit,               DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(WAIT,               wait,                 DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(ALLOC_BUFFER,       alloc_buffer,         DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(IMPORT_BUFFER,      import_buffer,        DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(FREE_BUFFER,        free_buffer,          DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(SYNC_FOR_CPU,       sync_for_cpu,         DRM_RENDER_ALLOW),
+	GFX2D_IOCTL(SYNC_FOR_GPU,       sync_for_gpu,         DRM_RENDER_ALLOW),
+};
diff --git a/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h b/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h
new file mode 100644
index 0000000000000000000000000000000000000000..8767072a77af88f52f13fa05ba86acec765f7cf6
--- /dev/null
+++ b/drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2024 Microchip
+ *
+ * Author: Cyrille Pitchen <cyrille.pitchen@microchip.com>
+ */
+
+#include <drm/drm_ioctl.h>
+
+#ifndef MCHP_GFX2D_IOCTL_H
+#define MCHP_GFX2D_IOCTL_H
+
+extern const struct drm_ioctl_desc mchp_gfx2d_ioctls[7];
+
+unsigned long mchp_timeout_to_jiffies(const struct drm_mchp_timespec *timeout);
+
+#endif /* MCHP_GFX2D_IOCTL_H */
diff --git a/include/uapi/drm/microchip_drm.h b/include/uapi/drm/microchip_drm.h
new file mode 100644
index 0000000000000000000000000000000000000000..6be5ea9edd7cd165aac43b97a97be5c8f0185418
--- /dev/null
+++ b/include/uapi/drm/microchip_drm.h
@@ -0,0 +1,286 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+ *
+ * Copyright (c) 2024 Microchip
+ * All right reserved.
+ */
+
+#ifndef __MICROCHIP_DRM_H__
+#define __MICROCHIP_DRM_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/* timeouts are specified in clock-monotonic absolute times (to simplify
+ * restarting interrupted ioctls).  The following struct is logically the
+ * same as 'struct timespec' but 32/64b ABI safe.
+ */
+struct drm_mchp_timespec {
+	__s64 tv_sec;          /* seconds */
+	__s64 tv_nsec;         /* nanoseconds */
+};
+
+struct drm_mchp_gfx2d_source {
+	__u32 handle;
+	__s32 x;
+	__s32 y;
+};
+
+struct drm_mchp_gfx2d_rectangle {
+	__s32 x;
+	__s32 y;
+	__s32 w;
+	__s32 h;
+};
+
+/**
+ * Command op codes.
+ */
+enum drm_mchp_gfx2d_operation {
+	DRM_MCHP_GFX2D_OP_FILL,
+	DRM_MCHP_GFX2D_OP_COPY,
+	DRM_MCHP_GFX2D_OP_BLEND,
+	DRM_MCHP_GFX2D_OP_ROP,
+};
+
+/**
+ * Parameters for GFX2D FILL graphics instruction.
+ */
+struct drm_mchp_gfx2d_fill {
+	__u32 color;
+};
+
+/**
+ * Blend functions.
+ */
+enum drm_mchp_gfx2d_blend_function {
+	/** @f[ C_f = S*C_s + D*C_d @f] */
+	DRM_MCHP_GFX2D_BFUNC_ADD,
+	/** @f[ C_f = S*C_s - D*C_d @f] */
+	DRM_MCHP_GFX2D_BFUNC_SUBTRACT,
+	/** @f[ C_f = D*C_d - S*C_s @f] */
+	DRM_MCHP_GFX2D_BFUNC_REVERSE,
+	/** @f[ C_f = min(C_s,C_d) @f] */
+	DRM_MCHP_GFX2D_BFUNC_MIN,
+	/** @f[ C_f = max(C_s,C_d) @f] */
+	DRM_MCHP_GFX2D_BFUNC_MAX,
+	/** Special Blending Functions */
+	DRM_MCHP_GFX2D_BFUNC_SPE,
+
+	DRM_MCHP_GFX2D_BFUNC_SPE_LIGHTEN =    DRM_MCHP_GFX2D_BFUNC_SPE | (0<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_DARKEN =     DRM_MCHP_GFX2D_BFUNC_SPE | (1<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_MULTIPLY =   DRM_MCHP_GFX2D_BFUNC_SPE | (2<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_AVERAGE =    DRM_MCHP_GFX2D_BFUNC_SPE | (3<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_ADD =        DRM_MCHP_GFX2D_BFUNC_SPE | (4<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_SUBTRACT =   DRM_MCHP_GFX2D_BFUNC_SPE | (5<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_DIFFERENCE = DRM_MCHP_GFX2D_BFUNC_SPE | (6<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_NEGATION =   DRM_MCHP_GFX2D_BFUNC_SPE | (7<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_SCREEN =     DRM_MCHP_GFX2D_BFUNC_SPE | (8<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_OVERLAY =    DRM_MCHP_GFX2D_BFUNC_SPE | (9<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_DODGE =      DRM_MCHP_GFX2D_BFUNC_SPE | (10<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_BURN =       DRM_MCHP_GFX2D_BFUNC_SPE | (11<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_REFLECT =    DRM_MCHP_GFX2D_BFUNC_SPE | (12<<4),
+	DRM_MCHP_GFX2D_BFUNC_SPE_GLOW =       DRM_MCHP_GFX2D_BFUNC_SPE | (13<<4),
+};
+
+/**
+ * Source and destination blend factors.
+ */
+enum drm_mchp_gfx2d_blend_factor {
+	/** @f[ (0,0,0,0) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ZERO,
+	/** @f[ (1,1,1,1) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE,
+	/** @f[ (A_s,R_s,G_s,B_s) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_SRC_COLOR,
+	/** @f[ (1,1,1,1) - (A_s,R_s,G_s,B_s) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_SRC_COLOR,
+	/** @f[ (A_d,R_d,G_d,B_d) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_DST_COLOR,
+	/** @f[ (1,1,1,1)-(A_d,R_d,G_d,B_d) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_DST_COLOR,
+	/** @f[ (A_s,A_s,A_s,A_s) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_SRC_ALPHA,
+	/** @f[ (1,1,1,1)-(A_s,A_s,A_s,A_s) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_SRC_ALPHA,
+	/** @f[ (A_d,A_d,A_d,A_d) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_DST_ALPHA,
+	/** @f[ (1,1,1,1)-(A_d,A_d,A_d,A_d) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_DST_ALPHA,
+	/** @f[ (A_c,R_c,G_c,B_c) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_CONSTANT_COLOR,
+	/** @f[ (1,1,1,1) - (A_c,R_c,G_c,B_c) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_COLOR,
+	/** @f[ (A_c,A_c,A_c,A_c) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_CONSTANT_ALPHA,
+	/** @f[ (1,1,1,1)-(A_c,A_c,A_c,A_c) @f] */
+	DRM_MCHP_GFX2D_BFACTOR_ONE_MINUS_CONSTANT_ALPHA,
+	/** @f[ (1,i,i,i) @f] where i is equal to the minimum between
+	 *  @f[ A_s @f] and @f[ 1-A_d @f]
+	 */
+	DRM_MCHP_GFX2D_BFACTOR_SRC_ALPHA_SATURATE,
+};
+
+#define DRM_MCHP_GFX2D_BLEND_DPRE       0x00000001
+#define DRM_MCHP_GFX2D_BLEND_SPRE       0x00000002
+
+/**
+ * Parameters for the GFX2D BLEND graphics instruction.
+ */
+struct drm_mchp_gfx2d_blend {
+	__u32 src_color;
+	__u32 dst_color;
+	__u32 flags;
+	enum drm_mchp_gfx2d_blend_function function;
+	enum drm_mchp_gfx2d_blend_factor safactor;
+	enum drm_mchp_gfx2d_blend_factor dafactor;
+	enum drm_mchp_gfx2d_blend_factor scfactor;
+	enum drm_mchp_gfx2d_blend_factor dcfactor;
+};
+
+/**
+ * ROP mode.
+ */
+enum drm_mchp_gfx2d_rop_mode {
+	DRM_MCHP_GFX2D_ROP2,
+	DRM_MCHP_GFX2D_ROP3,
+	DRM_MCHP_GFX2D_ROP4,
+};
+
+/**
+ * Parameters for the GFX2D ROP graphics instruction.
+ */
+struct drm_mchp_gfx2d_rop {
+	__u32 mask_handle;
+	enum drm_mchp_gfx2d_rop_mode mode;
+	__u8 high;
+	__u8 low;
+};
+
+struct drm_mchp_gfx2d_submit {
+	__u64 rectangles;
+	__kernel_size_t num_rectangles;
+	__u32 target_handle;
+	struct drm_mchp_gfx2d_source sources[2];
+	enum drm_mchp_gfx2d_operation operation;
+	union {
+		struct drm_mchp_gfx2d_fill fill;
+		struct drm_mchp_gfx2d_blend blend;
+		struct drm_mchp_gfx2d_rop rop;
+	};
+};
+
+#define DRM_MCHP_GFX2D_WAIT_NONBLOCK    0x00000001
+
+struct drm_mchp_gfx2d_wait {
+	struct drm_mchp_timespec timeout;
+	__u32 handle;
+	__u32 flags;
+};
+
+/**
+ * Supported surface formats.
+ */
+enum drm_mchp_gfx2d_pixel_format {
+	/** 4-bit indexed color, with 4-bit alpha value */
+	DRM_MCHP_GFX2D_PF_A4IDX4,
+	/** 8 bits per pixel alpha, with user-defined constant color */
+	DRM_MCHP_GFX2D_PF_A8,
+	/** 8 bits indexed color, uses the Color Look-Up Table to expand to true color */
+	DRM_MCHP_GFX2D_PF_IDX8,
+	/** 8-bit indexed color, with 8-bit alpha value */
+	DRM_MCHP_GFX2D_PF_A8IDX8,
+	/** 12 bits per pixel, 4 bits per color channel */
+	DRM_MCHP_GFX2D_PF_RGB12,
+	/** 16 bits per pixel with 4-bit width alpha value, and 4 bits per color channel */
+	DRM_MCHP_GFX2D_PF_ARGB16,
+	/** 15 bits per pixel, 5 bits per color channel */
+	DRM_MCHP_GFX2D_PF_RGB15,
+	/** 16 bits per pixel, with 1 bit for transparency and 5 bits for color channels */
+	DRM_MCHP_GFX2D_PF_TRGB16,
+	/** 16 bits per pixel, with 5 bits for color channels and 1 bit for transparency */
+	DRM_MCHP_GFX2D_PF_RGBT16,
+	/** 16 bits per pixel, 5 bits for the red and blue channels and 6 bits for the green one */
+	DRM_MCHP_GFX2D_PF_RGB16,
+	/** 24 bits per pixel, 8 bits for alpha and color channels */
+	DRM_MCHP_GFX2D_PF_RGB24,
+	/** 32 bits per pixel, 8 bits for alpha and color channels */
+	DRM_MCHP_GFX2D_PF_ARGB32,
+	/** 32 bits per pixel, 8 bits for alpha and color channels */
+	DRM_MCHP_GFX2D_PF_RGBA32,
+};
+
+enum drm_mchp_gfx2d_direction {
+	DRM_MCHP_GFX2D_DIR_BIDIRECTIONAL,
+	DRM_MCHP_GFX2D_DIR_TO_DEVICE,
+	DRM_MCHP_GFX2D_DIR_FROM_DEVICE,
+	DRM_MCHP_GFX2D_DIR_NONE,
+};
+
+struct drm_mchp_gfx2d_alloc_buffer {
+	__u32 size;     /* in bytes for mmap() */
+	__u16 width;
+	__u16 height;
+	__u16 stride;
+	enum drm_mchp_gfx2d_pixel_format format;
+	enum drm_mchp_gfx2d_direction direction;
+
+	__u32 handle;
+	__u64 offset;
+};
+
+struct drm_mchp_gfx2d_import_buffer {
+	__s32 fd;
+	__u16 width;
+	__u16 height;
+	__u16 stride;
+	enum drm_mchp_gfx2d_pixel_format format;
+
+	__u32 handle;
+};
+
+struct drm_mchp_gfx2d_free_buffer {
+	__u32 handle;
+};
+
+struct drm_mchp_gfx2d_sync_for_cpu {
+	struct drm_mchp_timespec timeout;
+	__u32 handle;
+	__u32 flags;
+};
+
+struct drm_mchp_gfx2d_sync_for_gpu {
+	__u32 handle;
+};
+
+#define DRM_MCHP_GFX2D_SUBMIT                   0x00
+#define DRM_MCHP_GFX2D_WAIT                     0x01
+#define DRM_MCHP_GFX2D_ALLOC_BUFFER             0x02
+#define DRM_MCHP_GFX2D_IMPORT_BUFFER            0x03
+#define DRM_MCHP_GFX2D_FREE_BUFFER              0x04
+#define DRM_MCHP_GFX2D_SYNC_FOR_CPU             0x05
+#define DRM_MCHP_GFX2D_SYNC_FOR_GPU             0x06
+
+#define DRM_IOCTL_MCHP_GFX2D_SUBMIT \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_SUBMIT, struct drm_mchp_gfx2d_submit)
+#define DRM_IOCTL_MCHP_GFX2D_WAIT \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_WAIT, struct drm_mchp_gfx2d_wait)
+#define DRM_IOCTL_MCHP_GFX2D_ALLOC_BUFFER \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_ALLOC_BUFFER, struct drm_mchp_gfx2d_alloc_buffer)
+#define DRM_IOCTL_MCHP_GFX2D_IMPORT_BUFFER \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_IMPORT_BUFFER, \
+		 struct drm_mchp_gfx2d_import_buffer)
+#define DRM_IOCTL_MCHP_GFX2D_FREE_BUFFER \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_FREE_BUFFER, struct drm_mchp_gfx2d_free_buffer)
+#define DRM_IOCTL_MCHP_GFX2D_SYNC_FOR_CPU \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_SYNC_FOR_CPU, struct drm_mchp_gfx2d_sync_for_cpu)
+#define DRM_IOCTL_MCHP_GFX2D_SYNC_FOR_GPU \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_MCHP_GFX2D_SYNC_FOR_GPU, struct drm_mchp_gfx2d_sync_for_gpu)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __MICROCHIP_DRM_H__ */

-- 
2.48.1

