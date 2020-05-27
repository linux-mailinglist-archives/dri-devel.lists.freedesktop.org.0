Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80D1E516C
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 00:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274D6E03A;
	Wed, 27 May 2020 22:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E326E03A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 22:45:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9ED45B4;
 Thu, 28 May 2020 00:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590619539;
 bh=MpJa9xl8D4SxLkJOFucqx9FLMo72cG6hm/XDMQhPUQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbB26YGpe5aUy/SPwrrwIBFupCKI0E1D7KOYj3evSMPYmuWdqZfecSFn0ch4Yi7aR
 pGGVl9O+qdy0/w6MvFpoIDFkvb9SsD/QrDhaV6Uyc1vsT+f9iooNqlH1tO2pFk1u/W
 YL00/Szqwfbeaah1DiUI1V98HXIKLEfiZS+frMRg=
Date: Thu, 28 May 2020 01:45:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Message-ID: <20200527224524.GH6171@pendragon.ideasonboard.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
 <20200527175435.GA26381@smtp.xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527175435.GA26381@smtp.xilinx.com>
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hyun,

On Wed, May 27, 2020 at 10:54:35AM -0700, Hyun Kwon wrote:
> On Sat, 2020-05-23 at 20:08:13 -0700, Laurent Pinchart wrote:
> > On Mon, May 04, 2020 at 11:43:48AM -0700, Hyun Kwon wrote:
> >> On Mon, 2020-04-20 at 14:20:56 -0700, Venkateshwar Rao Gannavarapu wrote:
> >>> The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> >>> data from AXI-4 stream interface.
> >>> 
> >>> It supports upto 4 lanes, optional register interface for the DPHY,
> >> 
> >> I don't see the register interface for dphy support.
> > 
> > I think the D-PHY should be supported through a PHY driver, as it seems
> > to be shared between different subsystems.
> 
> Right, if the logic is shared across subsystems. I can't tell if that's
> the case as the IP comes as a single block. Maybe GVRao can confirm.

I believe the CSI2-RX subsystem uses the same D-PHY IP core, but a
confirmation would be nice.

> >>> multiple RGB color formats, command mode and video mode.
> >>> This is a MIPI-DSI host driver and provides DSI bus for panels.
> >>> This driver also helps to communicate with its panel using panel
> >>> framework.
> >>> 
> >>> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> >>> ---
> >>>  drivers/gpu/drm/xlnx/Kconfig    |  11 +
> >>>  drivers/gpu/drm/xlnx/Makefile   |   2 +
> >>>  drivers/gpu/drm/xlnx/xlnx_dsi.c | 755 ++++++++++++++++++++++++++++++++++++++++
> > 
> > Daniel Vetter has recently expressed his opiion that bridge drivers
> > should go to drivers/gpu/drm/bridge/. It would then be
> > drivers/gpu/drm/bridge/xlnx/. I don't have a strong opinion myself.
> > 
> >>>  3 files changed, 768 insertions(+)
> >>>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> >>> 
> >>> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> >>> index aa6cd88..73873cf 100644
> >>> --- a/drivers/gpu/drm/xlnx/Kconfig
> >>> +++ b/drivers/gpu/drm/xlnx/Kconfig
> >>> @@ -11,3 +11,14 @@ config DRM_ZYNQMP_DPSUB
> >>>  	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
> >>>  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
> >>>  	  subsystem.
> >>> +
> >>> +config DRM_XLNX_DSI
> >>> +        tristate "Xilinx DRM DSI Subsystem Driver"
> >>> +        select DRM_MIPI_DSI
> >>> +        select DRM_PANEL
> >>> +        select DRM_PANEL_SIMPLE
> >>> +        help
> >>> +	  This enables support for Xilinx MIPI-DSI.
> >> 
> >> This sentence is not needed with below. Could you please rephrase the whole?
> >> 
> >>> +	  This is a DRM/KMS driver for Xilinx programmable DSI controller.
> >>> +	  Choose this option if you have a Xilinx MIPI DSI-TX controller
> >>> +	  subsytem.
> >> 
> >> These seem incorrectly indented.
> >> 
> >>> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> >>> index 2b844c6..b7ee6ef 100644
> >>> --- a/drivers/gpu/drm/xlnx/Makefile
> >>> +++ b/drivers/gpu/drm/xlnx/Makefile
> >>> @@ -1,2 +1,4 @@
> >>>  zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
> >>>  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> >>> +
> >>> +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> >>> diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> >>> new file mode 100644
> >>> index 0000000..b8cae59
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> >>> @@ -0,0 +1,755 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Xilinx FPGA MIPI DSI Tx Controller driver
> >>> + *
> >>> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> >>> + *
> >>> + * Authors:
> >>> + * - Saurabh Sengar <saurabhs@xilinx.com>
> >>> + * - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> >>> + */
> >>> +
> >>> +#include <drm/drm_atomic_helper.h>
> >>> +#include <drm/drm_connector.h>
> >>> +#include <drm/drm_crtc.h>
> >>> +#include <drm/drm_crtc_helper.h>
> >>> +#include <drm/drm_device.h>
> >>> +#include <drm/drm_encoder.h>
> >>> +#include <drm/drm_fourcc.h>
> >>> +#include <drm/drm_gem_cma_helper.h>
> >>> +#include <drm/drm_mipi_dsi.h>
> >>> +#include <drm/drm_panel.h>
> >>> +#include <drm/drm_probe_helper.h>
> >>> +
> >>> +#include <linux/clk.h>
> >>> +#include <linux/component.h>
> >>> +#include <linux/device.h>
> >>> +#include <linux/iopoll.h>
> >>> +#include <linux/of_device.h>
> >>> +#include <linux/of_graph.h>
> >>> +#include <linux/phy/phy.h>
> >>> +
> >>> +#include <video/mipi_display.h>
> >>> +#include <video/videomode.h>
> >>> +
> >>> +/* DSI Tx IP registers */
> >>> +#define XDSI_CCR			0x00
> >>> +#define XDSI_CCR_COREENB		BIT(0)
> >>> +#define XDSI_CCR_SOFTRST		BIT(1)
> >>> +#define XDSI_CCR_CRREADY		BIT(2)
> >>> +#define XDSI_CCR_CMDMODE		BIT(3)
> >>> +#define XDSI_CCR_DFIFORST		BIT(4)
> >>> +#define XDSI_CCR_CMDFIFORST		BIT(5)
> >>> +#define XDSI_PCR			0x04
> 
> [snip]
> 
> >>> +	}
> >>> +
> >>> +	ret = clk_prepare_enable(dsi->video_aclk);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "failed to enable video clk %d\n", ret);
> >>> +		goto err_disable_dphy_clk;
> >>> +	}
> >>> +
> >>> +	ret = component_add(dev, &xlnx_dsi_component_ops);
> > 
> > The driver should expose the DSI-TX as a drm_bridge instead of using the
> > component framework. You shouldn't register a drm_encoder, and I don't
> > think you should register a drm_connector either. Only bridge operations
> > should be exposed, and the drm_bridge .attach() operation should return
> > an error when DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set. The top-level
> > driver using this bridge should create the drm_encoder and
> > drm_connector, most likely using drm_bridge_connector_init() to create
> > the connector.
> 
> Not clear to me if this has to be a bridge, and then what it will be attached
> to. The IP block itself pretty much self-contains all functionalities already,
> just like any other drm encoder / connector, so it doesn't have to be wrapped
> around by any other layer. Please let me know your thought, so I can understand
> better. :-)

The DSI output will likely often be connected to a DSI panel, but it
could also be connected to another bridge, for instance to an ADV7533
DSI-to-HDMI bridge. In that case an HDMI connector needs to be created,
not a DSI connector. This is why we are moving towards a model where
bridge drivers only handle the bridge device, and the drm_encoder and
drm_connector is created externally, but the display controller driver.
The drm_bridge_connector_init() helper can automate connector creation
for a chain of bridges.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
