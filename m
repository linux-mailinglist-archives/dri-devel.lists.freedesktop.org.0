Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25CC5DB00
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427B10EA91;
	Fri, 14 Nov 2025 14:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDY9qlhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F8310EA91
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:52:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so15710765e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763131934; x=1763736734; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
 b=JDY9qlhQGWhSNtj6pesymIUB1J7HtuAyyU8zGKMYkKmjHBWqygOrpDteS/x6MIYAlH
 j3lyQTznIJKTU7nK5zkjGULdV8f2vF7RqltaqJlQxbB5yVqqikgHVhFykAFqvfG8SHXT
 aOk649Jw4rEaTmo+m5cQWESsN6t1hsEtMbsUtEEf0qOntTgvT0Oiw4RASVE+CkGeFdKT
 alW5ZAmQ4zJjqAemCo3chKGYaog2Q+esNmBoTt9kY81MXUXON4woFoMlwBOYDOVHlKNU
 F1/JaS7EDg01drVXVcB0X84GVS7AEN72HAW094bqw5lC6P23hDLEnnu94B5j/07qN413
 X03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763131934; x=1763736734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
 b=AtmEnIhsEKvkSv87aE6NPoBEy2ck2l0QytCjQSjj67LQmsZYypfxLc8f34EDwxndzl
 o1mStCoOLHxfcimuHREQHNYxN99vz2HS7qWfDSEUI0PMdo0YhCMt3jexBK2rnSza6O1Q
 DUkOF1DxKCuRJhdrdJv1HSdv008VypDctcX1ou2KwwdjYm7dsRIQAjzhpvfQq5GTwvw2
 U1tsnLUu3eQultjGJvylbaAL9Pz8mQiVHOs7+ze+bJdqR8koqyqfDULziJxJ6mZqbDIL
 /JtJ/CUT+TM/c1UDxhBCBR/0QLIUNJ7sy+IfBES8D8RpfDSZUvxj+pNgBK4LzzAgiAH3
 89/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUjbLsZYB3vFHHDvOfoijVDXWA02biBaeJiHadDwpo4PIzOOtIw5k+YrOySogKuJO234AR3DwJwj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2qi8YDC8JLYAbv0ClPOiZrl4JLfH/2jkodlZPsBG14zOOsJuH
 xaEv1ilA1LGmypohrdit5MQ3ce3G1yrCQ0FyztV3DA9lxvI+dl6ind09
X-Gm-Gg: ASbGncuWtyK+CkGagWQ6LwDYMAXQgn1p2ytS6XXQzqxGUmrZf0YsT40tnbZRnsD7d6e
 Cm64RTeta5eNBa4lE/1Sa75EwJ7KvDpI2escFbgIo3A2JlnO1u72q0B3CXgpMTWCicmSrctquBN
 26XflrLSNSWF/TC+t/CPghBX15+AwAK9xyLttIxvMaSzq8kxk7mAYDJHKgKmB5KNa1ySQe++jRG
 o2qPuA3Ji5GKwf9obo3STMndjmDoFl1Ye1ZwriycbRHoCL648gb/ezIIMXlkOangAXuhIRqjT/d
 yt84nlnhVWhCbFB/AGlUKGpMLFluSG2Ga/cWACYnSjdNSMBSrzvwPYz6xpaP/v+aWC4VK++P0fw
 D4m+s/E5ou6Gq0RVfhb27/T2utscZ2DQPrBCFqHj8Ubnijsz5bDgrCA9hozRXkbDxnqut7sAxvI
 1Kp5lXDOjozOl7WBOGPNnsVyZYT/Jcr6Kkvi+W5gGyyW9iZZF2ARa+iWUnXvA1C8Q=
X-Google-Smtp-Source: AGHT+IH6EdaXd2gX/Js68QxagND6wDOIWhXEebCdhFFsFPTeLjXVAI/EuqIEEN3kSXnIM4e9UFmSXg==
X-Received: by 2002:a05:600c:1387:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-4778feb2507mr33143185e9.36.1763131933899; 
 Fri, 14 Nov 2025 06:52:13 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7b14bsm9992753f8f.9.2025.11.14.06.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:52:12 -0800 (PST)
Date: Fri, 14 Nov 2025 15:52:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
Message-ID: <hk2rs7o4lsxh6uofaro4tsjbdandaq4txpsdx6ggx2zgtjpuxa@zdz66zl7as62>
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-14-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bwlwwn5ocbycp5js"
Content-Disposition: inline
In-Reply-To: <20251022142051.70400-14-clamor95@gmail.com>
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


--bwlwwn5ocbycp5js
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:20:41PM +0300, Svyatoslav Ryhel wrote:
> avdd-dsi-csi-supply belongs in CSI node, not VI.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This looks completely independent from the rest, so I've applied this.

Thanks,
Thierry

--bwlwwn5ocbycp5js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQhoACgkQ3SOs138+
s6GyTxAAlZCHN0/OeOSiVj5R+zlyhttYKy2tPfEzQFAFYVDR7MVrwxLczkHyQzR8
YJdAuuU48wLJ5R/PTldehaf8j+inFtyg5r2WZr1rzfK5Wgj1Ont+RDwb1ohoTLto
6bSXG8Tr8AXEyaL6fycm5fcxWo1GemuiV6oxpaiUtS+I/HUbcJPhe1RuNwYpsubF
P9KGdbbv8XMeaem7fM8j0VLUwObdN1mQBTvI1Wh2Krf7CpevtMRVZf/TCB3d8aI5
HGBTW+TiCBIyGfBTnzV4OjZaKrcVvgzE2lHPkAbu/ZBZNz0dFGkSs3xduMhtg/kg
uPxJz0CQBAkTybL2Sa4k8NapAYg+bhyUj7clt0rqcA79W4BABHdF4ihlVvkrPzJz
p9UQCNPvsh+EnayF5E1AYEWDfnIswAYmUoTqGmZmWz9HLE1pn/TUrPVEXfilfccK
ehav4axp746hfEhvfPg/PXOcJQxIhRbJ6goACP4XB0Jvz/67JUKPS7vybcYa2Ggd
NvBgBnkhHSdbAvENYMdosj1lt4DWUTm2boVCA2GY44NauAI70vJO1bQSfNACQbpK
p/Hk7iF9V7yoDcPeJWh0flowHetdtjJylnQVV53S2V37goFuwovw7b13bsvInLHw
pYq7VeF3eirNU4QbWOCiLFoJ9vftiP4vTbtWR1PbVb3WSbyIEsY=
=vU35
-----END PGP SIGNATURE-----

--bwlwwn5ocbycp5js--
