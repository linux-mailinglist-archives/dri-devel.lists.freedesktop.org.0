Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACEAD3106
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1810E26B;
	Tue, 10 Jun 2025 08:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1AvQvgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2286210E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:58:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso45194505e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749545915; x=1750150715; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c36DuMc83AVOnhqeN6b3+cmZHTuPxXfhTO8yY7xbqj0=;
 b=E1AvQvgQtFk3egWXbd1BL7Gvu3TIPvu6O18lKBnf49P2cm562hxzvy7ANiblDT9YV4
 lcvzK5Bi53xf2Y1/lvHhZYOUpTfkubUYdIJTsYopgdT80pUVS9u1LypfwfnKkh+q+eJ6
 akmPkXahGuYxQ5PvapHLrOgRRAeWBWioXyfq1vUAecR488dzVEv/EVSKIM9NbC0051MV
 1ZOvqrrsvhjZ2p2jXCivYXa9uUDc17veKVA/pFcO4XQ98ixmKBWLrvqNPujEZWhdRhHY
 1b9LkSISvKBEZnN5XeCUM+DuIVis9p7koj7oG6wgRw9jOQDCiX6ztScShrczenqe05Ec
 RZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749545915; x=1750150715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c36DuMc83AVOnhqeN6b3+cmZHTuPxXfhTO8yY7xbqj0=;
 b=oK4m8DO++HNkTjjQE8I7oT3C6iAnMb4xe+l0wklZRSfC1Q4Q2w/8A1ulDcNXIBeOe8
 S4VCH2Met8pCqTZ6OT1IOgQIO0AJPYWhZ89ROT2F8w8XO8s4FS+9BGVM63Q6MHhvz2BQ
 QDo31fELVk8MmelUt31l3yCaCxye0cTZ5rwOdnOIwZloP7foOwfT+0W8tT+OLrZCnbpY
 Q2Gjq3BdbsLGvn3gttQmdp7Epzti2ZBNQ/GU87J0yNZN8/o2xTtII9kZpsGhpwXPTRV8
 3O5xH2EUnzeyd9YV1hC+uhtMhvZRHY3Wr+4NbNPGvzoNyzT+pOOIgXkURpO8zp9few3T
 r9bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSeptGBlfqwcmxHKjJM4VjP9XeQUlHnqS0LHWVT3VI0JQUFdUKNts5R2dYMUqru/7E+5RGTFQU0TM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3Gin+0+EHuAaNL9/DCyJ+lXJN88RhPde3zYX/AWRWkkbV69t2
 et0i1DVpDYRyYMc4bSxV69HgBW53zi19MU10bMQeu5BFldN2HGD73Nl2iWhCpQ==
X-Gm-Gg: ASbGncvQouKuKCpkbbmhTEyVQdTxD0w2dqk3FPmyfe6PgjnfnHXCq45UlCWSNK9Yc3+
 g3sjF2JxwSBWXVZoVOT8+W2le75vHK2clZ3ayhDej1cm8IxJ9tdo5tiwqFDD+obDyDxpWTQTFW1
 RxxEBTAuEkmhr0LkLrCGBe91YT3eJwlxn7k5xIni2wPkuQSH5jEx7rSxl9TUDTZ3X9vac5S5RqJ
 waLyAhsW8EaIQfr0N3zV1Y46XvzdweVOjzNfYPwxgQ6TmEsRnyiIUDDrn+TFhcMp/PDNZ7MO4y8
 smVz3NkyyoLR0UyTxHXBMPJ1LG47QyuMAgLe6bZVM5YM3XnzWYXsZC2CJSGKSK89/ex/EqajAid
 bWQ7SjMAkl/9dRCCIZhhC5d1uwcv2dyWnuRHIA7V+1/kr3Pf/
X-Google-Smtp-Source: AGHT+IE1/l/BHFvm2kuDy24IpYdRMXIUpOH1axcX1ng7Cfy61VsEvmnvDVUtQx7F+RDB1XpaMvWHLA==
X-Received: by 2002:a05:600c:37c9:b0:43d:1b95:6d0e with SMTP id
 5b1f17b1804b1-452013d7e24mr136087495e9.23.1749545914323; 
 Tue, 10 Jun 2025 01:58:34 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730c7756sm132335935e9.33.2025.06.10.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:58:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:58:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3lv7qylzds7dx5y5"
Content-Disposition: inline
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
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


--3lv7qylzds7dx5y5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.

Nice. It's good to see that there's some use in this after all. I
haven't taken an in-depth look yet, but from a high-level point of view
this looks like what I had imagined back when I started out with this
driver.

This made my day, thank you!

Thierry

--3lv7qylzds7dx5y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH87IACgkQ3SOs138+
s6HLMg//bv8OnrB5czvRgzKb2t59uKLvAvodsTpKUTy5YXB2PLldaCpE1l2oHkAn
eIois2Zr9hMylXWqBKUGLETNcOtWej6AWR0oMLhkoIH8KDNvNE1YW4JO7POoM6OA
dEWYwpChmWXtOF3hCyvmdJm98ZSQ5mwgrNi+wXT41nNakrL9JIxAcudGzvyWwpAn
bj1cr4m5B24HBvC7ypiPuY/h+I0X92Dki94ohrfKL9Yxd5Vuh9MGlS6PgAcBeyhN
1m1BAt/Zu7na+o9DUBDuMATP20l0ihdG5igGOexNPukHPxJnoKVLGa5prTQFKIYQ
zvQqltXKCKI+b7LX0brONmPUXlofvze8yEAcvgWTnZXwDNJ7wuN0QLGN436BUCg7
4qd2nK9GzmpzWUeIMwKYhPbi4wTxJesVExq3YV0Uoa7plRtDNmsgMs00c4oHiz6K
yTF39A8KNfMYrpPbKyr7D87kDvs9wcNXHjZ28K+UlTcaoSWFrEqF2RczZIsactAR
kOHRfH6yoZeWdCu+2rJf1PE7uK5LQ19jhJbQ1vPTZEvxliltJwCRrIxu0IywIPAO
5xMWS6Wp0diivI1/MsPtVETrmYIJRzh/eCCK5hEgv+T3Gpkm8+n+NBV3sKGAZlBI
6jRhggMjO/AqskjEZzpPT5I2tZoCnOFT5SaeKfz5bXAygyWB6UE=
=INjt
-----END PGP SIGNATURE-----

--3lv7qylzds7dx5y5--
