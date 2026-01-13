Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3DD18BB3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 13:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347010E4BA;
	Tue, 13 Jan 2026 12:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F86X2kUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3858B10E4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 12:33:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso44087465e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 04:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768307605; x=1768912405; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iu+hM+o5OVgosv83g1p0lFler2aXUxBOVyQODWO4k74=;
 b=F86X2kUR+xYn7gKQj/F9RzVZ5PZdG2PfxzF0KA4eElRHRJBSnBqxTV6TgmQd8oHM88
 XzFJrza4g2TxNfbAJfa+ypdHIiTy1S3ultUm1XRl28P9PdUd9cPGscXf0LlmMOw3KnvC
 IcBIHuM/GH0fSCii53/S/JKwcxylA+yk8lMioiLlCV8yIIH79sfrE2iboo9uLmXKs9xA
 +rGPCpMn4QpIONV0+LLIIrKSNnQf48dfJflhz+HpJLHZ8NGbLyg5X8Je2Jgb2+b0TvB+
 Zklz9Vv3O700e51Qp0YcJ2VNu0h8Fi0Jzdv8u7hJNFEkaw0Kj9aCruFsz//cYH0ly4ZN
 43pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768307605; x=1768912405;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iu+hM+o5OVgosv83g1p0lFler2aXUxBOVyQODWO4k74=;
 b=eoMo2yqJqwaS9Pb9wC6nfjISM187YznT+BqD2SIXfKKpqSc0H6dxyt9j73HoHJplTY
 zJlIAe4fmeRYBxx/11Utf3u2RLUT3b0FDlpFni+TVrw4fx8oJNQ8P3P0JH71cLbzC7Bi
 JKdSDWhGYbJ6JZ8NV2HgYa8cd6EdGG8wt+S58V6LUkl/+/ZxckFt8XjZXcJntAEk79ui
 HHNrjwOD5IDVAsrRx9CrtUtt8rUAE60S1f0rW08nEV2izhSTufsaO6aV7N+mIcad8kV3
 /RQigNmxE9j/NXSLYTqsChx6J2aJrJJJk8EvuIt1nvuhqqlqgBr2jj8LuBs/ZErukuVO
 6Sxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJn5h3HIPT9yKVyq8PdZhd3MuQ5Rr43CJ1v14GYlnXGd1wAYw6f9sYtuFjkTpWj8MZYyWWIEVvJFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDVh/936VPShh1Earr+42sVRIsQ8AhyoSCI3nvEpXEeQD9gsYU
 jh2HdHijvV5gnQl/e1YZixGUQ9FkNk8vtaGs1h2/Rv+KRJAwl8227Ztu
X-Gm-Gg: AY/fxX6g9FliFJq3CeHhqsRmXa9wgZ54cECk1QgPkN3Nq2yQAiQBOEnVb9DUR35WTQE
 OAi4HQtpr193uLEAKnyLz6cZzwPVzhBJYeCinHsX1n684/LJL+zIf0GWq9NtpWiKocNRDXknJ5X
 TBVGeC1kNdTBOazNUaECBhze68e8QpnfCSoc3o6txJ+P7JhG6G9L5bsotPloDLNlBmKlv61u7aa
 Udzwt60MiEwj/n0FRg/Hr/f4BMG07A1lWQL9LQjfhVlkehBl/605UN2hKnm0tLJm7ib6hoiIb5O
 Fpt6RM88QeZNqjVejoFf/5MuosqQ2Vr/xhYh9K9dk0F/djqZVNCoFsu1CBlYoQlcBKo0W+NjKc3
 xvBZcbp+Dl86pS/A/LU09XPXoqds3ry4KdYjSRHZdQ5nDELv4kp4s5c9pkxQg0QbOVNYmFIuatS
 tTdFwvvOsMvPPTCFPzwnYpsSSxvqfgkYB4u6n2zdKxOG748VTKlOqhc7SdYmrJ3H/vVOAumcT6p
 qH+SgpJYQuV
X-Google-Smtp-Source: AGHT+IG8MSHR6UelEVmGpCyFD9NdUlMZd6tKUDDeZ0GaaRamXIcxo7BgHJmGz6YZQf7c2j4pEDiVyw==
X-Received: by 2002:a05:600c:83c7:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-47d84b52e31mr244947625e9.36.1768307604465; 
 Tue, 13 Jan 2026 04:33:24 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f390a69sm399651475e9.0.2026.01.13.04.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 04:33:22 -0800 (PST)
Date: Tue, 13 Jan 2026 13:33:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <aWY7f5V_VE2RY74T@orome>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u2bmktfhhry3gyx6"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
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


--u2bmktfhhry3gyx6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=C3=B6nig (2):
>   host1x: Make remove callback return void
>   host1x: Convert to bus methods
>=20
>  drivers/crypto/tegra/tegra-se-main.c      |  4 +-
>  drivers/gpu/drm/tegra/drm.c               |  4 +-
>  drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
>  drivers/staging/media/tegra-video/video.c |  4 +-
>  include/linux/host1x.h                    |  2 +-
>  5 files changed, 37 insertions(+), 44 deletions(-)

Applied, thanks.

Thierry

--u2bmktfhhry3gyx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlmO40ACgkQ3SOs138+
s6GKWBAAkeHMxtj03MuTuHomrmoj2kYvczHvqu0BchkARJlcBuq1QbDBow2Tyjil
qTY5YZp/VaU/tTbssrx5tdAsTOEK2yYugUOxfVz5IbyDzavUQAv8tq6kKLhY468g
v4+p3ypGVT+XiQaAoQOn7GVdKp9X5SLxkJclGirBiepzO2CrJR6ci+NjBqaBBa7n
mO8nh6jRN891vYt9IyZSd0VUf7W4K4mFS/RDKQaQYreFWSNiBAqdYMWCoUknnNY4
lSKKIwp8IUO7wSW6kO7sEFfrQDdQjzp7kBDmG18NkhOsaXs+WjXgEFP3aQqKgmu9
PYV79R8kRqMLuin51hrHrNvGuFbZqNOYFFJe86ipiO2wZTdXbaR4FjkBV5bGcj/a
nwGAeax2FkhF4wGu9Zlfo0Zc0IuAb+S03c+RojN5EguuwTQpj8Fpd4TM6wLC/hur
86LbYnh7oDIeq6rF31GpQv/uQKoXtbseL5CKi0uK9wc+MP0xP/LwONb8oNHbynRq
rPyCADy46HhE0MX7Ki6wONVMloMept5PQdKzt7uizTB7W9cTZDJzIbPCq/kUhw4q
AT9+bH0Pxgn7Q4MpCoQCwvz164tWFowRgcKmbuVO5Bp9WfkzhCNsp01s9+Y+PL+0
1zY/BIC2SpeWjz1ip4Cl19Vid5SJ+6Tv/3EXKQ/PauUfgWbF2sU=
=lJz6
-----END PGP SIGNATURE-----

--u2bmktfhhry3gyx6--
