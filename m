Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E41993F17
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A6810E470;
	Tue,  8 Oct 2024 06:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b8bMB5bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EC210E46A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:58:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a995f56ea2dso206473066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 23:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728370694; x=1728975494;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oX5cCIKvh3FQNxKc0x56gg6gPSEg8iwRBf7xW5JFeok=;
 b=b8bMB5bSJTD9mfAgit4euBqD4vgQjTP4FUGe9eByKX6bmqmbmeSZj6jjGt6+7Aep0f
 z2vh/Qpd8G5xzBh6d9mDFqK/uTlzdQH+oqlrXM2WZ+rcRVu/AFCJ+sNKiX9v/MP3HS5p
 7MTa1vmIW6lDqI6D2Wi+8gbT9PWi+LmDmJZ7HDXXtoDAVKsOtDeV/ahdOaf1zQ7nlrQM
 KZO+mwLCf7kfUHV9ShXRrmaqBfDxOAOUnivqzHYPtiX9ICBl0if5IlhPKoneJGxEvE+Z
 sg+HXppB66rovwCcE2rC+LrdfOfL6VvUVCT1VOsd4tH2p42mzqmFbSqbLF2U1fugDvj9
 oMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728370694; x=1728975494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oX5cCIKvh3FQNxKc0x56gg6gPSEg8iwRBf7xW5JFeok=;
 b=KusE5vj9t2y5emJwNRdoln3B5HCdZ6PN6CwUoNW3CCVD3mTZmwirA/a4pAd3Ord/Wj
 jM65t2lYXQlxN3oXU7GhT84WBveNkCs3f+BSd9Zukfd7YKjHhHvgSYKDml+2a4QBHtzJ
 IC0AYe3UcQGUisIVsh+FXxIe0xu99LtCXXPnybAFCzIjzF4QIuYOM3LFQZuDHWh2SrHr
 SodLmDKt+jWYwSJgbuFCPDNtPcGaHGGI6FrirambEi/XQmYdxHyRwib7Zn1Zn+vh0CRX
 f04N2nIYoA8Ul1QyDPmmNMJJXoHfeGetcCz8jOZ/rLnN1ho+H7RFeSYAehA+d6mtJZel
 C15g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtBeSyt2PpJafCUXFUtRZvFmcpPAZrXEEJblh+5AjsxhRrWmrUoLC4GI2gDQIenzehK6sDAGqI2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBtJBwKk0eGuymiifWu2pHN0cuMdX80a1skZbrjknFFl9RVl/e
 Ndssq1Dz/g8O34+WYvf8RCK+F/ZLcHNWzfGKaHe7uoM2IaQfEscMc6KIFqsvOCY=
X-Google-Smtp-Source: AGHT+IFpWLbhTPOX259xI0C3449NGs6Ci0Xoqmf6eZs4iSjdEk3EwWyZY4gBRmyp5IcTjtHHqIJEiQ==
X-Received: by 2002:a17:906:f5aa:b0:a72:750d:ab08 with SMTP id
 a640c23a62f3a-a991bd479a7mr1527145066b.14.1728370694408; 
 Mon, 07 Oct 2024 23:58:14 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:6abb:a5f0:cdac:1079])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994c5a219bsm302315066b.152.2024.10.07.23.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 23:58:13 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:58:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: Switch back to struct platform_driver::remove()
Message-ID: <7l2xan5aa4kvbzeolwdpeccnsfnp5o5zjucnibd6mdhj2abw46@y7vwlg6tnqmt>
References: <20241007163516.433885-2-u.kleine-koenig@baylibre.com>
 <863209ef-289d-4414-b19f-e0a308d0fba0@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3grve4v64eiurmgi"
Content-Disposition: inline
In-Reply-To: <863209ef-289d-4414-b19f-e0a308d0fba0@suse.de>
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


--3grve4v64eiurmgi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 08:30:40AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 07.10.24 um 18:35 schrieb Uwe Kleine-K=F6nig:
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below drivers/dma after the previous
> > conversion commits apart from the wireless drivers to use .remove(),
> > with the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
>=20
> This paragraph refers to dma and wireless code. I don't understand how th=
at
> is related.

Ah, too many patches and missing automation in some parts.

@Helge, can you replace this paragraph by:

	Convert all platform drivers below drivers/video/fbdev to use .remove(),
	with the eventual goal to drop struct platform_driver::remove_new(). As
	.remove() and .remove_new() have the same prototypes, conversion is done
	by just changing the structure member name in the driver initializer.

? Or should I resend?

Thanks for noticing,
Uwe

--3grve4v64eiurmgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcE2AAACgkQj4D7WH0S
/k5Jpwf/epYnO4NZimITj5+XuFQJZIGQWSxOp7Qr7XOC92wCCD3GouqP+aIRvJEW
K6dCohM+T7YrW0MeQOos0P+KoLdOApXvlMy0wtdbdtqpW7eIm9A14vUvULYdP1Rn
pMyJaHyGlw7LuEQoJcNQhHdObrtfsXa5mn8aXlQNnbWk1gEo8yi/JgcgF67eeioX
GHpDYhElydC/mT3OAnzcBjG2S9yF6zoWrdMDy11LW6JWT2aneBOqYEcUrYgbd0Lq
oaC44ke3d83UZ0hIP5f4G364+cBSKu0cXNugCkYT5KbQpIQ4mrZE9J2ddJiG/Vf8
NeWrNKXjQTbK9iXOseqEboXL4f4jmw==
=4PSw
-----END PGP SIGNATURE-----

--3grve4v64eiurmgi--
