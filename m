Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BA946DBBB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 20:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE516E044;
	Wed,  8 Dec 2021 19:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA9D6E044
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 19:00:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94AEDB6C;
 Wed,  8 Dec 2021 20:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638990018;
 bh=xP/HJwclbv3GF7vnqrU0J6DNf0Kyn0iJpJC39G0OwJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAthFaj4YCE6DY2zI8AjIk5F87w1MEIMbDfUfCK+AjiICac0d50Etg1dF+gaxItfX
 wrN9uAfcSglgNrVw3EAa1a8FFiEfaWpq32wfRTKWnogQFKGm7nttOJAxKIcSbo7Fo0
 YQPTbhtfwkZdYmtkHjyYkYD8jMUriu06brk7LRTo=
Date: Wed, 8 Dec 2021 20:59:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
Message-ID: <YbEApc0JAKZ1vcrJ@pendragon.ideasonboard.com>
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
 <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
 <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, Dec 08, 2021 at 07:23:25PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 8, 2021 at 7:00 PM Laurent Pinchart wrote:
> > On Wed, Dec 08, 2021 at 11:57:21AM +0000, Kieran Bingham wrote:
> > > Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > > > Use the dev_err_probe() helper, instead of open-coding the same
> > > > operation.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> > > >         /* DRM/KMS objects */
> > > >         ret = rcar_du_modeset_init(rcdu);
> > > >         if (ret < 0) {
> > > > -               if (ret != -EPROBE_DEFER)
> > > > -                       dev_err(&pdev->dev,
> > > > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > > > +               dev_err_probe(&pdev->dev, ret,
> > > > +                             "failed to initialize DRM/KMS\n");
> > >
> > > I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> > > Seems like a nice feature when exploring devices that are still waiting
> > > to probe. Is the message still appropriate enough in that case?
> >
> > It's a very generic message, so it's not ideal. One issue is that
> > dev_err_probe() replaces any currently stored probe deferral reason
> > message, which means that we'll override any message previously set. We
> > don't set any message now, but we should (in rcar_du_encoder_init(),
> > there are two main code paths where -EPROBE_DEFER is expected), so this
> > patch would then get in the way I'm afraid.
> 
> If rcar_du_encoder_init() will handle the printing of errors, there is indeed
> no more reason for rcar_du_probe() to do that, so the existing dev_err()
> with the fuzzy message can be removed?

We could drop the above message indeed, at least once all the error
paths deeper in the call stack will print a detailed message. The
message here is useful in case an error path forgets to print anything,
to avoid the worst case of probe() failing silently.

-- 
Regards,

Laurent Pinchart
