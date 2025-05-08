Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A54AAF66C
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DD410E371;
	Thu,  8 May 2025 09:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LqLYdqOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AF210E371
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 09:12:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5fbf534f8dbso1048742a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746695577; x=1747300377; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9dp1vstYqz3mDBq4CkJf4LU45gaqxJrhVS+uXqNfvYk=;
 b=LqLYdqOhdQEjRGAIG0IorIUExRj5bBbPZ67ReRViMBgTwHwQOf6G5H7akeVYPg/Pml
 oQv6l4omFZ9OFX5t1JcmOm/joPDkh7V9dtyX9yj54sR2qXsdEo6+09HCDmfANrQzuUIE
 p6bpXFtCClfrP42IScp0imoT8DIKQvKyzusqmvpgSSLWABweOfxwHKEgyt20Njwm0jIZ
 /d4BlAD60FZ5Rjf9cpbJ5UFG7lELmkQ52JEguzGnN5T5mu74gBfJLJEWKAcaRdOps6FV
 MXoJnLQdWaLJCqQENfLWfCZJ0UV4y9DIL/D2LcY1n7h4qEqbZHyNN8br7MiYbmOcdII3
 5f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746695577; x=1747300377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dp1vstYqz3mDBq4CkJf4LU45gaqxJrhVS+uXqNfvYk=;
 b=DK69U5F1zcQ+1Y/EK1aq3STaVO1IwX7+z3ynDm1TbGgGGxuUamK2wdLto38BOCztV9
 Anesg0nfmWAXNf6wlLUV6fOlM1yuoUbfO5su9PIbcmlmjVV1HPSrFugU1E5LqQBMZEIv
 xMzwAtPMUuN1legOMnOyz+6uXU/dUOw9mPnQ/TKLSuIIjPMRMLN2qulFZUzKbYtYs6h+
 tESBviJY+jdba0TKtdYsULA1r+hSC6fmbBpJUixNzU08AUNfWw2NhUzrG92Vil8kloXA
 Ii3k/ayXw/jrd4+jKFJXQVJyAncbKKyIweB3BFqqzBl9xhwvdqwBJzSkvGJF5xaEEYRM
 zGjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA24QU1akovcIDmAWnN3ydw/6OWolY7wKzHgVh/3sjj0JWWsOjvVZM9lbatY2frP0SQPW5RG/+BrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9QSQtypB+AKKLsQPiacbHAi9LPGFODTiLTEHzEgi3k4v3m6Yc
 5OtrDmUrn1KrInykZm5FktODWy0cort/my9KA7Mp1BhPTqE7KOqM
X-Gm-Gg: ASbGnctg/BDaJQJ7c3/EDan6BwOQnqeYXK3ox84X5ox0fwo/nEzDSJ3VAFMuGqdKYvJ
 AWDa4JsL3Jg+K2Ydjx1PyoQd/lt/5m6zRnDvltmAeiziL3eYAbZJqiIAlfftmjFgcwKB4z5SOR3
 z8ybkKCpWpReXMNZULOp9t2G5N49kKnGubC33GgzfDANHWv0hHKm9SC1S5QrpdNw0VcLdJaVGLE
 W67avZFLMsk4DVIPXAeWeWhLjEsPuBdqG1AIAPXo758pTUAEvkULtq59+NCiQiqrzJxgxEJnW8E
 ErdG9m6sdnpROkOsWZDHG97ic9Wiqw1sz2Yiu3ZLMYGSoN23BAnDUdLhwgRz5NTs9KyDEtBFAXX
 CEdJwNmFegQc4kzYRP0u6tnz2Y/0=
X-Google-Smtp-Source: AGHT+IGKlsVS9Aggzopar0EguhK232leccJ6N51EzyZlx36/ZSXJN9uVC7qPM4dsor1ubnH6vieEUw==
X-Received: by 2002:a05:6402:2809:b0:5fc:348a:e21 with SMTP id
 4fb4d7f45d1cf-5fc348a34a1mr2057037a12.31.1746695577114; 
 Thu, 08 May 2025 02:12:57 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fbb4ceb417sm3893637a12.60.2025.05.08.02.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:12:55 -0700 (PDT)
Date: Thu, 8 May 2025 11:12:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Terje Bergstrom <tbergstrom@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 "biju.das.au" <biju.das.au@gmail.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <lqbli5eryxnl52bvncg543zkqqbteheixhcb4nmxljx6nozhay@nli5n47oelft>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
 <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
 <TY3PR01MB11346CB37650B2F888CFC6DE48688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="72qnzxkycxla5eor"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346CB37650B2F888CFC6DE48688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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


--72qnzxkycxla5eor
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, May 07, 2025 at 04:10:07PM +0000, Biju Das wrote:
> Hi Thierry,
>=20
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Sent: 07 May 2025 17:00
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
> >=20
> > On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> > > The of_get_child_by_name() increments the refcount in
> > > tegra_dc_rgb_probe, but the driver does not decrement the refcount
> > > during unbind. Fix the unbound reference count using devm_add_action_=
or_reset() helper.
> > >
> > > Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > > index 1e8ec50b759e..2065157daab3 100644
> > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs teg=
ra_rgb_encoder_helper_funcs =3D {
> > >  	.atomic_check =3D tegra_rgb_encoder_atomic_check,  };
> > >
> > > +static void tegra_dc_of_node_put(void *data) {
> > > +	of_node_put(data);
> > > +}
> > > +
> > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > >  	struct device_node *np;
> > > @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
> > >  	int err;
> > >
> > >  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > -	if (!np || !of_device_is_available(np))
> > > +	if (!np)
> > > +		return -ENODEV;
> > > +
> > > +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put,
> > > +dc->dev);
> >=20
> > Actually, I think this needs to be:
> >=20
> >   err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);
> >=20
> > otherwise tegra_dc_of_node_put() would attempt to call of_node_put() on
> > dc->dev, which won't work, or rather cause corruption of some sort.
> >=20
> > Shout if you disagree.
>=20
> I agree, is it something you can do while applying or you want me to send=
 v2?
> Please let me know.

It's already done, thanks for confirming and for the patch.

Thierry

--72qnzxkycxla5eor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcdZYACgkQ3SOs138+
s6EIghAAnYd6socF/Wj9gjVWp0eaVoJqHClj8WN/mrPAskJ39aZVMYsTi+Vt7DmK
Kz6RHFBCvGL465K9DenItSWa7+wSqz7SrxLAT4pc5PpHRs1AlSeY9aeBhCMMQ/Sd
ivx+3ycn1MjeYyRxmRfUzNFtv4q8K9A9AAyuhg5fI/lLZuMBwnV43d6/iYygNW7C
VQ6Jl/LV7gphu4pxvPJwnyOyfOS9P7vsC9a0lssMxWMJ39oJH/WuvgX+CpYsyDLU
+BhyfQcfjD4GG5fHTcQia5IUutt3MnGYPpsRL9A6ZmxGGkHjCU9T1l8G1kADAoCz
xeDg0QEs0ycWCKCU7XeaOc6AlQYyJg7wZQmRa1+yqQ8a9WkrlXd+K/gTu5nlJ2yG
JCEIkPRCjfKKsGDP+nmH9zOsVWgGeRHSpN0i75aF5a0n4PMV3NvRRRLjBMwONnX2
E1iBcnmXuoOL+sr+vDPS00eUqI/F0Yzl7CUmIiotK1tg+58A075aYZn1WXOePIq+
+2WTTWm/QOe9iFQxW0mjNXP0DlBM7AWHqgLD4xMfChJGMBnjbMHGoCCdXJlZTgeR
VSW/SWviIpAriG2wrUEukq6khinVZRmLHVfo6cTTAnk6RvRrPTGrr3vOy1Kt1y/f
IG/+dLxsyPVHT9Ju9LFx2mssmO/Ky5lGUe6hN5mnGSObk8+WvY0=
=1Kba
-----END PGP SIGNATURE-----

--72qnzxkycxla5eor--
