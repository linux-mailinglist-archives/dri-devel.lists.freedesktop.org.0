Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA08138E2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B5A10E1DF;
	Thu, 14 Dec 2023 17:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD01810E971
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 17:40:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54c846da5e9so7893238a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702575649; x=1703180449; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1N4WLdf7sdlP56PS4ELYG6Uf5jhTf+hRZAedOnp114=;
 b=lh5DmcTZivwr02QM6//QGjq8MeZ6iOpUChR19nugeDdCX09Hp8zgG3opAsKrj/VnvG
 TsV9NJ+IDPmuOtEPMWZ7Hy3nSIe0OSeOEfVMYHZQrS/MVEgGFT5Q9C3rjIcF7R++PCt5
 xoTsWhwS7muGRfenlQSZXBKqcSuBXqbEQG7FfcHQm6NrwNNV3GNSKYkIrLJcLPduN837
 JRTVg8shN6qwTV8orLTDurJ7d4g6u41Z50qjSkPYTbkevGN/SFZ38LXIn4DUlNO6ajgw
 JfLhG65qMT1XXziwhS588TusPWwQXqPPfTDveFbgq6QmYl5MGsi0T037mLV2V+4zDHLK
 Xb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702575649; x=1703180449;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1N4WLdf7sdlP56PS4ELYG6Uf5jhTf+hRZAedOnp114=;
 b=kA9F3rpwq5F4mG/6nQxDtGXtHbz2/nh6LPmHBrcfWFCqRy1OnSZ/wnOsTyULZmeiyF
 0S0Ln92kDYUQpQ1Ooe6ODjaMO4/0wMNOrmx/jtKGjorLumVVM7PF8WApElhh80UoaYCd
 lsczEbe8c48EbexiiWWE6xqROTTNiWrZpvBIRftEl8XojejlfLWIgRi6nnlAfNALUre3
 NsQ14CdGQo4HRcCoJ2UmoUVO7on1KXDa2O37MQ16aVQEQhc0/Da6snDc+KXVNjKSNkLB
 m7hp9n4kYF26ia2acTgKRfGPmxc/jNFV4JUxbjnVZQnDW7fogRi2aFj7qSRwxXk+v9i2
 mkzw==
X-Gm-Message-State: AOJu0YxDcyHjD1iyxmX+rG1DsYVA2yjc9n0TYZ1+30c9WhOPh76+rO/+
 AjaIcm5Ba5ogSGR46wULypY=
X-Google-Smtp-Source: AGHT+IFcl9XlzbvFL+8a3OrPkQbfjXbIVp/KME6onEiUZmeuxVQdKBh9vlarUhl0lcc0nX1MDxy64A==
X-Received: by 2002:a50:c88b:0:b0:551:e411:3b04 with SMTP id
 d11-20020a50c88b000000b00551e4113b04mr2198866edh.54.1702575648799; 
 Thu, 14 Dec 2023 09:40:48 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a50cbcc000000b0054b53aacd86sm6850033edi.65.2023.12.14.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 09:40:48 -0800 (PST)
Date: Thu, 14 Dec 2023 18:40:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 0/6] drm/tegra: Fix some error handling paths
Message-ID: <ZXs-HmMORtbEKtTB@orome.fritz.box>
References: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B7QFJ7EdQEv+w64a"
Content-Disposition: inline
In-Reply-To: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--B7QFJ7EdQEv+w64a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 02, 2023 at 05:22:07PM +0200, Christophe JAILLET wrote:
> Most of the patches are retated to tegra_output_probe() and missing
> tegra_output_remove(). Others are things spotted while writting the serie.
>=20
>=20
> Patches 1, 3, 4 are verbose, but some functions called in the probe can
> return -EPROBE_DEFER, so it is nice to correctly release resources.
>=20
> Maybe moving the tegra_output_probe() call would minimize the changes, bu=
t I'm
> always reluctant to move code, because of possible side-effects.
>=20
>=20
> Christophe JAILLET (6):
>   drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
>   drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling
>     path of tegra_dsi_probe()
>   drm/tegra: dsi: Fix some error handling paths in tegra_hdmi_probe()
>   drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
>   drm/tegra: rgb: Fix missing clk_put() in the error handling paths of
>     tegra_dc_rgb_probe()
>   drm/tegra: output: Fix missing i2c_put_adapter() in the error handling
>     paths of tegra_output_probe()
>=20
>  drivers/gpu/drm/tegra/dsi.c    | 55 ++++++++++++++++++++++------------
>  drivers/gpu/drm/tegra/hdmi.c   | 20 ++++++++-----
>  drivers/gpu/drm/tegra/output.c | 16 +++++++---
>  drivers/gpu/drm/tegra/rgb.c    | 18 +++++++----
>  4 files changed, 74 insertions(+), 35 deletions(-)

Sorry, this fell through the cracks. Applied now, thanks.

Thierry

--B7QFJ7EdQEv+w64a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV7PhwACgkQ3SOs138+
s6GS9w//STu4g/vBWEfc4q5m0e7gCrQ3UzXsy8t1imWkMTk852LmQdXLz5vl5sBf
wIsHVsun6jAYMHL6ItSZkUz5Qrxw+3WQpwTP757lUyNI9ECxE2A5QUfuYq+hDtAq
YDs7VQODIJs6yj1aKHVVYsW1QW/xiQu/oH1YuA6AhJ5TzhR01R8ihVnFHrO1QrbL
OXd0SSlf3t8zMrIxqnBJonMKBlWt64FgG8qIs2+M/FJLFnqnCo97FLJdzpSFVhnA
Wbmp4ddR/tAhgMamFVkcFxRJ+ug8UEohMYdb73Hu5m0IlNIjygVyr2328RUAzB1u
NveWNQBp082mPd7Vuaf2dapDKD+oAmFEqkIDsPWQjYSWUp3v6xHk4IHPACMrqsx6
zdnLqhXU2u8nK+eFIAd1/NVVhYq43IV5yOFI8rwfsjq+fUPhQoZM5vH7A5MPGKsa
Dya+y2ysUsBMzZxvpDjUG/nXBhuJ6aDXQggNZPVdNpcnvkTrpakl7WaJQCn6WtMB
gxO7x2dXcbwFSW8mWLFB1W7ZwAOS7TRTYRvHlwZGHQHvejDePb9FyxGT26OG9Urp
cK9KfH1WmPSLJvM1iAADFApGD9CvY09US/b4+tH1Tz0K9gjoTPEeP/W/wj4/bYW1
y+hWfjwbfh79c8Nfg4gnWJFo2AaqtZmlwWDHiiO2pDnA2W289BQ=
=MZfe
-----END PGP SIGNATURE-----

--B7QFJ7EdQEv+w64a--
