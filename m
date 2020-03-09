Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EA17E9E4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07DC6E46C;
	Mon,  9 Mar 2020 20:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6396E575
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:22:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC5F429417A;
 Mon,  9 Mar 2020 20:22:21 +0000 (GMT)
Date: Mon, 9 Mar 2020 21:22:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
Message-ID: <20200309212218.11ac77ae@collabora.com>
In-Reply-To: <20200309195926.GC4916@pendragon.ideasonboard.com>
References: <20191114131751.26746-1-marex@denx.de>
 <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
 <20200309192306.GA20358@pendragon.ideasonboard.com>
 <20200309205559.3c860aae@collabora.com>
 <20200309195926.GC4916@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Mon, 9 Mar 2020 21:59:26 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> On Mon, Mar 09, 2020 at 08:55:59PM +0100, Boris Brezillon wrote:
> > On Mon, 9 Mar 2020 21:23:06 +0200 Laurent Pinchart wrote:  
> > > On Mon, Mar 09, 2020 at 11:50:59AM +0100, Philipp Zabel wrote:  
> > > > On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:    
> > > > > The bus_flags and bus_format handling logic does not seem to cover
> > > > > all potential usecases. Specifically, this seems to fail with an
> > > > > "edt,etm0700g0edh6" display attached to an 24bit display interface,
> > > > > with interface-pix-fmt = "rgb24" set in DT.    
> > > > 
> > > > interface-pix-fmt is a legacy property that was never intended to be
> > > > used as an override for the panel bus format. The bus flags were
> > > > supposed to be set from the display-timings node, back when there was no
> > > > of-graph connected panel at all.
> > > > 
> > > > That being said, there isn't really a proper alternative that allows to
> > > > override the bus format requested by the panel driver in the device tree
> > > > to account for weird wiring. We could reuse the bus-width endpoint
> > > > property documented in [1], but that wouldn't completely specify how the
> > > > RGB components are to be mapped onto the parallel bus.
> > > > 
> > > > [1] Documentation/devicetree/bindings/media/video-interfaces.txt    
> > > 
> > > Things are funny sometimes, I've run into the exact same problem with a
> > > different display controller today.
> > > 
> > > Shouldn't we use the data-shift property from [1] to specify this ?
> > > Combined with Boris' bus format negotiation for bridges, I think we
> > > would have all the components in place to solve this problem properly.  
> > 
> > I wonder if we shouldn't take more complex pin mappings into account
> > now and go directly for a data-mapping property describing those
> > mappings using a string. This way we'd have a single property that
> > would work for both fully parallel buses (DPI/RGB) and serial (or
> > partially parallel) ones (LVDS).  
> 
> I'm all for standardization, but I'm not sure data-mapping is the right
> property, at least with its current definition. It's really meant to
> describe how individual bits are mapped to the LVDS time slots. I'm fine
> extending it, but we need to define it clearly. How would you envision
> it being used in this case ?
> 

Well, clearly the data-width/data-shift approach does not solve all
problems: what do you do if the source R pins are connected to the sink
B pins? Well, the first answer would probably be 'have a serious
discussion with the HW designer responsible for this insanity' :-), but
once you've passed this 'WTF' stage, you'll have to find a way to tell
the source component it should use RGBxyx while the sink should use
BGRxyx (or vice-versa). This is something you can't extract that from
those width/shift props though. My suggestion would be to have one
string per MEDIA_BUS_FMT definition, so we can force things at the DT
level if we really have to. That's basically what the interface-pix-fmt
property was doing, except we would standardize the prop and values and
probably provide helpers so bridge elements don't have to parse this
prop manually.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
