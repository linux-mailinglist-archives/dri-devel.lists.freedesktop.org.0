Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F65910D7E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3658210EB4F;
	Thu, 20 Jun 2024 16:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AaP934Zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771C410EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:48:33 +0000 (UTC)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B54B2B3;
 Thu, 20 Jun 2024 18:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718902092;
 bh=MREew7d1i5wtYVMnybEWVejPtKt2ElZ4CEhxcxyBoeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AaP934Zug+WTa5QeSDadGJri15Fk0gE9awiV9CZUYCxBOTtOB1aHWA1kKbsAsKU2f
 aHGjxOIPfsScec565BWoO6M2uUT+v0oYM0p7Po8bbIpLlLRGh4XfkWOBrF51TcfPyN
 5M4urAANJfiu734O6YsQRwrj0ZVhWvM5XE9qFq3s=
Date: Thu, 20 Jun 2024 18:48:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
Message-ID: <hs52ylzaes26kx3yj6eqfksvmoldsvdn3e4emo4q7ijkhdbe2r@wyxempul6cxm>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>
 <20240619194414.GD31507@pendragon.ideasonboard.com>
 <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert

On Thu, Jun 20, 2024 at 02:48:49PM GMT, Geert Uytterhoeven wrote:
> Hi Laurent, Jacopo,
>
> On Wed, Jun 19, 2024 at 9:46 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> > > Add support for R-Car R8A779H0 V4M which has similar characteristics
> > > as the already supported R-Car V4H R8A779G0, but with a single output
> > > channel.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> > >               dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> > >       rcar_du_group_write(rgrp, DORCR, dorcr);
> > >
> > > -     /* Apply planes to CRTCs association. */
> > > -     mutex_lock(&rgrp->lock);
> > > -     rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > > -                         rgrp->dptsr_planes);
> > > -     mutex_unlock(&rgrp->lock);
> > > +     /*
> > > +      * Apply planes to CRTCs association, skip for V4M which has a single
> > > +      * channel.
> >
> > " and doesn't implement the DPTSR register."
> >
> > I'm pretty sure writing it is still harmless, but...
> >
> > > +      */
> > > +     if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {
>
> Looking at the R-Car Gen3 docs, this check seems to be wrong, and the
> lack of a check might have been an issue before?


Not sure I got from your comment what part is wrong.

Reading below it seems you're suggesting that writes to DPTSR should
be skipped for some Gen3 boards as well ?

>
> Seems like the register (per pair) is only present if the second CRTC
> of a CRTC pair is present, so R-Car V3M and V3H (single CRTC) do not
> have DPTSR at all, and M3-W (triple CRTC) does not have it on the
> second pair.  M3-N does have both, as it lacks the first CRTC of
> second pair, but does have the second CRTC of the second pair.
>

/o\

So far however, all Gen3 SoCs you mentioned seem to work with DPTSR
being written and the BSP [1] only actually skips it for V4M.

What would you suggesting in this case ? Addressing gen3 as well ?
That's something that would require testing on all the above boards
thought.

Thanks
  j


[1] https://github.com/renesas-rcar/linux-bsp/commit/f2fc3314dab2052240653c1a31ba3d7c7190038e#diff-8bce6f4032dc891042e2561163754f49723ac119ae63df2425cc3487b432ee1cR206
> > > +             mutex_lock(&rgrp->lock);
> > > +             rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > > +                                 rgrp->dptsr_planes);
> > > +             mutex_unlock(&rgrp->lock);
> > > +     }
> > >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
