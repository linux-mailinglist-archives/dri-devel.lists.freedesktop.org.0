Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4F87047C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DEE112222;
	Mon,  4 Mar 2024 14:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PH3HQAhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666DA112221
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 14:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F46A60F0D;
 Mon,  4 Mar 2024 14:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB531C433F1;
 Mon,  4 Mar 2024 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709563661;
 bh=LgL9wGDkrldfa453Ktth7B9b3tZ4A0XM3nqjXzn3/Bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PH3HQAhyLnQU0mJ0w65Ma//DHnJDaAsC15v5mLYvAu+p9h6GjJRf0Ho2r87q9dSp2
 /mGyc6pIFoy+Qd+gy5NXj3bbcYAO4+U0X79aT28vH6xExQiWy7KXndy4hhsnCD/ZGo
 F2jpaKClADoZVDtya0hwnYRVHjbXbweSK3CkPz1RKQLxhk5Bbc/awz4j0ihk3o0RKX
 3kRCaViwcwCUAqlaMgMvNNkPbRopn+B56GfM2/CyC4WZk2fb40JvThy3UC3DfAAPko
 bDydMPW5SxCCDdTSamNC9cABcTOkvtIRf4SA3a7RyirGnvuyLG4PlXHL/us+FRwZcR
 dlTQVU5TacuRA==
Date: Mon, 4 Mar 2024 15:47:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sun4i: hdmi: Fix u64 div on 32bit arch
Message-ID: <20240304-tungsten-loon-of-justice-3fbece@houat>
References: <20240304091225.366325-1-mripard@kernel.org>
 <CAMuHMdW-H=yvY-fhADXKtbFY4NnhTinXxk-Xbr-69H1_aR0cPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5tg5sapz4554dumv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW-H=yvY-fhADXKtbFY4NnhTinXxk-Xbr-69H1_aR0cPQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5tg5sapz4554dumv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:05:14AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> Thanks for your patch!
>=20
> On Mon, Mar 4, 2024 at 10:12=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > Commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and
> > mode_valid") changed the clock rate from an unsigned long to an unsigned
> > long long resulting in a a 64-bit division that might not be supported
> > on all platforms.
>=20
> Why was this changed to unsigned long long?
> Can a valid pixel clock really not fit in 32-bit?

Yes, HDMI 2.1 supports pixel rates up until 5.940GHz, so the framework
has to use that.

> > The resulted in compilation being broken at least for m68k, xtensa and
> > some arm configurations, at least.
> >
> > Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mod=
e_valid")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Closes: https://lore.kernel.org/r/CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81=
+kK9Zop6u=3Dywmw@mail.gmail.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202403011839.KLiXh4wC-lkp=
@intel.com/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > @@ -163,11 +163,11 @@ static enum drm_mode_status
> >  sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
> >                                  const struct drm_display_mode *mode,
> >                                  unsigned long long clock)
> >  {
> >         const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(c=
onnector);
> > -       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI s=
pec */
> > +       unsigned long diff =3D div_u64(clock, 200); /* +-0.5% allowed b=
y HDMI spec */
>=20
> I'd rather see clock changed back to unsigned long.

No, the tolerance we allow is an unsigned long. The tolerance is 0.5% of
the pixel clock, so even if that controller supported HDMI 2.1 at its
full capacity (it doesn't, at all), it would be 29.7 MHz, which fits
comfortably in an unsigned long.

Maxime

--5tg5sapz4554dumv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeXfCQAKCRDj7w1vZxhR
xU2+AQDKLWvhgbLGDqY0guQ47v/RIxAI0kIYZFoYqag0k8PAJAD8Cfu3DR5pohg1
00yGxz99MtlAJIyx6OOJwYKt3G4v2AE=
=MX2Y
-----END PGP SIGNATURE-----

--5tg5sapz4554dumv--
