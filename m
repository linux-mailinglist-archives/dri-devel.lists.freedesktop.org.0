Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95876AAE585
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DD410E110;
	Wed,  7 May 2025 15:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PcEwP5H5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3487110E110
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:54:05 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-736aa9d0f2aso114619b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746633245; x=1747238045; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PwsuT0/5Q10KQpJ5EjKI4law/hPOTFepZtSDV4Bjl3A=;
 b=PcEwP5H5rIpiiC7QcVJ6n9Zt/4+bUwa02Io9U04/O2oX0Mi3ht730oStJgKMVoOKVw
 ua0W2NiaMHbBPZMYTWYKPW25jvjz5xssBUzhmMq2t2xAKejHZgk95h1pbWe/+OlKaDWz
 0rO7iTyFBORTUm6wna7tkco2FI1OZC8DexhCO7eyWXz1ngbQeWdONQHxjlijaCm03QBf
 Y9FQaYPSBmPpU9iMDbCftpTquWl5orXAQOx8SU1NHmGtg/BkEMrHApXUi9NTTuVW66+4
 GUgbViY/iVTora0Y4ixsQ6zGByzMxsU56kryVeIEBThVBRCvnqG3oU6FZvpcKHveuGhP
 pYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746633245; x=1747238045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PwsuT0/5Q10KQpJ5EjKI4law/hPOTFepZtSDV4Bjl3A=;
 b=ID3XLUu3SjvkEyUbir0cxHIO94+NEYPPXfOuo5uHr9CyS3j7JXbOYm2kcA7rcyyWbv
 Ahi4JxpHwzvfQZQwxiYbW0NqHJKJRHFwWTJ3XCTPruvkuDX57F6v2pBuiVYPeh6iYXSc
 Ck8HbSxy8Kc6gyCin/Ikqq4ONRoHoNRYwhjjKntrULnxh4BZaCkKt2U/ao9XSfQZ0xor
 Le1rlO8iVqVF4x4n1ZlTJUkEBPlZXkw80qdNntUkJQBMX6S3UBhXGpD3kCAQl2LPPD+C
 9FKvp373jgap0CSJ/A/zKkDvbf5R78xamORxNYx8hYN2kUDJdeDVN4rl0/qv+VAp7mkZ
 uzpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtsVSONitbzlATVYcjf8a78cM3XpV7/PFgYKaxMvLhaYoh7AcpVDYdqtfSWGu2NE98ZUYRo3W27hU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySsgqV68t17Ei1O19/DvilXuwXpVYl1iG4ILSdGw89Taw37EOy
 voh90oLPwavT/NaJ7+wb5xxiNkmwEcqXbPA7s/SQq2NTqgbl3UdF
X-Gm-Gg: ASbGncsMAf6aWT92EP2H3AlrazJeqATHxpCSlT/WQJ1WbsBBUVpdcfgDG1Mrb716kPN
 BFpY0h/N4A+b/FFuMHgj4B4Ne8HBnJHPtAD/RZ9DiW5K+SEz5yL52PgyOl26vAVrODZg2zaxC3h
 ZNXenHTv1mjM25sxH1QWUid1H5REKxvG8YsfCijY1ZX53aDmIxQfTZw4IqVF0uV906IHmpy5lBI
 vT0HzUiD4DDyltKmtUI9sWdoCnBySIpQCcDrf6Z4OE9VgEGxp8xfzQu0VB0ZQC7DrqvhXDnq08S
 CBocjKCIOZ/QBExFQIu5fjoLnjmsKKOnTCCj4+e3lIKpOC+FcjYrs06XSP7LIdKM4zSJ5cMcIjG
 JXdonF73BjV4Q6XiQTtLn1oUiKnJVHNXu01SwSg==
X-Google-Smtp-Source: AGHT+IEuvtbD2xrTttYuZK//gpyc/17xsheEv8eARmmN44SmSMU5YmLjVF7lA5+rcn+D30hr+MjJqw==
X-Received: by 2002:a05:6a00:8d8d:b0:740:67ce:1d8b with SMTP id
 d2e1a72fcca58-7409cf002d4mr5091749b3a.7.1746633244590; 
 Wed, 07 May 2025 08:54:04 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74059020de2sm11735273b3a.103.2025.05.07.08.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:54:03 -0700 (PDT)
Date: Wed, 7 May 2025 17:53:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Terje Bergstrom <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <in7leokkxlp35zivwov5wsrnq6ma64y7lz26dqmc33flvnfi5z@e3jhlbaw45sb>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yk5pmumn2geczhqp"
Content-Disposition: inline
In-Reply-To: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
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


--yk5pmumn2geczhqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,
> but the driver does not decrement the refcount during unbind. Fix the
> unbound reference count using devm_add_action_or_reset() helper.
>=20
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Sorry for the delay. Applied now, thanks.

Thierry

--yk5pmumn2geczhqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgg4ACgkQ3SOs138+
s6ECWQ/8C5jlayoEY2mhnLYUD3/0J8X5SVRkNvansWKAYuO3tgJwdQHGmpwQFQwT
xtTdKlsH/E8Mkk94qm5VxwXzPJrY1mC6xvxSI0J/XSNN+o8bauoRJCipzrcTIv9q
RGSaMk6yFyO32xa4RMDu7GtwaJpGOpPS4V8OPbAxURuKUDX0NFc0YxUb06T9ssJy
Eql9TZu98nWqTrrbHsnHdNkwzQFUalmvE+zuoiMmukwT0oq3k5RKKTJtiAaweWtt
rjNmnIunOKL7GAJ6RKuoSJEs5Bj0/4QR0pTaOL6tJh54YECBS2Lw9k08+mQ6R/8D
67dG1DzHYhUifc/D4RxgTj5TZi5NoP9C0GqE3J3JkNLR/3JGs5vvx4LZsxBC7e+i
qTxv5Ah1N7oj8WIC9h/7MEWtrBWitBkNLz6ujXiFI+REZ42AA/HFDMBPVNNIzFkR
OSE/uu8otOQLhE/gzG2w8rWq0Jri1hm4f0gWvATkt/t91LfF5GkbTQiVxfINf/Zo
P86GIm2wf9TK3n/oTxX0FfdE8NcGCwA0A7JRtIvvD87jBZ5tJZsLclCGFTHEcekL
xfrWKrWFdMIj2WTeEvfA1VxWN29OGOFlI0A0oHsnZsnEtmySmRtvzd5vySUXigW/
EmxyaQVnHdRQAA+0v6l4ddIVflFJgtSV7ejljZ/KkbMZiizofCI=
=KKl+
-----END PGP SIGNATURE-----

--yk5pmumn2geczhqp--
