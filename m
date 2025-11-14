Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B1C5DB40
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0F210EA9E;
	Fri, 14 Nov 2025 14:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ABNEqiUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4206D10EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:57:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso1730551f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763132278; x=1763737078; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JGnRuedlsHd0fcZwXKJjRRdg6CbePYJalR5bL55auvo=;
 b=ABNEqiULeV5k9CupKR1ZscJCj3ntccv+w+4DUf47+zOIGVfO09obX0No2V1P6egfo7
 vc3y+GpR1yaogCFuaiGC3m5zlNcYVKac9tOsuSScpJcYxA5LkPMr6A3iHlunk+Nkmsmx
 aysWtxDhJN5rbwGdNFSt/x/AXaKFojKik3jM7CjdKjVxdghCN9b51mWOy/4lca8tfylR
 J1WtPHe3QEym7l4HjooMxkXMY+0MUaPlkld2VYY4JLfJxV3OG3zSbmse8ftmtdWJlu06
 4QISQDv5bMwH1hT7eWAw24cXMbaguc5TtQonjDQQx9lVh3ZiZRKm182LWrH6YiKVpFLY
 glHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763132278; x=1763737078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGnRuedlsHd0fcZwXKJjRRdg6CbePYJalR5bL55auvo=;
 b=IRRU3Mq1/SnfqfYrOCozmYyIT/1nLobKB75EJ4WCW9MpRS+zGwLW7nG5f1Annv9Y+z
 JZe6xxtaVY/oDE2fx6NxGgleEapnEBMNfl5uFGlPp3CLEtDPw1UYHoN4GEhs9qvGthti
 ZF4yeG2nA9nhqfopiyN0LW9PNMWi4cKzgziXDUdq8uzXghUnXKKYKRix9T51xYKTGKOv
 E4xY22tX2ROsQ8FtE+goYianyuuz/grQ7+23w6YXTp7IHrEGgnkcBEX7prFl2YseheMw
 NowK2VPeuXDnV/Sg9J42Ofqbi3CTATzv9fj/fDAaq00Bm/qb4p5VpdWu9aJ3uVNN7VaB
 vD+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvzD2qVlgR6ZhnNLw6SEQkqsS65VNxJzfw8d1ZsGc2F4EsuUrZPsb5zh/G/uzW9hCOypie0FbdVDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/AfglHCndEHzlUZ8KArMM8g/hAIamXwqyqo/BtsBCKwoCSAYd
 IBSOVesaKtOIHeQI8pOxHuBGxbh1PySQT1TjLRo/SHxvk20qjwGaJ6xm
X-Gm-Gg: ASbGncsoeJ0bjoHKS2qdaw/unwCsepeIEVVn0UoE8bofuZVV2lwrmNcSKauJLNBYVOM
 dq9OQEVaApc36RMjAdUvT6rK+sm7ZY05MwKb2JBLiVXlEXsV4fCnmfgoUEGqr7DwkAKVEg5Jg3p
 uasLMosiTmcTNMM9gOSYvJgEpFL6l2V6m/7tzShFHDdcR1dYk4TZCUUkAP3/IxCaYPBAZel8JOo
 7TZtWXDaRDPiuCwcd+fJvOnuKVzYRdM8xo3kU0o5lSwqBuaO5UWPUlrx9bfNShXkKJxIEaRglst
 zxigV8WLp+JhzfmTydNrEqF4z+9F4HzW9OkLmYrz4stt86qvuZuSzArNrntgstmf7Xhh8O51Q3p
 HnBqCtJlM0r/q1CE/ymes5p64L2u7U4+gRAZUCNpPcH8/1KEnur7Jxawl0LwIEtRDk3NBRlhA2N
 x2TWZ58Gs+mYPqB5sH0F2oSoXaceC6aHCyGUUO5wTdc0gVTMfL70GJOcMN6pW9lEgYWNd++TYTF
 w==
X-Google-Smtp-Source: AGHT+IGR+CaGRepCgY9abJOUDZMtJSLpLAxIBXYfl3hSOsk7LXj9GzOPlhHY0Won/RR6QmkpGOV9IA==
X-Received: by 2002:a05:6000:615:b0:42b:41a6:a670 with SMTP id
 ffacd0b85a97d-42b59394029mr3665245f8f.54.1763132277621; 
 Fri, 14 Nov 2025 06:57:57 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f174afsm10192785f8f.33.2025.11.14.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:57:56 -0800 (PST)
Date: Fri, 14 Nov 2025 15:57:54 +0100
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
Subject: Re: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Message-ID: <6ec4sw2c5rs2s4akd55vacveloiyc7ehbhouz2mqs2gy2w7v5d@rqxzhxcgm2ns>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xekcx7ux3cabz2pl"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-2-clamor95@gmail.com>
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


--xekcx7ux3cabz2pl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and
 Tegra30
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:29PM +0300, Svyatoslav Ryhel wrote:
> Add CSI node to Tegra20 and Tegra30 device trees.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
>  2 files changed, 40 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--xekcx7ux3cabz2pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQ3EACgkQ3SOs138+
s6H5FQ/7BNrS2X7EchthFaqJs0Itrm1KN9MujAl7hYVvTbvyozWCOEjKbFN4QX/R
1+8mcxFJxc5TtgvW16xQ+mePTyN2N7jxL1TxRT7XCZL5Tp14zhdK9zDoQK/1408r
0dw0xy7PAzn9uj8EYX/dfrKT9rsGy0Nc97UyGoBE0/oTU/XHYAoPev2JyFSCqaHn
sD4JvD6tliCPcRZkdum6WkajMFarxmgx72sJ5jLhOzzsT7/vcJyb12gVN94OtK6b
6kASWMvl+1YQPbxWk/iSSBYUwlvoG794KpTPyhEzezvigRJkLO3jSSCzCplJ+K9i
IVfmJlnaaOONvQZVULWL4Bn4OplAnDBaqi8AUwGa5QjlgEEc81FczmuU4KAj+5Zx
mIhy2Bd5hMjqvSyKFXiDd+4QlRzNHsC3dacBktMu4EH+KC3DVKMTQ3/+7yyXqcc3
ne4wp7IJVQ9oEsPxr1e0GKPkDEd4iz10UaDCHZKFvDzEwrOkkN7vzUF4tndq1/Av
+fz4pjf3DCJ7NMc1fs/kBabrbTmHbTqAkIot26EKaLfrogrGlGm/smu32t7CrzWq
dY17/9eNoHdrPC7o/kncXM3oxYGrh2Bw1OFtF9RL5mLCxSTLOKAkqZZv5zHTLEAg
MYnh3JVBfN/JUn8Y5x9LTYlIvap2zYy3Rss6uFmNUcMWhjBqhsw=
=/CC6
-----END PGP SIGNATURE-----

--xekcx7ux3cabz2pl--
