Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF596EFE13
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3796EA4C;
	Tue,  5 Nov 2019 13:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030706EA4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 13:15:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x4so9709978wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 05:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ImrFDw9Mo7ZCpyPrVkhmxzrZlhzMrXK1DDDArzWnR+8=;
 b=FbgzxUSSg6OX98Ew6PaSYUUM5Z1Z7MXaNLyByUSvgcMVUhqeZK8c9+dK7hbag81FmZ
 yoOvzHkDB8Id6x1jRifETBL+GkKeAXqCp/5KXBhSCrP4r5Yp3jeZ07LZ0IIP8VL6fu27
 lYlmaQkSc+h26Vns1/MF4TFOEN+Z1GfUqx8lAye2zoNEJZjBImDqmcqvPHisk0J84dkX
 HEiUVUcxseogMofQIzg8Y//ncUF8fB9bOqBVk767PVUBstAvoBNNWo8s3K8YzvERoOaz
 1uyg7+IhCQHPIVtZxGQeU7bW05GzRbaePPz8b2PEYAnu63E8nLQiCB6UWXpGzipJ3svI
 7cCw==
X-Gm-Message-State: APjAAAXTIyH0ar9YPdmkPe3UfKE/R/LH/tKsNhNDjRvpmKgRdVDbXuGB
 7uAnGHyhDZU1qqtbnHeJPmg=
X-Google-Smtp-Source: APXvYqwWI1DAwDGfilHoOgXKj8/mn4q//RerMqLJrJMErQvYmHEkbbzFQKAIFJDzOVi21nAT7jvkeQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr4485551wmi.124.1572959714475; 
 Tue, 05 Nov 2019 05:15:14 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id j22sm28721697wrd.41.2019.11.05.05.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 05:15:12 -0800 (PST)
Date: Tue, 5 Nov 2019 14:15:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Message-ID: <20191105131511.GA1609273@ulmo>
References: <20191105125943.34729-1-broonie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191105125943.34729-1-broonie@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ImrFDw9Mo7ZCpyPrVkhmxzrZlhzMrXK1DDDArzWnR+8=;
 b=P5hunGyLEMTzYELkzimihdE4xhzddvgLkri6bqBCYdTTvIosrBhvqFo+ivRooM4BYu
 R3VwLCVj46isnygilTanQ2j8noK0w2fU+1RNP4jJ1uXUbvwviTYUZmfSaavkmE8Awqja
 5VtLhRwwzoATKgOM4vV6MZBmGGndilUpnRL/X27r1fp9UVH1UbmJCjT/Z6o6C/g8CLcf
 +Oyu6iMDxmlp55rB2dHLZYGRUYAUaizEtmBzODb/maKmuVRc/iRVHR9fnOK9I93uMLa9
 b3mO1cS22a7fspbVC7wFPJb7rIz5cDQfhOcYGmTQG5BXUWWZkhfPsnxq+Y/yyNtf5A8L
 vlGg==
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1322003151=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1322003151==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 12:59:42PM +0000, Mark Brown wrote:
> The tegra driver requests a supply using regulator_get_optional()
> but both the name of the supply and the usage pattern suggest that it is
> being used for the main power for the device and is not at all optional
> for the device for function, there is no meaningful handling for absent
> supplies.  Such regulators should use the vanilla regulator_get()
> interface, it will ensure that even if a supply is not described in the
> system integration one will be provided in software.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)

It is in fact optional in this case. This code remains solely for
backwards compatibility with old DTBs because back at the time the VDD
supply was associated with the DPAUX block where it should've really
been associated with the eDP panel.

See also this commit for some background:

commit f3b0d8793c1619074d0ece2e1a7f64ea37eaf394
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Jun 5 10:48:01 2019 +0200

    drm/tegra: dpaux: Make VDD supply optional

    The VDD supply is only needed to supply power to eDP panels connected to
    DPAUX. Technically that supply should be dealt with in the panel driver,
    but for backwards-compatibility we need to keep this around anyway.

    Also as a bit of background: the reason for why this supply is attached
    to DPAUX is to make sure the panel is properly powered early on so that
    it can generate a hotplug pulse at the appropriate time. This may no
    longer be required given the support for deferred fbdev setup that was
    "recently" introduced in DRM/KMS.

    Signed-off-by: Thierry Reding <treding@nvidia.com>

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3BddwACgkQ3SOs138+
s6FUYw/6A4qTc2lnGKnnGBghLO1g8imKr3xO4NSPlJV6WU6BoIR0dwzNa4ES3K/o
NYIN2ouYz+h0eQ9M4rzo2jXX9I1f1pRwsDWH4e9slUPRFrf8ZqhzKTnBLmJ1WGo+
87xooPAZTQsXkcu/B5xr4N0mU5pkHOLZ2/IRCw8HwH6ifLc5N1Um6ULd6a9Sr5Tk
4n2gahFIPpXpm6IByzs5fAc4aZMBb1SNibjx0Ja5gXLlcy4JmbJv1shFO+6JC4zo
YpY9UaPsM7LjoEyfG7DfgZ8grk3nK/FRh9+foMp5HcYPa/vASHfzcjwUZ8oIC3Q9
OyhtI7L/Yiz2uaAzIIJRtHvltRWeiHX546GszfrHD54GuxNCu5JI3tjXGvCTwKyq
SmCBMrllB1+Yt8d4XKCgwvCTlg29zL6hhIQdQGasMubNQUciBtsTObBMrFK+DHSl
q8AKZIB4MjtCyKjL5JbBpcsRj7Z4gvxiSrvqCrVR/x/OqAa/dbqeTsZMMrMRn3IX
suTkJSC2i5fpnNE+n0JfDiLPwx5W9mPlWKB779JGBXcMH2UP9Me5Q6cm7yKLIXSz
2slwXf+7SeTFdPFXDWypSAnoWAi6SUqqeovh1wbJRZN7S/ZdJ04EyQurH2mu4f68
VcXcvBAeBC32PHPGIXyhHd+l1GM8PAMvQ7nJ2u3HuR7s1VFtuGc=
=qSyt
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============1322003151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1322003151==--
