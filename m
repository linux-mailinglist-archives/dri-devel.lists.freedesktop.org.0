Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E9797097
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0698B10E784;
	Thu,  7 Sep 2023 08:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191010E784
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:03:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so811879a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694073831; x=1694678631; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Trw2Io8ytInM/aE3aOtZqo+e5kg3I/wOc+oRENvPgFs=;
 b=Nm+YGxryMfap37/iTmXtIzRNCE5IK2mbv2uaHQEoFemtbej+LvMcy30+lyOilVocvB
 NWs2dnuW4ZIaI5IT60cIuUKQrnHuxQeVOrn0d3K24KGONzwPDs2qE6hSrUPNKgEHq813
 Fa1EB4mJbJPEzm4OpnCy90IM+i5b7iNdj5+KpPmEKIYMo2pY06ZIvf1hHJSTz1R6jLen
 iiySTltv/j3CFj5Y8M2yzeM3LaCeXYGqILldpVMnKekLWS4+aFBdQTsy+vEc1RbfLq8y
 /ldj6kVoJ1O6+COb05vOGWXZWohcy0RJToAQD7fit7KG4BorKOc6MiKTrbLOau/h9g+b
 3w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694073831; x=1694678631;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Trw2Io8ytInM/aE3aOtZqo+e5kg3I/wOc+oRENvPgFs=;
 b=NiySIWszI55mgnOXAJ2nfqhp3EOZ/zwpRLn81cxNf1YzhHjaEiIrHdKL2QaTQwGnCO
 6Xx1riXNH1t4KrViWt1S+Z7ha7BLQ4QL6d5NrtgpUZ8QXvM7DVTzIzqXIqbAgjmOPx3Z
 bjL4r/zMMi423BjXoQtmWN8BvF+ymllGKf0+LOXGhyMqUAyI03WXsWHIK0ikhlQWNth9
 Uk/588Xm2fSZmTBi7ioLzNmsEtM9NQLS39N7aYuydH2Q0cx4zAvmBg7FDYBg6bvy9Oot
 oc1fI3Jmx/6d8WxZYNcC9zSOP+e7XZRZmmaOIJ1xRkvv4LqBNdK6DsKom/OrgXtxRDfJ
 vfeA==
X-Gm-Message-State: AOJu0YyzDx9EufzFTcFZ08sDGqkp3Rtl9kwCqPhWv3PHf4Y2obFboaaO
 +VCj50dbMASbhdhOGMdfZPs=
X-Google-Smtp-Source: AGHT+IH3qgpRCX7/aDqgLlEB/4Ih1/EFDrLeaDQWihqXMSYg2240AnNbJlLKWfYj9NYu/lINHqg10w==
X-Received: by 2002:aa7:cf09:0:b0:522:cb97:f196 with SMTP id
 a9-20020aa7cf09000000b00522cb97f196mr4191837edy.36.1694073831238; 
 Thu, 07 Sep 2023 01:03:51 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a50d698000000b0052e2aa1a0fcsm4932797edi.77.2023.09.07.01.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 01:03:50 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:03:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
Message-ID: <ZPmD5WNZzz279qZ7@orome>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EqoqqfIR7OGuiZIB"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EqoqqfIR7OGuiZIB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:04:29AM +0200, Daniel Vetter wrote:
> On Thu, 31 Aug 2023 at 08:33, Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >
> > On 8/30/23 13:19, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 25.08.23 um 15:22 schrieb Thierry Reding:
> > >> From: Thierry Reding <treding@nvidia.com>
> > >>
> > >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> > >> not to remove any existing framebuffers in that case.
> > >>
> > >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >> ---
> > >>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
> > >>   1 file changed, 5 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm=
=2Ec
> > >> index b1e1a78e30c6..7a38dadbc264 100644
> > >> --- a/drivers/gpu/drm/tegra/drm.c
> > >> +++ b/drivers/gpu/drm/tegra/drm.c
> > >> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct
> > >> host1x_device *dev)
> > >>       drm_mode_config_reset(drm);
> > >> -    err =3D drm_aperture_remove_framebuffers(&tegra_drm_driver);
> > >> -    if (err < 0)
> > >> -        goto hub;
> > >> +    if (drm->mode_config.num_crtc > 0) {
> > >
> > > If you don't support the hardware, wouldn't it be better to return
> > > -ENODEV if !num_crtc?
> >
> > While display is not supported through TegraDRM on Tegra234+, certain
> > multimedia accelerators are supported, so we need to finish probe for t=
hose.
>=20
> Ideally you also register the tegra driver without DRIVER_MODESET |
> DRIVER_ATOMIC in that case, to avoid unecessary userspace confusion.
> Most userspace can cope with a display driver without any crtc, but I
> think xorg-modesettting actually falls over. Or at least I've seen
> some hacks that the agx people added to make sure X doesn't
> accidentally open the wrong driver.

That's a good point. However I recall from earlier attempts at doing
something like this in Nouveau (although this is now very long ago) that
it's not very easy. The problem, as I recall, is that the driver is a
singleton, so we would essentially be supporting either modesetting or
not, for any device in the system.

Now, it's unlikely that we'd have a mix of one Tegra DRM driver with
display support and another without, but it's something that I recall
back at the time with Nouveau was problematic because you could have the
Tegra integrated graphics (without display support) and a PCI-connected
discrete GPU (with display support) within the same system.

I need to look into it a bit more to see if I can come up with something
good to account for this.

Thierry

--EqoqqfIR7OGuiZIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmT5g+UACgkQ3SOs138+
s6FLmhAAmyaCx+NZ4CFNJnxq8gGz2x3VEtu+/0PYbo6Fw/Lx+HMoIpz9sN0sb6Dh
XvJ5gxTSMeNWwQXSuLDd/dkZLgrveqd1pi4kzaClq1B1PnuD4ltt2K85a0/riByP
dfRf8fs0i0DwcVM8WxrzpeLkE+HydCHkZJu/jisq8zGWrZvFr/PRUQvDYILKDEi2
GoqN/DKNNVgkbn2TMrAwl/U899ZqUla2+03EJqNq0N10/wMUbEmuIBSkuUx3Z4Ys
y5RAqxiQt5Q8l8m81+p5hdkkS5rlEnODzK1tYHN9p34hEq9miBfL94kYdV+6I303
poOV5TGn9rN1KvP0cFIi/kQXYFTr7Myk3kSifPLlSeCdzHMrt3nigPb9zoHWl5mI
2sxxYydmSnq3GiROvs2LnbuFw4lZfnUNkgTJTllPPL6hp3dnAJ5H/8hUVtVqLXQn
BaUEiY/awdFWHJPRrBgm30vs8IKOlWCV2+3T7LWrQ77X/+HYjVE9i5q36cOJ/kZb
TBw8PnO9DZtoAFzJ3EaUqyQetPJAbUzGvBvqdK5sz8aqMHJ4r0ti1fCF6tPR95G+
Skkhl2Bm3h/0R+VEOr2uDwRvPTpZTs4IIdJNTIoIjP5170SS0FGutvD8ZKSrvfI6
Qe0pZ/TzKEFYsZVV15YIWwukoQzgmsd34hTPT0H0RRJ7wz800uo=
=cMhM
-----END PGP SIGNATURE-----

--EqoqqfIR7OGuiZIB--
