Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CDB6D64
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3356FF60;
	Wed, 18 Sep 2019 20:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149E6FF67
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 20:16:20 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B2B321927;
 Wed, 18 Sep 2019 20:16:19 +0000 (UTC)
Date: Wed, 18 Sep 2019 22:16:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: sun8i-ui/vi: Fix layer zpos change/atomic modesetting
Message-ID: <20190918201617.5gwzmshoxbcxbmrx@gilmour>
References: <20190914220337.646719-1-megous@megous.com>
 <20190918141734.kerdbbaynwutrxf6@gilmour>
 <20190918152309.j2dbu63jaru6jn2t@core.my.home>
MIME-Version: 1.0
In-Reply-To: <20190918152309.j2dbu63jaru6jn2t@core.my.home>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568837780;
 bh=0jWrdETYu7QZ6nLUVrv66CQvk9+vFSveR8OObhBCino=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=EFgyMRfQj+z7INZY4gk4LkQGc+RqodGEvpbG64mfh86DvbU+un9q2XvuNyMSJF19y
 e7Ms4hV+8A+0wJ156gguMKhnJ0q197TzBP95/NqDL3Q7DmZbXJH85EiV1q6ETqnWB0
 xuMTzwPMSHKmqEeyaaPIfA8e1RwymHwPmxOuWJ/4=
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
Content-Type: multipart/mixed; boundary="===============1276841443=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1276841443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tk4bbuln473dg4yq"
Content-Disposition: inline


--tk4bbuln473dg4yq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 05:23:09PM +0200, Ond=C5=99ej Jirman wrote:
> Hi,
>
> On Wed, Sep 18, 2019 at 04:17:34PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Sun, Sep 15, 2019 at 12:03:37AM +0200, megous@megous.com wrote:
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > There are various issues that this re-work of sun8i_[uv]i_layer_enable
> > > function fixes:
> > >
> > > - Make sure that we re-initialize zpos on reset
> > > - Minimize register updates by doing them only when state changes
> > > - Fix issue where DE pipe might get disabled even if it is no longer
> > >   used by the layer that's currently calling sun8i_ui_layer_enable
> > > - .atomic_disable callback is not really needed because .atomic_update
> > >   can do the disable too, so drop the duplicate code
> > >
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> >
> > It looks like these fixes should be in separate patches. Is there any
> > reason it's not the case?
>
> Bullet points just describe the resulting effect/benefits of the change t=
o fix
> the pipe control register update issue (see the referenced e-mail).

It's definitely ok to have multiple patches needed to address a single
perceived issue.

A commit is not about what you're fixing but what you're changing. And
the fact that you have tha bullet list in the first place proves that
you have multiple logical changes in your patch.

And even then, your commit log mentions that you're fixing multiple
issues (without explaining them).

> I can maybe split off the first bullet point into a separate patch. But
> I can't guarantee it will not make the original issue worse, because it m=
ight
> have been hiding the other issue with register updates.
>
> The rest is just a result of the single logical change. It doesn't work
> individually, it all has the goal of fixing the issue as a whole.
>
> If I were to split it I would have to actually re-implement .atomic_disab=
le
> callback only to remove it in the next patch. I don't see the benefit.

Your commit log says that you remove atomic_disable. Why would you
remove it, to add it back, to remove it again?

Maxime

--tk4bbuln473dg4yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYKQkQAKCRDj7w1vZxhR
xf8DAP9GfuXKiu3V08w0e+632ZjU7AktNEcXwFiyue0LwCXXDQEAhgjDhYaEmgtB
PS6Q2gQ7ymKhYKJ1fiSUPtE0JM/QOQA=
=Yn7Q
-----END PGP SIGNATURE-----

--tk4bbuln473dg4yq--

--===============1276841443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1276841443==--
