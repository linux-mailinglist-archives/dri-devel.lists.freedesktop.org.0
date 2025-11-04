Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D2C30308
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642310E256;
	Tue,  4 Nov 2025 09:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NjDfmc1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890910E256
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:14:05 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso68263975e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762247644; x=1762852444; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pHpJf3YpGpHL64afQKbWAVrsw8giWZr/mzkQU6vPIk0=;
 b=NjDfmc1g7mQkaI7SHumpPAS32S+Kt/WE6dfQju/fnJMaD1wMCkImmII3t7YvHsh+cQ
 pmOT7g+hrah8mH7ccEvTRylEmhJkWSFMLB53TZ1UdILYtdwOQ9akno+rFjR01oYabldt
 zIsV18QDmTtziZH+z1pH5k+ib6ichfvcnrNHwCGL61X3h6esSbbVcjoWSc+NHIbtwc2V
 L7U1SWyJzwCwSrkfd3/a6vOnHW5I3kuvXTXQwkFDvjb2F75KTroNqSLwSJjO/F17z4uj
 FNzITFI145+GvWfx4fkdhrxgm0eC2UJ1TJ2pyZGBd2pr/5ePlImRZtOxRIgHCX77jW/U
 scTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762247644; x=1762852444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHpJf3YpGpHL64afQKbWAVrsw8giWZr/mzkQU6vPIk0=;
 b=FNgW/eedHBHnOFu2EWRyT9DWmOQo2I84A5m9Pm0Vs9giNY5DEhL8DQW7tgxerm2P+A
 ddGGXdqJXlwTOBvp15gsBRD/sWCeAkkGF2ZEskZFoQrSE08Zz6WCv+981N6hQTCvsZwb
 wvEXr0T1GHKiFjZNVHNbbFaXkhCNJY7wrLDzaW62F/FUtYwZJdt1jJb/3a1Qva8hIpq1
 8Zd2mn616r4d3PvRGdLKrOH3fJ+IJHJy3RJ7LoausceZEQWa9ngSNL/1ALhRhqlfHPQH
 AJU4eVWJsobmQ8+Ex94CIke8n0yVgv1lpqpX4kHXf2FY8QGm29zd63RAW4HGaxVQeKdE
 aoJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyBDpCMxwLQaHivCxEERAScJZb/UL4QrDmf4pjK0ac+ebnQTjd/rk/erRhqtT6dE31V1CRKxQqQgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3rHoE91Z6CI7HTl3B2ckicTkIzPBwxtQZDS/ISqaWOcph2nTF
 rAEEj+WJGqit8Rg8dg98M707xZ6eNhq9vMmIOW9wfqsSS4oyE8Xgqgmi
X-Gm-Gg: ASbGnct58db3x2SlIelu5ZuBgI1oRwPQaMsLfOwcL3cnpo/d753isJHdqIUoSQAM9Ur
 ATU/FTv9k1qxbgoOh2wkh1BvdqyEZsuBh8A5q2rjUMweHFkQpk1MEdL94vE42nEWwmnr5joehKe
 K+DB8TxT38jITEIbFpXGnvB6r1ulq7zebYLvj72CnbotggN+u8WxnpGtsKRkLd4eDrs8YZWYzyk
 S/yaShusmGSjUiSe5mZH0Q/pkwtPTMVgagfna8yX8JM00ZvPdF47e2sPaTU4C5YXfeqioMklBr6
 AONdkZu+PfB3CwGDUnDo1aMtsqJAkZmp0W4KHsnvL1QIc0P1SFqouS9M+Q55PgkNX/PSye6OV7U
 vjpxNh/aga1Y3Xpb+1OIbTUp83Q6Qt9kBUCCCvIlezws6lZi5+jK9QeHjv+e9nBkZFlwkMuL1Nq
 ePf6Ljjh5SQMsnRwf6GUQo51PkIU6F1JVDFLPvzG55yfKJhy8b9htn9otEbXRChGU=
X-Google-Smtp-Source: AGHT+IG8094rz/tIaPzHwYJZtt7A28OHv5lwMGE79saNMkPw8NLncRM6ZozuWAx3nCcLz6FMe+/v9w==
X-Received: by 2002:a05:600c:6212:b0:46e:432f:32ab with SMTP id
 5b1f17b1804b1-477308a2638mr142682405e9.33.1762247643739; 
 Tue, 04 Nov 2025 01:14:03 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm13607645e9.2.2025.11.04.01.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 01:14:02 -0800 (PST)
Date: Tue, 4 Nov 2025 10:14:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tilmmd6na7i5rkks"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
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


--tilmmd6na7i5rkks
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrot=
e:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Without the cmu, nvdisplay will display colors that are notably darker
> > > than intended. The vendor bootloader and the downstream display driver
> > > enable the cmu and sets a sRGB table. Loading that table here results=
 in
> > > the intended colors.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > >  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++=
++++++++++
> > >  2 files changed, 219 insertions(+)
> >
> > What does "darker than intended" mean? Who defines the intention? How do
> > we know what the intention is? What this patch ultimately seems to be
> > doing is define sRGB to be the default colorspace. Is that always the
> > right default choice? What if people want to specify a different
> > colorspace?
>=20
> I reported this issue almost a month ago. See kernel lore [0] and
> freedesktop issue [1]. The pictures in the latter show what nvdisplay
> looks like right now. It's nigh unusably dark. When booted into
> Android with a tv launcher that has a black background, as is default
> for LineageOS, it is really hard to read anything. Is it correct as a
> default? Well, cboot hardcodes this, so... presumably? It would be
> more ideal to expose this and csc to userspace, but I'm not sure if
> drm has a standardized interface for that or if tegra would have to
> make something vendor specific. I think that would be a separate
> change concept compared to setting this default, though.

The reason I'm asking is because I don't recall ever seeing "broken"
colors like you do. So I suspect that this may also be related to what
display is connected, or the mode that we're setting. It could perhaps
also be related to what infoframes we're sending and how these are
supported/interpreted by the attached display.

All of that is to say that maybe this looks broken on the particular
setup that you have but may works fine on other setups. Changing the
default may fix your setup and break others.

Thierry

--tilmmd6na7i5rkks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkJw9UACgkQ3SOs138+
s6EMmRAAglAOI/iYg/7zZ5w3SflGxiqrOunGokK9cFTVNpvc9STnAdZW9h/T/8Lj
qcMh44GgzLS4tifB+uMp5P6QCCQrckjqeWF6krgR+1oJqBTF6JCwk36sVHJ0rwGv
4Fk+KXEvxacQj6NcSGD1f4gYlVfT1oNYW7tIUsS8NvWW4beXZlYKsDZsQnCZgTEE
Rwoz/jKiGnP8vrPT9ODZM9ds4tvS47ml9psh173DT6RvoC1Ur/mp0Looh6ugZZc8
bs9oo9rLI73ZUfU2BMy/qJgihBk/jPn4Ms1cXCu2CVciv4SYJkKboS4t7CREw/OG
p4qwK12rXlIc8eXr8KzsVHuLS9YdtfNyK6fmK3IJ/pjtEprkD0/atFOl2xpOdu4C
TbRQ7gn0O3STa03bsTp++zeOgryGOYayZMGi2vnl6qskbz8hG03SrEqqvPtVgoYQ
z3YsySjMpo4wk1eW9BL/9yehZXBRnhQN/xzLEXKe9f8oM9eafnXt9phKgAVNhcsK
e5KQZdP65PJLJ7uWSUX/yGU+473th48dbmFDK2rhfUgdvA4BrZ8MQ1XqxlYWNIkE
iVific+hwXOMGLOnC74VIgh6vZqHSAk99D1MMvzzWnEQ+L5njnqVqq4+in0lhKAN
g9+gsXqCPPnPnE+8R6e0CSif9fqfZafL+Vtoywt6m+CVyxSHyrs=
=rr3C
-----END PGP SIGNATURE-----

--tilmmd6na7i5rkks--
