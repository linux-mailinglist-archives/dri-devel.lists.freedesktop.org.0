Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC14B8AEB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79CD6EA02;
	Fri, 20 Sep 2019 06:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94266EA02
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:12:11 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2369F20665;
 Fri, 20 Sep 2019 06:12:10 +0000 (UTC)
Date: Fri, 20 Sep 2019 08:12:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/sun4i: Use vi plane as primary
Message-ID: <20190920061209.ostddxvzf6xwrmdp@gilmour>
References: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
 <20190919171754.x6lq73cctnqsjr4v@gilmour>
 <104595190.vWb6g8xIPX@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <104595190.vWb6g8xIPX@jernej-laptop>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568959931;
 bh=LFxPD7bXEN0iUHzSgV2IAaqhJMR9jcy71uqdbxqIPmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VPUqzg6q9sM0ka6k4geicLtzFC4DJG+pHllGG5x2r85z9Orqm1+AtNmbw90l2ki4V
 EQzuvzBXyZU9ZNusHhrEERZWTEk77Rb0MC4FOuHcd5eoB1yAByb00w+7EN9eg3Kxwl
 nDD+yjxYFJcACzDu/0nZvIpNJMG+8RMI8WxBoOgE=
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
Cc: roman.stratiienko@globallogic.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0123141700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0123141700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3ylh7nsjnj6zhso3"
Content-Disposition: inline


--3ylh7nsjnj6zhso3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 08:15:49PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 19. september 2019 ob 19:17:54 CEST je Maxime Ripard na=
pisal(a):
> > >
> > > Tested on Android.
> > >
> > > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > It sounds like a workaround more than an actual fix.
> >
> > If the VI planes can't use the alpha, then we should just stop
> > reporting that format.
> >
> > Jernej, what do you think?
>
> Commit message is misleading. What this commit actually does is moving pr=
imary
> plane from first UI plane to bottom most plane, i.e. first VI plane. Howe=
ver, VI
> planes are scarce resource, almost all mixers have only one. I wouldn't s=
et it
> as primary, because it's the only one which provide support for YUV forma=
ts.
> That could be used for example by video player for zero-copy rendering.
> Probably most apps wouldn't touch it if it was primary (that's usually
> reserved for window manager, if used).

Yeah, we definitely don't want to use it as primary and prevent the
video display.

> I left few formats with alpha channel exposed by VI planes, just because =
they
> don't have equivalent format without alpha. But I'm fine with removing th=
em if
> you all agree on that.

If there's no alpha support, then yeah, we shouldn't expose the format
at all, and then we can either add the new formats, or just not expose
them if they are exotic enough.

Maxime

--3ylh7nsjnj6zhso3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYRtuQAKCRDj7w1vZxhR
xeqxAP47vhP9Zt2VoOykoxUSb+0IORx7/qZJWXiMTdUUPVILWQEAgu6XBa76F/RH
QcYmCCHcvowZxHbGSkRFp2//2Y0bsAw=
=16hs
-----END PGP SIGNATURE-----

--3ylh7nsjnj6zhso3--

--===============0123141700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0123141700==--
