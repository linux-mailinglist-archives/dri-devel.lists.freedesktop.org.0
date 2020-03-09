Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3117E842
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A496E0D6;
	Mon,  9 Mar 2020 19:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D068F6E0DE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:23:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DF662D2;
 Mon,  9 Mar 2020 20:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583781789;
 bh=L2CbMLmQj02a+E0h03APUq01sYi8nN1czrN2WAxV75E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swndbCaPLCA61FX2xYACykl+gdNAdr4I4TX9KxzCu4jj+CsFkdjUwAWnxrp46GMiQ
 XvGeNfrGTMpXrMdk6OMrBuH/D0vXjCIBlx4+gd3OGA/ULl36IN87UpWwXzV0ZwVLxF
 KrHRZG+xl29l4esY27jqf1qbayjQkC986V+zS/4M=
Date: Mon, 9 Mar 2020 21:23:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
Message-ID: <20200309192306.GA20358@pendragon.ideasonboard.com>
References: <20191114131751.26746-1-marex@denx.de>
 <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

(CC'ing Boris)

On Mon, Mar 09, 2020 at 11:50:59AM +0100, Philipp Zabel wrote:
> On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:
> > The bus_flags and bus_format handling logic does not seem to cover
> > all potential usecases. Specifically, this seems to fail with an
> > "edt,etm0700g0edh6" display attached to an 24bit display interface,
> > with interface-pix-fmt = "rgb24" set in DT.
> 
> interface-pix-fmt is a legacy property that was never intended to be
> used as an override for the panel bus format. The bus flags were
> supposed to be set from the display-timings node, back when there was no
> of-graph connected panel at all.
> 
> That being said, there isn't really a proper alternative that allows to
> override the bus format requested by the panel driver in the device tree
> to account for weird wiring. We could reuse the bus-width endpoint
> property documented in [1], but that wouldn't completely specify how the
> RGB components are to be mapped onto the parallel bus.
> 
> [1] Documentation/devicetree/bindings/media/video-interfaces.txt

Things are funny sometimes, I've run into the exact same problem with a
different display controller today.

Shouldn't we use the data-shift property from [1] to specify this ?
Combined with Boris' bus format negotiation for bridges, I think we
would have all the components in place to solve this problem properly.
Bonus points if we can get a helper function that CRTC code can call to
get the bus format they should use without having to care about the
details (and just to be clear, no yak shaving here, I'm not asking Marek
to implement such a helper, it's not a blocking issue).

> I do wonder whether for your case it would be better to implement a
> MEDIA_BUS_FMT_RGB666_1X24_CPADLO though, to leave the LSBs untouched
> instead of risking to dump them into accidental PCB antennae.

That's a good point I haven't thought about, and I agree it makes sense.
It means that display controller drivers will have to explicitly support
MEDIA_BUS_FMT_RGB666_1X24_CPADLO and map it to MEDIA_BUS_FMT_RGB888_1X24
if the hardware doesn't support that feature, but I don't think that's a
big issue.

> > In this specific setup, the panel-simple.c driver entry for the display
> > sets .bus_flags to non-zero value. However, as imxpd->bus_format is set
> > from the DT property "interface-pix-fmt", imx_pd_encoder_atomic_check()
> > will set imx_crtc_state->bus_flags = imxpd->bus_flags even though the
> > imxpd->bus_flags is zero, while the di->bus_flags is correctly set by
> > the panel-simple.c and non-zero.
> >
> > The result is incorrect flags being
> > used for the display configuration and thus an image corruption.
> > (Specifically, DRM_BUS_FLAG_PIXDATA_POSEDGE is not propagated and thus
> > the ipuv3 clocks pixels on the wrong edge).
> > 
> > This patch fixes the problem by overriding the imx_crtc_state->bus_format
> > from the imxpd->bus_format only if the DT property "interface-pix-fmt" is
> > present or if the DI provides no formats. Similarly for bus_flags, which
> > are set from imxpd->bus_flags only if the DI provides no formats.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > To: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/imx/parallel-display.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> > index 35518e5de356..92f00b12c068 100644
> > --- a/drivers/gpu/drm/imx/parallel-display.c
> > +++ b/drivers/gpu/drm/imx/parallel-display.c
> > @@ -113,13 +113,16 @@ static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
> >  	struct drm_display_info *di = &conn_state->connector->display_info;
> >  	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
> >  
> > -	if (!imxpd->bus_format && di->num_bus_formats) {
> > -		imx_crtc_state->bus_flags = di->bus_flags;
> > +	if (imxpd->bus_format || !di->num_bus_formats)
> 
> I see no reason to invert the logic here. Let's keep the common case
> first.
> 
> > +		imx_crtc_state->bus_format = imxpd->bus_format;
> > +	else
> >  		imx_crtc_state->bus_format = di->bus_formats[0];
> > -	} else {
> > +
> > +	if (di->num_bus_formats)
> > +		imx_crtc_state->bus_flags = di->bus_flags;
> > +	else
> >  		imx_crtc_state->bus_flags = imxpd->bus_flags;
> > -		imx_crtc_state->bus_format = imxpd->bus_format;
> > -	}
> > +
> >  	imx_crtc_state->di_hsync_pin = 2;
> >  	imx_crtc_state->di_vsync_pin = 3;
> 
> So while I don't like this being used at all, I think the patch improves
> consistency, as imx_pd_connector_get_modes doesn't allow to override the
> panel's modes with DT display-timings either.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
