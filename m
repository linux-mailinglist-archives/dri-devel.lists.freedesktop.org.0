Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874B17EA65
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348E6E0ED;
	Mon,  9 Mar 2020 20:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFD46E0ED
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:48:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ADB62D2;
 Mon,  9 Mar 2020 21:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583786888;
 bh=O0LPdl6qfBwrLm84690DJrpuPt56rbl49PYjSrnIk8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKQ/6J+9+Mks+Y79P3nQLyV6te7r6UE8b6/UCruO8MHrRRNkImBhmsAj1ZHMj960L
 xlPvbI1nI7VL+4mUEDBlE7SnpD2By6Vok6R8rBQEPJkEU3ONH0g9Pqc1pbsBcNUm7T
 uycx3h6uazGHutQbJups0eXh3WTlfG0pyAHt4D5c=
Date: Mon, 9 Mar 2020 22:48:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
Message-ID: <20200309204805.GA875@pendragon.ideasonboard.com>
References: <20191114131751.26746-1-marex@denx.de>
 <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
 <20200309192306.GA20358@pendragon.ideasonboard.com>
 <20200309205559.3c860aae@collabora.com>
 <20200309195926.GC4916@pendragon.ideasonboard.com>
 <20200309212218.11ac77ae@collabora.com>
 <20200309203211.GE4916@pendragon.ideasonboard.com>
 <20200309214244.4d4671d9@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309214244.4d4671d9@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Mon, Mar 09, 2020 at 09:42:44PM +0100, Boris Brezillon wrote:
> On Mon, 9 Mar 2020 22:32:11 +0200 Laurent Pinchart wrote:
> > On Mon, Mar 09, 2020 at 09:22:18PM +0100, Boris Brezillon wrote:
> >> On Mon, 9 Mar 2020 21:59:26 +0200 Laurent Pinchart wrote:  
> >>> On Mon, Mar 09, 2020 at 08:55:59PM +0100, Boris Brezillon wrote:  
> >>>> On Mon, 9 Mar 2020 21:23:06 +0200 Laurent Pinchart wrote:    
> >>>>> On Mon, Mar 09, 2020 at 11:50:59AM +0100, Philipp Zabel wrote:    
> >>>>>> On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:      
> >>>>>>> The bus_flags and bus_format handling logic does not seem to cover
> >>>>>>> all potential usecases. Specifically, this seems to fail with an
> >>>>>>> "edt,etm0700g0edh6" display attached to an 24bit display interface,
> >>>>>>> with interface-pix-fmt = "rgb24" set in DT.      
> >>>>>> 
> >>>>>> interface-pix-fmt is a legacy property that was never intended to be
> >>>>>> used as an override for the panel bus format. The bus flags were
> >>>>>> supposed to be set from the display-timings node, back when there was no
> >>>>>> of-graph connected panel at all.
> >>>>>> 
> >>>>>> That being said, there isn't really a proper alternative that allows to
> >>>>>> override the bus format requested by the panel driver in the device tree
> >>>>>> to account for weird wiring. We could reuse the bus-width endpoint
> >>>>>> property documented in [1], but that wouldn't completely specify how the
> >>>>>> RGB components are to be mapped onto the parallel bus.
> >>>>>> 
> >>>>>> [1] Documentation/devicetree/bindings/media/video-interfaces.txt      
> >>>>> 
> >>>>> Things are funny sometimes, I've run into the exact same problem with a
> >>>>> different display controller today.
> >>>>> 
> >>>>> Shouldn't we use the data-shift property from [1] to specify this ?
> >>>>> Combined with Boris' bus format negotiation for bridges, I think we
> >>>>> would have all the components in place to solve this problem properly.    
> >>>> 
> >>>> I wonder if we shouldn't take more complex pin mappings into account
> >>>> now and go directly for a data-mapping property describing those
> >>>> mappings using a string. This way we'd have a single property that
> >>>> would work for both fully parallel buses (DPI/RGB) and serial (or
> >>>> partially parallel) ones (LVDS).    
> >>> 
> >>> I'm all for standardization, but I'm not sure data-mapping is the right
> >>> property, at least with its current definition. It's really meant to
> >>> describe how individual bits are mapped to the LVDS time slots. I'm fine
> >>> extending it, but we need to define it clearly. How would you envision
> >>> it being used in this case ?  
> >> 
> >> Well, clearly the data-width/data-shift approach does not solve all
> >> problems: what do you do if the source R pins are connected to the sink
> >> B pins? Well, the first answer would probably be 'have a serious
> >> discussion with the HW designer responsible for this insanity' :-), but
> >> once you've passed this 'WTF' stage, you'll have to find a way to tell
> >> the source component it should use RGBxyx while the sink should use
> >> BGRxyx (or vice-versa). This is something you can't extract that from
> >> those width/shift props though. My suggestion would be to have one
> >> string per MEDIA_BUS_FMT definition, so we can force things at the DT
> >> level if we really have to. That's basically what the interface-pix-fmt
> >> property was doing, except we would standardize the prop and values and
> >> probably provide helpers so bridge elements don't have to parse this
> >> prop manually.  
> > 
> > I don't think that would work in the general case though. We may want to
> > use different formats and pick one of them at runtime based on external
> > information (for instance when the sink can accept both RGB and YUV),
> > hardcoding formats in DT isn't a good option. We instead need to add
> > information to DT to specify how lines are connected, and deduce formats
> > based on that.
> 
> If we start describing the role of each pin, we're not that far from a
> pinmux definition, the only difference being that we want pin configs
> to match between the source and sink, where actual pinmux configs are
> only controlled by one element (the HW block requesting exclusive
> access to those pins).

The trick here will be to find an appropriate middle-ground. I don't
think we need to describe the role of each pin, but only to take into
account the parallel bus routing configurations that are likely to
happen in practice. Connecting MSBs to LSBs when decreasing the bus
width (or the other way around when increasing it) is a common issue.
Flipping R and B should be less common, but I suppose it can happen in
practice if the display controller supports both RGB and BGR formats (it
will just need to adjust the format internally if there's no dedicated
R<->B flipping hardware option). What else do we have ?

> Note that none of those things actually solve Marek's issue, which was
> related to bus-flags, not bus-format. But I'm glad we have this
> discussion, since that's something I need to solve for an imx setup
> with a lvds-codec encoder connected to the imx-pd block.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
