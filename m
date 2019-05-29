Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B2E2E7B8
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 23:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC57B6E12B;
	Wed, 29 May 2019 21:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14606E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 21:55:34 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC5D32424C;
 Wed, 29 May 2019 21:55:33 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id 95E1A3C08D3; Wed, 29 May 2019 23:55:30 +0200 (CEST)
Date: Wed, 29 May 2019 23:55:30 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 3/4] drm/omap: add framedone interrupt support
Message-ID: <20190529215530.mi3fjlsaziq22mw5@earth.universe>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-4-sebastian.reichel@collabora.com>
 <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
MIME-Version: 1.0
In-Reply-To: <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559166934;
 bh=8tg6OtL5MFGzZKrJoMJB7UCVwhRYE9ecDuehrbylaEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhsNXG1CTmyoHxGkmUUcWP5rPoURLlTpMYJVekDNvfwdm/eOFkHvMHKeM4JjEuAc8
 2VKe2MncqyaKKOOJHRxttOwx0NK5u7lAsgRIxwS+1YJv/JMNGUbCdeCRwMuDi2Gerj
 Yu1KlCX5j42F2LegJ7N3zdmUXvzd52OLnb59Zrew=
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2093615537=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2093615537==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk4bpbyorxuwmmmt"
Content-Disposition: inline


--gk4bpbyorxuwmmmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, May 28, 2019 at 01:19:01PM +0300, Tomi Valkeinen wrote:
> Hi Sebastian,
>=20
> On 23/05/2019 23:07, Sebastian Reichel wrote:
>=20
> > @@ -302,6 +328,30 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
> >   	DBG("%s: apply done", omap_crtc->name);
> >   }
> > +void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
> > +{
> > +	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> > +
> > +	if (!omap_crtc->framedone_handler) {
> > +		dev_warn(omap_crtc->base.dev->dev, "no framedone handler?");
> > +		return;
> > +	}
>=20
> This triggers on normal displays.
>=20
> FRAMEDONE is an interrupt we get when DISPC's output videoport is being
> turned off. It's raised after the last frame has been finished (i.e. the
> DISPC is truly done with that videoport).
>
> We get it for both conventional displays (when the display is turned off)
> and for DSI command mode (when a single frame has been sent), as in both
> cases the videoport is disabled after the operation. For conventional
> displays, you can think FRAMEDONE as the last vsync.

Ok, but it should only trigger when framedone irq is enabled. This
commit adds the required infrastructure, but does not call=20
omap_irq_enable_framedone() anywhere. The next commit enables it,
but only for manually updated displays.

> We also have special handling for FRAMEDONE in omap_crtc_set_enabled(),
> which is used to get the drm driver to wait for FRAMEDONE when disabling =
the
> display. I wonder if this separate framedone handling might somehow confl=
ict
> with that code. And/or should these be somehow combined.

Oh sorry, I missed the part that omap_irq_wait_init() actually
enables the framedone irq. It should be enough to just drop the
warning (and the curly brackets) to keep existing behaviour. The
code exits early with the above warning for any existing code (since
that does not register a framedone handler). DSI on the other hand
does not reach the omap_irq_wait_init() part. Regarding combining
the logic: I don't think there is anything to combine right now.
It should be possible to simplify the logic after DSI has been
converted to drm_panel style, since this will move the update logic
for the screen content from the panel driver to DSI core.

TLDR: It's enough to remove the warning. Do you need a new
submission for this?

-- Sebastian

--gk4bpbyorxuwmmmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlzu/88ACgkQ2O7X88g7
+ppQsBAAoKxzg9EBL5zgLidy/H5+kl5O9fBNmxwIG1is6UEYr59RggjmuhjPrWTt
x5PAX6d8E+wVjKftGMTPBhswhf0p2TAUbx9cmnYk4lUj0y4ldpmtIy8AlBVOIy4d
I6KEacBFwh58XOkHhAJoQSjUpoaVAMG98bJmebk11Vo+XAB6czmihkFyaN0d8YJ/
Sw6KRFcvJatiCUEvRFoSwE8lKiimpHW163jUiT1ChOp/F5etGMli7mMmWNGskdvk
zM8KbbcmbV3lnyGO5xEunK7T60sWE6djb7dQokd5bTCWXvG9Pm+sB/cLkktou0KY
jPhOdga5Pwq1rXVWgeGbz9mLiKtN0MBpNW62hso560lXJbd64a6D61FTQ6PQC/4g
vT0eWS5e+ZrqJnC7AMyYtbCUq7LEwbMKDel0VAX0/ZHC0nMUhJ7AKVir6PeL0YoM
mCOi8WrTGc6AIeVfVCZLv3jCf69SnjA1OKaMD63JuchgMhAQsO/sm44+YbvO7MA7
nFzDF9CobrlVWOWAgpbKJXG1MmSzZa4wbrTdro+qV4ZqRdVMD/KVGBZViEMNBhhk
RsdEKM+dORLozb7oavHnXPs/VrT6A67AOkNcfDTSyFhSzJKdNohF4TvEuX9GiQGa
HE2cRWUnFIljtvyKld/yhZ2cNck8RQKOXQmXXAC4XwdA9NqMNjQ=
=wUyO
-----END PGP SIGNATURE-----

--gk4bpbyorxuwmmmt--

--===============2093615537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093615537==--
