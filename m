Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284C547C74
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 23:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B60110F0AD;
	Sun, 12 Jun 2022 21:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1330910F5D9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:28:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E26F825;
 Sun, 12 Jun 2022 23:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655069291;
 bh=wycngWnNii8KVlPbxJ+kxwurGQwoP5WgGiStwYu1zwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPTE4RYaFj2+s2MZYMDCiQrV+5tE9gzqS1HjsfrEzt4c33F2HJ3zLDVgIO7z+iLi8
 XKiQ8e6PcM1lcxKFXXdfxqjrilyzIUYYDEt/ck/9S4tKhwtloLESFhccpOUWZVUqSE
 l3vH+M/LLiEcLvrz2d0+FTy/cAkRsSirNY3Dn/gM=
Date: Mon, 13 Jun 2022 00:28:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [LINUX PATCH 2/2] drm: xlnx: dsi: driver for Xilinx DSI Tx
 subsystem
Message-ID: <YqZaY8Jiprc69TQZ@pendragon.ideasonboard.com>
References: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1652363593-45799-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <Yn47YsSH4fn/wjKN@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yn47YsSH4fn/wjKN@ravnborg.org>
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

One more comment.

On Fri, May 13, 2022 at 01:05:06PM +0200, Sam Ravnborg wrote:
> On Thu, May 12, 2022 at 07:23:13PM +0530, Venkateshwar Rao Gannavarapu wrote:
> > The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> > data from AXI-4 stream interface.
> > 
> > It supports upto 4 lanes, optional register interface for the DPHY
> > and multiple RGB color formats.
> > This is a MIPI-DSI host driver and provides DSI bus for panels.
> > This driver also helps to communicate with its panel using panel
> > framework.
> 
> Thanks for submitting this driver. I have added a few comments in the
> following that I hope you will find useful to improve the driver.
> 
> > Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> > ---
> >  drivers/gpu/drm/xlnx/Kconfig    |  14 ++
> >  drivers/gpu/drm/xlnx/Makefile   |   1 +
> >  drivers/gpu/drm/xlnx/xlnx_dsi.c | 456 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 471 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

[snip]

> > diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> > new file mode 100644
> > index 0000000..a5291f3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c

[snip]

> > +static const struct drm_bridge_funcs xlnx_dsi_bridge_funcs = {
> > +	.mode_set	= xlnx_dsi_bridge_mode_set,
> 
> From the documentation of the mode_set operation:
>  * This is deprecated, do not use!
>  * New drivers shall set their mode in the
>  * &drm_bridge_funcs.atomic_enable operation.
> 
> Please adjust accordingly.
> 
> > +	.atomic_enable	= xlnx_dsi_bridge_enable,
> > +	.atomic_disable	= xlnx_dsi_bridge_disable,
> > +	.attach		= xlnx_dsi_bridge_attach,
> > +	.detach		= xlnx_dsi_bridge_detach,
> > +};
> 
> For a new bridge please implement all the mandatory atomic operations.
> 
> You will need at least:
> 	.atomic_get_output_bus_fmts = xlnx_dsi_bridge_get_output_bus_fmts,

As this DSI encoder will never be the last bridge in the chain (there
should always be a panel or another bridge afterwards), I think this
function can be skipped.

> 	.atomic_get_input_bus_fmts = xlnx_dsi_bridge_get_input_bus_fmts,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> };

[snip]

-- 
Regards,

Laurent Pinchart
