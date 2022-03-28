Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5914E8C26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 04:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DE510E582;
	Mon, 28 Mar 2022 02:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23DDC10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 02:29:25 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:36846.2128613048
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 81CFD1001AE;
 Mon, 28 Mar 2022 10:29:15 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 20b51b4baeb14e10978608a6a4cf87f6 for mripard@kernel.org; 
 Mon, 28 Mar 2022 10:29:24 CST
X-Transaction-ID: 20b51b4baeb14e10978608a6a4cf87f6
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v13 5/6] drm/loongson: add drm driver for loongson display
 controller
Date: Mon, 28 Mar 2022 10:28:34 +0800
Message-Id: <20220328022835.2508587-5-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328022835.2508587-1-15330273260@189.cn>
References: <20220328022835.2508587-1-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a display controller in loongson's LS2K1000 SoC and LS7A1000
bridge chip, the display controller is a PCI device in those chips. It
has two display pipes but with only one hardware cursor. Each way has
a DVO interface which provide RGB888 signals, vertical & horizontal
synchronisations, data enable and the pixel clock. Each CRTC is able to
scanout from 1920x1080 resolution at 60Hz, the maxmium resolution is
2048x2048 according to the hardware spec. Loongson display controllers
are simple which require scanout buffers to be physically contiguous.

For LS7A1000 bridge chip, the DC is equipped with a dedicated video RAM
which is typically 64MB or more. In this case, VRAM helper based driver
is intend to be used even through the DC can scanout form system memory.

While LS2K1000 is a SoC which is a typically UMA device, only system
memory is available. Therefore CMA helper based driver is intend to be
used. It is possible to use VRAM helper based driver on LS2K1000 by
carving out part of system memory as VRAM though.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space, They are used to emulate two way i2c.
One for DVO0, another for DVO1. LS2K1000 and LS2K0500 SoC don't have such
GPIO hardwared, they grab i2c adapter from other module, either general
purpose GPIO emulated i2c or hardware i2c adapter.

    +------+            +-----------------------------------+
    | DDR4 |            |  +-------------------+            |
    +------+            |  | PCIe Root complex |   LS7A1000 |
       || MC0           |  +--++---------++----+            |
  +----------+  HT 3.0  |     ||         ||                 |
  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
  +----------+          | +--------+  +-+--+-+    +---------+   +------+
       || MC1           +---------------|--|----------------+
    +------+                            |  |
    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
                      +-------+                      +------+

The above picture give a simple usage of LS7A1000, note that the encoder
is not necessary adv7125 or tfp410, other candicates can be ch7034b,
sil9022, ite66121 and lt8618 etc.

By design, the code was written in a NOT fully DT dependent way.

v2: Fixup warnings reported by kernel test robot

v3: Fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
    more details about lsdc.

v4:
   1) Add dts required and explain why device tree is required.
   2) Give more description about lsdc and VRAM helper based driver.
   3) Fix warnings reported by kernel test robot.
   4) Introduce stride_alignment member into struct lsdc_chip_desc, the
      stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500.

v5:
   1) Using writel and readl replace writeq and readq, to fix kernel test
      robot report build error on other archtecture.
   2) Set default fb format to XRGB8888 at crtc reset time.

v6:
   1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty update implement based
      on CMA helper.

v7:
   1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not ready now
   2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
   3) Remove lsdc_pixpll_print(), part of it move to debugfs.
   4) Set prefer_shadow to true if vram based driver is in using.
   5) Replace double blank lines with single line in all files.
   6) Verbose cmd line parameter is replaced with drm_dbg()
   7) All warnnings reported by ./scripts/checkpatch.pl --strict are fixed
   8) Get edid from dtb support is removed as suggested by Maxime Ripard
   9) Fix typos and various improvement

v8:
   1) Drop damage update implement and its command line.
   2) Drop DRM_LSDC_VRAM_DRIVER config option as suggested by Maxime.
   3) Deduce DC's identification from its compatible property.
   4) Drop the board specific dts patch.
   5) Add documention about the display controller device node.

v9:
   1) Fix the warnings reported by checkpatch script and fix typos

v10:
   1) Pass `make dt_binding_check` validation
   2) Fix warnings reported by kernel test robot

v11:
   1) Convert the driver to use drm bridge and of graph framework.
   2) Dump register value support through debugfs.
   3) Select DRM_TTM and DRM_TTM_HELPER in Kconfig which fix linkage
      problem when built it into the kernel.
   4) Non 64 pixel(256 bytes aligned) horiziontal resolutons got
      supported by hacking, default is disabled, enable it by using
      'loongson.relax_alignment=1' on kernel cmd line.
   5) Various improvement as required by Maxime.

v12:
   1) Add gammma support, it is broken because hardware engineer
      does not implement this correctly. Using 'loongson.gamma=1' on
      the kernel cmd line to enable this and see what will happen.
      We implemlent this for IC varification.
   2) Separate debugfs related code from lsdc_drv.c
   3) Built-in GPIO emulate i2c refinement.
   4) Various improvement as required by Rob.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/loongson/Kconfig        |  25 ++
 drivers/gpu/drm/loongson/Makefile       |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c    | 395 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c | 176 ++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.h |  17 +
 drivers/gpu/drm/loongson/lsdc_drv.c     | 417 +++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h     | 155 +++++++
 drivers/gpu/drm/loongson/lsdc_i2c.c     | 285 ++++++++++++
 drivers/gpu/drm/loongson/lsdc_i2c.h     |  38 ++
 drivers/gpu/drm/loongson/lsdc_irq.c     |  57 +++
 drivers/gpu/drm/loongson/lsdc_irq.h     |  17 +
 drivers/gpu/drm/loongson/lsdc_output.c  | 261 +++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h  |  21 +
 drivers/gpu/drm/loongson/lsdc_pci_drv.c | 346 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_plane.c   | 447 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c     | 573 ++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h     |  87 ++++
 drivers/gpu/drm/loongson/lsdc_regs.h    | 221 +++++++++
 20 files changed, 3557 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..156fd0c48498 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -408,6 +408,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/loongson/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c2ef5f9fce54..eafbc84718c9 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -134,3 +134,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_LOONGSON) += loongson/
diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
new file mode 100644
index 000000000000..66283225087b
--- /dev/null
+++ b/drivers/gpu/drm/loongson/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_LOONGSON
+	tristate "DRM Support for loongson's display controller"
+	depends on DRM && PCI
+	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
+	select OF
+	select CMA if HAVE_DMA_CONTIGUOUS
+	select DMA_CMA if HAVE_DMA_CONTIGUOUS
+	select DRM_KMS_HELPER
+	select DRM_KMS_FB_HELPER
+	select DRM_GEM_CMA_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select DRM_VRAM_HELPER
+	select VIDEOMODE_HELPERS
+	select DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
+	default m
+	help
+	  This is a KMS driver for the display controller in the LS7A1000
+	  bridge chip and LS2K1000/LS2K0500 SoC.
+	  If "M" is selected, the module will be called loongson.
+
+	  If in doubt, say "Y".
diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
new file mode 100644
index 000000000000..cf6391b8eb17
--- /dev/null
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+loongson-y := \
+	lsdc_drv.o \
+	lsdc_crtc.o \
+	lsdc_irq.o \
+	lsdc_plane.o \
+	lsdc_pll.o \
+	lsdc_i2c.o \
+	lsdc_output.o \
+	lsdc_pci_drv.o \
+	lsdc_debugfs.o \
+
+lsdc-$(CONFIG_DEBUG_FS) += lsdc_debugfs.o
+
+obj-$(CONFIG_DRM_LOONGSON) += loongson.o
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
new file mode 100644
index 000000000000..c685c2f91ead
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+#include <drm/drm_vblank.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+	unsigned int index = drm_crtc_index(crtc);
+	struct drm_crtc_state *state = crtc->state;
+	u32 val;
+
+	if (state->enable) {
+		val = readl(ldev->reg_base + LSDC_INT_REG);
+
+		if (index == 0)
+			val |= INT_CRTC0_VS_EN;
+		else if (index == 1)
+			val |= INT_CRTC1_VS_EN;
+
+		writel(val, ldev->reg_base + LSDC_INT_REG);
+	}
+
+	return 0;
+}
+
+static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+	unsigned int index = drm_crtc_index(crtc);
+	u32 val;
+
+	val = readl(ldev->reg_base + LSDC_INT_REG);
+
+	if (index == 0)
+		val &= ~INT_CRTC0_VS_EN;
+	else if (index == 1)
+		val &= ~INT_CRTC1_VS_EN;
+
+	writel(val, ldev->reg_base + LSDC_INT_REG);
+}
+
+static void lsdc_crtc_reset(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = drm_crtc_index(crtc);
+	struct lsdc_crtc_state *priv_crtc_state;
+	u32 val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
+
+	if (ldev->enable_gamma)
+		val |= CFG_GAMMAR_EN_BIT;
+
+	/* The crtc get soft reset if bit 20 of CRTC*_CFG_REG
+	 * is write with falling edge.
+	 *
+	 * Doing this to switch from soft reset state to working state
+	 */
+	if (index == 0)
+		writel(val, ldev->reg_base + LSDC_CRTC0_CFG_REG);
+	else if (index == 1)
+		writel(val, ldev->reg_base + LSDC_CRTC1_CFG_REG);
+
+	if (crtc->state) {
+		priv_crtc_state = to_lsdc_crtc_state(crtc->state);
+		__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
+		kfree(priv_crtc_state);
+	}
+
+	priv_crtc_state = kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
+	if (!priv_crtc_state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->base);
+
+	drm_dbg(ddev, "crtc%u reset\n", index);
+}
+
+static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *state)
+{
+	struct lsdc_crtc_state *priv_crtc_state = to_lsdc_crtc_state(state);
+
+	__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
+
+	kfree(priv_crtc_state);
+}
+
+static struct drm_crtc_state *lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lsdc_crtc_state *new_priv_state;
+	struct lsdc_crtc_state *old_priv_state;
+	struct drm_device *ddev = crtc->dev;
+
+	if (drm_WARN_ON(ddev, !crtc->state))
+		return NULL;
+
+	new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
+	if (!new_priv_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->base);
+
+	old_priv_state = to_lsdc_crtc_state(crtc->state);
+
+	memcpy(&new_priv_state->pparams, &old_priv_state->pparams, sizeof(new_priv_state->pparams));
+
+	return &new_priv_state->base;
+}
+
+static const struct drm_crtc_funcs lsdc_crtc_funcs = {
+	.reset = lsdc_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,
+	.enable_vblank = lsdc_crtc_enable_vblank,
+	.disable_vblank = lsdc_crtc_disable_vblank,
+};
+
+static enum drm_mode_status
+lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			    const struct drm_display_mode *mode)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc *desc = ldev->desc;
+
+	if (mode->hdisplay > desc->max_width)
+		return MODE_BAD_HVALUE;
+	if (mode->vdisplay > desc->max_height)
+		return MODE_BAD_VVALUE;
+
+	if (mode->clock > desc->max_pixel_clk) {
+		drm_dbg(ddev, "mode %dx%d, pixel clock=%d is too high\n",
+			mode->hdisplay, mode->vdisplay, mode->clock);
+		return MODE_CLOCK_HIGH;
+	}
+
+	/* The CRTC hardware dma take 256 bytes once a time,
+	 * it is a limitation of the CRTC.
+	 * TODO: check RGB565 support
+	 */
+	if (!ldev->relax_alignment) {
+		if ((mode->hdisplay * 4) % desc->stride_alignment) {
+			drm_dbg(ddev, "stride is not %u bytes aligned\n",
+				desc->stride_alignment);
+			return MODE_BAD;
+		}
+	}
+
+	return MODE_OK;
+}
+
+static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
+				    struct drm_crtc_state *state)
+{
+	struct lsdc_display_pipe *dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
+	struct lsdc_pll * const pixpll = &dispipe->pixpll;
+	const struct lsdc_pixpll_funcs * const pfuncs = pixpll->funcs;
+	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(state);
+	bool ret;
+
+	ret = pfuncs->compute(pixpll, state->mode.clock, &priv_state->pparams);
+	if (ret)
+		return 0;
+
+	drm_warn(crtc->dev, "failed find PLL parameters for %u\n", state->mode.clock);
+
+	return -EINVAL;
+}
+
+static int lsdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	if (!crtc_state->enable)
+		return 0; /* no mode checks if CRTC is being disabled */
+
+	return lsdc_pixpll_atomic_check(crtc, crtc_state);
+}
+
+static void lsdc_update_pixclk(struct drm_crtc *crtc)
+{
+	struct lsdc_display_pipe *dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
+	struct lsdc_pll * const pixpll = &dispipe->pixpll;
+	const struct lsdc_pixpll_funcs * const clkfun = pixpll->funcs;
+	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(crtc->state);
+
+	clkfun->update(pixpll, &priv_state->pparams);
+}
+
+static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	unsigned int index = drm_crtc_index(crtc);
+	u32 h_sync, v_sync, h_val, v_val;
+
+	/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
+	h_val = (mode->crtc_htotal << 16) | mode->crtc_hdisplay;
+	/* Hack to support non 256 bytes aligned stride, for example:
+	 * 800x480 DPI panel. In this case userspace do the work to
+	 * guarantee the horizontal pixel size is aligned by padding it.
+	 * In actual, We allocate 832x480x4 bytes in size.
+	 */
+	if (ldev->relax_alignment)
+		h_val = (h_val + 63) & ~63;
+
+	/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
+	v_val = (mode->crtc_vtotal << 16) | mode->crtc_vdisplay;
+	/* 26:16 hsync end, 10:0 hsync start, bit 30 is hsync enable */
+	h_sync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start | EN_HSYNC_BIT;
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		h_sync |= INV_HSYNC_BIT;
+
+	/* 26:16 vsync end, 10:0 vsync start, bit 30 is vsync enable */
+	v_sync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start | EN_VSYNC_BIT;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		v_sync |= INV_VSYNC_BIT;
+
+	if (index == 0) {
+		writel(0, ldev->reg_base + LSDC_CRTC0_FB_ORIGIN_REG);
+		writel(h_val, ldev->reg_base + LSDC_CRTC0_HDISPLAY_REG);
+		writel(v_val, ldev->reg_base + LSDC_CRTC0_VDISPLAY_REG);
+		writel(h_sync, ldev->reg_base + LSDC_CRTC0_HSYNC_REG);
+		writel(v_sync, ldev->reg_base + LSDC_CRTC0_VSYNC_REG);
+	} else if (index == 1) {
+		writel(0, ldev->reg_base + LSDC_CRTC1_FB_ORIGIN_REG);
+		writel(h_val, ldev->reg_base + LSDC_CRTC1_HDISPLAY_REG);
+		writel(v_val, ldev->reg_base + LSDC_CRTC1_VDISPLAY_REG);
+		writel(h_sync, ldev->reg_base + LSDC_CRTC1_HSYNC_REG);
+		writel(v_sync, ldev->reg_base + LSDC_CRTC1_VSYNC_REG);
+	}
+
+	drm_dbg(ddev, "%s modeset: %ux%u\n", crtc->name, mode->hdisplay, mode->vdisplay);
+
+	lsdc_update_pixclk(crtc);
+}
+
+static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int index)
+{
+	u32 val;
+
+	if (index == 0) {
+		val = readl(ldev->reg_base + LSDC_CRTC0_CFG_REG);
+		val |= CFG_OUTPUT_EN_BIT;
+		writel(val, ldev->reg_base + LSDC_CRTC0_CFG_REG);
+	} else if (index == 1) {
+		val = readl(ldev->reg_base + LSDC_CRTC1_CFG_REG);
+		val |= CFG_OUTPUT_EN_BIT;
+		writel(val, ldev->reg_base + LSDC_CRTC1_CFG_REG);
+	}
+}
+
+static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int index)
+{
+	u32 val;
+
+	if (index == 0) {
+		val = readl(ldev->reg_base + LSDC_CRTC0_CFG_REG);
+		val &= ~CFG_OUTPUT_EN_BIT;
+		writel(val, ldev->reg_base + LSDC_CRTC0_CFG_REG);
+	} else if (index == 1) {
+		val = readl(ldev->reg_base + LSDC_CRTC1_CFG_REG);
+		val &= ~CFG_OUTPUT_EN_BIT;
+		writel(val, ldev->reg_base + LSDC_CRTC1_CFG_REG);
+	}
+}
+
+static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	drm_crtc_vblank_on(crtc);
+
+	lsdc_enable_display(ldev, drm_crtc_index(crtc));
+
+	drm_dbg(ddev, "%s: enabled\n", crtc->name);
+}
+
+static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	drm_crtc_vblank_off(crtc);
+
+	lsdc_disable_display(ldev, drm_crtc_index(crtc));
+
+	drm_dbg(ddev, "%s: disabled\n", crtc->name);
+}
+
+static void lsdc_crtc_update_clut(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+	unsigned int index = drm_crtc_index(crtc);
+	struct drm_color_lut *lut;
+	unsigned int i;
+
+	if (!ldev->enable_gamma)
+		return;
+
+	if (!crtc->state->color_mgmt_changed || !crtc->state->gamma_lut)
+		return;
+
+	lut = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+
+	writel(0, ldev->reg_base + LSDC_CRTC0_GAMMA_INDEX_REG);
+
+	for (i = 0; i < 256; i++) {
+		u32 val = ((lut->red << 8) & 0xff0000) |
+			  (lut->green & 0xff00) |
+			  (lut->blue >> 8);
+
+		if (index == 0)
+			writel(val, ldev->reg_base + LSDC_CRTC0_GAMMA_DATA_REG);
+		else if (index == 1)
+			writel(val, ldev->reg_base + LSDC_CRTC1_GAMMA_DATA_REG);
+
+		lut++;
+	}
+}
+
+static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct drm_pending_vblank_event *event = crtc->state->event;
+
+	lsdc_crtc_update_clut(crtc);
+
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
+	.mode_valid = lsdc_crtc_helper_mode_valid,
+	.mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
+	.atomic_enable = lsdc_crtc_helper_atomic_enable,
+	.atomic_disable = lsdc_crtc_helper_atomic_disable,
+	.atomic_check = lsdc_crtc_helper_atomic_check,
+	.atomic_flush = lsdc_crtc_atomic_flush,
+};
+
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   unsigned int index,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor)
+{
+	int ret;
+
+	ret = drm_crtc_init_with_planes(ddev, crtc, primary, cursor,
+					&lsdc_crtc_funcs, "crtc%d", index);
+
+	if (ret) {
+		drm_err(ddev, "crtc init with planes failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
+
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret)
+		drm_warn(ddev, "set the gamma table size failed\n");
+
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
new file mode 100644
index 000000000000..2390fdbe13e6
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <drm/drm_file.h>
+#include <drm/drm_device.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_vma_manager.h>
+#include <drm/drm_gem_vram_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_pll.h"
+#include "lsdc_regs.h"
+#include "lsdc_debugfs.h"
+
+#ifdef CONFIG_DEBUG_FS
+
+static int lsdc_show_clock(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, ddev) {
+		struct lsdc_display_pipe *pipe;
+		struct lsdc_pll *pixpll;
+		const struct lsdc_pixpll_funcs *funcs;
+		struct lsdc_pll_core_values params;
+		unsigned int out_khz;
+		struct drm_display_mode *adj;
+
+		pipe = container_of(crtc, struct lsdc_display_pipe, crtc);
+		if (!pipe->available)
+			continue;
+
+		adj = &crtc->state->adjusted_mode;
+
+		pixpll = &pipe->pixpll;
+		funcs = pixpll->funcs;
+		out_khz = funcs->get_clock_rate(pixpll, &params);
+
+		seq_printf(m, "Display pipe %u: %dx%d\n",
+			   pipe->index, adj->hdisplay, adj->vdisplay);
+
+		seq_printf(m, "Frequency actually output: %u kHz\n", out_khz);
+		seq_printf(m, "Pixel clock required: %d kHz\n", adj->clock);
+		seq_printf(m, "diff: %d kHz\n", adj->clock);
+
+		seq_printf(m, "div_ref=%u, loopc=%u, div_out=%u\n",
+			   params.div_ref, params.loopc, params.div_out);
+
+		seq_printf(m, "hsync_start=%d, hsync_end=%d, htotal=%d\n",
+			   adj->hsync_start, adj->hsync_end, adj->htotal);
+		seq_printf(m, "vsync_start=%d, vsync_end=%d, vtotal=%d\n\n",
+			   adj->vsync_start, adj->vsync_end, adj->vtotal);
+	}
+
+	return 0;
+}
+
+static int lsdc_show_mm(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
+
+	return 0;
+}
+
+#define REGDEF(reg) { __stringify_1(LSDC_##reg##_REG), LSDC_##reg##_REG }
+static const struct {
+	const char *name;
+	u32 reg_offset;
+} lsdc_regs_array[] = {
+	REGDEF(INT),
+	REGDEF(CURSOR_CFG),
+	REGDEF(CURSOR_ADDR),
+	REGDEF(CURSOR_POSITION),
+	REGDEF(CURSOR_BG_COLOR),
+	REGDEF(CURSOR_FG_COLOR),
+	REGDEF(CRTC0_CFG),
+	REGDEF(CRTC0_FB_ADDR0),
+	REGDEF(CRTC0_FB_ADDR1),
+	REGDEF(CRTC0_FB_HI_ADDR),
+	REGDEF(CRTC0_STRIDE),
+	REGDEF(CRTC0_FB_ORIGIN),
+	REGDEF(CRTC0_HDISPLAY),
+	REGDEF(CRTC0_HSYNC),
+	REGDEF(CRTC0_VDISPLAY),
+	REGDEF(CRTC0_VSYNC),
+	REGDEF(CRTC0_GAMMA_INDEX),
+	REGDEF(CRTC0_GAMMA_DATA),
+	REGDEF(CRTC1_CFG),
+	REGDEF(CRTC1_FB_ADDR0),
+	REGDEF(CRTC1_FB_ADDR1),
+	REGDEF(CRTC1_FB_HI_ADDR),
+	REGDEF(CRTC1_STRIDE),
+	REGDEF(CRTC1_FB_ORIGIN),
+	REGDEF(CRTC1_HDISPLAY),
+	REGDEF(CRTC1_HSYNC),
+	REGDEF(CRTC1_VDISPLAY),
+	REGDEF(CRTC1_VSYNC),
+	REGDEF(CRTC1_GAMMA_INDEX),
+	REGDEF(CRTC1_GAMMA_DATA),
+};
+
+static int lsdc_show_regs(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(lsdc_regs_array); i++) {
+		u32 offset = lsdc_regs_array[i].reg_offset;
+		const char *name = lsdc_regs_array[i].name;
+
+		seq_printf(m, "%s (0x%04x): 0x%08x\n",
+			   name, offset,
+			   readl(ldev->reg_base + offset));
+	}
+
+	return 0;
+}
+
+static const struct drm_info_list lsdc_debugfs_list[] = {
+	{ "clocks", lsdc_show_clock, 0 },
+	{ "mm",     lsdc_show_mm,   0, NULL },
+	{ "regs",   lsdc_show_regs, 0 },
+};
+
+void lsdc_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(lsdc_debugfs_list,
+				 ARRAY_SIZE(lsdc_debugfs_list),
+				 minor->debugfs_root,
+				 minor);
+}
+
+/*
+ * vram debugfs related.
+ */
+static int lsdc_vram_mm_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_vram_mm *vmm = node->minor->dev->vram_mm;
+	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+
+static const struct drm_info_list lsdc_vram_mm_debugfs_list[] = {
+	{ "clocks", lsdc_show_clock, 0 },
+	{ "vram-mm", lsdc_vram_mm_show, 0, NULL },
+	{ "regs",   lsdc_show_regs, 0 },
+};
+
+void lsdc_vram_mm_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(lsdc_vram_mm_debugfs_list,
+				 ARRAY_SIZE(lsdc_vram_mm_debugfs_list),
+				 minor->debugfs_root,
+				 minor);
+}
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.h b/drivers/gpu/drm/loongson/lsdc_debugfs.h
new file mode 100644
index 000000000000..d5e630534f83
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_DEBUGFS_H__
+#define __LSDC_DEBUGFS_H__
+
+void lsdc_debugfs_init(struct drm_minor *minor);
+void lsdc_vram_mm_debugfs_init(struct drm_minor *minor);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
new file mode 100644
index 000000000000..c71a2c3e11ad
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <linux/pci.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_irq.h"
+#include "lsdc_output.h"
+#include "lsdc_debugfs.h"
+
+#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
+#define DRIVER_DESC		"drm driver for loongson's display controller"
+#define DRIVER_DATE		"20200701"
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+static const struct lsdc_chip_desc dc_in_ls2k1000 = {
+	.chip = LSDC_CHIP_2K1000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	/* ls2k1000 user manual say the max pixel clock can be about 200MHz */
+	.max_pixel_clk = 200000,
+	.max_width = 2560,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.stride_alignment = 256,
+	.has_builtin_i2c = false,
+	.has_vram = false,
+	.broken_gamma = true,
+};
+
+static const struct lsdc_chip_desc dc_in_ls2k0500 = {
+	.chip = LSDC_CHIP_2K0500,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.stride_alignment = 256,
+	.has_builtin_i2c = false,
+	.has_vram = false,
+	.broken_gamma = true,
+};
+
+static const struct lsdc_chip_desc dc_in_ls7a1000 = {
+	.chip = LSDC_CHIP_7A1000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.stride_alignment = 256,
+	.has_builtin_i2c = true,
+	.has_vram = true,
+	.broken_gamma = true,
+};
+
+static enum drm_mode_status
+lsdc_device_mode_valid(struct drm_device *ddev, const struct drm_display_mode *mode)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	if (ldev->use_vram_helper)
+		return drm_vram_helper_mode_valid(ddev, mode);
+
+	return MODE_OK;
+}
+
+static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.output_poll_changed = drm_fb_helper_output_poll_changed,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.mode_valid = lsdc_device_mode_valid,
+};
+
+static struct drm_gem_object *
+lsdc_drm_gem_create_object(struct drm_device *ddev, size_t size)
+{
+	struct drm_gem_cma_object *obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->map_noncoherent = true;
+
+	return &obj->base;
+}
+
+static int lsdc_gem_cma_dumb_create(struct drm_file *file,
+				    struct drm_device *ddev,
+				    struct drm_mode_create_dumb *args)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc *desc = ldev->desc;
+	unsigned int bytes_per_pixel = (args->bpp + 7) / 8;
+	unsigned int pitch = bytes_per_pixel * args->width;
+
+	/*
+	 * The dc in ls7a1000/ls2k1000/ls2k0500 require the stride be a
+	 * multiple of 256 bytes which is for sake of optimize dma data
+	 * transfer.
+	 */
+	args->pitch = roundup(pitch, desc->stride_alignment);
+
+	return drm_gem_cma_dumb_create_internal(file, ddev, args);
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(lsdc_drv_fops);
+
+static const struct drm_driver lsdc_drm_driver_cma_stub = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.lastclose = drm_fb_helper_lastclose,
+	.fops = &lsdc_drv_fops,
+	.gem_create_object = lsdc_drm_gem_create_object,
+
+	.name = "lsdc",
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(lsdc_gem_cma_dumb_create),
+
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init = lsdc_debugfs_init,
+#endif
+};
+
+DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
+
+static const struct drm_driver lsdc_vram_driver_stub = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops = &lsdc_gem_fops,
+
+	.name = "loongson",
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init = lsdc_vram_mm_debugfs_init,
+#endif
+	.dumb_create = drm_gem_vram_driver_dumb_create,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+	.gem_prime_mmap = drm_gem_prime_mmap,
+};
+
+static int lsdc_modeset_init(struct lsdc_device *ldev, uint32_t num_crtc)
+{
+	struct drm_device *ddev = ldev->ddev;
+	unsigned int i;
+	int ret;
+
+	if (ldev->has_ports_node) {
+		drm_info(ddev, "Has OF graph support\n");
+		ret = lsdc_attach_output(ldev, num_crtc);
+		if (ret)
+			return ret;
+	} else {
+		drm_info(ddev, "No OF graph support\n");
+		for (i = 0; i < num_crtc; i++) {
+			ret = lsdc_create_output(ldev, i, num_crtc);
+			if (ret)
+				return ret;
+		}
+	}
+
+	for (i = 0; i < num_crtc; i++) {
+		struct lsdc_display_pipe * const dispipe = &ldev->dispipe[i];
+		struct drm_plane * const primary = &dispipe->primary;
+		struct drm_plane * const cursor = &dispipe->cursor;
+		struct drm_crtc * const crtc = &dispipe->crtc;
+		struct lsdc_pll * const pixpll = &dispipe->pixpll;
+
+		dispipe->index = i;
+
+		ret = lsdc_pixpll_init(pixpll, ddev, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_plane_init(ldev, primary, DRM_PLANE_TYPE_PRIMARY, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
+		if (ret)
+			return ret;
+
+		/*
+		 * Initial all of the CRTC available, in this way the crtc
+		 * index is equal to the hardware crtc index. That is:
+		 * display pipe 0 => crtc0 + dvo0 + encoder0
+		 * display pipe 1 => crtc1 + dvo1 + encoder1
+		 */
+		ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
+		if (ret)
+			return ret;
+
+		drm_info(ddev, "display pipe %u initialized\n", i);
+	}
+
+	return 0;
+}
+
+static int lsdc_mode_config_init(struct lsdc_device *ldev)
+{
+	const struct lsdc_chip_desc * const descp = ldev->desc;
+	struct drm_device *ddev = ldev->ddev;
+	int ret;
+
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
+
+	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
+	ddev->mode_config.min_width = 1;
+	ddev->mode_config.min_height = 1;
+	ddev->mode_config.max_width = 4096;
+	ddev->mode_config.max_height = 4096;
+	ddev->mode_config.preferred_depth = 24;
+	ddev->mode_config.prefer_shadow = ldev->use_vram_helper;
+
+	ddev->mode_config.cursor_width = descp->hw_cursor_h;
+	ddev->mode_config.cursor_height = descp->hw_cursor_h;
+
+	if (ldev->vram_base)
+		ddev->mode_config.fb_base = ldev->vram_base;
+
+	return lsdc_modeset_init(ldev, descp->num_of_crtc);
+}
+
+static void lsdc_mode_config_fini(struct drm_device *ddev)
+{
+	drm_atomic_helper_shutdown(ddev);
+
+	drm_mode_config_cleanup(ddev);
+}
+
+/*
+ * lsdc_detect_chip - a function to tell different chips apart.
+ */
+const struct lsdc_chip_desc *
+lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id * const ent)
+{
+	static const struct lsdc_match {
+		char name[128];
+		const void *data;
+	} compat[] = {
+		{ .name = "loongson,ls7a1000-dc", .data = &dc_in_ls7a1000 },
+		{ .name = "loongson,ls2k1000-dc", .data = &dc_in_ls2k1000 },
+		{ .name = "loongson,ls2k0500-dc", .data = &dc_in_ls2k0500 },
+		{ .name = "loongson,loongson64c-4core-ls7a", .data = &dc_in_ls7a1000 },
+		{ .name = "loongson,loongson64g-4core-ls7a", .data = &dc_in_ls7a1000 },
+		{ .name = "loongson,loongson64-2core-2k1000", .data = &dc_in_ls2k1000 },
+		{ .name = "loongson,loongson2k1000", .data = &dc_in_ls2k1000 },
+		{ /* sentinel */ },
+	};
+
+	struct device_node *np;
+	unsigned int i;
+
+	/* Deduce DC variant information from the DC device node */
+	for (i = 0; i < ARRAY_SIZE(compat); ++i) {
+		np = of_find_compatible_node(NULL, NULL, compat[i].name);
+		if (!np)
+			continue;
+
+		of_node_put(np);
+
+		return compat[i].data;
+	}
+
+	dev_info(&pdev->dev, "No Compatible Device Node Found\n");
+
+	if (pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL))
+		return &dc_in_ls7a1000;
+	else if (pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A05, NULL))
+		return &dc_in_ls2k1000;
+
+	return NULL;
+}
+
+static int lsdc_remove_conflicting_framebuffers(const struct drm_driver *drv)
+{
+	/* lsdc is a pci device, but it don't have a dedicate vram bar because
+	 * of historic reason. The display controller is ported from Loongson
+	 * 2H series SoC which date back to 2012.
+	 * And simplefb node may have been located anywhere in memory.
+	 */
+	return drm_aperture_remove_conflicting_framebuffers(0, ~0, false, drv);
+}
+
+static int lsdc_platform_probe(struct platform_device *pdev)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(pdev->dev.parent);
+	const struct drm_driver *driver;
+	struct drm_device *ddev;
+	int ret;
+
+	if (ldev->use_vram_helper)
+		driver = &lsdc_vram_driver_stub;
+	else
+		driver = &lsdc_drm_driver_cma_stub;
+
+	lsdc_remove_conflicting_framebuffers(driver);
+
+	ddev = drm_dev_alloc(driver, &pdev->dev);
+	if (IS_ERR(ddev))
+		return PTR_ERR(ddev);
+
+	platform_set_drvdata(pdev, ddev);
+	ldev->ddev = ddev;
+	ddev->dev_private = ldev;
+
+	if (ldev->use_vram_helper) {
+		ret = drmm_vram_helper_init(ddev, ldev->vram_base, ldev->vram_size);
+		if (ret) {
+			drm_err(ddev, "vram helper init failed: %d\n", ret);
+			goto err_kms;
+		}
+	};
+
+	ret = lsdc_mode_config_init(ldev);
+	if (ret) {
+		drm_dbg(ddev, "%s: %d\n", __func__, ret);
+		goto err_kms;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, ldev->irq,
+					lsdc_irq_handler_cb,
+					lsdc_irq_thread_cb,
+					IRQF_ONESHOT, NULL,
+					ddev);
+	if (ret) {
+		drm_err(ddev, "Failed to register lsdc interrupt\n");
+		goto err_kms;
+	}
+
+	ret = drm_vblank_init(ddev, ldev->desc->num_of_crtc);
+	if (ret)
+		goto err_kms;
+
+	drm_mode_config_reset(ddev);
+
+	drm_kms_helper_poll_init(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		goto err_poll_fini;
+
+	drm_fbdev_generic_setup(ddev, 32);
+
+	return 0;
+
+err_poll_fini:
+	drm_kms_helper_poll_fini(ddev);
+err_kms:
+	drm_dev_put(ddev);
+
+	return ret;
+}
+
+static int lsdc_platform_remove(struct platform_device *pdev)
+{
+	struct drm_device *ddev = platform_get_drvdata(pdev);
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	drm_dev_unregister(ddev);
+
+	drm_kms_helper_poll_fini(ddev);
+
+	devm_free_irq(ddev->dev, ldev->irq, ddev);
+
+	lsdc_mode_config_fini(ddev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	drm_dev_put(ddev);
+
+	return 0;
+}
+
+struct platform_driver lsdc_platform_driver = {
+	.probe = lsdc_platform_probe,
+	.remove = lsdc_platform_remove,
+	.driver = {
+		.name = "lsdc",
+	},
+};
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
new file mode 100644
index 000000000000..fb44a881840f
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_DRV_H__
+#define __LSDC_DRV_H__
+
+#include <drm/drm_print.h>
+#include <drm/drm_device.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_atomic.h>
+
+#include "lsdc_pll.h"
+
+#define LSDC_NUM_CRTC           2
+
+enum loongson_dc_family {
+	LSDC_CHIP_UNKNOWN = 0,
+	LSDC_CHIP_2K1000 = 1,  /* 2-Core Mips64r2 compatible SoC */
+	LSDC_CHIP_7A1000 = 2,  /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
+	LSDC_CHIP_2K0500 = 3,  /* Single core, reduced version of LS2K1000 */
+	LSDC_CHIP_LAST,
+};
+
+struct lsdc_chip_desc {
+	enum loongson_dc_family chip;
+	u32 num_of_crtc;
+	u32 max_pixel_clk;
+	u32 max_width;
+	u32 max_height;
+	u32 num_of_hw_cursor;
+	u32 hw_cursor_w;
+	u32 hw_cursor_h;
+	/* DMA alignment constraint (must be multiple of 256 bytes) */
+	u32 stride_alignment;
+	bool has_builtin_i2c;
+	bool has_vram;
+	bool broken_gamma;
+};
+
+/* There is only a 1:1 mapping of encoders and connectors for lsdc */
+struct lsdc_output {
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct lsdc_i2c *li2c;
+};
+
+/*
+ * struct lsdc_display_pipe - Abstraction of hardware display pipeline.
+ * @crtc: CRTC control structure
+ * @plane: Plane control structure
+ * @encoder: Encoder control structure
+ * @pixpll: Pll control structure
+ * @connector: point to connector control structure this display pipe bind
+ * @index: the index corresponding to the hardware display pipe
+ * @available: is this display pipe is available on the motherboard, The
+ *  downstream mother board manufacturer may use only one of them.
+ *  For example, LEMOTE LX-6901 board just has only one VGA output.
+ *
+ * Display pipeline with planes, crtc, pll and output collapsed into one entity.
+ */
+struct lsdc_display_pipe {
+	struct drm_crtc crtc;
+	struct drm_plane primary;
+	struct drm_plane cursor;
+	struct lsdc_pll pixpll;
+	struct lsdc_output *output;
+	int index;
+	bool available;
+};
+
+struct lsdc_crtc_state {
+	struct drm_crtc_state base;
+	struct lsdc_pll_core_values pparams;
+};
+
+struct lsdc_device {
+	struct device *dev;
+	struct drm_device *ddev;
+	/* @dc: pointer to the platform device created at runtime */
+	struct platform_device *dc;
+	/* @desc: device dependent data and feature descriptions */
+	const struct lsdc_chip_desc *desc;
+
+	/* LS7A1000 has a dediacted video RAM, typically 64 MB or more */
+	void __iomem *reg_base;
+	void __iomem *vram;
+	resource_size_t vram_base;
+	resource_size_t vram_size;
+
+	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+
+	/*
+	 * @num_output: count the number of active display pipe.
+	 */
+	unsigned int num_output;
+
+	int irq;
+	u32 irq_status;
+
+	/*
+	 * @use_vram_helper: using vram helper base solution instead of
+	 * CMA helper based solution. The DC scanout from the VRAM is
+	 * proved to be more reliable, but graphic application is may
+	 * become slow when using this driver mode.
+	 */
+	bool use_vram_helper;
+	/*
+	 * @enable_gamma: control whether hardware gamma support should be
+	 * enabled or not. It is broken though, but you can know that only
+	 * when you can enable it.
+	 */
+	bool enable_gamma;
+	/* @relax_alignment: for 800x480, 1366x768 resulotion support */
+	bool relax_alignment;
+	/* @has_ports_node: true if there are OF graph in the DT */
+	bool has_ports_node;
+};
+
+static inline struct lsdc_device *to_lsdc(struct drm_device *ddev)
+{
+	return ddev->dev_private;
+}
+
+static inline struct lsdc_crtc_state *
+to_lsdc_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct lsdc_crtc_state, base);
+}
+
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   unsigned int index,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor);
+
+int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
+		    enum drm_plane_type type, unsigned int index);
+
+const struct lsdc_chip_desc *
+lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id * const ent);
+
+extern struct platform_driver lsdc_platform_driver;
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
new file mode 100644
index 000000000000..ed50f2777d95
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <linux/i2c.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+
+#include "lsdc_regs.h"
+#include "lsdc_i2c.h"
+
+/*
+ * ls7a_gpio_i2c_set - set the state of a gpio pin, either high or low.
+ * @mask: gpio pin mask indicate which pin to set
+ */
+static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
+{
+	unsigned long flags;
+	u8 val;
+
+	spin_lock_irqsave(&li2c->reglock, flags);
+
+	if (state) {
+		/*
+		 * The high state is achieved by setting the direction as
+		 * input, because the GPIO is open drained with external
+		 * pull up resistance.
+		 */
+		val = readb(li2c->dir_reg);
+		val |= mask;
+		writeb(val, li2c->dir_reg);
+	} else {
+		/* First, set this pin as output */
+		val = readb(li2c->dir_reg);
+		val &= ~mask;
+		writeb(val, li2c->dir_reg);
+
+		/* Then, set the state to it */
+		val = readb(li2c->dat_reg);
+		val &= ~mask;
+		writeb(val, li2c->dat_reg);
+	}
+
+	spin_unlock_irqrestore(&li2c->reglock, flags);
+}
+
+/*
+ * ls7a_gpio_i2c_get - read value back from gpio pin
+ * @mask: gpio pin mask indicate which pin to read from
+ */
+static int ls7a_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
+{
+	unsigned long flags;
+	u8 val;
+
+	spin_lock_irqsave(&li2c->reglock, flags);
+
+	/* First, set this pin as input */
+	val = readb(li2c->dir_reg);
+	val |= mask;
+	writeb(val, li2c->dir_reg);
+
+	/* Then, get level state from this pin */
+	val = readb(li2c->dat_reg);
+
+	spin_unlock_irqrestore(&li2c->reglock, flags);
+
+	return (val & mask) ? 1 : 0;
+}
+
+/* set the state on the i2c->sda pin */
+static void ls7a_i2c_set_sda(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
+}
+
+/* set the state on the i2c->scl pin */
+static void ls7a_i2c_set_scl(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
+}
+
+/* read the value from the i2c->sda pin */
+static int ls7a_i2c_get_sda(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_get(li2c, li2c->sda);
+}
+
+/* read the value from the i2c->scl pin */
+static int ls7a_i2c_get_scl(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_get(li2c, li2c->scl);
+}
+
+/*
+ * Mainly for dc in ls7a1000 which have dedicated gpio hardware
+ */
+static void lsdc_of_release_i2c_adapter(void *res)
+{
+	struct lsdc_i2c *li2c = res;
+	struct i2c_adapter *adapter;
+	struct device_node *i2c_np;
+
+	adapter = &li2c->adapter;
+	i2c_np = adapter->dev.of_node;
+	if (i2c_np)
+		of_node_put(i2c_np);
+
+	i2c_del_adapter(adapter);
+
+	kfree(li2c);
+}
+
+struct lsdc_i2c *lsdc_of_create_i2c_adapter(struct device *parent,
+					    void *reg_base,
+					    struct device_node *i2c_np)
+{
+	unsigned int udelay = 5;
+	unsigned int timeout = 2200;
+	int nr = -1;
+	struct i2c_adapter *adapter;
+	struct lsdc_i2c *li2c;
+	u32 sda, scl;
+	int ret;
+
+	li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
+	if (!li2c)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&li2c->reglock);
+
+	ret = of_property_read_u32(i2c_np, "loongson,sda", &sda);
+	if (ret) {
+		dev_err(parent, "No sda pin number provided\n");
+		return ERR_PTR(ret);
+	}
+
+	ret = of_property_read_u32(i2c_np, "loongson,scl", &scl);
+	if (ret) {
+		dev_err(parent, "No scl pin number provided\n");
+		return ERR_PTR(ret);
+	}
+
+	ret = of_property_read_u32(i2c_np, "loongson,nr", &nr);
+	if (ret) {
+		int id;
+
+		if (ret == -EINVAL)
+			dev_dbg(parent, "no nr provided\n");
+
+		id = of_alias_get_id(i2c_np, "i2c");
+		if (id >= 0)
+			nr = id;
+	}
+
+	li2c->sda = 1 << sda;
+	li2c->scl = 1 << scl;
+
+	/* Optional properties which made the driver more flexible */
+	of_property_read_u32(i2c_np, "loongson,udelay", &udelay);
+	of_property_read_u32(i2c_np, "loongson,timeout", &timeout);
+
+	li2c->dir_reg = reg_base + LS7A_DC_GPIO_DIR_REG;
+	li2c->dat_reg = reg_base + LS7A_DC_GPIO_DAT_REG;
+
+	li2c->bit.setsda = ls7a_i2c_set_sda;
+	li2c->bit.setscl = ls7a_i2c_set_scl;
+	li2c->bit.getsda = ls7a_i2c_get_sda;
+	li2c->bit.getscl = ls7a_i2c_get_scl;
+	li2c->bit.udelay = udelay;
+	li2c->bit.timeout = usecs_to_jiffies(timeout);
+	li2c->bit.data = li2c;
+
+	adapter = &li2c->adapter;
+	adapter->algo_data = &li2c->bit;
+	adapter->owner = THIS_MODULE;
+	adapter->class = I2C_CLASS_DDC;
+	adapter->dev.parent = parent;
+	adapter->nr = nr;
+	adapter->dev.of_node = i2c_np;
+
+	snprintf(adapter->name, sizeof(adapter->name), "gpio-i2c-%d", nr);
+
+	i2c_set_adapdata(adapter, li2c);
+
+	ret = i2c_bit_add_numbered_bus(adapter);
+	if (ret) {
+		if (i2c_np)
+			of_node_put(i2c_np);
+
+		kfree(li2c);
+		return ERR_PTR(ret);
+	}
+
+	dev_info(parent, "sda=%u, scl=%u, nr=%d, udelay=%u, timeout=%u\n",
+		 li2c->sda, li2c->scl, nr, udelay, timeout);
+
+	ret = devm_add_action_or_reset(parent, lsdc_of_release_i2c_adapter, li2c);
+	if (ret)
+		return NULL;
+
+	return li2c;
+}
+
+static void lsdc_release_i2c_chan(struct drm_device *dev, void *res)
+{
+	struct lsdc_i2c *li2c = res;
+
+	i2c_del_adapter(&li2c->adapter);
+
+	kfree(li2c);
+}
+
+struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
+				      void *reg_base,
+				      unsigned int index)
+{
+	struct i2c_adapter *adapter;
+	struct lsdc_i2c *li2c;
+	int ret;
+
+	li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
+	if (!li2c)
+		return ERR_PTR(-ENOMEM);
+
+	if (index == 0) {
+		li2c->sda = 0x01;
+		li2c->scl = 0x02;
+	} else if (index == 1) {
+		li2c->sda = 0x04;
+		li2c->scl = 0x08;
+	}
+
+	spin_lock_init(&li2c->reglock);
+
+	li2c->dir_reg = reg_base + LS7A_DC_GPIO_DIR_REG;
+	li2c->dat_reg = reg_base + LS7A_DC_GPIO_DAT_REG;
+
+	li2c->bit.setsda = ls7a_i2c_set_sda;
+	li2c->bit.setscl = ls7a_i2c_set_scl;
+	li2c->bit.getsda = ls7a_i2c_get_sda;
+	li2c->bit.getscl = ls7a_i2c_get_scl;
+	li2c->bit.udelay = 5;
+	li2c->bit.timeout = usecs_to_jiffies(2200);
+	li2c->bit.data = li2c;
+
+	adapter = &li2c->adapter;
+	adapter->algo_data = &li2c->bit;
+	adapter->owner = THIS_MODULE;
+	adapter->class = I2C_CLASS_DDC;
+	adapter->dev.parent = ddev->dev;
+	adapter->nr = -1;
+
+	snprintf(adapter->name, sizeof(adapter->name), "gpio-i2c-%d", index);
+
+	i2c_set_adapdata(adapter, li2c);
+
+	ret = i2c_bit_add_bus(adapter);
+	if (ret) {
+		kfree(li2c);
+		return ERR_PTR(ret);
+	}
+
+	ret = drmm_add_action_or_reset(ddev, lsdc_release_i2c_chan, li2c);
+	if (ret)
+		return NULL;
+
+	return li2c;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h b/drivers/gpu/drm/loongson/lsdc_i2c.h
new file mode 100644
index 000000000000..62cbf2aaab2e
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_I2C__
+#define __LSDC_I2C__
+
+#include <linux/i2c.h>
+#include <linux/i2c-algo-bit.h>
+#include <linux/of.h>
+
+struct lsdc_i2c {
+	struct i2c_adapter adapter;
+	struct i2c_algo_bit_data bit;
+	/* @reglock: protects concurrent register access */
+	spinlock_t reglock;
+	void __iomem *dir_reg;
+	void __iomem *dat_reg;
+	/* pin bit mask */
+	u8 sda;
+	u8 scl;
+};
+
+struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
+				      void *reg_base,
+				      unsigned int index);
+
+struct lsdc_i2c *lsdc_of_create_i2c_adapter(struct device *dev,
+					    void *reg_base,
+					    struct device_node *i2c_np);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongson/lsdc_irq.c
new file mode 100644
index 000000000000..35616f976fad
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_irq.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <drm/drm_vblank.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_irq.h"
+
+/* Function to be called in a threaded interrupt context. */
+irqreturn_t lsdc_irq_thread_cb(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_crtc *crtc;
+
+	/* trigger the vblank event */
+	if (ldev->irq_status & INT_CRTC0_VS) {
+		crtc = drm_crtc_from_index(ddev, 0);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	if (ldev->irq_status & INT_CRTC1_VS) {
+		crtc = drm_crtc_from_index(ddev, 1);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	writel(INT_CRTC0_VS_EN | INT_CRTC1_VS_EN, ldev->reg_base + LSDC_INT_REG);
+
+	return IRQ_HANDLED;
+}
+
+/* Function to be called when the IRQ occurs */
+irqreturn_t lsdc_irq_handler_cb(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	/* Read & Clear the interrupt status */
+	ldev->irq_status = readl(ldev->reg_base + LSDC_INT_REG);
+	if ((ldev->irq_status & INT_STATUS_MASK) == 0) {
+		drm_warn(ddev, "no interrupt occurs\n");
+		return IRQ_NONE;
+	}
+
+	/* clear all interrupt */
+	writel(ldev->irq_status, ldev->reg_base + LSDC_INT_REG);
+
+	return IRQ_WAKE_THREAD;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.h b/drivers/gpu/drm/loongson/lsdc_irq.h
new file mode 100644
index 000000000000..528a74d9bf83
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_irq.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_IRQ_H__
+#define __LSDC_IRQ_H__
+
+irqreturn_t lsdc_irq_thread_cb(int irq, void *arg);
+irqreturn_t lsdc_irq_handler_cb(int irq, void *arg);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..32706bde5a70
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <drm/drm_of.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_bridge_connector.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_i2c.h"
+#include "lsdc_output.h"
+
+static int lsdc_get_modes(struct drm_connector *connector)
+{
+	unsigned int num = 0;
+	struct edid *edid;
+
+	if (!IS_ERR_OR_NULL(connector->ddc)) {
+		edid = drm_get_edid(connector, connector->ddc);
+		if (edid) {
+			drm_connector_update_edid_property(connector, edid);
+			num = drm_add_edid_modes(connector, edid);
+			kfree(edid);
+		}
+
+		return num;
+	}
+
+	num = drm_add_modes_noedid(connector, 1920, 1200);
+
+	drm_set_preferred_mode(connector, 1024, 768);
+
+	return num;
+}
+
+static enum drm_connector_status
+lsdc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct i2c_adapter *ddc = connector->ddc;
+
+	if (ddc && drm_probe_ddc(ddc))
+		return connector_status_connected;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+		return connector_status_connected;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DVIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_DVID ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_DVII)
+		return connector_status_disconnected;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+		return connector_status_disconnected;
+
+	return connector_status_unknown;
+}
+
+static void lsdc_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_helper_funcs lsdc_connector_helpers = {
+	.get_modes = lsdc_get_modes,
+};
+
+static const struct drm_connector_funcs lsdc_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.detect = lsdc_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = lsdc_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int lsdc_attach_bridges(struct lsdc_device *ldev,
+			       struct device_node *ports,
+			       unsigned int i)
+{
+	struct lsdc_display_pipe * const dispipe = &ldev->dispipe[i];
+	struct drm_device *ddev = ldev->ddev;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct lsdc_output *output;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(ports, i, 0, &panel, &bridge);
+
+	if (panel) {
+		bridge = devm_drm_panel_bridge_add_typed(ddev->dev, panel, DRM_MODE_CONNECTOR_DPI);
+		drm_info(ddev, "output-%u is a DPI panel\n", i);
+	}
+
+	if (!bridge)
+		return ret;
+
+	output = drmm_encoder_alloc(ddev, struct lsdc_output, encoder,
+				    NULL, DRM_MODE_ENCODER_DPI,
+				    "encoder-%u", i);
+	if (IS_ERR(output)) {
+		ret = PTR_ERR(output);
+		drm_err(ddev, "Failed to init encoder: %d\n", ret);
+		return ret;
+	}
+
+	encoder = &output->encoder;
+	encoder->possible_crtcs = BIT(i);
+
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		drm_err(ddev,
+			"failed to attach bridge %pOF for output %u (%d)\n",
+			bridge->of_node, i, ret);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(ddev, encoder);
+	if (IS_ERR(connector)) {
+		drm_err(ddev, "Unable to init connector\n");
+		return PTR_ERR(connector);
+	}
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	drm_info(ddev, "bridge-%u attached to %s\n", i, encoder->name);
+
+	dispipe->output = output;
+
+	return 0;
+}
+
+int lsdc_attach_output(struct lsdc_device *ldev, uint32_t num_crtc)
+{
+	struct drm_device *ddev = ldev->ddev;
+	struct device_node *ports;
+	struct lsdc_display_pipe *disp;
+	unsigned int i;
+	int ret;
+
+	ldev->num_output = 0;
+
+	ports = of_get_child_by_name(ldev->dev->of_node, "ports");
+
+	for (i = 0; i < num_crtc; i++) {
+		struct drm_bridge *b;
+		struct drm_panel *p;
+
+		disp = &ldev->dispipe[i];
+		disp->available = false;
+
+		ret = drm_of_find_panel_or_bridge(ports, i, 0, &p, &b);
+		if (ret) {
+			if (ret == -ENODEV) {
+				drm_dbg(ddev, "No active panel or bridge for port%u\n", i);
+				disp->available = false;
+				continue;
+			}
+
+			if (ret == -EPROBE_DEFER)
+				drm_dbg(ddev, "Bridge for port%d is defer probed\n", i);
+
+			goto RET;
+		}
+
+		disp->available = true;
+		ldev->num_output++;
+	}
+
+	if (ldev->num_output == 0) {
+		drm_err(ddev, "No valid output, abort\n");
+		ret = -ENODEV;
+		goto RET;
+	}
+
+	for (i = 0; i < num_crtc; i++) {
+		disp = &ldev->dispipe[i];
+		if (disp->available) {
+			ret = lsdc_attach_bridges(ldev, ports, i);
+			if (ret)
+				goto RET;
+		} else {
+			drm_info(ddev, "output-%u is not available\n", i);
+		}
+	}
+
+	drm_info(ddev, "number of outputs: %u\n", ldev->num_output);
+RET:
+	of_node_put(ports);
+	return ret;
+}
+
+/* No DT support, provide a minimal support */
+int lsdc_create_output(struct lsdc_device *ldev,
+		       unsigned int index,
+		       unsigned int num_crtc)
+{
+	const struct lsdc_chip_desc * const descp = ldev->desc;
+	struct lsdc_display_pipe * const dispipe = &ldev->dispipe[index];
+	struct drm_device *ddev = ldev->ddev;
+	struct lsdc_output *output;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	output = drmm_encoder_alloc(ddev, struct lsdc_output, encoder,
+				    NULL, DRM_MODE_ENCODER_DPI,
+				    "encoder-%u", index);
+	if (IS_ERR(output)) {
+		ret = PTR_ERR(output);
+		drm_err(ddev, "Failed to init encoder: %d\n", ret);
+		return ret;
+	}
+
+	encoder = &output->encoder;
+	encoder->possible_crtcs = BIT(index);
+
+	if (descp->has_builtin_i2c) {
+		output->li2c = lsdc_create_i2c_chan(ddev, ldev->reg_base, index);
+		if (IS_ERR(output->li2c)) {
+			drm_err(ddev, "Failed to create i2c adapter\n");
+			return PTR_ERR(output->li2c);
+		}
+	}
+
+	connector = &output->connector;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  &lsdc_connector_funcs,
+					  DRM_MODE_CONNECTOR_DPI,
+					  &output->li2c->adapter);
+	if (ret) {
+		drm_err(ddev, "Init connector%d failed\n", index);
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &lsdc_connector_helpers);
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	dispipe->available = true;
+	dispipe->output = output;
+	ldev->num_output++;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
new file mode 100644
index 000000000000..97ad9345ec10
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_OUTPUT_H__
+#define __LSDC_OUTPUT_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_connector.h>
+
+int lsdc_create_output(struct lsdc_device *ldev, unsigned int i, unsigned int num_crtc);
+
+int lsdc_attach_output(struct lsdc_device *ldev, uint32_t num_crtc);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_pci_drv.c b/drivers/gpu/drm/loongson/lsdc_pci_drv.c
new file mode 100644
index 000000000000..b78c62b06314
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_pci_drv.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * KMS driver for Loongson display controller
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_modeset_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_i2c.h"
+
+static int lsdc_use_vram_helper = -1;
+MODULE_PARM_DESC(use_vram_helper, "Using vram helper based driver(0 = disabled)");
+module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
+
+static int lsdc_gamma = -1;
+MODULE_PARM_DESC(gamma, "enable gamma (-1 = disabled (default), >0 = enabled)");
+module_param_named(gamma, lsdc_gamma, int, 0644);
+
+static int lsdc_relax_alignment = -1;
+MODULE_PARM_DESC(relax_alignment,
+		 "relax crtc stride alignment (-1 = disabled (default), >0 = enabled)");
+module_param_named(relax_alignment, lsdc_relax_alignment, int, 0644);
+
+#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
+#define DRIVER_NAME		"lsdc"
+#define DRIVER_DESC		"drm driver for loongson's display controller"
+#define DRIVER_DATE		"20200701"
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+static struct platform_device *
+lsdc_create_platform_device(const char *name,
+			    struct device *parent,
+			    const struct lsdc_chip_desc *descp,
+			    struct resource *res)
+{
+	struct device *dev;
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	if (!pdev) {
+		dev_err(parent, "can not create platform device\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	dev_info(parent, "platform device %s created\n", name);
+
+	dev = &pdev->dev;
+	dev->parent = parent;
+
+	if (descp) {
+		ret = platform_device_add_data(pdev, descp, sizeof(*descp));
+		if (ret) {
+			dev_err(parent, "add platform data failed: %d\n", ret);
+			goto ERROR_RET;
+		}
+	}
+
+	if (res) {
+		ret = platform_device_add_resources(pdev, res, 1);
+		if (ret) {
+			dev_err(parent, "add platform resources failed: %d\n", ret);
+			goto ERROR_RET;
+		}
+	}
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		dev_err(parent, "add platform device failed: %d\n", ret);
+		goto ERROR_RET;
+	}
+
+	return pdev;
+
+ERROR_RET:
+	platform_device_put(pdev);
+	return ERR_PTR(ret);
+}
+
+static int lsdc_vram_init(struct lsdc_device *ldev)
+{
+	struct pci_dev *gpu;
+	resource_size_t base, size;
+
+	/* BAR 2 of LS7A1000's GPU(GC1000) contain VRAM */
+	gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
+
+	if (IS_ERR_OR_NULL(gpu))
+		return -ENOENT;
+
+	base = pci_resource_start(gpu, 2);
+	size =  pci_resource_len(gpu, 2);
+
+	ldev->vram_base = base;
+	ldev->vram_size = size;
+
+	dev_info(ldev->dev, "vram start: 0x%llx, size: %uMB\n",
+		 (u64)base, (u32)(size >> 20));
+
+	return 0;
+}
+
+static void lsdc_of_probe(struct lsdc_device *ldev, struct device_node *np)
+{
+	struct device_node *ports;
+
+	if (!np) {
+		ldev->has_ports_node = false;
+		return;
+	}
+
+	ports = of_get_child_by_name(np, "ports");
+	ldev->has_ports_node = ports ? true : false;
+	of_node_put(ports);
+}
+
+static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct device *dev = &pdev->dev;
+	const struct lsdc_chip_desc *descp;
+	struct lsdc_device *ldev;
+	int ret;
+
+	descp = lsdc_detect_chip(pdev, ent);
+	if (!descp) {
+		dev_info(dev, "unknown dc ip core, abort\n");
+		return -ENOENT;
+	}
+
+	ldev = devm_kzalloc(dev, sizeof(*ldev), GFP_KERNEL);
+	if (IS_ERR(ldev))
+		return PTR_ERR(ldev);
+
+	ldev->desc = descp;
+	ldev->dev = dev;
+
+	if (lsdc_use_vram_helper > 0)
+		ldev->use_vram_helper = true;
+	else if ((lsdc_use_vram_helper < 0) && descp->has_vram)
+		ldev->use_vram_helper = true;
+	else
+		ldev->use_vram_helper = false;
+
+	if (!descp->broken_gamma)
+		ldev->enable_gamma = true;
+	else
+		ldev->enable_gamma = lsdc_gamma > 0 ? true : false;
+
+	ldev->relax_alignment = lsdc_relax_alignment > 0 ? true : false;
+
+	lsdc_of_probe(ldev, dev->of_node);
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	/* BAR 0 contains registers */
+	ldev->reg_base = devm_ioremap_resource(dev, &pdev->resource[0]);
+	if (IS_ERR(ldev->reg_base))
+		return PTR_ERR(ldev->reg_base);
+
+	/* Create GPIO emulated i2c driver as early as possible */
+	if (descp->has_builtin_i2c && ldev->has_ports_node) {
+		struct device_node *i2c_node;
+
+		for_each_compatible_node(i2c_node, NULL, "loongson,gpio-i2c") {
+			if (!of_device_is_available(i2c_node))
+				continue;
+
+			lsdc_of_create_i2c_adapter(dev, ldev->reg_base, i2c_node);
+		}
+	}
+
+	/* Get the optional framebuffer memory resource */
+	ret = of_reserved_mem_device_init(dev);
+	if (ret && (ret != -ENODEV))
+		return ret;
+
+	if (descp->has_vram && ldev->use_vram_helper) {
+		ret = lsdc_vram_init(ldev);
+		if (ret) {
+			dev_err(dev, "VRAM is unavailable\n");
+			ldev->use_vram_helper = false;
+		}
+	}
+
+	ldev->irq = pdev->irq;
+
+	dev_set_drvdata(dev, ldev);
+
+	if (descp->has_vram && ldev->use_vram_helper) {
+		struct resource res;
+
+		memset(&res, 0, sizeof(res));
+		res.flags = IORESOURCE_MEM;
+		res.name = "LS7A_VRAM";
+		res.start = ldev->vram_base;
+		res.end = ldev->vram_size;
+	}
+
+	ldev->dc = lsdc_create_platform_device("lsdc", dev, descp, NULL);
+	if (IS_ERR(ldev->dc))
+		return PTR_ERR(ldev->dc);
+
+	return platform_driver_register(&lsdc_platform_driver);
+}
+
+static void lsdc_pci_remove(struct pci_dev *pdev)
+{
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+
+	platform_device_unregister(ldev->dc);
+
+	pci_set_drvdata(pdev, NULL);
+
+	pci_clear_master(pdev);
+
+	pci_release_regions(pdev);
+}
+
+static int lsdc_drm_suspend(struct device *dev)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(ldev->ddev);
+}
+
+static int lsdc_drm_resume(struct device *dev)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(ldev->ddev);
+}
+
+static int lsdc_pm_freeze(struct device *dev)
+{
+	return lsdc_drm_suspend(dev);
+}
+
+static int lsdc_pm_thaw(struct device *dev)
+{
+	return lsdc_drm_resume(dev);
+}
+
+static int lsdc_pm_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int error;
+
+	error = lsdc_pm_freeze(dev);
+	if (error)
+		return error;
+
+	pci_save_state(pdev);
+	/* Shut down the device */
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+
+	return 0;
+}
+
+static int lsdc_pm_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (pcim_enable_device(pdev))
+		return -EIO;
+
+	pci_set_power_state(pdev, PCI_D0);
+
+	pci_restore_state(pdev);
+
+	return lsdc_pm_thaw(dev);
+}
+
+static const struct dev_pm_ops lsdc_pm_ops = {
+	.suspend = lsdc_pm_suspend,
+	.resume = lsdc_pm_resume,
+	.freeze = lsdc_pm_freeze,
+	.thaw = lsdc_pm_thaw,
+	.poweroff = lsdc_pm_freeze,
+	.restore = lsdc_pm_resume,
+};
+
+static const struct pci_device_id lsdc_pciid_list[] = {
+	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0, 0, 0, 0, 0, 0, 0}
+};
+
+static struct pci_driver lsdc_pci_driver = {
+	.name = DRIVER_NAME,
+	.id_table = lsdc_pciid_list,
+	.probe = lsdc_pci_probe,
+	.remove = lsdc_pci_remove,
+	.driver.pm = &lsdc_pm_ops,
+};
+
+static int __init lsdc_drm_init(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	if (drm_firmware_drivers_only())
+		return -EINVAL;
+
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
+		/*
+		 * Multiple video card workaround
+		 *
+		 * This integrated video card will always be selected as
+		 * default boot device by vgaarb subsystem.
+		 */
+		if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
+			pr_info("Discrete graphic card detected, abort\n");
+			return 0;
+		}
+	}
+
+	return pci_register_driver(&lsdc_pci_driver);
+}
+module_init(lsdc_drm_init);
+
+static void __exit lsdc_drm_exit(void)
+{
+	pci_unregister_driver(&lsdc_pci_driver);
+}
+module_exit(lsdc_drm_exit);
+
+MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
new file mode 100644
index 000000000000..facc76e302ff
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+
+static const u32 lsdc_primary_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static const u32 lsdc_cursor_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
+static const u64 lsdc_fb_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static void lsdc_update_fb_format(struct lsdc_device *ldev,
+				  struct drm_crtc *crtc,
+				  const struct drm_format_info *fmt_info)
+{
+	unsigned int index = drm_crtc_index(crtc);
+	u32 val = 0;
+	u32 fmt;
+
+	switch (fmt_info->format) {
+	case DRM_FORMAT_RGB565:
+		fmt = LSDC_PF_RGB565;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	default:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	}
+
+	if (index == 0) {
+		val = readl(ldev->reg_base + LSDC_CRTC0_CFG_REG);
+		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
+		writel(val, ldev->reg_base + LSDC_CRTC0_CFG_REG);
+	} else if (index == 1) {
+		val = readl(ldev->reg_base + LSDC_CRTC1_CFG_REG);
+		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
+		writel(val, ldev->reg_base + LSDC_CRTC1_CFG_REG);
+	}
+}
+
+static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
+				      struct drm_crtc *crtc,
+				      u64 paddr)
+{
+	unsigned int index = drm_crtc_index(crtc);
+	u32 lo32_addr_reg;
+	u32 hi32_addr_reg;
+	u32 cfg_reg;
+	u32 val;
+
+	/*
+	 * Find which framebuffer address register should update.
+	 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
+	 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
+	 */
+	if (index == 0) {
+		/* CRTC0 */
+		val = readl(ldev->reg_base + LSDC_CRTC0_CFG_REG);
+
+		cfg_reg = LSDC_CRTC0_CFG_REG;
+		hi32_addr_reg = LSDC_CRTC0_FB_HI_ADDR_REG;
+
+		if (val & CFG_FB_IDX_BIT)
+			lo32_addr_reg = LSDC_CRTC0_FB_ADDR0_REG;
+		else
+			lo32_addr_reg = LSDC_CRTC0_FB_ADDR1_REG;
+
+	} else if (index == 1) {
+		/* CRTC1 */
+		val = readl(ldev->reg_base + LSDC_CRTC1_CFG_REG);
+
+		cfg_reg = LSDC_CRTC1_CFG_REG;
+		hi32_addr_reg = LSDC_CRTC1_FB_HI_ADDR_REG;
+
+		if (val & CFG_FB_IDX_BIT)
+			lo32_addr_reg = LSDC_CRTC1_FB_ADDR0_REG;
+		else
+			lo32_addr_reg = LSDC_CRTC1_FB_ADDR1_REG;
+	}
+
+	drm_dbg(ldev->ddev, "crtc%u scantout from 0x%llx\n", index, paddr);
+
+	writel(paddr, ldev->reg_base + lo32_addr_reg);
+	writel(paddr >> 32, ldev->reg_base + hi32_addr_reg);
+	/*
+	 * Then, we triger the fb switch, the switch of the framebuffer
+	 * to be scanout will complete at the next vblank.
+	 */
+	writel(val | CFG_PAGE_FLIP_BIT, ldev->reg_base + cfg_reg);
+}
+
+static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
+				       struct drm_plane_state *state,
+				       unsigned int plane)
+{
+	unsigned int offset = fb->offsets[plane];
+
+	offset += fb->format->cpp[plane] * (state->src_x >> 16);
+	offset += fb->pitches[plane] * (state->src_y >> 16);
+
+	return offset;
+}
+
+static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
+{
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+
+	return gpu_addr;
+}
+
+static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	if (!crtc)
+		return 0;
+
+	return drm_atomic_helper_check_plane_state(plane_state,
+						   crtc_state,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   false, true);
+}
+
+static void lsdc_update_stride(struct lsdc_device *ldev,
+			       struct drm_crtc *crtc,
+			       unsigned int stride)
+{
+	unsigned int index = drm_crtc_index(crtc);
+
+	if (index == 0)
+		writel(stride, ldev->reg_base + LSDC_CRTC0_STRIDE_REG);
+	else if (index == 1)
+		writel(stride, ldev->reg_base + LSDC_CRTC1_STRIDE_REG);
+
+	drm_dbg(ldev->ddev, "update stride to %u\n", stride);
+}
+
+static void lsdc_primary_plane_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(plane->dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	u32 fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
+	dma_addr_t fb_addr;
+
+	if (ldev->use_vram_helper) {
+		s64 gpu_addr;
+
+		gpu_addr = lsdc_get_vram_bo_offset(fb);
+		if (gpu_addr < 0)
+			return;
+
+		fb_addr = ldev->vram_base + gpu_addr + fb_offset;
+	} else {
+		struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(fb, 0);
+
+		fb_addr = obj->paddr + fb_offset;
+	}
+
+	lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
+
+	lsdc_update_stride(ldev, crtc, fb->pitches[0]);
+
+	if (drm_atomic_crtc_needs_modeset(crtc->state))
+		lsdc_update_fb_format(ldev, crtc, fb->format);
+}
+
+static void lsdc_primary_plane_atomic_disable(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	drm_dbg(plane->dev, "%s disabled\n", plane->name);
+}
+
+static int lsdc_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *new_state)
+{
+	struct lsdc_device *ldev = to_lsdc(plane->dev);
+
+	if (ldev->use_vram_helper)
+		return drm_gem_vram_plane_helper_prepare_fb(plane, new_state);
+
+	return drm_gem_plane_helper_prepare_fb(plane, new_state);
+}
+
+static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
+				  struct drm_plane_state *old_state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	if (ldev->use_vram_helper)
+		return drm_gem_vram_plane_helper_cleanup_fb(plane, old_state);
+}
+
+static const struct drm_plane_helper_funcs lsdc_primary_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_primary_plane_atomic_check,
+	.atomic_update = lsdc_primary_plane_atomic_update,
+	.atomic_disable = lsdc_primary_plane_atomic_disable,
+};
+
+static int lsdc_cursor_atomic_check(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+
+	/* no need for further checks if the plane is being disabled */
+	if (!crtc || !fb)
+		return 0;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true,
+						  true);
+}
+
+static void lsdc_cursor_update_location(struct lsdc_device *ldev,
+					struct drm_crtc *crtc)
+{
+	u32 val;
+
+	val = readl(ldev->reg_base + LSDC_CURSOR_CFG_REG);
+
+	if ((val & CURSOR_FORMAT_MASK) == 0)
+		val |= CURSOR_FORMAT_ARGB8888;
+
+	/* Update the location of the cursor
+	 * if bit 4 of LSDC_CURSOR_CFG_REG is 1, then the cursor will be
+	 * locate at CRTC1, if bit 4 of LSDC_CURSOR_CFG_REG is 0, then
+	 * the cursor will be locate at CRTC0.
+	 */
+	if (drm_crtc_index(crtc))
+		val |= CURSOR_LOCATION_BIT;
+
+	writel(val, ldev->reg_base + LSDC_CURSOR_CFG_REG);
+}
+
+/* update the position of the cursor */
+static void lsdc_cursor_update_position(struct lsdc_device *ldev, int x, int y)
+{
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	writel((y << 16) | x, ldev->reg_base + LSDC_CURSOR_POSITION_REG);
+}
+
+static void lsdc_cursor_atomic_update(struct drm_plane *plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+
+	if (new_fb != old_fb) {
+		u64 cursor_addr;
+
+		if (ldev->use_vram_helper) {
+			s64 offset;
+
+			offset = lsdc_get_vram_bo_offset(new_fb);
+			cursor_addr = ldev->vram_base + offset;
+
+			drm_dbg_kms(ddev, "%s offset: %llx\n", plane->name, offset);
+		} else {
+			struct drm_gem_cma_object *cursor_obj;
+
+			cursor_obj = drm_fb_cma_get_gem_obj(new_fb, 0);
+			if (!cursor_obj)
+				return;
+
+			cursor_addr = cursor_obj->paddr;
+		}
+
+		writel(cursor_addr, ldev->reg_base + LSDC_CURSOR_ADDR_REG);
+	}
+
+	lsdc_cursor_update_position(ldev, new_plane_state->crtc_x, new_plane_state->crtc_y);
+
+	lsdc_cursor_update_location(ldev, new_plane_state->crtc);
+}
+
+static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	writel(0, ldev->reg_base + LSDC_CURSOR_CFG_REG);
+
+	drm_dbg(ddev, "%s disabled\n", plane->name);
+}
+
+static const struct drm_plane_helper_funcs lsdc_cursor_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_cursor_atomic_check,
+	.atomic_update = lsdc_cursor_atomic_update,
+	.atomic_disable = lsdc_cursor_atomic_disable,
+};
+
+static int lsdc_plane_get_default_zpos(enum drm_plane_type type)
+{
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		return 0;
+	case DRM_PLANE_TYPE_OVERLAY:
+		return 1;
+	case DRM_PLANE_TYPE_CURSOR:
+		return 7;
+	}
+	return 0;
+}
+
+static void lsdc_plane_reset(struct drm_plane *plane)
+{
+	drm_atomic_helper_plane_reset(plane);
+
+	plane->state->zpos = lsdc_plane_get_default_zpos(plane->type);
+
+	drm_dbg(plane->dev, "%s reset\n", plane->name);
+}
+
+static const struct drm_plane_funcs lsdc_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = lsdc_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+int lsdc_plane_init(struct lsdc_device *ldev,
+		    struct drm_plane *plane,
+		    enum drm_plane_type type,
+		    unsigned int index)
+{
+	struct drm_device *ddev = ldev->ddev;
+	int zpos = lsdc_plane_get_default_zpos(type);
+	unsigned int format_count;
+	const u32 *formats;
+	const char *name;
+	int ret;
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		formats = lsdc_primary_formats;
+		format_count = ARRAY_SIZE(lsdc_primary_formats);
+		name = "primary-%u";
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		formats = lsdc_cursor_formats;
+		format_count = ARRAY_SIZE(lsdc_cursor_formats);
+		name = "cursor-%u";
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_err(ddev, "overlay plane is not supported\n");
+		break;
+	}
+
+	ret = drm_universal_plane_init(ddev, plane, 1 << index,
+				       &lsdc_plane_funcs,
+				       formats, format_count,
+				       lsdc_fb_format_modifiers,
+				       type, name, index);
+	if (ret) {
+		drm_err(ddev, "%s failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		drm_plane_helper_add(plane, &lsdc_primary_plane_helpers);
+		drm_plane_create_zpos_property(plane, zpos, 0, 6);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		drm_plane_helper_add(plane, &lsdc_cursor_plane_helpers);
+		drm_plane_create_zpos_immutable_property(plane, zpos);
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_err(ddev, "overlay plane is not supported\n");
+		break;
+	}
+
+	drm_plane_create_alpha_property(plane);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_pll.c b/drivers/gpu/drm/loongson/lsdc_pll.c
new file mode 100644
index 000000000000..0ed2edf51b9a
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_pll.c
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+/*
+ * The structure of the pixel PLL register is evolved with times.
+ * All loongson's cpu is little endian.
+ */
+
+/* u64 */
+struct ls7a1000_pixpll_bitmap {
+	/* Byte 0 ~ Byte 3 */
+	unsigned div_out      : 7;   /*  0 : 6     output clock divider  */
+	unsigned reserved_1   : 14;  /*  7 : 20                          */
+	unsigned loopc        : 9;   /* 21 : 29                          */
+	unsigned reserved_2   : 2;   /* 30 : 31                          */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned div_ref      : 7;   /*  0 : 6     input clock divider   */
+	unsigned locked       : 1;   /*  7         PLL locked flag       */
+	unsigned sel_out      : 1;   /*  8         output clk selector   */
+	unsigned reserved_3   : 2;   /*  9 : 10    reserved              */
+	unsigned set_param    : 1;   /*  11        set pll param         */
+	unsigned bypass       : 1;   /*  12                              */
+	unsigned powerdown    : 1;   /*  13                              */
+	unsigned reserved_4   : 18;  /*  14 : 31                         */
+};
+
+/* u128 */
+struct ls2k1000_pixpll_bitmap {
+	/* Byte 0 ~ Byte 3 */
+	unsigned sel_out      :  1;  /*  0      select this PLL          */
+	unsigned reserved_1   :  1;  /*  1                               */
+	unsigned sw_adj_en    :  1;  /*  2      allow software adjust    */
+	unsigned bypass       :  1;  /*  3      bypass L1 PLL            */
+	unsigned reserved_2   :  3;  /*  4:6                             */
+	unsigned lock_en      :  1;  /*  7      enable lock L1 PLL       */
+	unsigned reserved_3   :  2;  /*  8:9                             */
+	unsigned lock_check   :  2;  /* 10:11   precision check          */
+	unsigned reserved_4   :  4;  /* 12:15                            */
+
+	unsigned locked       :  1;  /* 16      PLL locked flag bit      */
+	unsigned reserved_5   :  2;  /* 17:18                            */
+	unsigned powerdown    :  1;  /* 19      powerdown the pll if set */
+	unsigned reserved_6   :  6;  /* 20:25                            */
+	unsigned div_ref      :  6;  /* 26:31   L1 Prescaler             */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned loopc        : 10;  /* 32:41   Clock Multiplier         */
+	unsigned l1_div       :  6;  /* 42:47   not used                 */
+	unsigned reserved_7   : 16;  /* 48:63                            */
+
+	/* Byte 8 ~ Byte 15 */
+	unsigned div_out      :  6;  /* 0 : 5   output clock divider     */
+	unsigned reserved_8   : 26;  /* 6 : 31                           */
+	unsigned reserved_9   : 32;  /* 70: 127                          */
+};
+
+/* u32 */
+struct ls2k0500_pixpll_bitmap {
+	/* Byte 0 ~ Byte 1 */
+	unsigned sel_out      : 1;
+	unsigned reserved_1   : 2;
+	unsigned sw_adj_en    : 1;   /* allow software adjust              */
+	unsigned bypass       : 1;   /* bypass L1 PLL                      */
+	unsigned powerdown    : 1;   /* write 1 to powerdown the PLL       */
+	unsigned reserved_2   : 1;
+	unsigned locked       : 1;   /*  7     Is L1 PLL locked, read only */
+	unsigned div_ref      : 6;   /*  8:13  ref clock divider           */
+	unsigned reserved_3   : 2;   /* 14:15                              */
+	/* Byte 2 ~ Byte 3 */
+	unsigned loopc        : 8;   /* 16:23   Clock Multiplier           */
+	unsigned div_out      : 6;   /* 24:29   output clock divider       */
+	unsigned reserved_4   : 2;   /* 30:31                              */
+};
+
+union lsdc_pixpll_bitmap {
+	struct ls7a1000_pixpll_bitmap ls7a1000;
+	struct ls2k1000_pixpll_bitmap ls2k1000;
+	struct ls2k0500_pixpll_bitmap ls2k0500;
+
+	u32 dword[4];
+};
+
+struct pixclk_to_pll_parm {
+	/* kHz */
+	unsigned int clock;
+
+	/* unrelated information */
+	unsigned short width;
+	unsigned short height;
+	unsigned short vrefresh;
+
+	/* Stores parameters for programming the Hardware PLLs */
+	unsigned short div_out;
+	unsigned short loopc;
+	unsigned short div_ref;
+};
+
+/*
+ * Pixel clock to PLL parameters translation table.
+ * Small static cached value to speed up PLL parameters calculation.
+ */
+static const struct pixclk_to_pll_parm pll_param_table[] = {
+	{148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
+						/* 1920x1080@50Hz */
+	{174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
+	{181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
+	{146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
+	{135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
+
+	{108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz  */
+						/* 1280x1024@60Hz */
+						/* 1280x960@60Hz */
+						/* 1152x864@75Hz */
+
+	{106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
+	{88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
+	{83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
+	{71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
+
+	{74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
+						/* 1280x720@50Hz */
+
+	{78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
+	{75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
+	{65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
+
+	{51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
+
+	{57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
+	{49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
+	{50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
+	{40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
+	{36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
+	{31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
+						/* 640x480@73Hz */
+
+	{30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
+	{27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
+	{25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
+	{25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
+						/* 720x480@60Hz */
+};
+
+/**
+ * lsdc_pixpll_setup - ioremap the device dependent PLL registers
+ *
+ * @this: point to the object which this function is called from
+ */
+static int lsdc_pixpll_setup(struct lsdc_pll * const this)
+{
+	this->mmio = ioremap(this->reg_base, this->reg_size);
+
+	return 0;
+}
+
+/*
+ * Find a set of pll parameters (to generate pixel clock) from a static
+ * local table, which avoid to compute the pll parameter eachtime a
+ * modeset is triggered.
+ *
+ * @this: point to the object which this function is called from
+ * @clock: the desired output pixel clock, the unit is kHz
+ * @pout: point to where the parameters to store if found
+ *
+ *  Return true if hit, otherwise return false.
+ */
+static bool lsdc_pixpll_find(struct lsdc_pll * const this,
+			     unsigned int clock,
+			     struct lsdc_pll_core_values * const pout)
+{
+	unsigned int num = ARRAY_SIZE(pll_param_table);
+	unsigned int i;
+
+	for (i = 0; i < num; i++) {
+		if (clock != pll_param_table[i].clock)
+			continue;
+
+		pout->div_ref = pll_param_table[i].div_ref;
+		pout->loopc   = pll_param_table[i].loopc;
+		pout->div_out = pll_param_table[i].div_out;
+
+		return true;
+	}
+
+	drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
+
+	return false;
+}
+
+/*
+ * Find a set of pll parameters which have minimal difference with the desired
+ * pixel clock frequency. It does that by computing all of the possible
+ * combination. Compute the diff and find the combination with minimal diff.
+ *
+ *  clock_out = refclk / div_ref * loopc / div_out
+ *
+ *  refclk is fixed as 100MHz in ls7a1000, ls2k1000 and ls2k0500
+ *
+ * @this: point to the object from which this function is called
+ * @clk: the desired output pixel clock, the unit is kHz
+ * @pout: point to where the parameters to store if success
+ *
+ *  Return true if a parameter is found, otherwise return false
+ */
+static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
+				unsigned int clk,
+				struct lsdc_pll_core_values *pout)
+{
+	unsigned int refclk = this->ref_clock;
+	const unsigned int tolerance = 1000;
+	unsigned int min = tolerance;
+	unsigned int div_out, loopc, div_ref;
+
+	if (lsdc_pixpll_find(this, clk, pout))
+		return true;
+
+	for (div_out = 6; div_out < 64; div_out++) {
+		for (div_ref = 3; div_ref < 6; div_ref++) {
+			for (loopc = 6; loopc < 161; loopc++) {
+				int diff;
+
+				if (loopc < 12 * div_ref)
+					continue;
+				if (loopc > 32 * div_ref)
+					continue;
+
+				diff = clk * div_out - refclk * loopc / div_ref;
+
+				if (diff < 0)
+					diff = -diff;
+
+				if (diff < min) {
+					min = diff;
+					pout->div_ref = div_ref;
+					pout->div_out = div_out;
+					pout->loopc = loopc;
+
+					if (diff == 0)
+						return true;
+				}
+			}
+		}
+	}
+
+	return min < tolerance;
+}
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls7a1000
+ *
+ * @this: point to the object from which this function is called
+ * @param: point to the core parameters passed in
+ *
+ * return 0 if successful.
+ */
+static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
+					struct lsdc_pll_core_values const *param)
+{
+	void __iomem *reg = this->mmio;
+	unsigned int counter = 0;
+	bool locked;
+	u32 val;
+
+	/* Bypass the software configured PLL, using refclk directly */
+	val = readl(reg + 0x4);
+	val &= ~(1 << 8);
+	writel(val, reg + 0x4);
+
+	/* Powerdown the PLL */
+	val = readl(reg + 0x4);
+	val |= (1 << 13);
+	writel(val, reg + 0x4);
+
+	/* Clear the pll parameters */
+	val = readl(reg + 0x4);
+	val &= ~(1 << 11);
+	writel(val, reg + 0x4);
+
+	/* clear old value & config new value */
+	val = readl(reg + 0x04);
+	val &= ~0x7F;
+	val |= param->div_ref;        /* div_ref */
+	writel(val, reg + 0x4);
+
+	val = readl(reg);
+	val &= ~0x7f;
+	val |= param->div_out;        /* div_out */
+
+	val &= ~(0x1ff << 21);
+	val |= param->loopc << 21;    /* loopc */
+	writel(val, reg);
+
+	/* Set the pll the parameters */
+	val = readl(reg + 0x4);
+	val |= (1 << 11);
+	writel(val, reg + 0x4);
+
+	/* Powerup the PLL */
+	val = readl(reg + 0x4);
+	val &= ~(1 << 13);
+	writel(val, reg + 0x4);
+
+	/* Wait the PLL lock */
+	do {
+		val = readl(reg + 0x4);
+		locked = val & 0x80;
+		counter++;
+	} while (!locked && (counter < 10000));
+
+	drm_dbg(this->ddev, "%u loop waited\n", counter);
+
+	/* Switch to the software configured pll */
+	val = readl(reg + 0x4);
+	val |= (1UL << 8);
+	writel(val, reg + 0x4);
+
+	return 0;
+}
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls2k1000
+ *
+ * @this: point to the object from which this function is called
+ * @param: pointer to where the parameter is passed in
+ *
+ * return 0 if successful.
+ */
+static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
+					struct lsdc_pll_core_values const *param)
+{
+	void __iomem *reg = this->mmio;
+	unsigned int counter = 0;
+	bool locked = false;
+	u32 val;
+
+	val = readl(reg);
+	/* Bypass the software configured PLL, using refclk directly */
+	val &= ~(1 << 0);
+	writel(val, reg);
+
+	/* Powerdown the PLL */
+	val |= (1 << 19);
+	writel(val, reg);
+
+	/* Allow the software configuration */
+	val &= ~(1 << 2);
+	writel(val, reg);
+
+	/* allow L1 PLL lock */
+	val = (1L << 7) | (3L << 10);
+	writel(val, reg);
+
+	/* clear div_ref bit field */
+	val &= ~(0x3f << 26);
+	/* set div_ref bit field */
+	val = val | (param->div_ref << 26);
+	writel(val, reg);
+
+	val = readl(reg + 4);
+	/* clear loopc bit field */
+	val &= ~0x0fff;
+	/* set loopc bit field */
+	val |= param->loopc;
+	writel(val, reg + 4);
+
+	/* set div_out */
+	writel(param->div_out, reg + 8);
+
+	val = readl(reg);
+	/* use the software configure param */
+	val |= (1 << 2);
+	/* powerup the PLL */
+	val &= ~(1 << 19);
+	writel(val, reg);
+
+	/* wait pll setup and locked */
+	do {
+		val = readl(reg);
+		locked = val & 0x10000;
+		counter++;
+	} while (!locked && (counter < 10000));
+
+	drm_dbg(this->ddev, "%u loop waited\n", counter);
+
+	/* Switch to the above software configured PLL instead of refclk */
+	val |= 1;
+	writel(val, reg);
+
+	return 0;
+}
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls2k0500
+ *
+ * @this: point to the object which calling this function
+ * @param: pointer to where the parameters passed in
+ *
+ * return 0 if successful.
+ */
+static int ls2k0500_pixpll_param_update(struct lsdc_pll * const this,
+					struct lsdc_pll_core_values const *param)
+{
+	void __iomem *reg = this->mmio;
+	unsigned int counter = 0;
+	bool locked = false;
+	u32 val;
+
+	/* Bypass the software configured PLL, using refclk directly */
+	val = readl(reg);
+	val &= ~(1 << 0);
+	writel(val, reg);
+
+	/* Powerdown the PLL */
+	val = readl(reg);
+	val |= (1 << 5);
+	writel(val, reg);
+
+	/* Allow the software configuration */
+	val |= (1 << 3);
+	writel(val, reg);
+
+	/* Update the pll params */
+	val = (param->div_out << 24) |
+	      (param->loopc << 16) |
+	      (param->div_ref << 8);
+
+	writel(val, reg);
+
+	/* Powerup the PLL */
+	val = readl(reg);
+	val &= ~(1 << 5);
+	writel(val, reg);
+
+	/* wait pll setup and locked */
+	do {
+		val = readl(reg);
+		locked = val & 0x80;
+		counter++;
+	} while (!locked && (counter < 10000));
+
+	drm_dbg(this->ddev, "%u loop waited\n", counter);
+
+	/* Switch to the above software configured PLL instead of refclk */
+	writel((val | 1), reg);
+
+	return 0;
+}
+
+static unsigned int lsdc_get_clock_rate(struct lsdc_pll * const this,
+					struct lsdc_pll_core_values *pout)
+{
+	struct drm_device *ddev = this->ddev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc * const desc = ldev->desc;
+	unsigned int out;
+	union lsdc_pixpll_bitmap parms;
+
+	if (desc->chip == LSDC_CHIP_7A1000) {
+		struct ls7a1000_pixpll_bitmap *obj = &parms.ls7a1000;
+
+		parms.dword[0] = readl(this->mmio);
+		parms.dword[1] = readl(this->mmio + 4);
+		out = this->ref_clock / obj->div_ref * obj->loopc / obj->div_out;
+		if (pout) {
+			pout->div_ref = obj->div_ref;
+			pout->loopc = obj->loopc;
+			pout->div_out = obj->div_out;
+		}
+	} else if (desc->chip == LSDC_CHIP_2K1000) {
+		struct ls2k1000_pixpll_bitmap *obj = &parms.ls2k1000;
+
+		parms.dword[0] = readl(this->mmio);
+		parms.dword[1] = readl(this->mmio + 4);
+		parms.dword[2] = readl(this->mmio + 8);
+		parms.dword[3] = readl(this->mmio + 12);
+		out = this->ref_clock / obj->div_ref * obj->loopc / obj->div_out;
+		if (pout) {
+			pout->div_ref = obj->div_ref;
+			pout->loopc = obj->loopc;
+			pout->div_out = obj->div_out;
+		}
+	} else if (desc->chip == LSDC_CHIP_2K0500) {
+		struct ls2k0500_pixpll_bitmap *obj = &parms.ls2k0500;
+
+		parms.dword[0] = readl(this->mmio);
+		out = this->ref_clock / obj->div_ref * obj->loopc / obj->div_out;
+		if (pout) {
+			pout->div_ref = obj->div_ref;
+			pout->loopc = obj->loopc;
+			pout->div_out = obj->div_out;
+		}
+	} else {
+		drm_err(ddev, "unknown chip, the driver need update\n");
+		return 0;
+	}
+
+	return out;
+}
+
+static const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls7a1000_pixpll_param_update,
+	.get_clock_rate = lsdc_get_clock_rate,
+};
+
+static const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls2k1000_pixpll_param_update,
+	.get_clock_rate = lsdc_get_clock_rate,
+};
+
+static const struct lsdc_pixpll_funcs ls2k0500_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls2k0500_pixpll_param_update,
+	.get_clock_rate = lsdc_get_clock_rate,
+};
+
+int lsdc_pixpll_init(struct lsdc_pll * const this,
+		     struct drm_device *ddev,
+		     unsigned int index)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc * const descp = ldev->desc;
+
+	this->ddev = ddev;
+	this->index = index;
+	this->ref_clock = LSDC_PLL_REF_CLK;
+
+	if (descp->chip == LSDC_CHIP_7A1000) {
+		if (index == 0)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL1_REG;
+		this->reg_size = 8;
+		this->funcs = &ls7a1000_pixpll_funcs;
+	} else if (descp->chip == LSDC_CHIP_2K1000) {
+		if (index == 0)
+			this->reg_base = LS2K1000_CFG_REG_BASE + LS2K1000_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS2K1000_CFG_REG_BASE + LS2K1000_PIX_PLL1_REG;
+
+		this->reg_size = 16;
+		this->funcs = &ls2k1000_pixpll_funcs;
+	} else if (descp->chip == LSDC_CHIP_2K0500) {
+		if (index == 0)
+			this->reg_base = LS2K0500_CFG_REG_BASE + LS2K0500_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS2K0500_CFG_REG_BASE + LS2K0500_PIX_PLL1_REG;
+
+		this->reg_size = 4;
+		this->funcs = &ls2k0500_pixpll_funcs;
+	} else {
+		drm_err(this->ddev, "unknown chip, the driver need update\n");
+		return -ENOENT;
+	}
+
+	return this->funcs->setup(this);
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_pll.h b/drivers/gpu/drm/loongson/lsdc_pll.h
new file mode 100644
index 000000000000..2b9101f56097
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_pll.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_PLL_H__
+#define __LSDC_PLL_H__
+
+#include <drm/drm_device.h>
+
+/*
+ * PIXEL PLL hardware structure
+ *
+ * refclk: reference frequency, 100 MHz from external oscillator
+ * outclk: output frequency desired.
+ *
+ *
+ *               L1       Fref                      Fvco     L2
+ * refclk   +-----------+      +------------------+      +---------+   outclk
+ * ---+---> | Prescaler | ---> | Clock Multiplier | ---> | divider | -------->
+ *    |     +-----------+      +------------------+      +---------+     ^
+ *    |           ^                      ^                    ^          |
+ *    |           |                      |                    |          |
+ *    |           |                      |                    |          |
+ *    |        div_ref                 loopc               div_out       |
+ *    |                                                                  |
+ *    +---- sel_out (bypass above software configurable clock if==1) ----+
+ *
+ *  sel_out: PLL clock output selector.
+ *
+ *  If sel_out == 1, it will take refclk as output directly,
+ *  the L1 Prescaler and the out divider is bypassed.
+ *
+ *  If sel_out == 0, then:
+ *  outclk = refclk / div_ref * loopc / div_out;
+ *
+ * PLL hardware working requirements:
+ *
+ *  1) 20 MHz <= refclk / div_ref <= 40Mhz
+ *  2) 1.2 GHz <= refclk /div_out * loopc <= 3.2 Ghz
+ *
+ */
+
+struct lsdc_pll_core_values {
+	unsigned int div_ref;
+	unsigned int loopc;
+	unsigned int div_out;
+};
+
+struct lsdc_pll;
+
+struct lsdc_pixpll_funcs {
+	int (*setup)(struct lsdc_pll * const this);
+	bool (*compute)(struct lsdc_pll * const this, unsigned int clock,
+			struct lsdc_pll_core_values *params_out);
+	int (*update)(struct lsdc_pll * const this,
+		      struct lsdc_pll_core_values const *params_in);
+	unsigned int (*get_clock_rate)(struct lsdc_pll * const this,
+				       struct lsdc_pll_core_values *pout);
+};
+
+struct lsdc_pll {
+	const struct lsdc_pixpll_funcs *funcs;
+	struct drm_device *ddev;
+	void __iomem *mmio;
+
+	/* PLL register offset */
+	u32 reg_base;
+	/* PLL register size in bytes */
+	u32 reg_size;
+
+	/* 100000kHz, fixed on all board found */
+	unsigned int ref_clock;
+
+	unsigned int index;
+};
+
+int lsdc_pixpll_init(struct lsdc_pll * const this,
+		     struct drm_device *ddev,
+		     unsigned int index);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_regs.h b/drivers/gpu/drm/loongson/lsdc_regs.h
new file mode 100644
index 000000000000..ea2d67055fbc
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_regs.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Loongson Corporation
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_REGS_H__
+#define __LSDC_REGS_H__
+
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+/*
+ * PIXEL PLL
+ */
+#define LSDC_PLL_REF_CLK                100000           /* kHz */
+
+/*
+ * Those PLL registers are not located at DC reg bar space,
+ * there are relative to LSXXXXX_CFG_REG_BASE.
+ * XXXXX = 7A1000, 2K1000, 2K0500
+ */
+
+/* LS2K1000 */
+#define LS2K1000_PIX_PLL0_REG           0x04B0
+#define LS2K1000_PIX_PLL1_REG           0x04C0
+#define LS2K1000_CFG_REG_BASE           0x1fe10000
+
+/* LS7A1000 */
+#define LS7A1000_PIX_PLL0_REG           0x04B0
+#define LS7A1000_PIX_PLL1_REG           0x04C0
+#define LS7A1000_CFG_REG_BASE           0x10010000
+
+/* LS2K0500 */
+#define LS2K0500_PIX_PLL0_REG           0x0418
+#define LS2K0500_PIX_PLL1_REG           0x0420
+#define LS2K0500_CFG_REG_BASE           0x1fe10000
+
+/*
+ *  CRTC CFG REG
+ */
+#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
+
+enum lsdc_pixel_format {
+	LSDC_PF_NONE = 0,
+	LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
+	LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits [16 bits] */
+	LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
+	LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
+};
+
+/* Each CRTC has two FB address registers, CFG_FB_IDX_BIT specify
+ * which fb address register is currently in using by the CRTC.
+ * Setting CFG_PAGE_FLIP_BIT bit will triger the switch. The switch
+ * finished at the vblank and if you want switch back you can set
+ * CFG_PAGE_FLIP_BIT again.
+ */
+#define CFG_PAGE_FLIP_BIT               BIT(7)
+#define CFG_OUTPUT_EN_BIT               BIT(8)
+/* CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using hardware logic */
+#define CFG_PANEL_SWITCH                BIT(9)
+/* Indicate witch fb addr reg is in using, currently */
+#define CFG_FB_IDX_BIT                  BIT(11)
+#define CFG_GAMMAR_EN_BIT               BIT(12)
+
+/* CRTC get soft reset if voltage level change from 1 -> 0 */
+#define CFG_RESET_BIT                   BIT(20)
+
+#define EN_HSYNC_BIT                    BIT(30)
+#define INV_HSYNC_BIT                   BIT(31)
+#define EN_VSYNC_BIT                    BIT(30)
+#define INV_VSYNC_BIT                   BIT(31)
+
+/******** CRTC0 & DVO0 ********/
+#define LSDC_CRTC0_CFG_REG              0x1240
+#define LSDC_CRTC0_FB_ADDR0_REG         0x1260
+#define LSDC_CRTC0_FB_ADDR1_REG         0x1580
+#define LSDC_CRTC0_FB_HI_ADDR_REG       0x15A0
+#define LSDC_CRTC0_STRIDE_REG           0x1280
+#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
+#define LSDC_CRTC0_HDISPLAY_REG         0x1400
+#define LSDC_CRTC0_HSYNC_REG            0x1420
+#define LSDC_CRTC0_VDISPLAY_REG         0x1480
+#define LSDC_CRTC0_VSYNC_REG            0x14A0
+#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
+#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
+
+/******** CTRC1 & DVO1 ********/
+#define LSDC_CRTC1_CFG_REG              0x1250
+#define LSDC_CRTC1_FB_ADDR0_REG         0x1270
+#define LSDC_CRTC1_FB_ADDR1_REG         0x1590
+#define LSDC_CRTC1_FB_HI_ADDR_REG       0x15C0
+#define LSDC_CRTC1_STRIDE_REG           0x1290
+#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
+#define LSDC_CRTC1_HDISPLAY_REG         0x1410
+#define LSDC_CRTC1_HSYNC_REG            0x1430
+#define LSDC_CRTC1_VDISPLAY_REG         0x1490
+#define LSDC_CRTC1_VSYNC_REG            0x14B0
+#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
+#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
+
+#define LSDC_REGS_OFFSET                0x0010
+
+/*
+ * Hardware cursor
+ * There is only one hardware cursor shared by two CRTC in ls7a1000,
+ * ls2k1000 and ls2k0500.
+ */
+#define LSDC_CURSOR_CFG_REG             0x1520
+
+#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
+#define CURSOR_FORMAT_DISABLE           0
+#define CURSOR_FORMAT_MONOCHROME        BIT(0)
+#define CURSOR_FORMAT_ARGB8888          BIT(1)
+#define CURSOR_LOCATION_BIT             BIT(4)
+
+#define LSDC_CURSOR_ADDR_REG            0x1530
+#define LSDC_CURSOR_POSITION_REG        0x1540
+#define LSDC_CURSOR_BG_COLOR_REG        0x1550  /* background color */
+#define LSDC_CURSOR_FG_COLOR_REG        0x1560  /* foreground color */
+
+#define CUR_WIDTH_SIZE                  32
+#define CUR_HEIGHT_SIZE                 32
+
+#define LSDC_CURS_MIN_SIZE              1
+#define LSDC_CURS_MAX_SIZE              64
+
+/*
+ * DC Interrupt Control Register, 32bit, Address Offset: 1570
+ *
+ * Bits  0:10 inidicate the interrupt type, read only
+ * Bits 16:26 control if the specific interrupt corresponding to bit 0~10
+ * is enabled or not. Write 1 to enable, write 0 to disable
+ *
+ * RF: Read Finished
+ * IDBU : Internal Data Buffer Underflow
+ * IDBFU : Internal Data Buffer Fatal Underflow
+ *
+ *
+ * +-------+-------------------------------+-------+--------+--------+-------+
+ * | 31:27 |            26:16              | 15:11 |   10   |   9    |   8   |
+ * +-------+-------------------------------+-------+--------+--------+-------+
+ * |  N/A  | Interrupt Enable Control Bits |  N/A  | IDBFU0 | IDBFU1 | IDBU0 |
+ * +-------+-------------------------------+-------+--------+--------+-------+
+ *
+ * Bit 4 is cursor buffer read finished, no use.
+ *
+ * +-------+-----+-----+-----+--------+--------+--------+--------+
+ * |   7   |  6  |  5  |  4  |   3    |   2    |   1    |   0    |
+ * +-------+-----+-----+-----+--------+--------+--------+--------+
+ * | IDBU1 | RF0 | RF1 |     | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
+ * +-------+-----+-----+-----+--------+--------+--------+--------+
+ *
+ */
+
+#define LSDC_INT_REG                           0x1570
+
+#define INT_CRTC0_VS                           BIT(2)
+#define INT_CRTC0_HS                           BIT(3)
+#define INT_CRTC0_RF                           BIT(6)
+#define INT_CRTC0_IDBU                         BIT(8)
+#define INT_CRTC0_IDBFU                        BIT(10)
+
+#define INT_CURSOR_RF                          BIT(4)
+
+#define INT_CRTC1_VS                           BIT(0)
+#define INT_CRTC1_HS                           BIT(1)
+#define INT_CRTC1_RF                           BIT(5)
+#define INT_CRTC1_IDBU                         BIT(7)
+#define INT_CRTC1_IDBFU                        BIT(9)
+
+#define INT_CRTC0_VS_EN                        BIT(18)
+#define INT_CRTC0_HS_EN                        BIT(19)
+#define INT_CRTC0_RF_EN                        BIT(22)
+#define INT_CRTC0_IDBU_EN                      BIT(24)
+#define INT_CRTC0_IDBFU_EN                     BIT(26)
+
+#define INT_CURSOR_RF_EN                       BIT(20)
+
+#define INT_CRTC1_VS_EN                        BIT(16)
+#define INT_CRTC1_HS_EN                        BIT(17)
+#define INT_CRTC1_RF_EN                        BIT(21)
+#define INT_CRTC1_IDBU_EN                      BIT(23)
+#define INT_CRTC1_IDBFU_EN                     BIT(25)
+
+#define INT_STATUS_MASK                        GENMASK(10, 0)
+
+/*
+ * LS7A1000 have 4 gpios which is under control of the LS7A_DC_GPIO_DAT_REG
+ * and LS7A_DC_GPIO_DIR_REG register, it has no relationship whth the general
+ * GPIO hardware. Those registers are in the DC register space on LS7A1000.
+ *
+ * Those GPIOs are used to emulated I2C, for reading edid and monitor detection
+ *
+ * LS2k1000 and LS2K0500 don't have those registers, they use hardware i2c or
+ * generial GPIO emulated i2c from other module.
+ *
+ * GPIO data register
+ *  Address offset: 0x1650
+ *   +---------------+-----------+-----------+
+ *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
+ *   +---------------+-----------+-----------+
+ *   |               |    DVO1   |    DVO0   |
+ *   +      N/A      +-----------+-----------+
+ *   |               | SCL | SDA | SCL | SDA |
+ *   +---------------+-----------+-----------+
+ */
+#define LS7A_DC_GPIO_DAT_REG                   0x1650
+
+/*
+ *  GPIO Input/Output direction control register
+ *  Address offset: 0x1660
+ *  write 1 for Input, 0 for Output.
+ */
+#define LS7A_DC_GPIO_DIR_REG                   0x1660
+
+#endif
-- 
2.25.1

