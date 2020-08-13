Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C4243F28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 21:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8610E88525;
	Thu, 13 Aug 2020 19:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351ED88525
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:05:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 361E42002E;
 Thu, 13 Aug 2020 21:05:28 +0200 (CEST)
Date: Thu, 13 Aug 2020 21:05:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [RFC PATCH V2 2/2] drm: xlnx: dsi: driver for Xilinx DSI TX
 subsystem
Message-ID: <20200813190527.GA796524@ravnborg.org>
References: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1597106777-30913-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597106777-30913-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Am4ss40yAAAA:8 a=e5mUnYsNAAAA:8
 a=IXgV3OlwSc8iuBbpLzUA:9 a=P_rrYiEMR7mftgad:21 a=wDHEmPcqT0wlVZaQ:21
 a=CjuIK1q_8ugA:10 a=lf-hbUz_c89dky27wAWH:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: sandipk@xilinx.com, hyun.kwon@xilinx.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vgannava@xilinx.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Venkateshwar

On Tue, Aug 11, 2020 at 06:16:17AM +0530, Venkateshwar Rao Gannavarapu wrote:
> The Xilinx MIPI DSI TX subsystem soft IP is used to display video
> data from AXI-4 stream interface.
> 
> It supports upto 4 lanes, multiple RGB color formats, video mode
> and command mode. The driver provides the kernel mode setting and
> MIPI DSI host functionalities.
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>

This is maybe covered before - but considered that this driver is used
to control an IP that may be utilised by other hardware configurations
in the future this should be independent and not tied to the xilinx
display driver.

In other words - this would be much better implemented on top of the
bridge framework.

In the beginning ther will only a single user of this bridge driver,
so no backward compatibility is needed. Just update the xilinx driver
to use the new bride interface and this should do the trick.

Some benefits from this:
- drm_panel stuff will be handled by the panel_bridge
- the connector will be handled by drm_bridge_conector
- no need for the component framework
- reuseabilty by others

I did not comment on the actual patch - because the details looks good.
But the overall design needs an update.
I look forward to see this implemented as a bridge driver with the
necessary adjustments to the display driver.

	Sam


> ---
>  drivers/gpu/drm/xlnx/Kconfig    |  11 +
>  drivers/gpu/drm/xlnx/Makefile   |   2 +
>  drivers/gpu/drm/xlnx/xlnx_dsi.c | 701 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 714 insertions(+)
>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> 
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index aa6cd88..991bb37 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -11,3 +11,14 @@ config DRM_ZYNQMP_DPSUB
>           This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
>           this option if you have a Xilinx ZynqMP SoC with DisplayPort
>           subsystem.
> +
> +config DRM_XLNX_DSI
> +       tristate "Xilinx DRM DSI Subsystem Driver"
> +       select DRM_MIPI_DSI
> +       select DRM_PANEL
> +       select DRM_PANEL_SIMPLE
> +       help
> +         DRM KMS driver for Xilinx programmable DSI subsystem controller.
> +         Choose this option if you have a Xilinx MIPI DSI-TX in video
> +         pipeline. The driver provides the kernel mode settings and MIPI
> +         DSI host functionalities.
> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> index 2b844c6..b7ee6ef 100644
> --- a/drivers/gpu/drm/xlnx/Makefile
> +++ b/drivers/gpu/drm/xlnx/Makefile
> @@ -1,2 +1,4 @@
>  zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
>  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> +
> +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> new file mode 100644
> index 0000000..3231043
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> @@ -0,0 +1,701 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx FPGA MIPI DSI Tx Controller driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Saurabh Sengar <saurabhs@xilinx.com>
> + * - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/videomode.h>
> +
> +/* DSI Tx IP registers */
> +#define XDSI_CCR                       0x00
> +#define XDSI_CCR_COREENB               BIT(0)
> +#define XDSI_CCR_SOFTRST               BIT(1)
> +#define XDSI_CCR_CRREADY               BIT(2)
> +#define XDSI_CCR_CMDMODE               BIT(3)
> +#define XDSI_CCR_DFIFORST              BIT(4)
> +#define XDSI_CCR_CMDFIFORST            BIT(5)
> +#define XDSI_PCR                       0x04
> +#define XDSI_PCR_VIDEOMODE(x)          (((x) & 0x3) << 3)
> +#define XDSI_PCR_VIDEOMODE_MASK                (0x3 << 3)
> +#define XDSI_PCR_VIDEOMODE_SHIFT       3
> +#define XDSI_PCR_BLLPTYPE(x)           ((x) << 5)
> +#define XDSI_PCR_BLLPMODE(x)           ((x) << 6)
> +#define XDSI_PCR_EOTPENABLE(x)         ((x) << 13)
> +#define XDSI_GIER                      0x20
> +#define XDSI_ISR                       0x24
> +#define XDSI_IER                       0x28
> +#define XDSI_STR                       0x2C
> +#define XDSI_STR_RDY_SHPKT             BIT(6)
> +#define XDSI_STR_RDY_LNGPKT            BIT(7)
> +#define XDSI_STR_DFIFO_FULL            BIT(8)
> +#define XDSI_STR_DFIFO_EMPTY           BIT(9)
> +#define XDSI_STR_WAITFR_DATA           BIT(10)
> +#define XDSI_STR_CMD_EXE_PGS           BIT(11)
> +#define XDSI_STR_CCMD_PROC             BIT(12)
> +#define XDSI_STR_LPKT_MASK             (0x5 << 7)
> +#define XDSI_CMD                       0x30
> +#define XDSI_CMD_QUEUE_PACKET(x)       ((x) & GENMASK(23, 0))
> +#define XDSI_DFR                       0x34
> +#define XDSI_TIME1                     0x50
> +#define XDSI_TIME1_BLLP_BURST(x)       ((x) & GENMASK(15, 0))
> +#define XDSI_TIME1_HSA(x)              (((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME2                     0x54
> +#define XDSI_TIME2_VACT(x)             ((x) & GENMASK(15, 0))
> +#define XDSI_TIME2_HACT(x)             (((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_HACT_MULTIPLIER           GENMASK(1, 0)
> +#define XDSI_TIME3                     0x58
> +#define XDSI_TIME3_HFP(x)              ((x) & GENMASK(15, 0))
> +#define XDSI_TIME3_HBP(x)              (((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME4                     0x5c
> +#define XDSI_TIME4_VFP(x)              ((x) & GENMASK(7, 0))
> +#define XDSI_TIME4_VBP(x)              (((x) & GENMASK(7, 0)) << 8)
> +#define XDSI_TIME4_VSA(x)              (((x) & GENMASK(7, 0)) << 16)
> +#define XDSI_LTIME                     0x60
> +#define XDSI_BLLP_TIME                 0x64
> +/*
> + * XDSI_NUM_DATA_T represents number of data types in the
> + * enum mipi_dsi_pixel_format in the MIPI DSI part of DRM framework.
> + */
> +#define XDSI_NUM_DATA_T                        4
> +
> +#define XDSI_DPHY_CLK_MIN      197000000000UL
> +#define XDSI_DPHY_CLK_MAX      203000000000UL
> +#define XDSI_DPHY_CLK_REQ      200000000000UL
> +
> +/* command timeout in usec */
> +#define XDSI_CMD_TIMEOUT_VAL   (3000)
> +
> +/**
> + * struct xlnx_dsi - Xilinx DSI-TX core
> + * @encoder: DRM encoder structure
> + * @dsi_host: DSI host device
> + * @connector: DRM connector structure
> + * @panel_node: MIPI DSI device panel node
> + * @panel:  DRM panel structure
> + * @dev: device structure
> + * @iomem: Base address of DSI subsystem
> + * @lanes: number of active data lanes supported by DSI controller
> + * @cmdmode: command mode support
> + * @mode_flags: DSI operation mode related flags
> + * @format: pixel format for video mode of DSI controller
> + * @mul_factor: multiplication factor for HACT timing parameter
> + * @video_aclk: Video clock
> + * @dphy_clk_200M: 200MHz DPHY clock and AXI Lite clock
> + */
> +struct xlnx_dsi {
> +       struct drm_encoder encoder;
> +       struct mipi_dsi_host dsi_host;
> +       struct drm_connector connector;
> +       struct device_node *panel_node;
> +       struct drm_panel *panel;
> +       struct device *dev;
> +       void __iomem *iomem;
> +       u32 lanes;
> +       bool cmdmode;
> +       u32 mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       u32 mul_factor;
> +       struct clk *video_aclk;
> +       struct clk *dphy_clk_200M;
> +};
> +
> +#define host_to_dsi(host) container_of(host, struct xlnx_dsi, dsi_host)
> +#define connector_to_dsi(c) container_of(c, struct xlnx_dsi, connector)
> +#define encoder_to_dsi(e) container_of(e, struct xlnx_dsi, encoder)
> +
> +static inline void xlnx_dsi_writel(void __iomem *base, int offset, u32 val)
> +{
> +       writel(val, base + offset);
> +}
> +
> +static inline u32 xlnx_dsi_readl(void __iomem *base, int offset)
> +{
> +       return readl(base + offset);
> +}
> +
> +/**
> + * xlnx_dsi_host_transfer - transfer command to panel
> + * @host: mipi dsi host structure
> + * @msg: mipi dsi msg with type, length and data
> + *
> + * This function is valid only in command mode.
> + * It checks the command fifo empty status and writes into
> + * data or cmd register and waits for the completion status.
> + *
> + * Return: number of bytes, on success and error number on failure
> + */
> +static ssize_t xlnx_dsi_host_transfer(struct mipi_dsi_host *host,
> +                                     const struct mipi_dsi_msg *msg)
> +{
> +       struct xlnx_dsi *dsi = host_to_dsi(host);
> +       u32 data, cmd0, val, offset;
> +       int status;
> +       const char *tx_buf = msg->tx_buf;
> +
> +       switch (msg->type) {
> +       case MIPI_DSI_DCS_LONG_WRITE:
> +       case MIPI_DSI_DCS_GENERIC_LONG_WRITE:
> +               status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +                                           (val & XDSI_STR_LPKT_MASK ==
> +                                            XDSI_STR_LPKT_MASK), 1,
> +                                           XDSI_CMD_TIMEOUT_VAL);
> +               if (status) {
> +                       dev_err(dsi->dev, "long cmd fifo not empty!\n");
> +                       return -EBUSY;
> +               }
> +               cmd0 = msg->type | (msg->tx_len << 8);
> +               xlnx_dsi_writel(dsi->iomem, XDSI_CMD, cmd0);
> +
> +               for (offset = 0; offset <= msg->tx_len; offset += 4, data = 0) {
> +                       data = tx_buf[0 + offset] | tx_buf[1 + offset] << 8 |
> +                               tx_buf[2 + offset] << 16 |
> +                               tx_buf[3 + offset] << 24;
> +                       xlnx_dsi_writel(dsi->iomem, XDSI_DFR, data);
> +               }
> +               break;
> +       case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +               status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +                                           (val & XDSI_STR_RDY_SHPKT ==
> +                                            XDSI_STR_RDY_SHPKT), 1,
> +                                           XDSI_CMD_TIMEOUT_VAL);
> +               if (status) {
> +                       dev_err(dsi->dev, "short cmd fifo not empty\n");
> +                       return -EBUSY;
> +               }
> +               data = MIPI_DSI_DCS_SHORT_WRITE_PARAM |
> +                       (tx_buf[0] << 8) | (tx_buf[1] << 16);
> +               xlnx_dsi_writel(dsi->iomem, XDSI_CMD, data);
> +               break;
> +       case MIPI_DSI_DCS_SHORT_WRITE:
> +               status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +                                           (val & XDSI_STR_RDY_SHPKT ==
> +                                            XDSI_STR_RDY_SHPKT), 1,
> +                                           XDSI_CMD_TIMEOUT_VAL);
> +               if (status) {
> +                       dev_err(dsi->dev, "short cmd fifo not empty\n");
> +                       return -EBUSY;
> +               }
> +               data = MIPI_DSI_DCS_SHORT_WRITE | (tx_buf[0] << 8);
> +               xlnx_dsi_writel(dsi->iomem, XDSI_CMD, data);
> +               break;
> +       case default:
> +               dev_err(dsi->dev, "Unsupported command type\n");
> +               return -EINVAL;
> +       }
> +
> +       status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +                                   !(val & XDSI_STR_CMD_EXE_PGS), 1,
> +                                   XDSI_CMD_TIMEOUT_VAL);
> +       if (status) {
> +               dev_err(dsi->dev, "cmd timeout\n");
> +               return status;
> +       }
> +
> +       return msg->tx_len;
> +}
> +
> +static int xlnx_dsi_host_attach(struct mipi_dsi_host *host,
> +                               struct mipi_dsi_device *device)
> +{
> +       u32 panel_lanes = device->lanes;
> +       struct xlnx_dsi *dsi = host_to_dsi(host);
> +
> +       dsi->mode_flags = device->mode_flags;
> +       dsi->panel_node = device->dev.of_node;
> +
> +       if (panel_lanes != dsi->lanes) {
> +               dev_err(dsi->dev, "Mismatch of lanes. panel = %d, DSI = %d\n",
> +                       panel_lanes, dsi->lanes);
> +               return -EINVAL;
> +       }
> +
> +       if (device->format != dsi->format) {
> +               dev_err(dsi->dev, "Mismatch of format. panel = %d, DSI = %d\n",
> +                       device->format, dsi->format);
> +               return -EINVAL;
> +       }
> +
> +       if (dsi->connector.dev)
> +               drm_helper_hpd_irq_event(dsi->connector.dev);
> +
> +       dsi->panel = of_drm_find_panel(dsi->panel_node);
> +       if (IS_ERR(dsi->panel)) {
> +               dsi->panel = NULL;
> +       } else {
> +               drm_panel_attach(dsi->panel, &dsi->connector);
> +               dsi->connector.status = connector_status_connected;
> +       }
> +
> +       return 0;
> +}
> +
> +static int xlnx_dsi_host_detach(struct mipi_dsi_host *host,
> +                               struct mipi_dsi_device *device)
> +{
> +       struct xlnx_dsi *dsi = host_to_dsi(host);
> +
> +       if (dsi->panel) {
> +               drm_panel_detach(dsi->panel);
> +               dsi->panel = NULL;
> +       }
> +
> +       if (dsi->connector.dev)
> +               drm_helper_hpd_irq_event(dsi->connector.dev);
> +
> +       return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops xlnx_dsi_ops = {
> +       .attach = xlnx_dsi_host_attach,
> +       .detach = xlnx_dsi_host_detach,
> +       .transfer = xlnx_dsi_host_transfer,
> +};
> +
> +static int xlnx_dsi_connector_dpms(struct drm_connector *connector,
> +                                  int mode)
> +{
> +       struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +       int ret;
> +
> +       dev_dbg(dsi->dev, "connector dpms state: %d\n", mode);
> +
> +       switch (mode) {
> +       case DRM_MODE_DPMS_ON:
> +               ret = drm_panel_enable(dsi->panel);
> +               if (ret < 0) {
> +                       drm_panel_unprepare(dsi->panel);
> +                       dev_err(dsi->dev, "DRM panel not enabled\n");
> +                       return ret;
> +               }
> +               break;
> +       default:
> +               drm_panel_disable(dsi->panel);
> +               drm_panel_unprepare(dsi->panel);
> +               break;
> +       }
> +
> +       return drm_helper_connector_dpms(connector, mode);
> +}
> +
> +static enum drm_connector_status
> +xlnx_dsi_detect(struct drm_connector *connector, bool force)
> +{
> +       struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +
> +       if (dsi->panel) {
> +               if (dsi->cmdmode)
> +                       xlnx_dsi_writel(dsi->iomem, XDSI_CCR,
> +                                       XDSI_CCR_CMDMODE | XDSI_CCR_COREENB);
> +               ret = drm_panel_prepare(dsi->panel);
> +               if (ret < 0) {
> +                       dev_err(dsi->dev, "DRM panel not found\n");
> +                       return ret;
> +               }
> +               xlnx_dsi_writel(dsi->iomem, XDSI_CCR, 0);
> +               return connector_status_connected;
> +       } else if (!dsi->panel_node) {
> +               xlnx_dsi_connector_dpms(connector, DRM_MODE_DPMS_OFF);
> +               drm_panel_detach(dsi->panel);
> +               dsi->panel = NULL;
> +       }
> +
> +       return connector_status_disconnected;
> +}
> +
> +static void xlnx_dsi_connector_destroy(struct drm_connector *connector)
> +{
> +       drm_connector_unregister(connector);
> +       drm_connector_cleanup(connector);
> +       connector->dev = NULL;
> +}
> +
> +static const struct drm_connector_funcs xlnx_dsi_connector_funcs = {
> +       .detect = xlnx_dsi_detect,
> +       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .destroy = xlnx_dsi_connector_destroy,
> +       .reset = drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +       .dpms = xlnx_dsi_connector_dpms,
> +};
> +
> +static int xlnx_dsi_get_modes(struct drm_connector *connector)
> +{
> +       struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +
> +       if (dsi->panel)
> +               return drm_panel_get_modes(dsi->panel, connector);
> +
> +       return 0;
> +}
> +
> +static struct drm_encoder *
> +xlnx_dsi_best_encoder(struct drm_connector *connector)
> +{
> +       return &(connector_to_dsi(connector)->encoder);
> +}
> +
> +static const struct drm_connector_helper_funcs
> +xlnx_dsi_connector_helper_funcs = {
> +       .get_modes = xlnx_dsi_get_modes,
> +       .best_encoder = xlnx_dsi_best_encoder,
> +};
> +
> +static int xlnx_dsi_create_connector(struct drm_encoder *encoder)
> +{
> +       struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +       struct drm_connector *connector = &dsi->connector;
> +       struct drm_device *drm = encoder->dev;
> +       int ret;
> +
> +       connector->polled = DRM_CONNECTOR_POLL_HPD;
> +
> +       ret = drm_connector_init(encoder->dev, connector,
> +                                &xlnx_dsi_connector_funcs,
> +                                DRM_MODE_CONNECTOR_DSI);
> +       if (ret) {
> +               dev_err(dsi->dev, "Failed to create the DRM connector\n");
> +               return ret;
> +       }
> +
> +       drm_connector_helper_add(connector, &xlnx_dsi_connector_helper_funcs);
> +       drm_connector_register(connector);
> +       drm_connector_attach_encoder(connector, encoder);
> +
> +       return 0;
> +}
> +
> +/**
> + * xlnx_dsi_atomic_mode_set -  derive the DSI timing parameters
> + *
> + * @encoder: pointer to Xilinx DRM encoder
> + * @crtc_state: Pointer to drm core crtc state
> + * @connector_state: DSI connector drm state
> + *
> + * This function derives the DSI IP timing parameters from the timing
> + * values given in the attached panel driver.
> + */
> +static void
> +xlnx_dsi_atomic_mode_set(struct drm_encoder *encoder,
> +                        struct drm_crtc_state *crtc_state,
> +                                struct drm_connector_state *connector_state)
> +{
> +       struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +       struct drm_display_mode *m = &crtc_state->adjusted_mode;
> +       u32 reg, video_mode;
> +
> +       reg = xlnx_dsi_readl(dsi->iomem, XDSI_PCR);
> +       video_mode = (reg & XDSI_PCR_VIDEOMODE_MASK) >>
> +                     XDSI_PCR_VIDEOMODE_SHIFT;
> +
> +       /* configure the HSA value only if non_burst_sync_pluse video mode */
> +       if (!video_mode &&
> +           (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
> +               reg = XDSI_TIME1_HSA(m->hsync_end - m->hsync_start);
> +               xlnx_dsi_writel(dsi->iomem, XDSI_TIME1, reg);
> +       }
> +
> +       reg = XDSI_TIME4_VFP(m->vsync_start - m->vdisplay) |
> +               XDSI_TIME4_VBP(m->vtotal - m->vsync_end) |
> +               XDSI_TIME4_VSA(m->vsync_end - m->vsync_start);
> +       xlnx_dsi_writel(dsi->iomem, XDSI_TIME4, reg);
> +
> +       reg = XDSI_TIME3_HFP(m->hsync_start - m->hdisplay) |
> +               XDSI_TIME3_HBP(m->htotal - m->hsync_end);
> +       xlnx_dsi_writel(dsi->iomem, XDSI_TIME3, reg);
> +       dev_dbg(dsi->dev, "mul factor for parsed datatype is = %d\n",
> +               dsi->mul_factor / 100);
> +       /*
> +        * The HACT parameter received from panel timing values should be
> +        * divisible by 4. The reason for this is, the word count given as
> +        * input to DSI controller is HACT * mul_factor. The mul_factor is
> +        * 3, 2.25, 2.25, 2 respectively for RGB888, RGB666_L, RGB666_P and
> +        * RGB565.
> +        * e.g. for RGB666_L color format and 1080p, the word count is
> +        * 1920*2.25 = 4320 which is divisible by 4 and it is a valid input
> +        * to DSI controller. Based on this 2.25 mul factor, we come up with
> +        * the division factor of (XDSI_HACT_MULTIPLIER) as 4 for checking
> +        */
> +       if ((m->hdisplay & XDSI_HACT_MULTIPLIER) != 0)
> +               dev_warn(dsi->dev, "hactive received from panel is not aligned\n");
> +
> +       reg = XDSI_TIME2_HACT(m->hdisplay * dsi->mul_factor / 100) |
> +               XDSI_TIME2_VACT(m->vdisplay);
> +       xlnx_dsi_writel(dsi->iomem, XDSI_TIME2, reg);
> +
> +       dev_dbg(dsi->dev, "LCD size = %dx%d\n", m->hdisplay, m->hdisplay);
> +}
> +
> +static void xlnx_dsi_disable(struct drm_encoder *encoder)
> +{
> +       struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +       u32 reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +
> +       reg &= ~XDSI_CCR_COREENB;
> +       xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +       dev_dbg(dsi->dev, "DSI Tx is disabled. regs are at default values\n");
> +}
> +
> +static void xlnx_dsi_enable(struct drm_encoder *encoder)
> +{
> +       struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +       u32 reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +
> +       reg |= XDSI_CCR_COREENB;
> +       xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +       dev_dbg(dsi->dev, "MIPI DSI Tx controller is enabled\n");
> +}
> +
> +static const struct drm_encoder_helper_funcs
> +xlnx_dsi_encoder_helper_funcs = {
> +       .atomic_mode_set = xlnx_dsi_atomic_mode_set,
> +       .enable = xlnx_dsi_enable,
> +       .disable = xlnx_dsi_disable,
> +};
> +
> +static const struct drm_encoder_funcs xlnx_dsi_encoder_funcs = {
> +       .destroy = drm_encoder_cleanup,
> +};
> +
> +static int xlnx_dsi_parse_dt(struct xlnx_dsi *dsi)
> +{
> +       struct device *dev = dsi->dev;
> +       struct device_node *node = dev->of_node;
> +       int ret;
> +       u32 datatype;
> +       static const int xdsi_mul_fact[XDSI_NUM_DATA_T] = {300, 225, 225, 200};
> +
> +       dsi->dphy_clk_200M = devm_clk_get(dev, "dphy_clk_200M");
> +       if (IS_ERR(dsi->dphy_clk_200M)) {
> +               ret = PTR_ERR(dsi->dphy_clk_200M);
> +               dev_err(dev, "failed to get dphy_clk_200M %d\n", ret);
> +               return ret;
> +       }
> +
> +       dsi->video_aclk = devm_clk_get(dev, "s_axis_aclk");
> +       if (IS_ERR(dsi->video_aclk)) {
> +               ret = PTR_ERR(dsi->video_aclk);
> +               dev_err(dev, "failed to get video_clk %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = of_property_read_u32(node, "xlnx,dsi-num-lanes", &dsi->lanes);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "missing xlnx,dsi-num-lanes property\n");
> +               return ret;
> +       }
> +       if (dsi->lanes > 4 || dsi->lanes < 1) {
> +               dev_err(dsi->dev, "%d lanes : invalid lanes\n", dsi->lanes);
> +               return -EINVAL;
> +       }
> +
> +       ret = of_property_read_u32(node, "xlnx,dsi-data-type", &datatype);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "missing xlnx,dsi-data-type property\n");
> +               return ret;
> +       }
> +       dsi->format = datatype;
> +       if (datatype > MIPI_DSI_FMT_RGB565) {
> +               dev_err(dsi->dev, "Invalid xlnx,dsi-data-type string\n");
> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * multiplication factor used for HACT, based on data type.
> +        *
> +        * e.g. for RGB666_L datatype and 1920x1080 resolution,
> +        * the Hact (WC) would be as follows -
> +        * 1920 pixels * 18 bits per pixel / 8 bits per byte
> +        * = 1920 pixels * 2.25 bytes per pixel = 4320 bytes.
> +        *
> +        * Data Type - Multiplication factor
> +        * RGB888    - 3
> +        * RGB666_L  - 2.25
> +-       * RGB666_P  - 2.25
> +        * RGB565    - 2
> +        *
> +        * Since the multiplication factor maybe a floating number,
> +        * a 100x multiplication factor is used.
> +        */
> +       dsi->mul_factor = xdsi_mul_fact[datatype];
> +
> +       dsi->cmdmode = of_property_read_bool(node, "xlnx,dsi-cmd-mode");
> +
> +       dev_dbg(dsi->dev, "DSI controller num lanes = %d", dsi->lanes);
> +       dev_dbg(dsi->dev, "DSI controller datatype = %d\n", datatype);
> +       dev_dbg(dsi->dev, "DSI controller cmd mode = %d\n", dsi->cmdmode);
> +
> +       return 0;
> +}
> +
> +static int xlnx_dsi_bind(struct device *dev, struct device *master,
> +                        void *data)
> +{
> +       struct xlnx_dsi *dsi = dev_get_drvdata(dev);
> +       struct drm_encoder *encoder = &dsi->encoder;
> +       struct drm_device *drm_dev = data;
> +       int ret;
> +
> +       drm_encoder_init(drm_dev, encoder, &xlnx_dsi_encoder_funcs,
> +                        DRM_MODE_ENCODER_DSI, NULL);
> +       drm_encoder_helper_add(encoder, &xlnx_dsi_encoder_helper_funcs);
> +
> +       encoder->possible_crtcs = 1;
> +
> +       ret = xlnx_dsi_create_connector(encoder);
> +       if (ret) {
> +               dev_err(dsi->dev, "fail creating connector, ret = %d\n", ret);
> +               drm_encoder_cleanup(encoder);
> +               return ret;
> +       }
> +
> +       ret = mipi_dsi_host_register(&dsi->dsi_host);
> +       if (ret) {
> +               dev_err(dsi->dev, "failed to register DSI host: %d\n", ret);
> +               xlnx_dsi_connector_destroy(&dsi->connector);
> +               drm_encoder_cleanup(encoder);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void xlnx_dsi_unbind(struct device *dev, struct device *master,
> +                           void *data)
> +{
> +       struct xlnx_dsi *dsi = dev_get_drvdata(dev);
> +
> +       xlnx_dsi_disable(&dsi->encoder);
> +       mipi_dsi_host_unregister(&dsi->dsi_host);
> +}
> +
> +static const struct component_ops xlnx_dsi_component_ops = {
> +       .bind   = xlnx_dsi_bind,
> +       .unbind = xlnx_dsi_unbind,
> +};
> +
> +static int xlnx_dsi_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       struct xlnx_dsi *dsi;
> +       int ret;
> +       unsigned long rate;
> +
> +       dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +       if (!dsi)
> +               return -ENOMEM;
> +
> +       dsi->dsi_host.ops = &xlnx_dsi_ops;
> +       dsi->dsi_host.dev = dev;
> +       dsi->dev = dev;
> +
> +       ret = xlnx_dsi_parse_dt(dsi);
> +       if (ret)
> +               return ret;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       dsi->iomem = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(dsi->iomem)) {
> +               dev_err(dev, "failed to remap io region\n");
> +               return PTR_ERR(dsi->iomem);
> +       }
> +       platform_set_drvdata(pdev, dsi);
> +
> +       ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
> +       if (ret) {
> +               dev_err(dev, "failed to set dphy clk rate %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = clk_prepare_enable(dsi->dphy_clk_200M);
> +       if (ret) {
> +               dev_err(dev, "failed to enable dphy clk %d\n", ret);
> +               return ret;
> +       }
> +
> +       rate = clk_get_rate(dsi->dphy_clk_200M);
> +       /* Based on clock source, little deviation is acceptable */
> +       if (rate < XDSI_DPHY_CLK_MIN && rate > XDSI_DPHY_CLK_MAX) {
> +               dev_err(dev, "Error DPHY clock = %lu\n", rate);
> +               ret = -EINVAL;
> +               goto err_disable_dphy_clk;
> +       }
> +
> +       ret = clk_prepare_enable(dsi->video_aclk);
> +       if (ret) {
> +               dev_err(dev, "failed to enable video clk %d\n", ret);
> +               goto err_disable_dphy_clk;
> +       }
> +
> +       ret = component_add(dev, &xlnx_dsi_component_ops);
> +       if (ret)
> +               goto err_disable_video_clk;
> +
> +       return 0;
> +
> +err_disable_video_clk:
> +       clk_disable_unprepare(dsi->video_aclk);
> +err_disable_dphy_clk:
> +       clk_disable_unprepare(dsi->dphy_clk_200M);
> +
> +       return ret;
> +}
> +
> +static int xlnx_dsi_remove(struct platform_device *pdev)
> +{
> +       struct xlnx_dsi *dsi = platform_get_drvdata(pdev);
> +
> +       component_del(&pdev->dev, &xlnx_dsi_component_ops);
> +       clk_disable_unprepare(dsi->video_aclk);
> +       clk_disable_unprepare(dsi->dphy_clk_200M);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id xlnx_dsi_of_match[] = {
> +       { .compatible = "xlnx-dsi-1.0", },
> +       { /* end of table */ },
> +};
> +MODULE_DEVICE_TABLE(of, xlnx_dsi_of_match);
> +
> +static struct platform_driver dsi_driver = {
> +       .probe = xlnx_dsi_probe,
> +       .remove = xlnx_dsi_remove,
> +       .driver = {
> +               .name = "xlnx-dsi",
> +               .of_match_table = xlnx_dsi_of_match,
> +       },
> +};
> +
> +module_platform_driver(dsi_driver);
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("Xilinx Programmable MIPI DSI TX Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 1.8.3.1
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
