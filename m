Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31823813AC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1666E2B4;
	Mon,  5 Aug 2019 07:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EF66E2A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 07:49:51 +0000 (UTC)
Received: from uno.localdomain
 (host150-24-dynamic.51-79-r.retail.telecomitalia.it [79.51.24.150])
 (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A1E3A240004;
 Mon,  5 Aug 2019 07:49:45 +0000 (UTC)
Date: Mon, 5 Aug 2019 09:51:09 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190805075109.oe6slqetqoe5wqzr@uno.localdomain>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
 <20190801151129.GF5024@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190801151129.GF5024@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: fabrizio.castro@bp.renesas.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: multipart/mixed; boundary="===============1745099436=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1745099436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f6oy4oxrt3xzydfx"
Content-Disposition: inline


--f6oy4oxrt3xzydfx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Aug 01, 2019 at 06:11:29PM +0300, Laurent Pinchart wrote:
> Hello Jacopo,
>
> Thank you for the patch.
>
> On Tue, Jul 23, 2019 at 06:57:00PM +0200, Jacopo Mondi wrote:
> > The R-Car LVDS encoder units support dual-link operations by splitting
> > the pixel output between the primary encoder and the companion one.
>
> s/the companion one/its companion/
>
> >
> > In order for the primary encoder to succesfully control the companion's
> > operations this should not fail at probe time and register itself its
> > associated drm bridge so that the primary one can find it.
>
> This is hard to parse.
>

Re-reading the whole commit message, I would actually drop it
completely, it's enough what we have here below.

> > Currently the companion encoder fails at probe time, causing the
> > registration of the primary to fail preventing the whole DU unit to be
> > registered correctly.
> >
> > Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> > Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > The "Fixes" tag refers to a patch currently part of the
> > renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.
> >
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 31 +++++++++++++++++++++--------
> >  1 file changed, 23 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index bada7ee98544..8b015ba95895 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -767,14 +767,29 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >  	of_node_put(remote_input);
> >  	of_node_put(remote);
> >
> > -	/*
> > -	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
> > -	 * used for the DPAD output even when the LVDS output is not connected.
> > -	 * Don't fail probe in that case as the DU will need the bridge to
> > -	 * control the clock.
> > -	 */
> > -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> > -		return ret == -ENODEV ? 0 : ret;
> > +	switch (ret) {
> > +	case -ENODEV:
> > +		/*
> > +		 * On D3/E3 the LVDS encoder provides a clock to the DU, which
> > +		 * can be used for the DPAD output even when the LVDS output is
> > +		 * not connected. Don't fail probe in that case as the DU will
> > +		 * need the bridge to control the clock.
> > +		 */
> > +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> > +			ret = 0;
> > +		break;
> > +	case -ENXIO:
> > +		/*
> > +		 * When the LVDS output is used in dual link mode, the
> > +		 * companion encoder fails at
> > +		 * 'rcar_lvds_parse_dt_companion()'. Don't fail probe in
> > +		 * that case as the master encoder will need the companion's
> > +		 * bridge to control its operations.
> > +		 */
> > +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> > +			ret = 0;
>
> As -ENXIO can only be returned by rcar_lvds_parse_dt_companion(), and
> rcar_lvds_parse_dt_companion() is only called when the
> RCAR_LVDS_QUIRK_DUAL_LINK flag is set, this essentially means that you
> always zero the error returned from rcar_lvds_parse_dt_companion(). This

Not totally correct, as rcar_lvds_parse_dt_companion() might also
return EPROBE_DEFER, but...

> is both complicated and too drastic as the second -ENXIO error case
> shouldn't be ignored. It would be better and simpler to return 0 from
> rcar_lvds_parse_dt_companion() when the renesas,companion property can't
> be found.

I agree, returning 0 when when the property is not specified is enough
and much simpler. I got dragged away by the idea of centralizing error
handling at the end of the function, but it's ugly and also wrongly
zeroes the second -ENXIO error returned by the parse_companion
function.

I'll change to what you suggested!
Thanks
  j

>
> > +		break;
> > +	}
> >
> >  	return ret;
> >  }
>
> --
> Regards,
>
> Laurent Pinchart

--f6oy4oxrt3xzydfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1H3+0ACgkQcjQGjxah
VjxYkxAAlzArBpJQTnAx+2BDrFdNyuVKxAzyoEexaV7boeg586M5iV8fTmgjScff
4KA54u80j8KxeK9adk7cqeqH1wPi+DkkMomFRPpJzUHrwlVpwPXoVERWOIYEVV4Y
XA4f+xUHBjm0Ftxx9XJPKEbFyFkJYFZLZyl9r3a0PVccA3yikoQqPBP4FX7xrALM
lAj/o14JXh0voNbK7k6w+LjM1JieofeJjXk59FmeKrIDy9pvM6IlvBQsC7hSmPZ7
hsOiKk0kEjMA89aVAPnyhq7vP79F4q3A2C0XjUwgv/hO6JTD7zWVTc1/TItzajQV
6WmnHMM9CUiKDD1Oo2O25fzBjmbNpm+HMclxxoF2IGGgDpRph4rbKio+NjmIDc/A
myw7qRfM9juRgGOFXYwQgDpQY/tmaqKhr+hTodwj/BKUwIDzk1l5BfN/JGASEgxQ
aj2KtNJdTyor7wTktGJ1yFWoBRUsVanGwf/fnOPhMqLlPNz/cdjmR3qjQYimjCLs
G+GLCmlx9it5ZCnM6xhLj6JhysKpHONJGzbbXQqPoBgA3O0IjoOFg1PS3qztEjSg
bB5XBKLVSnNNq5Yb7DBWnH+5H7j3iFwK2gXHdSrC/PJnNqeN5DLMFJvJkpmlfwb7
jLHPMhBT58VN8f9YDS+Y5RUByO3tv0SvVm+nO/KI4i8xfbG+5n8=
=lvdp
-----END PGP SIGNATURE-----

--f6oy4oxrt3xzydfx--

--===============1745099436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1745099436==--
