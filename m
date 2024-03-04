Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE187009D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F8E11204B;
	Mon,  4 Mar 2024 11:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cd5qKjsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864D112049
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:46:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E0E4CE02BD;
 Mon,  4 Mar 2024 11:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D5BC433F1;
 Mon,  4 Mar 2024 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709552763;
 bh=qCfn8+14iH8PjhcmL/Dqov86jABrctnZ8SOBmrrpc0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cd5qKjsm7tlNWam9UmT9oCfjUa/fwI5qFHbnGZWcPollBsT6lFWcCN1J/onilOiVz
 lRtcwRD6A+P6/22MrtyreM/qk5bzoAn6xz+qIIO8rwsmgzLJRF+qxG0DsYg6WnfPXe
 SyIUHRKmhSTWOx9EPXP/t/a/Tl22MeVwE+rGUB/ltmiJ5TsxZ8n57AN15SVWhimrpZ
 Q+64iix0NdZSm8PhMdmOet8pDHoAcQ9OMkMmBcCXTb008nPLAC6xmckqWcsF8uVyXO
 obCk6lzQBYuIiE1ZDL/+czEuIc/tHNkfEvwMCNhjPkDLvNycINaB9tJVI/y10upcEC
 cAHFx5Qxd4pFA==
Date: Mon, 4 Mar 2024 12:46:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 lkft-triage@lists.linaro.org, 
 Dave Airlie <airlied@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Message-ID: <20240304-brawny-goshawk-of-sorcery-860cef@houat>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qhf5po6j5zzjeoj5"
Content-Disposition: inline
In-Reply-To: <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
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


--qhf5po6j5zzjeoj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > The arm defconfig builds failed on today's Linux next tag next-20240304.
> >
> > Build log:
> > ---------
> > ERROR: modpost: "__aeabi_uldivmod"
> > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> >
>=20
> Apparently caused by the 64-bit division in 358e76fd613a
> ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
>=20
>=20
> +static enum drm_mode_status
> +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
> +                                const struct drm_display_mode *mode,
> +                                unsigned long long clock)
>  {
> -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> -       unsigned long rate =3D mode->clock * 1000;
> -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI spec=
 */
> +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(con=
nector);
> +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI spe=
c */
>         long rounded_rate;
>=20
> This used to be a 32-bit division. If the rate is never more than
> 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> the expensive div_u64().

I sent a fix for it this morning:
https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org

The framework will pass an unsigned long long because HDMI character
rates can go up to 5.9GHz.

Maxime

--qhf5po6j5zzjeoj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeW0eAAKCRDj7w1vZxhR
xcNXAQCCkNjiY0JsktvmYZxKxBoofaQq7Q2nAcC6MriD6vV3BwEA//ChFlHIKtWA
r/JmCAoccPnEhcl+Ei+VFQT6vwm4UQM=
=GTZR
-----END PGP SIGNATURE-----

--qhf5po6j5zzjeoj5--
