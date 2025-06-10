Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC14AD30BF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A6710E272;
	Tue, 10 Jun 2025 08:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0Orzh36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E210E272
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 08:44:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so2965765e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749545054; x=1750149854; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ufg6uwyWwGQNdeZaC5T+n52EK93yzGWyzvZoh5XZFzA=;
 b=c0Orzh36R26D/2f7J8nHuVMLpkWvzeC++GjjM5hbNoevW89QQxsxVC3PwxPCMoSGy4
 r57C/4D606wxEn+fAnNOJajxGFvE3m4GjH4gqRiHR2wvixi09aBIu0M/h9SpvL+EcrJT
 7CuDHxadL9xwBJlP9ymwVWCMN6jPHZ38bOFxTfBp2Mz80BWbWm6PpAr1LiDNNFAcuv0W
 +PtveIm/M1EQL1wcFCwaOE9S/6yIRsG2IUYDR2mf6zsW4+by5ZaNtTiY9OwOXXTLTNXs
 oIVjtoVko0CXX0Io5lIo0u5o1SGQyUzUhrOruV80A9DZFrg21VsEltlBV4URjLH00yBz
 Yf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749545054; x=1750149854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufg6uwyWwGQNdeZaC5T+n52EK93yzGWyzvZoh5XZFzA=;
 b=IOPbvXt4MbmfdevhiuN9gMhSqzLND/la3i4JYwtXsbdKLNHRCzWwP9b5U3YUWCEyWt
 Xy6ivMWex2H6A01/uxoW+JDVzA68lPzUxaluFG5OkGcU8JlTaVSTQTWJ5tilIHNBZrg9
 DJBiQ30kcUHIU4C6+ICGwp1U9TWFh4Qz9exXiZ8YAqwPQGT/jaAi/P+tMfJ13qgOH5Ol
 NkLPMA05j3iUt4vNOb0rk96aE7SSquhrRJWuWLNsH0CPAfESXt5FFvAks3C7qly38dT0
 gA7yfivG7EioIlyZ4b8t6Lfk+KLspL0V0bbdHrRfTLZyZQ2p7tqXJIJlmoHFnHGKiC9z
 +zBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA8wLWW7rdwwSti+0/Onx2FQ1emRpMJd36O0/QFvf9NUocrtxiI5iyLsXRBrWmZE0vpkpcqrkxm20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaEiWkuWef9lBhCCxvaYx+m1jLqf1Y2x5Uk9lTuFWG00B5PeLW
 0B+8i3JKmaR++B4z5uWk7Dk9ZLz0mzKv9X8p84dr+1gb1m6jBxa44urP
X-Gm-Gg: ASbGncsN1euZTTewb151Ve9EvDUbor4ttWiGDgB8SpiuuvTnaOCMkSOrtoCHicwHSSx
 oMY3mkYkQyoZXugpEUU+TIh0BSPAJvRRfQzB2woXLU5d6nnz6fCo/DKzYUuKVm6DEI6OUA6IoDi
 GqvW7A61b0k/MccY1XrsTXQY4uyrvqmq0gEdj9FCoq+HZ3bQo4NdeSB+D8zn+4jNfKpjttmzUVz
 usYzGNBw5+yq+P70wFUA0eU4nLcHNBO/73QdSCtXXaeCtsWEueyDkl/JA2oNJ/+egyKrcPtGzfS
 Z8NHZOR54J4fZdBQoqjSpxIqvBL11e0ZKKSbTDKygq+sYUSXDaLtkUDfi9mtQjOtLOry3ZXnPip
 NY7mmnmwxuL8cyYffZbZg8mCeFlxYXOjiITBrxIdI/FkM4SwW
X-Google-Smtp-Source: AGHT+IEI6U/wlkyv60EtHKpGkOxvKNc8dBNCAlpQUDw7Gbe+DfsHFVL8q5OU8MIyrQVeRvXJaoxmiQ==
X-Received: by 2002:a05:6000:2082:b0:3a5:2cb5:6402 with SMTP id
 ffacd0b85a97d-3a55226815cmr1210790f8f.12.1749545054244; 
 Tue, 10 Jun 2025 01:44:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532452d7esm11567635f8f.85.2025.06.10.01.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:44:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:44:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
Message-ID: <fhumfjczxcohn5h5mnrdmz3x23ituxktzudtfutly35jkziiou@ocffx4vennrn>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
 <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4tgir5eftbmngfvg"
Content-Disposition: inline
In-Reply-To: <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
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


--4tgir5eftbmngfvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 12:26:07PM +0900, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
> > Add support for booting and using NVJPG on Tegra210 to the Host1x
> > and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.
>=20
> Hello Diogo -- I'm happy to see this driver!

So am I, nice work!

[...]
> > +	if (IS_ERR(nvjpg->regs))
> > +		return PTR_ERR(nvjpg->regs);
> > +
> > +	nvjpg->rst =3D devm_reset_control_get_exclusive_released(&pdev->dev, =
"nvjpg");
> > +	if (IS_ERR(nvjpg->rst)) {
> > +		err =3D PTR_ERR(nvjpg->rst);
> > +
> > +		if (err !=3D -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
> > +			dev_err(&pdev->dev, "failed to get reset control: %d\n",
> > +				err);
> > +			return err;
> > +		}
> > +
> > +		/*
> > +		 * At this point, the reset control is most likely being used
> > +		 * by the generic power domain implementation. With any luck
> > +		 * the power domain will have taken care of resetting the SOR
> > +		 * and we don't have to do anything.
> > +		 */
> > +		nvjpg->rst =3D NULL;
> > +	}
>=20
> I see you've taken this from sor.c, but I think it should be unnecessary.=
 I
> imagine the code in sor.c is overcomplicated as well, maybe because we us=
ed
> not to have the power domain implementation.

Agreed. SOR is also slightly older than NVJPG and used on Tegra124 where
we don't use power domains, so most of these quirks are for backwards-
compatibility. If we can avoid them for NVJPG, that'd be great.

Thierry

--4tgir5eftbmngfvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH8FcACgkQ3SOs138+
s6HO5xAAuFcTDTd//elXh91lR+ye68vqyuQs9ieD1JizLFCjtviETpAU/eRizVY3
nptiSkEPE3sVenbPIFwveqnkYiAGWAk6oOcixS3TG7GSEJg8iZKhT9firLCNNp7h
lJWHQVN4RLywgBHPeZx8vpupyZBWi7Qv8uiSu37b6EsOWiUacvI7nQgQGY19/Iwe
H/EnohUJL5mN79V4Y8P+8gwuy+8gJAl1iAa39oeFBR9xJFtxDMm582nWb5txhyY+
8smkQfRYdNmsyxJtzewPIoUTxSpycM7OjCv3idK6ezYQ1kaXtx55IVzgwlaKO4SP
oOW6U7Vzj40bufDjOyKCCIc1BUrnxsiQGBKdqJKTUVQSVC2xFiafHWIDD9w9mLYN
Cspt1zyGIM0rAF+RB+Az4FQwly21KVlyruZ5BnhES2LrZIEDcFWhbjvftqvSFV8r
EJDSZyVDyGg37Sgl3VkRWYdtt3Ao/tv/Lii0VBOS8v5wvkZ9xv9OXN1GSV4DGF18
G40Ixjy3362iiecmwA8DU+ExFQGx2JTPtMIf+Cqb6yP9qHGY6ZrN00ai1Gu8ti3U
EpMs7y7hRbuLP4TdZGnXMhGGUh1wjF/h3dLszxLUKunYkDRegAV6N2cpal7NwiVv
JBrwR/L8nJMVO5fkhMlybop1j0c6SwJaVY/7BAe3U97G9GyNlCg=
=tF10
-----END PGP SIGNATURE-----

--4tgir5eftbmngfvg--
