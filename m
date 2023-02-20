Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54069D15A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DAB10E075;
	Mon, 20 Feb 2023 16:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DA8710E075
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 16:31:13 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:59826.1304175949
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 276C31001C9;
 Tue, 21 Feb 2023 00:31:08 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-jn5ln with ESMTP id
 66ebf2e599bb4f8980f9da2048227fc9 for maarten.lankhorst@linux.intel.com; 
 Tue, 21 Feb 2023 00:31:10 CST
X-Transaction-ID: 66ebf2e599bb4f8980f9da2048227fc9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: suijingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v3] drm: add kms driver for loongson display controller
Date: Tue, 21 Feb 2023 00:31:04 +0800
Message-Id: <20230220163104.4647-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: suijingfeng <suijingfeng@loongson.cn>

Loongson display controller IP has been integrated in both Loongson
North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
and ls2k2000 etc), it even been included in Loongson BMC products.

The display controller is a PCI device, it has two display pipe.
For the DC in LS7A1000 and LS2K1000 each way has a DVO output interface
which provide RGB888 signals, vertical & horizontal synchronisations,
and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
the maximum resolution is 2048x2048 according to the hardware spec.

For the DC in LS7A2000, each display pipe is equipped with a built-in
HDMI encoder which is compliant with HDMI 1.4 specification. Thus it
support 3840x2160@30Hz. The first display pipe is also equipped with
a transparent vga encoder which is parallel with the HDMI encoder.
The DC in LS7A2000 is more complete, besides above feature, it has
two hardware cursors, two hardware vblank counter and two scanout
position recorders.

 v1 -> v2:
  1) Use hpd status reg when polling for ls7a2000
  2) Fix all warnings emerged when compile with W=1

 v2 -> v3:
  1) Add COMPILE_TEST in Kconfig and make the driver off by default
  2) Alphabetical sorting headers
  3) Untangle register access functions as much as possible
  4) Switch to TTM based memory manager and prefer cached mapping
     for Loongson SoC
  5) Add chip id detection method, now all models are distinguishable.
  6) Revise builtin HDMI phy driver, nearly all main stream mode
     below 4K@30Hz is tested, this driver supported these mode very
     well.

  As a basic kms 2D driver, the user experience is good enough when
  using X server under mate and xfce desktop environment. This dirver
  is ready to be merged, and i will take the responsibility if there
  any bug happen.

Signed-off-by: Li Yi <liyi@loongson.cn>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
Signed-off-by: suijingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/Kconfig             |   2 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/lsdc/Kconfig        |  16 +
 drivers/gpu/drm/lsdc/Makefile       |  15 +
 drivers/gpu/drm/lsdc/lsdc_crtc.c    | 376 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_debugfs.c | 233 ++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c     | 569 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h     | 377 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_i2c.c     | 193 ++++++++++
 drivers/gpu/drm/lsdc/lsdc_irq.c     |  85 +++++
 drivers/gpu/drm/lsdc/lsdc_output.c  | 465 +++++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_plane.c   | 440 +++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c     | 468 +++++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h     |  78 ++++
 drivers/gpu/drm/lsdc/lsdc_probe.c   |  74 ++++
 drivers/gpu/drm/lsdc/lsdc_regs.h    | 343 +++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_ttm.c     | 450 ++++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_ttm.h     |  62 +++
 include/drm/drm_gem_vram_helper.h   |   4 -
 19 files changed, 4247 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/lsdc/Kconfig
 create mode 100644 drivers/gpu/drm/lsdc/Makefile
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_ttm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..3baecd48930b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -367,6 +367,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/lsdc/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ab4460fcd63f..5a8e2fc8dd5d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -190,3 +190,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_LSDC) += lsdc/
diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
new file mode 100644
index 000000000000..437bb11dcd57
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_LSDC
+	tristate "DRM support for Loongson Display Controller"
+	depends on DRM && PCI
+	depends on LOONGARCH || MIPS || COMPILE_TEST
+	depends on OF
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	help
+	  This is a KMS driver for loongson display controller in the
+	  LS7A1000/LS7A2000 bridge chip and LS2K2000/LS2K1000/LS2K0500
+	  SoC. If "M" is selected, the module will be called lsdc.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
new file mode 100644
index 000000000000..9a7979a949de
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+lsdc-y := \
+	lsdc_crtc.o \
+	lsdc_debugfs.o \
+	lsdc_drv.o \
+	lsdc_i2c.o \
+	lsdc_irq.o \
+	lsdc_output.o \
+	lsdc_plane.o \
+	lsdc_pll.o \
+	lsdc_probe.o \
+	lsdc_ttm.o
+
+obj-$(CONFIG_DRM_LSDC) += lsdc.o
diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c b/drivers/gpu/drm/lsdc/lsdc_crtc.c
new file mode 100644
index 000000000000..73434d9b0303
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+
+static u32 lsdc_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	return lsdc_crtc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG, drm_crtc_index(crtc));
+}
+
+static int lsdc_enable_vblank_pipe_0(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
+
+	return 0;
+}
+
+static void lsdc_disable_vblank_pipe_0(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
+}
+
+static int lsdc_enable_vblank_pipe_1(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
+
+	return 0;
+}
+
+static void lsdc_disable_vblank_pipe_1(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
+}
+
+static void lsdc_crtc_reset(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_crtc_state *priv_crtc_state;
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, drm_crtc_index(crtc),
+			 CFG_RESET_N | LSDC_PF_XRGB8888 | LSDC_DMA_STEP_64_BYTES);
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
+}
+
+static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state)
+{
+	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(state);
+
+	__drm_atomic_helper_crtc_destroy_state(&priv_state->base);
+
+	kfree(priv_state);
+}
+
+static struct drm_crtc_state *
+lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lsdc_crtc_state *new_priv_state;
+	struct lsdc_crtc_state *old_priv_state;
+
+	new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
+	if (!new_priv_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->base);
+
+	old_priv_state = to_lsdc_crtc_state(crtc->state);
+
+	memcpy(&new_priv_state->pparms, &old_priv_state->pparms,
+	       sizeof(new_priv_state->pparms));
+
+	return &new_priv_state->base;
+}
+
+#define lsdc_crtc_funcs_common                                               \
+	.reset = lsdc_crtc_reset,                                            \
+	.destroy = drm_crtc_cleanup,                                         \
+	.set_config = drm_atomic_helper_set_config,                          \
+	.page_flip = drm_atomic_helper_page_flip,                            \
+	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,          \
+	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,              \
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
+
+static const struct drm_crtc_funcs lsdc_crtc_funcs_array[2][LSDC_NUM_CRTC] = {
+	{
+		{
+			lsdc_crtc_funcs_common,
+			.enable_vblank = lsdc_enable_vblank_pipe_0,
+			.disable_vblank = lsdc_disable_vblank_pipe_0,
+		},
+		{
+			lsdc_crtc_funcs_common,
+			.enable_vblank = lsdc_enable_vblank_pipe_1,
+			.disable_vblank = lsdc_disable_vblank_pipe_1,
+		},
+	},
+	{
+		{
+			lsdc_crtc_funcs_common,
+			.enable_vblank = lsdc_enable_vblank_pipe_0,
+			.disable_vblank = lsdc_disable_vblank_pipe_0,
+			.get_vblank_counter = lsdc_crtc_get_vblank_counter,
+		},
+		{
+			lsdc_crtc_funcs_common,
+			.enable_vblank = lsdc_enable_vblank_pipe_1,
+			.disable_vblank = lsdc_disable_vblank_pipe_1,
+			.get_vblank_counter = lsdc_crtc_get_vblank_counter,
+		}
+	}
+};
+
+#undef lsdc_crtc_funcs_common
+
+static enum drm_mode_status
+lsdc_crtc_mode_valid(struct drm_crtc *crtc,
+		     const struct drm_display_mode *mode)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+
+	if (mode->hdisplay > descp->max_width)
+		return MODE_BAD_HVALUE;
+	if (mode->vdisplay > descp->max_height)
+		return MODE_BAD_VVALUE;
+
+	if (mode->clock > descp->max_pixel_clk) {
+		drm_dbg(ddev, "mode %dx%d, pixel clock=%d is too high\n",
+			mode->hdisplay, mode->vdisplay, mode->clock);
+		return MODE_CLOCK_HIGH;
+	}
+
+	if ((mode->hdisplay * 4) % descp->pitch_align) {
+		drm_dbg(ddev, "stride align to %u bytes is required\n",
+			descp->pitch_align);
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
+static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
+				    struct drm_crtc_state *state)
+{
+	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
+	struct lsdc_pll *pixpll = &dispipe->pixpll;
+	const struct lsdc_pixpll_funcs *pfuncs = pixpll->funcs;
+	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(state);
+	struct lsdc_pll_parms *pout = &priv_state->pparms;
+	unsigned int clock = state->mode.clock;
+	bool ret;
+
+	ret = pfuncs->compute(pixpll, clock, pout);
+	if (ret)
+		return 0;
+
+	drm_warn(crtc->dev, "Find PLL parameters for %u failed\n", clock);
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
+		return 0;
+
+	return lsdc_pixpll_atomic_check(crtc, crtc_state);
+}
+
+static void lsdc_crtc_enable(struct drm_crtc *crtc,
+			     struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
+	struct lsdc_pll *pixpll = &dispipe->pixpll;
+	const struct lsdc_pixpll_funcs *clk_func = pixpll->funcs;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(crtc_state);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	unsigned int index = drm_crtc_index(crtc);
+	unsigned int width_in_bytes = mode->crtc_hdisplay * 4;
+	u32 val;
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_HDISPLAY_REG, index,
+			 (mode->crtc_htotal << 16) | mode->crtc_hdisplay);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_VDISPLAY_REG, index,
+			 (mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_HSYNC_REG, index,
+			 (mode->crtc_hsync_end << 16) |
+			 mode->crtc_hsync_start |
+			 CFG_HSYNC_EN);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_VSYNC_REG, index,
+			 (mode->crtc_vsync_end << 16) |
+			 mode->crtc_vsync_start |
+			 CFG_VSYNC_EN);
+
+	val = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, index);
+	/* clear old dma step settings */
+	val &= ~CFG_DMA_STEP_MASK;
+
+	if (descp->chip == CHIP_LS7A2000 || descp->chip == CHIP_LS2K2000) {
+		/*
+		 * Using large dma step as much as possible,
+		 * for improve hardware DMA efficiency.
+		 */
+		if (width_in_bytes % 256 == 0)
+			val |= LSDC_DMA_STEP_256_BYTES;
+		else if (width_in_bytes % 128 == 0)
+			val |= LSDC_DMA_STEP_128_BYTES;
+		else if (width_in_bytes % 64 == 0)
+			val |= LSDC_DMA_STEP_64_BYTES;
+		else  /* width_in_bytes % 32 == 0 */
+			val |= LSDC_DMA_STEP_32_BYTES;
+	}
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, index, val);
+
+	clk_func->update(pixpll, &priv_state->pparms);
+
+	drm_crtc_vblank_on(crtc);
+
+	lsdc_crtc_ureg32_set(ldev, LSDC_CRTC0_CFG_REG, index, CFG_OUTPUT_EN);
+
+	drm_dbg(ddev, "CRTC-%u enabled: %ux%u\n",
+		index, mode->hdisplay, mode->vdisplay);
+}
+
+static void lsdc_crtc_disable(struct drm_crtc *crtc,
+			      struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int i = drm_crtc_index(crtc);
+
+	drm_crtc_wait_one_vblank(crtc);
+	lsdc_crtc_ureg32_clr(ldev, LSDC_CRTC0_CFG_REG, i, CFG_OUTPUT_EN);
+	drm_crtc_vblank_off(crtc);
+
+	drm_dbg(ddev, "CRTC-%u disabled\n", i);
+}
+
+static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
+		else
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static bool lsdc_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos,
+					   int *hpos,
+					   ktime_t *stime,
+					   ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int i = drm_crtc_index(crtc);
+	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
+	u32 val = 0;
+
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	vactive_start = vsw + vbp + 1;
+	vactive_end = vactive_start + mode->crtc_vdisplay;
+
+	/* last scan line before VSYNC */
+	vfp_end = mode->crtc_vtotal;
+
+	if (stime)
+		*stime = ktime_get();
+
+	val = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG, i);
+
+	line = (val & 0xffff);
+
+	if (line < vactive_start)
+		line -= vactive_start;
+	else if (line > vactive_end)
+		line = line - vfp_end - vactive_start;
+	else
+		line -= vactive_start;
+
+	*vpos = line;
+	*hpos = val >> 16;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
+static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
+	.mode_valid = lsdc_crtc_mode_valid,
+	.atomic_enable = lsdc_crtc_enable,
+	.atomic_disable = lsdc_crtc_disable,
+	.atomic_check = lsdc_crtc_helper_atomic_check,
+	.atomic_flush = lsdc_crtc_atomic_flush,
+	.get_scanout_position = lsdc_crtc_get_scanout_position,
+};
+
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   unsigned int index,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	unsigned int h = descp->has_vblank_counter;
+	int ret;
+
+	ret = drm_crtc_init_with_planes(ddev, crtc, primary, cursor,
+					&lsdc_crtc_funcs_array[h][index],
+					"CRTC-%d", index);
+	if (ret) {
+		drm_err(ddev, "crtc init with planes failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
+
+	drm_info(ddev, "%s initialized %s vblank counter support\n",
+		 crtc->name, h ? "with" : "without");
+
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret)
+		drm_warn(ddev, "set the gamma table size failed\n");
+
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_debugfs.c b/drivers/gpu/drm/lsdc/lsdc_debugfs.c
new file mode 100644
index 000000000000..cf26cf2d09d3
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_debugfs.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
+#include "lsdc_drv.h"
+
+#ifdef CONFIG_DEBUG_FS
+
+static int lsdc_identify(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct lsdc_device *ldev = to_lsdc(node->minor->dev);
+
+	seq_printf(m, "I'm in %s, Running on 0x%x\n",
+		   chip_to_str(ldev->descp->chip), loongson_cpu_get_prid());
+
+	return 0;
+}
+
+static int lsdc_show_clock(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, ddev) {
+		struct lsdc_display_pipe *pipe = crtc_to_display_pipe(crtc);
+		struct lsdc_pll *pixpll = &pipe->pixpll;
+		const struct lsdc_pixpll_funcs *funcs = pixpll->funcs;
+		struct drm_display_mode *mode = &crtc->state->mode;
+		struct lsdc_pll_parms parms;
+		unsigned int out_khz;
+
+		out_khz = funcs->get_clock_rate(pixpll, &parms);
+
+		seq_printf(m, "Display pipe %u: %dx%d\n",
+			   pipe->index, mode->hdisplay, mode->vdisplay);
+
+		seq_printf(m, "Frequency actually output: %u kHz\n", out_khz);
+		seq_printf(m, "Pixel clock required: %d kHz\n", mode->clock);
+		seq_printf(m, "diff: %d kHz\n", out_khz - mode->clock);
+
+		seq_printf(m, "div_ref=%u, loopc=%u, div_out=%u\n",
+			   parms.div_ref, parms.loopc, parms.div_out);
+
+		seq_printf(m, "hsync_start=%d, hsync_end=%d, htotal=%d\n",
+			   mode->hsync_start, mode->hsync_end, mode->htotal);
+		seq_printf(m, "vsync_start=%d, vsync_end=%d, vtotal=%d\n\n",
+			   mode->vsync_start, mode->vsync_end, mode->vtotal);
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
+#define REG_DEF(reg) { __stringify_1(LSDC_##reg##_REG), LSDC_##reg##_REG }
+static const struct {
+	const char *name;
+	u32 reg_offset;
+} lsdc_regs_array[] = {
+	REG_DEF(CURSOR0_CFG),
+	REG_DEF(CURSOR0_ADDR_LO),
+	REG_DEF(CURSOR0_ADDR_HI),
+	REG_DEF(CURSOR0_POSITION),
+	REG_DEF(CURSOR0_BG_COLOR),
+	REG_DEF(CURSOR0_FG_COLOR),
+	REG_DEF(CRTC0_CFG),
+	REG_DEF(CRTC0_FB_ORIGIN),
+	REG_DEF(CRTC0_HDISPLAY),
+	REG_DEF(CRTC0_HSYNC),
+	REG_DEF(CRTC0_VDISPLAY),
+	REG_DEF(CRTC0_VSYNC),
+	REG_DEF(CRTC0_GAMMA_INDEX),
+	REG_DEF(CRTC0_GAMMA_DATA),
+	REG_DEF(INT),
+	REG_DEF(CRTC1_CFG),
+	REG_DEF(CRTC1_FB_ORIGIN),
+	REG_DEF(CRTC1_HDISPLAY),
+	REG_DEF(CRTC1_HSYNC),
+	REG_DEF(CRTC1_VDISPLAY),
+	REG_DEF(CRTC1_VSYNC),
+	REG_DEF(CRTC1_GAMMA_INDEX),
+	REG_DEF(CRTC1_GAMMA_DATA),
+};
+
+#undef REG_DEF
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
+			   name, offset, lsdc_rreg32(ldev, offset));
+	}
+
+	return 0;
+}
+
+static int lsdc_show_vblank_counter(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	seq_printf(m, "CRTC-0 vblank counter: %08u\n",
+		   lsdc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG));
+
+	seq_printf(m, "CRTC-1 vblank counter: %08u\n",
+		   lsdc_rreg32(ldev, LSDC_CRTC1_VSYNC_COUNTER_REG));
+
+	return 0;
+}
+
+static int lsdc_show_scan_position(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 p0 = lsdc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG);
+	u32 p1 = lsdc_rreg32(ldev, LSDC_CRTC1_SCAN_POS_REG);
+
+	seq_printf(m, "CRTC-0: x: %08u, y: %08u\n", p0 >> 16, p0 & 0xFFFF);
+	seq_printf(m, "CRTC-1: x: %08u, y: %08u\n", p1 >> 16, p1 & 0xFFFF);
+
+	return 0;
+}
+
+static int lsdc_show_fb_addr(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 lo, hi;
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
+	if (val & CFG_FB_IN_USING) {
+		lo = lsdc_rreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG);
+		hi = lsdc_rreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG);
+		seq_printf(m, "CRTC-0 using fb1: 0x%x:%x\n", hi, lo);
+	} else {
+		lo = lsdc_rreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG);
+		hi = lsdc_rreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG);
+		seq_printf(m, "CRTC-0 using fb0: 0x%x:%x\n", hi, lo);
+	}
+
+	val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
+	if (val & CFG_FB_IN_USING) {
+		lo = lsdc_rreg32(ldev, LSDC_CRTC1_FB1_LO_ADDR_REG);
+		hi = lsdc_rreg32(ldev, LSDC_CRTC1_FB1_HI_ADDR_REG);
+		seq_printf(m, "CRTC-1 using fb1: 0x%x:%x\n", hi, lo);
+	} else {
+		lo = lsdc_rreg32(ldev, LSDC_CRTC1_FB0_LO_ADDR_REG);
+		hi = lsdc_rreg32(ldev, LSDC_CRTC1_FB0_HI_ADDR_REG);
+		seq_printf(m, "CRTC-1 using fb0: 0x%x:%x\n", hi, lo);
+	}
+
+	return 0;
+}
+
+static int lsdc_show_stride(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 stride0 = lsdc_rreg32(ldev, LSDC_CRTC0_STRIDE_REG);
+	u32 stride1 = lsdc_rreg32(ldev, LSDC_CRTC1_STRIDE_REG);
+
+	seq_printf(m, "PIPE-0 stride: %u\n", stride0);
+	seq_printf(m, "PIPE-1 stride: %u\n", stride1);
+
+	return 0;
+}
+
+static int lsdc_trigger_flip_fb(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
+	lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val | CFG_PAGE_FLIP);
+	seq_puts(m, "CRTC-0 flip triggered\n");
+
+	val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
+	lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val | CFG_PAGE_FLIP);
+	seq_puts(m, "CRTC-1 flip triggered\n");
+
+	return 0;
+}
+
+static struct drm_info_list lsdc_debugfs_list[] = {
+	{ "chip",     lsdc_identify, 0, NULL },
+	{ "clocks",   lsdc_show_clock, 0 },
+	{ "mm",       lsdc_show_mm, 0, NULL },
+	{ "regs",     lsdc_show_regs, 0 },
+	{ "vblanks",  lsdc_show_vblank_counter, 0, NULL },
+	{ "scan_pos", lsdc_show_scan_position, 0, NULL },
+	{ "fb_addr",  lsdc_show_fb_addr, 0, NULL },
+	{ "stride",   lsdc_show_stride, 0, NULL },
+	{ "flip",     lsdc_trigger_flip_fb, 0, NULL },
+};
+
+#endif
+
+void lsdc_debugfs_init(struct drm_minor *minor)
+{
+#ifdef CONFIG_DEBUG_FS
+	drm_debugfs_create_files(lsdc_debugfs_list,
+				 ARRAY_SIZE(lsdc_debugfs_list),
+				 minor->debugfs_root,
+				 minor);
+#endif
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_drv.c
new file mode 100644
index 000000000000..c933972aed3a
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/pci.h>
+#include <linux/of_address.h>
+#include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include "lsdc_drv.h"
+#include "lsdc_ttm.h"
+
+#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
+#define DRIVER_NAME		"lsdc"
+#define DRIVER_DESC		"drm driver for loongson's display controller"
+#define DRIVER_DATE		"20220701"
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+static const struct lsdc_desc dc_in_ls7a1000 = {
+	.chip = CHIP_LS7A1000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.pitch_align = 256,
+	.mc_bits = 40,
+	.has_vblank_counter = false,
+	.has_scan_pos = true,
+	.has_builtin_i2c = true,
+	.has_vram = true,
+	.has_hpd_reg = false,
+	.is_soc = false,
+};
+
+static const struct lsdc_desc dc_in_ls7a2000 = {
+	.chip = CHIP_LS7A2000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 350000,
+	.max_width = 4096,
+	.max_height = 4096,
+	.num_of_hw_cursor = 2,
+	.hw_cursor_w = 64,
+	.hw_cursor_h = 64,
+	.pitch_align = 64,
+	.mc_bits = 40, /* support 48, but use 40 for backward compatibility */
+	.has_vblank_counter = true,
+	.has_scan_pos = true,
+	.has_builtin_i2c = true,
+	.has_vram = true,
+	.has_hpd_reg = true,
+	.is_soc = false,
+};
+
+static const struct lsdc_desc dc_in_ls2k1000 = {
+	.chip = CHIP_LS2K1000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.pitch_align = 256,
+	.mc_bits = 40,
+	.has_vblank_counter = false,
+	.has_scan_pos = true,
+	.has_builtin_i2c = false,
+	.has_vram = false,
+	.has_hpd_reg = false,
+	.is_soc = true,
+};
+
+static const struct lsdc_desc dc_in_ls2k2000 = {
+	.chip = CHIP_LS2K2000,
+	.num_of_crtc = LSDC_NUM_CRTC,
+	.max_pixel_clk = 350000,
+	.max_width = 4096,
+	.max_height = 4096,
+	.num_of_hw_cursor = 2,
+	.hw_cursor_w = 64,
+	.hw_cursor_h = 64,
+	.pitch_align = 256,
+	.mc_bits = 40,
+	.has_vblank_counter = true,
+	.has_scan_pos = true,
+	.has_builtin_i2c = true,
+	.has_vram = false,
+	.has_hpd_reg = true,
+	.is_soc = true,
+};
+
+const char *chip_to_str(enum loongson_chip_family chip)
+{
+	if (chip == CHIP_LS7A2000)
+		return "LS7A2000";
+
+	if (chip == CHIP_LS7A1000)
+		return "LS7A1000";
+
+	if (chip == CHIP_LS2K1000)
+		return "LS2K1000";
+
+	if (chip == CHIP_LS2K2000)
+		return "LS2K2000";
+
+	return "unknown";
+}
+
+DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
+
+static const struct drm_driver lsdc_drm_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops = &lsdc_gem_fops,
+
+	/* for downstream userspace driver compatibility */
+	.name = "loongson-drm",
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+
+	.debugfs_init = lsdc_debugfs_init,
+	.dumb_create = lsdc_dumb_create,
+	.dumb_map_offset = lsdc_dumb_map_offset,
+	.gem_prime_mmap = drm_gem_prime_mmap,
+};
+
+static enum drm_mode_status
+lsdc_bo_size_valid(struct drm_device *ddev,
+		   const struct drm_display_mode *mode)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGB8888 */
+	unsigned long fbsize, fbpages, max_fbpages;
+
+	max_fbpages = (ldev->vram_size / 2) >> PAGE_SHIFT;
+	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
+
+	if (fbpages > max_fbpages)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
+static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.mode_valid = lsdc_bo_size_valid,
+};
+
+static int lsdc_modeset_init(struct lsdc_device *ldev,
+			     const struct lsdc_desc *descp)
+{
+	struct drm_device *ddev = &ldev->base;
+	unsigned int num_crtc = descp->num_of_crtc;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_crtc; i++) {
+		ret = lsdc_create_output(ldev, i);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < num_crtc; i++) {
+		struct lsdc_display_pipe *dispipe = &ldev->dispipe[i];
+		struct lsdc_pll *pixpll = &dispipe->pixpll;
+		struct drm_plane *primary = &dispipe->primary;
+		struct drm_plane *cursor = &dispipe->cursor.base;
+		struct drm_crtc *crtc = &dispipe->crtc;
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
+		ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
+		if (ret)
+			return ret;
+
+		drm_info(ddev, "display pipe %u initialized\n", i);
+	}
+
+	drm_mode_config_reset(ddev);
+
+	return 0;
+}
+
+static int lsdc_mode_config_init(struct drm_device *ddev,
+				 const struct lsdc_desc *descp)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
+
+	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
+	ddev->mode_config.min_width = 1;
+	ddev->mode_config.min_height = 1;
+	ddev->mode_config.max_width = descp->max_width * LSDC_NUM_CRTC;
+	ddev->mode_config.max_height = descp->max_height * LSDC_NUM_CRTC;
+	ddev->mode_config.preferred_depth = 24;
+	ddev->mode_config.prefer_shadow = descp->has_vram;
+
+	ddev->mode_config.cursor_width = descp->hw_cursor_h;
+	ddev->mode_config.cursor_height = descp->hw_cursor_h;
+
+	if (descp->has_vblank_counter)
+		ddev->max_vblank_count = 0xffffffff;
+
+	return ret;
+}
+
+static const struct lsdc_desc *
+lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	enum loongson_chip_family chip = ent->driver_data;
+
+	if (chip == CHIP_LS7A1000) {
+		if (lsdc_is_ls2k1000())
+			return &dc_in_ls2k1000;
+
+		return &dc_in_ls7a1000;
+	}
+
+	if (chip == CHIP_LS7A2000) {
+		if (lsdc_is_ls2k2000())
+			return &dc_in_ls2k2000;
+
+		return &dc_in_ls7a2000;
+	}
+
+	return NULL;
+}
+
+static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
+				   const struct lsdc_desc *descp)
+{
+	struct drm_device *ddev = &ldev->base;
+	struct pci_dev *gpu;
+	resource_size_t base, size;
+
+	/*
+	 * The GPU and display controller in LS7A1000/LS7A2000 are separated
+	 * PCIE devices, they are two devices not one. The DC is a pci device,
+	 * but it don't have a dedicate VRAM bar, the BIOS engineer choose to
+	 * assign the VRAM to the gpu device. Sadly, after years application,
+	 * this decision form as a convention for loongson integrate graphics.
+	 * For LS7A1000 and LS7A2000, bar 2 of GPU device contain the VRAM,
+	 * both the GPU and the DC can make use of the VRAM depend on how DRM
+	 * device driver is written. Therefore, we have to do some tricks here.
+	 */
+	if (descp->chip == CHIP_LS7A1000)
+		gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
+	else if (descp->chip == CHIP_LS7A2000)
+		gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
+
+	if (!gpu) {
+		drm_warn(ddev, "No GPU device found\n");
+		return -ENODEV;
+	}
+
+	base = pci_resource_start(gpu, 2);
+	size = pci_resource_len(gpu, 2);
+
+	ldev->vram_base = base;
+	ldev->vram_size = size;
+
+	drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
+		 (u64)base, (u32)(size >> 20));
+
+	return 0;
+}
+
+static int lsdc_of_get_reserved_ram(struct lsdc_device *ldev)
+{
+	struct drm_device *ddev = &ldev->base;
+	unsigned long size = 0;
+	struct device_node *node;
+	struct resource r;
+	int ret;
+
+	node = of_parse_phandle(ddev->dev->of_node, "memory-region", 0);
+	if (!node) {
+		drm_err(ddev, "No memory-region property or no DT, abort\n");
+		return -ENOENT;
+	}
+
+	ret = of_address_to_resource(node, 0, &r);
+	of_node_put(node);
+	if (ret)
+		return ret;
+
+	size = r.end - r.start + 1;
+
+	ldev->vram_base = r.start;
+	ldev->vram_size = size;
+
+	drm_info(ddev, "using VRAM carveout: %lx@%pa\n", size, &r.start);
+
+	return 0;
+}
+
+static struct lsdc_device *
+lsdc_create_device(struct pci_dev *pdev,
+		   const struct pci_device_id *ent,
+		   const struct drm_driver *drv)
+{
+	struct lsdc_device *ldev;
+	struct drm_device *ddev;
+	const struct lsdc_desc *descp;
+	int ret;
+
+	ldev = devm_drm_dev_alloc(&pdev->dev, drv, struct lsdc_device, base);
+	if (IS_ERR(ldev))
+		return ldev;
+
+	ddev = &ldev->base;
+
+	pci_set_drvdata(pdev, ddev);
+
+	descp = lsdc_detect_chip(pdev, ent);
+	if (!descp) {
+		drm_err(ddev, "Not known device, the driver need update!\n");
+		return NULL;
+	}
+
+	drm_info(ddev, "%s found, revision: %u", chip_to_str(descp->chip), pdev->revision);
+
+	ldev->descp = descp;
+
+	spin_lock_init(&ldev->reglock);
+
+	/* BAR 0 the DC device contains registers */
+	ldev->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!ldev->reg_base)
+		return ERR_PTR(-EIO);
+
+	if (descp->has_vram)
+		ret = lsdc_get_dedicated_vram(ldev, descp);
+	else
+		ret = lsdc_of_get_reserved_ram(ldev);
+
+	if (ret) {
+		drm_err(ddev, "Init VRAM failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = drm_aperture_remove_conflicting_framebuffers(ldev->vram_base,
+							   ldev->vram_size,
+							   false,
+							   drv);
+	if (ret) {
+		drm_err(ddev, "remove firmware framebuffers failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = lsdc_ttm_init(ldev);
+	if (ret) {
+		drm_err(ddev, "memory manager init failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = lsdc_mode_config_init(ddev, descp);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = lsdc_modeset_init(ldev, descp);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_vblank_init(ddev, descp->num_of_crtc);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = request_threaded_irq(pdev->irq,
+				   lsdc_get_irq_handler(ldev),
+				   lsdc_irq_thread_handler,
+				   IRQF_ONESHOT,
+				   dev_name(ddev->dev),
+				   ddev);
+	if (ret) {
+		drm_err(ddev, "Failed to register lsdc interrupt\n");
+		return ERR_PTR(ret);
+	}
+
+	drm_kms_helper_poll_init(ddev);
+
+	return ldev;
+}
+
+static int lsdc_pci_probe(struct pci_dev *pdev,
+			  const struct pci_device_id *ent)
+{
+	struct drm_device *ddev;
+	struct lsdc_device *ldev;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
+	if (ret)
+		return ret;
+
+	ldev = lsdc_create_device(pdev, ent, &lsdc_drm_driver);
+	if (IS_ERR(ldev))
+		return PTR_ERR(ldev);
+
+	ddev = &ldev->base;
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(ddev, 32);
+
+	return 0;
+}
+
+static void lsdc_pci_remove(struct pci_dev *pdev)
+{
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+
+	drm_dev_unregister(ddev);
+	drm_atomic_helper_shutdown(ddev);
+}
+
+static int lsdc_drm_freeze(struct drm_device *ddev)
+{
+	int error;
+
+	error = drm_mode_config_helper_suspend(ddev);
+	if (error)
+		return error;
+
+	pci_save_state(to_pci_dev(ddev->dev));
+
+	return 0;
+}
+
+static int lsdc_drm_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+
+	return drm_mode_config_helper_resume(ddev);
+}
+
+static int lsdc_pm_freeze(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+
+	return lsdc_drm_freeze(ddev);
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
+	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_LS7A1000},
+	{PCI_VENDOR_ID_LOONGSON, 0x7a36, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_LS7A2000},
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
+static int __init lsdc_module_init(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
+		/* Multiple video card workaround */
+		if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
+			pr_info("Discrete graphic card detected, abort\n");
+			return 0;
+		}
+	}
+
+	return pci_register_driver(&lsdc_pci_driver);
+}
+module_init(lsdc_module_init);
+
+static void __exit lsdc_module_exit(void)
+{
+	pci_unregister_driver(&lsdc_pci_driver);
+}
+module_exit(lsdc_module_exit);
+
+MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h b/drivers/gpu/drm/lsdc/lsdc_drv.h
new file mode 100644
index 000000000000..ce5540be09c1
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
@@ -0,0 +1,377 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KMS driver for Loongson display controller
+ * Copyright (C) 2022 Loongson Corporation
+ *
+ * Authors:
+ *      Li Yi <liyi@loongson.cn>
+ *      Sui Jingfeng <suijingfeng@loongson.cn>
+ */
+
+#ifndef __LSDC_DRV_H__
+#define __LSDC_DRV_H__
+
+#include <linux/i2c.h>
+#include <linux/i2c-algo-bit.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
+#include <drm/ttm/ttm_device.h>
+#include "lsdc_pll.h"
+#include "lsdc_regs.h"
+
+#define LSDC_NUM_CRTC           2
+
+/*
+ * The display controller in LS7A2000 integrate three loongson self-made
+ * encoder. Display pipe 0 has a transparent VGA encoder and a HDMI phy,
+ * they are parallel. Display pipe 1 has only one HDMI phy.
+ *       ______________________                          _____________
+ *      |             +-----+  |                        |             |
+ *      | CRTC0 -+--> | VGA |  ----> VGA Connector ---> | VGA Monitor |<---+
+ *      |        |    +-----+  |                        |_____________|    |
+ *      |        |             |                         ______________    |
+ *      |        |    +------+ |                        |              |   |
+ *      |        +--> | HDMI | ----> HDMI Connector --> | HDMI Monitor |<--+
+ *      |             +------+ |                        |______________|   |
+ *      |            +------+  |                                           |
+ *      |            | i2c6 |  <-------------------------------------------+
+ *      |            +------+  |
+ *      |                      |
+ *      |    DC in LS7A2000    |
+ *      |                      |
+ *      |            +------+  |
+ *      |            | i2c7 |  <--------------------------------+
+ *      |            +------+  |                                |
+ *      |                      |                          ______|_______
+ *      |            +------+  |                         |              |
+ *      | CRTC1 ---> | HDMI |  ----> HDMI Connector ---> | HDMI Monitor |
+ *      |            +------+  |                         |______________|
+ *      |______________________|
+ *
+ * The DC in LS2K2000 is basicly same with the DC in LS7A2000 except that
+ * LS2K2000 has only one built-in HDMI encoder located at display pipe 0.
+ * Display pipe 1 simply export a genenal DVO output interface.
+ *       ______________________
+ *      |                      |                         ______________
+ *      |             +------+ |                        |              |
+ *      | CRTC-0 ---> | HDMI | ----> HDMI Connector --> | HDMI Monitor |<--+
+ *      |             +------+ |                        |______________|   |
+ *      |            +-------+ |                                           |
+ *      |            | i2c-x | <-------------------------------------------+
+ *      |            +-------+ |
+ *      |                      |
+ *      |    DC in LS2K2000    |
+ *      |                      |
+ *      |            +-------+ |
+ *      |            | i2c-y | <----------------------------------+
+ *      |            +-------+ |                                  |
+ *      |                      |                           _______|_______
+ *      |             +-----+  |                          |               |
+ *      | CRTC-1 ---> | DVO |  ---> External encoder ---> | Panel/Monitor |
+ *      |             +-----+  |                          |_______________|
+ *      |______________________|
+ *
+ * The display controller in LS7A1000 integrate two-way DVO, external
+ * encoder(tx chip) is required except with dpi(rgb888) panel directly.
+ *       ___________________                                     _________
+ *      |            -------|                                   |         |
+ *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Display |
+ *      |  _   _     -------|        ^             ^            |_________|
+ *      | | | | |  +------+ |        |             |
+ *      | |_| |_|  | i2c6 | <--------+-------------+
+ *      |          +------+ |
+ *      |  DC in LS7A1000   |
+ *      |  _   _   +------+ |
+ *      | | | | |  | i2c7 | <--------+-------------+
+ *      | |_| |_|  +------+ |        |             |             _________
+ *      |            -------|        |             |            |         |
+ *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
+ *      |            -------|                                   |_________|
+ *      |___________________|
+ *
+ *
+ * The display controller in LS2K1000 SoC is basicly same with the display
+ * controller in LS7A1000, except that no built-in gpio emulated i2c
+ * and no vram.
+ *       ___________________                                     _________
+ *      |            -------|                                   |         |
+ *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Display |
+ *      |  _   _     -------|        ^              ^           |_________|
+ *      | | | | |           |        |              |
+ *      | |_| |_|           |     +------+          |
+ *      |                   <---->| i2c0 |<---------+
+ *      |  DC in LS2K1000   |     +------+
+ *      |  _   _            |     +------+
+ *      | | | | |           <---->| i2c1 |----------+
+ *      | |_| |_|           |     +------+          |            _________
+ *      |            -------|        |              |           |         |
+ *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
+ *      |            -------|                                   |_________|
+ *      |___________________|
+ *
+ * LS7A1000 and LS7A2000 are bridge chips, has dedicated Video RAM.
+ * while LS2K2000/LS2K1000 are SoC, they don't have dediacated Video RAM.
+ *
+ * The DC in LS7A1000/LS2K1000 have the pci vendor/device ID: 0x0014:0x7a06
+ * The DC in LS7A2000/LS2K2000 have the pci vendor/device ID: 0x0014:0x7a36
+ *
+ * There is only a 1:1 mapping of crtcs, encoders and connectors for the DC,
+ * display pipe 0 = crtc0 + dvo0 + encoder0 + connector0 + cursor0 + primary0
+ * display pipe 1 = crtc1 + dvo1 + encoder1 + connectro1 + cursor1 + primary1
+ * Each CRTC have two FB address registers, don't know how to wire this
+ * feature to drm core.
+ */
+
+enum loongson_chip_family {
+	CHIP_UNKNOWN = 0,
+	CHIP_LS7A1000 = 1,  /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
+	CHIP_LS7A2000 = 2,  /* Update version of LS7A1000, with built-in HDMI encoder */
+	CHIP_LS2K1000 = 3,  /* 2-Core Mips64r2/LA264 SoC, 64-bit, 1.0 Ghz */
+	CHIP_LS2K2000 = 4,  /* 2-Core 64-bit LA364 SoC, 1.2 ~ 1.5 Ghz */
+	CHIP_LAST,
+};
+
+struct lsdc_desc {
+	enum loongson_chip_family chip;
+	u32 num_of_crtc;
+	u32 max_pixel_clk;
+	u32 max_width;
+	u32 max_height;
+	u32 num_of_hw_cursor;
+	u32 hw_cursor_w;
+	u32 hw_cursor_h;
+	u32 pitch_align;  /* DMA alignment constraint */
+	u64 mc_bits;      /* physical address bus bit width */
+	bool has_vblank_counter; /* 32 bit hw vsync counter */
+	bool has_scan_pos;      /* crtc scan position recorder */
+	bool has_builtin_i2c;
+	bool has_vram;
+	bool has_hpd_reg;
+	bool is_soc;
+};
+
+struct lsdc_i2c {
+	struct i2c_adapter adapter;
+	struct i2c_algo_bit_data bit;
+	struct drm_device *ddev;
+	void __iomem *reg_base;
+	void __iomem *dir_reg;
+	void __iomem *dat_reg;
+	/* pin bit mask */
+	u8 sda;
+	u8 scl;
+};
+
+struct lsdc_cursor_lowing_funcs;
+
+struct lsdc_cursor {
+	struct drm_plane base;
+	const struct lsdc_cursor_lowing_funcs *funcs;
+	struct lsdc_device *ldev;
+	u32 offset;
+	u32 cfg;
+};
+
+static inline struct lsdc_cursor *to_lsdc_cursor(struct drm_plane *plane)
+{
+	return container_of(plane, struct lsdc_cursor, base);
+}
+
+/* helper funcs for lowing cursor update*/
+struct lsdc_cursor_lowing_funcs {
+	void (*update_position)(struct lsdc_cursor * const this, int x, int y);
+	void (*update_config)(struct lsdc_cursor * const this, u32 cfg);
+	void (*update_offset)(struct lsdc_cursor * const this, u64 offset);
+};
+
+struct lsdc_display_pipe {
+	struct drm_crtc crtc;
+	struct drm_plane primary;
+	struct lsdc_cursor cursor;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct lsdc_pll pixpll;
+	struct lsdc_i2c *li2c;
+	unsigned int index;
+};
+
+static inline struct lsdc_display_pipe *
+crtc_to_display_pipe(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct lsdc_display_pipe, crtc);
+}
+
+static inline struct lsdc_display_pipe *
+cursor_to_display_pipe(struct drm_plane *plane)
+{
+	return container_of(plane, struct lsdc_display_pipe, cursor.base);
+}
+
+static inline struct lsdc_display_pipe *
+connector_to_display_pipe(struct drm_connector *conn)
+{
+	return container_of(conn, struct lsdc_display_pipe, connector);
+}
+
+static inline struct lsdc_display_pipe *
+encoder_to_display_pipe(struct drm_encoder *enc)
+{
+	return container_of(enc, struct lsdc_display_pipe, encoder);
+}
+
+struct lsdc_crtc_state {
+	struct drm_crtc_state base;
+	struct lsdc_pll_parms pparms;
+};
+
+struct lsdc_device {
+	struct drm_device base;
+	struct ttm_device bdev;
+
+	/* @reglock: protects concurrent register access */
+	spinlock_t reglock;
+	void __iomem *reg_base;
+	void __iomem *vram;
+	resource_size_t vram_base;
+	resource_size_t vram_size;
+
+	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+
+	/* @num_output: count the number of active display pipe */
+	unsigned int num_output;
+
+	/* @descp: features description of the DC variant */
+	const struct lsdc_desc *descp;
+
+	u32 irq_status;
+};
+
+static inline struct lsdc_device *
+bdev_to_lsdc(struct ttm_device *bdev)
+{
+	return container_of(bdev, struct lsdc_device, bdev);
+}
+
+static inline struct lsdc_device *
+to_lsdc(struct drm_device *ddev)
+{
+	return container_of(ddev, struct lsdc_device, base);
+}
+
+static inline struct lsdc_crtc_state *
+to_lsdc_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct lsdc_crtc_state, base);
+}
+
+const char *chip_to_str(enum loongson_chip_family chip);
+
+void lsdc_debugfs_init(struct drm_minor *minor);
+
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   unsigned int index,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor);
+
+int lsdc_plane_init(struct lsdc_device *ldev,
+		    struct drm_plane *plane,
+		    enum drm_plane_type type,
+		    unsigned int index);
+
+int lsdc_create_output(struct lsdc_device *ldev, unsigned int index);
+
+struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
+				      void *base,
+				      unsigned int index);
+
+struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev, int index);
+
+irqreturn_t lsdc_irq_thread_handler(int irq, void *arg);
+irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev);
+
+static inline u32 lsdc_rreg32(struct lsdc_device *ldev, u32 offset)
+{
+	return readl(ldev->reg_base + offset);
+}
+
+static inline void lsdc_wreg32(struct lsdc_device *ldev, u32 offset, u32 val)
+{
+	writel(val, ldev->reg_base + offset);
+}
+
+static inline void lsdc_ureg32_set(struct lsdc_device *ldev,
+				   u32 offset,
+				   u32 bit)
+{
+	void __iomem *addr = ldev->reg_base + offset;
+	u32 val = readl(addr);
+
+	writel(val | bit, addr);
+}
+
+static inline void lsdc_ureg32_clr(struct lsdc_device *ldev,
+				   u32 offset,
+				   u32 bit)
+{
+	void __iomem *addr = ldev->reg_base + offset;
+	u32 val = readl(addr);
+
+	writel(val & ~bit, addr);
+}
+
+static inline u32 lsdc_crtc_rreg32(struct lsdc_device *ldev,
+				   u32 offset,
+				   u32 pipe)
+{
+	return readl(ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
+}
+
+#define lsdc_hdmi_rreg32 lsdc_crtc_rreg32
+
+static inline void lsdc_crtc_wreg32(struct lsdc_device *ldev,
+				    u32 offset,
+				    u32 pipe,
+				    u32 val)
+{
+	writel(val, ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
+}
+
+#define lsdc_hdmi_wreg32 lsdc_crtc_wreg32
+
+static inline void lsdc_crtc_ureg32_set(struct lsdc_device *ldev,
+					u32 offset,
+					u32 pipe,
+					u32 bit)
+{
+	void __iomem *addr;
+	u32 val;
+
+	addr = ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET;
+	val = readl(addr);
+	writel(val | bit, addr);
+}
+
+static inline void lsdc_crtc_ureg32_clr(struct lsdc_device *ldev,
+					u32 offset,
+					u32 pipe,
+					u32 bit)
+{
+	void __iomem *addr;
+	u32 val;
+
+	addr = ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET;
+	val = readl(addr);
+	writel(val & ~bit, addr);
+}
+
+/* helpers for chip detection */
+bool lsdc_is_ls2k2000(void);
+bool lsdc_is_ls2k1000(void);
+unsigned int loongson_cpu_get_prid(void);
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_i2c.c
new file mode 100644
index 000000000000..396c2a62efb9
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/i2c.h>
+#include <drm/drm_managed.h>
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+
+/*
+ * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by mask
+ * @mask: gpio pin mask
+ * @state: "0" for low, "1" for high
+ */
+static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
+{
+	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	unsigned long flags;
+	u8 val;
+
+	spin_lock_irqsave(&ldev->reglock, flags);
+
+	if (state) {
+		/*
+		 * Setting this pin as input directly, write 1 for Input.
+		 * The external pull-up resistor will pull the level up
+		 */
+		val = readb(li2c->dir_reg);
+		val |= mask;
+		writeb(val, li2c->dir_reg);
+	} else {
+		/* First set this pin as output, write 0 for Output */
+		val = readb(li2c->dir_reg);
+		val &= ~mask;
+		writeb(val, li2c->dir_reg);
+
+		/* Then, make this pin output 0 */
+		val = readb(li2c->dat_reg);
+		val &= ~mask;
+		writeb(val, li2c->dat_reg);
+	}
+
+	spin_unlock_irqrestore(&ldev->reglock, flags);
+}
+
+/*
+ * ls7a_gpio_i2c_get - read value back from the gpio pin indicated by mask
+ * @mask: gpio pin mask
+ * return "0" for low, "1" for high
+ */
+static int ls7a_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
+{
+	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	unsigned long flags;
+	u8 val;
+
+	spin_lock_irqsave(&ldev->reglock, flags);
+
+	/* First set this pin as input */
+	val = readb(li2c->dir_reg);
+	val |= mask;
+	writeb(val, li2c->dir_reg);
+
+	/* Then get level state from this pin */
+	val = readb(li2c->dat_reg);
+
+	spin_unlock_irqrestore(&ldev->reglock, flags);
+
+	return (val & mask) ? 1 : 0;
+}
+
+static void ls7a_i2c_set_sda(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+	/* set state on the li2c->sda pin */
+	return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
+}
+
+static void ls7a_i2c_set_scl(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+	/* set state on the li2c->scl pin */
+	return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
+}
+
+static int ls7a_i2c_get_sda(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+	/* read value from the li2c->sda pin */
+	return ls7a_gpio_i2c_get(li2c, li2c->sda);
+}
+
+static int ls7a_i2c_get_scl(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+	/* read the value from the li2c->scl pin */
+	return ls7a_gpio_i2c_get(li2c, li2c->scl);
+}
+
+static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
+{
+	struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
+
+	if (li2c) {
+		i2c_del_adapter(&li2c->adapter);
+		kfree(li2c);
+	}
+}
+
+/*
+ * The DC in ls7a1000/ls7a2000 have builtin gpio hardware
+ *
+ * @base: gpio reg base
+ * @index: output channel index, 0 for DVO0, 1 for DVO1
+ */
+struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
+				      void *base,
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
+		li2c->sda = 0x01;  /* pin 0 */
+		li2c->scl = 0x02;  /* pin 1 */
+	} else if (index == 1) {
+		li2c->sda = 0x04;  /* pin 2 */
+		li2c->scl = 0x08;  /* pin 3 */
+	}
+
+	li2c->reg_base = base;
+	li2c->ddev = ddev;
+	li2c->dir_reg = li2c->reg_base + LS7A_DC_GPIO_DIR_REG;
+	li2c->dat_reg = li2c->reg_base + LS7A_DC_GPIO_DAT_REG;
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
+	snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", index);
+
+	i2c_set_adapdata(adapter, li2c);
+
+	ret = i2c_bit_add_bus(adapter);
+	if (ret) {
+		kfree(li2c);
+		return ERR_PTR(ret);
+	}
+
+	ret = drmm_add_action_or_reset(ddev, lsdc_destroy_i2c, li2c);
+	if (ret)
+		return NULL;
+
+	drm_info(ddev, "%s(sda=%u, scl=%u) created for connector-%u\n",
+		 adapter->name, li2c->sda, li2c->scl, index);
+
+	return li2c;
+}
+
+static int lsdc_get_i2c_id(struct lsdc_device *ldev, int index)
+{
+	return index;
+}
+
+struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev,
+					 int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+	struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
+
+	if (descp->has_builtin_i2c) {
+		struct lsdc_i2c *li2c = dispipe->li2c;
+
+		if (li2c)
+			return &li2c->adapter;
+	}
+
+	return i2c_get_adapter(lsdc_get_i2c_id(ldev, index));
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c b/drivers/gpu/drm/lsdc/lsdc_irq.c
new file mode 100644
index 000000000000..25432409a1e0
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_vblank.h>
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+
+/*
+ * For the DC in ls7a2000, clearing interrupt status is achieved by
+ * write "1" to LSDC_INT_REG, For the DC in ls7a1000, ls2k1000,
+ * Interrupt status clear is achieved by write "0" to LSDC_INT_REG.
+ * Two different hardware engineer of Loongson modify it as their will.
+ */
+
+/* For the DC in ls7a2000 */
+static irqreturn_t lsdc_irq_handler(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	/* Read the interrupt status */
+	val = lsdc_rreg32(ldev, LSDC_INT_REG);
+	if ((val & INT_STATUS_MASK) == 0) {
+		drm_warn(ddev, "no interrupt occurs\n");
+		return IRQ_NONE;
+	}
+
+	ldev->irq_status = val;
+
+	/* write "1" to clear the interrupt status */
+	lsdc_wreg32(ldev, LSDC_INT_REG, val);
+
+	return IRQ_WAKE_THREAD;
+}
+
+/* For the DC in ls7a1000 and ls2k1000  */
+static irqreturn_t lsdc_irq_handler_legacy(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	/* Read the interrupt status */
+	val = lsdc_rreg32(ldev, LSDC_INT_REG);
+	if ((val & INT_STATUS_MASK) == 0) {
+		drm_warn(ddev, "no interrupt occurs\n");
+		return IRQ_NONE;
+	}
+
+	ldev->irq_status = val;
+
+	/* write "0" to clear the interrupt status */
+	lsdc_wreg32(ldev, LSDC_INT_REG, val & ~INT_STATUS_MASK);
+
+	return IRQ_WAKE_THREAD;
+}
+
+irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+
+	if (descp->chip == CHIP_LS7A2000)
+		return lsdc_irq_handler;
+
+	return lsdc_irq_handler_legacy;
+}
+
+irqreturn_t lsdc_irq_thread_handler(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_crtc *crtc;
+
+	if (ldev->irq_status & INT_CRTC0_VSYNC) {
+		crtc = drm_crtc_from_index(ddev, 0);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	if (ldev->irq_status & INT_CRTC1_VSYNC) {
+		crtc = drm_crtc_from_index(ddev, 1);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_output.c b/drivers/gpu/drm/lsdc/lsdc_output.c
new file mode 100644
index 000000000000..3a0864d1c1c7
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_output.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_probe_helper.h>
+#include "lsdc_drv.h"
+
+static int lsdc_get_modes(struct drm_connector *connector)
+{
+	unsigned int num = 0;
+	struct edid *edid;
+
+	if (connector->ddc) {
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
+lsdc_unknown_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct i2c_adapter *ddc = connector->ddc;
+
+	if (ddc) {
+		if (drm_probe_ddc(ddc))
+			return connector_status_connected;
+	} else {
+		if (connector->connector_type == DRM_MODE_CONNECTOR_DPI)
+			return connector_status_connected;
+
+		if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+			return connector_status_connected;
+	}
+
+	return connector_status_unknown;
+}
+
+static enum drm_connector_status
+lsdc_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lsdc_display_pipe *pipe = connector_to_display_pipe(connector);
+	struct lsdc_device *ldev = to_lsdc(connector->dev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (pipe->index == 0) {
+		if (val & HDMI0_HPD_FLAG)
+			return connector_status_connected;
+	}
+
+	if (pipe->index == 1) {
+		if (val & HDMI1_HPD_FLAG)
+			return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
+}
+
+static enum drm_connector_status
+lsdc_hdmi_vga_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lsdc_display_pipe *pipe = connector_to_display_pipe(connector);
+	struct drm_device *ddev = connector->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct i2c_adapter *ddc;
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (pipe->index == 1) {
+		if (val & HDMI1_HPD_FLAG)
+			return connector_status_connected;
+
+		return connector_status_disconnected;
+	}
+
+	if (pipe->index == 0) {
+		if (val & HDMI0_HPD_FLAG)
+			return connector_status_connected;
+
+		ddc = connector->ddc;
+		if (ddc) {
+			if (drm_probe_ddc(ddc))
+				return connector_status_connected;
+
+			return connector_status_disconnected;
+		}
+	}
+
+	return connector_status_unknown;
+}
+
+static struct drm_encoder *
+lsdc_connector_get_best_encoder(struct drm_connector *connector,
+				struct drm_atomic_state *state)
+{
+	struct lsdc_display_pipe *pipe = connector_to_display_pipe(connector);
+
+	return &pipe->encoder;
+}
+
+static const struct drm_connector_helper_funcs lsdc_connector_helpers = {
+	.atomic_best_encoder = lsdc_connector_get_best_encoder,
+	.get_modes = lsdc_get_modes,
+};
+
+static const struct drm_connector_funcs lsdc_unknown_connector_funcs = {
+	.detect = lsdc_unknown_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_funcs lsdc_hdmi_vga_connector_funcs = {
+	.detect = lsdc_hdmi_vga_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_funcs lsdc_hdmi_connector_funcs = {
+	.detect = lsdc_hdmi_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_funcs *
+lsdc_get_connector_func(struct lsdc_device *ldev, unsigned int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+
+	if (descp->chip == CHIP_LS7A2000) {
+		if (index == 0)
+			return &lsdc_hdmi_vga_connector_funcs;
+
+		if (index == 1)
+			return &lsdc_hdmi_connector_funcs;
+	}
+
+	return &lsdc_unknown_connector_funcs;
+}
+
+static int lsdc_get_encoder_type(struct lsdc_device *ldev,
+				 unsigned int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+
+	if (descp->chip == CHIP_LS7A2000) {
+		if (index == 0)
+			return DRM_MODE_ENCODER_DAC;
+		if (index == 1)
+			return DRM_MODE_ENCODER_TMDS;
+	}
+
+	if (descp->chip == CHIP_LS7A1000 || descp->chip == CHIP_LS2K1000) {
+		if (index == 0)
+			return DRM_MODE_ENCODER_DPI;
+		if (index == 1)
+			return DRM_MODE_ENCODER_DPI;
+	}
+
+	return DRM_MODE_ENCODER_NONE;
+}
+
+static int lsdc_get_connector_type(struct lsdc_device *ldev,
+				   unsigned int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+
+	if (descp->chip == CHIP_LS7A2000) {
+		if (index == 0)
+			return DRM_MODE_CONNECTOR_VGA;
+		if (index == 1)
+			return DRM_MODE_CONNECTOR_HDMIA;
+	}
+
+	if (descp->chip == CHIP_LS7A1000 || descp->chip == CHIP_LS2K1000) {
+		if (index == 0)
+			return DRM_MODE_CONNECTOR_DPI;
+		if (index == 1)
+			return DRM_MODE_CONNECTOR_DPI;
+	}
+
+	return DRM_MODE_CONNECTOR_Unknown;
+}
+
+static int lsdc_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
+				       struct drm_display_mode *mode)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	struct hdmi_avi_infoframe infoframe;
+	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	unsigned char *ptr = &buffer[HDMI_INFOFRAME_HEADER_SIZE];
+	unsigned int content0, content1, content2, content3;
+	int err;
+
+	err = drm_hdmi_avi_infoframe_from_display_mode(&infoframe, &dispipe->connector, mode);
+	if (err < 0) {
+		drm_err(ddev, "failed to setup AVI infoframe: %d\n", err);
+		return err;
+	}
+
+	/* Fixed infoframe configuration not linked to the mode */
+	infoframe.colorspace = HDMI_COLORSPACE_RGB;
+	infoframe.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+	infoframe.colorimetry = HDMI_COLORIMETRY_NONE;
+
+	err = hdmi_avi_infoframe_pack(&infoframe, buffer, sizeof(buffer));
+	if (err < 0) {
+		drm_err(ddev, "failed to pack AVI infoframe: %d\n", err);
+			return err;
+	}
+
+	content0 = *(unsigned int *)ptr;
+	content1 = *(ptr + 4);
+	content2 = *(unsigned int *)(ptr + 5);
+	content3 = *(unsigned int *)(ptr + 9);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT0, index, content0);
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT1, index, content1);
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT2, index, content2);
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT3, index, content3);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_INFO_CRTL, index,
+			 AVI_PKT_ENABLE | AVI_PKT_SEND_FREQ | AVI_PKT_UPDATE);
+
+	drm_dbg(ddev, "Update HDMI-%u avi infoframe\n", index);
+
+	return 0;
+}
+
+static void lsdc_hdmi_atomic_disable(struct drm_encoder *encoder,
+				     struct drm_atomic_state *state)
+{
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = dispipe->index;
+	u32 val;
+
+	val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index);
+	val &= ~HDMI_PHY_EN;
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
+
+	drm_dbg(ddev, "HDMI-%u disabled\n", index);
+}
+
+static void lsdc_hdmi_atomic_enable(struct drm_encoder *encoder,
+				    struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	u32 video_preamble_length = 8;
+	u32 val;
+
+	/* we are using software gpio emulated i2c */
+	val = HDMI_CTL_PERIOD_MODE |
+	      HDMI_AUDIO_EN |
+	      HDMI_PACKET_EN |
+	      HDMI_INTERFACE_EN;
+
+	val |= video_preamble_length < HDMI_VIDEO_PREAMBLE_SHIFT;
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_CTRL_REG, index, val);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_ZONE_REG, index, 0x00400040);
+
+	val = HDMI_PHY_TERM_STATUS |
+	      HDMI_PHY_TERM_DET_EN |
+	      HDMI_PHY_TERM_H_EN |
+	      HDMI_PHY_TERM_L_EN |
+	      HDMI_PHY_RESET_N |
+	      HDMI_PHY_EN;
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
+
+	drm_dbg(ddev, "HDMI-%u enabled\n", index);
+}
+
+/*
+ *  Fout = M * Fin
+ *
+ *  M = (4 * LF) / (IDF * ODF)
+ *
+ *  Loongson HDMI require M = 10
+ */
+static void lsdc_hdmi_phy_pll_config(struct lsdc_device *ldev,
+				     unsigned int index,
+				     int clock)
+{
+	struct drm_device *ddev = &ldev->base;
+	int count = 0;
+	u32 val;
+
+	/* disable phy pll */
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, 0x0);
+
+	/*
+	 * 10 = (4 * 40) / (8 * 2)
+	 */
+	val = (8 << HDMI_PLL_IDF_SHIFT) |
+	      (40 << HDMI_PLL_LF_SHIFT) |
+	      (1 << HDMI_PLL_ODF_SHIFT) |
+	      HDMI_PLL_ENABLE;
+
+	drm_dbg(ddev, "HDMI-%u clock: %d\n", index, clock);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, val);
+
+	/* wait hdmi phy pll lock */
+	do {
+		val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index);
+
+		++count;
+
+		if (val & HDMI_PLL_LOCKED) {
+			drm_dbg(ddev, "Setting HDMI-%u PLL success(take %d cycles)\n",
+				index, count);
+			break;
+		}
+	} while (count < 1000);
+
+	if (count >= 1000)
+		drm_err(ddev, "Setting HDMI-%u PLL failed\n", index);
+}
+
+static void lsdc_hdmi_atomic_mode_set(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	struct drm_display_mode *mode = &crtc_state->mode;
+
+	lsdc_hdmi_phy_pll_config(ldev, index, mode->clock);
+
+	lsdc_hdmi_set_avi_infoframe(encoder, mode);
+
+	drm_dbg(ddev, "HDMI-%u modeset\n", index);
+}
+
+static const struct drm_encoder_helper_funcs lsdc_hdmi_helper_funcs = {
+	.atomic_disable = lsdc_hdmi_atomic_disable,
+	.atomic_enable = lsdc_hdmi_atomic_enable,
+	.atomic_mode_set = lsdc_hdmi_atomic_mode_set,
+};
+
+static void lsdc_hdmi_reset(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	u32 val = HDMI_CTL_PERIOD_MODE |
+		  HDMI_AUDIO_EN |
+		  HDMI_PACKET_EN |
+		  HDMI_INTERFACE_EN;
+
+	lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
+	lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
+
+	drm_dbg(ddev, "HDMI-%u Reset\n", index);
+}
+
+static const struct drm_encoder_funcs lsdc_encoder_funcs = {
+	.reset = lsdc_hdmi_reset,
+	.destroy = drm_encoder_cleanup,
+};
+
+int lsdc_create_output(struct lsdc_device *ldev, unsigned int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+	struct drm_device *ddev = &ldev->base;
+	struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
+	struct drm_encoder *encoder = &dispipe->encoder;
+	struct drm_connector *connector = &dispipe->connector;
+	struct i2c_adapter *ddc = NULL;
+	struct lsdc_i2c *li2c;
+	int ret;
+
+	ret = drm_encoder_init(ddev,
+			       encoder,
+			       &lsdc_encoder_funcs,
+			       lsdc_get_encoder_type(ldev, index),
+			       "encoder-%u",
+			       index);
+	if (ret) {
+		drm_err(ddev, "Failed to init encoder: %d\n", ret);
+		return ret;
+	}
+
+	encoder->possible_crtcs = BIT(index);
+
+	if (descp->chip == CHIP_LS7A2000)
+		drm_encoder_helper_add(encoder, &lsdc_hdmi_helper_funcs);
+
+	if (descp->has_builtin_i2c) {
+		li2c = lsdc_create_i2c_chan(ddev, ldev->reg_base, index);
+		if (IS_ERR(li2c))
+			return PTR_ERR(li2c);
+
+		dispipe->li2c = li2c;
+
+		ddc = &li2c->adapter;
+	} else {
+		ddc = lsdc_get_i2c_adapter(ldev, index);
+		if (IS_ERR(ddc)) {
+			drm_err(ddev, "Error get ddc for output-%u\n", index);
+			return PTR_ERR(ddc);
+		}
+	}
+
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  lsdc_get_connector_func(ldev, index),
+					  lsdc_get_connector_type(ldev, index),
+					  ddc);
+	if (ret) {
+		drm_err(ddev, "Init connector-%d failed\n", index);
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &lsdc_connector_helpers);
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	ldev->num_output++;
+
+	drm_info(ddev, "output-%u initialized\n", index);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c b/drivers/gpu/drm/lsdc/lsdc_plane.c
new file mode 100644
index 000000000000..0fbfc8cc943d
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane_helper.h>
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_ttm.h"
+
+static const u32 lsdc_primary_formats[] = {
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
+static void lsdc_primary_update_impl(struct lsdc_device *ldev,
+				     struct drm_framebuffer *fb,
+				     unsigned int fb_offset,
+				     unsigned int pipe)
+{
+	struct drm_device *ddev = &ldev->base;
+	struct ttm_buffer_object *tbo = to_ttm_bo(fb->obj[0]);
+	u64 bo_offset = lsdc_bo_gpu_offset(tbo);
+	u64 fb_addr = ldev->vram_base + bo_offset + fb_offset;
+	u32 stride = fb->pitches[0];
+	u32 cfg;
+	u32 lo, hi;
+
+	if (IS_ERR((void *)bo_offset)) {
+		drm_warn(ddev, "bo not pinned, should not happen\n");
+		return;
+	}
+
+	/* 40-bit width physical address bus */
+	lo = fb_addr & 0xFFFFFFFF;
+	hi = (fb_addr >> 32) & 0xFF;
+
+	cfg = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, pipe);
+	if (cfg & CFG_FB_IN_USING) {
+		drm_dbg(ddev, "CRTC-%u(FB1) is in using\n", pipe);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG, pipe, lo);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG, pipe, hi);
+	} else {
+		drm_dbg(ddev, "CRTC-%u(FB0) is in using\n", pipe);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG, pipe, lo);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG, pipe, hi);
+	}
+
+	drm_dbg(ddev, "CRTC-%u scanout from 0x%llx\n", pipe, fb_addr);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, pipe, stride);
+
+	/* clean old fb format settings */
+	cfg &= ~CFG_PIX_FMT_MASK;
+	/* TODO: add RGB565 support */
+	cfg |= LSDC_PF_XRGB8888;
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, pipe, cfg);
+}
+
+static int lsdc_plane_atomic_check(struct drm_plane *plane,
+				   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state;
+	bool can_position;
+
+	if (!crtc)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	can_position = (plane->type == DRM_PLANE_TYPE_CURSOR) ? true : false;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   can_position,
+						   true);
+}
+
+static void lsdc_update_primary_plane(struct drm_plane *plane,
+				      struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(plane->dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	unsigned int pipe = drm_crtc_index(crtc);
+	unsigned int fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
+
+	lsdc_primary_update_impl(ldev, fb, fb_offset, pipe);
+}
+
+static void lsdc_disable_primary_plane(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	/* do nothing, just prevent call into atomic_update() */
+	drm_dbg(plane->dev, "%s disabled\n", plane->name);
+}
+
+static void lsdc_ttm_cleanup_fb(struct drm_plane *plane,
+				struct drm_plane_state *state,
+				unsigned int np)
+{
+	struct drm_gem_object *obj;
+	struct drm_framebuffer *fb = state->fb;
+
+	while (np) {
+		--np;
+		obj = fb->obj[np];
+		if (!obj) {
+			drm_err(plane->dev, "%s: no obj\n", plane->name);
+			continue;
+		}
+		lsdc_bo_unpin(obj);
+	}
+}
+
+static int lsdc_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *new_state)
+{
+	struct drm_framebuffer *fb = new_state->fb;
+	struct ttm_buffer_object *tbo;
+	struct drm_gem_object *obj;
+	unsigned int i;
+	int ret;
+
+	if (!fb)
+		return 0;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		obj = fb->obj[i];
+		if (!obj) {
+			ret = -EINVAL;
+			goto err_ret;
+		}
+		tbo = to_ttm_bo(obj);
+
+		lsdc_bo_set_placement(tbo, LSDC_GEM_DOMAIN_VRAM, TTM_PL_FLAG_CONTIGUOUS);
+
+		ret = lsdc_bo_pin(obj);
+		if (ret)
+			goto err_ret;
+	}
+
+	ret = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (ret)
+		goto err_ret;
+
+	return 0;
+
+err_ret:
+	drm_err(plane->dev, "%s: %d\n", __func__, ret);
+	lsdc_ttm_cleanup_fb(plane, new_state, i);
+	return ret;
+}
+
+static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
+				  struct drm_plane_state *old_state)
+{
+	struct drm_framebuffer *fb = old_state->fb;
+
+	if (!fb)
+		return;
+
+	lsdc_ttm_cleanup_fb(plane, old_state, fb->format->num_planes);
+}
+
+static const struct drm_plane_helper_funcs lsdc_primary_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_plane_atomic_check,
+	.atomic_update = lsdc_update_primary_plane,
+	.atomic_disable = lsdc_disable_primary_plane,
+};
+
+/* update the format, size and location of the cursor */
+static void lsdc_cursor_atomic_update(struct drm_plane *plane,
+				      struct drm_atomic_state *state)
+{
+	struct lsdc_cursor *cursor = to_lsdc_cursor(plane);
+	const struct lsdc_cursor_lowing_funcs *cfuncs = cursor->funcs;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *cursor_fb = new_plane_state->fb;
+	struct ttm_buffer_object *tbo = to_ttm_bo(cursor_fb->obj[0]);
+	u64 cursor_bo_offset = lsdc_bo_gpu_offset(tbo);
+
+	cfuncs->update_position(cursor, new_plane_state->crtc_x, new_plane_state->crtc_y);
+	cfuncs->update_offset(cursor, cursor_bo_offset);
+	cfuncs->update_config(cursor, CURSOR_FORMAT_ARGB8888 | CURSOR_SIZE_64X64);
+}
+
+static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_cursor *cursor = to_lsdc_cursor(plane);
+	const struct lsdc_cursor_lowing_funcs *cfuncs = cursor->funcs;
+
+	cfuncs->update_config(cursor, 0);
+
+	drm_dbg(ddev, "%s disabled\n", plane->name);
+}
+
+static const struct drm_plane_helper_funcs lsdc_cursor_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_plane_atomic_check,
+	.atomic_update = lsdc_cursor_atomic_update,
+	.atomic_disable = lsdc_cursor_atomic_disable,
+};
+
+static const struct drm_plane_funcs lsdc_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+static void lsdc_update_cursor0_position(struct lsdc_cursor * const this,
+					 int x,
+					 int y)
+{
+	struct lsdc_device *ldev = this->ldev;
+
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
+}
+
+static void lsdc_update_cursor1_position(struct lsdc_cursor * const this,
+					 int x,
+					 int y)
+{
+	struct lsdc_device *ldev = this->ldev;
+
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y << 16) | x);
+}
+
+static void lsdc_update_cursor0_config(struct lsdc_cursor * const this,
+				       u32 cfg)
+{
+	struct lsdc_device *ldev = this->ldev;
+
+	if (this->cfg != cfg) {
+		this->cfg = cfg;
+		lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg & ~CURSOR_LOCATION);
+	}
+}
+
+/*
+ * Update location, format, enable and disable of the cursor,
+ * For those who have two hardware cursor, cursor 0 is attach it to CRTC-0,
+ * cursor 1 is attached to CRTC-1. Compositing the primary and cursor plane
+ * is automatically done by hardware, the cursor is alway on the top of the
+ * primary, there is no depth property can be set. pertty convenient.
+ */
+static void lsdc_update_cursor1_config(struct lsdc_cursor * const this,
+				       u32 cfg)
+{
+	struct lsdc_device *ldev = this->ldev;
+
+	if (this->cfg != cfg) {
+		this->cfg = cfg;
+		lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, cfg | CURSOR_LOCATION);
+	}
+}
+
+static void lsdc_update_cursor0_offset(struct lsdc_cursor * const this,
+				       u64 offset)
+{
+	struct lsdc_device *ldev = this->ldev;
+	u64 addr;
+
+	if (this->offset != offset) {
+		this->offset = offset;
+		addr = ldev->vram_base + offset;
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (addr >> 32) & 0xFF);
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, addr);
+	}
+}
+
+static void lsdc_update_cursor1_offset(struct lsdc_cursor * const this,
+				       u64 offset)
+{
+	struct lsdc_device *ldev = this->ldev;
+	u64 addr;
+
+	if (this->offset != offset) {
+		this->offset = offset;
+		addr = ldev->vram_base + offset;
+		lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG, (addr >> 32) & 0xFF);
+		lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG, addr);
+	}
+}
+
+static const struct lsdc_cursor_lowing_funcs cursor_lowing_funcs_pipe0 = {
+	.update_position = lsdc_update_cursor0_position,
+	.update_config = lsdc_update_cursor0_config,
+	.update_offset = lsdc_update_cursor0_offset,
+};
+
+static const struct lsdc_cursor_lowing_funcs cursor_lowing_funcs_pipe1 = {
+	.update_position = lsdc_update_cursor1_position,
+	.update_config = lsdc_update_cursor1_config,
+	.update_offset = lsdc_update_cursor1_offset,
+};
+
+static void lsdc_update_cursor0_config_quirk(struct lsdc_cursor * const this,
+					     u32 cfg)
+{
+	struct lsdc_device *ldev = this->ldev;
+
+	/*
+	 * If bit 4 of LSDC_CURSOR0_CFG_REG is 1, cursor will be locate at CRTC-1,
+	 * if bit 4 of LSDC_CURSOR0_CFG_REG is 0, cursor will be locate at CRTC-0.
+	 * We made it shared by the two CRTC on extend screen usage case.
+	 */
+	lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg | CURSOR_LOCATION);
+}
+
+static const struct lsdc_cursor_lowing_funcs cursor_lowing_funcs_pipe1_quirk = {
+	.update_position = lsdc_update_cursor0_position,
+	.update_config = lsdc_update_cursor0_config_quirk,
+	.update_offset = lsdc_update_cursor0_offset,
+};
+
+static void lsdc_cursor_plane_preinit(struct drm_plane *plane,
+				      struct lsdc_device *ldev,
+				      unsigned int index)
+{
+	struct lsdc_cursor *cursor = to_lsdc_cursor(plane);
+	const struct lsdc_desc *descp = ldev->descp;
+
+	cursor->ldev = ldev;
+
+	if (index == 0) {
+		cursor->funcs = &cursor_lowing_funcs_pipe0;
+		return;
+	}
+
+	/* index == 1 case */
+	if (descp->chip == CHIP_LS7A2000 || descp->chip == CHIP_LS2K2000) {
+		cursor->funcs = &cursor_lowing_funcs_pipe1;
+		return;
+	}
+
+	/* only one hardware cursor in ls7a1000, ls2k1000 */
+	cursor->funcs = &cursor_lowing_funcs_pipe1_quirk;
+}
+
+int lsdc_plane_init(struct lsdc_device *ldev,
+		    struct drm_plane *plane,
+		    enum drm_plane_type type,
+		    unsigned int index)
+{
+	struct drm_device *ddev = &ldev->base;
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
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		drm_plane_helper_add(plane, &lsdc_cursor_plane_helpers);
+		lsdc_cursor_plane_preinit(plane, ldev, index);
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_err(ddev, "overlay plane is not supported\n");
+		break;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c b/drivers/gpu/drm/lsdc/lsdc_pll.c
new file mode 100644
index 000000000000..6840ac62387f
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
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
+	unsigned __1          : 14;  /*  7 : 20                          */
+	unsigned loopc        : 9;   /* 21 : 29    clock multiplier      */
+	unsigned __2          : 2;   /* 30 : 31                          */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned div_ref      : 7;   /*  0 : 6     input clock divider   */
+	unsigned locked       : 1;   /*  7         PLL locked status     */
+	unsigned sel_out      : 1;   /*  8         output clk selector   */
+	unsigned __3          : 2;   /*  9 : 10                          */
+	unsigned set_param    : 1;   /*  11        trigger the update    */
+	unsigned bypass       : 1;   /*  12                              */
+	unsigned powerdown    : 1;   /*  13                              */
+	unsigned __4          : 18;  /*  14 : 31                         */
+};
+
+/* u128 */
+struct ls2k1000_pixpll_bitmap {
+	/* Byte 0 ~ Byte 3 */
+	unsigned sel_out      :  1;  /*  0      select this PLL          */
+	unsigned __1          :  1;  /*  1                               */
+	unsigned sw_adj_en    :  1;  /*  2      allow software adjust    */
+	unsigned bypass       :  1;  /*  3      bypass L1 PLL            */
+	unsigned __2          :  3;  /*  4:6                             */
+	unsigned lock_en      :  1;  /*  7      enable lock L1 PLL       */
+	unsigned __3          :  2;  /*  8:9                             */
+	unsigned lock_check   :  2;  /* 10:11   precision check          */
+	unsigned __4          :  4;  /* 12:15                            */
+
+	unsigned locked       :  1;  /* 16      PLL locked flag bit      */
+	unsigned __5          :  2;  /* 17:18                            */
+	unsigned powerdown    :  1;  /* 19      powerdown the pll if set */
+	unsigned __6          :  6;  /* 20:25                            */
+	unsigned div_ref      :  6;  /* 26:31   L1 Prescaler             */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned loopc        : 10;  /* 32:41   Clock Multiplier         */
+	unsigned l1_div       :  6;  /* 42:47   not used                 */
+	unsigned __7          : 16;  /* 48:63                            */
+
+	/* Byte 8 ~ Byte 15 */
+	unsigned div_out      :  6;  /* 0 : 5   output clock divider     */
+	unsigned __8          : 26;  /* 6 : 31                           */
+	unsigned __9          : 32;  /* 70: 127                          */
+};
+
+union lsdc_pixpll_bitmap {
+	struct ls7a1000_pixpll_bitmap ls7a1000;
+	struct ls2k1000_pixpll_bitmap ls2k1000;
+
+	u32 dword[4];
+};
+
+struct pixclk_to_pll_parm {
+	/* kHz */
+	unsigned int clock;
+
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
+	{297000, 2560, 1080, 60,  8, 95,  4},   /* 2560x1080@75Hz */
+	{146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
+	{135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
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
+/*
+ * lsdc_pixpll_setup - ioremap the device dependent PLL registers
+ *
+ * @this: point to the object where this function is called from
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
+			     struct lsdc_pll_parms *pout)
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
+ *  refclk is determined by the oscillator mounted board(Here is 100MHz in
+ *  almost all case)
+ *
+ * @this: point to the object from which this function is called
+ * @clock_khz: the desired output pixel clock, the unit is kHz
+ * @pout: point to the out struct of lsdc_pll_parms
+ *
+ *  Return true if a parameter is found, otherwise return false
+ */
+static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
+				unsigned int clock_khz,
+				struct lsdc_pll_parms *pout)
+{
+	unsigned int refclk = this->ref_clock;
+	const unsigned int tolerance = 1000;
+	unsigned int min = tolerance;
+	unsigned int div_out, loopc, div_ref;
+	unsigned int computed;
+
+	if (lsdc_pixpll_find(this, clock_khz, pout))
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
+				computed = refclk / div_ref * loopc / div_out;
+
+				if (clock_khz > computed)
+					diff = clock_khz - computed;
+				else if (clock_khz < computed)
+					diff = computed - clock_khz;
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
+ * @pin: point to the struct of lsdc_pll_parms passed in
+ *
+ * return 0 if successful.
+ */
+static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
+					struct lsdc_pll_parms const *pin)
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
+	val |= pin->div_ref;        /* div_ref */
+	writel(val, reg + 0x4);
+
+	val = readl(reg);
+	val &= ~0x7f;
+	val |= pin->div_out;        /* div_out */
+
+	val &= ~(0x1ff << 21);
+	val |= pin->loopc << 21;    /* loopc */
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
+	} while (!locked && (counter < 2000));
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
+ * @pin: point to the struct of lsdc_pll_parms passed in
+ *
+ * return 0 if successful.
+ */
+static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
+					struct lsdc_pll_parms const *pin)
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
+	val |= pin->div_ref << 26;
+	writel(val, reg);
+
+	val = readl(reg + 4);
+	/* clear loopc bit field */
+	val &= ~0x0fff;
+	/* set loopc bit field */
+	val |= pin->loopc;
+	writel(val, reg + 4);
+
+	/* set div_out */
+	writel(pin->div_out, reg + 8);
+
+	val = readl(reg);
+	/* use this parms configured just now */
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
+	} while (!locked && (counter < 2000));
+
+	drm_dbg(this->ddev, "%u loop waited\n", counter);
+
+	/* Switch to software configured PLL instead of refclk */
+	val |= 1;
+	writel(val, reg);
+
+	return 0;
+}
+
+static unsigned int ls7a1000_get_clock_rate(struct lsdc_pll * const this,
+					    struct lsdc_pll_parms *pout)
+{
+	union lsdc_pixpll_bitmap parms;
+	struct ls7a1000_pixpll_bitmap *obj = &parms.ls7a1000;
+	unsigned int out;
+
+	parms.dword[0] = readl(this->mmio);
+	parms.dword[1] = readl(this->mmio + 4);
+	out = this->ref_clock / obj->div_ref * obj->loopc / obj->div_out;
+	if (pout) {
+		pout->div_ref = obj->div_ref;
+		pout->loopc = obj->loopc;
+		pout->div_out = obj->div_out;
+	}
+
+	return out;
+}
+
+static unsigned int ls2k1000_get_clock_rate(struct lsdc_pll * const this,
+					    struct lsdc_pll_parms *pout)
+{
+	union lsdc_pixpll_bitmap parms;
+	struct ls2k1000_pixpll_bitmap *obj = &parms.ls2k1000;
+	unsigned int out;
+
+	parms.dword[0] = readl(this->mmio);
+	parms.dword[1] = readl(this->mmio + 4);
+	parms.dword[2] = readl(this->mmio + 8);
+	parms.dword[3] = readl(this->mmio + 12);
+	out = this->ref_clock / obj->div_ref * obj->loopc / obj->div_out;
+	if (pout) {
+		pout->div_ref = obj->div_ref;
+		pout->loopc = obj->loopc;
+		pout->div_out = obj->div_out;
+	}
+
+	return out;
+}
+
+static const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls7a1000_pixpll_param_update,
+	.get_clock_rate = ls7a1000_get_clock_rate,
+};
+
+static const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls2k1000_pixpll_param_update,
+	.get_clock_rate = ls2k1000_get_clock_rate,
+};
+
+int lsdc_pixpll_init(struct lsdc_pll * const this,
+		     struct drm_device *ddev,
+		     unsigned int index)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+
+	this->ddev = ddev;
+	this->index = index;
+	this->ref_clock = LSDC_PLL_REF_CLK;
+
+	/* LS7A1000, LS7A2000 and LS2K2000's setting registers is same */
+	if (descp->chip == CHIP_LS7A2000 ||
+	    descp->chip == CHIP_LS7A1000 ||
+	    descp->chip == CHIP_LS2K2000) {
+		if (index == 0)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL1_REG;
+		this->reg_size = 8;
+		this->funcs = &ls7a1000_pixpll_funcs;
+	} else if (descp->chip == CHIP_LS2K1000) {
+		if (index == 0)
+			this->reg_base = LS2K1000_CFG_REG_BASE + LS2K1000_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS2K1000_CFG_REG_BASE + LS2K1000_PIX_PLL1_REG;
+
+		this->reg_size = 16;
+		this->funcs = &ls2k1000_pixpll_funcs;
+	} else {
+		drm_err(this->ddev, "unknown chip, the driver need update\n");
+		return -ENOENT;
+	}
+
+	return this->funcs->setup(this);
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.h b/drivers/gpu/drm/lsdc/lsdc_pll.h
new file mode 100644
index 000000000000..538739f461f2
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_pll.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_PLL_H__
+#define __LSDC_PLL_H__
+
+#include <drm/drm_device.h>
+
+/*
+ * Loongson Pixel PLL hardware structure
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
+ *    +--- sel_out (bypass above software configurable clock if set) ----+
+ *
+ *  sel_out: PLL clock output selector (for debug purpose only).
+ *
+ *  If sel_out == 1, it will take refclk as output directly,
+ *  the L1 Prescaler and the out divider will be bypassed.
+ *
+ *  If sel_out == 0, then outclk = refclk / div_ref * loopc / div_out;
+ *
+ * PLL working requirements:
+ *
+ *  1) 20 MHz <= refclk / div_ref <= 40Mhz
+ *  2) 1.2 GHz <= refclk /div_out * loopc <= 3.2 Ghz
+ */
+
+struct lsdc_pll_parms {
+	unsigned int div_ref;
+	unsigned int loopc;
+	unsigned int div_out;
+};
+
+struct lsdc_pll;
+
+struct lsdc_pixpll_funcs {
+	int (*setup)(struct lsdc_pll * const this);
+	bool (*compute)(struct lsdc_pll * const this,
+			unsigned int clock,
+			struct lsdc_pll_parms *pout);
+	int (*update)(struct lsdc_pll * const this,
+		      struct lsdc_pll_parms const *pin);
+	unsigned int (*get_clock_rate)(struct lsdc_pll * const this,
+				       struct lsdc_pll_parms *pout);
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
diff --git a/drivers/gpu/drm/lsdc/lsdc_probe.c b/drivers/gpu/drm/lsdc/lsdc_probe.c
new file mode 100644
index 000000000000..6c6f9db67499
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_probe.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "lsdc_drv.h"
+
+/*
+ * Processor ID (implementation) values for bits 15:8 of the PRID register.
+ */
+#define LOONGSON_CPU_PRID_IMP_MASK	0xff00
+/*
+ * Particular Revision values for bits 7:0 of the PRID register.
+ */
+#define LOONGSON_CPU_PRID_REV_MASK      0x00ff
+
+#define LOONGARCH_CPU_PRID_LS2K1000     0xa000
+#define LOONGARCH_CPU_PRID_LS2K2000     0xb000
+#define LOONGARCH_CPU_PRID_LS3A5000     0xc000
+
+#define LOONGSON_CPU_PRID_IMP_LS2K      0x6100  /* Loongson 2K series SoC */
+
+#define LOONGARCH_CPUCFG_PRID_REG       0x0
+
+unsigned int loongson_cpu_get_prid(void)
+{
+	unsigned int prid = 0;
+
+#if defined(__loongarch__)
+	__asm__ volatile("cpucfg %0, %1\n\t"
+			: "=&r"(prid)
+			: "r"(LOONGARCH_CPUCFG_PRID_REG)
+			);
+#endif
+
+#if defined(__mips__)
+	__asm__ volatile("mfc0\t%0, $15\n\t"
+			: "=r" (prid)
+			);
+#endif
+
+	return prid;
+}
+
+/* LS2K2000 has only LoongArch edition (LA364) */
+bool lsdc_is_ls2k2000(void)
+{
+	unsigned int prid = loongson_cpu_get_prid();
+
+	if ((prid & LOONGSON_CPU_PRID_IMP_MASK) == LOONGARCH_CPU_PRID_LS2K2000)
+		return true;
+
+	return false;
+}
+
+/*
+ * LS2K1000 has loongarch edition(LA264) and mips edition(mips64r2),
+ * CPU core and instruction set change, but remain is basically same.
+ */
+bool lsdc_is_ls2k1000(void)
+{
+	unsigned int prid;
+
+	prid = loongson_cpu_get_prid();
+
+#if defined(__loongarch__)
+	if ((prid & LOONGSON_CPU_PRID_IMP_MASK) == LOONGARCH_CPU_PRID_LS2K1000)
+		return true;
+#endif
+
+#if defined(__mips__)
+	if ((prid & LOONGSON_CPU_PRID_IMP_MASK) == LOONGSON_CPU_PRID_IMP_LS2K)
+		return true;
+#endif
+
+	return false;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.h b/drivers/gpu/drm/lsdc/lsdc_regs.h
new file mode 100644
index 000000000000..b3a8d1b9399f
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_regs.h
@@ -0,0 +1,343 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_REGS_H__
+#define __LSDC_REGS_H__
+
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+/*
+ * PIXEL PLL Reference clock
+ */
+#define LSDC_PLL_REF_CLK                100000           /* kHz */
+
+/*
+ * Those PLL registers are relative to LSxxxxx_CFG_REG_BASE. xxxxx = 7A1000,
+ * 2K1000, 2K2000 etc
+ */
+
+#define LS2K1000_PIX_PLL0_REG           0x04B0
+#define LS2K1000_PIX_PLL1_REG           0x04C0
+
+#if defined(__mips__)
+#define LS2K1000_CFG_REG_BASE           0x1fe10000    /* mips64r2 edition */
+#else
+#define LS2K1000_CFG_REG_BASE           0x1fe00000    /* LoongArch edition */
+#endif
+
+/* LS7A1000 and LS2K2000 */
+#define LS7A1000_PIX_PLL0_REG           0x04B0
+#define LS7A1000_PIX_PLL1_REG           0x04C0
+#define LS7A1000_CFG_REG_BASE           0x10010000
+
+#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
+
+enum lsdc_pixel_format {
+	LSDC_PF_NONE = 0,
+	LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
+	LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits [16 bits] */
+	LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
+	LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
+	LSDC_PF_RGBA8888 = 5,  /* ARGB [32 bits] */
+};
+
+/*
+ * Each crtc has two set fb address registers usable, CFG_FB_IN_USING of
+ * LSDC_CRTCx_CFG_REG specify which fb address register is currently
+ * in using by the CRTC. CFG_PAGE_FLIP of LSDC_CRTCx_CFG_REG is used to
+ * trigger the switch which will be finished at the very vblank. If you
+ * want to switch back, set CFG_PAGE_FLIP again.
+ */
+#define CFG_PAGE_FLIP                   BIT(7)
+#define CFG_OUTPUT_EN                   BIT(8)
+/* CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using hardware logic */
+#define CFG_PANEL_SWITCH                BIT(9)
+/* Indicate witch fb addr reg is in using, currently */
+#define CFG_FB_IN_USING                 BIT(11)
+#define CFG_GAMMA_EN                    BIT(12)
+
+/* The DC get soft reset if voltage level change from 1 -> 0 */
+#define CFG_RESET_N                     BIT(20)
+
+/* The DMA step of the DC in LS7A2000 is configurable */
+#define CFG_DMA_STEP_MASK              GENMASK(17, 16)
+#define CFG_DMA_STEP_SHIFT             16
+enum lsdc_dma_steps {
+	LSDC_DMA_STEP_256_BYTES = 0 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_128_BYTES = 1 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_64_BYTES = 2 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_32_BYTES = 3 << CFG_DMA_STEP_SHIFT,
+};
+
+#define CFG_HSYNC_EN                    BIT(30)
+#define CFG_HSYNC_INV                   BIT(31)
+#define CFG_VSYNC_EN                    BIT(30)
+#define CFG_VSYNC_INV                   BIT(31)
+
+/******** CRTC0 & DVO0 ********/
+#define LSDC_CRTC0_CFG_REG              0x1240
+
+/*
+ * If FB0_XX_ADDR_REG is in using, we write the address to FB0_XX_ADDR_REG,
+ * if FB1_XX_ADDR_REG is in using, we write the address to FB1_XX_ADDR_REG.
+ * For each CRTC, the switch from using FB0_XX_ADDR_REG to FB1_XX_ADDR_REG
+ * is triggered by set CFG_PAGE_FLIP bit of LSDC_CRTCx_CFG_REG, trigger it
+ * again if you want switch back.
+ */
+#define LSDC_CRTC0_FB0_LO_ADDR_REG      0x1260
+#define LSDC_CRTC0_FB0_HI_ADDR_REG      0x15A0
+#define LSDC_CRTC0_FB1_LO_ADDR_REG      0x1580
+#define LSDC_CRTC0_FB1_HI_ADDR_REG      0x15C0
+#define LSDC_CRTC0_STRIDE_REG           0x1280
+#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
+
+/* [27:16] total number of pixels, [11:0] Active number of pixels, horizontal */
+#define LSDC_CRTC0_HDISPLAY_REG         0x1400
+/* [12:0] hsync start [28:16] hsync end, 30: hsync enable, 31: hsync invert */
+#define LSDC_CRTC0_HSYNC_REG            0x1420
+/* [27:16] total number of pixels, [11:0] Active number of pixels, vertical */
+#define LSDC_CRTC0_VDISPLAY_REG         0x1480
+/* [12:0] vsync start [28:16] vsync end, 30: vsync enable, 31: vsync invert */
+#define LSDC_CRTC0_VSYNC_REG            0x14A0
+
+#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
+#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
+
+/******** CTRC1 & DVO1 ********/
+#define LSDC_CRTC1_CFG_REG              0x1250
+#define LSDC_CRTC1_FB0_LO_ADDR_REG      0x1270
+#define LSDC_CRTC1_FB0_HI_ADDR_REG      0x15B0
+#define LSDC_CRTC1_FB1_LO_ADDR_REG      0x1590
+#define LSDC_CRTC1_FB1_HI_ADDR_REG      0x15D0
+#define LSDC_CRTC1_STRIDE_REG           0x1290
+#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
+#define LSDC_CRTC1_HDISPLAY_REG         0x1410
+#define LSDC_CRTC1_HSYNC_REG            0x1430
+#define LSDC_CRTC1_VDISPLAY_REG         0x1490
+#define LSDC_CRTC1_VSYNC_REG            0x14B0
+#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
+#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
+
+/*
+ * LS7A2000 has the hardware which record the scan position of the CRTC
+ * [31:16] : current X position, [15:0] : current Y position
+ */
+#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
+#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
+
+/*
+ * LS7A2000 has the hardware which count the number of vblank generated
+ */
+#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
+#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
+
+/*
+ * In gross, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG = 0x10,
+ * but not all lsdc registers obay this rule, our hardware
+ * engineer are lack experiance when they are young...
+ */
+#define CRTC_PIPE_OFFSET                0x10
+
+/*
+ * There is only one hardware cursor unit in ls7a1000 and ls2k1000.
+ * While ls7a2000 has two hardware cursor unit.
+ */
+#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
+enum lsdc_cursor_format {
+	CURSOR_FORMAT_DISABLE = 0,
+	CURSOR_FORMAT_MONOCHROME = 1,
+	CURSOR_FORMAT_ARGB8888 = 2,
+};
+
+#define CURSOR_SIZE_64X64               BIT(2)  /* 1: 64x64, 0: 32x32 */
+#define CURSOR_LOCATION                 BIT(4)
+
+#define LSDC_CURSOR0_CFG_REG            0x1520
+#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
+#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
+#define LSDC_CURSOR0_POSITION_REG       0x1540
+#define LSDC_CURSOR0_BG_COLOR_REG       0x1550  /* background color */
+#define LSDC_CURSOR0_FG_COLOR_REG       0x1560  /* foreground color */
+
+#define LSDC_CURSOR1_CFG_REG            0x1670
+#define LSDC_CURSOR1_ADDR_LO_REG        0x1680
+#define LSDC_CURSOR1_ADDR_HI_REG        0x16e0
+#define LSDC_CURSOR1_POSITION_REG       0x1690  /* [31:16] Y, [15:0] X */
+#define LSDC_CURSOR1_BG_COLOR_REG       0x16A0  /* background color */
+#define LSDC_CURSOR1_FG_COLOR_REG       0x16B0  /* foreground color */
+
+/*
+ * DC Interrupt Control Register, 32bit, Address Offset: 1570
+ *
+ * Bits 15:0 inidicate the interrupt status
+ * Bits 31:16 control enable interrupts corresponding to bit 15:0 or not
+ * Write 1 to enable, write 0 to disable
+ *
+ * RF: Read Finished
+ * IDBU: Internal Data Buffer Underflow
+ * IDBFU: Internal Data Buffer Fatal Underflow
+ * CBRF: Cursor Buffer Read Finished Flag, no use.
+ *
+ * +-------+--------------------------+-------+--------+--------+-------+
+ * | 31:27 |         26:16            | 15:11 |   10   |   9    |   8   |
+ * +-------+--------------------------+-------+--------+--------+-------+
+ * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0 | IDBFU1 | IDBU0 |
+ * +-------+--------------------------+-------+--------+--------+-------+
+ *
+ * +-------+-----+-----+------+--------+--------+--------+--------+
+ * |   7   |  6  |  5  |  4   |   3    |   2    |   1    |   0    |
+ * +-------+-----+-----+------+--------+--------+--------+--------+
+ * | IDBU1 | RF0 | RF1 | CRRF | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
+ * +-------+-----+-----+------+--------+--------+--------+--------+
+ *
+ * unfortunately, CRTC0's interrupt is mess with CRTC1's interrupt
+ */
+
+#define LSDC_INT_REG                    0x1570
+
+#define INT_CRTC0_VSYNC                 BIT(2)
+#define INT_CRTC0_HSYNC                 BIT(3)
+#define INT_CRTC0_RF                    BIT(6)
+#define INT_CRTC0_IDBU                  BIT(8)
+#define INT_CRTC0_IDBFU                 BIT(10)
+
+#define INT_CRTC1_VSYNC                 BIT(0)
+#define INT_CRTC1_HSYNC                 BIT(1)
+#define INT_CRTC1_RF                    BIT(5)
+#define INT_CRTC1_IDBU                  BIT(7)
+#define INT_CRTC1_IDBFU                 BIT(9)
+
+#define INT_CRTC0_VSYNC_EN              BIT(18)
+#define INT_CRTC0_HSYNC_EN              BIT(19)
+#define INT_CRTC0_RF_EN                 BIT(22)
+#define INT_CRTC0_IDBU_EN               BIT(24)
+#define INT_CRTC0_IDBFU_EN              BIT(26)
+
+#define INT_CRTC1_VSYNC_EN              BIT(16)
+#define INT_CRTC1_HSYNC_EN              BIT(17)
+#define INT_CRTC1_RF_EN                 BIT(21)
+#define INT_CRTC1_IDBU_EN               BIT(23)
+#define INT_CRTC1_IDBFU_EN              BIT(25)
+
+#define INT_STATUS_MASK                 GENMASK(15, 0)
+
+/*
+ * LS7A1000/LS7A2000 have 4 gpios which are used to emulated I2C.
+ * They are under control of the LS7A_DC_GPIO_DAT_REG and LS7A_DC_GPIO_DIR_REG
+ * register, Those GPIOs has no relationship whth the GPIO hardware on the
+ * bridge chip itself. Those offsets are relative to DC register base address
+ *
+ * LS2k1000 don't have those registers, they use hardware i2c or general GPIO
+ * emulated i2c from linux i2c subsystem.
+ *
+ * GPIO data register, address offset: 0x1650
+ *   +---------------+-----------+-----------+
+ *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
+ *   +---------------+-----------+-----------+
+ *   |               |    DVO1   |    DVO0   |
+ *   +      N/A      +-----------+-----------+
+ *   |               | SCL | SDA | SCL | SDA |
+ *   +---------------+-----------+-----------+
+ */
+#define LS7A_DC_GPIO_DAT_REG            0x1650
+
+/*
+ *  GPIO Input/Output direction control register, address offset: 0x1660
+ */
+#define LS7A_DC_GPIO_DIR_REG            0x1660
+
+/*
+ *  LS7A2000 has two built-in HDMI Encoder and one VGA encoder
+ */
+
+/*
+ * Number of continuous packets may be present
+ * in HDMI hblank and vblank zone, should >= 48
+ */
+#define LSDC_HDMI0_ZONE_REG             0x1700
+#define LSDC_HDMI1_ZONE_REG             0x1710
+
+#define HDMI_INTERFACE_EN               BIT(0)
+#define HDMI_PACKET_EN                  BIT(1)
+#define HDMI_AUDIO_EN                   BIT(2)
+#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
+#define HDMI_VIDEO_PREAMBLE_SHIFT       4
+#define HDMI_HW_I2C_EN                  BIT(8)
+#define HDMI_CTL_PERIOD_MODE            BIT(9)
+#define LSDC_HDMI0_CTRL_REG             0x1720
+#define LSDC_HDMI1_CTRL_REG             0x1730
+
+/*
+ * Preamble:
+ * Immediately preceding each video data period or data island period is the
+ * preamble. This is a sequence of eight identical control characters that
+ * indicate whether the upcoming data period is a video data period or is a
+ * data island. The values of CTL0, CTL1, CTL2, and CTL3 indicate the type of
+ * data period that follows.
+ */
+
+#define HDMI_PHY_EN                     BIT(0)
+#define HDMI_PHY_RESET_N                BIT(1)
+#define HDMI_PHY_TERM_L_EN              BIT(8)
+#define HDMI_PHY_TERM_H_EN              BIT(9)
+#define HDMI_PHY_TERM_DET_EN            BIT(10)
+#define HDMI_PHY_TERM_STATUS            BIT(11)
+#define LSDC_HDMI0_PHY_CTRL_REG         0x1800
+#define LSDC_HDMI1_PHY_CTRL_REG         0x1810
+
+/*
+ *  IDF: Input Division Factor
+ *  ODF: Output Division Factor
+ *   LF: Loop Factor
+ *    M: Required Mult
+ *
+ *  +--------------------------------------------------------+
+ *  |     Fin (kHZ)     | M  | IDF | LF | ODF |   Fout(Mhz)  |
+ *  |-------------------+----+-----+----+-----+--------------|
+ *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~ 3400  |
+ *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~ 1700  |
+ *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~ 850   |
+ *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~ 425  |
+ *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~ 212.5 |
+ *  +--------------------------------------------------------+
+ */
+#define LSDC_HDMI0_PHY_PLL_REG          0x1820
+#define LSDC_HDMI1_PHY_PLL_REG          0x1830
+
+#define HDMI_PLL_ENABLE                 BIT(0)
+#define HDMI_PLL_LOCKED                 BIT(16)
+#define HDMI_PLL_BYPASS                 BIT(17)
+
+#define HDMI_PLL_IDF_SHIFT              1
+#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
+#define HDMI_PLL_LF_SHIFT               6
+#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
+#define HDMI_PLL_ODF_SHIFT              13
+#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
+
+/* LS7A2000/LS2K2000 have hpd support */
+#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
+#define HDMI0_HPD_FLAG                  BIT(0)
+#define HDMI1_HPD_FLAG                  BIT(1)
+
+/* AVI InfoFrame */
+#define LSDC_HDMI0_AVI_CONTENT0         0x18e0
+#define LSDC_HDMI1_AVI_CONTENT0         0x18f0
+#define LSDC_HDMI0_AVI_CONTENT1         0x1900
+#define LSDC_HDMI1_AVI_CONTENT1         0x1910
+#define LSDC_HDMI0_AVI_CONTENT2         0x1920
+#define LSDC_HDMI1_AVI_CONTENT2         0x1930
+#define LSDC_HDMI0_AVI_CONTENT3         0x1940
+#define LSDC_HDMI1_AVI_CONTENT3         0x1950
+
+/* 1: enable avi infoframe packet, 0: disable avi infoframe packet */
+#define AVI_PKT_ENABLE                  BIT(0)
+/* 1: send one every two frame, 0: send one each frame */
+#define AVI_PKT_SEND_FREQ               BIT(1)
+/* 1: write 1 to flush avi reg content0 ~ content3 to the packet to be send */
+#define AVI_PKT_UPDATE                  BIT(2)
+
+#define LSDC_HDMI0_AVI_INFO_CRTL        0x1960
+#define LSDC_HDMI1_AVI_INFO_CRTL        0x1970
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_ttm.c b/drivers/gpu/drm/lsdc/lsdc_ttm.c
new file mode 100644
index 000000000000..c6e70420b7ce
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_ttm.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
+#include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
+#include "lsdc_drv.h"
+#include "lsdc_ttm.h"
+
+static void lsdc_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
+{
+	ttm_tt_fini(tt);
+	kfree(tt);
+}
+
+static struct ttm_tt *
+lsdc_ttm_tt_create(struct ttm_buffer_object *bo, uint32_t page_flags)
+{
+	struct ttm_tt *tt;
+	int ret;
+
+	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
+	if (!tt)
+		return NULL;
+
+	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
+	if (ret < 0) {
+		kfree(tt);
+		return NULL;
+	}
+
+	return tt;
+}
+
+void lsdc_bo_set_placement(struct ttm_buffer_object *tbo, u32 domain, u32 flags)
+{
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	unsigned int i;
+	unsigned int c = 0;
+
+	lbo->placement.placement = lbo->placements;
+	lbo->placement.busy_placement = lbo->placements;
+
+	if (domain & LSDC_GEM_DOMAIN_VRAM) {
+		lbo->placements[c].mem_type = TTM_PL_VRAM;
+		lbo->placements[c++].flags = flags;
+	}
+
+	if (domain & LSDC_GEM_DOMAIN_SYSTEM || !c) {
+		lbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		lbo->placements[c++].flags = flags;
+	}
+
+	lbo->placement.num_placement = c;
+	lbo->placement.num_busy_placement = c;
+
+	for (i = 0; i < c; ++i) {
+		lbo->placements[i].fpfn = 0;
+		lbo->placements[i].lpfn = 0;
+	}
+}
+
+static void lsdc_bo_evict_flags(struct ttm_buffer_object *tbo,
+				struct ttm_placement *placement)
+{
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	lsdc_bo_set_placement(tbo, LSDC_GEM_DOMAIN_SYSTEM, 0);
+
+	*placement = lbo->placement;
+}
+
+static int lsdc_bo_move(struct ttm_buffer_object *tbo,
+			bool evict,
+			struct ttm_operation_ctx *ctx,
+			struct ttm_resource *new_mem,
+			struct ttm_place *hop)
+{
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	struct drm_device *ddev = tbo->base.dev;
+
+	if (drm_WARN_ON_ONCE(ddev, lbo->vmap_use_count))
+		goto just_move_it;
+
+	ttm_bo_vunmap(tbo, &lbo->map);
+	/* explicitly clear mapping for next vmap call */
+	iosys_map_clear(&lbo->map);
+
+	drm_dbg(ddev, "%s: evict: %s\n", __func__, evict ? "Yes" : "No");
+
+just_move_it:
+	return ttm_bo_move_memcpy(tbo, ctx, new_mem);
+}
+
+static void lsdc_bo_delete_mem_notify(struct ttm_buffer_object *tbo)
+{
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	struct drm_device *ddev = tbo->base.dev;
+
+	if (drm_WARN_ON_ONCE(ddev, lbo->vmap_use_count))
+		return;
+
+	ttm_bo_vunmap(tbo, &lbo->map);
+	iosys_map_clear(&lbo->map);
+}
+
+static int lsdc_bo_reserve_io_mem(struct ttm_device *bdev,
+				  struct ttm_resource *mem)
+{
+	struct lsdc_device *ldev = bdev_to_lsdc(bdev);
+	const struct lsdc_desc *descp = ldev->descp;
+
+	switch (mem->mem_type) {
+	case TTM_PL_SYSTEM:
+		/* nothing to do */
+		break;
+	case TTM_PL_VRAM:
+		mem->bus.offset = (mem->start << PAGE_SHIFT) + ldev->vram_base;
+		mem->bus.is_iomem = true;
+		if (descp->is_soc)
+			mem->bus.caching = ttm_cached;
+		else
+			mem->bus.caching = ttm_write_combined;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct ttm_device_funcs lsdc_bo_driver = {
+	.ttm_tt_create = lsdc_ttm_tt_create,
+	.ttm_tt_destroy = lsdc_ttm_tt_destroy,
+	.eviction_valuable = ttm_bo_eviction_valuable,
+	.evict_flags = lsdc_bo_evict_flags,
+	.move = lsdc_bo_move,
+	.delete_mem_notify = lsdc_bo_delete_mem_notify,
+	.io_mem_reserve = lsdc_bo_reserve_io_mem,
+};
+
+static void lsdc_bo_free(struct drm_gem_object *gem)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+
+	ttm_bo_put(tbo);
+}
+
+int lsdc_bo_pin(struct drm_gem_object *gem)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	int ret;
+
+	ret = ttm_bo_reserve(tbo, true, false, NULL);
+	if (ret) {
+		drm_err(gem->dev, "%s: %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (tbo->pin_count == 0) {
+		struct ttm_operation_ctx ctx = { false, false };
+
+		ret = ttm_bo_validate(tbo, &lbo->placement, &ctx);
+		if (ret < 0) {
+			ttm_bo_unreserve(tbo);
+			drm_err(gem->dev, "%s: %d\n", __func__, ret);
+			return ret;
+		}
+	}
+
+	ttm_bo_pin(tbo);
+
+	ttm_bo_unreserve(tbo);
+
+	return ret;
+}
+
+void lsdc_bo_unpin(struct drm_gem_object *gem)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	int ret;
+
+	ret = ttm_bo_reserve(tbo, true, false, NULL);
+	if (ret) {
+		drm_err(gem->dev, "%s: bo reserve failed\n", __func__);
+		return;
+	}
+
+	ttm_bo_unpin(tbo);
+	ttm_bo_unreserve(tbo);
+}
+
+static int lsdc_bo_vmap(struct drm_gem_object *gem, struct iosys_map *map)
+{
+	struct drm_device *ddev = gem->dev;
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	int ret;
+
+	dma_resv_assert_held(gem->resv);
+
+	if (tbo->pin_count == 0) {
+		struct ttm_operation_ctx ctx = { false, false };
+
+		ret = ttm_bo_validate(tbo, &lbo->placement, &ctx);
+		if (ret < 0)
+			return ret;
+	}
+
+	ttm_bo_pin(tbo);
+
+	if (lbo->vmap_use_count > 0) {
+		drm_dbg(ddev, "%s: already mapped\n", __func__);
+		goto finish;
+	}
+
+	/* Only vmap if the there's no mapping present */
+	if (iosys_map_is_null(&lbo->map)) {
+		ret = ttm_bo_vmap(tbo, &lbo->map);
+		if (ret) {
+			ttm_bo_unpin(tbo);
+			return ret;
+		}
+	}
+
+finish:
+	++lbo->vmap_use_count;
+	*map = lbo->map;
+
+	return 0;
+}
+
+static void lsdc_bo_vunmap(struct drm_gem_object *gem, struct iosys_map *map)
+{
+	struct drm_device *ddev = gem->dev;
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	dma_resv_assert_held(gem->resv);
+
+	if (drm_WARN_ON_ONCE(ddev, !lbo->vmap_use_count))
+		return;
+
+	if (drm_WARN_ON_ONCE(ddev, !iosys_map_is_equal(&lbo->map, map)))
+		return; /* BUG: map not mapped from this BO */
+
+	if (--lbo->vmap_use_count > 0)
+		return;
+
+	/* We delay the actual unmap operation until the BO gets evicted */
+	ttm_bo_unpin(tbo);
+}
+
+static int lsdc_bo_mmap(struct drm_gem_object *gem,
+			struct vm_area_struct *vma)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	int ret;
+
+	ret = ttm_bo_mmap_obj(vma, tbo);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ttm has its own object refcounting, so drop gem reference
+	 * to avoid double accounting counting.
+	 */
+	drm_gem_object_put(gem);
+
+	return 0;
+}
+
+static const struct drm_gem_object_funcs lsdc_gem_object_funcs = {
+	.free   = lsdc_bo_free,
+	.pin    = lsdc_bo_pin,
+	.unpin  = lsdc_bo_unpin,
+	.vmap   = lsdc_bo_vmap,
+	.vunmap = lsdc_bo_vunmap,
+	.mmap   = lsdc_bo_mmap,
+};
+
+static void lsdc_bo_destroy(struct ttm_buffer_object *tbo)
+{
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	WARN_ON(lbo->vmap_use_count);
+	WARN_ON(iosys_map_is_set(&lbo->map));
+
+	drm_gem_object_release(&tbo->base);
+
+	kfree(lbo);
+}
+
+static struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev, size_t size)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct ttm_device *bdev = &ldev->bdev;
+	struct lsdc_bo *lbo;
+	struct ttm_buffer_object *tbo;
+	struct drm_gem_object *gem;
+	int ret;
+
+	lbo = kzalloc(sizeof(*lbo), GFP_KERNEL);
+	if (!lbo)
+		return ERR_PTR(-ENOMEM);
+
+	tbo = &lbo->bo;
+	gem = &tbo->base;
+	gem->funcs = &lsdc_gem_object_funcs;
+
+	ret = drm_gem_object_init(ddev, gem, size);
+	if (ret) {
+		kfree(lbo);
+		return ERR_PTR(ret);
+	}
+
+	tbo->bdev = bdev;
+	lsdc_bo_set_placement(tbo, LSDC_GEM_DOMAIN_SYSTEM, 0);
+
+	ret = ttm_bo_init_validate(bdev,
+				   tbo,
+				   ttm_bo_type_device,
+				   &lbo->placement,
+				   0,
+				   false, NULL, NULL,
+				   lsdc_bo_destroy);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return lbo;
+}
+
+u64 lsdc_bo_gpu_offset(struct ttm_buffer_object *tbo)
+{
+	struct ttm_resource *resource = tbo->resource;
+
+	if (WARN_ON_ONCE(!tbo->pin_count))
+		return -ENODEV;
+
+	/* Keep TTM behavior for now, remove when drivers are audited */
+	if (WARN_ON_ONCE(!resource))
+		return 0;
+
+	if (WARN_ON_ONCE(resource->mem_type == TTM_PL_SYSTEM))
+		return 0;
+
+	return resource->start << PAGE_SHIFT;
+}
+
+int lsdc_dumb_create(struct drm_file *file,
+		     struct drm_device *ddev,
+		     struct drm_mode_create_dumb *args)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	size_t pitch, size;
+	struct lsdc_bo *lbo;
+	struct ttm_buffer_object *tbo;
+	u32 handle;
+	int ret;
+
+	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
+	pitch = ALIGN(pitch, descp->pitch_align);
+	size = pitch * args->height;
+	size = roundup(size, PAGE_SIZE);
+	if (!size)
+		return -EINVAL;
+
+	lbo = lsdc_bo_create(ddev, size);
+	if (IS_ERR(lbo))
+		return PTR_ERR(lbo);
+
+	tbo = &lbo->bo;
+
+	ret = drm_gem_handle_create(file, &tbo->base, &handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&tbo->base);
+
+	drm_dbg(ddev, "stride: %lu, height: %u\n", pitch, args->height);
+
+	args->pitch = pitch;
+	args->size = size;
+	args->handle = handle;
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&tbo->base);
+	return ret;
+}
+
+int lsdc_dumb_map_offset(struct drm_file *file,
+			 struct drm_device *ddev,
+			 u32 handle,
+			 uint64_t *offset)
+{
+	struct drm_gem_object *gem;
+
+	gem = drm_gem_object_lookup(file, handle);
+	if (!gem)
+		return -ENOENT;
+
+	*offset = drm_vma_node_offset_addr(&gem->vma_node);
+
+	drm_gem_object_put(gem);
+
+	return 0;
+}
+
+static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
+{
+	struct lsdc_device *ldev = (struct lsdc_device *)data;
+
+	ttm_range_man_fini(&ldev->bdev, TTM_PL_VRAM);
+	ttm_device_fini(&ldev->bdev);
+}
+
+int lsdc_ttm_init(struct lsdc_device *ldev)
+{
+	struct drm_device *ddev = &ldev->base;
+	unsigned long num_pages;
+	int ret;
+
+	ret = ttm_device_init(&ldev->bdev,
+			      &lsdc_bo_driver,
+			      ddev->dev,
+			      ddev->anon_inode->i_mapping,
+			      ddev->vma_offset_manager,
+			      false,
+			      true);
+	if (ret)
+		return ret;
+
+	num_pages = ldev->vram_size >> PAGE_SHIFT;
+
+	ret = ttm_range_man_init(&ldev->bdev,
+				 TTM_PL_VRAM,
+				 false,
+				 num_pages);
+	if (ret)
+		return ret;
+
+	drm_info(ddev, "number of pages: %lu\n", num_pages);
+
+	return drmm_add_action_or_reset(ddev, lsdc_ttm_fini, ldev);
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_ttm.h b/drivers/gpu/drm/lsdc/lsdc_ttm.h
new file mode 100644
index 000000000000..a7fe6689838f
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_ttm.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_TTM_H__
+#define __LSDC_TTM_H__
+
+#include <linux/container_of.h>
+#include <linux/iosys-map.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
+
+#define LSDC_GEM_DOMAIN_SYSTEM          0x1
+#define LSDC_GEM_DOMAIN_GTT             0x2
+#define LSDC_GEM_DOMAIN_VRAM            0x4
+
+struct lsdc_bo {
+	struct ttm_buffer_object bo;
+	struct iosys_map map;
+
+	unsigned int vmap_use_count;
+
+	struct ttm_placement placement;
+	struct ttm_place placements[2];
+};
+
+static inline struct lsdc_bo *
+to_lsdc_bo(struct ttm_buffer_object *tbo)
+{
+	return container_of(tbo, struct lsdc_bo, bo);
+}
+
+static inline struct lsdc_bo *
+gem_to_lsdc_bo(struct drm_gem_object *gem)
+{
+	return container_of(gem, struct lsdc_bo, bo.base);
+}
+
+static inline struct ttm_buffer_object *
+to_ttm_bo(struct drm_gem_object *gem)
+{
+	return container_of(gem, struct ttm_buffer_object, base);
+}
+
+u64 lsdc_bo_gpu_offset(struct ttm_buffer_object *tbo);
+
+void lsdc_bo_set_placement(struct ttm_buffer_object *tbo, u32 domain, u32 flags);
+int lsdc_bo_pin(struct drm_gem_object *gem);
+void lsdc_bo_unpin(struct drm_gem_object *gem);
+
+int lsdc_dumb_map_offset(struct drm_file *file,
+			 struct drm_device *dev,
+			 u32 handle,
+			 uint64_t *offset);
+
+int lsdc_dumb_create(struct drm_file *file,
+		     struct drm_device *ddev,
+		     struct drm_mode_create_dumb *args);
+
+int lsdc_ttm_init(struct lsdc_device *ldev);
+
+#endif
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index d3e8920c0b64..ba6b91c36e3b 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -21,10 +21,6 @@ struct drm_simple_display_pipe;
 struct filp;
 struct vm_area_struct;
 
-#define DRM_GEM_VRAM_PL_FLAG_SYSTEM	(1 << 0)
-#define DRM_GEM_VRAM_PL_FLAG_VRAM	(1 << 1)
-#define DRM_GEM_VRAM_PL_FLAG_TOPDOWN	(1 << 2)
-
 /*
  * Buffer-object helpers
  */
-- 
2.25.1

