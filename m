Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD62B6866
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 16:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605B89A72;
	Tue, 17 Nov 2020 15:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5389A72
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 15:14:49 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-154-055.ewe-ip-backbone.de
 [95.33.154.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BDDE2466D;
 Tue, 17 Nov 2020 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605626088;
 bh=RKWhe1zJg5oWNbQtoZNuGthT/sS3NH8TSJT/AcMJPdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ThhGTPQlwEVQeGxUwVtisQLbFF4xauGy1RErwm/HaW7V5JKkTNg3gasuNb+B58L0t
 c4uMPvq661PZQXduSgdcwA7dwE249BDKyELPLUZYZFjRSCphsyNL0C6bN7DQZyxA5z
 qycjGko7dYgZgbOjsQ0ZRaXuWzc9plf7XZsIML54=
Received: by earth.universe (Postfix, from userid 1000)
 id 569DD3C0C8E; Tue, 17 Nov 2020 16:14:46 +0100 (CET)
Date: Tue, 17 Nov 2020 16:14:46 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 08/10] drm/fb-helper: Restore damage area upon errors
Message-ID: <20201117151446.bqbhbt2tqijjmj2h@earth.universe>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-9-tzimmermann@suse.de>
 <20201116205216.GH401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201116205216.GH401619@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0310238219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0310238219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jie5y2ni6gpyalfq"
Content-Disposition: inline


--jie5y2ni6gpyalfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2020 at 09:52:16PM +0100, Daniel Vetter wrote:
> On Mon, Nov 16, 2020 at 09:04:35PM +0100, Thomas Zimmermann wrote:
> > If the damage handling fails, restore the damage area. The next invocat=
ion
> > of the damage worker will then perform the update.
> >=20
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index 2e1a335bafd2..13b65dad2ca8 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -431,11 +431,28 @@ static void drm_fb_helper_damage_work(struct work=
_struct *work)
> >  	if (helper->buffer) {
> >  		ret =3D drm_fb_helper_damage_blit(helper, &clip_copy);
> >  		if (ret)
> > -			return;
> > +			goto err;
> >  	}
> > =20
> > -	if (helper->fb->funcs->dirty)
> > -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> > +	if (helper->fb->funcs->dirty) {
> > +		ret =3D helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy,=
 1);
> > +		if (ret)
> > +			goto err;
>=20
> I think this is unexpected enough that we should put some drm error
> printing here I think.

Note, that the dirty framebuffer routines are used by the
framebuffer console. Printing warnings means another line
in the framebuffer console and thus another call to the
dirty routines. Assuming the problem does not get solved
magically the system will be busy printing warnings forever.
I have been through that fun while working on the OMAP DSI
command mode patches and I suggest to only do ratelimited
logging in the code related to damage tracking.

-- Sebastian

--jie5y2ni6gpyalfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl+z6N8ACgkQ2O7X88g7
+pq4Uw//YYf/Kvu/XuqvoynON3WG/gBC/RWvLuGoIWyumdNqE1YwCLHyIlBJKH/y
0xNkngkV+slPQZqKEbwvXTSUOdEqyUurw4rjBYS5aFuxW/uWoyQCEOWXhV6OMECB
IknbWCzFT390gth98vZiv4Ka8DROSZ5ryG/+2+g6Cz6RAO06IYZRFA/kLgz4CXTN
BtwInVk8mXYBQaSZhPKerSEhukxQ2a83B81evV46drBC2LJLPxJo2WdJdxcZSC/o
CPfEO0VWvHCYuMJ4FM3+KyaEpBllDsjFWm530t4fYa5cSScPYr5S/H87BE851t4B
y/8asiHiBTpsjSzJdLDzsLe6rNTi1Qb9rebP6nsYSWh2gSYWt5OvzSroUS5oHt4m
nYtHRsRUfzmqJ1gvyg9d6iYY9B/imxtaaFHQLuZT1fotmkEODeOgKIeJmT1Lf1/F
NbVhHljhRjQ0lQIZlg6Vs54ZzTxezLJcXSMkDqWuwYdqfXVXKkciUwyy/pL85h+x
tR9KbSwxNCgYpxnFznGIv10/JVt3bKbpY2zNqkO/34CGRpg1rX9fPxdO1KNCnUll
W/fYkTIU6Fr08wnmSPjAEFEgMWrC72SJG+hAcwh0jSDP2ep6Peu5YeQvBDnM6S4T
UnTTBwSy37D3zflYULNI/MKDs6v3gE14ySZHmF4pQmhHbqJQBDs=
=jDEf
-----END PGP SIGNATURE-----

--jie5y2ni6gpyalfq--

--===============0310238219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0310238219==--
