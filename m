Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0F617E975
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB836E525;
	Mon,  9 Mar 2020 19:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE96E525
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:59:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ED1B4BAB;
 Mon,  9 Mar 2020 20:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783969;
 bh=9HPzE7v0X5C4I5Gj+pgKvWNjSp7g0CtAz1oCtlZ15GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ScqnMUjBQQuy3ahDHVkCtaxP/TOCfGKlio0goqXw4vNBk05m348YYiB64Nxi5IfD9
 wEYpFEmkEAHk33Re49CCw+AcnrnAErMyJbIXeftdCZNs0QHMwVl7UPXDokRs9Zai+h
 9S+rdSuMRA6BcKC0T2ZZCFxEtB8ynPtDRIeFlcNU=
Date: Mon, 9 Mar 2020 21:59:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
Message-ID: <20200309195926.GC4916@pendragon.ideasonboard.com>
References: <20191114131751.26746-1-marex@denx.de>
 <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
 <20200309192306.GA20358@pendragon.ideasonboard.com>
 <20200309205559.3c860aae@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309205559.3c860aae@collabora.com>
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

On Mon, Mar 09, 2020 at 08:55:59PM +0100, Boris Brezillon wrote:
> On Mon, 9 Mar 2020 21:23:06 +0200 Laurent Pinchart wrote:
> > On Mon, Mar 09, 2020 at 11:50:59AM +0100, Philipp Zabel wrote:
> > > On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:  
> > > > The bus_flags and bus_format handling logic does not seem to cover
> > > > all potential usecases. Specifically, this seems to fail with an
> > > > "edt,etm0700g0edh6" display attached to an 24bit display interface,
> > > > with interface-pix-fmt = "rgb24" set in DT.  
> > > 
> > > interface-pix-fmt is a legacy property that was never intended to be
> > > used as an override for the panel bus format. The bus flags were
> > > supposed to be set from the display-timings node, back when there was no
> > > of-graph connected panel at all.
> > > 
> > > That being said, there isn't really a proper alternative that allows to
> > > override the bus format requested by the panel driver in the device tree
> > > to account for weird wiring. We could reuse the bus-width endpoint
> > > property documented in [1], but that wouldn't completely specify how the
> > > RGB components are to be mapped onto the parallel bus.
> > > 
> > > [1] Documentation/devicetree/bindings/media/video-interfaces.txt  
> > 
> > Things are funny sometimes, I've run into the exact same problem with a
> > different display controller today.
> > 
> > Shouldn't we use the data-shift property from [1] to specify this ?
> > Combined with Boris' bus format negotiation for bridges, I think we
> > would have all the components in place to solve this problem properly.
> 
> I wonder if we shouldn't take more complex pin mappings into account
> now and go directly for a data-mapping property describing those
> mappings using a string. This way we'd have a single property that
> would work for both fully parallel buses (DPI/RGB) and serial (or
> partially parallel) ones (LVDS).

I'm all for standardization, but I'm not sure data-mapping is the right
property, at least with its current definition. It's really meant to
describe how individual bits are mapped to the LVDS time slots. I'm fine
extending it, but we need to define it clearly. How would you envision
it being used in this case ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
