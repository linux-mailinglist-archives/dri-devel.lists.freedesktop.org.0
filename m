Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9302F461D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7E76E0C9;
	Wed, 13 Jan 2021 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880C289938
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 16:24:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4AFFF1F45463
Received: by earth.universe (Postfix, from userid 1000)
 id DE9713C0C94; Tue, 12 Jan 2021 17:24:54 +0100 (CET)
Date: Tue, 12 Jan 2021 17:24:54 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomi Valkeinen <tomba@kernel.org>
Subject: omapfb removal (was: Re: [PATCHv1] video: omapfb2: Make standard and
 custom DSI command mode panel driver mutually exclusive)
Message-ID: <20210112162454.hfzj5bxy7e6zlccl@earth.universe>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
 <20210108195839.GA1429715@ravnborg.org>
 <20210112120246.ujhjyylrlgfrfvig@earth.universe>
 <4b39c036-fb70-4a5b-ddda-08ce2f0a6db5@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4b39c036-fb70-4a5b-ddda-08ce2f0a6db5@kernel.org>
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0555317236=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0555317236==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogcdqsrw7fdsgqmh"
Content-Disposition: inline


--ogcdqsrw7fdsgqmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[dropped linux-next from Cc]

Hi,

On Tue, Jan 12, 2021 at 03:10:56PM +0200, Tomi Valkeinen wrote:
> >> But why is it it we need omapfb at all when we have omapdrm?
> >=20
> > I think there are two reasons omapfb has not been killed yet. One
> > reason was missing support for manually updated DSI panels, which
> > have been working since 1 or 2 kernel releases now. The other reason
> > is some people using it in combination with an out-of-tree PowerVR
> > kernel driver. There is currently work going on to use a more recent
> > PowerVR driver based on omapdrm driven by Maemo Leste people.
>=20
> omapfb also has a custom sysfs API, so applications that depend on it
> would not work anymore. I don't know if there are such applications, thou=
gh.
>=20
> >> Can we sunset all or some parts of omap support in video/?
> >> If not, what is missing to do so.
> >=20
> > IDK the exact status of the PowerVR work and have not been using
> > omapfb myself for years. I don't think there is a reason to rush
> > this, so my suggestion is removing it in 3 steps giving people
> > the chance to complain:
> >=20
> > 1. Add 'depends on EXPERT' to 'FB_OMAP2' and add deprecation notice
> >    referencing omapdrm in help text in 5.12
> > 2. Add 'depends on BROKEN' in 5.13
> > 3. Drop drivers/video/fbdev/omap2 afterwards
>=20
> I'd love to remove omapfb, but I also fear that there are still people
> using it. We can try the above sequence, but it's probably better to go
> slower, as people may not be using the latest kernels.

I thought about this again and I think the best option is to rename
CONFIG_FB_OMAP2 to something like CONFIG_FB_OMAP2_DEPRECATED and
update the help text. That way anyone with CONFIG_FB_OMAP2 in
their .config will definitely notice the change when upgrading to
a newer kernel, but can easily fix it temporarily. Help text could
be

"This driver will be removed in 2022, please switch to omapdrm."

and no other intermediate steps are required that way :)

But while looking through CONFIG_FB_OMAP2 references I noticed there
is also a V4L2 driver (CONFIG_VIDEO_OMAP2_VOUT), which seems to
only work with omapfb. IIUIC that driver provides display overlays
to V4L. I guess on omapdrm V4L can use DRM planes instead and no
driver is needed (i.e. this driver could just go away with omapfb)?

-- Sebastian

--ogcdqsrw7fdsgqmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/9zU8ACgkQ2O7X88g7
+pr9vQ//Wurb5B8uHiEeZ7CYL8PnEnfSM/2qv06cU38Yqn0Ci4kZGvcZtyfWaKHn
XZ918kT3MzG8Y5qI8VH67fLF8LbUct0mqNm4sKsTdGy72C8Tw4iaQaWkBLWW7yVc
Cjti9FbljkYfBI36x1Kj6AMQBAkb0Zfi5vBmCFv0OQs7HnsEO4uD6yeD4b4rXRvl
4mm8naWndQCKD0yP+YDRfENg1guZuOinGIJBBfMpX4hf6WM31zjclLTBoC5hcY7G
ZPWjnqFZO0D0gP9opnmfnn3OlQKWO07Cu2CVmD1jikF6eD1KXjMl+eP1vTYdxH/x
TFrFEcTnNCPqrm0CILZr3xBEG1qeetAnaf16QcqWHMusZFvNLL+f2ltKnhiQ8CUI
JwjnxVADyCg2185R++ByYfDidGDxW+2Fdx1Ylg17XlSObIX0cMxk+O9v6vBz2K9c
GAVMWRrE8q+OO5brhPvY9VtqAdyKuGpRrcpFWlVAJK44xo4P0Q8L7+pquANe+PVw
wINsAPNHp52AewrnCZjnM8QxpTtq+n4gL6c0UhWFrZdyQLxpfTVfNr0dOfTRn6xs
Aj5wvJ6bSe90PH1XvXzOPIWZdY3G92XoY6op2eZHIewEarlimifMrjFRGgXUww2c
mjyrTqqhzdRU5UwmtiR4E84Lpdha4nHZ16WgPdZZFDcj/h5FdI0=
=mgmT
-----END PGP SIGNATURE-----

--ogcdqsrw7fdsgqmh--

--===============0555317236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0555317236==--
