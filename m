Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62D6C0DF8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69110E2B8;
	Mon, 20 Mar 2023 10:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD37810E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:01:54 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55864.2045483661
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B54571002EB;
 Mon, 20 Mar 2023 18:01:49 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 645c2ebce8c04f18a7799792053694a1 for maarten.lankhorst@linux.intel.com; 
 Mon, 20 Mar 2023 18:01:53 CST
X-Transaction-ID: 645c2ebce8c04f18a7799792053694a1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v8 2/2] drm: add kms driver for loongson display controller
Date: Mon, 20 Mar 2023 18:01:31 +0800
Message-Id: <20230320100131.1277034-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320100131.1277034-1-15330273260@189.cn>
References: <20230320100131.1277034-1-15330273260@189.cn>
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
Cc: linaro-mm-sig@lists.linaro.org, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Loongson display controller IP has been integrated in both Loongson
North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
and ls2k2000 etc), it even has been included in Loongson BMC products.

This display controller is a PCI device, it has two display pipe. For
the DC in LS7A1000 and LS2K1000 each way has a DVO output interface
which provide RGB888 signals, vertical & horizontal synchronisations,
and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
the maximum resolution is 2048x2048 according to the hardware spec.

For the DC in LS7A2000, each display pipe is equipped with a built-in
HDMI encoder which is compliant with HDMI 1.4 specification, thus it
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
  2) Alphabetical sorting headers (Thomas)
  3) Untangle register access functions as much as possible (Thomas)
  4) Switch to TTM based memory manager and prefer cached mapping
     for Loongson SoC (Thomas)
  5) Add chip id detection method, now all models are distinguishable.
  6) Revise builtin HDMI phy driver, nearly all main stream mode
     below 4K@30Hz is tested, this driver supported these mode very
     well including clone display mode and extend display mode.

 v3 -> v4:
  1) Quickly fix a small mistake.

 v4 -> v5:
  1) Drop potential support for Loongson 2K series SoC temporary,
     this part should be resend with the DT binding patch in the future.
  2) Add per display pipe debugfs support to the builtin HDMI encoder.
  3) Rewrite atomic_update() for hardware cursors plane(Thomas)
  4) Rewrite encoder and connector initialization part, untangle it
     according to the chip(Thomas).

 v5 -> v6:
  1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
  2) Fix all typos I could found, make sentences and code more readable
  3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
  4) After a serious consideration, we rename this driver as loongson.
     Because we also have drivers toward the LoongGPU IP in LS7A2000 and
     LS2K2000. Besides, there are also drivers about the external encoder,
     HDMI audio driver and vbios support etc. This patch only provide DC
     driver part, my teammate Li Yi believe that loongson will be more
     suitable for loongson graphics than lsdc in the long run.

     loongson.ko = LSDC + LoongGPU + encoders driver + vbios/DT ...

  v6 -> v7:
  1) Add prime support, self-sharing is works. sharing buffer with etnaviv
     is also tested, and its works with limitation.
  2) Implement buffer objects tracking with list_head.
  3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
  4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
     during BO creation. Patch V1 ~ V6 of this series no longer works
     on latest kernel. Thus, we send V7 to revival them.

  v7 -> v8:
  1) Zero a compile warnnings on 32-bit platform, compile with W=1
  2) Revise lsdc_bo_gpu_offset() and minor cleanup
  3) Pageflip tested on the virtual terminal with following commands

      modetest -M loongson -s 32:1920x1080 -v
      modetest -M loongson -s 34:1920x1080 -v -F tiles

     It works like a charm, when running pageflip test with dual screnn
     configuration, another two additional bo created by the modetest
     emerged, VRAM usage up to 40+MB, well we have at least 64MB, still
     enough.

     # cat bos

         bo[0000]: size:     8112kB VRAM
         bo[0001]: size:       16kB VRAM
         bo[0002]: size:       16kB VRAM
         bo[0003]: size:    16208kB VRAM
         bo[0004]: size:     8112kB VRAM
         bo[0005]: size:     8112kB VRAM

Signed-off-by: Li Yi <liyi@loongson.cn>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/loongson/Kconfig        |  15 +
 drivers/gpu/drm/loongson/Makefile       |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c    | 385 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c | 261 +++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.c     | 501 +++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h     | 318 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.c     | 291 ++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.h     |  26 ++
 drivers/gpu/drm/loongson/lsdc_i2c.c     | 171 +++++++
 drivers/gpu/drm/loongson/lsdc_irq.c     |  88 ++++
 drivers/gpu/drm/loongson/lsdc_irq.h     |  11 +
 drivers/gpu/drm/loongson/lsdc_output.c  | 563 ++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h  |  14 +
 drivers/gpu/drm/loongson/lsdc_plane.c   | 416 +++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c     | 338 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h     |  76 ++++
 drivers/gpu/drm/loongson/lsdc_probe.c   |  85 ++++
 drivers/gpu/drm/loongson/lsdc_probe.h   |  11 +
 drivers/gpu/drm/loongson/lsdc_regs.h    | 370 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c     | 430 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h     |  68 +++
 23 files changed, 4457 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..d1fa87d2acb7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -331,6 +331,8 @@ source "drivers/gpu/drm/v3d/Kconfig"
 
 source "drivers/gpu/drm/vc4/Kconfig"
 
+source "drivers/gpu/drm/loongson/Kconfig"
+
 source "drivers/gpu/drm/etnaviv/Kconfig"
 
 source "drivers/gpu/drm/hisilicon/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..131531453b8e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -194,3 +194,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_LOONGSON) += loongson/
diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
new file mode 100644
index 000000000000..0dd618ef166a
--- /dev/null
+++ b/drivers/gpu/drm/loongson/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_LOONGSON
+	tristate "DRM support for Loongson Graphics"
+	depends on DRM && PCI
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	help
+	  This is a DRM driver for Loongson Graphics, it may including
+	  LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
+	  series are bridge chipset, while Loongson LS2K series are SoC.
+
+	  If "M" is selected, the module will be called loongson.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
new file mode 100644
index 000000000000..c5dcc7c9b348
--- /dev/null
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+loongson-y := \
+	lsdc_crtc.o \
+	lsdc_debugfs.o \
+	lsdc_drv.o \
+	lsdc_gem.o \
+	lsdc_i2c.o \
+	lsdc_irq.o \
+	lsdc_output.o \
+	lsdc_plane.o \
+	lsdc_pll.o \
+	lsdc_probe.o \
+	lsdc_ttm.o
+
+obj-$(CONFIG_DRM_LOONGSON) += loongson.o
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
new file mode 100644
index 000000000000..4a376774afff
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "lsdc_drv.h"
+
+static u32 lsdc_get_vblank_counter_pipe0(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	return lsdc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG);
+}
+
+static u32 lsdc_get_vblank_counter_pipe1(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	return lsdc_rreg32(ldev, LSDC_CRTC1_VSYNC_COUNTER_REG);
+}
+
+static int lsdc_enable_vblank_pipe0(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
+
+	return 0;
+}
+
+static void lsdc_disable_vblank_pipe0(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
+}
+
+static int lsdc_enable_vblank_pipe1(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
+
+	return 0;
+}
+
+static void lsdc_disable_vblank_pipe1(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc->dev);
+
+	lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
+}
+
+static void lsdc_crtc_reset(struct drm_crtc *crtc)
+{
+	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_crtc_state *priv_crtc_state;
+	unsigned int index = dispipe->index;
+	u32 val;
+
+	val = LSDC_PF_XRGB8888 | CFG_RESET_N;
+	if (ldev->descp->chip == CHIP_LS7A2000)
+		val |= LSDC_DMA_STEP_64_BYTES;
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, index, val);
+
+	if (ldev->descp->chip == CHIP_LS7A2000) {
+		val = PHY_CLOCK_EN | PHY_DATA_EN;
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_PANEL_CONF_REG, index, val);
+	}
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
+	new_priv_state = kzalloc(sizeof(*new_priv_state), GFP_KERNEL);
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
+#define LSDC_CRTC_FUNCS_GEN(pipe, pfn_get_vblank_counter)                    \
+	.reset = lsdc_crtc_reset,                                            \
+	.destroy = drm_crtc_cleanup,                                         \
+	.set_config = drm_atomic_helper_set_config,                          \
+	.page_flip = drm_atomic_helper_page_flip,                            \
+	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,          \
+	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,              \
+	.get_vblank_counter = pfn_get_vblank_counter,                        \
+	.enable_vblank = lsdc_enable_vblank_##pipe,                          \
+	.disable_vblank = lsdc_disable_vblank_##pipe,                        \
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
+
+static const struct drm_crtc_funcs lsdc_crtc_funcs_array[2][LSDC_NUM_CRTC] = {
+	{
+		{
+			LSDC_CRTC_FUNCS_GEN(pipe0, NULL),
+		},
+		{
+			LSDC_CRTC_FUNCS_GEN(pipe1, NULL),
+		}
+	},
+	{
+		{
+			LSDC_CRTC_FUNCS_GEN(pipe0, lsdc_get_vblank_counter_pipe0),
+		},
+		{
+			LSDC_CRTC_FUNCS_GEN(pipe1, lsdc_get_vblank_counter_pipe1),
+		}
+	}
+};
+
+static enum drm_mode_status
+lsdc_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
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
+	/* TODO: check RGB565 support, 4 for DRM_FORMAT_XRGB8888 */
+	if ((mode->hdisplay * 4) % descp->pitch_align) {
+		drm_dbg(ddev, "stride align to %u bytes is required\n",
+			descp->pitch_align);
+		return MODE_BAD_WIDTH;
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
+	int ret;
+
+	ret = pfuncs->compute(pixpll, clock, pout);
+	if (ret) {
+		drm_warn(crtc->dev, "Find PLL parms for %ukHz failed\n", clock);
+		return -EINVAL;
+	}
+
+	return 0;
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
+static void lsdc_crtc_atomic_enable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *state)
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
+	unsigned int index = dispipe->index;
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
+			 HSYNC_EN);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_VSYNC_REG, index,
+			 (mode->crtc_vsync_end << 16) |
+			 mode->crtc_vsync_start |
+			 VSYNC_EN);
+
+	val = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, index);
+	/* clear old dma step settings */
+	val &= ~CFG_DMA_STEP_MASK;
+
+	if (descp->chip == CHIP_LS7A2000) {
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
+	clk_func->update(pixpll, &priv_state->pparms);
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, index, val | CFG_OUTPUT_EN);
+
+	drm_crtc_vblank_on(crtc);
+
+	drm_crtc_wait_one_vblank(crtc);
+}
+
+static void lsdc_crtc_atomic_disable(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = dispipe->index;
+
+	lsdc_crtc_ureg32_clr(ldev, LSDC_CRTC0_CFG_REG, index, CFG_OUTPUT_EN);
+
+	drm_crtc_wait_one_vblank(crtc);
+
+	drm_crtc_vblank_off(crtc);
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
+	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = dispipe->index;
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
+	val = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG, index);
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
+	.atomic_enable = lsdc_crtc_atomic_enable,
+	.atomic_disable = lsdc_crtc_atomic_disable,
+	.atomic_check = lsdc_crtc_helper_atomic_check,
+	.atomic_flush = lsdc_crtc_atomic_flush,
+	.get_scanout_position = lsdc_crtc_get_scanout_position,
+};
+
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor,
+		   unsigned int index)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	unsigned int has = descp->has_vblank_counter;
+	int ret;
+
+	ret = drm_crtc_init_with_planes(ddev, crtc, primary, cursor,
+					&lsdc_crtc_funcs_array[has][index],
+					"CRTC-%d",
+					index);
+	if (ret) {
+		drm_err(ddev, "crtc init with planes failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
+
+	drm_dbg(ddev, "%s initialized %s vblank counter support\n",
+		crtc->name, has ? "with" : "without");
+
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret)
+		return ret;
+
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
new file mode 100644
index 000000000000..3eba22e57ee6
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_gem.h"
+#include "lsdc_probe.h"
+
+#ifdef CONFIG_DEBUG_FS
+
+static int lsdc_identify(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u8 imp, rev;
+
+	loongson_cpu_get_prid(&imp, &rev);
+
+	seq_printf(m, "I'm in %s, running on cpu 0x%x, cpu revision: 0x%x\n",
+		   chip_to_str(ldev->descp->chip), imp, rev);
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
+	REG_DEF(CURSOR0_POSITION),
+	REG_DEF(CURSOR0_BG_COLOR),
+	REG_DEF(CURSOR0_FG_COLOR),
+	REG_DEF(CRTC0_CFG),
+	REG_DEF(CRTC0_FB_ORIGIN),
+	REG_DEF(CRTC0_PANEL_CONF),
+	REG_DEF(CRTC0_HDISPLAY),
+	REG_DEF(CRTC0_HSYNC),
+	REG_DEF(CRTC0_VDISPLAY),
+	REG_DEF(CRTC0_VSYNC),
+	REG_DEF(CRTC0_GAMMA_INDEX),
+	REG_DEF(CRTC0_GAMMA_DATA),
+	REG_DEF(CRTC0_SYNC_DEVIATION),
+	REG_DEF(INT),
+	REG_DEF(CRTC1_CFG),
+	REG_DEF(CRTC1_FB_ORIGIN),
+	REG_DEF(CRTC1_PANEL_CONF),
+	REG_DEF(CRTC1_HDISPLAY),
+	REG_DEF(CRTC1_HSYNC),
+	REG_DEF(CRTC1_VDISPLAY),
+	REG_DEF(CRTC1_VSYNC),
+	REG_DEF(CRTC1_GAMMA_INDEX),
+	REG_DEF(CRTC1_GAMMA_DATA),
+	REG_DEF(CRTC1_SYNC_DEVIATION),
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
+static int lsdc_show_primary_addr(struct seq_file *m, void *arg)
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
+/* To verify if TTM_PL_FLAG_TOPDOWN works */
+static int lsdc_show_cursor_addr(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 lo, hi;
+
+	lo = lsdc_rreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG);
+	hi = lsdc_rreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG);
+	seq_printf(m, "CURSOR0: 0x%x:%x\n", hi, lo);
+
+	lo = lsdc_rreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG);
+	hi = lsdc_rreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG);
+	seq_printf(m, "CURSOR1: 0x%x:%x\n", hi, lo);
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
+	{ "chip",        lsdc_identify, 0, NULL },
+	{ "clocks",      lsdc_show_clock, 0 },
+	{ "mm",          lsdc_show_mm, 0, NULL },
+	{ "regs",        lsdc_show_regs, 0 },
+	{ "vblanks",     lsdc_show_vblank_counter, 0, NULL },
+	{ "scan_pos",    lsdc_show_scan_position, 0, NULL },
+	{ "fb_addr",     lsdc_show_primary_addr, 0, NULL },
+	{ "cursor_addr", lsdc_show_cursor_addr, 0, NULL },
+	{ "flip",        lsdc_trigger_flip_fb, 0, NULL },
+	{ "stride",      lsdc_show_stride, 0, NULL },
+	{ "bos",         lsdc_show_buffer_object, 0, NULL },
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
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
new file mode 100644
index 000000000000..2d5ab111ceb0
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/pci.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_gem.h"
+#include "lsdc_irq.h"
+#include "lsdc_output.h"
+#include "lsdc_probe.h"
+#include "lsdc_ttm.h"
+
+#define DRIVER_AUTHOR           "Sui Jingfeng <suijingfeng@loongson.cn>"
+#define DRIVER_NAME             "loongson"
+#define DRIVER_DESC             "drm driver for loongson graphics"
+#define DRIVER_DATE             "20220701"
+#define DRIVER_MAJOR            1
+#define DRIVER_MINOR            0
+#define DRIVER_PATCHLEVEL       0
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
+const char *chip_to_str(enum loongson_chip_family chip)
+{
+	if (chip == CHIP_LS7A2000)
+		return "LS7A2000";
+
+	if (chip == CHIP_LS7A1000)
+		return "LS7A1000";
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
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+
+	.debugfs_init = lsdc_debugfs_init,
+	.dumb_create = lsdc_dumb_create,
+	.dumb_map_offset = lsdc_dumb_map_offset,
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
+	.gem_prime_mmap = drm_gem_prime_mmap,
+};
+
+static enum drm_mode_status
+lsdc_mode_config_mode_valid(struct drm_device *ddev,
+			    const struct drm_display_mode *mode)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
+	u64 min_pitch = drm_format_info_min_pitch(info, 0, mode->hdisplay);
+	u64 fb_size = min_pitch * mode->vdisplay;
+
+	if (fb_size * 3 > ldev->vram_size) {
+		drm_err(ddev, "VRAM size not enough\n");
+		return MODE_MEM;
+	}
+
+	return MODE_OK;
+}
+
+static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.mode_valid = lsdc_mode_config_mode_valid,
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
+		struct lsdc_display_pipe *dispipe = &ldev->dispipe[i];
+		/* We need a index before crtc is initialized */
+		dispipe->index = i;
+
+		ret = lsdc_create_output(ldev, dispipe);
+		if (ret)
+			return ret;
+
+		ldev->num_output++;
+	}
+
+	for (i = 0; i < num_crtc; i++) {
+		struct lsdc_display_pipe *dispipe = &ldev->dispipe[i];
+
+		ret = lsdc_pixpll_init(&dispipe->pixpll, ddev, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_primary_plane_init(ldev, &dispipe->primary, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_cursor_plane_init(ldev, &dispipe->cursor, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_crtc_init(ddev, &dispipe->crtc, &dispipe->primary, &dispipe->cursor, i);
+		if (ret)
+			return ret;
+	}
+
+	drm_mode_config_reset(ddev);
+
+	drm_info(ddev, "modeset init finished, total %u outputs\n", ldev->num_output);
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
+	if (chip == CHIP_LS7A1000)
+		return &dc_in_ls7a1000;
+
+	if (chip == CHIP_LS7A2000)
+		return &dc_in_ls7a2000;
+
+	return ERR_PTR(-ENODEV);
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
+	 * PCIE devices, they are two devices not one. The DC does not has a
+	 * dedicate VRAM bar, because the BIOS engineer choose to assign the
+	 * VRAM to the GPU device. Sadly, after years application, this form
+	 * as a convention for loongson integrated graphics. Bar 2 of the GPU
+	 * device contain the base address and size of the VRAM, both the GPU
+	 * and the DC can access the on-board VRAM as long as the DMA address
+	 * emitted fall in [base, base + size).
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
+	if (IS_ERR_OR_NULL(descp)) {
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
+	/* BAR 0 of the DC device contain registers base address */
+	ldev->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!ldev->reg_base)
+		return ERR_PTR(-ENODEV);
+
+	ret = lsdc_get_dedicated_vram(ldev, descp);
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
+	lsdc_gem_init(ddev);
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
+		drm_err(ddev, "Failed to register interrupt: %d\n", ret);
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
+static int __init loongson_module_init(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	/*
+	 * We intend to write a all-in-one driver which can rules them all.
+	 * But before this driver could provide support for loongson SoC
+	 * formally, we would like to drop it temporarily.
+	 */
+	if (lsdc_is_ls2k1000() || lsdc_is_ls2k2000())
+		return -ENODEV;
+
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
+		if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
+			pr_info("Discrete graphic card detected, abort\n");
+			return 0;
+		}
+	}
+
+	return pci_register_driver(&lsdc_pci_driver);
+}
+module_init(loongson_module_init);
+
+static void __exit loongson_module_exit(void)
+{
+	pci_unregister_driver(&lsdc_pci_driver);
+}
+module_exit(loongson_module_exit);
+
+MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
new file mode 100644
index 000000000000..3a13d7e8c05f
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -0,0 +1,318 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
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
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
+#include <drm/ttm/ttm_device.h>
+
+#include "lsdc_pll.h"
+#include "lsdc_regs.h"
+
+/* Currently, all loongson display controller has two display pipes */
+#define LSDC_NUM_CRTC           2
+
+/*
+ * LS7A1000 and LS7A2000 function as north bridge of the LS3A4000/LS3A5000,
+ * They are equipped on-board Video RAM. While LS2K2000/LS2K1000 are SoC,
+ * they don't have dediacated Video RAM. LS7A2000 bridge chip integrated
+ * 32-bit DDR4@2400 video memtory controller, while it is just 16-bit DDR3
+ * for LS7A1000.
+ *
+ * The display controller in LS7A2000 has two display pipe, yet it has three
+ * integrated encoders, display pipe 0 is attached with a transparent VGA
+ * encoder and a HDMI phy, they are parallel. Display pipe 1 has only one
+ * HDMI phy connected.
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
+ *
+ * The display controller in LS7A1000 has only two-way DVO interface exported,
+ * thus, external encoder(TX chip) is required except connected with DPI panel
+ * directly.
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
+ * There is only a 1:1 mapping of crtcs, encoders and connectors for the DC,
+ * display pipe 0 = crtc0 + dvo0 + encoder0 + connector0 + cursor0 + primary0
+ * display pipe 1 = crtc1 + dvo1 + encoder1 + connectro1 + cursor1 + primary1
+ * Each CRTC has two FB address registers.
+ *
+ * The DC in LS7A1000/LS2K1000 has the pci vendor/device ID: 0x0014:0x7a06,
+ * The DC in LS7A2000/LS2K2000 has the pci vendor/device ID: 0x0014:0x7a36.
+ *
+ * LS7A1000 and LS7A2000 can only be used with LS3A3000, LS3A4000, LS3A5000
+ * desktop class CPUs, thus CPU PRID can be used to differentiate those SoC
+ * and the desktop level CPU on the runtime.
+ */
+
+enum loongson_chip_family {
+	CHIP_LS7A1000 = 0,
+	CHIP_LS7A2000 = 1,
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
+	u32 pitch_align;         /* CRTC DMA alignment constraint */
+	u64 mc_bits;             /* physical address bus bit width */
+	bool has_vblank_counter; /* 32 bit hw vsync counter */
+	bool has_scan_pos;       /* CRTC scan position recorder */
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
+	void __iomem *dir_reg;
+	void __iomem *dat_reg;
+	/* pin bit mask */
+	u8 sda;
+	u8 scl;
+};
+
+struct lsdc_display_pipe {
+	struct drm_crtc crtc;
+	struct drm_plane primary;
+	struct drm_plane cursor;
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
+primary_to_display_pipe(struct drm_plane *plane)
+{
+	return container_of(plane, struct lsdc_display_pipe, primary);
+}
+
+static inline struct lsdc_display_pipe *
+cursor_to_display_pipe(struct drm_plane *plane)
+{
+	return container_of(plane, struct lsdc_display_pipe, cursor);
+}
+
+static inline struct lsdc_display_pipe *
+connector_to_display_pipe(struct drm_connector *connector)
+{
+	return container_of(connector, struct lsdc_display_pipe, connector);
+}
+
+static inline struct lsdc_display_pipe *
+encoder_to_display_pipe(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct lsdc_display_pipe, encoder);
+}
+
+struct lsdc_crtc_state {
+	struct drm_crtc_state base;
+	struct lsdc_pll_parms pparms;
+};
+
+struct lsdc_gem {
+	/* @mutex: protect objects list */
+	struct mutex mutex;
+	struct list_head objects;
+};
+
+struct lsdc_device {
+	struct drm_device base;
+	struct ttm_device bdev;
+	/* @descp: features description of the DC variant */
+	const struct lsdc_desc *descp;
+
+	/* @reglock: protects concurrent access */
+	spinlock_t reglock;
+	void __iomem *reg_base;
+	resource_size_t vram_base;
+	resource_size_t vram_size;
+
+	resource_size_t gtt_size;
+
+	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+
+	struct lsdc_gem gem;
+
+	/* @num_output: count the number of active display pipe */
+	unsigned int num_output;
+
+	u32 irq_status;
+};
+
+static inline struct lsdc_device *tdev_to_ldev(struct ttm_device *bdev)
+{
+	return container_of(bdev, struct lsdc_device, bdev);
+}
+
+static inline struct lsdc_device *to_lsdc(struct drm_device *ddev)
+{
+	return container_of(ddev, struct lsdc_device, base);
+}
+
+static inline struct lsdc_crtc_state *to_lsdc_crtc_state(struct drm_crtc_state *base)
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
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor,
+		   unsigned int index);
+
+int lsdc_primary_plane_init(struct lsdc_device *ldev,
+			    struct drm_plane *plane,
+			    unsigned int index);
+
+int lsdc_cursor_plane_init(struct lsdc_device *ldev,
+			   struct drm_plane *plane,
+			   unsigned int index);
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
+static inline u32 lsdc_pipe_rreg32(struct lsdc_device *ldev,
+				   u32 offset,
+				   u32 pipe)
+{
+	return readl(ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
+}
+
+#define lsdc_hdmi_rreg32 lsdc_pipe_rreg32
+#define lsdc_crtc_rreg32 lsdc_pipe_rreg32
+
+static inline void lsdc_pipe_wreg32(struct lsdc_device *ldev,
+				    u32 offset,
+				    u32 pipe,
+				    u32 val)
+{
+	writel(val, ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
+}
+
+#define lsdc_hdmi_wreg32 lsdc_pipe_wreg32
+#define lsdc_crtc_wreg32 lsdc_pipe_wreg32
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
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
new file mode 100644
index 000000000000..d041041fc4e7
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/dma-buf.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_gem.h"
+#include "lsdc_ttm.h"
+
+static int lsdc_gem_prime_pin(struct drm_gem_object *obj)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	int ret;
+
+	ret = lsdc_bo_pin(lbo, LSDC_GEM_DOMAIN_GTT, NULL);
+	if (unlikely(ret))
+		return ret;
+
+	lbo->sharing_count++;
+
+	return 0;
+}
+
+static void lsdc_gem_prime_unpin(struct drm_gem_object *obj)
+{
+	struct lsdc_bo *lbo = gem_to_lsdc_bo(obj);
+
+	lsdc_bo_unpin(lbo);
+	if (lbo->sharing_count)
+		lbo->sharing_count--;
+}
+
+static struct sg_table *lsdc_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
+	struct ttm_tt *tt = tbo->ttm;
+
+	if (!tt) {
+		drm_err(obj->dev, "sharing a buffer without backing memory\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return drm_prime_pages_to_sg(obj->dev, tt->pages, tt->num_pages);
+}
+
+static void lsdc_gem_object_free(struct drm_gem_object *obj)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
+
+	if (tbo)
+		ttm_bo_put(tbo);
+}
+
+static int lsdc_gem_object_vmap(struct drm_gem_object *obj,
+				struct iosys_map *map)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+	int ret;
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
+	if (lbo->vmap_count > 0) {
+		++lbo->vmap_count;
+		goto out;
+	}
+
+	/* Only vmap if the there's no mapping present */
+	if (iosys_map_is_null(&lbo->map)) {
+		ret = ttm_bo_vmap(tbo, &lbo->map);
+		if (ret) {
+			ttm_bo_unpin(tbo);
+			return ret;
+		}
+		lbo->vmap_count = 1;
+	}
+
+out:
+	*map = lbo->map;
+
+	return 0;
+}
+
+static void lsdc_gem_object_vunmap(struct drm_gem_object *obj,
+				   struct iosys_map *map)
+{
+	struct drm_device *ddev = obj->dev;
+	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	if (unlikely(!lbo->vmap_count)) {
+		drm_warn(ddev, "%p is not mapped", lbo);
+		return;
+	}
+
+	--lbo->vmap_count;
+	if (lbo->vmap_count > 0)
+		return;
+
+	ttm_bo_vunmap(tbo, &lbo->map);
+
+	ttm_bo_unpin(tbo);
+}
+
+static int lsdc_gem_object_mmap(struct drm_gem_object *gem,
+				struct vm_area_struct *vma)
+{
+	struct ttm_buffer_object *tbo = to_ttm_bo(gem);
+	int ret;
+
+	ret = ttm_bo_mmap_obj(vma, tbo);
+	if (ret < 0)
+		return ret;
+
+	drm_gem_object_put(gem);
+
+	return 0;
+}
+
+static const struct drm_gem_object_funcs lsdc_gem_object_funcs = {
+	.free = lsdc_gem_object_free,
+	.export = drm_gem_prime_export,
+	.pin = lsdc_gem_prime_pin,
+	.unpin = lsdc_gem_prime_unpin,
+	.get_sg_table = lsdc_gem_prime_get_sg_table,
+	.vmap = lsdc_gem_object_vmap,
+	.vunmap = lsdc_gem_object_vunmap,
+	.mmap = lsdc_gem_object_mmap,
+};
+
+static struct drm_gem_object *
+lsdc_gem_object_create(struct drm_device *ddev,
+		       u32 domain,
+		       size_t size,
+		       struct sg_table *sg,
+		       struct dma_resv *resv)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_gem_object *gobj;
+	struct lsdc_bo *lbo;
+	int ret;
+
+	lbo = lsdc_bo_create(ddev, domain, size, false, NULL, NULL);
+	if (IS_ERR(lbo)) {
+		ret = PTR_ERR(lbo);
+		return ERR_PTR(ret);
+	}
+
+	gobj = &lbo->tbo.base;
+	gobj->funcs = &lsdc_gem_object_funcs;
+
+	/* tracking the BOs we created */
+	mutex_lock(&ldev->gem.mutex);
+	list_add_tail(&lbo->list, &ldev->gem.objects);
+	mutex_unlock(&ldev->gem.mutex);
+
+	return gobj;
+}
+
+struct drm_gem_object *
+lsdc_prime_import_sg_table(struct drm_device *ddev,
+			   struct dma_buf_attachment *attach,
+			   struct sg_table *sg)
+{
+	struct dma_resv *resv = attach->dmabuf->resv;
+	u64 size = attach->dmabuf->size;
+	struct drm_gem_object *gobj;
+	struct lsdc_bo *lbo;
+
+	dma_resv_lock(resv, NULL);
+	gobj = lsdc_gem_object_create(ddev, LSDC_GEM_DOMAIN_GTT, size, sg, resv);
+	dma_resv_unlock(resv);
+
+	if (IS_ERR(gobj)) {
+		drm_err(ddev, "Failed to import sg table\n");
+		return gobj;
+	}
+
+	lbo = gem_to_lsdc_bo(gobj);
+	lbo->sharing_count = 1;
+
+	return gobj;
+}
+
+int lsdc_dumb_create(struct drm_file *file,
+		     struct drm_device *ddev,
+		     struct drm_mode_create_dumb *args)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	struct drm_gem_object *gobj;
+	size_t pitch, size;
+	u32 handle;
+	int ret;
+
+	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
+	pitch = ALIGN(pitch, descp->pitch_align);
+	size = pitch * args->height;
+	size = roundup(size, PAGE_SIZE);
+
+	if (!size)
+		return -EINVAL;
+
+	gobj = lsdc_gem_object_create(ddev,
+				      LSDC_GEM_DOMAIN_VRAM,
+				      size,
+				      NULL,
+				      NULL);
+	if (IS_ERR(gobj))
+		return PTR_ERR(gobj);
+
+	ret = drm_gem_handle_create(file, gobj, &handle);
+
+	/* drop reference from allocate, handle holds it now */
+	drm_gem_object_put(gobj);
+	if (ret)
+		return ret;
+
+	args->pitch = pitch;
+	args->size = size;
+	args->handle = handle;
+
+	return 0;
+}
+
+int lsdc_dumb_map_offset(struct drm_file *filp,
+			 struct drm_device *ddev,
+			 u32 handle,
+			 uint64_t *offset)
+{
+	struct drm_gem_object *gobj;
+
+	gobj = drm_gem_object_lookup(filp, handle);
+	if (!gobj)
+		return -ENOENT;
+
+	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
+
+	drm_gem_object_put(gobj);
+
+	return 0;
+}
+
+void lsdc_gem_init(struct drm_device *ddev)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	mutex_init(&ldev->gem.mutex);
+	INIT_LIST_HEAD(&ldev->gem.objects);
+}
+
+int lsdc_show_buffer_object(struct seq_file *m, void *arg)
+{
+#ifdef CONFIG_DEBUG_FS
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_bo *lbo;
+	unsigned int i = 0;
+
+	mutex_lock(&ldev->gem.mutex);
+
+	list_for_each_entry(lbo, &ldev->gem.objects, list) {
+		struct ttm_buffer_object *tbo = &lbo->tbo;
+		struct ttm_resource *resource = tbo->resource;
+
+		seq_printf(m, "bo[%04u]: size: %8ukB %s\n",
+			   i,
+			   (unsigned int)(lsdc_bo_size(tbo) >> 10),
+			   lsdc_mem_type_to_str(resource->mem_type));
+
+		i++;
+	}
+
+	mutex_unlock(&ldev->gem.mutex);
+#endif
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
new file mode 100644
index 000000000000..7c3cefb6176e
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_gem.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_GEM_H__
+#define __LSDC_GEM_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+struct drm_gem_object *
+lsdc_prime_import_sg_table(struct drm_device *ddev,
+			   struct dma_buf_attachment *attach,
+			   struct sg_table *sg);
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
+void lsdc_gem_init(struct drm_device *ddev);
+int lsdc_show_buffer_object(struct seq_file *m, void *arg);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
new file mode 100644
index 000000000000..18b5a773bc13
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_managed.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
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
+ * The DC in ls7a1000/ls7a2000/ls2k2000 has builtin gpio hardware
+ *
+ * @reg_base: gpio reg base
+ * @index: output channel index, 0 for PIPE0, 1 for PIPE1
+ */
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
+		li2c->sda = 0x01;  /* pin 0 */
+		li2c->scl = 0x02;  /* pin 1 */
+	} else if (index == 1) {
+		li2c->sda = 0x04;  /* pin 2 */
+		li2c->scl = 0x08;  /* pin 3 */
+	}
+
+	li2c->ddev = ddev;
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
+	drm_info(ddev, "%s(sda pin mask=%u, scl pin mask=%u) created for connector-%u\n",
+		 adapter->name, li2c->sda, li2c->scl, index);
+
+	return li2c;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongson/lsdc_irq.c
new file mode 100644
index 000000000000..91c93e8187ea
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_irq.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_vblank.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_irq.h"
+
+/*
+ * For the DC in ls7a2000, clearing interrupt status is achieved by
+ * write "1" to LSDC_INT_REG, For the DC in ls7a1000, ls2k1000,
+ * Interrupt status clear is achieved by write "0" to LSDC_INT_REG.
+ * Two different hardware engineer of Loongson modify it as their will.
+ */
+
+static irqreturn_t ls7a2000_irq_handler(int irq, void *arg)
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
+/* For the DC in LS7A1000 and LS2K1000 */
+static irqreturn_t ls7a1000_irq_handler(int irq, void *arg)
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
+		return ls7a2000_irq_handler;
+
+	if (descp->chip == CHIP_LS7A1000)
+		return ls7a1000_irq_handler;
+
+	return ls7a1000_irq_handler;
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
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.h b/drivers/gpu/drm/loongson/lsdc_irq.h
new file mode 100644
index 000000000000..c24b9ca13b3f
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_irq.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_IRQ_H__
+#define __LSDC_IRQ_H__
+
+#include <linux/irqreturn.h>
+
+irqreturn_t lsdc_irq_thread_handler(int irq, void *arg);
+irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..8786180151ce
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/delay.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_file.h>
+#include <drm/drm_probe_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
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
+lsdc_dpi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct i2c_adapter *ddc = connector->ddc;
+
+	if (ddc) {
+		if (drm_probe_ddc(ddc))
+			return connector_status_connected;
+
+		return connector_status_disconnected;
+	}
+
+	return connector_status_unknown;
+}
+
+static enum drm_connector_status
+ls7a2000_hdmi_vga_connector_detect_pipe0(struct drm_connector *connector, bool force)
+{
+	struct drm_device *ddev = connector->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (val & HDMI0_HPD_FLAG)
+		return connector_status_connected;
+
+	if (connector->ddc) {
+		if (drm_probe_ddc(connector->ddc))
+			return connector_status_connected;
+
+		return connector_status_disconnected;
+	}
+
+	return connector_status_unknown;
+}
+
+static enum drm_connector_status
+ls7a2000_hdmi_connector_detect_pipe1(struct drm_connector *connector, bool force)
+{
+	struct lsdc_device *ldev = to_lsdc(connector->dev);
+	u32 val;
+
+	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
+
+	if (val & HDMI1_HPD_FLAG)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
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
+#define LSDC_CONNECTOR_FUNS(pfn_detect)                                        \
+	.detect = pfn_detect,                                                  \
+	.fill_modes = drm_helper_probe_single_connector_modes,                 \
+	.destroy = drm_connector_cleanup,                                      \
+	.reset = drm_atomic_helper_connector_reset,                            \
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state
+
+static const struct drm_connector_funcs lsdc_dpi_connector_funcs = {
+	LSDC_CONNECTOR_FUNS(lsdc_dpi_connector_detect),
+};
+
+static const struct drm_connector_funcs
+ls7a2000_hdmi_connector_funcs[LSDC_NUM_CRTC] = {
+	{
+		LSDC_CONNECTOR_FUNS(ls7a2000_hdmi_vga_connector_detect_pipe0),
+	},
+	{
+		LSDC_CONNECTOR_FUNS(ls7a2000_hdmi_connector_detect_pipe1),
+	},
+};
+
+/* Even though some board has only one hdmi on display pipe 1,
+ * We still need hook lsdc_encoder_funcs up on display pipe 0,
+ * This is because we need its reset() callback get called, to
+ * set the LSDC_HDMIx_CTRL_REG using software gpio emulated i2c.
+ * Otherwise, the firmware may set LSDC_HDMIx_CTRL_REG blindly.
+ */
+static void ls7a2000_hdmi_encoder_reset(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	u32 val;
+
+	val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index);
+	val &= ~HDMI_PHY_RESET_N;
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
+	udelay(9);
+	val |= HDMI_PHY_RESET_N;
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
+	udelay(9);
+
+	val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index);
+	val &= ~HW_I2C_EN;
+	val |= HDMI_INTERFACE_EN | HDMI_PACKET_EN;
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index, val);
+
+	drm_dbg(ddev, "HDMI-%u Reset\n", index);
+}
+
+#ifdef CONFIG_DEBUG_FS
+
+#define LSDC_HDMI_REG(i, reg) {                               \
+	.name = __stringify_1(LSDC_HDMI##i##_##reg##_REG),    \
+	.offset = LSDC_HDMI##i##_##reg##_REG,                 \
+}
+
+static const struct debugfs_reg32 ls7a2000_hdmi_encoder_regs[][9] = {
+	{
+		LSDC_HDMI_REG(0, ZONE),
+		LSDC_HDMI_REG(0, INTF_CTRL),
+		LSDC_HDMI_REG(0, PHY_CTRL),
+		LSDC_HDMI_REG(0, PHY_PLL),
+		LSDC_HDMI_REG(0, AVI_INFO_CRTL),
+		LSDC_HDMI_REG(0, PHY_CAL),
+		LSDC_HDMI_REG(0, AUDIO_PLL_LO),
+		LSDC_HDMI_REG(0, AUDIO_PLL_HI),
+		{NULL, 0},
+	},
+	{
+		LSDC_HDMI_REG(1, ZONE),
+		LSDC_HDMI_REG(1, INTF_CTRL),
+		LSDC_HDMI_REG(1, PHY_CTRL),
+		LSDC_HDMI_REG(1, PHY_PLL),
+		LSDC_HDMI_REG(1, AVI_INFO_CRTL),
+		LSDC_HDMI_REG(1, PHY_CAL),
+		LSDC_HDMI_REG(1, AUDIO_PLL_LO),
+		LSDC_HDMI_REG(1, AUDIO_PLL_HI),
+		{NULL, 0},  /* MUST be {NULL, 0} terminated */
+	},
+};
+
+static int ls7a2000_hdmi_encoder_regs_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct debugfs_reg32 *preg;
+
+	preg = (const struct debugfs_reg32 *)node->info_ent->data;
+
+	while (preg->name) {
+		u32 offset = preg->offset;
+
+		seq_printf(m, "%s (0x%04x): 0x%08x\n", preg->name, offset,
+			   lsdc_rreg32(ldev, offset));
+		++preg;
+	}
+
+	return 0;
+}
+
+static const struct drm_info_list ls7a2000_hdmi_debugfs_files[] = {
+	{ "hdmi0_regs", ls7a2000_hdmi_encoder_regs_show, 0, (void *)ls7a2000_hdmi_encoder_regs[0] },
+	{ "hdmi1_regs", ls7a2000_hdmi_encoder_regs_show, 0, (void *)ls7a2000_hdmi_encoder_regs[1] },
+};
+
+static int ls7a2000_hdmi_encoder_late_register(struct drm_encoder *encoder)
+{
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct drm_minor *minor = ddev->primary;
+
+	drm_debugfs_create_files(&ls7a2000_hdmi_debugfs_files[dispipe->index],
+				 1, minor->debugfs_root, minor);
+
+	return 0;
+}
+
+#endif
+
+static const struct drm_encoder_funcs ls7a1000_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_encoder_funcs ls7a2000_encoder_funcs = {
+	.reset = ls7a2000_hdmi_encoder_reset,
+	.destroy = drm_encoder_cleanup,
+#ifdef CONFIG_DEBUG_FS
+	.late_register = ls7a2000_hdmi_encoder_late_register,
+#endif
+};
+
+static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
+					   struct drm_display_mode *mode)
+{
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
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
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_INFO_CRTL_REG, index,
+			 AVI_PKT_ENABLE | AVI_PKT_UPDATE);
+
+	drm_dbg(ddev, "Update HDMI-%u avi infoframe\n", index);
+
+	return 0;
+}
+
+static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
+					 struct drm_atomic_state *state)
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
+static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
+					struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	unsigned int index = dispipe->index;
+	u32 val;
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_ZONE_REG, index, 0x00400040);
+
+	val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index);
+
+	val |= HDMI_PHY_TERM_STATUS |
+	       HDMI_PHY_TERM_DET_EN |
+	       HDMI_PHY_TERM_H_EN |
+	       HDMI_PHY_TERM_L_EN |
+	       HDMI_PHY_EN;
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
+
+	val = HDMI_CTL_PERIOD_MODE |
+	      HDMI_AUDIO_EN |
+	      HDMI_PACKET_EN |
+	      HDMI_INTERFACE_EN |
+	      (8 << HDMI_VIDEO_PREAMBLE_SHIFT);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index, val);
+
+	drm_dbg(ddev, "HDMI-%u enabled\n", index);
+}
+
+/*
+ *  Fout = M * Fin
+ *
+ *  M = (4 * LF) / (IDF * ODF)
+ *
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
+static void ls7a2000_hdmi_phy_pll_config(struct lsdc_device *ldev,
+					 int fin,
+					 unsigned int index)
+{
+	struct drm_device *ddev = &ldev->base;
+	int count = 0;
+	u32 val;
+
+	/* Firstly, disable phy pll */
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, 0x0);
+
+	/*
+	 * Most of time, loongson HDMI require M = 10
+	 * for example, 10 = (4 * 40) / (8 * 2)
+	 * here, write "1" to the ODF will get "2"
+	 */
+
+	if (fin >= 170000)
+		val = (16 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (0 << HDMI_PLL_ODF_SHIFT);
+	else if (fin >= 85000)
+		val = (8 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (1 << HDMI_PLL_ODF_SHIFT);
+	else if (fin >= 42500)
+		val = (4 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (2 << HDMI_PLL_ODF_SHIFT);
+	else if  (fin >= 21250)
+		val = (2 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (3 << HDMI_PLL_ODF_SHIFT);
+	else
+		val = (1 << HDMI_PLL_IDF_SHIFT) |
+		      (40 << HDMI_PLL_LF_SHIFT) |
+		      (4 << HDMI_PLL_ODF_SHIFT);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, val | HDMI_PLL_ENABLE);
+
+	udelay(1);
+
+	drm_dbg(ddev, "Fin of HDMI-%u: %d kHz\n", index, fin);
+
+	/* Wait hdmi phy pll lock */
+	do {
+		val = lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index);
+
+		if (val & HDMI_PLL_LOCKED) {
+			drm_dbg(ddev, "Setting HDMI-%u PLL take %d cycles\n",
+				index, count);
+			break;
+		}
+		++count;
+	} while (count < 1000);
+
+	lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CAL_REG, index, 0xf000ff0);
+
+	if (count >= 1000)
+		drm_err(ddev, "Setting HDMI-%u PLL failed\n", index);
+}
+
+static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct lsdc_display_pipe *dispipe = encoder_to_display_pipe(encoder);
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_display_mode *mode = &crtc_state->mode;
+
+	ls7a2000_hdmi_phy_pll_config(ldev, mode->clock, dispipe->index);
+
+	ls7a2000_hdmi_set_avi_infoframe(encoder, mode);
+
+	drm_dbg(ddev, "HDMI-%u modeset finished\n", dispipe->index);
+}
+
+const struct drm_encoder_helper_funcs ls7a2000_hdmi_encoder_helper_funcs = {
+	.atomic_disable = ls7a2000_hdmi_atomic_disable,
+	.atomic_enable = ls7a2000_hdmi_atomic_enable,
+	.atomic_mode_set = ls7a2000_hdmi_atomic_mode_set,
+};
+
+/*
+ * For LS7A2000:
+ *
+ * 1) Some board export double hdmi output interface
+ * 2) Most of board export one vga + hdmi output interface
+ * 3) Still have boards export three output(2 hdmi + 1 vga).
+ *
+ * So let's hook hdmi helper funcs to all display pipe, don't miss.
+ * writing hdmi register do no harms.
+ */
+static int ls7a2000_output_init(struct lsdc_device *ldev,
+				struct lsdc_display_pipe *dispipe,
+				struct i2c_adapter *ddc)
+{
+	struct drm_device *ddev = &ldev->base;
+	struct drm_encoder *encoder = &dispipe->encoder;
+	struct drm_connector *connector = &dispipe->connector;
+	unsigned int pipe = dispipe->index;
+	int ret;
+
+	ret = drm_encoder_init(ddev,
+			       encoder,
+			       &ls7a2000_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS,
+			       "encoder-%u",
+			       pipe);
+	if (ret)
+		return ret;
+
+	encoder->possible_crtcs = BIT(pipe);
+
+	drm_encoder_helper_add(encoder, &ls7a2000_hdmi_encoder_helper_funcs);
+
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  &ls7a2000_hdmi_connector_funcs[pipe],
+					  DRM_MODE_CONNECTOR_HDMIA,
+					  ddc);
+	if (ret)
+		return ret;
+
+	drm_info(ddev, "display pipe-%u has HDMI%s\n", pipe, pipe ? "" : " and/or VGA");
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
+	return 0;
+}
+
+static int ls7a1000_output_init(struct lsdc_device *ldev,
+				struct lsdc_display_pipe *dispipe,
+				struct i2c_adapter *ddc)
+{
+	struct drm_device *ddev = &ldev->base;
+	struct drm_encoder *encoder = &dispipe->encoder;
+	struct drm_connector *connector = &dispipe->connector;
+	int ret;
+
+	ret = drm_encoder_init(ddev,
+			       encoder,
+			       &ls7a1000_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS,
+			       "encoder-%u",
+			       dispipe->index);
+	if (ret)
+		return ret;
+
+	encoder->possible_crtcs = BIT(dispipe->index);
+
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  &lsdc_dpi_connector_funcs,
+					  DRM_MODE_CONNECTOR_DPI,
+					  ddc);
+	if (ret)
+		return ret;
+
+	drm_info(ddev, "display pipe-%u has a DVO\n", dispipe->index);
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
+	return 0;
+}
+
+typedef int (*pfn_output_init_t)(struct lsdc_device *ldev,
+				 struct lsdc_display_pipe *disp,
+				 struct i2c_adapter *ddc);
+
+/* NOTE: keep this as the order listed in loongson_chip_family enum */
+static const pfn_output_init_t lsdc_output_init[CHIP_LAST] = {
+	ls7a1000_output_init,
+	ls7a2000_output_init,
+};
+
+int lsdc_create_output(struct lsdc_device *ldev,
+		       struct lsdc_display_pipe *dispipe)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+	struct i2c_adapter *ddc = NULL;
+	struct lsdc_i2c *li2c;
+
+	if (descp->has_builtin_i2c) {
+		li2c = lsdc_create_i2c_chan(&ldev->base, ldev->reg_base, dispipe->index);
+		if (IS_ERR(li2c))
+			return PTR_ERR(li2c);
+
+		dispipe->li2c = li2c;
+		ddc = &li2c->adapter;
+	}
+
+	/* Output interfaces suffer from changes */
+	return lsdc_output_init[descp->chip](ldev, dispipe, ddc);
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
new file mode 100644
index 000000000000..db2d32a60c3d
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_OUTPUT_H__
+#define __LSDC_OUTPUT_H__
+
+#include "lsdc_drv.h"
+
+int lsdc_create_output(struct lsdc_device *ldev, struct lsdc_display_pipe *p);
+
+struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
+				      void *base,
+				      unsigned int index);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
new file mode 100644
index 000000000000..9e255d4f8457
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -0,0 +1,416 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane_helper.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_ttm.h"
+
+static const u32 lsdc_primary_formats[] = {
+	DRM_FORMAT_XRGB8888,
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
+static int lsdc_cursor_atomic_check(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	if (!crtc)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   true,
+						   true);
+}
+
+static int lsdc_primary_atomic_check(struct drm_plane *plane,
+				     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	if (!crtc)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false,
+						   true);
+}
+
+static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
+				       struct drm_plane_state *state)
+{
+	unsigned int offset = fb->offsets[0];
+
+	offset += fb->format->cpp[0] * (state->src_x >> 16);
+	offset += fb->pitches[0] * (state->src_y >> 16);
+
+	return offset;
+}
+
+static void lsdc_primary_atomic_update(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct lsdc_display_pipe *dispipe = primary_to_display_pipe(plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct ttm_buffer_object *tbo = to_ttm_bo(new_fb->obj[0]);
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = dispipe->index;
+	unsigned int fb_offset = lsdc_get_fb_offset(new_fb, new_plane_state);
+	u64 bo_offset = lsdc_bo_gpu_offset(tbo);
+	u64 fb_addr = ldev->vram_base + bo_offset + fb_offset;
+	u32 stride = new_fb->pitches[0];
+	u32 cfg;
+	u32 lo, hi;
+
+	/* 40-bit width physical address bus */
+	lo = fb_addr & 0xFFFFFFFF;
+	hi = (fb_addr >> 32) & 0xFF;
+
+	cfg = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, index);
+	if (cfg & CFG_FB_IN_USING) {
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG, index, lo);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG, index, hi);
+	} else {
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG, index, lo);
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG, index, hi);
+	}
+
+	lsdc_crtc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, index, stride);
+
+	if (!old_fb || new_fb->format != old_fb->format) {
+		cfg &= ~CFG_PIX_FMT_MASK;
+		cfg |= LSDC_PF_XRGB8888;
+
+		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, index, cfg);
+	}
+}
+
+static void lsdc_primary_atomic_disable(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	/* Do nothing, just prevent call into atomic_update().
+	 * Writing the format as LSDC_PF_NONE can disable the primary,
+	 * But it seems not necessary...
+	 */
+	drm_dbg(plane->dev, "%s disabled\n", plane->name);
+}
+
+static int lsdc_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *new_state)
+{
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_gem_object *obj;
+	struct lsdc_bo *lbo;
+	int ret;
+
+	if (!fb)
+		return 0;
+
+	obj = fb->obj[0];
+	if (!obj)
+		return -EINVAL;
+
+	lbo = gem_to_lsdc_bo(obj);
+
+	ret = lsdc_bo_pin(lbo, LSDC_GEM_DOMAIN_VRAM, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (ret)
+		lsdc_bo_unpin(lbo);
+
+	return 0;
+}
+
+static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
+				  struct drm_plane_state *old_state)
+{
+	struct drm_framebuffer *fb = old_state->fb;
+	struct drm_gem_object *obj;
+	struct lsdc_bo *lbo;
+
+	if (!fb)
+		return;
+
+	obj = fb->obj[0];
+	if (!obj)
+		return;
+
+	lbo = gem_to_lsdc_bo(obj);
+
+	lsdc_bo_unpin(lbo);
+}
+
+static const struct drm_plane_helper_funcs lsdc_primary_helper_funcs = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_primary_atomic_check,
+	.atomic_update = lsdc_primary_atomic_update,
+	.atomic_disable = lsdc_primary_atomic_disable,
+};
+
+/*
+ * Update location, format, enable and disable state of the cursor,
+ * For those who have two hardware cursor, cursor 0 is attach it to CRTC-0,
+ * cursor 1 is attached to CRTC-1. Compositing the primary and cursor plane
+ * is automatically done by hardware, the cursor is alway on the top of the
+ * primary. In other word, z-order is fixed in hardware and cannot be changed.
+ */
+static void ls7a1000_cursor_atomic_update(struct drm_plane *plane,
+					  struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_display_pipe *dispipe = cursor_to_display_pipe(plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct ttm_buffer_object *tbo = to_ttm_bo(new_fb->obj[0]);
+	u64 addr = ldev->vram_base + lsdc_bo_gpu_offset(tbo);
+	u32 cfg = CURSOR_FORMAT_ARGB8888;
+	int x = new_plane_state->crtc_x;
+	int y = new_plane_state->crtc_y;
+
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
+
+	if (new_fb != old_fb) {
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (addr >> 32) & 0xFF);
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, addr);
+	}
+
+	/*
+	 * If bit 4(CURSOR_LOCATION) of LSDC_CURSOR0_CFG_REG is 1, cursor will
+	 * be locate at CRTC-1, if bit 4 of LSDC_CURSOR0_CFG_REG is 0, cursor
+	 * will be locate at CRTC-0. For the old device we made the single hw
+	 * cursor shared by two CRTC. Switch to software cursor is also ok.
+	 */
+	lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, dispipe->index ? cfg | CURSOR_LOCATION : cfg);
+}
+
+static void ls7a1000_cursor_atomic_disable(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 cfg;
+
+	cfg = lsdc_rreg32(ldev, LSDC_CURSOR0_CFG_REG);
+	/* write 0 to cursor format bits, it will be invisiable */
+	cfg &= ~CURSOR_FORMAT_MASK;
+	lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg);
+}
+
+static const struct drm_plane_helper_funcs ls7a1000_cursor_helper_funcs = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_cursor_atomic_check,
+	.atomic_update = ls7a1000_cursor_atomic_update,
+	.atomic_disable = ls7a1000_cursor_atomic_disable,
+};
+
+/* update the format, size and location of the cursor */
+static void ls7a2000_cursor0_atomic_update(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct ttm_buffer_object *tbo = to_ttm_bo(new_fb->obj[0]);
+	u64 addr = ldev->vram_base + lsdc_bo_gpu_offset(tbo);
+	int x = new_plane_state->crtc_x;
+	int y = new_plane_state->crtc_y;
+
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
+
+	if (new_fb != old_fb) {
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (addr >> 32) & 0xFF);
+		lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, addr);
+	}
+
+	lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, CURSOR_FORMAT_ARGB8888 | CURSOR_SIZE_64X64);
+}
+
+/* update the format, size and location of the cursor */
+static void ls7a2000_cursor1_atomic_update(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct ttm_buffer_object *tbo = to_ttm_bo(new_fb->obj[0]);
+	u64 addr = ldev->vram_base + lsdc_bo_gpu_offset(tbo);
+	int x = new_plane_state->crtc_x;
+	int y = new_plane_state->crtc_y;
+
+	if (x < 0)
+		x = 0;
+
+	if (y < 0)
+		y = 0;
+
+	lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y << 16) | x);
+
+	if (new_fb != old_fb) {
+		lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG, (addr >> 32) & 0xFF);
+		lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG, addr);
+	}
+
+	lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG,
+		    CURSOR_FORMAT_ARGB8888 | CURSOR_SIZE_64X64 | CURSOR_LOCATION);
+}
+
+static void ls7a2000_cursor0_atomic_disable(struct drm_plane *plane,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 cfg;
+
+	cfg = lsdc_rreg32(ldev, LSDC_CURSOR0_CFG_REG);
+	/* write 0 to cursor format bits, it will be invisiable */
+	cfg &= ~CURSOR_FORMAT_MASK;
+	lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg);
+}
+
+static void ls7a2000_cursor1_atomic_disable(struct drm_plane *plane,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 cfg;
+
+	cfg = lsdc_rreg32(ldev, LSDC_CURSOR1_CFG_REG);
+	/* write 0 to cursor format bits, it will be invisiable */
+	cfg &= ~CURSOR_FORMAT_MASK;
+	lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, cfg);
+}
+
+static const struct drm_plane_helper_funcs ls7a2000_cursor_helper_funcs[2] = {
+	{
+		.prepare_fb = lsdc_plane_prepare_fb,
+		.cleanup_fb = lsdc_plane_cleanup_fb,
+		.atomic_check = lsdc_cursor_atomic_check,
+		.atomic_update = ls7a2000_cursor0_atomic_update,
+		.atomic_disable = ls7a2000_cursor0_atomic_disable,
+	},
+	{
+		.prepare_fb = lsdc_plane_prepare_fb,
+		.cleanup_fb = lsdc_plane_cleanup_fb,
+		.atomic_check = lsdc_cursor_atomic_check,
+		.atomic_update = ls7a2000_cursor1_atomic_update,
+		.atomic_disable = ls7a2000_cursor1_atomic_disable,
+	}
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
+int lsdc_primary_plane_init(struct lsdc_device *ldev,
+			    struct drm_plane *plane,
+			    unsigned int index)
+{
+	int ret;
+
+	ret = drm_universal_plane_init(&ldev->base,
+				       plane,
+				       1 << index,
+				       &lsdc_plane_funcs,
+				       lsdc_primary_formats,
+				       ARRAY_SIZE(lsdc_primary_formats),
+				       lsdc_fb_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY,
+				       "primary-%u",
+				       index);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(plane, &lsdc_primary_helper_funcs);
+
+	return 0;
+}
+
+int lsdc_cursor_plane_init(struct lsdc_device *ldev,
+			   struct drm_plane *plane,
+			   unsigned int index)
+{
+	const struct lsdc_desc *descp = ldev->descp;
+	int ret;
+
+	ret = drm_universal_plane_init(&ldev->base,
+				       plane,
+				       1 << index,
+				       &lsdc_plane_funcs,
+				       lsdc_cursor_formats,
+				       ARRAY_SIZE(lsdc_cursor_formats),
+				       lsdc_fb_format_modifiers,
+				       DRM_PLANE_TYPE_CURSOR,
+				       "cursor-%u",
+				       index);
+	if (ret)
+		return ret;
+
+	/* The hw cursors become normal since ls7a2000(including ls2k2000) */
+	if (descp->chip == CHIP_LS7A2000)
+		drm_plane_helper_add(plane, &ls7a2000_cursor_helper_funcs[index]);
+	else
+		drm_plane_helper_add(plane, &ls7a1000_cursor_helper_funcs);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_pll.c b/drivers/gpu/drm/loongson/lsdc_pll.c
new file mode 100644
index 000000000000..83734026a410
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_pll.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+
+#include "lsdc_drv.h"
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
+union lsdc_pixpll_bitmap {
+	struct ls7a1000_pixpll_bitmap ls7a1000;
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
+	{148500, 1920, 1080, 60,  11, 49,  3},   /* 1920x1080@60Hz */
+						 /* 1920x1080@50Hz */
+	{174500, 1920, 1080, 75,  17, 89,  3},   /* 1920x1080@75Hz */
+	{181250, 2560, 1080, 75,  8, 58,  4},    /* 2560x1080@75Hz */
+	{297000, 2560, 1080, 30,  8, 95,  4},    /* 3840x2160@30Hz */
+	{301992, 1920, 1080, 100, 10, 151, 5},   /* 1920x1080@100Hz */
+	{146250, 1680, 1050, 60,  16, 117, 5},   /* 1680x1050@60Hz */
+	{135000, 1280, 1024, 75,  10, 54,  4},   /* 1280x1024@75Hz */
+	{119000, 1680, 1050, 60,  20, 119, 5},   /* 1680x1050@60Hz */
+	{108000, 1600, 900,  60,  15, 81,  5},   /* 1600x900@60Hz  */
+						 /* 1280x1024@60Hz */
+						 /* 1280x960@60Hz */
+						 /* 1152x864@75Hz */
+
+	{106500, 1440, 900,  60,  19, 81,  4},   /* 1440x900@60Hz */
+	{88750,  1440, 900,  60,  16, 71,  5},   /* 1440x900@60Hz */
+	{83500,  1280, 800,  60,  17, 71,  5},   /* 1280x800@60Hz */
+	{71000,  1280, 800,  60,  20, 71,  5},   /* 1280x800@60Hz */
+
+	{74250,  1280, 720,  60,  22, 49,  3},   /* 1280x720@60Hz */
+						 /* 1280x720@50Hz */
+
+	{78750,  1024, 768,  75,  16, 63,  5},   /* 1024x768@75Hz */
+	{75000,  1024, 768,  70,  29, 87,  4},   /* 1024x768@70Hz */
+	{65000,  1024, 768,  60,  20, 39,  3},   /* 1024x768@60Hz */
+
+	{51200,  1024, 600,  60,  25, 64,  5},   /* 1024x600@60Hz */
+
+	{57284,  832,  624,  75,  24, 55,  4},   /* 832x624@75Hz */
+	{49500,  800,  600,  75,  40, 99,  5},   /* 800x600@75Hz */
+	{50000,  800,  600,  72,  44, 88,  4},   /* 800x600@72Hz */
+	{40000,  800,  600,  60,  30, 36,  3},   /* 800x600@60Hz */
+	{36000,  800,  600,  56,  50, 72,  4},   /* 800x600@56Hz */
+	{31500,  640,  480,  75,  40, 63,  5},   /* 640x480@75Hz */
+						 /* 640x480@73Hz */
+
+	{30240,  640,  480,  67,  62, 75,  4},   /* 640x480@67Hz */
+	{27000,  720,  576,  50,  50, 54,  4},   /* 720x576@60Hz */
+	{25175,  640,  480,  60,  85, 107, 5},   /* 640x480@60Hz */
+	{25200,  640,  480,  60,  50, 63,  5},   /* 640x480@60Hz */
+						 /* 720x480@60Hz */
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
+ * Find a set of pll parameters from a static local table which avoid
+ * computing the pll parameter eachtime a modeset is triggered.
+ *
+ * @this: point to the object where this function is called from
+ * @clock: the desired output pixel clock, the unit is kHz
+ * @pout: point to where the parameters to store if found
+ *
+ * Return 0 if success, return -1 if not found.
+ */
+static int lsdc_pixpll_find(struct lsdc_pll * const this,
+			    unsigned int clock,
+			    struct lsdc_pll_parms *pout)
+{
+	unsigned int num = ARRAY_SIZE(pll_param_table);
+	unsigned int i;
+
+	for (i = 0; i < num; ++i) {
+		if (clock != pll_param_table[i].clock)
+			continue;
+
+		pout->div_ref = pll_param_table[i].div_ref;
+		pout->loopc   = pll_param_table[i].loopc;
+		pout->div_out = pll_param_table[i].div_out;
+
+		return 0;
+	}
+
+	drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
+
+	return -1;
+}
+
+/*
+ * Find a set of pll parameters which have minimal difference with the
+ * desired pixel clock frequency. It does that by computing all of the
+ * possible combination. Compute the diff and find the combination with
+ * minimal diff.
+ *
+ *  clock_out = refclk / div_ref * loopc / div_out
+ *
+ *  refclk is determined by the oscillator mounted on the motherboard(
+ *  Here is 100MHz in almost all board)
+ *
+ * @this: point to the object from where this function is called
+ * @clock_khz: the desired output pixel clock, the unit is kHz
+ * @pout: point to the out struct of lsdc_pll_parms
+ *
+ *  Return 0 if a set of parameter is found, otherwise return the error
+ *  between clock_kHz we wanted and the most closest candidate with it.
+ */
+static int lsdc_pixpll_compute(struct lsdc_pll * const this,
+			       unsigned int clock_khz,
+			       struct lsdc_pll_parms *pout)
+{
+	const unsigned int tolerance = 1000;
+	unsigned int refclk = this->ref_clock;
+	unsigned int min = tolerance;
+	unsigned int div_out, loopc, div_ref;
+	unsigned int computed;
+
+	if (!lsdc_pixpll_find(this, clock_khz, pout))
+		return 0;
+
+	for (div_out = 6; div_out < 64; div_out++) {
+		for (div_ref = 3; div_ref < 6; div_ref++) {
+			for (loopc = 6; loopc < 161; loopc++) {
+				unsigned int diff;
+
+				if (loopc < 12 * div_ref)
+					continue;
+				if (loopc > 32 * div_ref)
+					continue;
+
+				computed = refclk / div_ref * loopc / div_out;
+
+				if (clock_khz >= computed)
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
+						return 0;
+				}
+			}
+		}
+	}
+
+	if (min < tolerance)
+		return 0;
+
+	return min;
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
+	udelay(1);
+
+	/* Wait the PLL lock */
+	do {
+		val = readl(reg + 0x4);
+		locked = val & 0x80;
+		if (locked)
+			break;
+		++counter;
+	} while (counter < 2000);
+
+	drm_dbg(this->ddev, "%u loop waited\n", counter);
+
+	/* Switch to the configured pll just now */
+	val = readl(reg + 0x4);
+	val |= (1UL << 8);
+	writel(val, reg + 0x4);
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
+static const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
+	.setup = lsdc_pixpll_setup,
+	.compute = lsdc_pixpll_compute,
+	.update = ls7a1000_pixpll_param_update,
+	.get_clock_rate = ls7a1000_get_clock_rate,
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
+	/* LS7A1000, LS7A2000's setting registers is same */
+	if (descp->chip == CHIP_LS7A2000 ||
+	    descp->chip == CHIP_LS7A1000) {
+		if (index == 0)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL0_REG;
+		else if (index == 1)
+			this->reg_base = LS7A1000_CFG_REG_BASE + LS7A1000_PIX_PLL1_REG;
+		this->reg_size = 8;
+		this->funcs = &ls7a1000_pixpll_funcs;
+	} else {
+		drm_err(ddev, "unknown chip, the driver need update\n");
+		return -ENOENT;
+	}
+
+	return this->funcs->setup(this);
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_pll.h b/drivers/gpu/drm/loongson/lsdc_pll.h
new file mode 100644
index 000000000000..61d11063a909
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_pll.h
@@ -0,0 +1,76 @@
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
+	int (*compute)(struct lsdc_pll * const this, unsigned int clock,
+		       struct lsdc_pll_parms *pout);
+	int (*update)(struct lsdc_pll * const this, struct lsdc_pll_parms const *pin);
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
diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c b/drivers/gpu/drm/loongson/lsdc_probe.c
new file mode 100644
index 000000000000..380f02b92d7d
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_probe.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "lsdc_drv.h"
+#include "lsdc_probe.h"
+
+/*
+ * Processor ID (implementation) values for bits 15:8 of the PRID register.
+ */
+#define LOONGSON_CPU_IMP_MASK           0xff00
+#define LOONGSON_CPU_IMP_SHIFT          8
+
+#define LOONGARCH_CPU_IMP_LS2K1000      0xa0
+#define LOONGARCH_CPU_IMP_LS2K2000      0xb0
+#define LOONGARCH_CPU_IMP_LS3A5000      0xc0
+
+#define LOONGSON_CPU_MIPS_IMP_LS2K      0x61 /* Loongson 2K Mips series SoC */
+
+/*
+ * Particular Revision values for bits 7:0 of the PRID register.
+ */
+#define LOONGSON_CPU_REV_MASK           0x00ff
+
+#define LOONGARCH_CPUCFG_PRID_REG       0x0
+
+unsigned int loongson_cpu_get_prid(u8 *imp, u8 *rev)
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
+	if (imp)
+		*imp = (prid & LOONGSON_CPU_IMP_MASK) >> LOONGSON_CPU_IMP_SHIFT;
+
+	if (rev)
+		*rev = prid & LOONGSON_CPU_REV_MASK;
+
+	return prid;
+}
+
+/* LS2K2000 has only LoongArch edition (LA364) */
+bool lsdc_is_ls2k2000(void)
+{
+	u8 imp;
+
+	loongson_cpu_get_prid(&imp, NULL);
+
+	if (imp == LOONGARCH_CPU_IMP_LS2K2000)
+		return true;
+
+	return false;
+}
+
+bool lsdc_is_ls2k1000(void)
+{
+	u8 imp;
+
+	loongson_cpu_get_prid(&imp, NULL);
+
+#if defined(__mips__)
+	/* LS2K1000 has Mips edition(mips64r2) */
+	if (imp == LOONGSON_CPU_MIPS_IMP_LS2K)
+		return true;
+#endif
+
+#if defined(__loongarch__)
+	/* LS2K1000 has loongarch edition(LA264)
+	 * CPU core and instruction set changed, remains are basically same
+	 */
+	if (imp == LOONGARCH_CPU_IMP_LS2K1000)
+		return true;
+#endif
+
+	return false;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h b/drivers/gpu/drm/loongson/lsdc_probe.h
new file mode 100644
index 000000000000..b497cd3d0041
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_probe.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_PROBE_H__
+#define __LSDC_PROBE_H__
+
+/* Helpers for chip detection */
+bool lsdc_is_ls2k2000(void);
+bool lsdc_is_ls2k1000(void);
+unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_regs.h b/drivers/gpu/drm/loongson/lsdc_regs.h
new file mode 100644
index 000000000000..2fe58f1d3600
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_regs.h
@@ -0,0 +1,370 @@
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
+ * 7A2000, 2K2000 etc
+ */
+#define LS7A1000_PIX_PLL0_REG           0x04B0
+#define LS7A1000_PIX_PLL1_REG           0x04C0
+#define LS7A1000_CFG_REG_BASE           0x10010000
+
+/* For LSDC_CRTCx_CFG_REG */
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
+ * Each crtc has two set fb address registers usable, CFG_FB_IN_USING bit of
+ * LSDC_CRTCx_CFG_REG determine which fb address register is going to be used
+ * by the CRTC. the switching from one to another will be finished at the very
+ * next vblank. Trigger it again if you want to switch back.
+ *
+ * If FB0_XX_ADDR_REG is in using, we write the address to FB0_XX_ADDR_REG,
+ * if FB1_XX_ADDR_REG is in using, we write the address to FB1_XX_ADDR_REG.
+ */
+#define CFG_PAGE_FLIP                   BIT(7)
+#define CFG_OUTPUT_EN                   BIT(8)
+/*
+ * CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using hardware logic,
+ * Hardware engineer say this would help to save bandwidth, To enable this
+ * feature, you need to set this bit.
+ */
+#define CFG_HW_CLONE_EN                 BIT(9)
+/* Indicate witch fb addr reg is in using, currently. read only */
+#define CFG_FB_IN_USING                 BIT(11)
+#define CFG_GAMMA_EN                    BIT(12)
+
+/* The DC get soft reset if value of this bit changed from "1" to "0" */
+#define CFG_RESET_N                     BIT(20)
+
+/*
+ * The DMA step of the DC in LS7A2000/LS2K2000 is configurable,
+ * setting those bits on ls7a1000 platform make no effect.
+ */
+#define CFG_DMA_STEP_MASK              GENMASK(17, 16)
+#define CFG_DMA_STEP_SHIFT             16
+enum lsdc_dma_steps {
+	LSDC_DMA_STEP_256_BYTES = 0 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_128_BYTES = 1 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_64_BYTES = 2 << CFG_DMA_STEP_SHIFT,
+	LSDC_DMA_STEP_32_BYTES = 3 << CFG_DMA_STEP_SHIFT,
+};
+
+/* For LSDC_CRTCx_PANEL_CONF_REG */
+#define PHY_CLOCK_POL                   BIT(9)
+#define PHY_CLOCK_EN                    BIT(8)
+#define PHY_DE_POL                      BIT(1)
+#define PHY_DATA_EN                     BIT(0)
+
+/* For LSDC_CRTCx_HSYNC_REG */
+#define HSYNC_INV                       BIT(31)
+#define HSYNC_EN                        BIT(30)
+#define HSYNC_END_MASK                  GENMASK(28, 16)
+#define HSYNC_END_SHIFT                 16
+#define HSYNC_START_MASK                GENMASK(12, 0)
+#define HSYNC_START_SHIFT               0
+
+/* For LSDC_CRTCx_VSYNC_REG */
+#define VSYNC_INV                       BIT(31)
+#define VSYNC_EN                        BIT(30)
+#define VSYNC_END_MASK                  GENMASK(27, 16)
+#define VSYNC_END_SHIFT                 16
+#define VSYNC_START_MASK                GENMASK(11, 0)
+#define VSYNC_START_SHIFT               0
+
+/*********** CRTC0 & DISPLAY PIPE0 ***********/
+#define LSDC_CRTC0_CFG_REG              0x1240
+#define LSDC_CRTC0_FB0_LO_ADDR_REG      0x1260
+#define LSDC_CRTC0_FB0_HI_ADDR_REG      0x15A0
+#define LSDC_CRTC0_STRIDE_REG           0x1280
+#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
+#define LSDC_CRTC0_PANEL_CONF_REG       0x13C0
+#define LSDC_CRTC0_HDISPLAY_REG         0x1400
+#define LSDC_CRTC0_HSYNC_REG            0x1420
+#define LSDC_CRTC0_VDISPLAY_REG         0x1480
+#define LSDC_CRTC0_VSYNC_REG            0x14A0
+#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
+#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
+#define LSDC_CRTC0_FB1_LO_ADDR_REG      0x1580
+#define LSDC_CRTC0_FB1_HI_ADDR_REG      0x15C0
+
+/*********** CTRC1 & DISPLAY PIPE1 ***********/
+#define LSDC_CRTC1_CFG_REG              0x1250
+#define LSDC_CRTC1_FB0_LO_ADDR_REG      0x1270
+#define LSDC_CRTC1_FB0_HI_ADDR_REG      0x15B0
+#define LSDC_CRTC1_STRIDE_REG           0x1290
+#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
+#define LSDC_CRTC1_PANEL_CONF_REG       0x13D0
+#define LSDC_CRTC1_HDISPLAY_REG         0x1410
+#define LSDC_CRTC1_HSYNC_REG            0x1430
+#define LSDC_CRTC1_VDISPLAY_REG         0x1490
+#define LSDC_CRTC1_VSYNC_REG            0x14B0
+#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
+#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
+#define LSDC_CRTC1_FB1_LO_ADDR_REG      0x1590
+#define LSDC_CRTC1_FB1_HI_ADDR_REG      0x15D0
+
+/*
+ * All of the DC variants has the hardware which record the scan position
+ * of the CRTC, [31:16] : current X position, [15:0] : current Y position
+ */
+#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
+#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
+
+/*
+ * LS7A2000 has Sync Deviation register.
+ */
+#define SYNC_DEVIATION_EN               BIT(31)
+#define SYNC_DEVIATION_NUM              GENMASK(12, 0)
+#define LSDC_CRTC0_SYNC_DEVIATION_REG   0x1B80
+#define LSDC_CRTC1_SYNC_DEVIATION_REG   0x1B90
+
+/*
+ * In gross, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG = 0x10, but not all of
+ * the registers obey this rule, LSDC_CURSORx_XXX_REG just don't honor this.
+ * This is the root cause we can't untangle the code by manpulating offset
+ * of the register access simply. Our hardware engineers are lack experiance
+ * when they design this...
+ */
+#define CRTC_PIPE_OFFSET                0x10
+
+/*
+ * There is only one hardware cursor unit in LS7A1000 and LS2K1000, let
+ * CFG_HW_CLONE_EN bit be "1" could eliminate this embarrassment, we made
+ * it on custom clone mode application. While LS7A2000 has two hardware
+ * cursor unit which is good enough.
+ */
+#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
+enum lsdc_cursor_format {
+	CURSOR_FORMAT_DISABLE = 0,
+	CURSOR_FORMAT_MONOCHROME = 1,
+	CURSOR_FORMAT_ARGB8888 = 2,
+};
+
+/*
+ * LS7A1000 and LS2K1000 only support 32x32, LS2K2000 and LS7A2000 support
+ * 64x64, but it seems that setting this bit make no harms on LS7A1000, it
+ * just don't take effects.
+ */
+#define CURSOR_SIZE_64X64               BIT(2)  /* 1: 64x64, 0: 32x32 */
+#define CURSOR_LOCATION                 BIT(4)  /* 1: on CRTC1, 0: on CRTC0 */
+
+#define LSDC_CURSOR0_CFG_REG            0x1520
+#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
+#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
+#define LSDC_CURSOR0_POSITION_REG       0x1540  /* [31:16] Y, [15:0] X */
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
+ * FBRF0: CRTC-0 reading from its framebuffer finished.
+ * FBRF1: CRTC-1 reading from its framebuffer finished.
+ *
+ * +-------+--------------------------+-------+--------+--------+-------+
+ * | 31:27 |         26:16            | 15:11 |   10   |   9    |   8   |
+ * +-------+--------------------------+-------+--------+--------+-------+
+ * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0 | IDBFU1 | IDBU0 |
+ * +-------+--------------------------+-------+--------+--------+-------+
+ *
+ * +-------+-------+-------+------+--------+--------+--------+--------+
+ * |   7   |   6   |   5   |  4   |   3    |   2    |   1    |   0    |
+ * +-------+-------+-------+------+--------+--------+--------+--------+
+ * | IDBU1 | FBRF0 | FBRF1 | CRRF | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
+ * +-------+-------+-------+------+--------+--------+--------+--------+
+ *
+ * unfortunately, CRTC0's interrupt is mess with CRTC1's interrupt in one
+ * register again.
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
+/* HDMI Iterface Control Reg */
+#define HDMI_INTERFACE_EN               BIT(0)
+#define HDMI_PACKET_EN                  BIT(1)
+#define HDMI_AUDIO_EN                   BIT(2)
+/*
+ * Preamble:
+ * Immediately preceding each video data period or data island period is the
+ * preamble. This is a sequence of eight identical control characters that
+ * indicate whether the upcoming data period is a video data period or is a
+ * data island. The values of CTL0, CTL1, CTL2, and CTL3 indicate the type of
+ * data period that follows.
+ */
+#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
+#define HDMI_VIDEO_PREAMBLE_SHIFT       4
+/* 1: hw i2c, 0: gpio emu i2c, shouldn't put in LSDC_HDMIx_INTF_CTRL_REG */
+#define HW_I2C_EN                       BIT(8)
+#define HDMI_CTL_PERIOD_MODE            BIT(9)
+#define LSDC_HDMI0_INTF_CTRL_REG        0x1720
+#define LSDC_HDMI1_INTF_CTRL_REG        0x1730
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
+/* High level duration need > 1us */
+#define HDMI_PLL_ENABLE                 BIT(0)
+#define HDMI_PLL_LOCKED                 BIT(16)
+/* Bypass the software configured values, using default source from somewhere */
+#define HDMI_PLL_BYPASS                 BIT(17)
+
+#define HDMI_PLL_IDF_SHIFT              1
+#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
+#define HDMI_PLL_LF_SHIFT               6
+#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
+#define HDMI_PLL_ODF_SHIFT              13
+#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
+#define LSDC_HDMI0_PHY_PLL_REG          0x1820
+#define LSDC_HDMI1_PHY_PLL_REG          0x1830
+
+/* LS7A2000/LS2K2000 has hpd status reg, while the two hdmi's status
+ * located at the one register again.
+ */
+#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
+#define HDMI0_HPD_FLAG                  BIT(0)
+#define HDMI1_HPD_FLAG                  BIT(1)
+
+#define LSDC_HDMI0_PHY_CAL_REG          0x18C0
+#define LSDC_HDMI1_PHY_CAL_REG          0x18D0
+
+/* AVI InfoFrame */
+#define LSDC_HDMI0_AVI_CONTENT0         0x18E0
+#define LSDC_HDMI1_AVI_CONTENT0         0x18D0
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
+/*
+ * 1: write 1 to flush avi reg content0 ~ content3 to the packet to be send,
+ * The hardware will clear this bit automatically.
+ */
+#define AVI_PKT_UPDATE                  BIT(2)
+
+#define LSDC_HDMI0_AVI_INFO_CRTL_REG    0x1960
+#define LSDC_HDMI1_AVI_INFO_CRTL_REG    0x1970
+
+/*
+ * LS7A2000 has the hardware which count the number of vblank generated
+ */
+#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
+#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
+
+/*
+ * LS7A2000 has the audio hardware associate with the HDMI encoder.
+ */
+#define LSDC_HDMI0_AUDIO_PLL_LO_REG     0x1A20
+#define LSDC_HDMI1_AUDIO_PLL_LO_REG     0x1A30
+
+#define LSDC_HDMI0_AUDIO_PLL_HI_REG     0x1A40
+#define LSDC_HDMI1_AUDIO_PLL_HI_REG     0x1A50
+
+#endif
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
new file mode 100644
index 000000000000..d4b1662d423b
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_prime.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_ttm.h"
+
+const char *lsdc_mem_type_to_str(uint32_t mem_type)
+{
+	switch (mem_type) {
+	case TTM_PL_VRAM:
+		return "VRAM";
+	case TTM_PL_TT:
+		return "GTT";
+	case TTM_PL_SYSTEM:
+		return "SYSTEM";
+	default:
+		break;
+	}
+
+	return "Unknown";
+}
+
+static void lsdc_bo_set_placement(struct lsdc_bo *lbo, u32 domain)
+{
+	u32 c = 0;
+	u32 pflags = 0;
+	u32 i;
+
+	if (lbo->tbo.base.size <= PAGE_SIZE)
+		pflags |= TTM_PL_FLAG_TOPDOWN;
+
+	lbo->placement.placement = lbo->placements;
+	lbo->placement.busy_placement = lbo->placements;
+
+	if (domain & LSDC_GEM_DOMAIN_VRAM) {
+		lbo->placements[c].mem_type = TTM_PL_VRAM;
+		lbo->placements[c++].flags = pflags;
+	}
+
+	if (domain & LSDC_GEM_DOMAIN_GTT) {
+		lbo->placements[c].mem_type = TTM_PL_TT;
+		lbo->placements[c++].flags = pflags;
+	}
+
+	if (domain & LSDC_GEM_DOMAIN_SYSTEM) {
+		lbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		lbo->placements[c++].flags = 0;
+	}
+
+	if (!c) {
+		lbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		lbo->placements[c++].flags = 0;
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
+static void lsdc_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
+{
+	ttm_tt_fini(tt);
+	kfree(tt);
+}
+
+static struct ttm_tt *
+lsdc_ttm_tt_create(struct ttm_buffer_object *tbo, uint32_t page_flags)
+{
+	struct ttm_tt *tt;
+	int ret;
+
+	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
+	if (!tt)
+		return NULL;
+
+	ret = ttm_sg_tt_init(tt, tbo, page_flags, ttm_cached);
+	if (ret < 0) {
+		kfree(tt);
+		return NULL;
+	}
+
+	return tt;
+}
+
+static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
+				struct ttm_tt *ttm,
+				struct ttm_operation_ctx *ctx)
+{
+	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
+
+	if (slave && ttm->sg) {
+		drm_prime_sg_to_dma_addr_array(ttm->sg,
+					       ttm->dma_address,
+					       ttm->num_pages);
+
+		return 0;
+	}
+
+	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
+}
+
+static void lsdc_ttm_tt_unpopulate(struct ttm_device *bdev,
+				   struct ttm_tt *ttm)
+{
+	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
+
+	if (slave)
+		return;
+
+	return ttm_pool_free(&bdev->pool, ttm);
+}
+
+static void lsdc_bo_evict_flags(struct ttm_buffer_object *tbo,
+				struct ttm_placement *tplacement)
+{
+	struct ttm_resource *resource = tbo->resource;
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	switch (resource->mem_type) {
+	case TTM_PL_VRAM:
+		lsdc_bo_set_placement(lbo, LSDC_GEM_DOMAIN_GTT);
+		break;
+	case TTM_PL_TT:
+	default:
+		lsdc_bo_set_placement(lbo, LSDC_GEM_DOMAIN_SYSTEM);
+		break;
+	}
+
+	*tplacement = lbo->placement;
+}
+
+static int lsdc_bo_move(struct ttm_buffer_object *tbo,
+			bool evict,
+			struct ttm_operation_ctx *ctx,
+			struct ttm_resource *new_mem,
+			struct ttm_place *hop)
+{
+	struct drm_device *ddev = tbo->base.dev;
+	struct ttm_resource *old_mem = tbo->resource;
+	int ret;
+
+	if (unlikely(tbo->pin_count > 0)) {
+		drm_warn(ddev, "Can't move a pinned BO\n");
+		return -EINVAL;
+	}
+
+	ret = ttm_bo_wait_ctx(tbo, ctx);
+	if (ret)
+		return ret;
+
+	if (!old_mem) {
+		ttm_bo_move_null(tbo, new_mem);
+		drm_dbg(ddev, "bo[%p] move from NULL to %s\n",
+			tbo, lsdc_mem_type_to_str(new_mem->mem_type));
+		return 0;
+	}
+
+	if (old_mem->mem_type == TTM_PL_SYSTEM && !tbo->ttm) {
+		ttm_bo_move_null(tbo, new_mem);
+		drm_dbg(ddev, "bo[%p] move from SYSTEM to NULL\n", tbo);
+		return 0;
+	}
+
+	if (old_mem->mem_type == TTM_PL_SYSTEM &&
+	    new_mem->mem_type == TTM_PL_TT) {
+		ttm_bo_move_null(tbo, new_mem);
+		drm_dbg(ddev, "bo[%p] move from SYSTEM to GTT\n", tbo);
+		return 0;
+	}
+
+	if (old_mem->mem_type == TTM_PL_TT &&
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		ttm_resource_free(tbo, &old_mem);
+		ttm_bo_assign_mem(tbo, new_mem);
+		drm_dbg(ddev, "bo[%p] move from GTT to SYSTEM\n", tbo);
+		return 0;
+	}
+
+	drm_dbg(ddev, "bo[%p] move from %s to %s\n",
+		tbo,
+		lsdc_mem_type_to_str(old_mem->mem_type),
+		lsdc_mem_type_to_str(new_mem->mem_type));
+
+	return ttm_bo_move_memcpy(tbo, ctx, new_mem);
+}
+
+static int lsdc_bo_reserve_io_mem(struct ttm_device *bdev,
+				  struct ttm_resource *mem)
+{
+	struct lsdc_device *ldev = tdev_to_ldev(bdev);
+
+	switch (mem->mem_type) {
+	case TTM_PL_SYSTEM:
+		break;
+	case TTM_PL_TT:
+		break;
+	case TTM_PL_VRAM:
+		mem->bus.offset = (mem->start << PAGE_SHIFT) + ldev->vram_base;
+		mem->bus.is_iomem = true;
+		mem->bus.caching = ttm_write_combined;
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
+	.ttm_tt_populate = lsdc_ttm_tt_populate,
+	.ttm_tt_unpopulate = lsdc_ttm_tt_unpopulate,
+	.ttm_tt_destroy = lsdc_ttm_tt_destroy,
+	.eviction_valuable = ttm_bo_eviction_valuable,
+	.evict_flags = lsdc_bo_evict_flags,
+	.move = lsdc_bo_move,
+	.io_mem_reserve = lsdc_bo_reserve_io_mem,
+};
+
+u64 lsdc_bo_gpu_offset(struct ttm_buffer_object *tbo)
+{
+	struct drm_device *ddev = tbo->base.dev;
+	struct ttm_resource *resource = tbo->resource;
+
+	if (unlikely(!tbo->pin_count)) {
+		drm_err(ddev, "unpinned bo, gpu virtual address is invalid\n");
+		return 0;
+	}
+
+	if (unlikely(resource->mem_type == TTM_PL_SYSTEM))
+		return 0;
+
+	return resource->start << PAGE_SHIFT;
+}
+
+size_t lsdc_bo_size(struct ttm_buffer_object *tbo)
+{
+	return tbo->base.size;
+}
+
+int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr)
+{
+	struct ttm_operation_ctx ctx = { false, false };
+	struct ttm_buffer_object *tbo = &lbo->tbo;
+	struct drm_device *ddev = tbo->base.dev;
+	int ret;
+
+	ret = ttm_bo_reserve(tbo, true, false, NULL);
+	if (unlikely(ret))
+		return ret;
+
+	if (tbo->pin_count)
+		goto bo_pinned;
+
+	if (domain)
+		lsdc_bo_set_placement(lbo, domain);
+
+	ret = ttm_bo_validate(tbo, &lbo->placement, &ctx);
+	if (unlikely(ret)) {
+		ttm_bo_unreserve(tbo);
+		drm_err(ddev, "%p pin failed\n", tbo);
+		return ret;
+	}
+
+bo_pinned:
+	ttm_bo_pin(tbo);
+
+	ttm_bo_unreserve(tbo);
+
+	if (gpu_addr)
+		*gpu_addr = lsdc_bo_gpu_offset(tbo);
+
+	return ret;
+}
+
+void lsdc_bo_unpin(struct lsdc_bo *lbo)
+{
+	struct ttm_buffer_object *tbo = &lbo->tbo;
+	struct drm_device *ddev = tbo->base.dev;
+	int ret;
+
+	if (unlikely(!tbo->pin_count)) {
+		drm_warn(ddev, "%p unpin is not necessary\n", lbo);
+		return;
+	}
+
+	ret = ttm_bo_reserve(tbo, true, false, NULL);
+	if (unlikely(ret)) {
+		drm_err(ddev, "%p unpin failed\n", tbo);
+		return;
+	}
+
+	ttm_bo_unpin(tbo);
+	ttm_bo_unreserve(tbo);
+}
+
+static void lsdc_bo_destroy(struct ttm_buffer_object *tbo)
+{
+	struct lsdc_device *ldev = tdev_to_ldev(tbo->bdev);
+	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
+
+	mutex_lock(&ldev->gem.mutex);
+	list_del_init(&lbo->list);
+	mutex_unlock(&ldev->gem.mutex);
+
+	drm_gem_object_release(&tbo->base);
+
+	kfree(lbo);
+}
+
+struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
+			       u32 domain,
+			       size_t size,
+			       bool kernel,
+			       struct sg_table *sg,
+			       struct dma_resv *resv)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct ttm_device *bdev = &ldev->bdev;
+	struct ttm_buffer_object *tbo;
+	struct lsdc_bo *lbo;
+	enum ttm_bo_type bo_type;
+	int ret;
+
+	lbo = kzalloc(sizeof(*lbo), GFP_KERNEL);
+	if (!lbo)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&lbo->list);
+
+	tbo = &lbo->tbo;
+
+	ret = drm_gem_object_init(ddev, &tbo->base, size);
+	if (ret) {
+		kfree(lbo);
+		return ERR_PTR(ret);
+	}
+
+	tbo->bdev = bdev;
+
+	if (kernel)
+		bo_type = ttm_bo_type_kernel;
+	else if (sg)
+		bo_type = ttm_bo_type_sg;
+	else
+		bo_type = ttm_bo_type_device;
+
+	lsdc_bo_set_placement(lbo, domain);
+
+	ret = ttm_bo_init_validate(bdev,
+				   tbo,
+				   bo_type,
+				   &lbo->placement,
+				   0,
+				   false,
+				   sg,
+				   resv,
+				   lsdc_bo_destroy);
+	if (ret) {
+		kfree(lbo);
+		return ERR_PTR(ret);
+	}
+
+	return lbo;
+}
+
+static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
+{
+	struct lsdc_device *ldev = (struct lsdc_device *)data;
+
+	ttm_range_man_fini(&ldev->bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&ldev->bdev, TTM_PL_TT);
+
+	ttm_device_fini(&ldev->bdev);
+
+	drm_dbg(ddev, "ttm finalized\n");
+}
+
+int lsdc_ttm_init(struct lsdc_device *ldev)
+{
+	struct drm_device *ddev = &ldev->base;
+	unsigned long num_vram_pages;
+	unsigned long num_gtt_pages;
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
+	num_vram_pages = ldev->vram_size >> PAGE_SHIFT;
+
+	ret = ttm_range_man_init(&ldev->bdev,
+				 TTM_PL_VRAM,
+				 false,
+				 num_vram_pages);
+	if (unlikely(ret))
+		return ret;
+
+	drm_info(ddev, "%u VRAM pages ready\n", (unsigned int)num_vram_pages);
+
+	/* 256M is far enough for us now */
+	ldev->gtt_size = 256 << 20;
+
+	num_gtt_pages = ldev->gtt_size >> PAGE_SHIFT;
+
+	ret = ttm_range_man_init(&ldev->bdev,
+				 TTM_PL_TT,
+				 true,
+				 num_gtt_pages);
+	if (unlikely(ret))
+		return ret;
+
+	drm_info(ddev, "%u GTT pages ready\n", (unsigned int)num_gtt_pages);
+
+	return drmm_add_action_or_reset(ddev, lsdc_ttm_fini, ldev);
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.h b/drivers/gpu/drm/loongson/lsdc_ttm.h
new file mode 100644
index 000000000000..54c9b0c1759d
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LSDC_TTM_H__
+#define __LSDC_TTM_H__
+
+#include <linux/container_of.h>
+#include <linux/iosys-map.h>
+#include <linux/list.h>
+
+#include <drm/drm_gem.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
+
+#define LSDC_GEM_DOMAIN_SYSTEM          0x1
+#define LSDC_GEM_DOMAIN_GTT             0x2
+#define LSDC_GEM_DOMAIN_VRAM            0x4
+
+struct lsdc_bo {
+	struct ttm_buffer_object tbo;
+
+	/* Protected by gem.mutex */
+	struct list_head list;
+
+	struct iosys_map map;
+
+	unsigned int vmap_count;
+	/* cross device driver sharing reference count */
+	unsigned int sharing_count;
+
+	struct ttm_placement placement;
+	struct ttm_place placements[4];
+};
+
+static inline struct ttm_buffer_object *to_ttm_bo(struct drm_gem_object *gem)
+{
+	return container_of(gem, struct ttm_buffer_object, base);
+}
+
+static inline struct lsdc_bo *to_lsdc_bo(struct ttm_buffer_object *tbo)
+{
+	return container_of(tbo, struct lsdc_bo, tbo);
+}
+
+static inline struct lsdc_bo *gem_to_lsdc_bo(struct drm_gem_object *obj)
+{
+	return container_of(obj, struct lsdc_bo, tbo.base);
+}
+
+const char *lsdc_mem_type_to_str(uint32_t mem_type);
+
+struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
+			       u32 domain,
+			       size_t size,
+			       bool kernel,
+			       struct sg_table *sg,
+			       struct dma_resv *resv);
+
+int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr);
+void lsdc_bo_unpin(struct lsdc_bo *lbo);
+
+u64 lsdc_bo_gpu_offset(struct ttm_buffer_object *tbo);
+size_t lsdc_bo_size(struct ttm_buffer_object *tbo);
+
+int lsdc_ttm_init(struct lsdc_device *ldev);
+
+#endif
-- 
2.25.1

