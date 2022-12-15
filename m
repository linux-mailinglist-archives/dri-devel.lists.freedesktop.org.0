Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D164DAF3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 13:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0143010E099;
	Thu, 15 Dec 2022 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Thu, 15 Dec 2022 12:16:39 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C166310E099
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 12:16:39 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1p5mtQ-000452-Md; Thu, 15 Dec 2022 12:59:16 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1p5mtP-0001cb-H9; Thu, 15 Dec 2022 12:59:15 +0100
Date: Thu, 15 Dec 2022 12:59:15 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20221215115915.GA32586@pengutronix.de>
References: <20221214115921.1845994-1-u.kleine-koenig@pengutronix.de>
 <20221214115921.1845994-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214115921.1845994-3-u.kleine-koenig@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 12:59:21PM +0100, Uwe Kleine-König wrote:
> From: Marian Cichy <m.cichy@pengutronix.de>
> 
> Add support for the LCD Controller found on i.MX21 and i.MX25.
> 
> It targets to be a drop in replacement for the imx-fb driver.
> 
> Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> [ukl: Rebase to v6.1, various smaller fixes]
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/imx/Kconfig    |   7 +
>  drivers/gpu/drm/imx/Makefile   |   2 +
>  drivers/gpu/drm/imx/imx-lcdc.c | 610 +++++++++++++++++++++++++++++++++

We are in the process of placing imx drivers in subdirectories,
could you move this into drivers/gpu/drm/imx/lcdc/ ?

>  3 files changed, 619 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/imx-lcdc.c
> 
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index fd5b2471fdf0..af5c6cb8c445 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -41,3 +41,10 @@ config DRM_IMX_HDMI
>  	  Choose this if you want to use HDMI on i.MX6.
>  
>  source "drivers/gpu/drm/imx/dcss/Kconfig"
> +
> +config DRM_IMX_LCDC
> +	tristate "Freescale i.MX LCDC displays"
> +	depends on DRM && (ARCH_MXC || COMPILE_TEST)

Select DRM_GEM_DMA_HELPER for DEFINE_DRM_GEM_DMA_FOPS().

> +	select DRM_KMS_CMA_HELPER

Select DRM_KMS_HELPER instead, see commit 09717af7d13d ("drm: Remove
CONFIG_DRM_KMS_CMA_HELPER option").

> +	help
> +	  Found on i.MX1, i.MX21, i.MX25 and i.MX27.
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index b644deffe948..1f96de7f15b4 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_DRM_IMX_LDB) += imx-ldb.o
>  
>  obj-$(CONFIG_DRM_IMX_HDMI) += dw_hdmi-imx.o
>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
> +
> +obj-$(CONFIG_DRM_IMX_LCDC) += imx-lcdc.o
> diff --git a/drivers/gpu/drm/imx/imx-lcdc.c b/drivers/gpu/drm/imx/imx-lcdc.c
> new file mode 100644
> index 000000000000..14d4962cecfd
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/imx-lcdc.c
> @@ -0,0 +1,610 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
> +
> +#include "drm/drm_fourcc.h"

#include <drm/drm_fourcc.h>

and sort alphabetically?

> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#define IMX21LCDC_LSSAR         0x0000 /* LCDC Screen Start Address Register */
> +#define IMX21LCDC_LSR           0x0004 /* LCDC Size Register */
> +#define IMX21LCDC_LVPWR         0x0008 /* LCDC Virtual Page Width Register */
> +#define IMX21LCDC_LCPR          0x000C /* LCDC Cursor Position Register */
> +#define IMX21LCDC_LCWHB         0x0010 /* LCDC Cursor Width Height and Blink Register*/
> +#define IMX21LCDC_LCCMR         0x0014 /* LCDC Color Cursor Mapping Register */
> +#define IMX21LCDC_LPCR          0x0018 /* LCDC Panel Configuration Register */
> +#define IMX21LCDC_LHCR          0x001C /* LCDC Horizontal Configuration Register */
> +#define IMX21LCDC_LVCR          0x0020 /* LCDC Vertical Configuration Register */
> +#define IMX21LCDC_LPOR          0x0024 /* LCDC Panning Offset Register */
> +#define IMX21LCDC_LSCR          0x0028 /* LCDC Sharp Configuration Register */
> +#define IMX21LCDC_LPCCR         0x002C /* LCDC PWM Contrast Control Register */
> +#define IMX21LCDC_LDCR          0x0030 /* LCDC DMA Control Register */
> +#define IMX21LCDC_LRMCR         0x0034 /* LCDC Refresh Mode Control Register */
> +#define IMX21LCDC_LICR          0x0038 /* LCDC Interrupt Configuration Register */
> +#define IMX21LCDC_LIER          0x003C /* LCDC Interrupt Enable Register */
> +#define IMX21LCDC_LISR          0x0040 /* LCDC Interrupt Status Register */
> +#define IMX21LCDC_LGWSAR        0x0050 /* LCDC Graphic Window Start Address Register */
> +#define IMX21LCDC_LGWSR         0x0054 /* LCDC Graph Window Size Register */
> +#define IMX21LCDC_LGWVPWR       0x0058 /* LCDC Graphic Window Virtual Page Width Register */
> +#define IMX21LCDC_LGWPOR        0x005C /* LCDC Graphic Window Panning Offset Register */
> +#define IMX21LCDC_LGWPR         0x0060 /* LCDC Graphic Window Position Register */
> +#define IMX21LCDC_LGWCR         0x0064 /* LCDC Graphic Window Control Register */
> +#define IMX21LCDC_LGWDCR        0x0068 /* LCDC Graphic Window DMA Control Register */
> +#define IMX21LCDC_LAUSCR        0x0080 /* LCDC AUS Mode Control Register */
> +#define IMX21LCDC_LAUSCCR       0x0084 /* LCDC AUS Mode Cursor Control Register */
> +#define IMX21LCDC_BGLUT         0x0800 /* Background Lookup Table */
> +#define IMX21LCDC_GWLUT         0x0C00 /* Graphic Window Lookup Table */
> +
> +#define IMX21LCDC_LCPR_CC0 BIT(30) /* Cursor Control Bit 0 */
> +#define IMX21LCDC_LCPR_CC1 BIT(31) /* Cursor Control Bit 1 */
> +
> +/* Values HSYNC, VSYNC and Framesize Register */
> +#define IMX21LCDC_LHCR_H_WIDTH(val)	(FIELD_PREP(GENMASK(31, 26), (val)))
> +#define IMX21LCDC_LHCR_H_BPORCH(val)	(FIELD_PREP(GENMASK(7, 0), (val)))
> +#define IMX21LCDC_LHCR_H_FPORCH(val)	(FIELD_PREP(GENMASK(15, 8), (val)))
> +
> +#define IMX21LCDC_LVCR_V_WIDTH(val)	(FIELD_PREP(GENMASK(31, 26), (val)))
> +#define IMX21LCDC_LVCR_V_BPORCH(val)	(FIELD_PREP(GENMASK(7, 0), (val)))
> +#define IMX21LCDC_LVCR_V_FPORCH(val)	(FIELD_PREP(GENMASK(15, 8), (val)))
> +
> +#define IMX21LCDC_FRAME_WIDTH(val)	(((val) / 16) << 20)
> +#define IMX21LCDC_FRAME_HEIGHT(val)	(val)
> +
> +/* Values for LPCR Register */
> +#define IMX21LCDC_PCD(val)		(FIELD_PREP(GENMASK(5, 0), --(val)))
> +#define IMX21LCDC_SHARP(val)		(FIELD_PREP(GENMASK(6, 6), (val)))
> +#define IMX21LCDC_SCLKSEL(val)		(FIELD_PREP(GENMASK(7, 7), (val)))
> +#define IMX21LCDC_ACD(val)		(FIELD_PREP(GENMASK(14, 8), (val)))
> +#define IMX21LCDC_ACDSEL(val)		(FIELD_PREP(GENMASK(15, 15), (val)))
> +#define IMX21LCDC_REV_VS(val)		(FIELD_PREP(GENMASK(16, 16), (val)))
> +#define IMX21LCDC_SWAP_SEL(val)	(FIELD_PREP(GENMASK(17, 17), (val)))
> +#define IMX21LCDC_END_SEL(val)		(FIELD_PREP(GENMASK(18, 18), (val)))
> +#define IMX21LCDC_SCLKIDLE(val)	(FIELD_PREP(GENMASK(19, 19), (val)))
> +#define IMX21LCDC_OEPOL(val)		(FIELD_PREP(GENMASK(20, 20), (val)))
> +#define IMX21LCDC_CLKPOL(val)		(FIELD_PREP(GENMASK(21, 21), (val)))
> +#define IMX21LCDC_LPPOL(val)		(FIELD_PREP(GENMASK(22, 22), (val)))
> +#define IMX21LCDC_FLMPOL(val)		(FIELD_PREP(GENMASK(23, 23), (val)))
> +#define IMX21LCDC_PIXPOL(val)		(FIELD_PREP(GENMASK(24, 24), (val)))
> +#define IMX21LCDC_BPIX(val)		(FIELD_PREP(GENMASK(27, 25), (val)))
> +#define IMX21LCDC_PBSIZ(val)		(FIELD_PREP(GENMASK(29, 28), (val)))
> +#define IMX21LCDC_COLOR(val)		(FIELD_PREP(GENMASK(30, 30), (val)))
> +#define IMX21LCDC_TFT(val)		(FIELD_PREP(GENMASK(31, 31), (val)))
> +
> +#define INTR_EOF BIT(1) /* VBLANK Interrupt Bit */
> +
> +#define BPP_RGB565 0x05
> +
> +#define LCDC_MIN_XRES 64
> +#define LCDC_MIN_YRES 64
> +
> +#define LCDC_MAX_XRES 1024
> +#define LCDC_MAX_YRES 1024
> +
> +struct imx_lcdc {
> +	struct drm_device drm;
> +	struct drm_simple_display_pipe pipe;
> +	const struct drm_display_mode *mode;
> +	struct drm_connector connector;
> +	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
> +	void __iomem *base;
> +
> +	struct clk *clk_ipg;
> +	struct clk *clk_ahb;
> +	struct clk *clk_per;
> +};
> +
> +static const u32 imx_lcdc_formats[] = {
> +	DRM_FORMAT_RGB565,
> +};
> +
> +static inline struct imx_lcdc *drm_to_lcdc(struct drm_device *drm)
> +{
> +	return container_of(drm, struct imx_lcdc, drm);
> +}
> +
> +static unsigned int imx_lcdc_get_format(unsigned int drm_format)
> +{
> +	unsigned int bpp;
> +
> +	switch (drm_format) {
> +	default:
> +		DRM_WARN("Format not supported - fallback to RGB565\n");
> +		fallthrough;
> +	case DRM_FORMAT_RGB565:
> +		bpp = BPP_RGB565;
> +		break;
> +	}
> +
> +	return bpp;
> +}
> +
> +static int imx_lcdc_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct imx_lcdc *lcdc = drm_to_lcdc(connector->dev);
> +
> +	if (lcdc->panel)
> +		return drm_panel_get_modes(lcdc->panel, connector);
> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_helper_funcs imx_lcdc_connector_hfuncs = {
> +	.get_modes = imx_lcdc_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs imx_lcdc_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
> +					 struct drm_plane_state *old_state,
> +					 bool mode_set)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct drm_plane_state *new_state = pipe->plane.state;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
> +	unsigned int bpp;
> +	unsigned int lvcr; /* LVCR-Register value */
> +	unsigned int lhcr; /* LHCR-Register value */
> +	unsigned int framesize;
> +	dma_addr_t addr;
> +
> +	addr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
> +	/* The LSSAR register specifies the LCD screen start address (SSA). */
> +	writel(addr, lcdc->base + IMX21LCDC_LSSAR);
> +
> +	if (!mode_set)
> +		return;
> +
> +	/* Disable PER clock to make register write possible */
> +	if (old_state && old_state->crtc && old_state->crtc->enabled)
> +		clk_disable_unprepare(lcdc->clk_per);
> +
> +	/* Framesize */
> +	framesize = IMX21LCDC_FRAME_WIDTH(crtc->mode.hdisplay);
> +	framesize |= IMX21LCDC_FRAME_HEIGHT(crtc->mode.vdisplay);
> +	writel(framesize, lcdc->base + IMX21LCDC_LSR);
> +
> +	/* HSYNC */
> +	lhcr = IMX21LCDC_LHCR_H_FPORCH(crtc->mode.hsync_start - crtc->mode.hdisplay - 1);
> +	lhcr |= IMX21LCDC_LHCR_H_WIDTH(crtc->mode.hsync_end - crtc->mode.hsync_start - 1);
> +	lhcr |= IMX21LCDC_LHCR_H_BPORCH(crtc->mode.htotal - crtc->mode.hsync_end - 3);
> +	writel(lhcr, lcdc->base + IMX21LCDC_LHCR);
> +
> +	/* VSYNC */
> +	lvcr = IMX21LCDC_LVCR_V_FPORCH(crtc->mode.vsync_start - crtc->mode.vdisplay);
> +	lvcr |= IMX21LCDC_LVCR_V_WIDTH(crtc->mode.vsync_end - crtc->mode.vsync_start);
> +	lvcr |= IMX21LCDC_LVCR_V_BPORCH(crtc->mode.vtotal - crtc->mode.vsync_end);
> +	writel(lvcr, lcdc->base + IMX21LCDC_LVCR);
> +
> +	bpp = imx_lcdc_get_format(fb->format->format);
> +	writel(readl(lcdc->base + IMX21LCDC_LPCR) | IMX21LCDC_BPIX(bpp),
> +	       lcdc->base + IMX21LCDC_LPCR);
> +
> +	/* Virtual Page Width */
> +	writel(new_state->fb->pitches[0] / 4, lcdc->base + IMX21LCDC_LVPWR);
> +
> +	/* Enable PER clock */
> +	if (new_state->crtc->enabled)
> +		clk_prepare_enable(lcdc->clk_per);
> +}
> +
> +static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_plane_state *plane_state)
> +{
> +	int ret;
> +	int clk_div;
> +	int bpp;
> +	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
> +	struct drm_display_mode *mode = &pipe->crtc.mode;
> +	struct drm_display_info *disp_info = &pipe->connector->display_info;
> +	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
> +	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
> +	const int data_enable_pol =
> +		(disp_info->bus_flags & DRM_BUS_FLAG_DE_HIGH) ? 0 : 1;
> +	const int clk_pol =
> +		(disp_info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE) ? 0 : 1;
> +
> +	drm_panel_prepare(lcdc->panel);

No error handling here ...

> +	clk_div = DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
> +					mode->clock * 1000);
> +	bpp = imx_lcdc_get_format(plane_state->fb->format->format);
> +
> +	writel(IMX21LCDC_PCD(clk_div) | IMX21LCDC_LPPOL(hsync_pol) | IMX21LCDC_FLMPOL(vsync_pol) |
> +	       IMX21LCDC_OEPOL(data_enable_pol) | IMX21LCDC_TFT(1) | IMX21LCDC_COLOR(1) |
> +	       IMX21LCDC_PBSIZ(3) | IMX21LCDC_BPIX(bpp) | IMX21LCDC_SCLKSEL(1) |
> +	       IMX21LCDC_PIXPOL(0) | IMX21LCDC_CLKPOL(clk_pol),
> +	       lcdc->base + IMX21LCDC_LPCR);
> +
> +	/* 0px panning offset */
> +	writel(0x00000000, lcdc->base + IMX21LCDC_LPOR);
> +
> +	/* disable hardware cursor */
> +	writel(readl(lcdc->base + IMX21LCDC_LCPR) & ~(IMX21LCDC_LCPR_CC0 | IMX21LCDC_LCPR_CC1),
> +	       lcdc->base + IMX21LCDC_LCPR);
> +
> +	ret = clk_prepare_enable(lcdc->clk_ipg);
> +	if (ret) {
> +		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
> +		return;

... but here seems inconsistent.

> +	}
> +	ret = clk_prepare_enable(lcdc->clk_ahb);
> +	if (ret) {
> +		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
> +		clk_disable_unprepare(lcdc->clk_ipg);
> +		return;
> +	}
> +
> +	imx_lcdc_update_hw_registers(pipe, NULL, true);
> +	drm_panel_enable(lcdc->panel);
> +
> +	/* Enable VBLANK Interrupt */
> +	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
> +}
> +
> +static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct imx_lcdc *lcdc = drm_to_lcdc(pipe->crtc.dev);
> +	struct drm_panel *panel = lcdc->panel;
> +	struct drm_crtc *crtc = &lcdc->pipe.crtc;
> +	struct drm_pending_vblank_event *event;
> +
> +	drm_panel_disable(panel);
> +
> +	clk_disable_unprepare(lcdc->clk_ahb);
> +	clk_disable_unprepare(lcdc->clk_ipg);
> +
> +	if (pipe->crtc.enabled)
> +		clk_disable_unprepare(lcdc->clk_per);
> +
> +	drm_panel_unprepare(panel);
> +
> +	spin_lock_irq(&lcdc->drm.event_lock);
> +	event = crtc->state->event;
> +	if (event) {
> +		crtc->state->event = NULL;
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&lcdc->drm.event_lock);
> +
> +	/* Disable VBLANK Interrupt */
> +	writel(0, lcdc->base + IMX21LCDC_LIER);
> +}
> +
> +static int imx_lcdc_check_mode_change(struct drm_display_mode *new_mode,
> +				      struct drm_display_mode *old_mode)
> +{
> +	if (old_mode->hdisplay != new_mode->hdisplay ||
> +	    old_mode->vdisplay != new_mode->vdisplay)
> +		return true;
> +	return false;

Could just

        return (old_mode->hdisplay != new_mode->hdisplay ||
                old_mode->vdisplay != new_mode->vdisplay);

or fold this into the single use below.

> +
> +static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
> +			       struct drm_plane_state *plane_state,
> +			       struct drm_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->mode;
> +
> +	if ((mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES) ||
> +	    (mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES) ||
> +	    (mode->hdisplay & 0x10)) { /* must be multiple of 16 */

More parantheses than needed.

> +		DRM_ERROR("unsupported display mode (%u x %u)\n",
> +			  mode->hdisplay, mode->vdisplay);

Could use drm_err() instead.

> +		return -EINVAL;
> +	}
> +
> +	crtc_state->mode_changed = imx_lcdc_check_mode_change(&crtc_state->mode,
> +							      &pipe->crtc.state->mode);
> +
> +	return 0;
> +}
> +
> +static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
> +				 struct drm_plane_state *old_state)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct drm_pending_vblank_event *event = crtc->state->event;
> +	struct drm_plane_state *new_state = pipe->plane.state;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct drm_framebuffer *old_fb = old_state->fb;
> +	struct drm_crtc *old_crtc = old_state->crtc;
> +	bool mode_changed = false;
> +
> +	if (old_fb && old_fb->format != fb->format)
> +		mode_changed = true;
> +	else if (old_crtc != crtc)
> +		mode_changed = true;
> +
> +	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
> +
> +	if (event) {
> +		crtc->state->event = NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +
> +		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
> +	.enable = imx_lcdc_pipe_enable,
> +	.disable = imx_lcdc_pipe_disable,
> +	.check = imx_lcdc_pipe_check,
> +	.update = imx_lcdc_pipe_update,
> +	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs imx_lcdc_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static void imx_lcdc_release(struct drm_device *drm)
> +{
> +	struct imx_lcdc *lcdc = drm_to_lcdc(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	kfree(lcdc);
> +}
> +
> +DEFINE_DRM_GEM_DMA_FOPS(imx_lcdc_drm_fops);
> +
> +static struct drm_driver imx_lcdc_drm_driver = {
> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops = &imx_lcdc_drm_fops,
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP,
> +	.release = imx_lcdc_release,
> +	.name = "imx-lcdc",
> +	.desc = "i.MX LCDC driver",
> +	.date = "20200716",
> +};
> +
> +static const struct of_device_id imx_lcdc_of_dev_id[] = {
> +	{
> +		.compatible = "fsl,imx21-lcdc",
> +	},
> +	{
> +		.compatible = "fsl,imx25-lcdc",
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
> +
> +static irqreturn_t irq_handler(int irq, void *arg)
> +{
> +	struct imx_lcdc *lcdc = (struct imx_lcdc *)arg;

Unnecessary cast.

> +	struct drm_crtc *crtc = &lcdc->pipe.crtc;
> +	unsigned int status;
> +
> +	status = readl(lcdc->base + IMX21LCDC_LISR);
> +
> +	if (status & INTR_EOF) {
> +		drm_crtc_handle_vblank(crtc);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int imx_lcdc_probe(struct platform_device *pdev)
> +{
> +	struct imx_lcdc *lcdc;
> +	struct drm_device *drm;
> +	int irq;
> +	int ret;
> +	struct device *dev = &pdev->dev;
> +
> +	lcdc = devm_drm_dev_alloc(&pdev->dev, &imx_lcdc_drm_driver,

Could use the local dev variable.

> +				  struct imx_lcdc, drm);
> +	if (!lcdc)
> +		return -ENOMEM;
> +
> +	drm = &lcdc->drm;
> +
> +	lcdc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(lcdc->base)) {
> +		dev_err(dev, "Cannot get IO memory\n");
> +		return PTR_ERR(lcdc->base);
> +	}
> +
> +	/* Panel */
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &lcdc->panel, &lcdc->bridge);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to find panel or bridge: %pe", ERR_PTR(ret));

Could be simplified with dev_err_probe().

> +		return ret;
> +	}
> +
> +	/* Get Clocks */
> +	lcdc->clk_ipg = devm_clk_get(dev, "ipg");
> +	if (IS_ERR(lcdc->clk_ipg)) {
> +		dev_err(dev, "Failed to get %s clk: %pe\n", "ipg",
> +			lcdc->clk_ipg);
> +		return PTR_ERR(lcdc->clk_ipg);

Maybe also use dev_err_probe() for the clocks.

> +	}
> +
> +	lcdc->clk_ahb = devm_clk_get(dev, "ahb");
> +	if (IS_ERR(lcdc->clk_ahb)) {
> +		dev_err(dev, "Failed to get %s clk: %pe\n", "ahb",
> +			lcdc->clk_ahb);
> +		return PTR_ERR(lcdc->clk_ahb);
> +	}
> +
> +	lcdc->clk_per = devm_clk_get(dev, "per");
> +	if (IS_ERR(lcdc->clk_per)) {
> +		dev_err(dev, "Failed to get %s clk: %pe\n", "per",
> +			lcdc->clk_per);
> +		return PTR_ERR(lcdc->clk_per);
> +	}
> +
> +	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(drm->dev, "Cannot set DMA Mask\n");
> +		return ret;
> +	}
> +
> +	/* Modeset init */
> +	drm_mode_config_init(drm);

Use drmm_mode_config_init() directly and handle the return value.

> +
> +	/* CRTC, Plane, Encoder */
> +	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe, &imx_lcdc_pipe_funcs, imx_lcdc_formats,
> +					   ARRAY_SIZE(imx_lcdc_formats), NULL, &lcdc->connector);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Cannot setup simple display pipe\n");
> +		return ret;
> +	}
> +
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialize vblank\n");
> +		return ret;
> +	}
> +
> +	if (lcdc->bridge) {
> +		ret = drm_simple_display_pipe_attach_bridge(&lcdc->pipe,
> +							    lcdc->bridge);
> +		if (ret) {
> +			dev_err(drm->dev, "Cannot connect bridge: %pe\n",
> +				ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	/* Connector */
> +	drm_connector_helper_add(&lcdc->connector, &imx_lcdc_connector_hfuncs);
> +	drm_connector_init(drm, &lcdc->connector, &imx_lcdc_connector_funcs,
> +			   DRM_MODE_CONNECTOR_DPI);

Missing error handling.

regards
Philipp
