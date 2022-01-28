Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38849F7BA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 11:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94F410F00A;
	Fri, 28 Jan 2022 10:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953FC10F00A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 10:59:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOyC-0006q5-Lu; Fri, 28 Jan 2022 11:59:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOyA-00CxGs-6h; Fri, 28 Jan 2022 11:59:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDOy8-001vPv-NL; Fri, 28 Jan 2022 11:59:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Date: Fri, 28 Jan 2022 11:58:49 +0100
Message-Id: <20220128105849.368438-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=22490;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=68F8YE1H89sNovamSKJdUhBglBIYByhtEyQgstqIeRA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBh88xifvszg2evwXEL6/GTOvchWOsYOqeIY/rykwx3
 IH8LOaeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYfPMYgAKCRDB/BR4rcrsCQPZB/
 4jIeF/BsDDn61GQ79R37zjw6mi8AwMmdAi3lBzJwdRjUBQMe5bX0UVDI6GuYOUMv75ckV50O7zSd9o
 1NEtNJl3Tx4qFYCd2MvboOj4trbdHXJ1kjJdO3oyr5pSv48INnEz+6+oDPkc8PGZoEw63PjUaXiJsM
 ABCaNlJhhN3EXqKy2Rh7q2ds195Dv4BFVsjR0MosnpB5wv+tAN3tqaqz4ZxnTj5d3LcWwCKMnpa2S6
 7z8izeIkCVE6ysmnzqNR/gm7ruTOG/drZa7TGG/JqHDMqTqlP5l4qgsZ8Dyiva90sAtbgaRkXRLKYJ
 XIp5iPtNW6eW8NBcQ1OeQcMnmBZtVR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marian Cichy <m.cichy@pengutronix.de>

Add support for the LCD Controller found on i.MX21, i.MX25 and i.MX27

Note there is already a fb driver for this hardware in the tree that is
supposed to be superseded by this one.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/Kconfig                 |   9 +
 drivers/gpu/drm/imx/Makefile                |   2 +
 drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c | 631 ++++++++++++++++++++
 3 files changed, 642 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index bb9738c7c825..62b24ea1bbe0 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -42,3 +42,12 @@ config DRM_IMX_HDMI
 	  Choose this if you want to use HDMI on i.MX6.
 
 source "drivers/gpu/drm/imx/dcss/Kconfig"
+
+config DRM_IMX21_LCDC
+	tristate "Freescale i.MX LCDC displays"
+	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_HELPER
+	help
+	  This driver is for the Liquid Crystal Display Controller (LCDC) found
+	  on Freescale i.MX21, i.MX25 and i.MX27.
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index b644deffe948..25685230f4f7 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_DRM_IMX_LDB) += imx-ldb.o
 
 obj-$(CONFIG_DRM_IMX_HDMI) += dw_hdmi-imx.o
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
+
+obj-$(CONFIG_DRM_IMX21_LCDC) += imx21-lcdc/
diff --git a/drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c b/drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c
new file mode 100644
index 000000000000..37e75f728293
--- /dev/null
+++ b/drivers/gpu/drm/imx/imx21-lcdc/imx21-lcdc.c
@@ -0,0 +1,631 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: 2020 Marian Cichy <kernel@pengutronix.de>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+/* LCDC Screen Start Address Register */
+#define IMX21LCDC_LSSAR		0x0000
+
+/* LCDC Size Register */
+#define IMX21LCDC_LSR		0x0004
+#define   IMX21LCDC_LSR_XMAX		GENMASK(25, 20) /* Screen width (in pixels) divided by 16. */
+#define   IMX21LCDC_LSR_YMAX		GENMASK(9, 0)
+
+/* LCDC Virtual Page Width Register */
+#define IMX21LCDC_LVPWR		0x0008
+
+/* LCDC Cursor Position Register */
+#define IMX21LCDC_LCPR		0x000c
+#define   IMX21LCDC_LCPR_CC		GENMASK(31, 30) /* Cursor Control */
+
+/* LCDC Cursor Width Height and Blink Register*/
+#define IMX21LCDC_LCWHB		0x0010
+
+/* LCDC Color Cursor Mapping Register */
+#define IMX21LCDC_LCCMR		0x0014
+
+/* LCDC Panel Configuration Register */
+#define IMX21LCDC_LPCR		0x0018
+#define   IMX21LCDC_LPCR_PCD		GENMASK(5, 0)
+#define   IMX21LCDC_LPCR_SHARP		BIT(6)
+#define   IMX21LCDC_LPCR_SCLKSEL	BIT(7)
+#define   IMX21LCDC_LPCR_ACD		GENMASK(14, 8)
+#define   IMX21LCDC_LPCR_ACDSEL		BIT(15)
+#define   IMX21LCDC_LPCR_REV_VS		BIT(16)
+#define   IMX21LCDC_LPCR_SWAP_SEL	BIT(17)
+#define   IMX21LCDC_LPCR_END_SEL	BIT(18)
+#define   IMX21LCDC_LPCR_SCLKIDLE	BIT(19)
+#define   IMX21LCDC_LPCR_OEPOL		BIT(20)
+#define   IMX21LCDC_LPCR_CLKPOL		BIT(21)
+#define   IMX21LCDC_LPCR_LPPOL		BIT(22)
+#define   IMX21LCDC_LPCR_FLMPOL		BIT(23)
+#define   IMX21LCDC_LPCR_PIXPOL		BIT(24)
+#define   IMX21LCDC_LPCR_BPIX		GENMASK(27, 25)
+#define   IMX21LCDC_LPCR_PBSIZ		GENMASK(29, 28)
+#define   IMX21LCDC_LPCR_COLOR		BIT(30)
+#define   IMX21LCDC_LPCR_TFT		BIT(31)
+
+/* LCDC Horizontal Configuration Register */
+#define IMX21LCDC_LHCR		0x001c
+#define   IMX21LCDC_LHCR_H_WIDTH	GENMASK(31, 26)
+#define   IMX21LCDC_LHCR_H_BPORCH	GENMASK(7, 0)
+#define   IMX21LCDC_LHCR_H_FPORCH	GENMASK(15, 8)
+
+/* LCDC Vertical Configuration Register */
+#define IMX21LCDC_LVCR		0x0020
+#define   IMX21LCDC_LVCR_V_WIDTH	GENMASK(31, 26)
+#define   IMX21LCDC_LVCR_V_BPORCH	GENMASK(7, 0)
+#define   IMX21LCDC_LVCR_V_FPORCH	GENMASK(15, 8)
+
+/* LCDC Panning Offset Register */
+#define IMX21LCDC_LPOR		0x0024
+
+/* LCDC Sharp Configuration Register */
+#define IMX21LCDC_LSCR		0x0028
+
+/* LCDC PWM Contrast Control Register */
+#define IMX21LCDC_LPCCR		0x002c
+
+/* LCDC DMA Control Register */
+#define IMX21LCDC_LDCR		0x0030
+
+/* LCDC Refresh Mode Control Register */
+#define IMX21LCDC_LRMCR		0x0034
+
+/* LCDC Interrupt Configuration Register */
+#define IMX21LCDC_LICR		0x0038
+
+/* LCDC Interrupt Enable Register */
+#define IMX21LCDC_LIER		0x003c
+#define   IMX21LCDC_LIER_EOF		BIT(1)
+
+/* LCDC Interrupt Status Register */
+#define IMX21LCDC_LISR		0x0040
+#define   IMX21LCDC_LISR_EOF		BIT(1)
+
+/* LCDC Graphic Window Start Address Register */
+#define IMX21LCDC_LGWSAR	0x0050
+
+/* LCDC Graph Window Size Register */
+#define IMX21LCDC_LGWSR		0x0054
+
+/* LCDC Graphic Window Virtual Page Width Register */
+#define IMX21LCDC_LGWVPWR	0x0058
+
+/* LCDC Graphic Window Panning Offset Register */
+#define IMX21LCDC_LGWPOR	0x005c
+
+/* LCDC Graphic Window Position Register */
+#define IMX21LCDC_LGWPR		0x0060
+
+/* LCDC Graphic Window Control Register */
+#define IMX21LCDC_LGWCR		0x0064
+
+/* LCDC Graphic Window DMA Control Register */
+#define IMX21LCDC_LGWDCR	0x0068
+
+/* LCDC AUS Mode Control Register */
+#define IMX21LCDC_LAUSCR	0x0080
+
+/* LCDC AUS Mode Cursor Control Register */
+#define IMX21LCDC_LAUSCCR	0x0084
+
+/* Background Lookup Table */
+#define IMX21LCDC_BGLUT		0x0800
+
+/* Graphic Window Lookup Table */
+#define IMX21LCDC_GWLUT		0x0c00
+
+#define BPP_RGB565 0x05
+
+#define LCDC_MIN_XRES 64
+#define LCDC_MIN_YRES 64
+
+#define LCDC_MAX_XRES 1024
+#define LCDC_MAX_YRES 1024
+
+struct imx_lcdc {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	const struct drm_display_mode *mode;
+	struct drm_connector connector;
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+	void __iomem *base;
+
+	struct clk *clk_ipg;
+	struct clk *clk_ahb;
+	struct clk *clk_per;
+};
+
+static const u32 imx_lcdc_formats[] = {
+	DRM_FORMAT_RGB565,
+};
+
+static inline struct imx_lcdc *drm_to_lcdc(struct drm_device *drm)
+{
+	return container_of(drm, struct imx_lcdc, drm);
+}
+
+static unsigned int imx_lcdc_get_format(unsigned int drm_format)
+{
+	unsigned int bpp;
+
+	switch (drm_format) {
+	default:
+		DRM_WARN("Format not supported - fallback to RGB565\n");
+		fallthrough;
+	case DRM_FORMAT_RGB565:
+		bpp = BPP_RGB565;
+		break;
+	}
+
+	return bpp;
+}
+
+static int imx_lcdc_connector_get_modes(struct drm_connector *connector)
+{
+	struct imx_lcdc *lcdc = drm_to_lcdc(connector->dev);
+
+	if (lcdc->panel)
+		return drm_panel_get_modes(lcdc->panel, connector);
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs imx_lcdc_connector_hfuncs = {
+	.get_modes = imx_lcdc_connector_get_modes,
+};
+
+static const struct drm_connector_funcs imx_lcdc_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
+					 struct drm_plane_state *old_state,
+					 bool mode_set)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
+	unsigned int bpp = imx_lcdc_get_format(fb->format->format);
+	unsigned int lvcr; /* LVCR-Register value */
+	unsigned int lhcr; /* LHCR-Register value */
+	unsigned int framesize;
+	dma_addr_t addr = drm_fb_cma_get_gem_addr(fb, new_state, 0);
+
+	/* The LSSAR register specifies the LCD screen start address (SSA). */
+	writel(addr, lcdc->base + IMX21LCDC_LSSAR);
+
+	if (!mode_set)
+		return;
+
+	/* Disable PER clock to make register write possible */
+	if (old_state && old_state->crtc && old_state->crtc->enabled)
+		clk_disable_unprepare(lcdc->clk_per);
+
+	/* Framesize */
+	framesize = FIELD_PREP(IMX21LCDC_LSR_XMAX, crtc->mode.hdisplay / 16);
+	framesize |= FIELD_PREP(IMX21LCDC_LSR_YMAX, crtc->mode.vdisplay);
+	writel(framesize, lcdc->base + IMX21LCDC_LSR);
+
+	/* HSYNC */
+	lhcr = FIELD_PREP(IMX21LCDC_LHCR_H_FPORCH, crtc->mode.hsync_start - crtc->mode.hdisplay - 1);
+	lhcr |= FIELD_PREP(IMX21LCDC_LHCR_H_WIDTH, crtc->mode.hsync_end - crtc->mode.hsync_start - 1);
+	lhcr |= FIELD_PREP(IMX21LCDC_LHCR_H_BPORCH, crtc->mode.htotal - crtc->mode.hsync_end - 3);
+	writel(lhcr, lcdc->base + IMX21LCDC_LHCR);
+
+	/* VSYNC */
+	lvcr = FIELD_PREP(IMX21LCDC_LVCR_V_FPORCH, crtc->mode.vsync_start - crtc->mode.vdisplay);
+	lvcr |= FIELD_PREP(IMX21LCDC_LVCR_V_WIDTH, crtc->mode.vsync_end - crtc->mode.vsync_start);
+	lvcr |= FIELD_PREP(IMX21LCDC_LVCR_V_BPORCH, crtc->mode.vtotal - crtc->mode.vsync_end);
+	writel(lvcr, lcdc->base + IMX21LCDC_LVCR);
+
+	writel(readl(lcdc->base + IMX21LCDC_LPCR) | FIELD_PREP(IMX21LCDC_LPCR_BPIX, bpp),
+	       lcdc->base + IMX21LCDC_LPCR);
+
+	/* Virtual Page Width */
+	writel(new_state->fb->pitches[0] / 4, lcdc->base + IMX21LCDC_LVPWR);
+
+	/* Enable PER clock */
+	if (new_state->crtc->enabled)
+		clk_prepare_enable(lcdc->clk_per);
+}
+
+static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_plane_state *plane_state)
+{
+	int ret;
+	int clk_div;
+	int bpp;
+	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
+	struct drm_display_mode *mode = &pipe->crtc.mode;
+	struct drm_display_info *disp_info = &pipe->connector->display_info;
+	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
+	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
+	const int data_enable_pol =
+		(disp_info->bus_flags & DRM_BUS_FLAG_DE_HIGH) ? 0 : 1;
+	const int clk_pol =
+		(disp_info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE) ? 0 : 1;
+
+	drm_panel_prepare(lcdc->panel);
+
+	clk_div = DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
+					mode->clock * 1000);
+	bpp = imx_lcdc_get_format(plane_state->fb->format->format);
+
+	writel(FIELD_PREP(IMX21LCDC_LPCR_PCD, clk_div - 1) |
+	       FIELD_PREP(IMX21LCDC_LPCR_LPPOL, hsync_pol) |
+	       FIELD_PREP(IMX21LCDC_LPCR_FLMPOL, vsync_pol) |
+	       FIELD_PREP(IMX21LCDC_LPCR_OEPOL, data_enable_pol) |
+	       FIELD_PREP(IMX21LCDC_LPCR_TFT, 1) |
+	       FIELD_PREP(IMX21LCDC_LPCR_COLOR, 1) |
+	       FIELD_PREP(IMX21LCDC_LPCR_PBSIZ, 3) |
+	       FIELD_PREP(IMX21LCDC_LPCR_BPIX, bpp) |
+	       FIELD_PREP(IMX21LCDC_LPCR_SCLKSEL, 1) |
+	       FIELD_PREP(IMX21LCDC_LPCR_PIXPOL, 0) |
+	       FIELD_PREP(IMX21LCDC_LPCR_CLKPOL, clk_pol),
+	       lcdc->base + IMX21LCDC_LPCR);
+
+	/* 0px panning offset */
+	writel(0x0, lcdc->base + IMX21LCDC_LPOR);
+
+	/* disable hardware cursor */
+	writel(readl(lcdc->base + IMX21LCDC_LCPR) & ~IMX21LCDC_LCPR_CC,
+	       lcdc->base + IMX21LCDC_LCPR);
+
+	ret = clk_prepare_enable(lcdc->clk_ipg);
+	if (ret) {
+		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		return;
+	}
+	ret = clk_prepare_enable(lcdc->clk_ahb);
+	if (ret) {
+		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		clk_disable_unprepare(lcdc->clk_ipg);
+		return;
+	}
+
+	imx_lcdc_update_hw_registers(pipe, NULL, true);
+	drm_panel_enable(lcdc->panel);
+
+	/* Enable VBLANK Interrupt */
+	writel(IMX21LCDC_LIER_EOF, lcdc->base + IMX21LCDC_LIER);
+}
+
+static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
+	struct drm_panel *panel = lcdc->panel;
+	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_pending_vblank_event *event;
+
+	drm_panel_disable(panel);
+
+	clk_disable_unprepare(lcdc->clk_ahb);
+	clk_disable_unprepare(lcdc->clk_ipg);
+
+	if (pipe->crtc.enabled)
+		clk_disable_unprepare(lcdc->clk_per);
+
+	drm_panel_unprepare(panel);
+
+	spin_lock_irq(&lcdc->drm.event_lock);
+	event = crtc->state->event;
+	if (event) {
+		crtc->state->event = NULL;
+		drm_crtc_send_vblank_event(crtc, event);
+	}
+	spin_unlock_irq(&lcdc->drm.event_lock);
+
+	/* Disable VBLANK Interrupt */
+	writel(0, lcdc->base + IMX21LCDC_LIER);
+}
+
+static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
+			       struct drm_plane_state *plane_state,
+			       struct drm_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->mode;
+
+	if ((mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES) ||
+	    (mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES) ||
+	    (mode->hdisplay % 16)) {
+		DRM_ERROR("unsupported display mode (%u x %u)\n",
+			  mode->hdisplay, mode->vdisplay);
+		return -EINVAL;
+	}
+
+	if (!FIELD_FIT(IMX21LCDC_LHCR_H_FPORCH, mode->hsync_start - mode->hdisplay - 1) ||
+	    !FIELD_FIT(IMX21LCDC_LHCR_H_WIDTH, mode->hsync_end - mode->hsync_start - 1) ||
+	    !FIELD_FIT(IMX21LCDC_LHCR_H_BPORCH, mode->htotal - mode->hsync_end - 3)) {
+		DRM_ERROR("invalid HSYNC setting (htotal = %hu, hsync_start = %hu, hsync_end = %hu, hdisplay = %hu)\n",
+			  mode->htotal, mode->hsync_start, mode->hsync_end, mode->hdisplay);
+		return -EINVAL;
+	}
+	if (!FIELD_FIT(IMX21LCDC_LVCR_V_FPORCH, mode->vsync_start - mode->vdisplay) ||
+	    !FIELD_FIT(IMX21LCDC_LVCR_V_WIDTH, mode->vsync_end - mode->vsync_start) ||
+	    !FIELD_FIT(IMX21LCDC_LVCR_V_BPORCH, mode->vtotal - mode->vsync_end)) {
+		DRM_ERROR("invalid VSYNC setting (vtotal = %hu, vsync_start = %hu, vsync_end = %hu, vdisplay = %hu)\n",
+			  mode->vtotal, mode->vsync_start, mode->vsync_end, mode->vdisplay);
+		return -EINVAL;
+
+	}
+
+	if (plane_state->fb->pitches[0] % 4) {
+		DRM_ERROR("invalid pitches setting (%hu)\n", plane_state->fb->pitches[0]);
+		return -EINVAL;
+	}
+
+	crtc_state->mode_changed =
+		crtc_state->mode.hdisplay != pipe->crtc.state->mode.hdisplay ||
+		crtc_state->mode.vdisplay != pipe->crtc.state->mode.vdisplay ||
+		plane_state->fb->pitches[0] != pipe->plane.state->fb->pitches[0];
+
+	return 0;
+}
+
+static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
+				 struct drm_plane_state *old_state)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_pending_vblank_event *event = crtc->state->event;
+	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_framebuffer *old_fb = old_state->fb;
+	struct drm_crtc *old_crtc = old_state->crtc;
+	bool mode_changed = false;
+
+	if (old_fb && old_fb->format != fb->format)
+		mode_changed = true;
+	else if (old_crtc != crtc)
+		mode_changed = true;
+	else if (crtc->state->mode_changed)
+		mode_changed = true;
+
+	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+
+		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
+	.enable = imx_lcdc_pipe_enable,
+	.disable = imx_lcdc_pipe_disable,
+	.check = imx_lcdc_pipe_check,
+	.update = imx_lcdc_pipe_update,
+	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const struct drm_mode_config_helper_funcs imx_lcdc_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(imx_lcdc_drm_fops);
+
+static struct drm_driver imx_lcdc_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops = &imx_lcdc_drm_fops,
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.name = "imx-lcdc",
+	.desc = "i.MX LCDC driver",
+	.date = "20200716",
+};
+
+static const struct of_device_id imx_lcdc_of_dev_id[] = {
+	{ .compatible = "fsl,imx21-lcdc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
+
+static irqreturn_t irq_handler(int irq, void *arg)
+{
+	struct imx_lcdc *lcdc = (struct imx_lcdc *)arg;
+	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	unsigned int status;
+
+	status = readl(lcdc->base + IMX21LCDC_LISR);
+
+	if (status & IMX21LCDC_LISR_EOF) {
+		drm_crtc_handle_vblank(crtc);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int imx_lcdc_probe(struct platform_device *pdev)
+{
+	struct imx_lcdc *lcdc;
+	struct drm_device *drm;
+	int irq;
+	int ret;
+	struct device *dev = &pdev->dev;
+
+	lcdc = devm_drm_dev_alloc(&pdev->dev, &imx_lcdc_drm_driver,
+				  struct imx_lcdc, drm);
+	if (!lcdc)
+		return -ENOMEM;
+
+	drm = &lcdc->drm;
+
+	lcdc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(lcdc->base))
+		return PTR_ERR(lcdc->base);
+
+	/* Panel */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &lcdc->panel, &lcdc->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to find panel or bridge\n");
+
+	/* Get Clocks */
+	lcdc->clk_ipg = devm_clk_get(dev, "ipg");
+	if (IS_ERR(lcdc->clk_ipg))
+		return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get ipg clk\n");
+
+	lcdc->clk_ahb = devm_clk_get(dev, "ahb");
+	if (IS_ERR(lcdc->clk_ahb))
+		return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get ahb clk\n");
+
+	lcdc->clk_per = devm_clk_get(dev, "per");
+	if (IS_ERR(lcdc->clk_per))
+		return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get ahb clk\n");
+
+	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(drm->dev, ret, "Failed to set DMA Mask.\n");
+
+	/* Modeset init */
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return dev_err_probe(drm->dev, ret, "Failed to initialized mode setting.\n");
+
+	/* CRTC, Plane, Encoder */
+	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe, &imx_lcdc_pipe_funcs, imx_lcdc_formats,
+					   ARRAY_SIZE(imx_lcdc_formats), NULL, &lcdc->connector);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
+
+	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
+
+	if (lcdc->bridge) {
+		ret = drm_simple_display_pipe_attach_bridge(&lcdc->pipe,
+							    lcdc->bridge);
+		if (ret)
+			return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
+	}
+
+	/* Connector */
+	drm_connector_helper_add(&lcdc->connector, &imx_lcdc_connector_hfuncs);
+	drm_connector_init(drm, &lcdc->connector, &imx_lcdc_connector_funcs,
+			   DRM_MODE_CONNECTOR_DPI);
+
+	/*
+	 * The LCDC controller does not have an enable bit. The
+	 * controller starts directly when the clocks are enabled.
+	 * If the clocks are enabled when the controller is not yet
+	 * programmed with proper register values (enabled at the
+	 * bootloader, for example) then it just goes into some undefined
+	 * state.
+	 * To avoid this issue, let's enable and disable LCDC IPG,
+	 * PER and AHB clock so that we force some kind of 'reset'
+	 * to the LCDC block.
+	 */
+
+	ret = clk_prepare_enable(lcdc->clk_ipg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable ipg clock\n");
+	clk_disable_unprepare(lcdc->clk_ipg);
+
+	ret = clk_prepare_enable(lcdc->clk_per);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable per clock\n");
+	clk_disable_unprepare(lcdc->clk_per);
+
+	ret = clk_prepare_enable(lcdc->clk_ahb);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable ahb clock\n");
+	clk_disable_unprepare(lcdc->clk_ahb);
+
+	drm->mode_config.min_width = LCDC_MIN_XRES;
+	drm->mode_config.max_width = LCDC_MAX_XRES;
+	drm->mode_config.min_height = LCDC_MIN_YRES;
+	drm->mode_config.max_height = LCDC_MAX_YRES;
+	drm->mode_config.preferred_depth = 16;
+	drm->mode_config.funcs = &imx_lcdc_mode_config_funcs;
+	drm->mode_config.helper_private = &imx_lcdc_mode_config_helpers;
+
+	drm_mode_config_reset(drm);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		return ret;
+	}
+
+	ret = devm_request_irq(dev, irq, irq_handler, 0, "imx-lcdc", lcdc);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Failed to install IRQ handler\n");
+
+	platform_set_drvdata(pdev, drm);
+
+	ret = drm_dev_register(&lcdc->drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register device\n");
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+
+static int imx_lcdc_remove(struct platform_device *pdev)
+{
+	struct imx_lcdc *lcdc = drm_to_lcdc(platform_get_drvdata(pdev));
+
+	drm_dev_unregister(&lcdc->drm);
+	drm_atomic_helper_shutdown(&lcdc->drm);
+
+	return 0;
+}
+
+static void imx_lcdc_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
+static struct platform_driver imx_lcdc_driver = {
+	.driver = {
+		.name = "imx-lcdc",
+		.of_match_table = imx_lcdc_of_dev_id,
+	},
+	.probe = imx_lcdc_probe,
+	.remove = imx_lcdc_remove,
+	.shutdown = imx_lcdc_shutdown,
+};
+module_platform_driver(imx_lcdc_driver);
+
+MODULE_AUTHOR("Marian Cichy <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("Freescale i.MX LCDC driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

