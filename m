Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8321778A1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F776EA70;
	Tue,  3 Mar 2020 14:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669C6EA70
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:20:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g83so3032529wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1IMBPu8QG1MBzd8j3RLJql++kJXHVabHbO4n7XLZoJw=;
 b=adW711yOd7N4INkl2O0wcByZSEsVP5pkAH4EdDQjipS4wYpCJ+oz1wvVBC7jist5uj
 IS8ygym0NK9fy6G5ejE0RjEKCIcxh+uuSH83XC2xcPRY2Nv1xgoJmTSueoqXkYXpXKO2
 DhQ2eDC7bq1zGUKreHHbjeXH+d+jckWwfFBv4pYqAHp+9+BboVTYEA3yBwfOXk/bsd0f
 I2JB5Mj/M/UnHkFTSo8ThvKgmwpRl2n3nevQLKWZejkrut/MYfyd0kol9cZa52eDx3AV
 gSO7rGuUH3vj8AjDWifUglxiYK+dI3C7q7RfbWxSrL1wSsIJRGARqWf8l9hmsK5jw1IK
 FxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1IMBPu8QG1MBzd8j3RLJql++kJXHVabHbO4n7XLZoJw=;
 b=HPeMxPgsQBLUpqjMw5BSSu2bHruijCwUcjvB8oX/ZfZ9AvT6/sTnYP7WrJU7U1fbZ3
 tPmwewSLK4YqPVn0Pe2PDuY460suKt0Jt6IuMoaEufl0JiPhL1RqYre7fDiTu2Gy9AJz
 VmwgxSZiIX5DGl8tpvNl4Knpd4qtpZhgjfEb66cR3iXeacgJOs+CCPbPx2/ZKHt8AH9J
 ZFE4ZB7oTrCpssGtLOAN+MuGFJ9S8IpFlghegALsgjwkK3olUEzn2qTlcIi2ruFdyMmc
 RJxnzVKy59QIf5htPOZknOfxmX0I3o+Ec4VXnL2FYZ21qzhwYZ6Xo0FvaELaHTHTS8Of
 sz4w==
X-Gm-Message-State: ANhLgQ2x56yQlvr6XFVe+T3Yeh0N8/CKlbEfWpTUN3vEFkpJgT114nPP
 9O7lErr77gA30UDD3iLInaZyLNjx
X-Google-Smtp-Source: ADFU+vsgqqcozmP1Zrk1PIIdeBW8OyzxefWANyVwCxLfYLJjvCd85BEZ7bI2e3mRm54VoUNOSvk9rw==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr4547625wmi.0.1583245234875;
 Tue, 03 Mar 2020 06:20:34 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
 by smtp.gmail.com with ESMTPSA id l3sm33284552wrq.62.2020.03.03.06.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:20:32 -0800 (PST)
Date: Tue, 3 Mar 2020 15:20:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Message-ID: <20200303142031.GA2856480@ulmo>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
 <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
MIME-Version: 1.0
In-Reply-To: <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: Gustaf =?utf-8?Q?Lindstr=C3=B6m?= <gl@axentia.se>,
 Thierry Reding <treding@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1312129974=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1312129974==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 10:53:56PM +0000, Peter Rosin wrote:
> On 2020-03-02 21:34, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >=20
> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> >=20
> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
>=20
> TL/DR; I do not care if you change the refresh rate or the dotclock.
>=20
> The whole entry for that panel in simple-panel is dubious. The panel
> is really an LVDS panel (capable of both VESA/Jeida RGB888, selectable
> with the SELLVDS pin).  With Jeida you can, as usual, omit the 4th
> data channel and use the panel with RGB666. In either case, you need
> an LVDS signal and nothing else...
>=20
> The panel can also rotate the picture 180 degrees using the RL/UD pin.
>=20
> These options are of course not expressed in the simple panel driver
> (and we have always used fixed signals for those pins in our designs,
> IIRC). As far as I'm concerned, the panel can be removed from
> simple-panel. Our device trees are nowadays correctly expressing the
> hardware with an LVDS encoder between the RGB output and the panel
> and points to the panel-lvds driver for the panel.

How do you make sure that you always bind against the correct driver? If
it matches simple-panel and panel-lvds, it's not deterministically going
to pick the right one. Well, it may actually be deterministic on Linux,
but perhaps only by accident.

> The reason that it is as it is, is that we obviously didn't understand
> what we were doing when we added the entry, and this garbage was what
> we came up with that produced a picture.
>=20
> If you want to keep the panel in simple-panel despite all this, the
> timing constraints are as follows:
>=20
> Pixel clock         50-80 MHz,        65 MHz typical
> Horizontal period 1094-1720 clocks, 1344 typical
>                   16.0-23.4 us      20.7 us
> Horizontal enable    1024 clocks, always
> Vertical period    776-990 lines,    806 typical
>                   13.3-18.0 ms      16.7 ms
> Vertical enable       768 lines,  always
>=20
> Using a "long" (the datasheet is not very specific on this issue) vertical
> period may introduce deterioration of display quality, flicker etc.
>=20
> I don't think the division between front-porch/back-porch matters much.
>=20
> That said, I have no idea whatsoever if others have started using this
> panel entry. My guess is that it has zero users, but who can tell?

A quick grep shows that arch/arm/boot/dts/at91-nattis-2-natte-2.dts is
the only device tree that uses this panel in the upstream kernel.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5eZ60ACgkQ3SOs138+
s6HgYw//ev+d0bYF/0NnOE7G4xT67s6UoX84FiM9ZFiegKxLNOKQjNqyJkidqSmV
XejWK23gR9GF+IN+pRbpQ0W3dMGD+BUIM8OoBDegjiDNI7YACN8AioLjBDrORWhc
jDyMuPKXn/vuH2v/tZxTH3AWDnI3Ccz7pyqiSJqvu8y8zjRsseaRTsgrXzg6+wt7
O7+89c+pCPX/Ua/vKHqDJDFgkq5loxBJtaN3YCSBkB7Cp9FwNkCPG2XUy5aR5K+i
bzggXLrdsTdkdxv63yyTVW8x9Tl8+VyJwfwFgQLno0mCpGwM15s0CWdjHcrVO45m
B8R88CaWpvatjXkVfOWCw3eFTe7F+/2qXcrpMYzYd6tPPhgmhv3Gr3qtZ3tIZHFu
iUTZAgPyNXb9soUupE1yFLOqH1qjez4qFslLIMlOg3JZIacbxrzDxDygcXJgOHPx
wkYi07Q2p0mdU0yFlqfhjTpDR+XnZ+t8V1FsBUUCSYr7vyFekH8iReUV71mEoEU9
OfaQt76P5Kn96eVBZGF8iMl+DG2TIMSjLjwXz2jG6mt85V2MZAd2wpKaSanKQQss
ndjjCYUnYeUlkO4X+Kr+KKDoCbmPr/InWhcA1HuL8I6o1FnYtC5sjUXqCWZfY2qh
KrusysQerBdqL2Lnz4MxWGY35rZqWbJf1M3NYXjq6md0UHCxBE4=
=ZzT2
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

--===============1312129974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1312129974==--
