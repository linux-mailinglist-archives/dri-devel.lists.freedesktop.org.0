Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D6547C6B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 23:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F2310F250;
	Sun, 12 Jun 2022 21:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E0010F80C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:21:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72911825;
 Sun, 12 Jun 2022 23:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655068904;
 bh=ltDVV/FNzrC9IY/lw+6fQdMuSHJmmwoYyLRASzOYSs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rbpmSsi5y28tyLJ+Zls/lTdm/TvvlymFVLz1bQBc32std4ExoNtt0IyBYkzXMP9b9
 80s8rV2wtK/SSa6HdPY0iRXdRWIFUSSmwdEF1qahIOsHL5xqdoJEsL3mlldCY0rpp7
 M2PESCRnq01p5sSc74azeG/XRk+aqYZ7p6Qk6Rto=
Date: Mon, 13 Jun 2022 00:21:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [LINUX PATCH 2/2] drm: xlnx: dsi: driver for Xilinx DSI Tx
 subsystem
Message-ID: <YqZY4QMAkGiFOOWE@pendragon.ideasonboard.com>
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

> > +static inline void xlnx_dsi_writel(void __iomem *base, int offset, u32 val)
> > +{
> > +	writel(val, base + offset);
> > +}
> > +
> > +static inline u32 xlnx_dsi_readl(void __iomem *base, int offset)
> > +{
> > +	return readl(base + offset);
> > +}
> 
> When I see implementations like this I wonder if a regmap would be
> beneficial?

regmap often seems overkill to me when the driver only needs plain
32-bit mmio read/write, given the overhead it adds at runtime. Is it
just me ?

[snip]

-- 
Regards,

Laurent Pinchart
