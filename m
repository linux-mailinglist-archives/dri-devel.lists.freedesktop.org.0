Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C066846
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BABA6E2EB;
	Fri, 12 Jul 2019 08:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB776E2EB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:10:32 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D9AF6C000A;
 Fri, 12 Jul 2019 08:10:27 +0000 (UTC)
Date: Fri, 12 Jul 2019 10:10:27 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Message-ID: <20190712081027.arybdoxr6nzrmkxt@flea>
References: <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
 <20190711090327.keuxt2ztfqecdbef@flea>
 <de21fe78-87a6-741f-caf7-2771f6468739@gmail.com>
MIME-Version: 1.0
In-Reply-To: <de21fe78-87a6-741f-caf7-2771f6468739@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1994265612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1994265612==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6weybs6gnxo2efbk"
Content-Disposition: inline


--6weybs6gnxo2efbk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2019 at 06:55:03PM +0300, Dmitry Osipenko wrote:
> 11.07.2019 12:03, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jul 10, 2019 at 06:05:18PM +0300, Dmitry Osipenko wrote:
> >> 10.07.2019 17:05, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Jul 10, 2019 at 04:29:19PM +0300, Dmitry Osipenko wrote:
> >>>> This works:
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/=
drm_client_modeset.c
> >>>> index 56d36779d213..e5a2f9c8f404 100644
> >>>> --- a/drivers/gpu/drm/drm_client_modeset.c
> >>>> +++ b/drivers/gpu/drm/drm_client_modeset.c
> >>>> @@ -182,6 +182,8 @@ drm_connector_pick_cmdline_mode(struct drm_conne=
ctor *connector)
> >>>>         mode =3D drm_mode_create_from_cmdline_mode(connector->dev, c=
mdline_mode);
> >>>>         if (mode)
> >>>>                 list_add(&mode->head, &connector->modes);
> >>>> +       else
> >>>> +               cmdline_mode->specified =3D false;
> >>>
> >>> Hmmm, it's not clear to me why that wouldn't be the case.
> >>>
> >>> If we come back to the beginning of that function, we retrieve the
> >>> cmdline_mode buffer from the connector pointer, that will probably
> >>> have been parsed a first time using drm_mode_create_from_cmdline_mode
> >>> in drm_helper_probe_add_cmdline_mode.
> >>>
> >>> Now, I'm guessing that the issue is that in
> >>> drm_mode_parse_command_line_for_connector, if we have a named mode, we
> >>> just copy the mode over and set mode->specified.
> >>>
> >>> And we then move over to do other checks, and that's probably what
> >>> fails and returns, but our drm_cmdline_mode will have been modified.
> >>>
> >>> I'm not entirely sure how to deal with that though.
> >>>
> >>> I guess we could allocate a drm_cmdline_mode structure on the stack,
> >>> fill that, and if successful copy over its content to the one in
> >>> drm_connector. That would allow us to only change the content on
> >>> success, which is what I would expect from such a function?
> >>>
> >>> How does that sound?
> >>
> >> I now see that there is DRM_MODE_TYPE_USERDEF flag that is assigned on=
ly
> >> for the "cmdline" mode and drm_client_rotation() is the only place in
> >> DRM code that cares about whether mode is from cmdline, hence looks li=
ke
> >> it will be more correct to do the following:
> >
> > I'm still under the impression that we're dealing with workarounds of
> > a more central issue, which is that we shouldn't return a partially
> > modified drm_cmdline_mode.
> >
> > You said it yourself, the breakage is in the commit changing the
> > command line parsing logic, while you're fixing here some code that
> > was introduced later on.
>
> The problem stems from assumption that *any* named mode is valid. It
> looks to me that the ultimate solution would be to move the mode's name
> comparison into the [1], if that's possible.
>
> [1] drm_mode_parse_command_line_for_connector()

Well, one could argue that video=3Dtegrafb is invalid and should be
rejected as well, but we haven't cleared that up.

> > Can you try the followintg patch?
> > http://code.bulix.org/8cwk4c-794565?raw
>
> This doesn't help because the problem with the rotation_reflection is
> that it's 0 if "rotation" not present in the cmdline and then ilog2(0)
> returns -1. So the patch "drm/modes: Don't apply cmdline's rotation if
> it wasn't specified" should be correct in any case.

So we would have the same issue with rotate=3D0 then?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6weybs6gnxo2efbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXShAcwAKCRDj7w1vZxhR
xTSIAQD/e1DSHvsHrh2flaNGAhwJVB74Bj9ujrC7VCEaL5GlwAD/ZUqWk9LNA1y+
s25PrPo0pdy89EqHc9WFkd6x6juMrg8=
=U3z3
-----END PGP SIGNATURE-----

--6weybs6gnxo2efbk--

--===============1994265612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1994265612==--
