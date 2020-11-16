Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062C2B3F9F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 10:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8845589D44;
	Mon, 16 Nov 2020 09:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0783D89D44
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:22:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2DD0A1B;
 Mon, 16 Nov 2020 10:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605518577;
 bh=gjPORnVHZI4CogWiQCl+tACejjoyvIZunPZcDsRQx/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vepne8ccmDnswB1AJtRJttWHriLx3uSSAJuFqpAAoSxlzeH/nE/lsF/z705xUoLNZ
 1vibajfagm4VAm1rVR4ydyEAYZDrPEr5O2q7VEarmZ7Ibl17um8d5/aXjDV1Ii8pm1
 5wop+0X9VXrtLzHyNmd2nQqsYOIJNshpzT6bo2zI=
Date: Mon, 16 Nov 2020 11:22:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 30/56] drm/omap: dsi: move panel refresh function to
 host
Message-ID: <20201116092253.GE6540@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-31-tomi.valkeinen@ti.com>
 <20201109101003.GA6029@pendragon.ideasonboard.com>
 <6118c70e-6dc5-2d87-fc68-266cd3eeb66c@ti.com>
 <20201111155854.GH4115@pendragon.ideasonboard.com>
 <fca968af-9554-041a-c416-0781da8b70ca@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fca968af-9554-041a-c416-0781da8b70ca@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Nov 12, 2020 at 10:08:21AM +0200, Tomi Valkeinen wrote:
> On 11/11/2020 17:58, Laurent Pinchart wrote:
> 
> >>>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> >>>> index 030a8fa140db..1582960f9e90 100644
> >>>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> >>>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> >>>> @@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -static int dsicm_set_update_window(struct panel_drv_data *ddata,
> >>>> -		u16 x, u16 y, u16 w, u16 h)
> >>>> -{
> >>>> -	struct mipi_dsi_device *dsi = ddata->dsi;
> >>>> -	int r;
> >>>> -	u16 x1 = x;
> >>>> -	u16 x2 = x + w - 1;
> >>>> -	u16 y1 = y;
> >>>> -	u16 y2 = y + h - 1;
> >>>> -
> >>>> -	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> >>>> -	if (r < 0)
> >>>> -		return r;
> >>>> -
> >>>> -	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> >>>> -	if (r < 0)
> >>>> -		return r;
> >>>> -
> >>>> -	return 0;
> >>>> -}
> >>>> -
> >>>
> >>> I can't tell whether this is common to all command-mode panels, or if
> >>> there could be a need for panel-specific update procedures, so I can't
> >>> really ack this patch.
> >>
> >> I can't say either, but all the command mode panels I know need and support this. And, afaik, we
> >> have only the single cmd mode panel driver which we add in this series.
> > 
> > Now that I think about it again, isn't it a layering violation ?
> > Shouldn't the DSI host handle DSI commands transfers, with the panel
> > driver taking care of specific DSI commands ?
> 
> Well, the DSI host (the HW) already handles specific DSI commands, as it does the update with DCS
> Write Start/Continue commands. The update is initiated from omap_crtc, via dssdev->dsi_ops->update().
> 
> We could perhaps add a new function to drm_panel_funcs, say, prepare_update, which could then do the
> above.
> 
> Although I think the above code is not strictly speaking required, as the panel should remember the
> column and page address, and as such, they could be set just once at config time.
> 
> However, I remember debugging issues related to this. And with a quick test, I can see that things
> break down if I just do the above once in the panel's setup. But things work if I send a DSI NOP
> instead in the dsi host. So looks to me that either the OMAP DSI or the panel I have need some
> command transmitted there. It probably has to happen between two frame transfers.
> 
> There are also other things related to update which I'm not so happy about: 1) the TE gpio irq is
> handled in the dsi host driver now, even if it's a panel gpio, 2) the dsi host driver snoops the DSI
> packets sent by the panel, and catches TEAR_ON/OFF packets, and then change internal state accordingly.
> 
> So... I could change the dsi host driver to only send a NOP, and do the page/column call from the
> panel's setup. That simplifies the code.
> 
> Or I could add the new function to drm_panel_funcs, and send a NOP from there. But if this "needs a
> NOP" is an OMAP DSI feature, the panel driver is not the right place for it. I also think that
> managing the TE cleanly needs more thought, and probably requires some more interaction between the
> dsi host and the panel. It might be better to look at both the update callback and the TE at the
> same time.

I'm fine addressing both issues on top of this series. My concern is
that an incorrect split of responsibilities between the panel driver and
the DSI host driver will result in panel drivers being compatible only
with specific DSI hosts. It's a difficult issue, but I think we need to
extend the DSI API to handle this cleanly.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
