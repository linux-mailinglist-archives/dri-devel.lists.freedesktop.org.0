Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7DC5DB25
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6A310E03E;
	Fri, 14 Nov 2025 14:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqB4GPvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A074710E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:56:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4775638d819so12281495e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763132179; x=1763736979; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
 b=UqB4GPvrqf35Y+MgFZJklQ9QEaIqrZ/LrbbdZc0Ju/ThDUP025l+lt3rmed4xgUz/F
 VTjMeLjPIWJ+6E+NVmMY1h1CF95PMWwO494ZBbwTOwjoZMNuiu9wDMCbdnuhwdUi8Vt6
 ZEDtx2pSmi+0HjS7lbCFDc4GoNogYuhTgPdWjfCODmKyIlAka4HlPCrgCkCik4/jYwZ8
 nbHz+JD5v1pzCLiAr6OiSen4ez6lVT7PL+zAp6A249G6alevo0Z/+xig7EeFycvO+DzM
 cTEf0VmBkSwC2n7SWEfK8CeypXZQ6fmqJC+yF+5Ke0ZhKsrcAbyod1ogFWf6LDdkhLT4
 Q7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763132179; x=1763736979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
 b=YNEl/1NprbAnI//HbPY4RQjYQqHPLZp9Skfv9jEO6GNH6s0eAZIOuCEg6JbPbkC2WN
 cWw9Mvw3L+yogQUSdT4PNTuHhsYIkdCCq9tdKaki/dltj56uoDm17+sBV8WV4icIUSa4
 /r+RNYvPpeSJCsYSvxgR8X15SFXbPeOsudsGdNAtE8nUqNG5IfMuRsZJFNbR3Bw87UiS
 /Okar1QUs5OZl2947Ib+ZDGoIN0tnwJmnzP1vsWPChRKSZs/ItnMPJK3diJYlnLDgoJ0
 iGTX7+oLjCZHbeu5vPKrX4x/1Ycl8TZDXTZSpii8+p6988tyXsqiAdtvqwq3vAZD1UvZ
 X6IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOyX2CgZTWEvE+ZvVNdWp9lHc86dde9K5ACIflKqkqf8F5kSfNnzB+YLUnNPMoOo/HOeqee8O68Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytXpEaLM+cSp7KiQp+K0sgk6E9ElJLcbBBm2SLsW7HmGgA7TYh
 WyZRQIATxFr+kCwcV7x+eGKVSGrRxpERxfzWY1a5vLMvMccDjYtzhkAk
X-Gm-Gg: ASbGncuxYjswydleUqEjcp5xIrVRTRkqsAB5KXKHrHIDVscdkbHmK9F2FvMvIcJVI6g
 PTAM82Ac7qRkG5ftMrLwFdsB0IoxHUXSdlBNR+3L7rQW544FBKHBZCCQPXMvCvVF7slOqPg7Nmt
 Yh7V/51GEnSwzgo7skBE4DVWINVrRyIrV80lXSSdTDAfTOvFe9ZUfBRT91sfo6O1qfpqBKkiy8Z
 AtNt14qV7Fo15AdXgRtHRdqAq7QQKrj7HtZapmfuhtrNsJFU77wqNtxTp3v8dxHQhdQNWELZB1/
 iAr4RgZc58nuNbCBspAO9oTmCt4qqiFfuKxAkigu/Xw+T/TuEqa/C9aTNSUKaWMwl064SrGTZmQ
 aKL0BnKfXXmc4Nd4os/Tx9gxA2iPTAVDh7JQjNf8JEcIbRkxtLXUFX8ZQkBzVc/A90V2pntWAoB
 WsmvccqIAXLViq3gGeJ7iYZaE/cXMO9A9BQv5LtpQ0vzgKc/Jf72DYLhQTQtqCWUE=
X-Google-Smtp-Source: AGHT+IHH+QDPwizZAqaXOkEIZoWon24hqYUWks1VOVo0gf4ap+2tE/j3QWY4er5Dp7X0/B6XnzFATw==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-4778fe5ff23mr34390975e9.1.1763132178710; 
 Fri, 14 Nov 2025 06:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2b835sm148886025e9.2.2025.11.14.06.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:56:17 -0800 (PST)
Date: Fri, 14 Nov 2025 15:56:15 +0100
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
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <cd467v5xu6aaxtllfc5awt6sen6jw3u4vdr35ue3x6e5cao6vz@4kjeiwo63tce>
References: <20251022144930.73272-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tqyqdls54xm3etue"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
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


--tqyqdls54xm3etue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:28PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>=20
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-csi.yaml

Applied, thanks.

Thierry

--tqyqdls54xm3etue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQw8ACgkQ3SOs138+
s6Fc0w//YzvvfrnY2oE+gg920G2CSw3rl1e0FAgNvins2Qt8x1QUys+Tr3GyLm3k
k2TYECD1jsXh6dGN5XWZUxY8m0G+pzXgFqZ8jnLRstWRC0I3Vn+nGsbXBUMpbp0F
ogRuV3DGK+9Z3eDBahsQulOIQtRMvM9fMO3csuzI/ql+XCVzwjFzD1yjWkwsgl55
spLXD/YnC2YRd6rB0CbTxKb4CZX7xJm6eFZ0JWAgWdUDemIKLQXEmFIK5ZoqCK/q
PYn9uuFLeebTTLQF5dCuvSGSjoQY+SrVHBPDRDUqFL5m2PQPIWdVIgWPTrQ5vllZ
AkED1KPfot8yoPt0lP97nynkWFaC6jp0aSSKGhNiv3gwunwF1Tzf4KMlwtn/NZhl
jGrwt2CkVE6i0pW2lf6xneM6Kg206eSuCA5Shla69u74LGB0f4+sCfdNfDxg0y4v
24rrOPlNcFrJduCiGW+wgszu3XiR1Uy/l/UlSV505O44uHTRck16zup+hA6mz9Xv
s12707JMhxwtvqNUlvHc5pyu6KU7dgOzG4X3ezHKd/o3Zuxun8ZOtqUsWvhlRrrd
XkLbkt11kNxmCuVgBPxIwLTXSgIDZZxDN641pvWfFUx/sV5QZ8RgObK79ne4d/yC
BvXV19RCcd0c/aYfIaOn92k74QkOzOgFR2h9HOzDlaxTHEY/hFo=
=ETS8
-----END PGP SIGNATURE-----

--tqyqdls54xm3etue--
